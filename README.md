FlatWoken icon theme
=========

![FlatWoken_500icons](https://cloud.githubusercontent.com/assets/4378663/4010483/e8a7f18c-29f5-11e4-869c-e0f314965049.jpg)

Official *FlatWoken* icon theme source repository.

The *FlatWoken* project is developed by **Alessandro Roncone** (aka *alecive*), and it is released under the [CC BY-SA 4.0 License](http://creativecommons.org/licenses/by-sa/4.0/). It is meant to be a complete set of icon themes for Linux **AND** Android. If you'd like to use and/or modify these icons for your own purposes the iconset is free to use, including commercially, but please consider that if you do convey any monetary income from its use I kindly ask that we arrange for a fair compensation. Regardless of the use, I'd like to know if and how my icons are used, and I'd like to receive some sort of credit for it! Nothing crazy, though: just a quick note on the bottom or your website with my email/website is sufficient :)

Contact informations:

- Google+    https://plus.google.com/+AlessandroRoncone
- e-mail     alecive87@gmail.com
- deviantART http://alecive.deviantart.com/
- AwOken/FlatWoken Google+ page https://plus.google.com/u/0/b/116957764483417291271/116957764483417291271/
- FlatWoken Icon Theme Free (trial version) on the Play Store https://play.google.com/store/apps/details?id=com.alecive.flatwokenfree
- FlatWoken Icon Theme (full version) on the Play Store https://play.google.com/store/apps/details?id=com.alecive.flatwoken

For any icon request and/or bug, please use github.

Design Guidelines
----------

*FlatWoken* project is derived from the popular *AwOken* icon theme. It's freely inspired by its minimalist approach, even though it is basically a revision with an eye toward flat design. 

*FlatWoken* icons are currently divided in two different icon sets:

- *FlatWoken* is the main branch. It's supposed to enclose all the design ideas behind the project: flat, long-shadow icons enclosed in squared frames with rounded corners. The only choice diverging from the flat design guidelines is the shadow given to the squared frame: it is meant to make the icon stand out from any background in which it can be placed in.
- *FlatWokenMin* is a more minimal reinterpretation of its bigger brother. Basically, it follows a different approach for making the icons stand out from the background (no more shadows but a 3d-ish flat effect on the bottom and the right size) *plus* it reinterprets some icons in order to push on the minimalistic approach. Furthermore, the icon in itself is completely white, whereas the squared frame is supposed to enclose the main color(s) of the original icon. Currently I'm mainly focusing on the design of *FlatWoken* icon theme, but I update also once in a while.

#### Icon Guidelines - FlatWoken
The same guidelines are present inside the image called `icon-template.svg` , but they're reported here for the sake of completeness

###### Recommendations
1. Don't put a big icon inside the squared frame. Its dimension should never be bigger than 350px (300x300 is recommended)
2. BE FLAT, and BE MINIMAL! Never forget this: think always about how to reduce clutter, reduce elements, simplify colors etc
3. If the icon has an hole (e.g. the hole in a donut), that hole should be without the shadow, in order to make the icon better highlighted wrt the background
4. As a recommended suggestion, keep the number of colors limited. An icon should never have too many colors. Usually, two or three colors are recommended.
5. Try to stick with the original color palette, in order to ease for the user the process of associating the custom icon with the original app
6. Prefer soft colors instead of highly saturated ones.

###### How to create a compatible long shadow (Inkscape only)
Let's suppose we have already created an icon whose design matches the guidelines. The last step is to create the long shadow. Unfortunately, on Inkscape this is not straightforward w.r.t. other software such as Adobe Illustrator (for which there are plenty of tutorials out there).
In the repo there's an icon called `icon-template-longshadow-tutorial.svg` that is supposed to provide a step-by-step tutorial for the long-shadow. It's divided into several images, each of them is explained here (from top to bottom):

1. The icon under evaluation is a simple white contour (WC) against a blue background (BB).
2. Let's duplicate WC, change the color according to the guidelines below (in this case `0-0-0-60` because we're having a colored background) and then `Path-> Break Apart`. Let's select only the bigger path (BP - the littler [LP] will be used later), and then duplicate it(BPD). Move the duplicated path 300px on the right and 300px on the bottom
3. Select both BP and BPD, and then `Extensions-> from path -> Interpolate` (with parameters 0.0 200 2). Select both BP, BPD and the interpolation, and do `Object->Ungroup` and then `Path->Union`. You should have a big path (BPP) with a lot of points at its edge.
4. Select both BPP and LP, and then `Path->Difference`. Move it to the background in order to highlight WC. Now duplicate BB, and select it alongside BPP. Click again on `Path->Intersection`, in order to have a shadow that doesn't go outside the frame.
5. Now you have only to remove the blurred edges caused by the great number of nodes in the edges. The only appropriate way I've found (please notice that `Path->Simplify` is not enough accurate) is to remove all of them by hand. For each segment (e.g. in this template there are four segment) there should be only one node at the beginning and one at the end. Remove any other node, than remove any curvature of the bezier map, and that's it! You created a perfectly compliant icon for FlatWoken :)

