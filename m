Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDC0C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 14 Nov 2021 03:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D593361029
	for <linux-doc@archiver.kernel.org>; Sun, 14 Nov 2021 03:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhKND63 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Nov 2021 22:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbhKND63 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Nov 2021 22:58:29 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E283C061714
        for <linux-doc@vger.kernel.org>; Sat, 13 Nov 2021 19:55:36 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id i12so12845405ila.12
        for <linux-doc@vger.kernel.org>; Sat, 13 Nov 2021 19:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=StfPuhGS1kv1GqaAEdWuNUZKw3JdTFJGsJMv0i38nX4=;
        b=YFxuki4jTFOq4hZPJ314ELwzElLBXp9il3nPWZHQiPcFznzwCGB4XiMX7a4xsoxG7O
         bUrbiYAKhdNF/1YdUx4zJZgXf6cY4q/E0G2pNJpVxIHSIUk9bKUL34GWrRTdalcVVjZc
         3hj35OjmUSIFR9IgljKX2Mcj3nqBP37wkI36lndah+xUVwfxqo8IaTMIuBAn2aC4DXQE
         iVhAVKEZcSFgmXOabP0eE/m/KQAhSad2DtkqLwe3RUy2VqPae/PVnsIH10XkhyLn8tby
         FRgOzOcSTaWXAvnLY2oXnodgHy8jmI2LYFM4KwEqLDGEzEg4UrQx81NoMZbb7JNZunMT
         xhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=StfPuhGS1kv1GqaAEdWuNUZKw3JdTFJGsJMv0i38nX4=;
        b=3QMJGddoUejMYumkjkGHri5qcxFwI5sVSFUGjm/5x7lH+JhnuUos4v+ZKacQSXsYVy
         1ioabtZ2ciMRdxk3u/pq5nCCMZQvq4Fk1O0141E335PW+TX+94gutPNmI858stpUQB5L
         4uAJkgm34qUQJ8IAuy0MNcKhGxpqQql5aidG80Xza3th6wk/Z2VgOBGncQ4tUFHfGMad
         4qk8GnkFcBzWUdyAjLGNSiju7xx866E7SwR0F7TGnCL6MD9qcoiyPBgVLDZmnOzLUG/+
         rW9sccZngV6sBkMtNNnW35R0R8GuQiF20qgLlQpsgGgG0dnWNgRec0SFwCdhva/Etzfo
         yQFg==
X-Gm-Message-State: AOAM53107aUY5FHYMAudlzHoJM9E59BAWXGT2oxj63NMZT2wLv1yoAuS
        9UOo30ihIPLPkezF1RJR8IqR7eceA0h+XJd8ybzXzPI3WK1rmg==
X-Google-Smtp-Source: ABdhPJy8U9EAcXsNxyF+QiSU4EEI3MQ6jye8kMKZBMkg+M76pbWPqMk92DhqpndR+y2E+7JQkeCfhlJzFollUjeVtYE=
X-Received: by 2002:a05:6e02:1561:: with SMTP id k1mr16043301ilu.135.1636862135290;
 Sat, 13 Nov 2021 19:55:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636684159.git.siyanteng@loongson.cn> <017cb90514ce753958489fc96b571152e6d93bcf.1636684159.git.siyanteng@loongson.cn>
In-Reply-To: <017cb90514ce753958489fc96b571152e6d93bcf.1636684159.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Sun, 14 Nov 2021 11:54:59 +0800
Message-ID: <CAJy-Am=98gDFWbP2iAURbN9LJPX8KNsTkgfqpS1Wt1+x-YwxNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: add sysfs-pci trnaslation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>,
        Hu Haowen <src.res@email.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCBOb3YgMTIsIDIwMjEgYXQgMTA6NDIgQU0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFA
