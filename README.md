# Supercharge your <kbd>shift</kbd> key: Hold it for <kbd>shift</kbd>, tap it for <kbd>escape</kbd>! 

### A more useful shift key

As Steve Losh points out in his [Modern Space Cadet](http://stevelosh.com/blog/2012/10/a-modern-space-cadet/#shift-escape) post, there are "keys you hold down to change how other keys behave, but that (usually) don’t do anything if you use them on their own" (e.g., <kbd>shift</kbd>), and there are "keys that you press and release but don’t want to 'repeat' as you hold them" (e.g., <kbd>escape</kbd>). "There are two [distinctly] different ways to use [these keys] and they’re each only useful in one of those ways. This means that we can *combine* them onto a single key without losing any useful functionality!"

With that in mind, we can teach the <kbd>shift</kbd> key to pull double duty:

- If <kbd>shift</kbd> is pressed and released in isolation, we can interpret it as <kbd>escape</kbd>
- If <kbd>shift</kbd> is held down and used in combination with another key, then we can let it provide the normal <kbd>shift</kbd> key behavior

### Goes great with Touch Bar

If you've got one of those fancy Touch Bar Macs, you might find yourself longing for the good ol' days of a tactile <kbd>escape</kbd> key. Look no further. 😅

### Optional: Free the caps lock key

What's more useful than a "more useful shift key?" A more useful *and more-easily reachable* control key, of course. By repurposing the anachronistic caps lock key, we can skip the acrobatics needed to reach the physical control key. We can use <kbd>caps lock</kbd> to give us <kbd>control</kbd>right on the home row.

Say goodbye to [Emacs pinky](http://wiki.c2.com/?EmacsPinky). 👋

## Dependencies

This functionality is developed and tested with the following dependencies:

- macOS Sierra 10.12
- [Hammerspoon 0.9.54][hammerspoon]

## Installation

#### Just the basics

```sh
mkdir -p ~/.hammerspoon/Spoons

git clone https://github.com/monkeyjunglejuice/ShiftyEscape.spoon.git ~/.hammerspoon/Spoons/ShiftyEscape.spoon

cd ~/.hammerspoon/Spoons/ShiftyEscape.spoon

./script/setup
```

#### Optional: You're just a few seconds away from a [more useful caps lock key](#optional-a-more-useful-caps-lock-key)

With one more bit of setup, you'll be able to hold <kbd>caps lock</kbd> for <kbd>control</kbd>, and tap <kbd>shift</kbd> for <kbd>escape</kbd>:

Open *System Preferences*, navigate to *Keyboard > Modifier Keys*, and set the <kbd>caps lock</kbd> key to <kbd>control</kbd>. [[screenshot]](https://user-images.githubusercontent.com/2988/27111039-7f620442-507b-11e7-9bcf-93d46e14af13.png)

Now you're ready to rock. 🤘

## Shout-outs

All credit goes to [@jasonrudolph(https://github.com/jasonrudolph)] who wrote all the code of this Hammerspoon config. I just changed the key used for <kbd>escape</kbd> from <kbd>control</kbd> to <kbd>shift</kbd>, because it's even better to reach than <kbd>control</kbd> mapped to <kbd>caps lock</kbd> on most keyboards.

Shout-out to [@arbelt](https://github.com/arbelt) and [@jasoncodes](https://github.com/jasoncodes) for the original implementation of this functionality. ⚡️🍻🌟

This code is an adaptation of their work:

- <https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1>
- <https://github.com/jasoncodes/dotfiles/blob/ac9f3ac/hammerspoon/shift_escape.lua>

## You might also like

Still reading? Dude, you're pretty serious about your keyboard.

Lucky for you, there's more where this came from. Check out [keyboard](https://github.com/jasonrudolph/keyboard) for even more fun. ⌨🤓

[hammerspoon]: http://www.hammerspoon.org
