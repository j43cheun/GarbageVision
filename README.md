# GarbageVision

Garbage Vision is a very simple iOS app that I wrote for identifying trash.
Given an image, Garbage Vision classifies the subject into one of six possible
classes: Cardboard, Glass, Metal, Paper, Plastic, and Trash. The app is written
in Swift and its UI is implemented using the Swift UI framework. Classification
is handled... poorly... by the Garbage Net Core ML model, which I created using
Apple's Create ML app and trained using a trash image dataset from the
[trashnet](https://github.com/garythung/trashnet.git) GitHub repo by Gary
Thung. In practice, classification seems to be hit or miss, especially in
differentiating between Paper and Plastic.

I was inspired to create Garbage Vision after seeing the various
compost, recycle, and trash signs at my workplace. The idea of a mobile app
that could visually identify trash sounded intriguing as a logical extension.
Also, I had nothing better to do on Christmas due to the ongoing COVID-19
pandemic \>:(

<div id="image-table">
  <table>
    <tr>
      <td style="padding:10px">
        <img src="https://github.com/j43cheun/GarbageVision/blob/main/Screenshots/main-screen.png"/>
      </td>
      <td style="padding:10px">
        <img src="https://github.com/j43cheun/GarbageVision/blob/main/Screenshots/classification.png"/>
      </td>
      <td style="padding:10px">
        <img src="https://github.com/j43cheun/GarbageVision/blob/main/Screenshots/confidence-scores.png"/>
      </td>
    </tr>
  </table>
</div>


