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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F15DC4708F
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 07:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28B2E613AD
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 07:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhFDHiq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 03:38:46 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34415 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFDHiq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 03:38:46 -0400
Received: by mail-ot1-f46.google.com with SMTP id v27-20020a056830091bb02903cd67d40070so5183320ott.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 00:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ez5lETXpQCXR92R+DbI/uHPWxCjpDwac8Hof7t71BVY=;
        b=GVnQsp1+cdVxj+Nl3Nt8MtEqsI2wsFySwp/qmFG9ZENLZaXsYp3XA4sYsIH/VQ1JZ8
         JXecb99zlGZSP1M0wdlSRv50HF+DYA9vxMLXLe/lsV6q+coZLCDgRoUvLhjSL+mm9Wc1
         zQFGjFq0qAd6CMD9aXvo1Er/VsMyXM//86riPGrrEM0W1P1Smv67C6UIKc/AXhveyQU9
         9ww0C7sZ88GbrByZZNr6WgAizL3HXsxJnPzN/q2GeQ7K0w2dqfTbe/aKCXzBZG0ZTNh2
         etq2Kc2O77aFL1jGSlFjJMQFil4DWn1xVmMkodPnkA7v2JvJEEaFfXAdsnz4JZbCP9pa
         4htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ez5lETXpQCXR92R+DbI/uHPWxCjpDwac8Hof7t71BVY=;
        b=EpfFdZqZ9ynBI9ouemgRTHiumEH0aUHMCxcgb9DswUcYkY+kTFe23VYrWHTpv8/Kah
         gc8V+gM9h6jjAS3/NW98LHFVXg/IjB7CV/4FW4Wavoh1HSo4etArD0L+kbUDOfmUQ/+K
         hOX+E0bsve6f17h5r2m1wdYeaoTJVGVZ/YQH6qnhXt8Uc9QIIcSmGdlBSrbhceZ449dj
         oWBOH4iC9aJRZP12pOgdw5dh6amCfSKjtW4PT1l6zUPvi8AYe+rnpqzkWBO9bMNkByiw
         +Pi+m1fwUSKTGt7G3KY+ttRAZdJD45ZPqzgZ/lPOeJ8nnYTeAwkTQXyLoNiQvZ0HRyRn
         yagQ==
X-Gm-Message-State: AOAM5315MQzkKHregJCahLa8Floe+cNi2fkTduTrKdGEcCXxT/hLbFVo
        wskQDUViu0bMPSlrUzMXDJRHm6mnr2+GDePg3p63z770hSYZrZo2
X-Google-Smtp-Source: ABdhPJwH727yCMumDgwt7kcHi+XMn5jOdEcr8nnHyf88PA3QQcNLDYEYbzxsTW4uiqfgwoFCuf6eALDOxBFtMQNBSyk=
X-Received: by 2002:a9d:b86:: with SMTP id 6mr789632oth.340.1622792146616;
 Fri, 04 Jun 2021 00:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210603015802.2609230-1-siyanteng@loongson.cn> <20210603115040.GA5502@bobwxc.top>
