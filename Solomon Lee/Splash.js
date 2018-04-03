import React, { Component } from 'react';
import { StackNavigator } from 'react-navigation';
import {
  Text,
  View,
}
  from 'react-native';

  var s = require('./Style');

export default class Splash extends Component {

    componentWillMount(){
        setTimeout(() => {
            this.props.navigation.navigate('Main');
        }, 2000)
    }
    
    render() {
        return ( 
            <View style ={s.splashScreen}>
                <View style = {s.titleWrapper}>
                    <Text style = {s.title}>GreatFeat</Text>
                </View>
                <View>
                <Text style = {s.subtitle}>Created by Solomon Lee</Text>
                </View>
            </View>
        );
    }
}