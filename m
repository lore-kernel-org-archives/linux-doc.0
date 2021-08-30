Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF60C432BE
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 06:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0873960FC0
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 06:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhH3GgQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Aug 2021 02:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhH3GgP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Aug 2021 02:36:15 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6ECC061575
        for <linux-doc@vger.kernel.org>; Sun, 29 Aug 2021 23:35:15 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so17104629otf.6
        for <linux-doc@vger.kernel.org>; Sun, 29 Aug 2021 23:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TWs5MdY6le9SPIXQ+fn9xSG9ux0AGz1+n1WspRzowOI=;
        b=X6Mbr96zGR99m+ABUzTd0j47/ItIJxrhBYQMmsSZ1eqIsvJF8/V8A4+74tlxflRxf7
         TqrsG3j9eqkacr1Oc1IzdphuKohci3F/MD8sxCcLzBzsP0V0Ug50Pw8yLgnCajih8kpX
         8exTuI/yzowQM6+cX5noCa4AscxpJ+LQSPU9jJ58Cwbelz1l51dkiGyhFIHikcxj6Y7H
         2g4UugWk/d9u7rK+w4fvf9zcy6fWzRQGHcv5Xw87vIlrrVQoa+NncddOu4TGpeDlV6z6
         vtgkPSdU/Abn/sShd0jJNmrE2zboPjPt5AUsk0P7eeeH4zXE/RvdHDVBajPpl44F8p+B
         DD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TWs5MdY6le9SPIXQ+fn9xSG9ux0AGz1+n1WspRzowOI=;
        b=QGpKjHbuGezOP71Ls487rojqDuuiIZxwewEGRk8RH6LbuSW43siKzvW8tHKgJ814UX
         IOUxUxhYOTbvVH2zi1ikEZoMcn4Qc9fPYti8OgNUVquvjQNEuupHC+C8dM6q7Ss6pDh7
         pUMQ7iseTGvG/bXpkRpxm2b0eGTE0QzqWUjckYLnC+4tZHSe8+xfmM9jlEh/G6Ru5qN2
         R8MxJvr1pfT9W6ggqDmu74KPsW/2NghN8Fb70MWEYpp8iGEGj4netOJEN5tUAY0rSjC7
         5i7rrmU592YU2pC6HHli9EV7lBpWgr/vApAb6XzRYcBL7vbuRZ+yND3KEHzPvjK97Dyv
         KJkQ==
X-Gm-Message-State: AOAM5308UHImDzToNS+VJimr4OoUymTgU12pGkja/flRrI2ox4JtrkJt
        tRJCI6oWULxbfshi8Fv7RfDMTSYQ6YCtt3Ilr4g=
X-Google-Smtp-Source: ABdhPJwnpC25n9YJN5Dnd9WywaCmljeY01aayPoO6w8TGpNUlrVivOrEk9L7vvFS3rwV4eOSnpX0V1jxGeKBm8+2NNc=
X-Received: by 2002:a9d:490f:: with SMTP id e15mr3434944otf.340.1630305309366;
 Sun, 29 Aug 2021 23:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629274856.git.siyanteng@loongson.cn> <b38ea3f1e3be0cc98a243f1af50bf95fef7ce18b.1629274856.git.siyanteng@loongson.cn>
 <CAJy-AmnRXXOW3o4RCs27j0CDNDyqo2XKLYBdf5kD071b_Qi2NQ@mail.gmail.com>
In-Reply-To: <CAJy-AmnRXXOW3o4RCs27j0CDNDyqo2XKLYBdf5kD071b_Qi2NQ@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 30 Aug 2021 14:34:58 +0800
Message-ID: <CAEensMzNSkbm7XHobLLhHHr42-ROqQZG1bgiAK_YUZ9gwdHUkw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] docs/zh_CN: add core-api unaligned-memory-access translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn,
        =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDI15pel5ZGo5LiJIOS4