In-Reply-To: <20210603115040.GA5502@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 4 Jun 2021 15:35:35 +0800
Message-ID: <CAEensMzJK313Fx5p9n1KipiBQgmFbsy6iYAjPt=_rgKysenh+w@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: add core api cachetlb translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NuaciDPml6Xlkajlm5sg5LiL5Y2I
Nzo1MOWGmemBk++8mg0KPg0KPiBIaSBZYW5UZW5nLA0KPg0KPiBJIGJ1aWxkIGl0LCBhbmQgZmlu
ZCBzb21lIHNtYWxsIHByb2JsZW1zLg0KPg0KPiBPbiBUaHUsIEp1biAwMywgMjAyMSBhdCAwOTo1
ODowMkFNICswODAwLCBZYW50ZW5nIFNpIHdyb3RlOg0KPiA+IFRyYW5zbGF0ZSBEb2N1bWVudGF0
aW9uL2NvcmUtYXBpL2NhY2hldGxiLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4g
djI6DQo+ID4NCj4gPiAqIGFkZCDmoKHor5HogIUocHJvb2ZyZWFkaW5nKSBzaWduLg0KPiA+ICAg
ICBJZiB5b3UgZG9uJ3Qgd2FudCBtZSB0byBkbyB0aGlzLCBwbGVhc2UgbGV0IG1lIGtub3cuDQo+
ID4NCj4gPiAqIE1vZGlmaWVkIHNvbWUgd29yZHMgdW5kZXIgWGlhbmdjaGVuZydzIGFuZCBBbGV4
J3MgYWR2aWNlcy4NCj4gPg0KPiA+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2Nh
Y2hldGxiLnJzdCAgfCAzMzcgKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi90cmFuc2xhdGlv
bnMvemhfQ04vY29yZS1hcGkvaW5kZXgucnN0ICAgICB8ICAgNyArLQ0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDM0MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9jYWNoZXRs
Yi5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9jb3JlLWFwaS9jYWNoZXRsYi5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9jb3JlLWFwaS9jYWNoZXRsYi5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZDM3NjUzZTAyOWQ4DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2NhY2hldGxi
LnJzdA0KPiBbLi4uXQ0KPiA+ICs1KSBgYHZvaWQgdXBkYXRlX21tdV9jYWNoZShzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwNCj4gPiArICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdCAq
cHRlcClgYA0KPiA+ICsNCj4gPiArICAg5Zyo5q+P5Liq6aG16Z2i5pWF6Zqc57uT5p2f5pe277yM
6L+Z5Liq56iL5bqP6KKr6LCD55So77yM5Lul5ZGK6K+J5L2T57O757uT5p6E54m55a6a55qE5Luj
56CB77yM5ZyoDQo+ID4gKyAgIOi9r+S7tumhteihqOS4re+8jOWcqOWcsOWdgOepuumXtOKAnHZt
YS0+dm1fbW3igJ3nmoTomZrmi5/lnLDlnYDigJzlnLDlnYDigJ3lpITvvIznjrDlnKjlrZjlnKgN
Cj4gPiArICAg5LiA5Liq57+76K+R44CCDQo+ID4gKw0KPiA+ICsgICDlj6/ku6XnlKjlroPmiYDp
gInmi6nnmoTku7vkvZXmlrnlvI/kvb/nlKjov5nkuKrkv6Hmga/mnaXov5vooYznp7vmpI3jgILk
vovlpoLvvIzlroPlj6/ku6Xkvb/nlKjov5kNCj4gPiArICAg5Liq5LqL5Lu25p2l5Li66L2v5Lu2
566h55CG55qEVExC6YWN572u6aKE6KOFVExC6L2s5o2i44CC55uu5YmNc3BhcmM2NOenu+akjeWw
seaYr+i/meS5iOW5sg0KPiA+ICsgICDnmoTjgIINCj4gPiArDQo+ID4gKw0KPiBbLi4uXQ0KPiA+
ICszKSBgYHZvaWQgZmx1c2hfY2FjaGVfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
DQo+ID4gKyAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKWBgDQo+ID4g
Kw0KPiA+ICsgICDlnKjov5nph4zvvIzmiJHku6zopoHku47nvJPlrZjkuK3liLfmlrDkuIDkuKrn
ibnlrprojIPlm7TnmoTvvIjnlKjmiLfvvInomZrmi5/lnLDlnYDjgILov5DooYwNCj4gPiArICAg
5ZCO77yM5Zyo4oCcc3RhcnTigJ3liLDigJxlbmQtMeKAneiMg+WbtOWGheeahOiZmuaLn+WcsOWd
gOeahOKAnHZtYS0+dm1fbW3igJ3nmoTnvJPlrZjkuK0NCj4gPiArICAg5bCG5rKh5pyJ6aG16KGo
6aG544CCDQo+ID4gKw0KPiA+ICsgICDigJx2bWHigJ3mmK/ooqvnlKjkuo7or6XljLrln5/nmoTl
pIfku73lrZjlgqjjgILkuLvopoHmmK/nlKjkuo5tdW5tYXAoKeexu+Wei+eahOaTjeS9nOOAgg0K
PiA+ICsNCj4gPiArICAg5o+Q5L6b6L+Z5Liq5o6l5Y+j5piv5biM5pyb56uv5Y+j6IO95aSf5om+
5Yiw5LiA5Liq5ZCI6YCC55qE5pyJ5pWI5pa55rOV5p2l5LuO57yT5a2Y5Lit5YigDQo+ID4gKyAg
IOmZpOWkmuS4qumhtemdouWkp+Wwj+eahOWMuuWfn++8jCDogIzkuI3mmK/orqnlhoXmoLjkuLrm
r4/kuKrlj6/og73ooqvkv67mlLnnmoTpobXooajpobnosIMNCj4gPiArICAg55SoIGZsdXNoX2Nh
Y2hlX3BhZ2UgKOingeS4i+aWhynjgIINCj4gPiArDQo+ID4gKw0KPiBbLi4uXQ0KPiA+ICs2KSBg
YHZvaWQgZmx1c2hfY2FjaGVfdm1hcCh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IGVuZClgYA0KPiA+ICsgICBgYHZvaWQgZmx1c2hfY2FjaGVfdnVubWFwKHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKWBgDQo+ID4gKw0KPiA+ICsgICDlnKjov5nph4zvvIzl
nKjov5nkuKTkuKrmjqXlj6PkuK3vvIzmiJHku6zku47nvJPlrZjkuK3liLfmlrDkuIDkuKrnibnl
rprojIPlm7TnmoTvvIjlhoXmoLjvvIkNCj4gPiArICAg6Jma5ouf5Zyw5Z2A44CC6L+Q6KGM5ZCO
77yM5Zyo4oCcc3RhcnTigJ3liLDigJxlbmQtMeKAneiMg+WbtOWGheeahOiZmuaLn+WcsOWdgOea
hOWGheaguOWcsA0KPiA+ICsgICDlnYDnqbrpl7TnmoTnvJPlrZjkuK3kuI3kvJrmnInpobXooajp
obnjgIINCj4gPiArDQo+ID4gKyAgIOi/meS4pOS4queoi+W6j+S4reeahOesrOS4gOS4quaYr+Wc
qHZtYXBfcmFuZ2UoKeWuieijheS6humhteihqOmhueS5i+WQjuiwg+eUqOeahOOAgg0KPiA+ICsg
ICDnrKzkuozkuKrmmK/lnKh2dW5tYXBfcmFuZ2UoKeWIoOmZpOmhteihqOmhueS5i+WJjeiwg+eU
qOeahOOAgg0KPiA+ICsNCj4NCj4gRm9yIGFib3ZlIHRocmVlIHBvaW50LCBhbm5vdGF0aW9uIHRl
eHQgaXMgbm90IGluZGVudGVkIGNvcnJlY3RseS4NCj4gVGhleSBhcmUgZGlmZmVyZW50IGZyb20g
b3RoZXJzLg0KSSBoYXZlIHJlcGxhY2VkIGl0IHdpdGggdGFiLCBwcm9iYWJseSBkdWUgdG8gbXkg
ZWRpdGluZyBpbiB2c2NvZGUuDQo+DQo+ID4gK+i/mOacieS4gOexu2Nwdee8k+WtmOmXrumimO+8
jOebruWJjemcgOimgeS4gOWll+WujOWFqOS4jeWQjOeahOaOpeWPo+adpeato+ehruWkhOeQhuOA
guacgOWkpw0KPiA+ICvnmoTpl67popjmmK/lpITnkIblmajnmoTmlbDmja7nvJPlrZjkuK3nmoTo
mZrmi5/liKvlkI3jgIINCj4gPiArDQo+ID4gKy4uIOivkeiAheacieivneivtO+8mg0KPg0KPiBB
bmQgdGhpcyBkaWQgbm90IGJlIHJlbmRlcmVkLCBzbyB1c2UgYmVsb3c/DQo+DQo+IC4uIG5vdGU6
Og0KT0vvvIENCj4NCj4gICAgICAgICDor5HogIXmnInor53or7TvvJoNCj4gPiArDQo+ID4gKyAg
ICAg6L+Z5q615YaF5a655pyJ5Lqb5pmm5rap77yM5Li65LqG5YeP6L275Lit5paH6ZiF6K+75Y6L
5Yqb77yM54m55L2c5q2k6K+R5rOo44CCDQo+ID4gKw0KPiA+ICsgICAgIOWIq+WQje+8iGFsaWFz
77yJ5bGe5LqO57yT5a2Y5LiA6Ie05oCn6Zeu6aKY77yM5b2T5LiN5ZCM55qE6Jma5ouf5Zyw5Z2A
5pig5bCE55u45ZCM55qEDQo+ID4gKyAgICAg54mp55CG5Zyw5Z2A77yM6ICM6L+Z5Lqb6Jma5ouf
5Zyw5Z2A55qEaW5kZXjkuI3lkIzvvIzmraTml7blsLHlj5HnlJ/kuobliKvlkI3njrDosaEo5aSa
DQo+ID4gKyAgICAg5Liq6Jma5ouf5Zyw5Z2A6KKr56ew5Li65Yir5ZCNKeOAgumAmuS/l+eCuead
peivtOWwseaYr+aMh+WQjOS4gOS4queJqeeQhuWcsOWdgOeahOaVsOaNruiiqw0KPiA+ICsgICAg
IOWKoOi9veWIsOS4jeWQjOeahGNhY2hlbGluZeS4reWwseS8muWHuueOsOWIq+WQjeeOsOixoeOA
gg0KPiA+ICsNCj4gPiArICAgICDluLjop4HnmoTop6PlhrPmlrnms5XmnInkuKTnp43vvJrnrKzk
uIDnp43mmK/noazku7bnu7TmiqTkuIDoh7TmgKfvvIzorr7orqHnibnlrprnmoRjcHXnlLUNCj4g
PiArICAgICDot6/mnaXop6PlhrPpl67popjvvIjkvovlpoLorr7orqHkuLpQSVBU55qEY2FjaGXv
vInvvJvnrKzkuoznp43mmK/ova/ku7bnu7TmiqTkuIDoh7TmgKfvvIwNCj4gPiArICAgICDlsLHm
mK/kuIvpnaLku4vnu43nmoRzcGFyY+eahOino+WGs+aWueahiOKAlOKAlOmhtemdouafk+iJsu+8
jOa2ieWPiueahOaKgOacr+e7huiKguWkquWkmu+8jA0KPiA+ICsgICAgIOivkeiAheS4jeS+v+Wx
leW8gO+8jOivt+ivu+iAheiHquihjOafpemYheebuOWFs+i1hOaWmeOAgg0KPiA+ICsNCj4NCj4g
QWxsIG90aGVycyBhcmUgZ29vZC4NCj4gUmV2aWV3ZWQtYnk6IFd1IFhpYW5nQ2hlbmcgPGJvYnd4
Y0BlbWFpbC5jbj4NClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNClRoYW5rcywNCg0KWWFu
dGVuZw0K
