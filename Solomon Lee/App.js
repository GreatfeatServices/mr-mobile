import React, { Component } from 'react';
import Splash from './Splash';
import Flatlist from './Flatlist';
import FlatlistDetails from './FlatlistDetails';
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
  Navigator
}
  from 'react-native';

const Navigation = StackNavigator({
  Home: {
    navigationOptions: {
      header: null
    },
    screen: Splash   
  },
  Main: {
    navigationOptions: {
      header: null
    },
    screen: Flatlist
  },
  Details: {
    screen: FlatlistDetails,
    navigationOptions: {
      title: 'Flatlist Details'
    },
  }
})
export default Navigation;