Z21haWwuY29tPiB3cm90ZToNCj4NCj4gVHJhbnNsYXRlIC4uLi9QQ0kvc3lzZnMtcGNpLnJzdCBp
bnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bs
b29uZ3Nvbi5jbj4NCg0KTEdUTSwNClJldmlldy1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5v
cmc+DQoNCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL1BDSS9pbmRleC5yc3QgICAg
ICAgICAgfCAgIDMgKy0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vUENJL3N5c2ZzLXBjaS5y
c3QgICAgICB8IDEyOCArKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9QQ0kvc3lzZnMtcGNpLnJzdA0KPg0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vUENJL2luZGV4LnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL1BDSS9pbmRleC5yc3QNCj4gaW5kZXgg
NDQ0MThhNWY1N2Q1Li5mNTE5NDBkMWNlYWIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL1BDSS9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vUENJL2luZGV4LnJzdA0KPiBAQCAtMjMsMTMgKzIzLDE0IEBAIExp
bnV4IFBDSeaAu+e6v+WtkOezu+e7nw0KPg0KPiAgICAgcGNpDQo+ICAgICBtc2ktaG93dG8NCj4g
KyAgIHN5c2ZzLXBjaQ0KPg0KPiAgVG9kb2xpc3Q6DQo+DQo+ICAgICBwY2llYnVzLWhvd3RvDQo+
ICAgICBwY2ktaW92LWhvd3RvDQo+ICAgICBtc2ktaG93dG8NCj4gLSAgIHN5c2ZzLXBjaQ0KPiAr
DQo+ICAgICBhY3BpLWluZm8NCj4gICAgIHBjaS1lcnJvci1yZWNvdmVyeQ0KPiAgICAgcGNpZWFl
ci1ob3d0bw0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
UENJL3N5c2ZzLXBjaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9QQ0kv
c3lzZnMtcGNpLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjZmZTZlODg3MTIxOQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL1BDSS9zeXNmcy1wY2kucnN0DQo+IEBAIC0wLDAgKzEsMTI4IEBA
DQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiArLi4gaW5jbHVkZTo6
IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlv
bi9QQ0kvc3lzZnMtcGNpLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+
IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4g
Kw0KPiArDQo+ICsNCj4gKy4uIF9jbl9QQ0lfc3lzZnMtcGNpLnJzdDoNCj4gKw0KPiArPT09PT09
PT09PT09PT09PT09PT09PT09DQo+ICvpgJrov4dzeXNmc+iuv+mXrlBDSeiuvuWkh+i1hOa6kA0K
PiArPT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK3N5c2Zz77yM6YCa5bi45oyC6L29
5ZyoL3N5c++8jOWcqOaUr+aMgeWug+eahOW5s+WPsOS4iuaPkOS+m+WvuVBDSei1hOa6kOeahOiu
v+mXruOAguS+i+Wmgu+8jOS4gOS4queJueWumueahOaAu+e6v+WPr+iDveeci+i1tw0KPiAr5p2l
5YOP6L+Z5qC3OjoNCj4gKw0KPiArICAgICAvc3lzL2RldmljZXMvcGNpMDAwMDoxNw0KPiArICAg
ICB8LS0gMDAwMDoxNzowMC4wDQo+ICsgICAgIHwgICB8LS0gY2xhc3MNCj4gKyAgICAgfCAgIHwt
LSBjb25maWcNCj4gKyAgICAgfCAgIHwtLSBkZXZpY2UNCj4gKyAgICAgfCAgIHwtLSBlbmFibGUN
Cj4gKyAgICAgfCAgIHwtLSBpcnENCj4gKyAgICAgfCAgIHwtLSBsb2NhbF9jcHVzDQo+ICsgICAg
IHwgICB8LS0gcmVtb3ZlDQo+ICsgICAgIHwgICB8LS0gcmVzb3VyY2UNCj4gKyAgICAgfCAgIHwt
LSByZXNvdXJjZTANCj4gKyAgICAgfCAgIHwtLSByZXNvdXJjZTENCj4gKyAgICAgfCAgIHwtLSBy
ZXNvdXJjZTINCj4gKyAgICAgfCAgIHwtLSByZXZpc2lvbg0KPiArICAgICB8ICAgfC0tIHJvbQ0K
PiArICAgICB8ICAgfC0tIHN1YnN5c3RlbV9kZXZpY2UNCj4gKyAgICAgfCAgIHwtLSBzdWJzeXN0
ZW1fdmVuZG9yDQo+ICsgICAgIHwgICBgLS0gdmVuZG9yDQo+ICsgICAgIGAtLSAuLi4NCj4gKw0K
PiAr5pyA5LiK6Z2i55qE5YWD57Sg5o+P6L+w5LqGUENJ5Z+f5ZKM5oC757q/5Y+356CB44CC5Zyo
6L+Z56eN5oOF5Ya15LiL77yM5Z+f5Y+35pivMDAwMO+8jOaAu+e6v+WPt+aYrzE377yI5Lik5Liq
5YC86YO95piv5Y2B5YWt6L+b5Yi277yJ44CCDQo+ICvov5nkuKrmgLvnur/lnKgw5Y+35o+S5qe9
5Lit5YyF5ZCr5LiA5Liq5Y2V5LiA5Yqf6IO955qE6K6+5aSH44CC5Li65LqG5pa55L6/6LW36KeB
77yM5oiR5Lus5aSN5Yi25LqG5Z+f5ZKM5oC757q/55qE57yW5Y+344CC5Zyo6K6+5aSH55uu5b2V
DQo+ICvkuIvmnInlh6DkuKrmlofku7bvvIzmr4/kuKrmlofku7bpg73mnInoh6rlt7HnmoTlip/o
g73jgIINCj4gKw0KPiArICAgICAgID09PT09PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gKyAgICAgICDmlofku7Yg
ICAgICAgICAgICAgICAgICAgICAgICAg5Yqf6IO9DQo+ICsgICAgICAgPT09PT09PT09PT09PT09
PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiArICAgICAgIGNsYXNzICAgICAgICAgICAgICAgICAgUENJ57qn5YirIChhc2NpaSwgcm8p
DQo+ICsgICAgICAgY29uZmlnICAgICAgICAgICAgICAgICBQQ0nphY3nva7nqbrpl7QgKGJpbmFy
eSwgcncpDQo+ICsgICAgICAgZGV2aWNlICAgICAgICAgICAgICAgICBQQ0norr7lpIcgKGFzY2lp
LCBybykNCj4gKyAgICAgICBlbmFibGUgICAgICAgICAgICAg6K6+5aSH5piv5ZCm6KKr5ZCv55So
IChhc2NpaSwgcncpDQo+ICsgICAgICAgaXJxICAgICAgICAgICAgICAgICAgICAgICAgSVJR57yW
5Y+3IChhc2NpaSwgcm8pDQo+ICsgICAgICAgbG9jYWxfY3B1cyAgICAgICAgICAgICDkuLTov5FD
UFXmjqnnoIEoY3B1bWFzaywgcm8pDQo+ICsgICAgICAgcmVtb3ZlICAgICAgICAgICAgICAgICDk
u47lhoXmoLjnmoTliJfooajkuK3liKDpmaTorr7lpIcgKGFzY2lpLCB3bykNCj4gKyAgICAgICBy
ZXNvdXJjZSAgICAgICAgICAgICAgICAgICAgICAgUENJ6LWE5rqQ5Li75py65Zyw5Z2AIChhc2Np
aSwgcm8pDQo+ICsgICAgICAgcmVzb3VyY2UwLi5OICAgICAgICAgICBQQ0notYTmupBO77yM5aaC
5p6c5a2Y5Zyo55qE6K+dIChiaW5hcnksIG1tYXAsIHJ3XCBbMV1fKQ0KPiArICAgICAgIHJlc291
cmNlMF93Yy4uTl93YyAgUENJIFdD5pig5bCE6LWE5rqQTu+8jOWmguaenOWPr+mihOWPlueahOiv
nSAoYmluYXJ5LCBtbWFwKQ0KPiArICAgICAgIHJldmlzaW9uICAgICAgICAgICAgICAgICAgICAg
ICBQQ0nkv67orqLniYggKGFzY2lpLCBybykNCj4gKyAgICAgICByb20gICAgICAgICAgICAgICAg
ICAgICAgICBQQ0kgUk9N6LWE5rqQ77yM5aaC5p6c5a2Y5Zyo55qE6K+dIChiaW5hcnksIHJvKQ0K
PiArICAgICAgIHN1YnN5c3RlbV9kZXZpY2UgICAgICAgICAgIFBDSeWtkOezu+e7n+iuvuWkhyAo
YXNjaWksIHJvKQ0KPiArICAgICAgIHN1YnN5c3RlbV92ZW5kb3IgICAgICAgICAgIFBDSeWtkOez
u+e7n+S+m+W6lOWVhiAoYXNjaWksIHJvKQ0KPiArICAgICAgIHZlbmRvciAgICAgICAgICAgICAg
ICAgUENJ5L6b5bqU5ZWGIChhc2NpaSwgcm8pDQo+ICsgICAgICAgPT09PT09PT09PT09PT09PT09
PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiArDQo+ICs6Og0KPiArDQo+ICsgIHJvIC0g5Y+q6K+75paH5Lu2DQo+ICsgIHJ3IC0g5paH5Lu2
5piv5Y+v6K+75ZKM5Y+v5YaZ55qEDQo+ICsgIHdvIC0g5Y+q5YaZ5paH5Lu2DQo+ICsgIG1tYXAg
LSDmlofku7bmmK/lj6/np7vliqjnmoQNCj4gKyAgYXNjaWkgLSDmlofku7bljIXlkKthc2NpaeaW
h+acrA0KPiArICBiaW5hcnkgLSDmlofku7bljIXlkKvkuozov5vliLbmlbDmja4NCj4gKyAgY3B1
bWFzayAtIOaWh+S7tuWMheWQq+S4gOS4qmNwdW1hc2vnsbvlnovnmoQNCj4gKw0KPiArLi4gWzFd
IHJ3IOS7hemAgueUqOS6jiBJT1JFU09VUkNFX0lP77yISS9PIOerr+WPo++8ieWMuuWfnw0KPiAr
DQo+ICvlj6ror7vmlofku7bmmK/kv6Hmga/mgKfnmoTvvIzlr7nlroPku6znmoTlhpnlhaXlsIbo
oqvlv73nlaXvvIzkvYYgInJvbSLmlofku7bpmaTlpJbjgILlj6/lhpnmlofku7blj6/ku6XnlKjm
naXlnKjorr7lpIfkuIrmiacNCj4gK+ihjOaTjeS9nO+8iOS+i+Wmgu+8jOaUueWPmOmFjee9ruep
uumXtO+8jOWIhuemu+iuvuWkh++8ieOAgiBtbWFwYWJsZeaWh+S7tuWPr+S7pemAmui/h+WBj+en
u+mHj+S4ujDnmoTmlofku7bnmoRtbWFw6I635b6X77yMDQo+ICvlj6/ku6XnlKjmnaXku47nlKjm
iLfnqbrpl7Tov5vooYzlrp7pmYXnmoTorr7lpIfnvJbnqIvjgILms6jmhI/vvIzmnInkupvlubPl
j7DkuI3mlK/mjIHmn5DkupvotYTmupDnmoRtbWFwcGluZ++8jOaJgOS7peS4gOWumuimgQ0KPiAr
5qOA5p+l5Lu75L2V5bCd6K+V55qEbW1hcOeahOi/lOWbnuWAvOOAguWFtuS4reacgOWAvOW+l+az
qOaEj+eahOaYr0kvT+err+WPo+i1hOa6kO+8jOWug+S5n+aPkOS+m+ivuy/lhpnorr/pl67jgIIN
Cj4gKw0KPiAr4oCdZW5hYmxl4oCc5paH5Lu25o+Q5L6b5LqG5LiA5Liq6K6h5pWw5Zmo77yM6KGo
5piO6K6+5aSH5bey57uP6KKr5ZCv55So5LqG5aSa5bCR5qyh44CC5aaC5p6cJ2VuYWJsZSfmlofk
u7bnm67liY3ov5Tlm54nNCfvvIwNCj4gK+iAjOS4gOS4qicxJ+iiq+WRvOWFpeWug++8jOWug+Ww
hui/lOWbnic1J+OAguWQkeWug+WRvOWFpeS4gOS4qicwJ+S8muWHj+WwkeiuoeaVsOOAguS4jei/
h++8jOWNs+S9v+Wug+i/lOWbnuWIsDDvvIzkuIDkupvliJ3lp4sNCj4gK+WMluWPr+iDveS5n+S4
jeS8muiiq+mAhui9rOOAgg0KPiArDQo+ICvigJ1yb23igJzmlofku7blvojnibnliKvvvIzlm6Dk
uLrlroPmj5Dkvpvkuoblr7norr7lpIdST03mlofku7bnmoTlj6ror7vorr/pl67vvIzlpoLmnpzm
nInnmoTor53jgILnhLbogIzvvIzlroPlnKjpu5jorqTmg4XlhrXkuIvmmK8NCj4gK+emgeeUqOea
hO+8jOaJgOS7peW6lOeUqOeoi+W6j+W6lOivpeWcqOWwneivleivu+WPluiwg+eUqOS5i+WJjeWw
huWtl+espuS4siAiMSLlhpnlhaXor6Xmlofku7bku6XlkK/nlKjlroPvvIzlubblnKjorr/pl67k
uYvlkI7lsIYNCj4gKyIwIuWGmeWFpeivpeaWh+S7tuS7peemgeeUqOWug+OAguivt+azqOaEj++8
jOiuvuWkh+W/hemhu+iiq+WQr+eUqO+8jOaJjeiDveaIkOWKn+i/lOWbnuaVsOaNruOAguWmguae
nOmpseWKqOayoeacieiiq+e7keWumuWIsOiuvuWkhw0KPiAr5LiK77yM5Y+v5Lul5L2/55So5LiK
6Z2i5o+Q5Yiw55qE4oCdZW5hYmxl4oCc5paH5Lu25bCG5YW25ZCv55So44CCDQo+ICsNCj4gK+KA
nXJlbW92ZeKAnOaWh+S7tuaYr+eUqOadpeenu+mZpFBDSeiuvuWkh+eahO+8jOmAmui/h+WQkeiv
peaWh+S7tuWGmeWFpeS4gOS4qumdnumbtueahOaVtOaVsOOAgui/meW5tuS4jea2ieWPiuS7u+S9
leW9ouW8j+eahOeDreaPkg0KPiAr5ouU5Yqf6IO977yM5L6L5aaC5YWz6Zet6K6+5aSH55qE55S1
5rqQ44CC6K+l6K6+5aSH6KKr5LuO5YaF5qC455qEUENJ6K6+5aSH5YiX6KGo5Lit56e76Zmk77yM
5a6D55qEc3lzZnPnm67lvZXooqvnp7vpmaTvvIzlubbkuJTor6UNCj4gK+iuvuWkh+Wwhuiiq+S7
juS7u+S9lei/nuaOpeWIsOWug+eahOmpseWKqOeoi+W6j+S4reenu+mZpOOAguenu+mZpFBDSeag
ueaAu+e6v+aYr+S4jeWFgeiuuOeahOOAgg0KPiArDQo+ICvpgJrov4dzeXNmc+iuv+mXruWOn+ac
iei1hOa6kA0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICsNCj4gK+WmguaenOW6leWxguW5
s+WPsOaUr+aMgeeahOivne+8jOS8oOe7n+eahEkvT+err+WPo+WSjElTQeWGheWtmOi1hOa6kOS5
n+S8muWcqHN5c2Zz5Lit5o+Q5L6b44CC5a6D5Lus5L2N5LqOUENJ57G755qE5bGC5qyh57uT5p6E
DQo+ICvkuK3vvIzkvovlpoI6Og0KPiArDQo+ICsgICAgICAgL3N5cy9jbGFzcy9wY2lfYnVzLzAw
MDA6MTcvDQo+ICsgICAgICAgfC0tIGJyaWRnZSAtPiAuLi8uLi8uLi9kZXZpY2VzL3BjaTAwMDA6
MTcNCj4gKyAgICAgICB8LS0gY3B1YWZmaW5pdHkNCj4gKyAgICAgICB8LS0gbGVnYWN5X2lvDQo+
ICsgICAgICAgYC0tIGxlZ2FjeV9tZW0NCj4gKw0KPiArbGVnYWN5X2lv5paH5Lu25piv5LiA5Liq
6K+7L+WGmeaWh+S7tu+8jOWPr+S7peiiq+W6lOeUqOeoi+W6j+eUqOadpeWBmuS8oOe7n+eahOer
r+WPo0kvT+OAguW6lOeUqOeoi+W6j+W6lOivpeaJk+W8gOivpeaWh+S7tu+8jOWvuw0KPiAr5om+
5omA6ZyA55qE56uv5Y+j77yI5L6L5aaCMHgzZTjvvInvvIzlubbov5vooYwx44CBMuaIljTlrZfo
ioLnmoTor7vmiJblhpnjgIJsZWdhY3lfbWVt5paH5Lu25bqU6K+l6KKrbW1hcHBlZO+8jOWFtuWB
j+enuw0KPiAr6YeP5LiO5omA6ZyA55qE5YaF5a2Y5YGP56e76YeP55u45a+55bqU77yM5L6L5aaC
MHhhMDAwMOeUqOS6jlZHQeW4p+e8k+WGsuWZqOOAgueEtuWQju+8jOW6lOeUqOeoi+W6j+WPr+S7
peeugOWNleWcsOino+mZpOW8leeUqOi/lOWbng0KPiAr55qE5oyH6ZKI77yI5b2T54S25piv5Zyo
5qOA5p+l5LqG6ZSZ6K+v5LmL5ZCO77yJ5p2l6K6/6Zeu6YGX55WZ5YaF5a2Y56m66Ze044CCDQo+
ICsNCj4gK+aUr+aMgeaWsOW5s+WPsOS4iueahFBDSeiuv+mXrg0KPiArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ICsNCj4gK+S4uuS6huaUr+aMgeS4iui/sOeahFBDSei1hOa6kOaYoOWwhO+8jExp
bnV45bmz5Y+w5Luj56CB5pyA5aW95a6a5LmJQVJDSF9HRU5FUklDX1BDSV9NTUFQX1JFU09VUkNF
5bm25L2/55So6K+lDQo+ICvlip/og73nmoTpgJrnlKjlrp7njrDjgILkuLrkuobmlK/mjIHpgJro
v4cvcHJvYy9idXMvcGNp5Lit55qE5paH5Lu25a6e546wbW1hcCgp55qE5Y6G5Y+y5o6l5Y+j77yM
5bmz5Y+w5Lmf5Y+v5Lul6K6+572uDQo+ICtIQVZFX1BDSV9NTUFQ44CCDQo+ICsNCj4gK+WPpuWk
lu+8jOiuvue9ruS6hiBIQVZFX1BDSV9NTUFQIOeahOW5s+WPsOWPr+S7peaPkOS+m+S7luS7rOiH
quW3seeahCBwY2lfbW1hcF9wYWdlX3JhbmdlKCkg5a6e546w77yM6ICM5LiN5piv5a6aDQo+ICvk
uYkgQVJDSF9HRU5FUklDX1BDSV9NTUFQX1JFU09VUkNF44CCDQo+ICsNCj4gK+aUr+aMgVBDSei1
hOa6kOeahOWGmee7hOWQiOaYoOWwhOeahOW5s+WPsOW/hemhu+WumuS5iWFyY2hfY2FuX3BjaV9t
bWFwX3djKCnvvIzlvZPlhpnnu4TlkIjooqvlhYHorrjml7bvvIzlnKjov5DooYzml7blupQNCj4g
K+ivhOS8sOS4uumdnumbtuOAguaUr+aMgUkvT+i1hOa6kOaYoOWwhOeahOW5s+WPsOWQjOagt+Wu
muS5iWFyY2hfY2FuX3BjaV9tbWFwX2lvKCnjgIINCj4gKw0KPiAr5Lyg57uf6LWE5rqQ55SxSEFW
RV9QQ0lfTEVHQUNZ5a6a5LmJ5L+d5oqk44CC5biM5pyb5pSv5oyB5Lyg57uf5Yqf6IO955qE5bmz
5Y+w5bqU6K+l5a6a5LmJ5a6D5bm25o+Q5L6bIHBjaV9sZWdhY3lfcmVhZCwNCj4gK3BjaV9sZWdh
Y3lfd3JpdGUg5ZKMIHBjaV9tbWFwX2xlZ2FjeV9wYWdlX3JhbmdlIOWHveaVsOOAgg0KPiAtLQ0K
PiAyLjI3LjANCj4NCg==
