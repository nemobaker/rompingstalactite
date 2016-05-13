#!/bin/bash

# DB ADMIN TASKS
function createUsers {
  psql -c "CREATE USER admin SUPERUSER";
  psql -c "CREATE USER developer";

  if [ checkUser ]; then
    echo '✔  admin created';
    return 1;
  else
    echo '✘  there was an error creating users';
    return 0;
  fi;
};

function createDatabase {
  psql -c "CREATE DATABASE recipes WITH ENCODING 'UTF8'";

  if [ checkDatabase ]; then
    echo '✔  recipes database created';
    grantPrivileges;
    return 1;
  else
    echo '✘  there was an error creating the database';
    return 0;
  fi;
};

#Insert test row to Recipes Table
function seedData {
  #USERS
  psql recipes -c "INSERT INTO users(username) VALUES ('testUser1'),  ('testUser2'),  ('testUser3'),  ('testUser4'),  ('testUser5'),  ('testUser6'),  ('testUser7'),  ('testUser8'),  ('testUser9'),  ('testUser10'), ('testUser11'), ('testUser12'), ('testUser13'), ('testUser14'), ('testUser15'), ('testUser16'), ('testUser17'), ('testUser18'), ('testUser19'), ('testUser20'), ('testUser21'), ('testUser22'), ('testUser23'), ('testUser24'), ('testUser25'), ('testUser26'), ('testUser27'), ('testUser28'), ('testUser29'), ('testUser30'), ('testUser31'), ('testUser32'), ('testUser33'), ('testUser34'), ('testUser35'), ('testUser36'), ('testUser37'), ('testUser38'), ('testUser39'), ('testUser40'), ('testUser41'), ('testUser42'), ('testUser43'), ('testUser44'), ('testUser45'), ('testUser46'), ('testUser47'), ('testUser48'), ('testUser49'), ('testUser50'), ('testUser51'), ('testUser52'), ('testUser53'), ('testUser54'), ('testUser55'), ('testUser56'), ('testUser57'), ('testUser58'), ('testUser59'), ('testUser60'), ('testUser61'), ('testUser62'), ('testUser63'), ('testUser64'), ('testUser65'), ('testUser66'), ('testUser67'), ('testUser68'), ('testUser69'), ('testUser70'), ('testUser71'), ('testUser72'), ('testUser73'), ('testUser74'), ('testUser75'), ('testUser76'), ('testUser77'), ('testUser78'), ('testUser79'), ('testUser80'), ('testUser81'), ('testUser82'), ('testUser83'), ('testUser84'), ('testUser85'), ('testUser86'), ('testUser87'), ('testUser88'), ('testUser89'), ('testUser90'), ('testUser91'), ('testUser92'), ('testUser93'), ('testUser94'), ('testUser95'), ('testUser96'), ('testUser97'), ('testUser98'), ('testUser99'), ('testUser100')"

    echo '✔  Test Users populated 0 to 100 Real Quick';

  
  #CUPCAKES
  psql recipes -c "INSERT INTO recipes (
    author,
    title,
    images,
    yield,
    yield_unit,
    ingredients,
    prep_time,
    prep_steps,
    cook_time,
    cook_steps,
    finish_steps,
    description
  ) VALUES (
    1,
    'Vegan Red Velvet Cupcakes',
    ARRAY [
      'http://40aprons.com/wp-content/uploads/2013/10/red_velvet_cupcakes+2+of+81.jpg',
      'http://cf.tasteandtellblog.com/wp-content/uploads/2014/09/Red-Velvet-Cupcakes-recipe-taste-and-tell-1b-opt.jpg',
      'http://ww2.hdnux.com/photos/13/62/31/3089985/3/920x920.jpg'
    ],
    12,
    'Cupcakes',
    ARRAY [
      '1 cup soymilk',
      '1 teaspoon apple cider vinegar',
      '1 1⁄4 cups all-purpose flour',
      '1 cup granulated sugar',
      '2 tablespoons cocoa powder',
      '1⁄2 teaspoon baking powder',
      '1⁄2 teaspoon baking soda',
      '1⁄2 teaspoon salt',
      '1⁄3 cup canola oil',
      '2 tablespoons red food coloring',
      '2 teaspoons vanilla extract',
      '1⁄4 teaspoon almond extract',
      '1 teaspoon chocolate extract',
      '1⁄4 cup vegan margarine, non-hydrogenated, softened',
      '1⁄4 cup vegan cream cheese, softened',
      '2 cups powdered sugar, sifted',
      '1 teaspoon vanilla extract'
    ],
    15,
    ARRAY [
      'Preheat oven to 350 degrees and line muffin pans with liners.'
    ],
    20,
    ARRAY [
      'Whisk together the soy milk and vinegar and set aside to curdle.',
      'Sift the flour, sugar, cocoa, baking powder, baking soda, and salt into a large bowl and mix.',
      'Add the oil, food coloring, chocolate extract, Vanilla extract and almond extract to the curdled soy milk. Whisk well to combine.',
      'Make well in center of dry ingredients and gently fold wet ingredients into dry, mixing until large lumps disappear.',
      'Do not over mix, or your cupcakes will turn out gummy - small lumps are okay.',
      'Fill cupcake liners about three-quarters full as these cupcakes will rise fairly high.',
      'Place in hot oven and bake 18-20 minutes until done, or until toothpick inserted in cetner comes out clean.',
      'Cool cupcakes in the pan for five mintues, and then transfer to a cooling rack or surface to cool completely.',
      'For frosting:',
      'Using a hand mixer, cream together margarine and cream cheese until just combined, then whip in the powdered sugar in 1/2 cup batches.',
      'Scrape down the sides and mix until smooth and creamy.',
      'Mix in the vanilla.'
    ],
    ARRAY [
      'Keep tightly covered and refrigerated until ready to use.',
      'Add sprinkles/garnish if desirerd.'
    ],
    'The chocolate extract REALLY makes it, so it is worth finding. As well as the little hint of almond. For the frosting, you can cut the sugar down to 1 1/2-3/4 cup, and it will still be quite sweet.'
  )";
  echo '✔  1 Cupcakes in the oven!';

  #SAMOSAS
  psql recipes -c "INSERT INTO recipes (
    author,
    title,
    images,
    yield,
    yield_unit,
    ingredients,
    prep_time,
    prep_steps,
    cook_time,
    cook_steps,
    finish_steps,
    description
  ) VALUES (
    2,
    'Samosas',
    ARRAY [
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/11/74/55/picO1qehQ.jpg',
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/11/74/55/picGG8P8T.jpg'
    ],
    24,
    'Samosas',
    ARRAY [
      '3 cups all-purpose flour',
      '1 teaspoon salt',
      '4 tablespoons melted butter or 4 tablespoons ghee',
      '3⁄4 cup cold water',
      '2 lbs potatoes, peeled',
      '4 tablespoons vegetable oil',
      '2 teaspoons mustard seeds (yellow or black)',
      '2 medium onions, finely chopped',
      '4 tablespoons fresh ginger, chopped',
      '3 teaspoons fennel seeds',
      '1 teaspoon ground cumin',
      '1 tablespoon ground coriander',
      '1 teaspoon turmeric',
      '1 cup frozen green pea, defrosted',
      '1 teaspoon salt',
      '2 tablespoons water',
      '1 teaspoon garam masala',
      '1⁄2 teaspoon ground cayenne pepper'
    ],
    120,
    ARRAY [
      'First put the potatoes on to boil until tender, then drain and cool.',
      'While the potatoes are cooking, make the pastry by mixing the flour and salt in a bowl.',
      'Pour in the butter or ghee and rub together wtih the flour until it becomes slightly flaky.',
      'Pour 3/4 cup water over the flour and pull the dough together with your hands.',
      'You can add up to 4 tbsp more water, one spoonful at a time, until everything comes together in a bowl.',
      'From here you can knead the dough by hand for about 10 minutes or throw it in a mixer with a dough attachment, going until the dough is smooth and elastic.',
      'When the dough is done, place it in a bowl, rub with oil and cover until you are ready to fill the samosas.',
      'Next, start making the filling by cutting your cooked potatoes into cubes.',
      'Heat the oil in a frying pan and throw in the mustard seeds.',
      'Cook until they start to crackle and burst and when that happens immediately add your chopped onion and ginger.',
      'Cook for a few minutes until the onion softens and then add the fennel, cumin, turmeric, potatoes, peas, salt and water.',
      'Stir well and then reduce the heat to low and let cook for about 5 minutes.',
      'Sprinkle over the garam masala and hot pepper and stir again.',
      'Taste for seasoning and then take off the heat.',
      'Now it is time to start filling your samosas.',
      'Grab a piece of dough by pinching off a piece and rolling it thinly and into a circle.',
      'You can make the samosas any size you like.',
      'With a knife, cut the circle in half, moisten the straight edge with a finger dipped in water and then shape it into a cone, pressing the straight edges together to form a seal.',
      'You should now have a little ice cream cone shaped piece of dough which you can spoon filling into.',
      'Fill and then moisten the top edges and press closed.',
      'Set on a plate and cover with foil or plastic wrap until you are ready to cook (up to 2-3 hours later).'
    ],
    15,
    ARRAY [
      'To deep fry the samosas, pour 3 cups of vegetable oil into a 12 inch wok and heat until a piece of dough thrown into the oil bubbles.',
      'If you have a deep fryer, you want a temperature around 375°F.',
      'Brown on both sides and drain on paper towel.'
    ],
    ARRAY [
      'Cool on the paper towel or drying rack',
      'Finally, you can enjoy a samosa!'
    ],
    'The seasoning given here is what I would consider a minimum but you may want to add more to your taste, especially when it comes to the hot pepper. You could also do half potatoes and half carrots for the filling if you like.'
  )";

  echo '✔  2 Dosas and Samosas!';


  #Vanilla ICE CREAM
  psql recipes -c "INSERT INTO recipes (
    author,
    title,
    images ,
    yield,
    yield_unit ,
    ingredients ,
    prep_time,
    prep_steps,
    cook_time,
    cook_steps,
    finish_steps,
    description
  ) VALUES (
    3,
    'Vanilla Ice Cream',
    ARRAY [
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/47/90/picDnUZU9.jpg',
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/47/90/piceKa5F5.jpg'
    ],
    1,
    'Quart',
    ARRAY [
      '2 large eggs',
      '3⁄4 cup sugar',
      '2 cups heavy whipping cream',
      '1 cup milk',
      '2 teaspoons vanilla extract'
    ],
    5,
    ARRAY [
      'Prepare Ice Cream Maker if necessary.'
    ],
    20,
    ARRAY [
     'Whisk the eggs in a mixing bowl until light and fluffy, 1 to 2 minutes.',
     'Whisk in the sugar, a little at a time, then continue whisking until completely blended, about 1 minute more. Pour in the cream, milk, and vanilla and whisk to blend.',
     'Transfer the mixture to an ice cream maker and freeze following the manufacturer instructions.'
    ],
    ARRAY [
      'Top with sprinkles, whipped cream, a cherry, and enjoy!'
    ],
    'Always welcome on hot days.'
  )";
  
  echo '✔  3 I Scream You Scream';

  #Cake Batter ICE CREAM
  psql recipes -c "INSERT INTO recipes (
    author,
    parent,
    title,
    images ,
    yield,
    yield_unit,
    ingredients,
    prep_time,
    prep_steps,
    cook_time,
    cook_steps,
    finish_steps,
    description
  ) VALUES (
    4,
    3,
    'Cake Batter Ice Cream',
    ARRAY [
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/12/89/52/f15xnUJJQc2kJB0O1v6o_birthday-cake-ice-cream-7207.jpg',
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/12/89/52/J3XsYX6tTTeN2E1pi9uB_birthday-cake-ice-cream-7204.jpg',
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/12/89/52/pic7sRu1R.jpg'
    ],
    11,
    'Cup Servings',
    ARRAY [
      '1 cup whole milk, well chilled',
      '3⁄4 cup granulated sugar',
      '2 cups heavy cream, well chilled',
      '1 teaspoon pure vanilla extract',
      '2⁄3 cup cake mix'
    ],
    5,
    ARRAY [
      'Place freezer bowl of ice cream maker into the freezer. It is better to keep it in there 24/7 that way it is always ready.'
    ],
    25,
    ARRAY [
      'In a medium bowl, whisk the milk and granulated sugar until the sugar is dissolved.',
      'Stir in the heavy cream and vanilla to taste.',
      'Stir in cake mix, making sure there are no lumps.',
      'Pour mixture into the freezer bowl and let mix until it has thickened (about 25-30 minutes).',
      'Remove ice cream from freezer bowl and place into a separate container.',
      'Place freezer bowl and the ice cream into the freezer to further harden.'
    ],
    ARRAY [
      'Top with sprinkles, whipped cream, a cherry, and enjoy!'
    ],
    'I recommend using Splenda instead of sugar since there is sugar in the cake mix. You can use 2 teaspoons of vanilla extract if you please. You can also use 3/4 cup of cake mix.'
  )";
  
  echo '✔  4 We All Scream for Ice Cream!';

  #RIBS
  psql recipes -c "INSERT INTO recipes (
    author,
    title,
    images ,
    yield,
    yield_unit,
    ingredients,
    prep_time,
    prep_steps,
    cook_time,
    cook_steps,
    finish_steps,
    description
  ) VALUES (
    5,
    'Low & Slow Oven Baked Ribs',
    ARRAY [
      'http://pictures.food.com/api/file/kXkN9RrHSmKbEXu5EFkb-191-ribs.jpg/convert?loc=/pictures.food.com/recipes/30/32/45/HaU7lGxtTNmZxI856Ztg_191%20ribs.jpg&width=555&height=416&fit=max&flags=progressive&quality=95',
      'http://pictures.food.com/api/file/VZs7n3wcT1u3NVkYGP9Y-182-ribs.jpg/convert?loc=/pictures.food.com/recipes/30/32/45/SLXUtfXbTqWfANRxuHmA_182%20ribs.jpg&width=555&height=416&fit=max&flags=progressive&quality=95'
    ],
    1,
    'rack of ribs',
    ARRAY [
      '2 racks pork baby back ribs (our favorite are baby back ribs, but this works well with St. Louis style ribs too)',
      '1 cup barbecue sauce'
    ],
    5,
    ARRAY [
      'Preheat oven to 225 degrees.',
      'Season your ribs with your favorite rib rub, grill seasoning, or simply salt and pepper.',
      'Place ribs, meat side down, in baking dishes.'
    ],
    240,
    ARRAY [
      'Cover the baking dishes with aluminum foil and place in the oven.',
      'If you are using small baby back ribs, take out after 3.5 hours. If you are using regular baby back or St. Louis style ribs, then take out after 4 hours.',
      'Drain off the drippings. Flip the ribs over using two spatulas (and an extra set of hands if you have them) so the meat side is up. Be careful, as they may be so tender they fall apart.'
    ],
    ARRAY [
      'Put a layer of BBQ sauce on the ribs and return to the oven uncovered for an additional 20-30 minutes.',
      'Remove from oven and serve them up with a side of potato salad and some baked beans.'
    ],
    'I carefully attempted various combinations of flavors until I found one that I and my customers thought was perfect.'
  )";
  
  echo '✔  5 Baby Back Baby Back RIBS';

  #Madeline Cookies
  psql recipes -c "INSERT INTO recipes (
    author,
    title,
    images ,
    yield,
    yield_unit,
    ingredients,
    prep_time,
    prep_steps,
    cook_time,
    cook_steps,
    finish_steps,
    description
  ) VALUES (
    6,
    'Madeline Cookies',
    ARRAY [
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/19/92/05/picQi349N.jpg',
      'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/19/92/05/picXBhlVB.jpg'
    ],
    20,
    'cookies',
    ARRAY [
      '2 large eggs',
      '2⁄3 cup sugar',
      '1 teaspoon vanilla extract',
      '1⁄2 teaspoon grated lemon peel',
      '1 pinch salt',
      '1 cup all-purpose flour',
      '10 tablespoons unsalted butter, melted, cooled slightly'
    ],
    15,
    ARRAY [
      'Preheat oven to 375°F Generously butter and flour pan for large madeleines (about 3x1 1/4 inches).',
      'Spoon 1 tablespoon batter into each indentation in pan. Bake until puffed and brown, about 10-16 minutes. Cool 5 minutes. Gently remove from pan. Repeat process, buttering and flouring pan before each batch. (Can be made 1 day ahead.).'
    ],
    25,
    ARRAY [
      'Using electric mixer, beat eggs and 2/3 cup sugar in large bowl just to blend. Beat in vanilla, lemon peel and salt. Add flour; beat just until blended. Gradually add cooled melted butter in steady stream, beating just until blended.
'
    ],
    ARRAY [
      'Dust cookies with powdered sugar.'
    ],
    'I carefully attempted various combinations of flavors until I found one that I and my customers thought was perfect.'
  )";
  
  echo '✔  6 Madeline Cookies';

    # Mushroom Risotto
    psql recipes -c "INSERT INTO recipes (
      author,
      title,
      images ,
      yield,
      yield_unit,
      ingredients,
      prep_time,
      cook_time,
      cook_steps,
      finish_steps,
      description
    ) VALUES (
      7,
      'Mushroom Risotto',
      ARRAY [
        'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/21/35/35/picI83SuK.jpg',
        'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/21/35/35/picVFpSeW.jpg'
      ],
      6,
      'servings',
      ARRAY [
        '6 cups chicken broth',
        '3 tablespoons oil',
        '2 lbs white mushrooms, sliced thin',
        '2 shallots, diced',
        '1 1⁄2 cups arborio rice',
        '1⁄2 cup dry white wine (or white wine substitute White Wine Substitute (non-alcoholic Substitute))',
        'salt, to taste',
        'black pepper, to taste',
        '3 tablespoons chives',
        '4 tablespoons butter',
        '1⁄3 cup grated parmesan cheese'
      ],
      20,
      30,
      ARRAY [
        'Heat the broth over low heat.',
        'In a large saucepan, heat 2 tablespoons of oil and cook the mushrooms until soft. about 3 minute',
        'Put the mushrooms and the liquid in a bowl and set aside.',
        'Add the remaining 1 tablespoons oil to skillet, and cook the shallots for 1 minute.',
        'Stir in the rice,coating it with oil, about 2 minutes.',
        'When the rice has taken on a pale, golden color, add the wine, stirring constantly until it is fully absorbed.',
        'Add 1/2 cup broth to the rice, and stir until the broth is absorbed.',
        'Continue adding broth 1/2 cup at a time, stirring continuously, until the liquid is absorbed and the rice is tender-firm.'
      ],
      ARRAY [
        'Remove from heat, and stir in mushrooms with their liquid, butter, chives, and parmesan. Season with salt and pepper to taste.'
      ],
      'A timeless dish for any occassion.'
    )";
    
    echo '✔  7 UOENO Risotto';

    # Cajun Chicken Pasta
    psql recipes -c "INSERT INTO recipes (
      author,
      title,
      images ,
      yield,
      yield_unit,
      ingredients,
      prep_time,
      prep_steps,
      cook_time,
      cook_steps,
      finish_steps,
      description
    ) VALUES (
      8,
      'Creamy Cajun Chicken Pasta',
      ARRAY [
        'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/39/08/7/piccZDaro.jpg',
        'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/39/08/7/CgDMsf7T2Wssje5yZMKu_munchkintime.com%20(17%20of%2019).JPG'
      ],
      2,
      'servings',
      ARRAY [
        '2 boneless skinless chicken breast halves, cut into thin strips',
        '4 ounces linguine, cooked al dente',
        '2 teaspoons cajun seasoning (your recipe, Cajun Seasoning Mix or store-bought)',
        '2 tablespoons butter',
        '1 thinly sliced green onion',
        '1⁄2 cup heavy whipping cream',
        '2 tablespoons chopped sun-dried tomatoes',
        '1⁄4 teaspoon salt',
        '1⁄4 teaspoon dried basil',
        '1⁄8 teaspoon ground black pepper',
        '1⁄8 teaspoon garlic powder',
        '1⁄4 cup grated parmesan cheese'
      ],
      10,
      ARRAY [
        'Place chicken and Cajun seasoning in a bowl and toss to coat.'
      ],
      15,
      ARRAY [
        'In a large skillet over medium heat, sauté chicken in butter or margarine until chicken is tender, about 5 to 7 minutes.',
        'Reduce heat add green onion, heavy cream, tomatoes, basil, salt, garlic powder, black pepper and heat through.'
      ],
      ARRAY [
        'Pour over hot linguine and toss with Parmesan cheese.'
      ],
      'Nawlins style of chicken with an updated Alfredo sauce.'
    )";
    
    echo '✔  8 Hola NOLA';

    #Japanese Wings
    psql recipes -c "INSERT INTO recipes (
      author,
      title,
      images ,
      yield,
      yield_unit,
      ingredients,
      prep_time,
      cook_time,
      cook_steps,
      finish_steps,
      description
    ) VALUES (
      8,
      'Japanase Style Wings',
      ARRAY [
        'http://pictures.food.com/api/file/TuGlaMWQ5OBe6LrnaGAB-1531645_10203894315582622_620837910_n.jpg/convert?loc=/pictures.food.com/recipes/68/95/5/7YxSddiDTJWpw2LIaNQO_1531645_10203894315582622_620837910_n.jpg&width=555&height=416&fit=max&flags=progressive&quality=95',
        'http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/68/95/5/picl2GBti.jpg'
      ],
      4,
      'servings',
      ARRAY [
        '8 chicken drumsticks, skin on (the skin is important for flavour, and is so tasty to eat!)',
        '1 cup water',
        '1⁄2 cup balsamic vinegar',
        '1⁄3 cup soy sauce',
        '2 1⁄2 tablespoons sugar',
        '1 garlic clove, peeled and bruised',
        '1 small hot chili pepper, slit open, seeds removed'
      ],
      5,
      40,
      ARRAY [
        'Place all the ingredients in a saucepan over a high heat.',
        'Bring to the boil, then reduce to a simmer for about 20 minutes.',
        'Remove any scum that rises to the surface.',
        'Increase the heat, turning the drumsticks frequently in the liquid, and cook until the liquid has reduced to a sticky glaze.'
      ],
      ARRAY [
        'Arrange the chicken on a serving platter, remove the garlic clove and chili from the liquid, and spoon the glaze over.'
      ],
      'Authentic Japanese-Style Wings'
    )";
    
    echo '✔  9 Ichi Ni San WINGS!';

    # Bahn Mi Lettuce Wraps
    psql recipes -c "INSERT INTO recipes (
      author,
      title,
      images ,
      yield,
      yield_unit,
      ingredients,
      prep_time,
      cook_time,
      cook_steps,
      finish_steps,
      description
    ) VALUES (
      4,
      'Bahn Mi Lettuce Wraps',
      ARRAY [
        'http://cdn-img.health.com/sites/default/files/styles/420x420/public/styles/main/public/butter-lettuce-avocado-salad-XL.jpg'
      ],
      4,
      'servings',
      ARRAY [
        '1⁄2lemon, juiced',
        'salt',
        '12 ounces raw shrimp, peeled and deveined',
        '2 tablespoons rice vinegar',
        '1 small green apple, julienned',
        '1 medium carrot, shredded',
        '1 small kirby cucumber, cut into matchstick-size strips',
        '1 small jalapeno, sliced into rings',
        '1 scallion, chopped',
        'fresh ground black pepper',
        '4 large bibb lettuce',
        '4 sprigs fresh cilantro'
      ],
      10,
      15,
      ARRAY [
        'Fill a medium saucepan three-quarters with water. Add the lemon juice and bring to a boil. Add a pinch of salt and then drop the shrimp into the boiling water, cook until the shrimp are opaque, 2 to 3 minutes.',
        'While shrimp cooks, create an ice bath. Drain the shrimp and place in the ice bath. Once cooled, drain the shrimp and pat off any excess water. Set aside.',
        'Combine the vinegar, apples, carrots, cucumbers, jalapenos and scallions in a bowl. Season the salad with salt and pepper.'
      ],
      ARRAY [
        'To assemble the wraps, lay out the lettuce leaves. Divide the poached shrimp and salad among the leaves. Top each with a sprig of cilantro.',
        'To prepare ahead of time, pack the lettuce, shrimp and 1/4 cup salad in separate containers and assemble when you are ready to eat.'
      ],
      'This sandwich is traditionally prepared with pork, baguette, mayo and pate. Cut out the bread and replace it with Bibb lettuce, and add in high-protein shrimp, extra veggies and green apple for a bit of sweetness.'
    )";
    
    echo '✔  10 Bahn-d for life';

    # Asparagus and Fontina Pizza
    psql recipes -c "INSERT INTO recipes (
      author,
      title,
      images ,
      yield,
      yield_unit,
      ingredients,
      prep_time,
      cook_time,
      cook_steps,
      finish_steps,
      description
    ) VALUES (
      11,
      'Roasted Asparagus and Fontina Pizza',
      ARRAY [
        'http://cdn-img.health.com/sites/default/files/styles/420x420/public/styles/main/public/asparagus-pizza-XL.jpg'
      ],
      4,
      'servings',
      ARRAY [
        '1 tablespoon red wine vinegar',
        '2 1/2 teaspoons Dijon mustard',
        'Kosher salt and freshly ground black pepper',
        '2 tablespoons grapeseed or other neutral oil',
        '2 teaspoons extra-virgin olive oil',
        '1 head butter lettuce, torn',
        '8 French breakfast radishes or round red radishes, halved',
        '1 scallion, white and pale green parts only, thinly sliced at an angle',
        '2 tablespoons roughly chopped fresh dill',
        '1 avocado, halved, pitted, peeled and sliced'
      ],
      5,
      5,
      ARRAY [
        'In a large bowl, whisk vinegar and mustard with a pinch each of salt and pepper. While whisking, add oils in a slow, steady stream to emulsify.'
      ],
      ARRAY [
        'Toss dressing with lettuce, radishes, scallion and dill. Top with avocado and serve.'
      ],
      'Try this recipe in early spring, when the first radishes appear at farmers' market'
    )";
    
    echo '✔  11 Avocado-m-g';


};

function checkDatabase {
  echo 'check db does nothing right now';
  return 0;
};

function checkUser {
  echo 'check user does nothing right now';
  return 1;
};

function grantPrivileges {
  psql -c "GRANT ALL PRIVILEGES ON DATABASE recipes TO admin";
  echo '✔  all privileges granted to admin on database recipes';
  psql -c "GRANT ALL PRIVILEGES ON DATABASE recipes TO developer";
  echo '✔  all privileges granted to developer on database recipes';

  return 1;
};

function createTables {
  psql recipes -U admin < server/db/recipes_db_schema.sql;
};


# check if postgres is installed
if [ 'which postgres' ]; then
  if [ 'pgrep psql' ]; then
    echo '✔  postgres installed';
    createUsers;
    createDatabase;
    createTables;
    seedData;
  else
    echo '✘  please start your postgres server!';
  fi;
else
  echo '✘  you need to install postgres to continue';
  echo 'Please follow this guide: https://www.codefellows.org/blog/three-battle-tested-ways-to-install-postgresql';
fi;