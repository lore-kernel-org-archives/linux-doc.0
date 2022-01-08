Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD98AC433F5
	for <linux-doc@archiver.kernel.org>; Sat,  8 Jan 2022 09:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbiAHJht (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 Jan 2022 04:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiAHJhs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Jan 2022 04:37:48 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DEFC061574
        for <linux-doc@vger.kernel.org>; Sat,  8 Jan 2022 01:37:48 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id c6so21678546ybk.3
        for <linux-doc@vger.kernel.org>; Sat, 08 Jan 2022 01:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ROtlth3Nnngywu7oQeijpbf9df1Y3iJpg34X2Gh4KD0=;
        b=MW0DM428KY+g7MOr4Fl1R9o6v7UuZSyesp6u9kzIhmEMBsyerMGe9Jhgv5fb2oGhCc
         7QbvYzyy+k3Z8ic2KSJ+pbqHrR6m3qw60Ed51pw5j6dvgqRmje0x8cgNS4oC9AyObQKT
         +GexmAfGGseJ7JNIaSI06WFQf3kMQmS2LXhYJAEKYxGqmKEOymPxAi5O9qKkYizWXeHE
         EENawnRI3itpyF1aquHS36d4UwEqHTIb+J+CZXF4vR/yEIXEonfaFNFIFu+faU1vdZ6I
         AsYm051cTDZjbTMJEqUxd9u6+/YA9sQj3lDwbySn18Yof0tl2g2Ma6L9VV+C/KZjSU/x
         GA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ROtlth3Nnngywu7oQeijpbf9df1Y3iJpg34X2Gh4KD0=;
        b=LCmGT28CgyFyp1B3AgluhXlp6DKG8Plxi7s2W3IzQbdTj5EZTvdJOYZuUCofrJdDxM
         APTjEtnd+GmcsXwFTtxtdRjJs3bTSRnlMml3cgahrwrai1TvVxZmKgYKgtHnnxGuElxe
         OB60WXF7yXDU8VZECo45ir0rAnfuSsuBTWv/y+wfSfJbO1+5wuzGX/0egaKrOOOHXog0
         hhxZiWnmkoGaMI2isftSc6uDoxQ2Wvx+AjIO7Q6imQXMVI9KsPHxYbYK/+f3mhfAY3hu
         ktLv8iIbKBHGU3xPPkoimwayxwBqPpPLD9kO8/2HvQR3weVMt+YMXfNSjedru5UQeyHP
         FSyw==
X-Gm-Message-State: AOAM531f9c/jNiOMuHrzuwnoiaIznIkBbsq2hCSJr7CzruDtrlxirifZ
        rJRQszTcSbB3yViPyqJ3FoL66gZPPyD3SCo0aos=
X-Google-Smtp-Source: ABdhPJzXh30ztr1i1KLcBLZ1eVcFNQS1RuHBjsofGnpTVAwFLe67Hjh+Ng354VGtRdozhNTqjGgsjLSUgLpzSQExsJQ=
X-Received: by 2002:a05:6902:1544:: with SMTP id r4mr46443498ybu.572.1641634667513;
 Sat, 08 Jan 2022 01:37:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641522956.git.siyanteng@loongson.cn> <163ebc7052e00f001c5813186899ff42b1c176ab.1641522956.git.siyanteng@loongson.cn>
 <2b2c9418-29df-5087-915b-88051ac1275a@huawei.com>
In-Reply-To: <2b2c9418-29df-5087-915b-88051ac1275a@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sat, 8 Jan 2022 17:37:28 +0800
Message-ID: <CAEensMwEsHnkEF1Bod2zE_Tz7QBURJANEDBoXpNZqpoE-ufj2w@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs_zh_CN: add active_mm translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGFuZyBZaXpob3UgPHRhbmd5aXpob3VAaHVhd2VpLmNvbT4g5LqOMjAyMuW5tDHmnIg35pel5ZGo
5LqUIDE2OjA05YaZ6YGT77yaDQo+DQo+IE9uIDIwMjIvMS83IDEwOjQwLCBZYW50ZW5nIFNpIHdy
b3RlOj4gVHJhbnNsYXRyIC4uLi92bS9hY3RpdmVfbW0ucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4g
PiAtLS0NCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9hY3RpdmVfbW0ucnN0ICAgICAg
IHwgODUgKysrKysrKysrKysrKysrKysrKw0KPiA+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi92bS9pbmRleC5yc3QgfCAgMiArLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDg2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2FjdGl2ZV9tbS5yc3QNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9hY3RpdmVfbW0u
cnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vYWN0aXZlX21tLnJzdA0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zM2Y4MTkz
ZTYxMzUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdm0vYWN0aXZlX21tLnJzdA0KPiA+IEBAIC0wLDAgKzEsODUgQEANCj4gPiAr
Li4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3JpZ2lu
YWw6IERvY3VtZW50YXRpb24vdm0vYWN0aXZlX21tLnJzdA0KPiA+ICsNCj4gPiArOue/u+ivkToN
Cj4gPiArDQo+ID4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiA+ICsNCj4gPiArOuagoeivkToNCj4gPiArDQo+ID4gKw0KPiA+ICs9PT09PT09PT0NCj4g
PiArQWN0aXZlIE1NDQo+ID4gKz09PT09PT09PQ0KPiA+ICsNCj4gPiAr6L+Z5piv5LiA5bCBbGlu
dXjkuYvniLblm57lpI3lvIDlj5HogIXnmoTkuIDlsIHpgq7ku7bvvIzmiYDku6Xnv7vor5Hml7bm
iJHlsL3ph4/kv53mjIHpgq7ku7bmoLzlvI/nmoTlrozmlbTjgIINCj4gPiArDQo+ID4gKzo6DQo+
ID4gKw0KPiA+ICsgTGlzdDogICAgICAgbGludXgta2VybmVsDQo+ID4gKyBTdWJqZWN0OiAgICBS
ZTogYWN0aXZlX21tDQo+ID4gKyBGcm9tOiAgICAgICBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHMg
KCkgdHJhbnNtZXRhICEgY29tPg0KPiA+ICsgRGF0ZTogICAgICAgMTk5OS0wNy0zMCAyMTozNjoy
NA0KPiA+ICsNCj4gPiArIOWboOS4uuaIkeW5tuS4jee7j+W4uOWGmeino+mHiu+8jOaJgOS7peW3
sue7j+aKhOmAgeWIsGxpbnV4LWtlcm5lbOmCruS7tuWIl+ihqO+8jOiAjOW9k+aIkeWBmui/meS6
m++8jA0KPiA+ICsg5LiU5pu05aSa55qE5Lq65Zyo6ZiF6K+75a6D5Lus5pe277yM5oiR6KeJ5b6X
5qOS5p6B5LqG44CCDQo+ID4gKw0KPiA+ICsgMTk5OeW5tDfmnIgzMOaXpSDmmJ/mnJ/kupTvvIwg
RGF2aWQgTW9zYmVyZ2VyIOWGmemBk++8mg0KPiA+ICsgPg0KPiA+ICsgPiDmmK/lkKbmnInkuIDk
uKrnroDnn63nmoTmj4/ov7DvvIzor7TmmI50YXNrX3N0cnVjdOS4reeahA0KPiA+ICsgPiAgIm1t
IiDlkowgImFjdGl2ZV9tbSLlupTor6XlpoLkvZXkvb/nlKjvvJ8gKOWmguaenA0KPiA+ICsgPiDo
v5nkuKrpl67popjlnKjpgq7ku7bliJfooajkuK3orqjorrrov4fvvIzmiJHooajnpLrmrYnmhI8t
LeaIkeWImg0KPiA+ICsgPiDliJrluqblgYflm57mnaXvvIzmnInkuIDmrrXml7bpl7TmsqHog73l
hbPms6hsaW51eC1rZXJuZWzkuobvvInjgIINCj4gPiArDQo+ID4gKyDln7rmnKzkuIrvvIzmlrDn
moTorr7lrprmmK/vvJoNCj4gPiArDQo+ID4gKyAgLSDmiJHku6zmnInigJznnJ/lrp7lnLDlnYDn
qbrpl7TigJ3lkozigJzljL/lkI3lnLDlnYDnqbrpl7TigJ3jgILljLrliKvlnKjkuo7vvIzljL/l
kI3lnLDlnYDnqbrpl7TmoLnmnKzkuI3lhbPlv4PnlKgNCj4gPiArICAgIOaIt+e6p+mhteihqO+8
jOaJgOS7peW9k+aIkeS7rOWBmuS4iuS4i+aWh+WIh+aNouWIsOWMv+WQjeWcsOWdgOepuumXtOaX
tu+8jOaIkeS7rOWPquaYr+iuqeS7peWJjeeahOWcsOWdgOepuumXtA0KPiA+ICsgICAg5aSE5LqO
5rS75Yqo54q25oCB44CCDQo+ID4gKw0KPiA+ICsgICAg5LiA5Liq4oCc5Yy/5ZCN5Zyw5Z2A56m6
6Ze04oCd55qE5piO5pi+55So6YCU5piv5Lu75L2V5LiN6ZyA6KaB5Lu75L2V55So5oi35pig5bCE
55qE57q/56iLLS3miYDmnInnmoTlhoXmoLjnur8NCj4gPiArICAgIOeoi+WfuuacrOS4iumDveWx
nuS6jui/meS4gOexu++8jOS9huWNs+S9v+aYr+KAnOecn+ato+eahOKAnee6v+eoi+S5n+WPr+S7
peaaguaXtuivtOWcqOS4gOWumuaXtumXtOWGheWug+S7rOS4jQ0KPiA+ICsgICAg5Lya5a+555So
5oi356m66Ze05oSf5YW06Laj77yM6LCD5bqm5Zmo5LiN5aao6K+V552A6YG/5YWN5Zyo5YiH5o2i
Vk3nirbmgIHkuIrmtarotLnml7bpl7TjgILnm67liY3lj6rmnInogIENCj4gPiArICAgIOW8j+ea
hGJkZmx1c2ggc3luY+iDveWBmuWIsOi/meS4gOeCueOAgg0KPiA+ICsNCj4gPiArICAtIOKAnHRz
ay0+bW3igJ0g5oyH5ZCRIOKAnOecn+WunuWcsOWdgOepuumXtOKAneOAguWvueS6juS4gOS4quWM
v+WQjei/m+eoi+adpeivtO+8jHRzay0+bW3lsIbmmK9OVUxM77yMDQo+ID4gKyAgICDlhbbpgLvo
vpHljp/lm6DmmK/ljL/lkI3ov5vnqIvlrp7pmYXkuIrmoLnmnKzlsLEg4oCc5rKh5pyJ4oCdIOec
n+ato+eahOWcsOWdgOepuumXtOOAgg0KPiA+ICsNCj4gPiArICAtIOeEtuiAjO+8jOaIkeS7rOaY
vueEtumcgOimgei3n+i4quaIkeS7rOS4uui/meagt+eahOWMv+WQjeeUqOaIt+KAnOWBt+eUqOKA
neS6huWTquS4quWcsOWdgOepuumXtOOAguS4uuatpO+8jOaIkeS7rA0KPiA+ICsgICAg5pyJIOKA
nHRzay0+YWN0aXZlX21t4oCd77yM5a6D5pi+56S65LqG5b2T5YmN5rS75Yqo55qE5Zyw5Z2A56m6
6Ze05piv5LuA5LmI44CCDQo+ID4gKw0KPiA+ICsgICAg6KeE5YiZ5piv77yM5a+55LqO5LiA5Liq
5pyJ55yf5a6e5Zyw5Z2A56m66Ze055qE6L+b56iL77yI5Y2zdHNrLT5tbeaYryBub24tTlVMTO+8
ie+8jGFjdGl2ZV9tbQ0KPiA+ICsgICAg5pi+54S25b+F6aG75LiOcmVhbG9uZeebuOWQjOOAgg0K
Pg0KPiBwbGVhc2UgdHJhbnNsYXRlOiByZWFsb25lDQpPSywgcmVhbG9uZSAtPiDnnJ/lrp7lnLDl
nYANCj4NCj4gPiArDQo+ID4gKyAgICDlr7nkuo7kuIDkuKrljL/lkI3ov5vnqIvvvIx0c2stPm1t
ID09IE5VTEzvvIzogIx0c2stPmFjdGl2ZV9tbeaYr+WMv+WQjei/m+eoi+i/kOihjOaXtg0KPiA+
ICsgICAg4oCc5YCf55So4oCd55qEbW3jgILlvZPljL/lkI3ov5vnqIvooqvosIPluqbotbDml7bv
vIzlgJ/nlKjnmoTlnLDlnYDnqbrpl7Tooqvov5Tlm57lubbmuIXpmaTjgIINCj4gPiArDQo+ID4g
KyDkuLrkuobmlK/mjIHmiYDmnInov5nkupvvvIzigJxzdHJ1Y3QgbW1fc3RydWN04oCd546w5Zyo
5pyJ5Lik5Liq6K6h5pWw5Zmo77ya5LiA5Liq5pivIOKAnG1tX3VzZXJz4oCdDQo+ID4gKyDorqHm
lbDlmajvvIzljbPmnInlpJrlsJEg4oCc55yf5q2j55qE5Zyw5Z2A56m66Ze055So5oi34oCd77yM
5Y+m5LiA5Liq5pivIOKAnG1tX2NvdW504oCd6K6h5pWw5Zmo77yM5Y2zIOKAnGxhennigJ0NCj4g
PiArIOeUqOaIt++8iOWNs+WMv+WQjeeUqOaIt++8ieeahOaVsOmHj++8jOWmguaenOacieS7u+S9
leecn+ato+eahOeUqOaIt++8jOWImeWKoDHjgIINCj4gPiArDQo+ID4gKyDpgJrluLjmg4XlhrXk
uIvvvIzoh7PlsJHmnInkuIDkuKrnnJ/mraPnmoTnlKjmiLfvvIzkvYbkuZ/lj6/og73mmK/nnJ/m
raPnmoTnlKjmiLflnKjlj6bkuIDkuKpDUFXkuIrpgIDlh7rvvIzogIwNCj4gPiArIOS4gOS4qmxh
ennnmoTnlKjmiLfku43lnKjmtLvliqjvvIzmiYDku6XkvaDlrp7pmYXkuIrlvpfliLDnmoTmg4Xl
hrXmmK/vvIzkvaDmnInkuIDkuKrlnLDlnYDnqbrpl7QgKirlj6oqKg0KPiA+ICsg6KKrbGF6eeea
hOeUqOaIt+S9v+eUqOOAgui/memAmuW4uOaYr+S4gOS4quefreaagueahOeUn+WRveWRqOacn+eK
tuaAge+8jOWboOS4uuS4gOaXpui/meS4que6v+eoi+iiq+WuieaOkue7meS4gA0KPiA+ICsg5Liq
55yf5q2j55qE57q/56iL77yM6L+Z5LiqIOKAnOWDteWwuOKAnSBtbeWwseS8muiiq+mHiuaUvu+8
jOWboOS4uiDigJxtbV9jb3VudOKAneWPmOaIkOS6humbtuOAgg0KPiA+ICsNCj4gPiArIOWPpuWk
lu+8jOS4gOS4quaWsOeahOinhOWImeaYr++8jCoq5rKh5pyJ5Lq6Kiog5YaN5oqKIOKAnGluaXRf
bW3igJ0g5L2c5Li65LiA5Liq55yf5q2j55qETU3kuobjgIINCj4gPiArIOKAnGluaXRfbW3igJ3l
upTor6XooqvorqTkuLrlj6rmmK/kuIDkuKog4oCc5rKh5pyJ5YW25LuW5LiK5LiL5paH5pe255qE
bGF6eeS4iuS4i+aWh+KAne+8jOS6i+WunuS4iu+8jOWug+S4uw0KPiA+ICsg6KaB5piv5Zyo5ZCv
5Yqo5pe25L2/55So77yM5b2T5pe26L+Y5rKh5pyJ55yf5q2j55qEVk3ooqvliJvlu7rjgILlm6Dm
raTvvIznlKjmnaXmo4Dmn6XnmoTku6PnoIENCj4gPiArDQo+ID4gKyAgIGlmIChjdXJyZW50LT5t
bSA9PSAmaW5pdF9tbSkNCj4gPiArDQo+ID4gKyDkuIDoiKzmnaXor7TvvIzlupTor6Xku4Xmiafo
oYwNCj4gPiArDQo+ID4gKyAgIGlmICghY3VycmVudC0+bW0pDQo+ID4gKw0KPiA+ICsg5Y+N5LmL
77yI6L+Z5pu05pyJ5oSP5LmJLS3mtYvor5Xln7rmnKzkuIrmmK8g4oCc5oiR5Lus5piv5ZCm5pyJ
5LiA5Liq55So5oi3546v5aKD4oCd77yM5bm25LiU6YCa5bi455Sx57y66aG1DQo+DQo+IOi/memH
jOeahOe/u+ivkeaciemXrumimOOAguWOn+aWh+aYr2N1cnJlbnQtPm1tID09ICZpbml0X21t55qE
5YaZ5rOV6YCa5bi45bqU5b2T5pu/5o2i5oiQIWN1cnJlbnQtPm1tDQpob3cgYWJvdXQ6DQoNCuS4
gOiIrOadpeivtO+8jOW6lOivpeeUqA0KDQppZiAoIWN1cnJlbnQtPm1tKQ0KDQrlj5bku6Pku6Xk
uIrkuIrpnaLnmoTlhpnms5XvvIjov5nmm7TmnInmhI/kuYktLea1i+ivleWfuuacrOS4iuaYryDi
gJzmiJHku6zmmK/lkKbmnInkuIDkuKrnlKjmiLfnjq/looPigJ3vvIzlubbkuJTpgJrluLjnlLHn
vLrpobUNCg0KDQo+DQo+DQo+ID4gKyDlvILluLjlpITnkIbnqIvluo/lkoznsbvkvLznmoTkuJzo
pb/mnaXlrozmiJDvvInjgIINCj4gPiArDQo+ID4gKyDmgLvkuYvvvIzmiJHliJrmiY3lnKhmdHAu
a2VybmVsLm9yZ+S4iuaUvuS6huS4gOS4qnByZS1wYXRjaC0yLjMuMTMtMe+8jOWboOS4uuWug+eo
jeW+ruaUuQ0KPiA+ICsg5Y+Y5LqG5o6l5Y+j5Lul6YCC5bqUYWxwaGHvvIjosIHkvJrmg7PliLDl
kaLvvIzkvYZhbHBoYeWunumZheS4iuacgOe7iOacieS4gOS4quacgOmavueci+eahOS4iuS4i+aW
h+WIh+aNog0KPg0KPiDpgILlupQgLT4g6YCC6YWN44CCIGFscGhhIC0+IGFscGFo5L2T57O757uT
5p6EDQo+IOWunumZheS4iuacgOe7iOacieS4gOS4quacgOmavueci+eahOS4iuS4i+aWh+WIh+aN
ouS7o+eggSAtPiDkuIrkuIvmlofliIfmjaLku6PnoIHlrp7pmYXkuIrmnIDnu4jmmK/mnIDkuJHp
mYvnmoTkuYvkuIDjgIINCk9LLCBUaGFua3MhDQo+DQo+ID4gKyDku6PnoIEtLeS4jeWDj+WFtuS7
luaetuaehOeahE1N5ZKM5a+E5a2Y5Zmo54q25oCB5piv5YiG5byA55qE77yMYWxwaGHnmoRQQUxj
b2Rl5bCG5Lik6ICF6L+e5o6l6LW35p2l77yMDQo+ID4gKyDkvaDpnIDopoHlkIzml7bliIfmjaLk
uKTogIXvvInjgIINCj4gPiArDQo+ID4gKyAo5paH5qGj5p2l5rqQIGh0dHA6Ly9tYXJjLmluZm8v
P2w9bGludXgta2VybmVsJm09OTMzMzcyNzg2MDIyMTEmdz0yKQ0KPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiBpbmRleCAwZmRhNDBjNjAy
YWMuLjVmY2RiNzVkODY4MiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiBAQCAtMjEsOSArMjEsOSBAQCBUT0RPOuW+heW8
leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWkhO+8iQ0K
PiA+ICAuLiB0b2N0cmVlOjoNCj4gPiAgICAgOm1heGRlcHRoOiAxDQo+ID4NCj4gPiArICAgYWN0
aXZlX21tDQo+ID4NCj4gPiAgVE9ET0xJU1Q6DQo+ID4gLSogYWN0aXZlX21tDQo+ID4gICogYXJj
aF9wZ3RhYmxlX2hlbHBlcnMNCj4gPiAgKiBiYWxhbmNlDQo+ID4gICogZGFtb24vaW5kZXgNCj4g
Pg0KPg0KPiBUaGFua3MsDQo+IFRhbmcNCg==
