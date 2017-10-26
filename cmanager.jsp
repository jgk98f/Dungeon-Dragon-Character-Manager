<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


        <div class="left" style="padding-right: 150px;"/>
        <div class="right" style="padding-left: 150px;"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>D&D Manager</title>
    <h3 style="padding-top: 100px;"></h3>
    </head>
    <h3>Search for an existing character:</h3>
    <form action="http://hoare.cs.umsl.edu/servlet/j-klamert/charmanager" method="GET">
    <div class="form-group">
        <label for="InputCharacter">Character Name:</label>
        <input class="form-control"  name="name" placeholder="Character Name" id="name"/>
    </div>
    <div class="form-group">
        <label for="InputCharacter">Account ID:</label>
        <input class="form-control"  name="id" placeholder="Account ID" id="id"/>
    </div>
        <button class="btn btn-success" type="submit">Retrieve Character</button>
    </form>
    <c:if test="${Status2 == true}">
        <div class="alert alert-success" role="alert">Your character was retrieved!</div>
    </c:if>
    <c:if test="${Status2 == false}">
        <div class="alert alert-danger" role="alert">Your character was not found!</div>
    </c:if>
        
    <br/>
    <h3>Create a character:</h3>
    <form action="http://hoare.cs.umsl.edu/servlet/j-klamert/charmanager" method="POST">
        <div class="form-group">
        <label for="InputCharacter">Account ID:</label>
        <input class="form-control"  name="ID" placeholder="Account ID" id="ID"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Strength:</label>
        <input class="form-control"  name="Strength" placeholder="Character Strength" id="Strength"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Dexterity:</label>
        <input class="form-control"  name="Dexterity" placeholder="Character Dexterity" id="Dexterity"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Constitution:</label>
        <input class="form-control"  name="Constitution" placeholder="Character Constitution" id="Constitution"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Intelligence:</label>
        <input class="form-control"  name="Intelligence" placeholder="Character Intelligence" id="Intelligence"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Wisdom:</label>
        <input class="form-control"  name="Wisdom" placeholder="Character Wisdom" id="Wisdom"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Charisma:</label>
        <input class="form-control"  name="Charisma" placeholder="Character Charisma" id="Charisma"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Insight:</label>
        <input class="form-control"  name="Insight" placeholder="Character Insight" id="Insight"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Investigation:</label>
        <input class="form-control"  name="Investigation" placeholder="Character Investigation" id="Investigation"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Medicine:</label>
        <input class="form-control"  name="Medicine" placeholder="Character Medicine" id="Medicine"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Nature:</label>
        <input class="form-control"  name="Nature" placeholder="Character Nature" id="Nature"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Perception:</label>
        <input class="form-control"  name="Perception" placeholder="Character Perception" id="Perception"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Performance:</label>
        <input class="form-control"  name="Performance" placeholder="Character Performance" id="Performance"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Persuasion:</label>
        <input class="form-control"  name="Persuasion" placeholder="Character Persuasion" id="Persuasion"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character ArmorClass:</label>
        <input class="form-control"  name="ArmorClass" placeholder="Character ArmorClass" id="ArmorClass"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Inspiration:</label>
        <input class="form-control"  name="Inspiration" placeholder="Character Inspiration" id="Inspiration"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Acrobatics:</label>
        <input class="form-control"  name="Acrobatics" placeholder="Character Acrobatics" id="Acrobatics"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character AnimalHandling:</label>
        <input class="form-control"  name="AnimalHandling" placeholder="Character AnimalHandling" id="AnimalHandling"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Arcana:</label>
        <input class="form-control"  name="Arcana" placeholder="Character Arcana" id="Arcana"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Athletics:</label>
        <input class="form-control"  name="Athletics" placeholder="Character Athletics" id="Athletics"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Deception:</label>
        <input class="form-control"  name="Deception" placeholder="Character Deception" id="Deception"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character History:</label>
        <input class="form-control"  name="History" placeholder="Character History" id="History"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character SleightOfHand:</label>
        <input class="form-control"  name="SleightOfHand" placeholder="Character SleightOfHand" id="SleightOfHand"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Stealth:</label>
        <input class="form-control"  name="Stealth" placeholder="Character Stealth" id="Stealth"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Survival:</label>
        <input class="form-control"  name="Survival" placeholder="Character Survival" id="Survival"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Initiative:</label>
        <input class="form-control"  name="Initiative" placeholder="Character Initiative" id="Initiative"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Speed:</label>
        <input class="form-control"  name="Speed" placeholder="Character Speed" id="Speed"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Health:</label>
        <input class="form-control"  name="Health" placeholder="Character Health" id="Health"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character DeathSaveSuccess:</label>
        <input class="form-control"  name="DeathSaveSuccess" placeholder="Character DeathSaveSuccess" id="DeathSaveSuccess"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character DeathSaveFail:</label>
        <input class="form-control"  name="DeathSaveFail" placeholder="Character DeathSaveFail" id="DeathSaveFail"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Attack:</label>
        <input class="form-control"  name="Attack" placeholder="Character Attack" id="Attack"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Level:</label>
        <input class="form-control"  name="Level" placeholder="Character Level" id="Level"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Experience:</label>
        <input class="form-control"  name="Experience" placeholder="Character Experience" id="Experience"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Alignment:</label>
        <input class="form-control"  name="Alignment" placeholder="Character Alignment" id="Alignment"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character CharacterClass:</label>
        <input class="form-control"  name="CharacterClass" placeholder="Character CharacterClass" id="CharacterClass"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Age:</label>
        <input class="form-control"  name="Age" placeholder="Character Age" id="Age"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Height:</label>
        <input class="form-control"  name="Height" placeholder="Character Height" id="Height"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Weight:</label>
        <input class="form-control"  name="Weight" placeholder="Character Weight" id="Weight"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character EyeColor:</label>
        <input class="form-control"  name="EyeColor" placeholder="Character EyeColor" id="EyeColor"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character SkinColor:</label>
        <input class="form-control"  name="SkinColor" placeholder="Character SkinColor" id="SkinColor"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character HairColor:</label>
        <input class="form-control"  name="HairColor" placeholder="Character HairColor" id="HairColor"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Proficiency:</label>
        <input class="form-control"  name="Proficiency" placeholder="Character Proficiency" id="Proficiency"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Intimidation:</label>
        <input class="form-control"  name="Intimidation" placeholder="Character Intimidation" id="Intimidation"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Religion:</label>
        <input class="form-control"  name="Religion" placeholder="Character Religion" id="Religion"/>
    </div>
        <div class="form-group">
        <label for="InputCharacter">Character Name:</label>
        <input class="form-control"  name="Name" placeholder="Character Religion" id="Name"/>
    </div>
        <button class="btn btn-primary" type="submit">Create Character</button>
    </form>
    
    <c:if test="${Status == true}">
        <div class="alert alert-success" role="alert">The save was successful!</div>
    </c:if>
    <c:if test="${Status == false}">
        <div class="alert alert-danger" role="alert">The save has failed!</div>
    </c:if>
    
    <br/>
    <body class="center">
        <a href="http://hoare.cs.umsl.edu/servlet/j-klamert/redirect.jsp"><u>Source Information</u></a>
        <div class="center">   

            <table class="table table-striped table-hover table-bordered">
                <tr>
                    <td style="width: 50%;">Strength:</td>
                    <td><c:out value="${cbean.Strength}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Dexterity:</td>
                    <td><c:out value="${cbean.Dexterity}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Constitution:</td>
                    <td><c:out value="${cbean.Constitution}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Intelligence:</td>
                    <td><c:out value="${cbean.Intelligence}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Wisdom:</td>
                    <td><c:out value="${cbean.Wisdom}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Charisma:</td>
                    <td><c:out value="${cbean.Charisma}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">ArmorClass:</td>
                    <td><c:out value="${cbean.ArmorClass}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Inspiration:</td>
                    <td><c:out value="${cbean.Inspiration}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Proficiency:</td>
                    <td><c:out value="${cbean.Proficiency}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Acrobatics:</td>
                    <td><c:out value="${cbean.Acrobatics}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">AnimalHandling:</td>
                    <td><c:out value="${cbean.AnimalHandling}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Arcana:</td>
                    <td><c:out value="${cbean.Arcana}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Athletics:</td>
                    <td><c:out value="${cbean.Athletics}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Deception:</td>
                    <td><c:out value="${cbean.Deception}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">History:</td>
                    <td><c:out value="${cbean.History}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Insight:</td>
                    <td><c:out value="${cbean.Insight}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Intimidation:</td>
                    <td><c:out value="${cbean.Intimidation}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Investigation:</td>
                    <td><c:out value="${cbean.Investigation}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Medicine:</td>
                    <td><c:out value="${cbean.Medicine}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Nature:</td>
                    <td><c:out value="${cbean.Nature}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Perception:</td>
                    <td><c:out value="${cbean.Perception}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Performance:</td>
                    <td><c:out value="${cbean.Performance}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Persuasion:</td>
                    <td><c:out value="${cbean.Persuasion}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Religion:</td>
                    <td><c:out value="${cbean.Religion}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">SleightOfHand:</td>
                    <td><c:out value="${cbean.SleightofHand}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Stealth:</td>
                    <td><c:out value="${cbean.Stealth}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Survival:</td>
                    <td><c:out value="${cbean.Survival}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Initiative:</td>
                    <td><c:out value="${cbean.Initiative}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Speed:</td>
                    <td><c:out value="${cbean.Speed}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Health:</td>
                    <td><c:out value="${cbean.Health}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">DeathSaveSuccess:</td>
                    <td><c:out value="${cbean.DeathSaveSuccess}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">DeathSaveFail:</td>
                    <td><c:out value="${cbean.DeathSaveFail}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Attack:</td>
                    <td><c:out value="${cbean.Attack}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Level:</td>
                    <td><c:out value="${cbean.Level}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Name:</td>
                    <td><c:out value="${cbean.Name}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Experience:</td>
                    <td><c:out value="${cbean.Experience}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Alignment:</td>
                    <td><c:out value="${cbean.Alignment}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">CharacterClass:</td>
                    <td><c:out value="${cbean.CharacterClass}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Age:</td>
                    <td><c:out value="${cbean.Age}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Height:</td>
                    <td><c:out value="${cbean.Height}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">Weight:</td>
                    <td><c:out value="${cbean.Weight}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">EyeColor:</td>
                    <td><c:out value="${cbean.EyeColor}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">SkinColor:</td>
                    <td><c:out value="${cbean.SkinColor}"/></td>
                </tr>
                <tr>
                    <td style="width: 50%;">HairColor:</td>
                    <td><c:out value="${cbean.HairColor}"/></td>
                </tr>
            </table>

        </div>
        <div class="center bottom"><b style="font-size: 11px;">This website is not affiliated, endorsed, or sponsored by Wizards of the Coast® or Hasbro®. Dungeons & Dragons®, and D&D® are registered trademarks of Wizards of the Coast®. Contact the Web Master at: jgk98f@umsl.edu</b></div>
    </body> 
</html>