###### Guidelines for the Long Shadows (R-G-B-A)
- `0-0-0-40` for an icon with a white/very clear background
- `0-0-0-60` for an icon with a colored background
- `0-0-0-80` for an icon with a black/very dark background

Installation
----------

Firstly, a git installation should be up and running on your machine (and you should have at least some basic knowledge related to git). Secondly, remember that this method doesn't work for KDE (but it works for any GNOME/XFCE/LXDE installation) Then, follow these simple steps:

- Open a terminal window
- `cd` in your Download/Programming/Git folder
- type `git clone https://github.com/alecive/FlatWoken.git`
- `cd` into the `FlatWoken` folder just appeared
- `mv` the folders called `FlatWoken` and `FlatWokenMin` into your `~/.icons` directory (if this directory doesn't exist, simply create it).
- choose the iconset (either `FlatWoken` or `FlatWokenMin`) with your favourite theme-tweaker of choice (`gnome-tweak-tool`,`ubuntu-tweak`,`unity-tweak-tool` or even `dconf` or the `terminal` for the most nerdish out there)


Contribution
----------

*FlatWoken* project is at its early stages. A lot of icons are yet to be designed, and the project is open to external contributors as well as independent single submissions! I'm also open to icon requests.

*Github* is a great platform for collaboration. Therefore, the best way for me to handle external submissions (as well as for you :P ) is to use github's tools! So please remember to use them as much as you can. In the following: three typical ways to contribute to the project are highlighted.

#### Ask for an icon
If you think that a very important icon is missing, simply open an issue with the icon name and the request will be managed as soon as possible. An `.svg` file with the original icon would be of great help (and it would definitely speed up the process of designing the icon requested).
To ease the submission, you can ask for an icon by filling up this form-> http://goo.gl/NxXii0

#### Submit an icon / a bunch of iconsI
f you're a designer on your own you can directly create your own icon, and ask for a submission on the official repo. The best way to do that is to fork the project, do your own icons and once you finish one or a bunch of them, ask for a pull request. I will review them and if everything is ok I'll add them to the main repo. Remember that I am a pixel-perfect maniac, so please carefully follow the *Icon Guidelines* chapter before asking for a pull request. You will save both mine and your time :)

#### Become a contributor
If you're skilled enough and you're into the project so much that I don't even need to validate your icons before submitting them, I will be pleased to directly add you as a contributor of the main project!

###### Contributors
- [José Morales](https://plus.google.com/+Jos%C3%A9Morales87/posts) made an extension pack composed by 35 icons, that has been already integrated in the iconset
- [Iohannes Quon Fabrum](https://plus.google.com/109260276583018639821/posts) created 24 more icons for KDE, that have been integrated in the main repository as well
- [jkoldarr](https://github.com/jolkdarr) is doing more than 100 development-related icons. See [#107](https://github.com/alecive/FlatWoken/pull/107) and [#106](https://github.com/alecive/FlatWoken/pull/106)
- [tojarafal](https://github.com/tojarafal) added 27 icons over the time
- Minor contributions by:
  - [f43792](https://github.com/f43792) added a beautiful group of `minecraft` icons to the set
  - [varlesh](https://github.com/varlesh) added `deadbeef` icon
  - [muava12](https://github.com/muava12) added `arduino` and `eagle` icons
