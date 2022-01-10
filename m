Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3341BC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 03:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237153AbiAJDJ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 22:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbiAJDJ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 22:09:26 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96572C06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 19:09:26 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id s6so15807063ioj.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 19:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jTVOpbgriQfiYq3Ci9BzLyeyb1M3o0p2BWj1xgm7U2w=;
        b=YJLWrw4Ka0XkAoqTa1c21fi6V/0ljnjJnG2VYbq/aOAMmpvNfPP/28/RD/YWk+PfjN
         26ThC4D2PBH6EZFKROUPRTtWfIgX71U6L1jIorIZCloZT4N8JOeEvTY62LdEXiIby/h+
         RoGoMdu9V1PUulPnGgZEhRp4ZFC9itWYwRaXxW9pI3kNMednoLVymulj7CIU6XOLtC9g
         Cc5O7ZdeAjg/6HxnthfeHJNSHFBsRYp13CkEGqLhguXxbz35Vr04IJRVZJB8j11yjTLh
         f9blXpQj4vgakDkPTIt8oSt2yUt2wW1nCOHsc2c9XKea5vQWkiGItIYw38J7mOCPrqBt
         gxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jTVOpbgriQfiYq3Ci9BzLyeyb1M3o0p2BWj1xgm7U2w=;
        b=KP8UmahTfWRpJJvMDHV5QJMVxODcswhPggPFtccDt9GEG2ZlASW3mTmZf8FZmsaqSj
         j8KbqObH4StGDvkHtp80m7tjSbaCEfpR6/zwt2LFSK37Lk6uWxwnXEWKR2Xy9pZJ4590
         rZUdwkFf4rWwxOEvKdoHGECmPn1xHNplHPrXA9PkQWyB3wTOusSR9n0Z+zVxbNAdvvxI
         hOpSBP9v87qzeOQUD6QsOISMr+dnTJhkPRlqLE3o5Aw1DAydih883gbd2DCHsey4C/Zr
         rD9yZCygvFruXRFc1vG4n94t1thxLKlqpgwWVHVuezOhmL3Xw0O0lqL2nVCEsbUGCQYp
         q7nw==
X-Gm-Message-State: AOAM531jynpg2do0WuKWQJGNPqf85U0nh2opVlU215KyK5vmY58L3CoL
        x3VJFwdUHy8LHNmIuXM13hZV6WXLi3n8c20mfw8=
X-Google-Smtp-Source: ABdhPJwFSt3ZwAWP0sXfy9WycVbXg6TTVRnhGSeOGNiNzhzYz515/palfWbJsMytFg71PMvyYWb2yo/y/zUky0LAg18=
X-Received: by 2002:a02:bb8f:: with SMTP id g15mr35661718jan.40.1641784165840;
 Sun, 09 Jan 2022 19:09:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641782124.git.siyanteng@loongson.cn> <a90be6b9c444c1df921496f430005d3ca6b679ce.1641782124.git.siyanteng@loongson.cn>
