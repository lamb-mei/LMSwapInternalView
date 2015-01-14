#LMSwapInternalView

Easy to custom a container view controller manage multiple child view controllers using storyboards. base on EmbeddedSwapping

簡易使用 Interface Builder (IB) 建立內容的切換

參考來源 **Michael Luton** EmbeddedSwapping 
Blog post [storyboards-with-custom-container-view-controllers](http://sandmoose.com/post/35714028270/storyboards-with-custom-container-view-controllers)
[GitHub : EmbeddedSwapping](https://github.com/mluton/EmbeddedSwapping)

----------

## Feature
- **custom Segue ID Switch**
- **call Switch on child View**
- **Switch View and Send Data**

##特點
- **自定 Segue ID 切換**
- **容器內呼叫切換**
- **切換傳遞參數**


---------
## Usage

**Step 1 :** add `Container View`  on  view controller

**Step 2 :** add one or more child `view controller`  segue them to `Container View` , segue type `empty`

**Step 3 :**  set segue ID

**Step 4:** set `Container View` and multiple child View `view controller` bind Class

**Step 5:**  call switch method

---------
- Init `Container View` 
```objective-c
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
        //設定第一個顯示啥
        self.containerViewController.defaultSID = @"segue ID";
        
    }
}
```
---------


- switch view 
```objective-c
[self.containerViewController swapViewControllersByID:pArray[idx]];
```
---------

- switch view on Child view
```objective-c
[self.container swapViewControllersByID:@"embedFirst"];
```
---------
- switch view with Object
```objective-c
[self.container swapViewControllersByID:@"embedFirst"
                                  SELString:@"setThirdDateToFirst:" withObject:str];
```
---------

##LICENSE
MIT-LICENSE
