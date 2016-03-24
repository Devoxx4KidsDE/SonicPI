![Devoxx4Kids](./logo.jpg)



# Workshop for Sonic PI

This workshop was put together by *Stefan Höhn, Irene Höppner and Matthias Malstädt*

The workshop was created to be finished within roughly 80-90 minutes.

## Instructions
The workshop consists of two parts:
* Documentation
* Sonic Pi examples (including necessary samples)

It is recommended to retrieve the whole folder to c:\ or /. The reason is that some of the examples contain references to external sound samples that have to be referenced in the code. The reference within the Sonic PI code is always done at the beginning of the code so it maybe easily adapted to the path where you have downloaded the code.

## Documentation
First of all, the presentation currently is only available in German and English but feel free to fork and translate it into a different language.

### Workshop handout for the Kids
The idea of the workshop is based on giving "cards" to the kids with which they can go forward step by step while being supported by their mentors. The idea is similar to what the D4K Hamburg guys have done and it is based upon that. However we changed the sequence and context by which we train the kids. That way they learn several areas and put those in different buffers. Finally they copy everything together and it results in something that works out as a whole while we still motivate the kids during creation of the different parts to be creative and do their own thing. 

Our intentions is to build up something like a "master piece" during the workshop that in the end has been put together which sounds kind of cool.

During the creation and first test tries we noticed that the fun really starts after the first two or three buffers. Therefore our recommendation is not to spend too much time on letting the kids' creativity flow but rather move on a bit more quickly in the beginning.


## Instructions

**Preparation**: You should print out the slides, then divide the pages into the section of the "cards" and the "cheat sheets". Cut the pages with the cards into half and we recommend punching a hole and bind them with a strap or a thread (the luxury version would be to laminate the cards and staple them).

**Using it**:  

The cards are devided into three sections
* The big area mainly contains a few simple commands that should be tried out newly. Most of the times they just replace what has been there before but sometimes they ask the kids to replace or change something. Over time we try to expect more and more transfer knowledge by leaving out some details. If this demands too much from the kids the mentor should jump in and support at this point.
* There is a small sentence below that should explain what the background of the current exercise is
* The lower section provides some alternatives of the exercise provided above and can be used to instigate some creativity
* Whenever there is a card that is called "Buffer", the kids should start with the next Buffer in Sonic Pi

This is what could be similar to the **outcome of the workshop**:

```ruby

live_loop :melody do
  sample :guit_em9
  sleep 2
end

live_loop :drums do
  use_bpm 120
  sample :bd_haus
  sleep 1
  sample :sn_zome
  sleep 1
end

live_loop :diddel do
  use_bpm 240
  play scale(:e4, :minor).choose, amp: 2
  sleep 1
end

live_loop :scaleMelody do
  use_bpm 480
  use_synth :piano
  play_pattern scale(:e4, :minor), amp: 1
  play_pattern scale(:e4, :minor).reverse, amp: 1
end

```

## Examples

The examples can be separated in two parts

1) Examples for the demo during the beginning of the workshop
2) Further examples for the mentors to get some ideas during the Train-the-mentor session

**Example for the demo**

In particular there is one example which is called __workshop-intro-demo__. The idea there is to have several live_loops that run together more or less in the end. When you start it you won't hear anything. There is a main live_loop called "control". It contains flags that allow the content of the live_loops to be switched on and off from a central point. The intent of the demo is not to explain how to use Sonic Pi but rather let the kids hear what can be done with it and make them curious...

We recommend 
* to start with the __heartbeat__ and ask the kids to stomp their feets along. 
* Then activate the __claps__ and ask the kids to clap twice on their knees and once in their hands.  (Btw, does anyone recognize that beat? ;-) )

From then on add one or the other to the song and have fun together...
