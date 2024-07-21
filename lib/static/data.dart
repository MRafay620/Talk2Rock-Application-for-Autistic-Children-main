import 'package:autism/models/my_cateogory.dart';
import 'package:autism/models/necessity.dart';
import 'package:flutter/material.dart';

List<Necessity> necessity = [
  Necessity(
    category: "Food",
    image: "asset/image/categories/foods.png",
    color: const Color(0xFF3D82AE),
    subcategories: [
      MyCategory(
          name: "Apple",
          points: [
            'I want to eat apple',
            'I don’t want to eat apple',
          ],
          imageUrl: "asset/image/sub_categories/foods/apple.png",
          color: const Color(0xFF3D82AE)),
      MyCategory(
          name: "Burger",
          points: [
            'I want to eat Burger'
                'I don’t want to eat Burger',
          ],
          imageUrl: "asset/image/sub_categories/foods/burger.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Banana",
          points: [
            'I want to eat banana',
            'I don’t want to eat banana’ ',
          ],
          imageUrl: "asset/image/sub_categories/foods/banana.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "Carrot",
          points: [
            'I want to eat carrot ',
            'I don’t want to eat carrot’ ',
          ],
          imageUrl: "asset/image/sub_categories/foods/carrot.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Chicken",
          points: [
            'I want to eat chicken ',
            'I don’t want to eat chicken',
          ],
          imageUrl: "asset/image/sub_categories/foods/chicken.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Chocolate",
          points: [
            'I want to eat chocolate’ ',
            'I dont want to eat chocolate',
          ],
          imageUrl: "asset/image/sub_categories/foods/chocolate.png",
          color: const Color(0xFF7C9093)),
      MyCategory(
          name: "Egg",
          points: [
            'I want to eat egg ',
            'I dont want to eat chocolate’ ',
          ],
          imageUrl: "asset/image/sub_categories/foods/egg.png",
          color: const Color(0xFFB6D39A)),
      MyCategory(
          name: "Beans",
          points: [
            'I want to eat beans ',
            'I dont want to eat beans ',
          ],
          imageUrl: "asset/image/sub_categories/foods/beans.png",
          color: const Color(0xFFFF9F96)),
      MyCategory(
          name: "Ice Cream",
          points: [
            'I want to eat Icecream',
            'I dont want to eat chocolate’ ',
          ],
          imageUrl: "asset/image/sub_categories/foods/ice_cream.png",
          color: const Color(0xFFDFC9EC)),
      MyCategory(
          name: "Pizza",
          points: [
            'I want to eat pizza',
            'I dont want to eat pizza',
          ],
          imageUrl: "asset/image/sub_categories/foods/pizza.png",
          color: const Color(0xFFC3ECE3)),
      MyCategory(
          name: "SandWitch",
          points: [
            'I want to eat chocolate’ ',
            'I dont want to eat sandwich ',
          ],
          imageUrl: "asset/image/sub_categories/foods/sandwich.png",
          color: const Color(0xFFA8B7D5)),
    ],
  ),
  Necessity(
    category: "Animals",
    image: "asset/image/categories/animals.png",
    color: const Color(0xFFD3A984),
    subcategories: [
      MyCategory(
        name: "Butterfly",
        imageUrl: "asset/image/sub_categories/animals/butterfly.png",
        color: const Color(0xFF3D82AE),
        points: [
          'I like butterfly ',
          'I don’t like butterfly  ',
        ],
      ),
      MyCategory(
          name: "Cat",
          points: [
            'I like cat',
            'I don’t like cat',
          ],
          imageUrl: "asset/image/sub_categories/animals/cat.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Cow",
          points: [
            'I like cow',
            'I don’t like cat',
          ],
          imageUrl: "asset/image/sub_categories/animals/cow.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "Dog",
          points: [
            'I like dog',
            'I don’t like dog',
          ],
          imageUrl: "asset/image/sub_categories/animals/dog.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Duck",
          points: [
            'I like duck',
            'I don’t like duck',
          ],
          imageUrl: "asset/image/sub_categories/animals/duck.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Fish",
          points: [
            'I like fish',
            'I don’t like fish',
          ],
          imageUrl: "asset/image/sub_categories/animals/fish.png",
          color: const Color(0xFF7C9093)),
    ],
  ),
  Necessity(
    category: "Feelings",
    image: "asset/image/categories/feeling.png",
    color: const Color(0xFF989493),
    subcategories: [
      MyCategory(
          points: [
            'I am angry  ',
            'I am not angry',
            'You are making me angry',
          ],
          name: "Angry",
          imageUrl: "asset/image/sub_categories/feelings/angry.png",
          color: const Color(0xFF3D82AE)),
      MyCategory(
          name: "Confused",
          points: [
            'I am confused',
            'I am not confused',
            'You are confusing me '
          ],
          imageUrl: "asset/image/sub_categories/feelings/confused.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Exhausted",
          points: [
            'I am exhausted',
          ],
          imageUrl: "asset/image/sub_categories/feelings/exhausted.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "Love",
          points: [
            'I am in love ',
            'I am not in love’ ',
            'You make me feel loved’'
          ],
          imageUrl: "asset/image/sub_categories/feelings/love.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Quiet",
          points: [
            'I want to stay quiet',
            'Please stay quiet',
          ],
          imageUrl: "asset/image/sub_categories/feelings/quiet.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Relax",
          points: [
            'I am relaxed  ',
            'I am not relaxed  ',
            'You are helping me relax',
          ],
          imageUrl: "asset/image/sub_categories/feelings/relaxed.png",
          color: const Color(0xFF7C9093)),
      MyCategory(
          name: "Sad",
          points: [
            'I am sad ',
            'I am not sad',
            'You are making me sad',
          ],
          imageUrl: "asset/image/sub_categories/feelings/sad.png",
          color: const Color(0xFFB6D39A)),
      MyCategory(
          name: "Sick",
          points: [
            'I am sick ',
            'I am not sick',
            'You are making me sick',
          ],
          imageUrl: "asset/image/sub_categories/feelings/sick.png",
          color: const Color(0xFFFF9F96)),
      MyCategory(
          name: "Sleepy",
          points: [
            'I feel sleepy',
            'I am not sleepy ',
            'I need to sleep’',
          ],
          imageUrl: "asset/image/sub_categories/feelings/sleepy.png",
          color: const Color(0xFFDFC9EC)),
      MyCategory(
          name: "Stressed",
          points: [
            'I am stressed ',
            'I am not stressed ',
            'I need to relax’ ',
          ],
          imageUrl: "asset/image/sub_categories/feelings/stressed.png",
          color: const Color(0xFFC3ECE3)),
    ],
  ),
  Necessity(
    category: "Clothes",
    image: "asset/image/categories/clothes.png",
    color: const Color(0xFF98E1EC),
    subcategories: [
      MyCategory(
        name: "Pant",
        imageUrl: "asset/image/sub_categories/clothes/pants.png",
        color: const Color(0xFF3D82AE),
        points: [
          'My pants are dirty ',
          'Can you help me wear my pant '
              'I dont want to wear pant',
        ],
      ),
      MyCategory(
          name: "Cap",
          points: [
            'I like my cap',
            'I don’t like my cap'
                'Can you help me wear my cap',
          ],
          imageUrl: "asset/image/sub_categories/clothes/cap.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Frok",
          points: [
            'My frok is dirty ',
            'Can you elp me wear my frok '
                'I dont want to wear frok',
          ],
          imageUrl: "asset/image/sub_categories/clothes/frok.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "Belt",
          points: [
            'Can you help me wear my belt',
            'Can you help me wear my belt'
                'I don\'t want to wear belt',
          ],
          imageUrl: "asset/image/sub_categories/clothes/belt.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Braclet",
          points: [
            'I like braclets',
            'I don’t like braclets'
                'Can you help me wear braclet?',
          ],
          imageUrl: "asset/image/sub_categories/clothes/braclet.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Jacket",
          points: [
            'I like jackets',
            'I don’t want to wear jacket',
            'Can you help me wear jacket?'
          ],
          imageUrl: "asset/image/sub_categories/clothes/jacket.png",
          color: const Color(0xFF98E1EC)),
      MyCategory(
          name: "Pea Cap",
          points: [
            'I like my pea cap',
            'I don’t like my pea cap'
                'Can you help me wear my pea cap',
          ],
          imageUrl: "asset/image/sub_categories/clothes/pea_cap.png",
          color: const Color(0xFFDCA2E1)),
      MyCategory(
          name: "Scarf",
          points: [
            'I like my scarf',
            'I don’t like my scarf'
                'Can you help me wear my scarf',
          ],
          imageUrl: "asset/image/sub_categories/clothes/scarf.png",
          color: const Color(0xFFE5B9B2)),
      MyCategory(
          name: "Slippers",
          points: [
            ' My slippers are dirty',
            'I don’t like my slippers'
                'Can you help me wear my slippers',
          ],
          imageUrl: "asset/image/sub_categories/clothes/slippers.png",
          color: const Color(0xFF7C9093)),
      MyCategory(
          name: "Socks",
          points: [
            'My socks are dirty',
            'I don’t like my socks'
                'Can you help me wear my socks',
          ],
          imageUrl: "asset/image/sub_categories/clothes/socks.png",
          color: const Color(0xFFFDF0C1)),
      MyCategory(
          name: "Shoes",
          points: [
            'My shoes are dirty',
            'I don’t like my shoes'
                'Can you help me wear my shoes',
          ],
          imageUrl: "asset/image/sub_categories/clothes/shose.png",
          color: const Color(0xFFDFC9EC)),
    ],
  ),
  Necessity(
    category: "People",
    image: "asset/image/categories/people.png",
    color: const Color(0xFFF37979),
    subcategories: [
      MyCategory(
        name: "Aunt",
        imageUrl: "asset/image/sub_categories/people/aunt.png",
        color: const Color(0xFF3D82AE),
        points: [
          'She is not my aunt',
          'She is my aunt',
          'I love my aunt',
          'I dont\'t like my aunt',
        ],
      ),
      MyCategory(
          name: "Brother",
          points: [
            'He is not my bother',
            'He is my brother',
            'I love my brother',
            'I dont\'t like my brother',
          ],
          imageUrl: "asset/image/sub_categories/people/bro.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Doctor",
          points: [
            'This is not my doctor',
            'This is my doctor',
            'I love my doctor',
            'I dont\'t like my doctor',
          ],
          imageUrl: "asset/image/sub_categories/people/doctor.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "Friends",
          points: [
            'They are not my friends',
            'They are my friends',
            'I love my friends',
            'I dont\'t like my friends',
          ],
          imageUrl: "asset/image/sub_categories/people/friends.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Grand Parents",
          points: [
            'They are not my Grand Parents',
            'They are my Grand Parents',
            'I love my Grand Parents',
            'I dont\'t like my Grand Parents',
          ],
          imageUrl: "asset/image/sub_categories/people/grandparents.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Mother",
          points: [
            'She is not my Mother',
            'She is my Mother',
            'I love my Mother',
            'I dont\'t like my Mother',
          ],
          imageUrl: "asset/image/sub_categories/people/mother.png",
          color: const Color(0xFF98E1EC)),
      MyCategory(
          name: "Parent",
          points: [
            'They are not my Parents',
            'They are my Parents',
            'I love my Parents',
            'I dont\'t like my Parents',
          ],
          imageUrl: "asset/image/sub_categories/people/parent.png",
          color: const Color(0xFFDCA2E1)),
      MyCategory(
          name: "Sister",
          points: [
            'She is not my Sister',
            'She is my Sister',
            'I love my Sister',
            'I dont\'t like my Sister',
          ],
          imageUrl: "asset/image/sub_categories/people/sis.png",
          color: const Color(0xFFE5B9B2)),
      MyCategory(
          name: "Teacher",
          points: [
            'She is not my Teacher',
            'She is my Teacher',
            'I love my Teacher',
            'I dont\'t like my Teacher',
          ],
          imageUrl: "asset/image/sub_categories/people/teacher.png",
          color: const Color(0xFF7C9093)),
      MyCategory(
          name: "Uncle",
          points: [
            'He is not my Uncle',
            'He is my Uncle',
            'I love my Uncle',
            'I dont\'t like my Uncle',
          ],
          imageUrl: "asset/image/sub_categories/people/uncle.png",
          color: const Color(0xFFFDF0C1)),
    ],
  ),
  Necessity(
    category: "Conversation",
    image: "asset/image/categories/conversation.png",
    color: const Color(0xFFDFC9EC),
    subcategories: [
      MyCategory(
        name: "Help",
        imageUrl: "asset/image/sub_categories/conversation/help.png",
        color: const Color(0xFF3D82AE),
        points: [
          'I need help ',
          'Can you help me ',
          'Help me',
        ],
      ),
      MyCategory(
          name: "Hurt",
          points: [
            'I am hurt',
            'They hurt me',
            'I hurt them',
            'You are hurting me',
          ],
          imageUrl: "asset/image/sub_categories/conversation/hurt.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Look",
          points: [
            'Look at me',
            'Look at this',
            'Are you looking?',
            'How do I look',
          ],
          imageUrl: "asset/image/sub_categories/conversation/look.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "No",
          points: [
            'Never',
            'I don’t want to',
            'I don\'t like it',
          ],
          imageUrl: "asset/image/sub_categories/conversation/no.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Outside",
          points: [
            'I want to go outsite',
            'I don’t want to go outside',
            'I like being outside',
            'I don\'t like being outside',
          ],
          imageUrl: "asset/image/sub_categories/conversation/outside.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Parents",
          points: [
            'I want to go to my Parents',
            'I don’t want to go to my Parents',
            'Call my parents',
          ],
          imageUrl: "asset/image/sub_categories/conversation/parents.png",
          color: const Color(0xFF98E1EC)),
      MyCategory(
          name: "Play",
          points: [
            'I like playing',
            'I don’t like playing',
            'I want to play',
            'I don\'t want to play',
          ],
          imageUrl: "asset/image/sub_categories/conversation/play.png",
          color: const Color(0xFFDCA2E1)),
      MyCategory(
          name: "Sleep",
          points: [
            'I like sleeping',
            'I don’t like to sleep',
            'I want to sleep',
            'I don\'t want to sleep',
          ],
          imageUrl: "asset/image/sub_categories/conversation/sleep.png",
          color: const Color(0xFFE5B9B2)),
      MyCategory(
          name: "Toilet",
          points: [
            'I want to go to toilet',
            'I don’t want to go to toilet',
            'Help me go to toilet',
          ],
          imageUrl: "asset/image/sub_categories/conversation/toilet.png",
          color: const Color(0xFF7C9093)),
      MyCategory(
          name: "What",
          points: [
            'What is this?',
            'What are you doing?',
            'I don\'t understand',
          ],
          imageUrl: "asset/image/sub_categories/conversation/what.png",
          color: const Color(0xFFFDF0C1)),
      MyCategory(
          name: "Why",
          points: [
            'Why are you doing that?',
            'Why are you saying that?',
            'Why should I do that?',
          ],
          imageUrl: "asset/image/sub_categories/conversation/why.png",
          color: const Color(0xFFDFC9EC)),
      MyCategory(
          name: "Yes",
          points: [
            'Yes please',
            'I want to',
            'I would like to',
          ],
          imageUrl: "asset/image/sub_categories/conversation/yes.png",
          color: const Color(0xFF8A9DE1)),
    ],
  ),
  Necessity(
    category: "Shapes",
    image: "asset/image/categories/shapes.png",
    color: const Color(0xFFEABCB2),
    subcategories: [
      MyCategory(
          name: "Circle",
          imageUrl: "asset/image/sub_categories/shapes/circle.png",
          points: [
            'This is a circle',
            'I want to draw a circle',
            'I dont want to draw a circle',
          ],
          color: const Color(0xFF3D82AE)),
      MyCategory(
          name: "Cube",
          points: [
            'This is a cube',
            'I want to draw a cube',
            'I dont want to draw a cube'
          ],
          imageUrl: "asset/image/sub_categories/shapes/cube.png",
          color: const Color(0xFFD3A984)),
      MyCategory(
          name: "Rhombus",
          points: [
            'This is a rhombus',
            'I want to draw a rhombus',
            'I dont want to draw a rhombus'
          ],
          imageUrl: "asset/image/sub_categories/shapes/rombus.png",
          color: const Color(0xFF989493)),
      MyCategory(
          name: "Diamond",
          points: [
            'This is a diamond',
            'I want to draw a diamond',
            'I dont want to draw a diamond'
          ],
          imageUrl: "asset/image/sub_categories/shapes/diamond.png",
          color: const Color(0xFFF3AAB7)),
      MyCategory(
          name: "Heart",
          points: [
            'This is a heart',
            'I want to draw a heart',
            'I dont want to draw a heart'
          ],
          imageUrl: "asset/image/sub_categories/shapes/heart.png",
          color: const Color(0xFFEEE1A1)),
      MyCategory(
          name: "Moon",
          points: [
            'This is a moon',
            'I want to draw a moon',
            'I dont want to draw a moon'
          ],
          imageUrl: "asset/image/sub_categories/shapes/moon.png",
          color: const Color(0xFF7C9093)),
      MyCategory(
          name: "Rectangle",
          points: [
            'This is a rectangle',
            'I want to draw a rectangle',
            'I dont want to draw a rectangle'
          ],
          imageUrl: "asset/image/sub_categories/shapes/rectangle.png",
          color: const Color(0xFFB6D39A)),
      MyCategory(
          points: [
            'This is a square',
            'I want to draw a square',
            'I dont want to draw a square'
          ],
          name: "Square",
          imageUrl: "asset/image/sub_categories/shapes/square.png",
          color: const Color(0xFFFF9F96)),
      MyCategory(
          name: "Star",
          points: [
            'This is a star',
            'I want to draw a star',
            'I dont want to draw a star'
          ],
          imageUrl: "asset/image/sub_categories/shapes/star.png",
          color: const Color(0xFFDFC9EC)),
      MyCategory(
          name: "Triangle",
          points: [
            'This is a triangle',
            'I want to draw a triangle',
            'I dont want to draw a triangle'
          ],
          imageUrl: "asset/image/sub_categories/shapes/triangle.png",
          color: const Color(0xFFB6D39A)),
    ],
  ),
];