In-Reply-To: <a90be6b9c444c1df921496f430005d3ca6b679ce.1641782124.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 10 Jan 2022 11:08:49 +0800
Message-ID: <CAJy-Amm7HbiF30Y8D4gmxvoWm69Wu7bJfTYCEo1O3QrewVxhLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs_zh_CN: add active_mm translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gTW9uLCBKYW4gMTAsIDIwMjIgYXQgMTA6NDQgQU0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFA
Z21haWwuY29tPiB3cm90ZToNCj4NCj4gRnJvbTogWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21h
aWwuY29tPg0KPg0KPiBUcmFuc2xhdHIgLi4uL3ZtL2FjdGl2ZV9tbS5yc3QgaW50byBDaGluZXNl
Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+
DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0KPiAtLS0NCj4g
IC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdm0vYWN0aXZlX21tLnJzdCAgICAgICB8IDg1ICsrKysr
KysrKysrKysrKysrKysNCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2lu
ZGV4LnJzdCB8ICAyICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9hY3RpdmVfbW0ucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9hY3RpdmVfbW0ucnN0IGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vdm0vYWN0aXZlX21tLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjM2NjYwOWVhNGYzNw0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2FjdGl2ZV9tbS5yc3QN
Cj4gQEAgLTAsMCArMSw4NSBAQA0KPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04u
cnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi92bS9hY3RpdmVfbW0ucnN0DQo+
ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5n
QGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PT09PQ0K
PiArQWN0aXZlIE1NDQo+ICs9PT09PT09PT0NCj4gKw0KPiAr6L+Z5piv5LiA5bCBbGludXjkuYvn
iLblm57lpI3lvIDlj5HogIXnmoTkuIDlsIHpgq7ku7bvvIzmiYDku6Xnv7vor5Hml7bmiJHlsL3p
h4/kv53mjIHpgq7ku7bmoLzlvI/nmoTlrozmlbTjgIINCj4gKw0KPiArOjoNCj4gKw0KPiArIExp
c3Q6ICAgICAgIGxpbnV4LWtlcm5lbA0KPiArIFN1YmplY3Q6ICAgIFJlOiBhY3RpdmVfbW0NCj4g
KyBGcm9tOiAgICAgICBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHMgKCkgdHJhbnNtZXRhICEgY29t
Pg0KPiArIERhdGU6ICAgICAgIDE5OTktMDctMzAgMjE6MzY6MjQNCj4gKw0KPiArIOWboOS4uuaI
keW5tuS4jee7j+W4uOWGmeino+mHiu+8jOaJgOS7peW3sue7j+aKhOmAgeWIsGxpbnV4LWtlcm5l
bOmCruS7tuWIl+ihqO+8jOiAjOW9k+aIkeWBmui/meS6m++8jA0KPiArIOS4lOabtOWkmueahOS6
uuWcqOmYheivu+Wug+S7rOaXtu+8jOaIkeinieW+l+ajkuaegeS6huOAgg0KPiArDQo+ICsgMTk5
OeW5tDfmnIgzMOaXpSDmmJ/mnJ/kupTvvIwgRGF2aWQgTW9zYmVyZ2VyIOWGmemBk++8mg0KPiAr
ID4NCj4gKyA+IOaYr+WQpuacieS4gOS4queugOefreeahOaPj+i/sO+8jOivtOaYjnRhc2tfc3Ry
dWN05Lit55qEDQo+ICsgPiAgIm1tIiDlkowgImFjdGl2ZV9tbSLlupTor6XlpoLkvZXkvb/nlKjv
vJ8gKOWmguaenA0KPiArID4g6L+Z5Liq6Zeu6aKY5Zyo6YKu5Lu25YiX6KGo5Lit6K6o6K666L+H
77yM5oiR6KGo56S65q2J5oSPLS3miJHliJoNCj4gKyA+IOWImuW6puWBh+Wbnuadpe+8jOacieS4
gOauteaXtumXtOayoeiDveWFs+azqGxpbnV4LWtlcm5lbOS6hu+8ieOAgg0KPiArDQo+ICsg5Z+6
5pys5LiK77yM5paw55qE6K6+5a6a5piv77yaDQo+ICsNCj4gKyAgLSDmiJHku6zmnInigJznnJ/l
rp7lnLDlnYDnqbrpl7TigJ3lkozigJzljL/lkI3lnLDlnYDnqbrpl7TigJ3jgILljLrliKvlnKjk
uo7vvIzljL/lkI3lnLDlnYDnqbrpl7TmoLnmnKzkuI3lhbPlv4PnlKgNCj4gKyAgICDmiLfnuqfp
obXooajvvIzmiYDku6XlvZPmiJHku6zlgZrkuIrkuIvmlofliIfmjaLliLDljL/lkI3lnLDlnYDn
qbrpl7Tml7bvvIzmiJHku6zlj6rmmK/orqnku6XliY3nmoTlnLDlnYDnqbrpl7QNCj4gKyAgICDl
pITkuo7mtLvliqjnirbmgIHjgIINCj4gKw0KPiArICAgIOS4gOS4quKAnOWMv+WQjeWcsOWdgOep
uumXtOKAneeahOaYjuaYvueUqOmAlOaYr+S7u+S9leS4jemcgOimgeS7u+S9leeUqOaIt+aYoOWw
hOeahOe6v+eoiy0t5omA5pyJ55qE5YaF5qC457q/DQo+ICsgICAg56iL5Z+65pys5LiK6YO95bGe
5LqO6L+Z5LiA57G777yM5L2G5Y2z5L2/5piv4oCc55yf5q2j55qE4oCd57q/56iL5Lmf5Y+v5Lul
5pqC5pe26K+05Zyo5LiA5a6a5pe26Ze05YaF5a6D5Lus5LiNDQo+ICsgICAg5Lya5a+555So5oi3
56m66Ze05oSf5YW06Laj77yM6LCD5bqm5Zmo5LiN5aao6K+V552A6YG/5YWN5Zyo5YiH5o2iVk3n
irbmgIHkuIrmtarotLnml7bpl7TjgILnm67liY3lj6rmnInogIENCj4gKyAgICDlvI/nmoRiZGZs
dXNoIHN5bmPog73lgZrliLDov5nkuIDngrnjgIINCj4gKw0KPiArICAtIOKAnHRzay0+bW3igJ0g
5oyH5ZCRIOKAnOecn+WunuWcsOWdgOepuumXtOKAneOAguWvueS6juS4gOS4quWMv+WQjei/m+eo
i+adpeivtO+8jHRzay0+bW3lsIbmmK9OVUxM77yMDQo+ICsgICAg5YW26YC76L6R5Y6f5Zug5piv
5Yy/5ZCN6L+b56iL5a6e6ZmF5LiK5qC55pys5bCxIOKAnOayoeacieKAnSDnnJ/mraPnmoTlnLDl
nYDnqbrpl7TjgIINCj4gKw0KPiArICAtIOeEtuiAjO+8jOaIkeS7rOaYvueEtumcgOimgei3n+i4
quaIkeS7rOS4uui/meagt+eahOWMv+WQjeeUqOaIt+KAnOWBt+eUqOKAneS6huWTquS4quWcsOWd
gOepuumXtOOAguS4uuatpO+8jOaIkeS7rA0KPiArICAgIOaciSDigJx0c2stPmFjdGl2ZV9tbeKA
ne+8jOWug+aYvuekuuS6huW9k+WJjea0u+WKqOeahOWcsOWdgOepuumXtOaYr+S7gOS5iOOAgg0K
PiArDQo+ICsgICAg6KeE5YiZ5piv77yM5a+55LqO5LiA5Liq5pyJ55yf5a6e5Zyw5Z2A56m66Ze0
55qE6L+b56iL77yI5Y2zdHNrLT5tbeaYryBub24tTlVMTO+8ie+8jGFjdGl2ZV9tbQ0KPiArICAg
IOaYvueEtuW/hemhu+S4juecn+WunueahG1t55u45ZCM44CCDQo+ICsNCj4gKyAgICDlr7nkuo7k
uIDkuKrljL/lkI3ov5vnqIvvvIx0c2stPm1tID09IE5VTEzvvIzogIx0c2stPmFjdGl2ZV9tbeaY
r+WMv+WQjei/m+eoi+i/kOihjOaXtg0KPiArICAgIOKAnOWAn+eUqOKAneeahG1t44CC5b2T5Yy/
5ZCN6L+b56iL6KKr6LCD5bqm6LWw5pe277yM5YCf55So55qE5Zyw5Z2A56m66Ze06KKr6L+U5Zue
5bm25riF6Zmk44CCDQo+ICsNCj4gKyDkuLrkuobmlK/mjIHmiYDmnInov5nkupvvvIzigJxzdHJ1
Y3QgbW1fc3RydWN04oCd546w5Zyo5pyJ5Lik5Liq6K6h5pWw5Zmo77ya5LiA5Liq5pivIOKAnG1t
X3VzZXJz4oCdDQo+ICsg6K6h5pWw5Zmo77yM5Y2z5pyJ5aSa5bCRIOKAnOecn+ato+eahOWcsOWd
gOepuumXtOeUqOaIt+KAne+8jOWPpuS4gOS4quaYryDigJxtbV9jb3VudOKAneiuoeaVsOWZqO+8
jOWNsyDigJxsYXp54oCdDQo+ICsg55So5oi377yI5Y2z5Yy/5ZCN55So5oi377yJ55qE5pWw6YeP
77yM5aaC5p6c5pyJ5Lu75L2V55yf5q2j55qE55So5oi377yM5YiZ5YqgMeOAgg0KPiArDQo+ICsg
6YCa5bi45oOF5Ya15LiL77yM6Iez5bCR5pyJ5LiA5Liq55yf5q2j55qE55So5oi377yM5L2G5Lmf
5Y+v6IO95piv55yf5q2j55qE55So5oi35Zyo5Y+m5LiA5LiqQ1BV5LiK6YCA5Ye677yM6ICMDQo+
ICsg5LiA5LiqbGF6eeeahOeUqOaIt+S7jeWcqOa0u+WKqO+8jOaJgOS7peS9oOWunumZheS4iuW+
l+WIsOeahOaDheWGteaYr++8jOS9oOacieS4gOS4quWcsOWdgOepuumXtCAqKuWPqioqDQo+ICsg
6KKrbGF6eeeahOeUqOaIt+S9v+eUqOOAgui/memAmuW4uOaYr+S4gOS4quefreaagueahOeUn+WR
veWRqOacn+eKtuaAge+8jOWboOS4uuS4gOaXpui/meS4que6v+eoi+iiq+WuieaOkue7meS4gA0K
PiArIOS4quecn+ato+eahOe6v+eoi++8jOi/meS4qiDigJzlg7XlsLjigJ0gbW3lsLHkvJrooqvp
h4rmlL7vvIzlm6DkuLog4oCcbW1fY291bnTigJ3lj5jmiJDkuobpm7bjgIINCj4gKw0KPiArIOWP
puWklu+8jOS4gOS4quaWsOeahOinhOWImeaYr++8jCoq5rKh5pyJ5Lq6Kiog5YaN5oqKIOKAnGlu
aXRfbW3igJ0g5L2c5Li65LiA5Liq55yf5q2j55qETU3kuobjgIINCj4gKyDigJxpbml0X21t4oCd
5bqU6K+l6KKr6K6k5Li65Y+q5piv5LiA5LiqIOKAnOayoeacieWFtuS7luS4iuS4i+aWh+aXtuea
hGxhennkuIrkuIvmlofigJ3vvIzkuovlrp7kuIrvvIzlroPkuLsNCj4gKyDopoHmmK/lnKjlkK/l
iqjml7bkvb/nlKjvvIzlvZPml7bov5jmsqHmnInnnJ/mraPnmoRWTeiiq+WIm+W7uuOAguWboOat
pO+8jOeUqOadpeajgOafpeeahOS7o+eggQ0KPiArDQo+ICsgICBpZiAoY3VycmVudC0+bW0gPT0g
JmluaXRfbW0pDQo+ICsNCj4gKyDkuIDoiKzmnaXor7TvvIzlupTor6XnlKgNCj4gKw0KPiArICAg
aWYgKCFjdXJyZW50LT5tbSkNCj4gKw0KPiArIOWPluS7o+S4iumdoueahOWGmeazle+8iOi/meab
tOacieaEj+S5iS0t5rWL6K+V5Z+65pys5LiK5pivIOKAnOaIkeS7rOaYr+WQpuacieS4gOS4queU
qOaIt+eOr+Wig+KAne+8jOW5tuS4lOmAmuW4uA0KPiArIOeUsee8uumhteW8guW4uOWkhOeQhueo
i+W6j+WSjOexu+S8vOeahOS4nOilv+adpeWujOaIkO+8ieOAgg0KPiArDQo+ICsg5oC75LmL77yM
5oiR5Yia5omN5ZyoZnRwLmtlcm5lbC5vcmfkuIrmlL7kuobkuIDkuKpwcmUtcGF0Y2gtMi4zLjEz
LTHvvIzlm6DkuLrlroPnqI3lvq7mlLkNCj4gKyDlj5jkuobmjqXlj6Pku6XpgILphY1hbHBoYe+8
iOiwgeS8muaDs+WIsOWRou+8jOS9hmFscGhh5L2T57O757uT5p6E5LiK5LiL5paH5YiH5o2i5Luj
56CB5a6e6ZmF5LiK5pyA57uI5pivDQo+ICsg5pyA5LiR6ZmL55qE5LmL5LiALS3kuI3lg4/lhbbk
u5bmnrbmnoTnmoRNTeWSjOWvhOWtmOWZqOeKtuaAgeaYr+WIhuW8gOeahO+8jGFscGhh55qEUEFM
Y29kZeWwhuS4pOiAhQ0KPiArIOi/nuaOpei1t+adpe+8jOS9oOmcgOimgeWQjOaXtuWIh+aNouS4
pOiAhe+8ieOAgg0KPiArDQo+ICsgKOaWh+aho+adpea6kCBodHRwOi8vbWFyYy5pbmZvLz9sPWxp
bnV4LWtlcm5lbCZtPTkzMzM3Mjc4NjAyMjExJnc9MikNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBpbmRleCAwZmRhNDBjNjAyYWMuLjVmY2Ri
NzVkODY4MiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dm0vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Zt
L2luZGV4LnJzdA0KPiBAQCAtMjEsOSArMjEsOSBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuii
q+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWkhO+8iQ0KPiAgLi4gdG9jdHJlZTo6
DQo+ICAgICA6bWF4ZGVwdGg6IDENCj4NCj4gKyAgIGFjdGl2ZV9tbQ0KPg0KPiAgVE9ET0xJU1Q6
DQo+IC0qIGFjdGl2ZV9tbQ0KPiAgKiBhcmNoX3BndGFibGVfaGVscGVycw0KPiAgKiBiYWxhbmNl
DQo+ICAqIGRhbW9uL2luZGV4DQo+IC0tDQo+IDIuMjcuMA0KPg0K
