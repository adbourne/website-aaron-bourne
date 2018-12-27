---
title: "Geospatial Software Development - The Geometries"
type: post 
date: 2017-04-24T00:00:00Z
categories: ["Computer Science", "Geospatial"] 
tags: ["GeoJSON", "Geometry", "Geospatial", "GIS", "LineString", "MultiLineString", "MultiPoint", "MultiPolygon", "Point", "Polygon", "Raster", "Vector", "Web Development"] 
draft: false
aliases:
    - "/2017/04/24/geospatial-software-development-the-geometries/"
---

*Featured image credit to OpenStreetMap contributors, 
[full copyright information available here.](https://www.openstreetmap.org/copyright)*

For the past few years I've been working in the Geospatial domain, developing various Geographic Information Systems 
(GIS). Although some consider GIS a bit of a dark art, and although in some ways they're right, it's actually fairly 
straight forward to get to grips with the underlying concepts.

### The Data
Geographic data is broadly found in two different representations. Firstly you have raster data, which are images. If 
you bought a map in a shop you would likely be looking at a raster representation of some geographic data. The other 
representation is vector data. I'm sure there's probably a super-accurate mathsy definition of vector data, but you're 
really just dealing with geometries -- shapes. It's common for geospatial data to be stored in vector form and then used 
to create rasters. We'll focus on the vector representation of geospatial data here.

### The Geometries
We need a standard way of representing the vector data. Just like the "basic" programming types such as Boolean, String, 
Integer etc there are a set of geometry types which you'll see across languages and GIS projects. The geometries available 
tend to differ slightly depending on what you're developing with, so we'll cover the more common ones here. We'll also 
focus on the 2D geometries, although 3D geometries do exist.

There are a multitude of ways that these geometries are represented. For example you have the 
[ESRI Shapefile](https://en.wikipedia.org/wiki/Shapefile), [GML](https://en.wikipedia.org/wiki/Geography_Markup_Language),
 [KML](https://en.wikipedia.org/wiki/Keyhole_Markup_Language), [GeoJSON](https://en.wikipedia.org/wiki/GeoJSON) and many 
 more. For familiarity and simplicity, we'll use GeoJSON examples.


#### Point
Let's say you take a map and you stick a pin in it, you've just created a Point. This Point has has a x value and a y 
value, and that's it.

![Point Geometry](/img/geospatial-software-development/geometries_point.jpg "Point Geometry" class="img-med img-center")

```javascript
{
    "type": "Point",
    "coordinates": [
        102.0, // Here's your x value
        0.5    // Here's your y value
    ]
 }
```


#### MultiPoint
A MultiPoint is a collection of Points. To keep up the analogy, let's say you decided to stick 3 pins in your map, 
perhaps to represent places you would like to visit, you now have a MultiPoint.

![MultiPoint Geometry](/img/geospatial-software-development/geometries_multipoint.jpg "MultiPoint Geometry" class="img-med img-center")


```javascript
{
 "type": "MultiPoint",
 "coordinates": [
     [             // Here's your first Point
         100.0,
         0.0
     ],
     [             // Here's your second
         101.0,
         1.0
     ],
     [             // Here's your third
         102.0,
         1.0
     ]
 ]
}
```


#### LineString
A LineString is line drawn on a map. Let's say you place two pins on a map, one to represent where you are and another 

to represent where you are travelling to. You link the pins with some string. There you have it, a LineString.

![LineString Geometry](/img/geospatial-software-development/geometries_linestring.jpg "LineString Geometry" class="img-med img-center")


```javascript
{
  "type": "LineString",
  "coordinates": [
    [
      100.0,
      0.0
    ],
    [
      101.0,
      1.0
    ]
  ]
}
```
You may have noticed that the structure of the LineString example is very similar to the MultiPoint example. This makes 
sense as we are dealing with a bunch of Points in both cases, it just so happens in the LineString case that we join the 
Points up to create a line.


#### MultiLineString
You've probably guessed by now, but a MultiLineString is a collection of LineStrings. Let's say you were planning a trip
 for multiple people and needed to plan each of their travel routes on a map, just like you did in the LineString example.
  Multiple lines in a single geometry, a MultiLineString.

![MultiLineString Geometry](/img/geospatial-software-development/geometries_multilinestring.jpg "MultiLineString Geometry" class="img-med img-center")


```javascript
{
 "type": "MultiLineString",
 "coordinates": [
     [               // First line
         [
             100.0,
             0.0
         ],
         [
             101.0,
             1.0
         ]
     ],
     [              // Second line
         [
             102.0,
             2.0
         ],
         [
             103.0,
             3.0
         ]
     ]
 ]
}
```


#### Polygon
A Polygon is a shape drawn on a map in which the first Point and the last Point are identical -- it's a "closed" shape. 
Let's say you wanted to plot the area of your house on a map, you would stick a pin for each corner of your house, join 
up the pins, with the string visiting each pin to create a shape. A Polygon can be as simple or as complex as it needs 
to be, it just needs to close.

![Polygon Geometry](/img/geospatial-software-development/geometries_polygon.jpg "Polygon Geometry" class="img-med img-center")

```javascript
{
  "type": "Polygon",
  "coordinates": [
    [
      [          // Here's your first Point
        100.0,
        0.0
      ],
      [
        101.0,
        0.0
      ],
      [
        101.0,
        1.0
      ],
      [
        100.0,
        1.0
      ],
      [         // Here's the last Point, note that they're the same
        100.0,
        0.0
      ]
    ]
  ]
}
```
It is valid for a Polygon to contain more than one ring. For example, Let's say you wanted to plot a donut-like shape on a map, you would have a Polygon for the outer ring and another for the inner ring.

#### MultiPolygon
For when a single Polygon is just not enough. Let's say you were plotting a University campus, or some other place made up of multiple buildings, all the buildings are "the campus", but they are also separate buildings. We could represent each of the buildings as a Polygon and then wrap them in a MultiPolygon so that they belong to the same geometry.

![MultiPolygon Geometry](/img/geospatial-software-development/geometries_multipolygon.jpg "MultiPolygon Geometry" class="img-med img-center")

```javascript
{
  "type": "MultiPolygon",
  "coordinates": [
    [               // Polygon 1
      [
        [
          102.0,
          2.0
        ],
        [
          103.0,
          2.0
        ],
        [
          103.0,
          3.0
        ],
        [
          102.0,
          3.0
        ],
        [
          102.0,
          2.0
        ]
      ]
    ],
    [                  // Polygon 2
      [
        [
          100.0,
          0.0
        ],
        [
          101.0,
          0.0
        ],
        [
          101.0,
          1.0
        ],
        [
          100.0,
          1.0
        ],
        [
          100.0,
          0.0
        ]
      ]
    ]
  ]
}
```
Yes, with a MultiPolygon it would even be possible to plot a University campus made entirely of donut-like shaped buildings.

### Wrap-up
For more information on what sort of geometries are available checkout the OGC's 
["Simple Features" standard](http://www.opengeospatial.org/standards/sfa) or the 
[ESRI Shapefile technical description](https://www.esri.com/library/whitepapers/pdfs/shapefile.pdf).

You may have noticed that the numeric values we've been using for the geometry examples have been pretty arbitrary and 
that's because they have been. To get a handle on how we put a shape in a certain place on the planet, we'll need to 
discuss [Spatial Reference Systems (SRS)](https://en.wikipedia.org/wiki/Spatial_reference_system), which we'll look at 
in the next post.