module.exports =

  cakes: new IDBStore
    storeName: 'cakes'
    dbVersion: 1
    keyPath: 'id'
    autoIncrement: true
    indexes: []
    onStoreReady: ->
      console.log 'cakes store ready'
    onError: (error) ->
      throw new Error error