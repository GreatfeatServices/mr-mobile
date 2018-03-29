'use strict';

var React = require('react-native');

var {
    StyleSheet,
} = React;

module.exports = StyleSheet.create({

    splashScreen: {
        backgroundColor: '#34495e',
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    title: {
        fontSize: 90,
        fontWeight: '300',
        color: '#fff'
    },
    subtitle: {
        color: 'gray',
        fontWeight: '200',
        paddingBottom: 20
    },
    titleWrapper: {
        flex: 1,
        justifyContent: 'center'
    },
    loader: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    separator: {
        height: 1,
        width: '100%',
        backgroundColor: '#c4c4c4'
    },
    itemWrapper: {
        flex: 1,
        flexDirection: 'row',
        marginBottom: 3
    },
    avatar: {
        width: 60,
        height: 60,
        margin: 5,
        borderRadius: 100,
        borderWidth: 5,
        borderColor: 'transparent',
        alignItems: 'center'
    },
    flatlistContainer: {
        flex: 1,
        justifyContent: 'center'
    },
    author: {
        fontSize: 20,
        color: '#353535',
        fontWeight: 'bold',
        marginBottom: 2
    },
    header: {
        fontSize: 16,
        color: 'gray'
    },
    flatDetailsPhoto: {
        width: '100%',
        height: 210,
        borderWidth: 1,
        borderColor: '#c4c4c4',
        alignItems: 'center',
        marginTop: 10,
        marginBottom: 10
    },
    flatDetailsTitle: {
        fontSize: 30,
        fontWeight: 'bold',
        color: '#353535',
        margin: 5
    },
    flatDetailsDate: {
        marginTop: 3,
        color: '#777',
        marginLeft: 5
    },
    flatDetailsAuthor: {
        fontSize: 20,
        color: '#353535',
        marginLeft: 5
    },
    flatDetailsDescription: {
        justifyContent: 'center',
        marginRight: 5,
        marginLeft: 5
    },
    icon: {
        alignItems: 'center',
        fontSize: 30,
        color: '#999',
        paddingTop: 20
    },

});