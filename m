Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA49C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 25 Aug 2021 07:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F0A761374
	for <linux-doc@archiver.kernel.org>; Wed, 25 Aug 2021 07:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238693AbhHYHy7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Aug 2021 03:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238830AbhHYHy6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Aug 2021 03:54:58 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551B6C061757
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 00:54:12 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id s16so23043101ilo.9
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2JuOwCogAwopmmxkQyoLHEEOpOY5XU5YiV5Z41RceDg=;
        b=MCb9rk/4vOcMMIDy76H1tdp19aji7QRqNpzDootFu3kHTnudBFi8z7DpSEa6GRW47p
         6Rvo/3UXD47aGT/ti+MWco9VIJOKVOTWZ3agangxZ06MPxiA80GJs3szbXwVMfIts0PN
         /9hEcwwEIBm6b/gUPjUZFqBVmA0OPcX+rNhsTFVTRKahhxslYj0on5FD6tpKU9WfNkuq
         WyX3nFJ64I8o8X5V8J4A6p/nuD6bKOx0ichlOkxAS5UDbHP23FeLuIUsavu39+DkceQv
         pXv8ShUURux8Od0LHj5qGN2AK81RRGO0O2K9VxvThCWpPQAiJYGB1GJHANHjchbCvuEY
         LEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2JuOwCogAwopmmxkQyoLHEEOpOY5XU5YiV5Z41RceDg=;
        b=T1l9lpvyjng1hXop3KSYipq2XTYzrV/GgmOFyXB/zOyxOqPxUuzaUF19ng1b1lMGVJ
         ic+d4TILFnDrbyCaVWL9JBw0rLaHrqdESdM2HnLSez/Ot36obRLFW9ujAXlJT8QI9zlo
         /9lRO6Iu5KnDlj54gfSd0KAfv1K8dDXEQ9Dtup+E9Llv6gwLfpu5SrS80r27zVxvQb7v
         PyeLC5J726elH1WdYZ+nGLkTke2IX+dM55etdDi8HXvPKnIfND43nv7HzLcpYO1cHM+h
         cbvnnbFmjoBPTkPWiJv5EueuWUnruscMotfbbQgJTF3I/O1h9lD4CMkXE72bsWP38DFN
         RTHA==
X-Gm-Message-State: AOAM533MdCBSaDMI2E/TD3ydbO5vrghiU7oXXulI8n6y+mIF506LTkOT
        NRu0MzEkuy05lrWKCGnlIfRk2eRECb5lJTCAmlQ=
X-Google-Smtp-Source: ABdhPJwUj3ssH2cX+WVJVXBCz+DCcOlbsIm5VZ2arcyIUHT76hwG6D5W2gGbNgzEYO83bt8gASX3vtp/gl2hHsD1NSw=
X-Received: by 2002:a92:6e12:: with SMTP id j18mr31016872ilc.243.1629878051834;
 Wed, 25 Aug 2021 00:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629274856.git.siyanteng@loongson.cn> <1396eaf00b91d1f5caf46774e11469f1ec975d53.1629274856.git.siyanteng@loongson.cn>
