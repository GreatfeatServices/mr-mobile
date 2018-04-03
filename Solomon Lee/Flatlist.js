import React, { Component } from 'react';
import { StackNavigator } from 'react-navigation';
import { Entypo } from '@expo/vector-icons';
import {
    StyleSheet,
    Text,
    View,
    FlatList,
    Image,
    ActivityIndicator,
    TouchableOpacity,
    ToastAndroid,
    Navigator,
    Linking
}
    from 'react-native';

var s = require('./Style');

export default class Flatlist extends Component {

    constructor() {
        super()
        this.state = {
            dataSource: [],
            isLoading: true
        }
    }
    renderItem = ({ item }) => {
        return (
            <TouchableOpacity style={s.itemWrapper}
                onPress={() => this.props.navigation.navigate('Details', { item })}>
                <Image style={s.avatar}
                    source={{ uri: item.urlToImage }} />
                <View style={s.flatlistContainer}>
                    <Text style={s.author}>
                        {item.author}
                    </Text>
                    <Text style={s.header}>
                        {item.title}
                    </Text>
                </View>
                <Entypo style= {s.icon} name="chevron-right"/>
            </TouchableOpacity>
        )
    }

    componentDidMount() {
        const url = 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cd96f716d9764121b7e366a40d6f1c48'
        fetch(url)
            .then((response) => response.json())
            .then((responseJson) => {
                this.setState({
                    dataSource: responseJson.articles,
                    isLoading: false
                })
            })
            .catch((error) => {
                console.log(error)
            })
    }

    renderSeparator = () => {
        return (
            <View style={s.separator}></View>
        )
    }

    render() {
        return (
            this.state.isLoading
                ?
                <View style={s.loader}>
                    <ActivityIndicator size="large" color="#34495e" animating />
                </View>

                :
                <View>
                    <FlatList
                        data={this.state.dataSource}
                        renderItem={this.renderItem}
                        keyExtractor={(item, index) => index}
                        ItemSeparatorComponent={this.renderSeparator}
                    />
                </View>
        );
    }

}