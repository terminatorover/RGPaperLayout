# RGPaperLayout
This is a layout that clones the interaction of going through sections when editing your sections in Facebook's paper app

![g](https://github.com/terminatorover/RGPaperLayout/blob/master/sim.png)

[Watch it in action here](https://www.youtube.com/watch?v=X10hdbakG2E&feature=youtu.be)


To use this simply drop it in as a class in the storyboard or nib when you create your collection view. You can 
also instantiate it in code and give it your collection view(via initWithFrame:collectionViewLayout: or just set the layout property of the collection view. From there, you can use your collection view as you always do.

One important thing for this layout is that in the datasource protocol you must use 
numberOfSectionsInCollectionView: to specify the number of cards, and return 1 for collectionView:numberOfItemsInSection:

Also note that the itemsize is computed by the layout to be "appropriate" to the size of the collection view 
itself so setting it won't do anything.
