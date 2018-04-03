import React, { Component } from 'react';
import Flatlist from './Flatlist';
import { StackNavigator } from 'react-navigation';
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
}
    from 'react-native';

var s = require('./Style');

export default class FlatlistDetails extends Component {
    
    render() {
        const { params } = this.props.navigation.state;
        var dateFormatted = params.item.publishedAt.substr(0, 10);
        return (
            <View>
                <Text style={s.flatDetailsTitle}>{params.item.title}</Text>
                <Text style={s.flatDetailsAuthor}>
                    Author: {params.item.author}
                </Text>
                <Text style={s.flatDetailsDate}>
                    {dateFormatted}
                </Text>
                <Image style={s.flatDetailsPhoto}
                    source={{ uri: params.item.urlToImage }}
                />
                <Text style={s.flatDetailsDescription}>
                    {params.item.description}
                </Text>
            </View>
        );
    }

}