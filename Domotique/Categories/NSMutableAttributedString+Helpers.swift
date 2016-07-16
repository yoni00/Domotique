//
//  NSAttributedString+Helpers.swift
//  Domotique
//
//  Created by Yoni on 12/07/2016.
//  Copyright © 2016 Christophe Haguette. All rights reserved.
//

//Check icons on http://fontawesome.io/icons/, v4.6

extension NSMutableAttributedString  {
    
    var fontColor: UIColor {
        set {
           self.addAttribute(NSForegroundColorAttributeName, value: newValue, range: NSRange(location: 0, length: self.length))
        }
        get {
            return UIColor.whiteColor()
        }
    }
    
    
    class func YOglass() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f000}")
    }
    
    class func YOmusic() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f001}")
    }
    
    class func YOsearch() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f002}")
    }
    
    class func YOenvelopeO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f003}")
    }
    
    class func YOheart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f004}")
    }
    
    class func YOstar() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f005}")
    }
    
    class func YOstarO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f006}")
    }
    
    class func YOuser() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f007}")
    }
    
    class func YOfilm() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f008}")
    }
    
    class func YOthLarge() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f009}")
    }
    
    class func YOth() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00a}")
    }
    
    class func YOthList() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00b}")
    }
    
    class func YOcheck() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00c}")
    }
    
    class func YOremove() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00d}")
    }

    class func YOclose() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00d}")
    }

    class func YOtimes() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00d}")
    }

    class func YOsearchPlus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f00e}")
    }
    
    class func YOsearchMinus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f010}")
    }
    
    class func YOpowerOff() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f011}")
    }
    
    class func YOsignal() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f012}")
    }
    
    class func YOgear() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f013}")
    }

    class func YOcog() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f013}")
    }

    class func YOtrashO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f014}")
    }
    
    class func YOhome() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f015}")
    }
    
    class func YOfileO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f016}")
    }
    
    class func YOclockO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f017}")
    }
    
    class func YOroad() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f018}")
    }
    
    class func YOdownload() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f019}")
    }
    
    class func YOarrowCircleODown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f01a}")
    }
    
    class func YOarrowCircleOUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f01b}")
    }
    
    class func YOinbox() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f01c}")
    }
    
    class func YOplayCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f01d}")
    }
    
    class func YOrotateRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f01e}")
    }

    class func YOrepeat() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f01e}")
    }

    class func YOrefresh() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f021}")
    }
    
    class func YOlistAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f022}")
    }
    
    class func YOlock() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f023}")
    }
    
    class func YOflag() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f024}")
    }
    
    class func YOheadphones() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f025}")
    }
    
    class func YOvolumeOff() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f026}")
    }
    
    class func YOvolumeDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f027}")
    }
    
    class func YOvolumeUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f028}")
    }
    
    class func YOqrcode() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f029}")
    }
    
    class func YObarcode() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f02a}")
    }
    
    class func YOtag() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f02b}")
    }
    
    class func YOtags() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f02c}")
    }
    
    class func YObook() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f02d}")
    }
    
    class func YObookmark() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f02e}")
    }
    
    class func YOprint() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f02f}")
    }
    
    class func YOcamera() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f030}")
    }
    
    class func YOfont() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f031}")
    }
    
    class func YObold() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f032}")
    }
    
    class func YOitalic() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f033}")
    }
    
    class func YOtextHeight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f034}")
    }
    
    class func YOtextWidth() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f035}")
    }
    
    class func YOalignLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f036}")
    }
    
    class func YOalignCenter() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f037}")
    }
    
    class func YOalignRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f038}")
    }
    
    class func YOalignJustify() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f039}")
    }
    
    class func YOlist() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03a}")
    }
    
    class func YOdedent() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03b}")
    }

    class func YOoutdent() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03b}")
    }

    class func YOindent() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03c}")
    }
    
    class func YOvideoCamera() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03d}")
    }
    
    class func YOphoto() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03e}")
    }
    
    class func YOpicture() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03e}")
    }
    
    class func YOimage() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f03e}")
    }
    
    class func YOpencil() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f040}")
    }
    
    class func YOmapMarker() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f041}")
    }
    
    class func YOadjust() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f042}")
    }
    
    class func YOtint() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f043}")
    }
    
    class func YOedit() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f044}")
    }
    
    class func YOshareSquareO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f045}")
    }
    
    class func YOcheckSquareO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f046}")
    }
    
    class func YOarrows() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f047}")
    }
    
    class func YOstepBackward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f048}")
    }
    
    class func YOfastBackward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f049}")
    }
    
    class func YObackward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f04a}")
    }
    
    class func YOplay() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f04b}")
    }
    
    class func YOpause() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f04c}")
    }
    
    class func YOstop() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f04d}")
    }
    
    class func YOforward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f04e}")
    }
    
    class func YOfastForward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f050}")
    }
    
    class func YOstepForward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f051}")
    }
    
    class func YOeject() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f052}")
    }
    
    class func YOchevronLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f053}")
    }
    
    class func YOchevronRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f054}")
    }
    
    class func YOplusCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f055}")
    }
    
    class func YOminusCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f056}")
    }
    
    class func YOtimesCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f057}")
    }
    
    class func YOcheckCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f058}")
    }
    
    class func YOquestionCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f059}")
    }
    
    class func YOinfoCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f05a}")
    }
    
    class func YOcrosshairs() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f05b}")
    }
    
    class func YOtimesCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f05c}")
    }
    
    class func YOcheckCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f05d}")
    }
    
    class func YOban() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f05e}")
    }
    
    class func YOarrowLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f060}")
    }
    
    class func YOarrowRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f061}")
    }
    
    class func YOarrowUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f062}")
    }
    
    class func YOarrowDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f063}")
    }
    
    class func YOmailForward() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f064}")
    }
    
    class func YOexpand() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f065}")
    }
    
    class func YOcompress() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f066}")
    }
    
    class func YOplus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f067}")
    }
    
    class func YOminus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f068}")
    }
    
    class func YOasterisk() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f069}")
    }
    
    class func YOexclamationCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f06a}")
    }
    
    class func YOgift() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f06b}")
    }
    
    class func YOleaf() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f06c}")
    }
    
    class func YOfire() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f06d}")
    }
    
    class func YOeye() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f06e}")
    }
    
    class func YOeyeSlash() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f070}")
    }
    
    class func YOwarning() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f071}")
    }
    
    class func YOplane() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f072}")
    }
    
    class func YOcalendar() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f073}")
    }
    
    class func YOrandom() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f074}")
    }
    
    class func YOcomment() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f075}")
    }
    
    class func YOmagnet() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f076}")
    }
    
    class func YOchevronUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f077}")
    }
    
    class func YOchevronDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f078}")
    }
    
    class func YOretweet() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f079}")
    }
    
    class func YOshoppingCart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f07a}")
    }
    
    class func YOfolder() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f07b}")
    }
    
    class func YOfolderOpen() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f07c}")
    }
    
    class func YOarrowsV() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f07d}")
    }
    
    class func YOarrowsH() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f07e}")
    }
    
    class func YObarChartO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f080}")
    }
    
    class func YOtwitterSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f081}")
    }
    
    class func YOfacebookSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f082}")
    }
    
    class func YOcameraRetro() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f083}")
    }
    
    class func YOkey() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f084}")
    }
    
    class func YOgears() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f085}")
    }
    
    class func YOcomments() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f086}")
    }
    
    class func YOthumbsOUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f087}")
    }
    
    class func YOthumbsODown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f088}")
    }
    
    class func YOstarHalf() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f089}")
    }
    
    class func YOheartO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f08a}")
    }
    
    class func YOsignOut() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f08b}")
    }
    
    class func YOlinkedinSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f08c}")
    }
    
    class func YOthumbTack() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f08d}")
    }
    
    class func YOexternalLink() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f08e}")
    }
    
    class func YOsignIn() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f090}")
    }
    
    class func YOtrophy() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f091}")
    }
    
    class func YOgithubSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f092}")
    }
    
    class func YOupload() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f093}")
    }
    
    class func YOlemonO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f094}")
    }
    
    class func YOphone() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f095}")
    }
    
    class func YOsquareO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f096}")
    }
    
    class func YObookmarkO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f097}")
    }
    
    class func YOphoneSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f098}")
    }
    
    class func YOtwitter() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f099}")
    }
    
    class func YOfacebookF() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f09a}")
    }
    
    class func YOgithub() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f09b}")
    }
    
    class func YOunlock() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f09c}")
    }
    
    class func YOcreditCard() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f09d}")
    }
    
    class func YOfeed() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f09e}")
    }
    
    class func YOhddO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a0}")
    }
    
    class func YObullhorn() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a1}")
    }
    
    class func YObell() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f3}")
    }
    
    class func YOcertificate() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a3}")
    }
    
    class func YOhandORight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a4}")
    }
    
    class func YOhandOLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a5}")
    }
    
    class func YOhandOUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a6}")
    }
    
    class func YOhandODown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a7}")
    }
    
    class func YOarrowCircleLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a8}")
    }
    
    class func YOarrowCircleRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a9}")
    }
    
    class func YOarrowCircleUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0aa}")
    }
    
    class func YOarrowCircleDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ab}")
    }
    
    class func YOglobe() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ac}")
    }
    
    class func YOwrench() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ad}")
    }
    
    class func YOtasks() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ae}")
    }
    
    class func YOfilter() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0b0}")
    }
    
    class func YObriefcase() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0b1}")
    }
    
    class func YOarrowsAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0b2}")
    }
    
    class func YOgroup() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c0}")
    }
    
    class func YOchain() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c1}")
    }
    
    class func YOcloud() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c2}")
    }
    
    class func YOflask() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c3}")
    }
    
    class func YOcut() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c4}")
    }
    
    class func YOcopy() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c5}")
    }
    
    class func YOpaperclip() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c6}")
    }
    
    class func YOsave() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c7}")
    }
    
    class func YOsquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c8}")
    }
    
    class func YOnavicon() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0c9}")
    }
    
    class func YOlistUl() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ca}")
    }
    
    class func YOlistOl() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0cb}")
    }
    
    class func YOstrikethrough() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0cc}")
    }
    
    class func YOunderline() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0cd}")
    }
    
    class func YOtable() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ce}")
    }
    
    class func YOmagic() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d0}")
    }
    
    class func YOtruck() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d1}")
    }
    
    class func YOpinterest() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d2}")
    }
    
    class func YOpinterestSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d3}")
    }
    
    class func YOgooglePlusSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d4}")
    }
    
    class func YOgooglePlus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d5}")
    }
    
    class func YOmoney() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d6}")
    }
    
    class func YOcaretDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d7}")
    }
    
    class func YOcaretUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d8}")
    }
    
    class func YOcaretLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0d9}")
    }
    
    class func YOcaretRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0da}")
    }
    
    class func YOcolumns() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0db}")
    }
    
    class func YOunsorted() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0dc}")
    }
    
    class func YOsortDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0dd}")
    }
    
    class func YOsortUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0de}")
    }
    
    class func YOenvelope() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e0}")
    }
    
    class func YOlinkedin() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e1}")
    }
    
    class func YOrotateLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e2}")
    }
    
    class func YOlegal() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e3}")
    }
    
    class func YOdashboard() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e4}")
    }
    
    class func YOcommentO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e5}")
    }
    
    class func YOcommentsO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e6}")
    }
    
    class func YOflash() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e7}")
    }
    
    class func YOsitemap() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e8}")
    }
    
    class func YOumbrella() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0e9}")
    }
    
    class func YOpaste() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ea}")
    }
    
    class func YOlightbulbO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0eb}")
    }
    
    class func YOexchange() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ec}")
    }
    
    class func YOcloudDownload() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ed}")
    }
    
    class func YOcloudUpload() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0ee}")
    }
    
    class func YOuserMd() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f0}")
    }
    
    class func YOstethoscope() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f1}")
    }
    
    class func YOsuitcase() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f2}")
    }
    
    class func YObellO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0a2}")
    }
    
    class func YOcoffee() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f4}")
    }
    
    class func YOcutlery() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f5}")
    }
    
    class func YOfileTextO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f6}")
    }
    
    class func YObuildingO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f7}")
    }
    
    class func YOhospitalO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f8}")
    }
    
    class func YOambulance() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0f9}")
    }
    
    class func YOmedkit() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0fa}")
    }
    
    class func YOfighterJet() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0fb}")
    }
    
    class func YObeer() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0fc}")
    }
    
    class func YOhSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0fd}")
    }
    
    class func YOplusSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f0fe}")
    }
    
    class func YOangleDoubleLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f100}")
    }
    
    class func YOangleDoubleRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f101}")
    }
    
    class func YOangleDoubleUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f102}")
    }
    
    class func YOangleDoubleDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f103}")
    }
    
    class func YOangleLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f104}")
    }
    
    class func YOangleRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f105}")
    }
    
    class func YOangleUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f106}")
    }
    
    class func YOangleDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f107}")
    }
    
    class func YOdesktop() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f108}")
    }
    
    class func YOlaptop() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f109}")
    }
    
    class func YOtablet() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f10a}")
    }
    
    class func YOmobilePhone() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f10b}")
    }
    
    class func YOcircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f10c}")
    }
    
    class func YOquoteLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f10d}")
    }
    
    class func YOquoteRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f10e}")
    }
    
    class func YOspinner() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f110}")
    }
    
    class func YOcircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f111}")
    }
    
    class func YOmailReply() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f112}")
    }
    
    class func YOgithubAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f113}")
    }
    
    class func YOfolderO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f114}")
    }
    
    class func YOfolderOpenO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f115}")
    }
    
    class func YOsmileO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f118}")
    }
    
    class func YOfrownO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f119}")
    }
    
    class func YOmehO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f11a}")
    }
    
    class func YOgamepad() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f11b}")
    }
    
    class func YOkeyboardO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f11c}")
    }
    
    class func YOflagO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f11d}")
    }
    
    class func YOflagCheckered() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f11e}")
    }
    
    class func YOterminal() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f120}")
    }
    
    class func YOcode() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f121}")
    }
    
    class func YOmailReplyAll() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f122}")
    }
    
    class func YOstarHalfEmpty() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f123}")
    }
    
    class func YOlocationArrow() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f124}")
    }
    
    class func YOcrop() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f125}")
    }
    
    class func YOcodeFork() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f126}")
    }
    
    class func YOunlink() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f127}")
    }
    
    class func YOquestion() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f128}")
    }
    
    class func YOinfo() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f129}")
    }
    
    class func YOexclamation() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f12a}")
    }
    
    class func YOsuperscript() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f12b}")
    }
    
    class func YOsubscript() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f12c}")
    }
    
    class func YOeraser() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f12d}")
    }
    
    class func YOpuzzlePiece() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f12e}")
    }
    
    class func YOmicrophone() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f130}")
    }
    
    class func YOmicrophoneSlash() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f131}")
    }
    
    class func YOshield() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f132}")
    }
    
    class func YOcalendarO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f133}")
    }
    
    class func YOfireExtinguisher() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f134}")
    }
    
    class func YOrocket() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f135}")
    }
    
    class func YOmaxcdn() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f136}")
    }
    
    class func YOchevronCircleLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f137}")
    }
    
    class func YOchevronCircleRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f138}")
    }
    
    class func YOchevronCircleUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f139}")
    }
    
    class func YOchevronCircleDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f13a}")
    }
    
    class func YOhtml5() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f13b}")
    }
    
    class func YOcss3() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f13c}")
    }
    
    class func YOanchor() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f13d}")
    }
    
    class func YOunlockAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f13e}")
    }
    
    class func YObullseye() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f140}")
    }
    
    class func YOellipsisH() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f141}")
    }
    
    class func YOellipsisV() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f142}")
    }
    
    class func YOrssSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f143}")
    }
    
    class func YOplayCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f144}")
    }
    
    class func YOticket() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f145}")
    }
    
    class func YOminusSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f146}")
    }
    
    class func YOminusSquareO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f147}")
    }
    
    class func YOlevelUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f148}")
    }
    
    class func YOlevelDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f149}")
    }
    
    class func YOcheckSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f14a}")
    }
    
    class func YOpencilSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f14b}")
    }
    
    class func YOexternalLinkSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f14c}")
    }
    
    class func YOshareSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f14d}")
    }
    
    class func YOcompass() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f14e}")
    }
    
    class func YOtoggleDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f150}")
    }
    
    class func YOtoggleUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f151}")
    }
    
    class func YOtoggleRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f152}")
    }
    
    class func YOeuro() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f153}")
    }
    
    class func YOgbp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f154}")
    }
    
    class func YOdollar() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f155}")
    }
    
    class func YOrupee() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f156}")
    }
    
    class func YOcny() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f157}")
    }
    
    class func YOruble() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f158}")
    }
    
    class func YOwon() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f159}")
    }
    
    class func YObitcoin() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f15a}")
    }
    
    class func YOfile() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f15b}")
    }
    
    class func YOfileText() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f15c}")
    }
    
    class func YOsortAlphaAsc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f15d}")
    }
    
    class func YOsortAlphaDesc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f15e}")
    }
    
    class func YOsortAmountAsc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f160}")
    }
    
    class func YOsortAmountDesc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f161}")
    }
    
    class func YOsortNumericAsc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f162}")
    }
    
    class func YOsortNumericDesc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f163}")
    }
    
    class func YOthumbsUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f164}")
    }
    
    class func YOthumbsDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f165}")
    }
    
    class func YOyoutubeSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f166}")
    }
    
    class func YOyoutube() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f167}")
    }
    
    class func YOxing() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f168}")
    }
    
    class func YOxingSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f169}")
    }
    
    class func YOyoutubePlay() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f16a}")
    }
    
    class func YOdropbox() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f16b}")
    }
    
    class func YOstackOverflow() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f16c}")
    }
    
    class func YOinstagram() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f16d}")
    }
    
    class func YOflickr() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f16e}")
    }
    
    class func YOadn() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f170}")
    }
    
    class func YObitbucket() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f171}")
    }
    
    class func YObitbucketSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f172}")
    }
    
    class func YOtumblr() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f173}")
    }
    
    class func YOtumblrSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f174}")
    }
    
    class func YOlongArrowDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f175}")
    }
    
    class func YOlongArrowUp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f176}")
    }
    
    class func YOlongArrowLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f177}")
    }
    
    class func YOlongArrowRight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f178}")
    }
    
    class func YOapple() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f179}")
    }
    
    class func YOwindows() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f17a}")
    }
    
    class func YOandroid() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f17b}")
    }
    
    class func YOlinux() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f17c}")
    }
    
    class func YOdribbble() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f17d}")
    }
    
    class func YOskype() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f17e}")
    }
    
    class func YOfoursquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f180}")
    }
    
    class func YOtrello() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f181}")
    }
    
    class func YOfemale() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f182}")
    }
    
    class func YOmale() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f183}")
    }
    
    class func YOgittip() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f184}")
    }
    
    class func YOsunO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f185}")
    }
    
    class func YOmoonO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f186}")
    }
    
    class func YOarchive() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f187}")
    }
    
    class func YObug() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f188}")
    }
    
    class func YOvk() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f189}")
    }
    
    class func YOweibo() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f18a}")
    }
    
    class func YOrenren() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f18b}")
    }
    
    class func YOpagelines() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f18c}")
    }
    
    class func YOstackExchange() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f18d}")
    }
    
    class func YOarrowCircleORight() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f18e}")
    }
    
    class func YOarrowCircleOLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f190}")
    }
    
    class func YOtoggleLeft() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f191}")
    }
    
    class func YOdotCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f192}")
    }
    
    class func YOwheelchair() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f193}")
    }
    
    class func YOvimeoSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f194}")
    }
    
    class func YOturkishLira() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f195}")
    }
    
    class func YOplusSquareO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f196}")
    }
    
    class func YOspaceShuttle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f197}")
    }
    
    class func YOslack() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f198}")
    }
    
    class func YOenvelopeSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f199}")
    }
    
    class func YOwordpress() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f19a}")
    }
    
    class func YOopenid() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f19b}")
    }
    
    class func YOinstitution() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f19c}")
    }
    
    class func YOmortarBoard() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f19d}")
    }
    
    class func YOyahoo() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f19e}")
    }
    
    class func YOgoogle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a0}")
    }
    
    class func YOreddit() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a1}")
    }
    
    class func YOredditSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a2}")
    }
    
    class func YOstumbleuponCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a3}")
    }
    
    class func YOstumbleupon() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a4}")
    }
    
    class func YOdelicious() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a5}")
    }
    
    class func YOdigg() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a6}")
    }
    
    class func YOpiedPiperPp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a7}")
    }
    
    class func YOpiedPiperAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a8}")
    }
    
    class func YOdrupal() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1a9}")
    }
    
    class func YOjoomla() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1aa}")
    }
    
    class func YOlanguage() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ab}")
    }
    
    class func YOfax() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ac}")
    }
    
    class func YObuilding() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ad}")
    }
    
    class func YOchild() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ae}")
    }
    
    class func YOpaw() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b0}")
    }
    
    class func YOspoon() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b1}")
    }
    
    class func YOcube() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b2}")
    }
    
    class func YOcubes() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b3}")
    }
    
    class func YObehance() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b4}")
    }
    
    class func YObehanceSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b5}")
    }
    
    class func YOsteam() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b6}")
    }
    
    class func YOsteamSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b7}")
    }
    
    class func YOrecycle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b8}")
    }
    
    class func YOautomobile() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1b9}")
    }
    
    class func YOcab() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ba}")
    }
    
    class func YOtree() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1bb}")
    }
    
    class func YOspotify() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1bc}")
    }
    
    class func YOdeviantart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1bd}")
    }
    
    class func YOsoundcloud() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1be}")
    }
    
    class func YOdatabase() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c0}")
    }
    
    class func YOfilePdfO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c1}")
    }
    
    class func YOfileWordO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c2}")
    }
    
    class func YOfileExcelO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c3}")
    }
    
    class func YOfilePowerpointO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c4}")
    }
    
    class func YOfilePhotoO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c5}")
    }
    
    class func YOfileZipO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c6}")
    }
    
    class func YOfileSoundO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c7}")
    }
    
    class func YOfileMovieO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c8}")
    }
    
    class func YOfileCodeO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1c9}")
    }
    
    class func YOvine() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ca}")
    }
    
    class func YOcodepen() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1cb}")
    }
    
    class func YOjsfiddle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1cc}")
    }
    
    class func YOlifeBouy() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1cd}")
    }
    
    class func YOcircleONotch() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ce}")
    }
    
    class func YOra() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d0}")
    }
    
    class func YOge() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d1}")
    }
    
    class func YOgitSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d2}")
    }
    
    class func YOgit() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d3}")
    }
    
    class func YOyCombinatorSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d4}")
    }
    
    class func YOtencentWeibo() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d5}")
    }
    
    class func YOqq() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d6}")
    }
    
    class func YOwechat() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d7}")
    }
    
    class func YOsend() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d8}")
    }
    
    class func YOsendO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1d9}")
    }
    
    class func YOhistory() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1da}")
    }
    
    class func YOcircleThin() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1db}")
    }
    
    class func YOheader() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1dc}")
    }
    
    class func YOparagraph() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1dd}")
    }
    
    class func YOsliders() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1de}")
    }
    
    class func YOshareAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e0}")
    }
    
    class func YOshareAltSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e1}")
    }
    
    class func YObomb() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e2}")
    }
    
    class func YOsoccerBallO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e3}")
    }
    
    class func YOtty() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e4}")
    }
    
    class func YObinoculars() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e5}")
    }
    
    class func YOplug() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e6}")
    }
    
    class func YOslideshare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e7}")
    }
    
    class func YOtwitch() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e8}")
    }
    
    class func YOyelp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1e9}")
    }
    
    class func YOnewspaperO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ea}")
    }
    
    class func YOwifi() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1eb}")
    }
    
    class func YOcalculator() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ec}")
    }
    
    class func YOpaypal() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ed}")
    }
    
    class func YOgoogleWallet() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1ee}")
    }
    
    class func YOccVisa() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f0}")
    }
    
    class func YOccMastercard() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f1}")
    }
    
    class func YOccDiscover() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f2}")
    }
    
    class func YOccAmex() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f3}")
    }
    
    class func YOccPaypal() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f4}")
    }
    
    class func YOccStripe() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f5}")
    }
    
    class func YObellSlash() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f6}")
    }
    
    class func YObellSlashO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f7}")
    }
    
    class func YOtrash() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f8}")
    }
    
    class func YOcopyright() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1f9}")
    }
    
    class func YOat() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1fa}")
    }
    
    class func YOeyedropper() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1fb}")
    }
    
    class func YOpaintBrush() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1fc}")
    }
    
    class func YObirthdayCake() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1fd}")
    }
    
    class func YOareaChart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f1fe}")
    }
    
    class func YOpieChart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f200}")
    }
    
    class func YOlineChart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f201}")
    }
    
    class func YOlastfm() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f202}")
    }
    
    class func YOlastfmSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f203}")
    }
    
    class func YOtoggleOff() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f204}")
    }
    
    class func YOtoggleOn() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f205}")
    }
    
    class func YObicycle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f206}")
    }
    
    class func YObus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f207}")
    }
    
    class func YOioxhost() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f208}")
    }
    
    class func YOangellist() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f209}")
    }
    
    class func YOcc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f20a}")
    }
    
    class func YOshekel() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f20b}")
    }
    
    class func YOmeanpath() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f20c}")
    }
    
    class func YObuysellads() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f20d}")
    }
    
    class func YOconnectdevelop() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f20e}")
    }
    
    class func YOdashcube() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f210}")
    }
    
    class func YOforumbee() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f211}")
    }
    
    class func YOleanpub() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f212}")
    }
    
    class func YOsellsy() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f213}")
    }
    
    class func YOshirtsinbulk() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f214}")
    }
    
    class func YOsimplybuilt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f215}")
    }
    
    class func YOskyatlas() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f216}")
    }
    
    class func YOcartPlus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f217}")
    }
    
    class func YOcartArrowDown() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f218}")
    }
    
    class func YOdiamond() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f219}")
    }
    
    class func YOship() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f21a}")
    }
    
    class func YOuserSecret() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f21b}")
    }
    
    class func YOmotorcycle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f21c}")
    }
    
    class func YOstreetView() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f21d}")
    }
    
    class func YOheartbeat() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f21e}")
    }
    
    class func YOvenus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f221}")
    }
    
    class func YOmars() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f222}")
    }
    
    class func YOmercury() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f223}")
    }
    
    class func YOintersex() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f224}")
    }
    
    class func YOtransgenderAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f225}")
    }
    
    class func YOvenusDouble() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f226}")
    }
    
    class func YOmarsDouble() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f227}")
    }
    
    class func YOvenusMars() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f228}")
    }
    
    class func YOmarsStroke() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f229}")
    }
    
    class func YOmarsStrokeV() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f22a}")
    }
    
    class func YOmarsStrokeH() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f22b}")
    }
    
    class func YOneuter() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f22c}")
    }
    
    class func YOgenderless() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f22d}")
    }
    
    class func YOfacebookOfficial() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f230}")
    }
    
    class func YOpinterestP() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f231}")
    }
    
    class func YOwhatsapp() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f232}")
    }
    
    class func YOserver() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f233}")
    }
    
    class func YOuserPlus() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f234}")
    }
    
    class func YOuserTimes() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f235}")
    }
    
    class func YOhotel() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f236}")
    }
    
    class func YOviacoin() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f237}")
    }
    
    class func YOtrain() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f238}")
    }
    
    class func YOsubway() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f239}")
    }
    
    class func YOmedium() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f23a}")
    }
    
    class func YOyc() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f23b}")
    }
    
    class func YOoptinMonster() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f23c}")
    }
    
    class func YOopencart() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f23d}")
    }
    
    class func YOexpeditedssl() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f23e}")
    }
    
    class func YObattery4() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f240}")
    }
    
    class func YObattery3() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f241}")
    }
    
    class func YObattery2() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f242}")
    }
    
    class func YObattery1() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f243}")
    }
    
    class func YObattery0() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f244}")
    }
    
    class func YOmousePointer() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f245}")
    }
    
    class func YOiCursor() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f246}")
    }
    
    class func YOobjectGroup() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f247}")
    }
    
    class func YOobjectUngroup() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f248}")
    }
    
    class func YOstickyNote() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f249}")
    }
    
    class func YOstickyNoteO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f24a}")
    }
    
    class func YOccJcb() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f24b}")
    }
    
    class func YOccDinersClub() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f24c}")
    }
    
    class func YOclone() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f24d}")
    }
    
    class func YObalanceScale() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f24e}")
    }
    
    class func YOhourglassO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f250}")
    }
    
    class func YOhourglass1() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f251}")
    }
    
    class func YOhourglass2() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f252}")
    }
    
    class func YOhourglass3() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f253}")
    }
    
    class func YOhourglass() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f254}")
    }
    
    class func YOhandGrabO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f255}")
    }
    
    class func YOhandStopO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f256}")
    }
    
    class func YOhandScissorsO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f257}")
    }
    
    class func YOhandLizardO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f258}")
    }
    
    class func YOhandSpockO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f259}")
    }
    
    class func YOhandPointerO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f25a}")
    }
    
    class func YOhandPeaceO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f25b}")
    }
    
    class func YOtrademark() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f25c}")
    }
    
    class func YOregistered() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f25d}")
    }
    
    class func YOcreativeCommons() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f25e}")
    }
    
    class func YOgg() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f260}")
    }
    
    class func YOggCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f261}")
    }
    
    class func YOtripadvisor() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f262}")
    }
    
    class func YOodnoklassniki() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f263}")
    }
    
    class func YOodnoklassnikiSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f264}")
    }
    
    class func YOgetPocket() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f265}")
    }
    
    class func YOwikipediaW() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f266}")
    }
    
    class func YOsafari() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f267}")
    }
    
    class func YOchrome() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f268}")
    }
    
    class func YOfirefox() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f269}")
    }
    
    class func YOopera() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f26a}")
    }
    
    class func YOinternetExplorer() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f26b}")
    }
    
    class func YOtv() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f26c}")
    }
    
    class func YOcontao() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f26d}")
    }
    
    class func YO500px() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f26e}")
    }
    
    class func YOamazon() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f270}")
    }
    
    class func YOcalendarPlusO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f271}")
    }
    
    class func YOcalendarMinusO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f272}")
    }
    
    class func YOcalendarTimesO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f273}")
    }
    
    class func YOcalendarCheckO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f274}")
    }
    
    class func YOindustry() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f275}")
    }
    
    class func YOmapPin() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f276}")
    }
    
    class func YOmapSigns() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f277}")
    }
    
    class func YOmapO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f278}")
    }
    
    class func YOmap() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f279}")
    }
    
    class func YOcommenting() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f27a}")
    }
    
    class func YOcommentingO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f27b}")
    }
    
    class func YOhouzz() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f27c}")
    }
    
    class func YOvimeo() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f27d}")
    }
    
    class func YOblackTie() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f27e}")
    }
    
    class func YOfonticons() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f280}")
    }
    
    class func YOredditAlien() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f281}")
    }
    
    class func YOedge() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f282}")
    }
    
    class func YOcreditCardAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f283}")
    }
    
    class func YOcodiepie() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f284}")
    }
    
    class func YOmodx() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f285}")
    }
    
    class func YOfortAwesome() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f286}")
    }
    
    class func YOusb() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f287}")
    }
    
    class func YOproductHunt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f288}")
    }
    
    class func YOmixcloud() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f289}")
    }
    
    class func YOscribd() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f28a}")
    }
    
    class func YOpauseCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f28b}")
    }
    
    class func YOpauseCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f28c}")
    }
    
    class func YOstopCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f28d}")
    }
    
    class func YOstopCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f28e}")
    }
    
    class func YOshoppingBag() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f290}")
    }
    
    class func YOshoppingBasket() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f291}")
    }
    
    class func YOhashtag() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f292}")
    }
    
    class func YObluetooth() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f293}")
    }
    
    class func YObluetoothB() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f294}")
    }
    
    class func YOpercent() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f295}")
    }
    
    class func YOgitlab() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f296}")
    }
    
    class func YOwpbeginner() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f297}")
    }
    
    class func YOwpforms() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f298}")
    }
    
    class func YOenvira() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f299}")
    }
    
    class func YOuniversalAccess() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f29a}")
    }
    
    class func YOwheelchairAlt() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f29b}")
    }
    
    class func YOquestionCircleO() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f29c}")
    }
    
    class func YOblind() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f29d}")
    }
    
    class func YOaudioDescription() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f29e}")
    }
    
    class func YOvolumeControlPhone() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a0}")
    }
    
    class func YObraille() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a1}")
    }
    
    class func YOassistiveListeningSystems() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a2}")
    }
    
    class func YOaslInterpreting() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a3}")
    }
    
    class func YOdeafness() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a4}")
    }
    
    class func YOglide() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a5}")
    }
    
    class func YOglideG() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a6}")
    }
    
    class func YOsigning() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a7}")
    }
    
    class func YOlowVision() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a8}")
    }
    
    class func YOviadeo() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2a9}")
    }
    
    class func YOviadeoSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2aa}")
    }
    
    class func YOsnapchat() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2ab}")
    }
    
    class func YOsnapchatGhost() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2ac}")
    }
    
    class func YOsnapchatSquare() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2ad}")
    }
    
    class func YOpiedPiper() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2ae}")
    }
    
    class func YOfirstOrder() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2b0}")
    }
    
    class func YOyoast() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2b1}")
    }
    
    class func YOthemeisle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2b2}")
    }
    
    class func YOgooglePlusCircle() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2b3}")
    }
    
    class func YOfa() -> NSMutableAttributedString{
        return self.iconStringFromUnicode("\u{f2b4}")
    }
    
    class func iconStringFromUnicode(unicode: String) -> NSMutableAttributedString{
        return NSMutableAttributedString(string: unicode, attributes: [NSFontAttributeName: UIFont(name: "fontawesome", size: 17.0)!])
    }
    
    func iconSize (size: CGFloat) -> NSMutableAttributedString{
        self.addAttribute(NSFontAttributeName, value: UIFont(name: "fontawesome", size: size)!, range: NSRange(location: 0, length: self.length))
        return self
    }

}