i+WNiDM6NDnlhpnpgZPvvJoNCj4NCj4gT24gV2VkLCBBdWcgMTgsIDIwMjEgYXQgNDozMiBQTSBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+IHdyb3RlOg0KPiA+DQo+ID4gVHJhbnNs
YXRlIERvY3VtZW50YXRpb24vY29yZS1hcGkvdW5hbGlnbmVkLW1lbW9yeS1hY2Nlc3MucnN0IGlu
dG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVu
Z0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0NCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3Jl
LWFwaS9pbmRleC5yc3QgICAgIHwgICAyICstDQo+ID4gIC4uLi9jb3JlLWFwaS91bmFsaWduZWQt
bWVtb3J5LWFjY2Vzcy5yc3QgICAgICB8IDIyOSArKysrKysrKysrKysrKysrKysNCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyMzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkv
dW5hbGlnbmVkLW1lbW9yeS1hY2Nlc3MucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0DQo+ID4gaW5kZXggOTM2
NzEyOGM0Y2I3Li45YmMxZGZlYWI5OGUgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0DQo+ID4gQEAgLTEwMCwx
MCArMTAwLDEwIEBAIFRvZG9saXN0Og0KPiA+ICAgICA6bWF4ZGVwdGg6IDENCj4gPg0KPiA+ICAg
ICBtZW1vcnktYWxsb2NhdGlvbg0KPiA+ICsgICB1bmFsaWduZWQtbWVtb3J5LWFjY2Vzcw0KPiA+
DQo+ID4gIFRvZG9saXN0Og0KPiA+DQo+ID4gLSAgIHVuYWxpZ25lZC1tZW1vcnktYWNjZXNzDQo+
ID4gICAgIGRtYS1hcGkNCj4gPiAgICAgZG1hLWFwaS1ob3d0bw0KPiA+ICAgICBkbWEtYXR0cmli
dXRlcw0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9j
b3JlLWFwaS91bmFsaWduZWQtbWVtb3J5LWFjY2Vzcy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9jb3JlLWFwaS91bmFsaWduZWQtbWVtb3J5LWFjY2Vzcy5yc3QNCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYWIxNWNjMDFjOTIy
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2NvcmUtYXBpL3VuYWxpZ25lZC1tZW1vcnktYWNjZXNzLnJzdA0KPiA+IEBAIC0wLDAg
KzEsMjI5IEBADQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+
ICsNCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL3VuYWxpZ25lZC1tZW1v
cnktYWNjZXNzLnJzdA0KPiA+ICsNCj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4gKyDlj7jlu7bo
hb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiArOuagoeiv
kToNCj4gPiArDQo+ID4gKyDml7blpY7kuq48YWxleHNAa2VybmVsLm9yZz4NCj4NCj4gRG8gSSBk
aWQgc3RoIG9uIHRoaXMgc2VyaWVzPyA6KQ0KWWVhaCwgdGhhbmsgeW91IGZvciB5b3VyIHJldmll
d++8gT5fPA0KPg0KPiA+ICsNCj4gPiArLi4gX2NuX2NvcmUtYXBpX3VuYWxpZ25lZC1tZW1vcnkt
YWNjZXNzOg0KPiA+ICsNCj4gPiArPT09PT09PT09PT09PT0NCj4gPiAr6Z2e5a+56b2Q5YaF5a2Y
6K6/6ZeuDQo+ID4gKz09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICs65L2c6ICFOiBEYW5pZWwg
RHJha2UgPGRzZEBnZW50b28ub3JnPiwNCj4gPiArOuS9nOiAhTogSm9oYW5uZXMgQmVyZyA8am9o
YW5uZXNAc2lwc29sdXRpb25zLm5ldD4NCj4gPiArDQo+ID4gKzrmhJ/osKLku5bku6znmoTluK7l
iqk6IEFsYW4gQ294LCBBdnV0b24gT2xyaWNoLCBIZWlra2kgT3JzaWxhLCBKYW4gRW5nZWxoYXJk
dCwNCj4gPiArICBLeWxlIE1jTWFydGluLCBLeWxlIE1vZmZldHQsIFJhbmR5IER1bmxhcCwgUm9i
ZXJ0IEhhbmNvY2ssIFVsaSBLdW5pdHosDQo+ID4gKyAgVmFkaW0gTG9iYW5vdg0KPiA+ICsNCj4g
PiArDQo+ID4gK0xpbnV46L+Q6KGM5Zyo5ZCE56eN5ZCE5qC355qE5p625p6E5LiK77yM6L+Z5Lqb
5p625p6E5Zyo5YaF5a2Y6K6/6Zeu5pa56Z2i5pyJ5LiN5ZCM55qE6KGo546w44CC5pys5paH5LuL
57uN5LqG5LiA5LqbDQo+ID4gK+WFs+S6juS4jeWvuem9kOiuv+mXrueahOe7huiKgu+8jOS4uuS7
gOS5iOS9oOmcgOimgee8luWGmeS4jeW8lei1t+S4jeWvuem9kOiuv+mXrueahOS7o+egge+8jOS7
peWPiuWmguS9lee8luWGmei/meagt+eahA0KPiA+ICvku6PnoIENCj4gPiArDQo+ID4gKw0KPiA+
ICvpnZ7lr7npvZDorr/pl67nmoTlrprkuYkNCj4gPiArPT09PT09PT09PT09PT09PQ0KPiA+ICsN
Cj4gPiAr5b2T5L2g6K+V5Zu+5LuO5LiA5Liq5LiN6KKrTuWBtuaVsOaVtOmZpOeahOWcsOWdgO+8
iOWNs2FkZHIgJSBOICE9IDDvvInlvIDlp4vor7vlj5ZO5a2X6IqC55qE5pWw5o2u5pe277yM5bCx
DQo+ID4gK+S8muWPkeeUn+aXoOWvuem9kOWGheWtmOiuv+mXruOAguS+i+Wmgu+8jOS7juWcsOWd
gDB4MTAwMDTor7vlj5Y05Liq5a2X6IqC55qE5pWw5o2u5piv5Y+v5Lul55qE77yM5L2G5LuO5Zyw
5Z2ADQo+ID4gKzB4MTAwMDXor7vlj5Y05Liq5a2X6IqC55qE5pWw5o2u5bCG5piv5LiA5Liq5LiN
5a+56b2Q55qE5YaF5a2Y6K6/6Zeu44CCDQo+ID4gKw0KPiA+ICvkuIrov7DlhoXlrrnlj6/og73n
nIvotbfmnaXmnInngrnmqKHns4rvvIzlm6DkuLrlhoXlrZjorr/pl67lj6/ku6Xku6XkuI3lkIzn
moTmlrnlvI/lj5HnlJ/jgILov5nph4znmoTog4zmma/mmK/lnKjmnLrlmagNCj4gPiAr56CB5bGC
6Z2i5LiK77ya5p+Q5Lqb5oyH5Luk5Zyo5YaF5a2Y5Lit6K+75Y+W5oiW5YaZ5YWl5LiA5Lqb5a2X
6IqC77yI5L6L5aaCeDg25rGH57yW5Lit55qEbW92YuOAgW1vdnfjgIFtb3Zs77yJ44CCDQo+ID4g
K+ato+WmguWwhuWPmOW+l+a4heaZsOeahOmCo+agt++8jOebuOWvueWuueaYk+WPkeeOsOmCo+S6
m+Wwhue8luivkeS4uuWkmuWtl+iKguWGheWtmOiuv+mXruaMh+S7pOeahEPor63lj6XvvIzljbPl
nKjlpITnkIYNCj4gPiArdTE244CBdTMy5ZKMdTY0562J57G75Z6L5pe244CCDQo+ID4gKw0KPiA+
ICsNCj4gPiAr6Ieq54S25a+56b2QDQo+ID4gKz09PT09PT09DQo+ID4gKw0KPiA+ICvkuIrpnaLm
j5DliLDnmoTop4TliJnmnoTmiJDkuobmiJHku6zmiYDor7TnmoToh6rnhLblr7npvZDjgILlvZPo
rr/pl65O5Liq5a2X6IqC55qE5YaF5a2Y5pe277yM5Z+656GA5YaF5a2Y5Zyw5Z2A5b+F6aG76KKr
DQo+ID4gK07lubPlnYfliIblibLvvIzljbNhZGRyICUgTiA9PSAw44CCDQo+ID4gKw0KPiA+ICvl
nKjnvJblhpnku6PnoIHml7bvvIzlgYforr7nm67moIfmnrbmnoTmnInoh6rnhLblr7npvZDnmoTo
poHmsYLjgIINCj4gPiArDQo+ID4gK+WcqOeOsOWunuS4re+8jOWPquacieWwkeaVsOaetuaehOWc
qOaJgOacieWkp+Wwj+eahOWGheWtmOiuv+mXruS4iumDveimgeaxguiHqueEtuWvuem9kOOAgueE
tuiAjO+8jOaIkeS7rOW/hemhu+iAg+iZkeaJgA0KPiA+ICvmnInmlK/mjIHnmoTmnrbmnoTvvJvn
vJblhpnmu6HotrPoh6rnhLblr7npvZDopoHmsYLnmoTku6PnoIHmmK/lrp7njrDlrozlhajlj6/n
p7vmpI3mgKfnmoTmnIDnroDljZXmlrnms5XjgIINCj4gPiArDQo+ID4gKw0KPiA+ICvkuLrku4Dk
uYjpnZ7lr7npvZDorr/pl67ml7blnY/kuosNCj4gPiArPT09PT09PT09PT09PT09PT09PT09PQ0K
PiA+ICsNCj4gPiAr5omn6KGM6Z2e5a+56b2Q5YaF5a2Y6K6/6Zeu55qE5pWI5p6c5Zug5p625p6E
5LiN5ZCM6ICM5LiN5ZCM44CC5Zyo6L+Z6YeM5YaZ5LiA5pW056+H5YWz5LqO6L+Z5Lqb5beu5byC
55qE5paH5qGj5piv5b6I5a65DQo+ID4gK+aYk+eahO+8m+S4i+mdouaYr+WvueW4uOingeaDheWG
teeahOaAu+e7kzoNCj4gPiArDQo+ID4gKyAtIOS4gOS6m+aetuaehOiDveWkn+mAj+aYjuWcsOaJ
p+ihjOmdnuWvuem9kOWGheWtmOiuv+mXru+8jOS9humAmuW4uOS8muacieW+iOWkp+eahOaAp+iD
veS7o+S7t+OAgg0KPiA+ICsgLSDlvZPkuI3lr7npvZDnmoTorr/pl67lj5HnlJ/ml7bvvIzkuIDk
upvmnrbmnoTkvJrlvJXlj5HlpITnkIblmajlvILluLjjgILlvILluLjlpITnkIbnqIvluo/og73l
pJ/nuqDmraPkuI3lr7npvZDnmoQNCj4gPiArICAg6K6/6Zeu77yM5L2G6KaB5LuY5Ye65b6I5aSn
55qE5oCn6IO95Luj5Lu344CCDQo+ID4gKyAtIOS4gOS6m+aetuaehOWcqOWPkeeUn+S4jeWvuem9
kOiuv+mXruaXtu+8jOS8muW8leWPkeWkhOeQhuWZqOW8guW4uO+8jOS9huW8guW4uOS4reW5tuay
oeacieWMheWQq+i2s+Wkn+eahOS/oeaBr+adpQ0KPiA+ICsgICDnuqDmraPkuI3lr7npvZDorr/p
l67jgIINCj4gPiArIC0g5pyJ5Lqb5p625p6E5LiN6IO96L+b6KGM5peg5a+56b2Q5YaF5a2Y6K6/
6Zeu77yM5L2G5Lya6buY6buY5Zyw5omn6KGM5LiO6K+35rGC5LiN5ZCM55qE5YaF5a2Y6K6/6Zeu
77yM5LuO6ICM5a+86Ie0DQo+ID4gKyAgIOmavuS7peWPkeeOsOeahOW+ruWmmeeahOS7o+eggemU
meivryENCj4gPiArDQo+ID4gK+S7juS4iuaWh+WPr+S7peeci+WHuu+8jOWmguaenOS9oOeahOS7
o+eggeWvvOiHtOS4jeWvuem9kOeahOWGheWtmOiuv+mXruWPkeeUn++8jOmCo+S5iOS9oOeahOS7
o+eggeWcqOafkOS6m+W5s+WPsOS4iuWwhuaXoA0KPiA+ICvms5XmraPluLjlt6XkvZzvvIzlnKjl
hbbku5blubPlj7DkuIrlsIblr7zoh7TmgKfog73pl67popjjgIINCj4gPiArDQo+ID4gK+S4jeS8
muWvvOiHtOmdnuWvuem9kOiuv+mXrueahOS7o+eggQ0KPiA+ICs9PT09PT09PT09PT09PT09PT09
PT09PT0NCj4gPiArDQo+ID4gK+i1t+WIne+8jOS4iumdoueahOamguW/teS8vOS5juacieeCuema
vuS7peS4juWunumZhee8lueggeWunui3teiBlOezu+i1t+adpeOAguavleern++8jOS9oOWvueaf
kOS6m+WPmOmHj+eahOWGheWtmOWcsOWdgOayoQ0KPiA+ICvmnInlvojlpKfnmoTmjqfliLbmnYPv
vIznrYnnrYnjgIINCj4gPiArDQo+ID4gK+W5uOi/kOeahOaYr+S6i+aDheW5tuS4jeWkjeadgu+8
jOWboOS4uuWcqOWkp+WkmuaVsOaDheWGteS4i++8jOe8luivkeWZqOS8muehruS/neS6i+aDheS4
uuS9oOW3peS9nOOAguS+i+Wmgu+8jOS7peS4i+mdoueahA0KPg0KPiDnvJbor5HlmajkvJrnoa7k
v53ku6PnoIHlt6XkvZzmraPluLjjgIINCm9rIQ0KPg0KPiA+ICvnu5PmnoTkvZPkuLrkvos6Og0K
PiA+ICsNCj4gPiArICAgICAgIHN0cnVjdCBmb28gew0KPiA+ICsgICAgICAgICAgICAgICB1MTYg
ZmllbGQxOw0KPiA+ICsgICAgICAgICAgICAgICB1MzIgZmllbGQyOw0KPiA+ICsgICAgICAgICAg
ICAgICB1OCBmaWVsZDM7DQo+ID4gKyAgICAgICB9Ow0KPiA+ICsNCj4gPiAr6K6p5oiR5Lus5YGH
6K6+5LiK6L+w57uT5p6E5L2T55qE5LiA5Liq5a6e5L6L6am755WZ5Zyo5LuO5Zyw5Z2AMHgxMDAw
MOW8gOWni+eahOWGheWtmOS4reOAguagueaNruWfuuacrOeahOeQhuino++8jOiuv+mXrg0KPiA+
ICtmaWVsZDLkvJrlr7zoh7TpnZ7lr7npvZDorr/pl67vvIzov5nlubbkuI3mmK/kuI3lkIjnkIbn
moTjgILkvaDkvJrmnJ/mnJtmaWVsZDLkvY3kuo7or6Xnu5PmnoTkvZPnmoQy5Liq5a2X6IqC55qE
5YGP56e7DQo+ID4gK+mHj++8jOWNs+WcsOWdgDB4MTAwMDLvvIzkvYbor6XlnLDlnYDkuI3og73o
oqs05bmz5Z2H5pW06Zmk77yI5rOo5oSP77yM5oiR5Lus5Zyo6L+Z6YeM6K+75LiA5LiqNOWtl+iK
gueahOWAvO+8ieOAgg0KPiA+ICsNCj4gPiAr5bm46L+Q55qE5piv77yM57yW6K+R5Zmo55CG6Kej
5a+56b2Q57qm5p2f77yM5omA5Lul5Zyo5LiK6L+w5oOF5Ya15LiL77yM5a6D5Lya5ZyoZmllbGQx
5ZKMZmllbGQy5LmL6Ze05o+S5YWlMuS4quWtl+iKgg0KPiA+ICvnmoTloavlhYXjgILlm6DmraTv
vIzlr7nkuo7moIflh4bnmoTnu5PmnoTkvZPnsbvlnovvvIzkvaDmgLvmmK/lj6/ku6Xkvp3pnaDn
vJbor5HlmajmnaXloavlhYXnu5PmnoTkvZPvvIzku6Xkvr/lr7nlrZfmrrXnmoTorr8NCj4gPiAr
6Zeu5Y+v5Lul6YCC5b2T5Zyw5a+56b2Q77yI5YGH6K6+5L2g5rKh5pyJ5bCG5a2X5q615a6a5LmJ
5LiN5ZCM6ZW/5bqm55qE57G75Z6L77yJ44CCDQo+ID4gKw0KPiA+ICvlkIzmoLfvvIzkvaDkuZ/l
j6/ku6Xkvp3pnaDnvJbor5HlmajmoLnmja7lj5jph4/nsbvlnovnmoTlpKflsI/vvIzlsIblj5jp
h4/lkozlh73mlbDlj4LmlbDlr7npvZDliLDkuIDkuKroh6rnhLblr7npvZDnmoTmlrnmoYjjgIIN
Cj4gPiArDQo+ID4gK+WcqOi/meS4gOeCueS4iu+8jOW6lOivpeW+iOa4healmu+8jOiuv+mXruWN
leS4quWtl+iKgu+8iHU45oiWY2hhcu+8ieawuOi/nOS4jeS8muWvvOiHtOaXoOWvuem9kOiuv+mX
ru+8jOWboOS4uuaJgOacieeahOWGhQ0KPiA+ICvlrZjlnLDlnYDpg73lj6/ku6Xooqsx5Z2H5YyA
5Zyw5pW06Zmk44CCDQo+ID4gKw0KPiA+ICvlnKjkuIDkuKrnm7jlhbPnmoTor53popjkuIrvvIzo
gIPomZHliLDkuIrov7Dlm6DntKDvvIzkvaDlj6/ku6Xop4Llr5/liLDvvIzkvaDlj6/ku6Xlr7nn
u5PmnoTkvZPkuK3nmoTlrZfmrrXov5vooYzph43mlrDmjpLluo/vvIwNCj4gPiAr5Lul5L6/5bCG
5a2X5q615pS+5Zyo5LiN6YeN5o6S5bCx5Lya5o+S5YWl5aGr5YWF54mp55qE5Zyw5pa577yM5LuO
6ICM5YeP5bCR57uT5p6E5L2T5a6e5L6L55qE5pW05L2T5bi46am75YaF5a2Y5aSn5bCP44CC5LiK
6L+wDQo+ID4gK+S+i+WtkOeahOacgOS9s+W4g+WxgOaYrzo6DQo+ID4gKw0KPiA+ICsgICAgICAg
c3RydWN0IGZvbyB7DQo+ID4gKyAgICAgICAgICAgICAgIHUzMiBmaWVsZDI7DQo+ID4gKyAgICAg
ICAgICAgICAgIHUxNiBmaWVsZDE7DQo+ID4gKyAgICAgICAgICAgICAgIHU4IGZpZWxkMzsNCj4g
PiArICAgICAgIH07DQo+ID4gKw0KPiA+ICvlr7nkuo7kuIDkuKroh6rnhLblr7npvZDmlrnmoYjv
vIznvJbor5Hlmajlj6rpnIDopoHlnKjnu5PmnoTnmoTmnKvlsL7mt7vliqDkuIDkuKrlrZfoioLn
moTloavlhYXjgILmt7vliqDov5nnp43loavlhYXmmK/kuLrkuobmu6ENCj4gPiAr6Laz6L+Z5Lqb
57uT5p6E55qE5pWw57uE55qE5a+56b2Q57qm5p2f44CCDQo+ID4gKw0KPiA+ICvlj6bkuIDngrnl
gLzlvpfkuIDmj5DnmoTmmK/lnKjnu5PmnoTkvZPnsbvlnovkuIrkvb/nlKhfX2F0dHJpYnV0ZV9f
KChwYWNrZWQpKeOAgui/meS4qkdDQ+eJueacieeahOWxnuaAp+WRiuiviee8lg0KPiA+ICvor5Hl
majmsLjov5zkuI3opoHlnKjnu5PmnoTkvZPkuK3mj5LlhaXku7vkvZXloavlhYXvvIzlvZPkvaDm
g7PnlKhD57uT5p6E5L2T5p2l6KGo56S65LiA5Lqb4oCcb2ZmIHRoZSB3aXJl4oCd55qE5Zu65a6a
5o6S5YiXDQo+ID4gK+eahOaVsOaNruaXtu+8jOi/meS4quWxnuaAp+W+iOacieeUqOOAgg0KPiA+
ICsNCj4gPiAr5L2g5Y+v6IO95Lya5YC+5ZCR5LqO6K6k5Li677yM5Zyo6K6/6Zeu5LiN5ruh6Laz
5p625p6E5a+56b2Q6KaB5rGC55qE5a2X5q615pe277yM5L2/55So6L+Z5Liq5bGe5oCn5b6I5a65
5piT5a+86Ie05LiN5a+56b2Q55qE6K6/DQo+ID4gK+mXruOAgueEtuiAjO+8jOe8luivkeWZqOS5
n+aEj+ivhuWIsOS6huWvuem9kOeahOmZkOWItu+8jOW5tuS4lOS8muS6p+eUn+mineWklueahOaM
h+S7pOadpeaJp+ihjOWGheWtmOiuv+mXru+8jOS7pemBv+WFjemAoOaIkOS4jQ0KPiA+ICvlr7np
vZDnmoTorr/pl67jgILlvZPnhLbvvIzkuI7pnZ7miZPljIXnmoTmg4XlhrXnm7jmr5TvvIzpop3l
pJbnmoTmjIfku6TmmL7nhLbkvJrpgKDmiJDmgKfog73kuIrnmoTmjZ/lpLHvvIzmiYDku6XmiZPl
jIXlsZ7mgKflupQNCj4NCj4gc2luY2UgJ3BhY2tlZCcgaXMgYSBhdHRyaWJ1dGUgb2YgY29tcGls
ZXIsIHdlJ2QgYmV0dGVyIGtlZXAgaXQgaW4gRW5nbGlzaD8NCm9rIQ0KPg0KPiBBcyB0byBvdGhl
cnMsIFJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4NCg0KVGhhbmtz
LA0KDQpZYW50ZW5nDQo=
