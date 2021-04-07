Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0151EC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C178F611C9
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244843AbhDGHqK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240787AbhDGHqJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 03:46:09 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6581BC06174A
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 00:46:00 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id k25so17872939oic.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 00:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PIgEjoJ5pyaMBfxSrPBw4c5lmg5ow19+qFPTKBBJRDk=;
        b=cLBRMu/yab4Yjd0137JPRm/cRAU3MmcpErVcaDYRLtqmkhF3XxKWBfVRrYsCkHcCZM
         dz2pBcSkFvN1QD9AZjbagGPWmUKDWJlVqakcm087nu1qUacsql2mYic6hrGcwF7J7wbK
         ABN/hpSB/WsLXooiAjXjyAybr1DiD7EwuUIJype/KhBNkaLn/ULz1pSsbTvjJUCP353S
         mjzXKmzZD3wi6humNJXd5bvyqJjB1D/0GS1+ogVsGfaLpbyLcWH5K57l0wSekJhu5erG
         9pPkjnDj3HRm39JKcRYYlNy0Z0em+0xutkzFNFI7fiT0w4bDw0K8mrAXntRauWetltfa
         G6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PIgEjoJ5pyaMBfxSrPBw4c5lmg5ow19+qFPTKBBJRDk=;
        b=SdFSXg+IL79xerKgnkXVbcXbruwJqeb8DVp1ger8Cj1gRAzQpKahJ1c9QactJioTN0
         LsYGDNKqJtxBw3eXcK1p2mCTYCHPtyvWmN1Z3cY4vECecaIOLCTJFqXcrZT1xP75zFoM
         YOOBAIWBgCTYH1UWJkIeHwQzCJWddjOpTjRdMM+J57H02n6qPi41Sf2XYlJQUuxUZQOq
         4xNWuoWZSljVA5DK1Xxs6uEkfkrdYxgAJ9w6VzGEsHjRTR0AO/UiHnaBUw2VOScAnMQ+
         emsI9+eWPWeaeqv8vfFEPEEn7QANjYGnOWfZaJheOAdVncNQUNjfTSnuezoFeuQcr3TJ
         BObQ==
X-Gm-Message-State: AOAM531T8NijMQWTYnMqtOE3OXyusG4SIO+UTxQiIMh49R+/v54ZQGva
        k7yFVfwqJ/Mv3Q9J1Siq4JMWwUeV5TOmQAvr3Gs=
X-Google-Smtp-Source: ABdhPJwdKPTGP3VyYmA3vzDsd6VrqG7o9S+GrpodLtF0d2vkEpOvBTJaTRBsbBxXs+bjE1xJgn5VtFkQjf1xrSfnX3I=
X-Received: by 2002:a05:6808:2d0:: with SMTP id a16mr1330623oid.83.1617781559789;
 Wed, 07 Apr 2021 00:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-9-siyanteng@loongson.cn> <20210407070132.GB23907@bobwxc.top>