In-Reply-To: <1396eaf00b91d1f5caf46774e11469f1ec975d53.1629274856.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 25 Aug 2021 15:53:35 +0800
Message-ID: <CAJy-AmmB3WPSA1YKkNf1NCgjK2EN=cVC4KNW5kTG8SpCiQ2LDA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] docs/zh_CN: add core-api genalloc translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gV2VkLCBBdWcgMTgsIDIwMjEgYXQgNDozMiBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9n
ZW5hbGxvYy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNp
IDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNA
a2VybmVsLm9yZz4NCg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkv
Z2VuYWxsb2MucnN0ICB8IDEwOSArKysrKysrKysrKysrKysrKysNCj4gIC4uLi90cmFuc2xhdGlv
bnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0ICAgICB8ICAgMiArLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2dlbmFsbG9jLnJz
dA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvZ2VuYWxsb2MucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29y
ZS1hcGkvZ2VuYWxsb2MucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uNjg5NzA5YmE3YTJhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvZ2VuYWxsb2MucnN0DQo+IEBAIC0wLDAg
KzEsMTA5IEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0K
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2NvcmUtYXBpL2dlbmFsbG9jLnJzdA0KPiArDQo+
ICs657+76K+ROg0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4NCj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArDQo+ICsNCj4gKy4uIF9jbl9jb3Jl
LWFwaV9nZW5hbGxvYzoNCj4gKw0KPiArZ2VuYWxsb2MvZ2VucG9vbOWtkOezu+e7nw0KPiArPT09
PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICvlhoXmoLjkuK3mnInorrjlpJrlhoXlrZjliIbp
hY3lrZDns7vnu5/vvIzmr4/kuIDkuKrpg73mmK/pkojlr7nnibnlrprnmoTpnIDmsYLjgILnhLbo
gIzvvIzmnInml7blgJnvvIzlhoXmoLjlvIDlj5HogIXpnIANCj4gK+imgeS4uueJueWumuiMg+Wb
tOeahOeJueauiueUqOmAlOeahOWGheWtmOWunueOsOS4gOS4quaWsOeahOWIhumFjeWZqO+8m+mA
muW4uOi/meS4quWGheWtmOS9jeS6juafkOS4quiuvuWkh+S4iuOAguivpeiuvg0KPiAr5aSH55qE
6amx5Yqo56iL5bqP55qE5L2c6ICF5b2T54S25Y+v5Lul5YaZ5LiA5Liq5bCP55qE5YiG6YWN5Zmo
5p2l5a6M5oiQ5bel5L2c77yM5L2G6L+Z5piv6K6p5YaF5qC45YWF5ruh5Yeg5Y2B5Liq5rWL6K+V
DQo+ICvlt67lirLnmoTliIbphY3lmajnmoTmlrnms5XjgILml6nlnKgyMDA15bm077yMSmVzIFNv
cmVuc2Vu5LuOc3ltNTNjOHh4XzLpqbHliqjkuK3mj5Dlj5bkuoblhbbkuK3nmoTkuIANCj4gK+S4
quWIhumFjeWZqO+8jOW5tuWwhuWFtuS9nOS4uuS4gOS4qumAmueUqOaooeWdl+WPkeW4g++8jOeU
qOS6juWIm+W7uueJueiuvueahOWGheWtmOWIhumFjeWZqOOAgui/meauteS7o+eggeWcqDIuNi4x
Mw0KPiAr54mI5pys5Lit6KKr5ZCI5bm277yb5q2k5ZCO5a6D6KKr5aSn5aSn5Zyw5L+u5pS55LqG
44CCDQo+ICsNCj4gKy4uIF9wb3N0ZWQ6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8xMjU4NDIv
DQo+ICsNCj4gK+S9v+eUqOi/meS4quWIhumFjeWZqOeahOS7o+eggeW6lOivpeWMheaLrDxsaW51
eC9nZW5hbGxvYy5oPuOAgui/meS4quWKqOS9nOS7juWIm+W7uuS4gOS4quaxoOW8gOWni++8jOS9
v+eUqA0KPiAr5LiA5LiqOg0KPiArDQo+ICvor6VBUEnlnKjku6XkuIvlhoXmoLjku6PnoIHkuK06
DQo+ICsNCj4gK2xpYi9nZW5hbGxvYy5jDQo+ICsNCj4gK+WvuWdlbl9wb29sX2NyZWF0ZSgp55qE
6LCD55So5bCG5Yib5bu65LiA5Liq5YaF5a2Y5rGg44CC5YiG6YWN55qE57KS5bqm55SxbWluX2Fs
bG9jX29yZGVy6K6+572u77yb5a6DDQo+ICvmmK/kuIDkuKpsb2ctYmFzZS0y77yI5LulMuS4uuW6
leeahOWvueaVsO+8ieeahOaVsOWtl++8jOWwseWDj+mhtemdouWIhumFjeWZqOS9v+eUqOeahOaV
sOWtl+S4gOagt++8jOS9huWug+aMh+eahOaYrw0KPiAr5a2X6IqC6ICM5LiN5piv6aG16Z2i44CC
5Zug5q2k77yM5aaC5p6cbWluX2FsbG9jX29yZGVy6KKr5Lyg6YCS5Li6M++8jOmCo+S5iOaJgOac
ieeahOWIhumFjeWwhuaYrzjlrZfoioLnmoTlgI3mlbDjgIINCj4gK+WinuWKoG1pbl9hbGxvY19v
cmRlcuWPr+S7peWHj+Wwkei3n+i4quaxoOS4reWGheWtmOaJgOmcgOeahOWGheWtmOOAgm5pZOWP
guaVsOaMh+WumuWTquS4gOS4qk5VTUHoioLngrnlupTor6XooqsNCj4gK+eUqOS6juWIhumFjeeu
oeWutue7k+aehOS9k++8m+WmguaenOiwg+eUqOiAheS4jeWFs+W/g++8jOWug+WPr+S7peaYry0x
44CCDQo+ICsNCj4gK+KAnOeuoeeQhueahOKAneaOpeWPo2Rldm1fZ2VuX3Bvb2xfY3JlYXRlKCnl
sIblhoXlrZjmsaDkuI7kuIDkuKrnibnlrprnmoTorr7lpIfogZTns7votbfmnaXjgILlnKjlhbbk
u5bmlrnpnaLvvIwNCj4gK+W9k+e7meWumueahOiuvuWkh+iiq+mUgOavgeaXtu+8jOWug+WwhuiH
quWKqOa4heeQhuWGheWtmOaxoOOAgg0KPiArDQo+ICvkuIDkuKrlhoXlrZjmsaDmsaDooqvlhbPp
l63nmoTmlrnms5XmmK86DQo+ICsNCj4gK+ivpUFQSeWcqOS7peS4i+WGheaguOS7o+eggeS4rToN
Cj4gKw0KPiArbGliL2dlbmFsbG9jLmMNCj4gKw0KPiAr5YC85b6X5rOo5oSP55qE5piv77yM5aaC
5p6c5Zyo57uZ5a6a55qE5YaF5a2Y5rGg5Lit5LuN5pyJ5pyq5a6M5oiQ55qE5YiG6YWN77yM6L+Z
5Liq5Ye95pWw5bCG6YeH5Y+W55u45b2T5p6B56uv55qE5q2l6aqk77yM6LCD55SoDQo+ICtCVUco
Ke+8jOS9v+aVtOS4quezu+e7n+W0qea6g+OAguS9oOW3sue7j+iiq+itpuWRiuS6huOAgg0KPiAr
DQo+ICvkuIDkuKrmlrDliJvlu7rnmoTlhoXlrZjmsaDmsqHmnInlhoXlrZjlj6/ku6XliIbphY3j
gILlnKjov5nnp43nirbmgIHkuIvvvIzlroPmmK/nm7jlvZPml6DnlKjnmoTvvIzmiYDku6Xpppbo
poHku7vliqHkuYvkuIDpgJrluLgNCj4gK+aYr+WQkeWGheWtmOaxoOmHjOa3u+WKoOWGheWtmOOA
gui/meWPr+S7pemAmui/h+S7peS4i+aWueW8j+WujOaIkDoNCj4gKw0KPiAr6K+lQVBJ5Zyo5Lul
5LiL5YaF5qC45Luj56CB5LitOg0KPiArDQo+ICtpbmNsdWRlL2xpbnV4L2dlbmFsbG9jLmgNCj4g
Kw0KPiArbGliL2dlbmFsbG9jLmMNCj4gKw0KPiAr5a+5Z2VuX3Bvb2xfYWRkKCnnmoTosIPnlKjl
sIbmiorku47lnLDlnYDvvIjlnKjlhoXmoLjnmoTomZrmi5/lnLDlnYDnqbrpl7TvvInlvIDlp4vn
moTlhoXlrZjnmoTlpKflsI/lrZfoioLmlL7lhaUNCj4gK+e7meWumueahOaxoOS4re+8jOWGjeas
oeS9v+eUqG5pZOS9nOS4uuiKgueCuUlE6L+b6KGM6L6F5Yqp5YaF5a2Y5YiG6YWN44CCZ2VuX3Bv
b2xfYWRkX3ZpcnQoKeWPmOS9k+WwhuaYvuW8jw0KPiAr54mp55CG5Zyw5Z2A5LiO5YaF5a2Y6IGU
57O76LW35p2l77yb5Y+q5pyJ5Zyo5YaF5a2Y5rGg6KKr55So5LqORE1B5YiG6YWN5pe277yM6L+Z
5omN5piv5b+F6KaB55qE44CCDQo+ICsNCj4gK+S7juWGheWtmOaxoOS4reWIhumFjeWGheWtmO+8
iOW5tuWwhuWFtuaUvuWbnu+8ieeahOWHveaVsOaYrzoNCj4gKw0KPiAr6K+lQVBJ5Zyo5Lul5LiL
5YaF5qC45Luj56CB5LitOg0KPiArDQo+ICtpbmNsdWRlL2xpbnV4L2dlbmFsbG9jLmgNCj4gKw0K
PiArbGliL2dlbmFsbG9jLmMNCj4gKw0KPiAr5q2j5aaC5Lq65Lus5omA5pyf5pyb55qE77yMZ2Vu
X3Bvb2xfYWxsb2MoKeWwhuS7jue7meWumueahOaxoOS4reWIhumFjXNpemU85a2X6IqC44CCZ2Vu
X3Bvb2xfZG1hX2FsbG9jKCkNCj4gK+WPmOmHj+WIhumFjeWGheWtmOeUqOS6jkRNQeaTjeS9nO+8
jOi/lOWbnmRtYeaJgOaMh+WQkeeahOepuumXtOS4reeahOebuOWFs+eJqeeQhuWcsOWdgOOAgui/
meWPquacieWcqOWGheWtmOaYr+eUqA0KPiArZ2VuX3Bvb2xfYWRkX3ZpcnQoKea3u+WKoOeahOaD
heWGteS4i+aJjeS8mui1t+S9nOeUqOOAguivt+azqOaEj++8jOi/meS4quWHveaVsOWBj+emu+S6
hmdlbnBvb2zpgJrluLjkvb/nlKgNCj4gK+aXoOespuWPt+mVv+WAvOadpeihqOekuuWGheaguOWc
sOWdgOeahOaooeW8j++8m+Wug+i/lOWbnuS4gOS4qnZvaWQgKiDmnaXku6Pmm7/jgIINCj4gKw0K
PiAr6L+Z5LiA5YiH55yL6LW35p2l6YO95q+U6L6D566A5Y2V77yb5LqL5a6e5LiK77yM5LiA5Lqb
5byA5Y+R6ICF5pi+54S26K6k5Li66L+Z5aSq566A5Y2V5LqG44CC5q+V56uf77yM5LiK6Z2i55qE
5o6l5Y+j5rKh5pyJ5o+QDQo+ICvkvpvlr7nliIbphY3lh73mlbDlpoLkvZXpgInmi6nov5Tlm57l
k6rlnZfnibnlrprlhoXlrZjnmoTmjqfliLbjgILlpoLmnpzpnIDopoHov5nmoLfnmoTmjqfliLbv
vIzkuIvpnaLnmoTlh73mlbDlsIbmmK/mnInmhI/kuYkNCj4gK+eahDoNCj4gKw0KPiAr6K+lQVBJ
5Zyo5Lul5LiL5YaF5qC45Luj56CB5LitOg0KPiArDQo+ICtsaWIvZ2VuYWxsb2MuYw0KPiArDQo+
ICvkvb/nlKhnZW5fcG9vbF9hbGxvY19hbGdvKCnov5vooYznmoTliIbphY3mjIflrprkuobkuIDn
p43nlKjkuo7pgInmi6nopoHliIbphY3nmoTlhoXlrZjnmoTnrpfms5XvvJvpu5jorqTnrpfms5Xl
j68NCj4gK+S7peeUqGdlbl9wb29sX3NldF9hbGdvKCnmnaXorr7nva7jgILmlbDmja7lgLzooqvk
vKDpgJLnu5nnrpfms5XvvJvlpKflpJrmlbDnrpfms5XkvJrlv73nlaXlroPvvIzkvYblgbblsJTk
uZ/kvJrpnIANCj4gK+imgeWug+OAguW9k+eEtu+8jOS6uuS7rOWPr+S7peWGmeS4gOS4queJueau
iueUqOmAlOeahOeul+azle+8jOS9huaYr+W3sue7j+acieS4gOWll+WFrOW5s+eahOeul+azleWP
r+eUqOS6hjoNCj4gKw0KPiArLSBnZW5fcG9vbF9maXJzdF9maXTmmK/kuIDkuKrnroDljZXnmoTl
iJ3phY3liIbphY3lmajvvJvlpoLmnpzmsqHmnInmjIflrprlhbbku5bnrpfms5XvvIzov5nmmK/p
u5jorqTnrpfms5XjgIINCj4gKw0KPiArLSBnZW5fcG9vbF9maXJzdF9maXRfYWxpZ27lvLrov6vl
iIbphY3mnInkuIDkuKrnibnlrprnmoTlr7npvZDmlrnlvI/vvIjpgJrov4dnZW5wb29sX2RhdGFf
YWxpZ27nu5MNCj4gKyAg5p6E5Lit55qE5pWw5o2u5Lyg6YCS77yJ44CCDQo+ICsNCj4gKy0gZ2Vu
X3Bvb2xfZmlyc3RfZml0X29yZGVyX2FsaWduIOaMieeFp+Wkp+Wwj+eahOmhuuW6j+aOkuWIl+WI
humFjeOAguS+i+Wmgu+8jOS4gOS4qjYw5a2X6IqC55qE5YiG6YWN5bCGDQo+ICsgIOS7pTY05a2X
6IqC5a+56b2Q44CCDQo+ICsNCj4gKy0gZ2VuX3Bvb2xfYmVzdF9maXTvvIzmraPlpoLkurrku6zm
iYDmnJ/mnJvnmoTvvIzmmK/kuIDkuKrnroDljZXnmoTmnIDkvbPljLnphY3liIbphY3lmajjgIIN
Cj4gKw0KPiArLSBnZW5fcG9vbF9maXhlZF9hbGxvY+WcqOaxoOS4reeahOS4gOS4queJueWumuWB
j+enu+mHj++8iOmAmui/h+aVsOaNruWPguaVsOWcqGdlbnBvb2xfZGF0YV9maXhlZOe7kw0KPiAr
ICDmnoTkuK3kvKDpgJLvvInov5vooYzliIbphY3jgILlpoLmnpzmjIflrprnmoTlhoXlrZjkuI3l
j6/nlKjvvIzliJnliIbphY3lpLHotKXjgIINCj4gKw0KPiAr6L+Y5pyJ5LiA5Lqb5YW25LuW55qE
5Ye95pWw77yM5Li76KaB5piv5Li65LqG5p+l6K+i5YaF5a2Y5rGg5Lit55qE5Y+v55So56m66Ze0
5oiW6L+t5Luj5YaF5a2Y5Z2X562J55uu55qE44CC54S26ICM77yM5aSn5aSa5pWwDQo+ICvnlKjm
iLflupTor6XkuI3pnIDopoHku6XkuIrmj4/ov7DnmoTlip/og73jgILlpoLmnpzlubjov5DnmoTo
r53vvIzlr7nov5nkuKrmqKHlnZfnmoTlub/ms5vorqTor4blsIbmnInliqnkuo7pmLLmraLlnKjm
nKrmnaXnvJYNCj4gK+WGmeeJueauiueUqOmAlOeahOWGheWtmOWIhumFjeWZqOOAgg0KPiArDQo+
ICvor6VBUEnlnKjku6XkuIvlhoXmoLjku6PnoIHkuK06DQo+ICsNCj4gK2xpYi9nZW5hbGxvYy5j
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFw
aS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9p
bmRleC5yc3QNCj4gaW5kZXggZTVkMmY0ZDU0MTNjLi4xZThjNTk2M2M0OTkgMTAwNjQ0DQo+IC0t
LSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2luZGV4LnJzdA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5y
c3QNCj4gQEAgLTEwMiw2ICsxMDIsNyBAQCBUb2RvbGlzdDoNCj4gICAgIG1lbW9yeS1hbGxvY2F0
aW9uDQo+ICAgICB1bmFsaWduZWQtbWVtb3J5LWFjY2Vzcw0KPiAgICAgbW0tYXBpDQo+ICsgICBn
ZW5hbGxvYw0KPg0KPiAgVG9kb2xpc3Q6DQo+DQo+IEBAIC0xMDksNyArMTEwLDYgQEAgVG9kb2xp
c3Q6DQo+ICAgICBkbWEtYXBpLWhvd3RvDQo+ICAgICBkbWEtYXR0cmlidXRlcw0KPiAgICAgZG1h
LWlzYS1scGMNCj4gLSAgIGdlbmFsbG9jDQo+ICAgICBwaW5fdXNlcl9wYWdlcw0KPiAgICAgYm9v
dC10aW1lLW1tDQo+ICAgICBnZnBfbWFzay1mcm9tLWZzLWlvDQo+IC0tDQo+IDIuMjcuMA0KPg0K
