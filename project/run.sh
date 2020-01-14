if [ "$1" = "" ]; then
    npm run paralleltest
else
    recodId=`head -1 $1 | awk '{print $2}'`
    curl -d $recodId $UIRECORDER_MOCK_API/uirecorder-mock-manager/beginReplay
    npm run singletest $1
    curl -d $recodId $UIRECORDER_MOCK_API/uirecorder-mock-manager/endReplay
fi