In-Reply-To: <20210407070132.GB23907@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 15:45:49 +0800
Message-ID: <CAEensMwiA1Z3sRitz7-8FzK3ixV=X69xYw_qXYQn3oFRNuvagw@mail.gmail.com>
Subject: Re: [PATCH 08/11] docs/zh_CN: add openrisc openrisc_port.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiL5Y2I
MzowMeWGmemBk++8mg0KPg0KPiBPbiBUdWUsIEFwciAwNiwgMjAyMSBhdCAwOTowMjowN1BNICsw
ODAwLCBZYW50ZW5nIFNpIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggdHJhbmxhdGVzIERvY3VtZW50
YXRpb24vb3BlbnJpc2Mvb3BlbnJpc2NfcG9ydC5yc3QgaW50byBDaGluZXNlDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0t
DQo+ID4gIC4uLi96aF9DTi9vcGVucmlzYy9vcGVucmlzY19wb3J0LnJzdCAgICAgICAgICB8IDEy
NCArKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25z
KCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9vcGVucmlzYy9vcGVucmlzY19wb3J0LnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL29wZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vb3BlbnJpc2Mvb3BlbnJpc2NfcG9y
dC5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
Nzc3NTRmMjYzOWNmDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL29wZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0DQo+ID4gQEAgLTAs
MCArMSwxMjQgQEANCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+
ID4gKw0KPiA+ICs6T3JpZ2luYWw6IDpkb2M6YC4uLy4uLy4uL29wZW5yaXNjL29wZW5yaXNjX3Bv
cnRgDQo+ID4gKzpUcmFuc2xhdG9yOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+
DQo+ID4gKw0KPiA+ICsuLiBfY25fb3BlbnJpc2NfcG9ydDoNCj4gPiArDQo+ID4gKz09PT09PT09
PT09PT09DQo+ID4gK09wZW5SSVNDIExpbnV4DQo+ID4gKz09PT09PT09PT09PT09DQo+ID4gKw0K
PiA+ICvov5nmmK9MaW51eOWvuU9wZW5SSVND57G75b6u5aSE55CG5Zmo55qE56e75qSN77yb5YW3
5L2T5p2l6K+077yM5pyA5pep56e75qSN55uu5qCH5pivMzLkvY0NCj4gPiArT3BlblJJU0MgMTAw
MOezu+WIl++8iOaIljFr77yJ44CCDQo+ID4gKw0KPiA+ICvlhbPkuo5PcGVuUklTQ+WkhOeQhuWZ
qOWSjOato+WcqOi/m+ihjOS4reeahOW8gOWPkeeahOS/oeaBrzoNCj4gPiArDQo+ID4gKyAgICAg
PT09PT09PSAgICAgICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gKyAgICAg
572R56uZICAgICAgICAgICAgICBodHRwczovL29wZW5yaXNjLmlvDQo+ID4gKyAgICAg6YKu566x
ICAgICAgICAgICAgICBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZw0KPiA+ICsgICAgID09
PT09PT0gICAgICAgICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICtPcGVuUklTQ+W3peWFt+mTvuWSjExpbnV455qE5p6E
5bu65oyH5Y2XDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr5Li65LqG5p6E5bu65ZKM6L+Q6KGMTGludXggZm9yIE9w
ZW5SSVND77yM5L2g6Iez5bCR6ZyA6KaB5LiA5Liq5Z+65pys55qE5bel5YW36ZO+77yM5oiW6K64
DQo+ID4gK+i/mOmcgOimgeaetuaehOaooeaLn+WZqOOAgiDov5nph4zmpoLov7Dkuoblh4blpIfl
sLHkvY3ov5nkupvpg6jliIbnmoTmraXpqqTjgIINCj4gPiArDQo+ID4gKzEpIOW3peWFt+mTvg0K
PiA+ICsNCj4gPiAr5bel5YW36ZO+5LqM6L+b5Yi25paH5Lu25Y+v5Lul5LuOb3BlbnJpc2MuaW/m
iJbmiJHku6znmoRnaXRodWLlj5HluIPpobXpnaLojrflvpfjgILkuI3lkIwNCj4gPiAr5bel5YW3
6ZO+55qE5p6E5bu65oyH5Y2X5Y+v5Lul5Zyob3BlbnJpc2MuaW/miJZTdGFmZm9yZOeahOW3peWF
t+mTvuaehOW7uuWSjOWPkeW4g+iEmuacrA0KPiA+ICvkuK3mib7liLDjgIINCj4gPiArDQo+ID4g
KyAgICAgPT09PT09PT09PSAgICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4gPiArICAgICDkuozov5vliLYgICAgICAgICAgaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5yaXNjL29yMWstZ2NjL3JlbGVhc2VzDQo+ID4gKyAgICAg5bel5YW36ZO+ICAg
ICAgICAgIGh0dHBzOi8vb3BlbnJpc2MuaW8vc29mdHdhcmUNCj4gPiArICAgICDmnoTlu7ogICAg
ICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vc3RmZnJkaHJuL29yMWstdG9vbGNoYWluLWJ1aWxk
DQo+ID4gKyAgICAgPT09PT09PT09PSAgICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+ID4gKzIpIOaehOW7ug0KPiA+ICsNCj4gPiAr
5YOP5b6A5bi45LiA5qC35p6E5bu6TGludXjlhoXmoLg6Og0KPiA+ICsNCj4gPiArICAgICBtYWtl
IEFSQ0g9b3BlbnJpc2MgQ1JPU1NfQ09NUElMRT0ib3Ixay1saW51eC0iIGRlZmNvbmZpZw0KPiA+
ICsgICAgIG1ha2UgQVJDSD1vcGVucmlzYyBDUk9TU19DT01QSUxFPSJvcjFrLWxpbnV4LSINCj4g
PiArDQo+ID4gKzMpIOWcqEZQR0HkuIrov5DooYzvvIjlj6/pgIkpDQo+ID4gKw0KPiA+ICtPcGVu
UklTQ+ekvuWMuumAmuW4uOS9v+eUqEZ1c2VTb0PmnaXnrqHnkIbmnoTlu7rlkoznvJbnqItTb0Pl
iLBGUEdB5Lit44CCIOS4i+mdouaYr+eUqA0KPiA+ICtPcGVuUklTQyBTb0Plr7lEZTAgTmFub+W8
gOWPkeadv+i/m+ihjOe8lueoi+eahOS4gOS4quS+i+WtkOOAgiDlnKjmnoTlu7rov4fnqIvkuK3v
vIwNCj4gPiArRlBHQSBSVEzmmK/ku45GdXNlU29DIElQ5qC45bqT5Lit5LiL6L2955qE5Luj56CB
77yM5bm25L2/55SoRlBHQeS+m+W6lOWVhuW3peWFt+aehOW7uuOAgg0KPiA+ICvkuozov5vliLbm
lofku7bnlKhvcGVub2Nk5Yqg6L295Yiw55S16Lev5p2/5LiK44CCDQo+ID4gKw0KPiA+ICs6Og0K
PiA+ICsNCj4gPiArICAgICBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL29sb2ZrL2Z1c2Vz
b2MNCj4gPiArICAgICBjZCBmdXNlc29jDQo+ID4gKyAgICAgc3VkbyBwaXAgaW5zdGFsbCAtZSAu
DQo+ID4gKw0KPiA+ICsgICAgIGZ1c2Vzb2MgaW5pdA0KPiA+ICsgICAgIGZ1c2Vzb2MgYnVpbGQg
ZGUwX25hbm8NCj4gPiArICAgICBmdXNlc29jIHBnbSBkZTBfbmFubw0KPiA+ICsNCj4gPiArICAg
ICBvcGVub2NkIC1mIGludGVyZmFjZS9hbHRlcmEtdXNiLWJsYXN0ZXIuY2ZnIFwNCj4gPiArICAg
ICAgICAgICAgIC1mIGJvYXJkL29yMWtfZ2VuZXJpYy5jZmcNCj4gPiArDQo+ID4gKyAgICAgdGVs
bmV0IGxvY2FsaG9zdCA0NDQ0DQo+ID4gKyAgICAgPiBpbml0DQo+ID4gKyAgICAgPiBoYWx0OyBs
b2FkX2ltYWdlIHZtbGludXggOyByZXNldA0KPiA+ICsNCj4gPiArNCkg5Zyo5qih5ouf5Zmo5LiK
6L+Q6KGM77yI5Y+v6YCJ77yJDQo+ID4gKw0KPiA+ICtRRU1V5piv5LiA5Liq5aSE55CG5Zmo5Lu/
55yf5Zmo77yM5oiR5Lus5o6o6I2Q5a6D5p2l5qih5oufT3BlblJJU0PlubPlj7DjgIIg6K+35oyJ
54WnUUVNVee9kQ0KPiA+ICvnq5nkuIrnmoRPcGVuUklTQ+ivtOaYju+8jOiuqUxpbnV45ZyoUUVN
VeS4iui/kOihjOOAgiDkvaDlj6/ku6Xoh6rlt7HmnoTlu7pRRU1V77yM5L2G5L2g55qEDQo+ID4g
K0xpbnV45Y+R6KGM54mI5Y+v6IO95o+Q5L6b5LqG5pSv5oyBT3BlblJJU0PnmoTkuozov5vliLbl
jIXjgIINCj4gPiArDQo+ID4gKyAgICAgPT09PT09PT09PT09PSAgID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsgICAgIHFlbXUgb3Bl
bnJpc2MgICBodHRwczovL3dpa2kucWVtdS5vcmcvRG9jdW1lbnRhdGlvbi9QbGF0Zm9ybXMvT3Bl
blJJU0MNCj4gPiArICAgICA9PT09PT09PT09PT09ICAgPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPiArDQo+ID4gK+acr+ivreihqA0KPiA+ICs9PT09PT09PT09PQ0KPiA+ICtpDQo+DQo+IHJl
bW92ZSB0aGUgJ2knDQpPSyENCj4NCj4gPiAr5Zyo5Luj56CB5Lit77yM5Li65LqG5bCG6IyD5Zu0
6ZmQ5Yi25Zyo5oiW5aSa5oiW5bCR55qE54m55a6a5aSE55CG5Zmo5a6e546w5LiK77yM5Zyo56ym
5Y+35LiK5L2/55So5LqG5Lul5LiL57qm5a6a44CCDQo+DQo+IE1heWJlIHRoaXMgYmV0dGVyOg0K
Pg0KPiDku6PnoIHkuK3kvb/nlKjkuobku6XkuIvnrKblj7fnuqblrprku6XlsIbojIPlm7TpmZDl
iLblnKjlh6DkuKrnibnlrprlpITnkIblmajlrp7njrDkuIrvvIzvvJoNCk9LIQ0KPg0KPiA+ICsN
Cj4gPiArPT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiA+ICtvcGVucmlzYzogT3BlblJJU0PnsbvlnovlpITnkIblmagNCj4gPiArb3IxazogICAgIE9w
ZW5SSVNDIDEwMDDns7vliJflpITnkIblmagNCj4gPiArb3IxMjAwOiAgIE9wZW5SSVNDIDEyMDDl
pITnkIblmagNCj4gPiArPT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiA+ICsNCj4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvljoblj7INCj4g
PiArPT09PT09PT0NCj4NCj4gSW4gZm9sbG93aW5nIHBhcnTvvIwgcGxlYXNlIGNoZWNrIHRoZSB1
c2luZyBvZiBUYWIgYW5kIFNwYWNlLg0KPg0KT0shDQo+ID4gKw0KPiA+ICsxOC0xMS0yMDAzICAg
TWF0amF6IEJyZXNrdmFyIChwaG9lbml4QGJzZW1pLmNvbSkNCj4NCj4gbWF5YmUgWVlZWS1NTS1E
RCBpcyBiZXR0ZXIgZm9yIHpoIHRyYW5zbGF0aW9uLg0KPg0KT0shDQo+ID4gKyAgICDlsIZsaW51
eOWIneatpeenu+akjeWIsE9wZW5SSVND5oiWMzLmnrbmnoTjgIINCj4gPiArICAgICAgICDmiYDm
nInnmoTmoLjlv4Plip/og73pg73lrp7njrDkuobvvIzlubbkuJTlj6/ku6Xkvb/nlKjjgIINCj4g
PiArDQo+ID4gKzA4LTEyLTIwMDMgICBNYXRqYXogQnJlc2t2YXIgKHBob2VuaXhAYnNlbWkuY29t
KQ0KPiA+ICsgICAg5b275bqV5pS55Y+YVExC5aSx6K+v5aSE55CG44CCDQo+ID4gKyAgICDph43l
hpnlvILluLjlpITnkIbjgIINCj4gPiArICAgIOWcqOm7mOiupOeahGluaXRyZOS4reWunueOsOS6
hnNhc2gtMy4255qE5omA5pyJ5Yqf6IO944CCDQo+ID4gKyAgICDlpKfluYXmlLnov5vnmoTniYjm
nKzjgIINCj4gPiArDQo+ID4gKzEwLTA0LTIwMDQgICBNYXRqYXogQnJlc2t2YXIgKHBob2VuaXhA
YnNlbWkuY29tKQ0KPiA+ICsgICAg5aSn6YeP55qEYnVn5L+u5aSN44CCDQo+ID4gKyAgICDmlK/m
jIHku6XlpKrnvZHvvIxodHRw5ZKMdGVsbmV05pyN5Yqh5Zmo5Yqf6IO944CCDQo+ID4gKyAgICDl
j6/ku6Xov5DooYzorrjlpJrmoIflh4bnmoRsaW51eOW6lOeUqOeoi+W6j+OAgg0KPiA+ICsNCj4g
PiArMjYtMDYtMjAwNCAgIE1hdGpheiBCcmVza3ZhciAocGhvZW5peEBic2VtaS5jb20pDQo+ID4g
KyAgICAg56e75qSN5YiwMi42LnjjgIINCj4gPiArDQo+ID4gKzMwLTExLTIwMDQgICBNYXRqYXog
QnJlc2t2YXIgKHBob2VuaXhAYnNlbWkuY29tKQ0KPiA+ICsgICAg5aSn6YeP55qEYnVn5L+u5aSN
5ZKM5aKe5by65Yqf6IO944CCDQo+ID4gKyAgICDlop7liqDkuoZvcGVuY29yZXMgZnJhbWVidWZm
ZXLpqbHliqjjgIINCj4gPiArDQo+ID4gKzA5LTEwLTIwMTAgICAgSm9uYXMgQm9ubiAoam9uYXNA
c291dGhwb2xlLnNlKQ0KPiA+ICsgICAgIOmHjeWkp+mHjeWGme+8jOS9v+WFtuS4juS4iua4uOea
hExpbnV4IDIuNi4zNueci+m9kOOAgg0KPiA+IC0tDQo+ID4gMi4yNy4wDQo+DQo+IFRoYW5rcyEN
Cj4NCj4gV3UgWC5DLg0KPg0KDQpUaGFua3MhDQoNCllhbnRlbmcNCg==
