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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C5DC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 15:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C15161462
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 15:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237114AbhDWPMe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 11:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237232AbhDWPMe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Apr 2021 11:12:34 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D878C061574
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 08:11:58 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso1430901pjn.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UtHqzS/Bwr4Y7nU8xvZ+iB/Ak4sFH35XMmBfQu+5WGA=;
        b=RwRI7H1ZgyAtItLkaE+ETKS1aOXs9oprjATmNQzwZtPPHqoCBuTNDZKFVIEIFcE3f7
         3hq6wYk/pbSUl8/niYClEaI3Smh0AF6h1nFgoVCTrtwazrAXpO64hoC1tO+MXoAKGKkE
         dT7zuZiVAmgaOSsseYcGRzXuTk7nLAXcDh4sHwV/dd46s6nBdu0/eVBlGKWHC3jnQhlJ
         3FnZ1x+xkPHt4Zpn2ZonZz9TxYfAsPufCIe4XAsX3+1bGW8ho/kQErIUlyJBX43sOitd
         2xGEw3OPOHpC8Sc45vmyP/zukigvupF0yCTS29wX/lCPa1UlHtSKTpHTht+oYquHIdjA
         O8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UtHqzS/Bwr4Y7nU8xvZ+iB/Ak4sFH35XMmBfQu+5WGA=;
        b=aPcDClVGOYyRrhRw4ucDPKLwaKeUMcN1hiNbdT/b6zneHZXPzjgxbaXAi+pS2C2Dsy
         +baG7mcSo8BpTmkqnV4PKkmKIeD46srN6mX4qH2CyAoFFWVVY2KAgfNVq4sxtuMtYAIy
         yLgv1shPRMAwpOVFg3pbTcg2DvgQbKK7agLXclu5vODsi5gyqubTDGoBKUZc4p6WjK7f
         0E713BZC2f/azV1TEpRXnmMlR5ul6Rm33qWxfJq+M8u6szgtyJWBMFcfXsGCQUH5jHyF
         c7aLg2Q/bfZ24RYGMuiptOM60h3I/M4z2jOl4Z/8g9fcmXYbmRhotRcbjusRxTO9r+Ea
         moCg==
X-Gm-Message-State: AOAM531ewAxjPkwurGXW+kuR2+EXeuBiqZDYdVlEnAgRIk4OX650IQ93
        rwzdtyuGbtExmS4rE2XxyF55lwjAelsh+xr3HX8=
X-Google-Smtp-Source: ABdhPJxqlZ3Imaf9sgDWvzy09gUMarJukmhXiuu/vfg10xEqZHGf2vLt2K6Mq9cznB4DKgN5A2BDd2sMJ8ZMg7LejbU=
X-Received: by 2002:a17:90a:f40a:: with SMTP id ch10mr4824171pjb.62.1619190717531;
 Fri, 23 Apr 2021 08:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619093668.git.bobwxc@email.cn> <9ba8f3c4e086bedf8052fb33e597636f4828e00d.1619093668.git.bobwxc@email.cn>
In-Reply-To: <9ba8f3c4e086bedf8052fb33e597636f4828e00d.1619093668.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 23 Apr 2021 23:11:45 +0800
Message-ID: <CAMU9jJotwoukf08xcsEL_-1VkZYQ0fDDLspcX8V7v5EOg+wkBw@mail.gmail.com>
Subject: Re: [PATCH 5/6] docs/zh_CN: Add translation zh_CN/maintainer/maintainer-entry-profile.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KV3UgWGlh
bmdDaGVuZyA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDIy5pel5ZGo5ZubIOS4i+WN
iDg6MjjlhpnpgZPvvJoNCj4NCj4gQWRkIGEgbmV3IHRyYW5zbGF0aW9uDQo+ICAgRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWFpbnRhaW5lci9tYWludGFpbmVyLWVudHJ5LXByb2Zp
bGUucnN0DQo+IGFuZCBsaW5rIGl0IHRvIHpoX0NOL21haW50YWluZXIvaW5kZXgucnN0DQo+DQo+
IFNpZ25lZC1vZmYtYnk6IFd1IFhpYW5nQ2hlbmcgPGJvYnd4Y0BlbWFpbC5jbj4NCj4gLS0tDQo+
ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvaW5kZXgucnN0ICAgfCAgMiArLQ0K
PiAgLi4uL21haW50YWluZXIvbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlLnJzdCAgIHwgOTIgKysr
KysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vbWFpbnRhaW5lci9tYWludGFpbmVyLWVudHJ5LXByb2ZpbGUucnN0DQo+DQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVy
L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIv
aW5kZXgucnN0DQo+IGluZGV4IDFhMTIyMmI3ODcxNS4uMThhODIwNzQxZjUyIDEwMDY0NA0KPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL2luZGV4LnJz
dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tYWludGFpbmVyL2lu
ZGV4LnJzdA0KPiBAQCAtMTYsOCArMTYsOCBAQA0KPiAgICAgY29uZmlndXJlLWdpdA0KPiAgICAg
cmViYXNpbmctYW5kLW1lcmdpbmcNCj4gICAgIHB1bGwtcmVxdWVzdHMNCj4gKyAgIG1haW50YWlu
ZXItZW50cnktcHJvZmlsZQ0KPg0KPiAgVE9ET0xpc3Q6DQo+DQo+IC0tICAgbWFpbnRhaW5lci1l
bnRyeS1wcm9maWxlDQo+ICAtICAgbW9kaWZ5aW5nLXBhdGNoZXMNCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvbWFpbnRhaW5lci1lbnRy
eS1wcm9maWxlLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWlu
ZXIvbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmExZWU5OWM0Nzg2ZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21haW50YWluZXIvbWFpbnRhaW5l
ci1lbnRyeS1wcm9maWxlLnJzdA0KPiBAQCAtMCwwICsxLDkyIEBADQo+ICsuLiBpbmNsdWRlOjog
Li4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9u
L21haW50YWluZXIvbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlLnJzdA0KPiArDQo+ICs66K+R6ICF
Og0KPiArDQo+ICsg5ZC05oOz5oiQIFd1IFhpYW5nQ2hlbmcgPGJvYnd4Y0BlbWFpbC5jbj4NCj4g
Kw0KPiArLi4gX21haW50YWluZXJlbnRyeXByb2ZpbGVfemg6DQo+ICsNCj4gK+e7tOaKpOiAhead
oeebruamguimgQ0KPiArPT09PT09PT09PT09PT0NCj4gKw0KPiAr57u05oqk5Lq65ZGY5p2h55uu
5qaC6KaB6KGl5YWF5LqG6aG25bGC6L+H56iL5paH5qGj77yI5o+Q5Lqk6KGl5LiB77yM5o+Q5Lqk
6amx5Yqo56iL5bqP4oCm4oCm77yJ77yM5aKe5Yqg5LqG5a2Q57O7DQo+ICvnu58v6K6+5aSH6amx
5Yqo56iL5bqP5pys5Zyw5Lmg5oOv5Lul5Y+K5pyJ5YWz6KGl5LiB5o+Q5Lqk55Sf5ZG95ZGo5pyf
55qE55u45YWz5YaF5a6544CC6LSh54yu6ICF5L2/55So5q2k5paH5qGjDQo+ICvmnaXosIPmlbTk
u5bku6znmoTmnJ/mnJvlkozpgb/lhY3luLjop4HplJnor6/vvJvnu7TmiqTkurrlkZjlj6/ku6Xk
vb/nlKjov5nkupvkv6Hmga/otoXotorlrZDns7vnu5/lsYLpnaLmn6XnnIsNCj4gK+aYr+WQpuac
ieacuuS8muaxh+iBmuWIsOmAmueUqOWunui3teS4reOAgg0KPiArDQo+ICsNCj4gK+aAu+iniA0K
PiArLS0tLQ0KPiArDQo+ICvmj5DkvpvkuoblrZDns7vnu5/lpoLkvZXmk43kvZznmoTku4vnu43j
gIJNQUlOVEFJTkVSU+aWh+S7tuWRiuivieS6hui0oeeMruiAheW6lOWPkemAgeafkOaWh+S7tuea
hOihpeS4geWIsOWTqu+8jA0KPiAr5L2G5a6D5rKh5pyJ5Lyg6L6+5YW25LuW5a2Q57O757uf55qE
5pys5Zyw5Z+656GA6K6+5pa95ZKM5py65Yi25Lul5Y2P5Yqp5byA5Y+R44CCDQo+ICsNCj4gK+iv
t+iAg+iZkeS7peS4i+mXrumimO+8mg0KPiArDQo+ICstIOW9k+ihpeS4geiiq+acrOWcsOagkeaO
pee6s+aIluWQiOW5tuWIsOS4iua4uOaXtuaYr+WQpuaciemAmuefpe+8nw0KPiArLSDlrZDns7vn
u5/mmK/lkKbkvb/nlKhwYXRjaHdvcmvlrp7kvovvvJ9QYXRjaHdvcmvnirbmgIHlj5jmm7TmmK/l
kKbmnInpgJrnn6XvvJ8NCj4gKy0g5piv5ZCm5pyJ5Lu75L2V5py65Zmo5Lq65oiWQ0nln7rnoYDo
rr7mlr3nm5Hop4bliJfooajvvIzmiJblrZDns7vnu5/mmK/lkKbkvb/nlKjoh6rliqjmtYvor5Xl
j43ppojku6Xkvr/miooNCj4gKyAg5o6n5o6l57qz6KGl5LiB77yfDQo+ICstIOiiq+aLieWFpS1u
ZXh055qER2l05YiG5pSv5piv5ZOq5Liq77yfDQo+ICstIOi0oeeMruiAheW6lOmSiOWvueWTquS4
quWIhuaUr+aPkOS6pO+8nw0KPiArLSDmmK/lkKbpk77mjqXliLDlhbbku5bnu7TmiqTogIXmnaHn
m67mpoLopoHvvJ/kvovlpoLkuIDkuKrorr7lpIfpqbHliqjlj6/og73mjIflkJHlhbbniLblrZDn
s7vnu5/nmoTmnaHnm67jgIINCj4gKyAg6L+Z5L2/5b6X6LSh54yu6ICF5oSP6K+G5Yiw5p+Q57u0
5oqk6ICF5Y+v6IO95a+55o+Q5Lqk6ZO+5Lit5YW25LuW57u05oqk6ICF6LSf5pyJ55qE5LmJ5Yqh
44CCDQo+ICsNCj4gKw0KPiAr5o+Q5Lqk5qOA5p+l5Y2V6KGl6YGXDQo+ICstLS0tLS0tLS0tLS0t
LQ0KPiArDQo+ICvliJflh7rlvLrliLbmgKflkozlkqjor6LmgKfmoIflh4bvvIzotoXlh7rpgJrn
lKjmoIflh4bigJzmj5DkuqTmo4Dmn6XooajvvIzku6Xkvr/nu7TmiqTogIXmo4Dmn6XkuIDkuKro
oaXkuIHmmK/lkKYNCj4gK+i2s+Wkn+WBpeW6t+OAguS+i+Wmgu+8muKAnOmAmui/h2NoZWNrcGF0
Y2gucGzvvIzmsqHmnInplJnor6/jgIHmsqHmnInorablkYrjgILpgJrov4fljZXlhYPmtYvor5Xo
r6bop4Hmn5DlpITigJ3jgIINCj4gKw0KPiAr5o+Q5Lqk5qOA5p+l5Y2V6KGl6YGX6L+Y5Y+v5Lul
5YyF5ous5pyJ5YWz56Gs5Lu26KeE5qC854q25oCB55qE6K+m57uG5L+h5oGv44CC5L6L5aaC77yM
5a2Q57O757uf5o6l5Y+X6KGl5LiB5LmL5YmNDQo+ICvmmK/lkKbpnIDopoHogIPomZHlnKjmn5Dk
uKrkv67orqLniYjkuIrlj5HluIPnmoTop4TojIPjgIINCj4gKw0KPiArDQo+ICvlvIDlj5Hlkajm
nJ/nmoTlhbPplK7ml6XmnJ8NCj4gKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICvmj5DkuqTo
gIXluLjluLjkvJror6/ku6XkuLrooaXkuIHlj6/ku6XlnKjlkIjlubbnqpflj6PlhbPpl63kuYvl
iY3nmoTku7vkvZXml7bpl7Tlj5HpgIHvvIzkuJTkuIvkuIDkuKotcmMx5pe25LuNDQo+ICvlj6/k
u6XjgILkuovlrp7kuIrvvIzlpKflpJrmlbDooaXkuIHpg73pnIDopoHlnKjkuIvkuIDkuKrlkIjl
ubbnqpflj6PmiZPlvIDkuYvliY3mj5DliY3ov5vlhaVsaW51eC1uZXh05Lit44CCDQo+ICvlkJHm
j5DkuqTogIXmvoTmuIXlhbPplK7ml6XmnJ/vvIjku6UtcmPlj5HluIPlkajkuLrmoIflv5fvvInk
u6XmmI7noa7ku4DkuYjml7blgJnooaXkuIHkvJrooqvogIPomZHlkIjlubbku6Xlj4oNCj4gK+S9
leaXtumcgOimgeetieW+heS4i+S4gOS4qi1yY+OAgg0KPiArDQo+ICvoh7PlsJHpnIDopoHorrLm
mI7vvJoNCj4gKw0KPiArLSDmnIDlkI7kuIDkuKrlj6/ku6Xmj5DkuqTmlrDlip/og73nmoQtcmPv
vJoNCj4gKyAg6ZKI5a+55LiL5LiA5Liq5ZCI5bm256qX5Y+j55qE5paw5Yqf6IO95o+Q5Lqk5bqU
6K+l5Zyo5q2k54K55LmL5YmN6aaW5qyh5Y+R5biD5Lul5L6b6ICD6JmR44CC5Zyo5q2k5pe26Ze0
54K5DQo+ICsgIOS5i+WQjuaPkOS6pOeahOihpeS4geW6lOivpeaYjuehruS7luS7rOeahOebruag
h+S4uuS4i+S4i+S4quWQiOW5tueql+WPo++8jOaIluiAhee7meWHuuW6lOWKoOW/q+i/m+W6puii
q+aOpeWPlw0KPiArICDnmoTlhYXotrPnkIbnlLHjgILpgJrluLjmlrDnibnmgKfotKHnjK7ogIXn
moTmj5DkuqTlupTlh7rnjrDlnKgtcmM15LmL5YmN44CCDQo+ICsNCj4gKy0g5pyA5ZCO5ZCI5bm2
LXJj77ya5ZCI5bm25Yaz562W55qE5pyA5ZCO5pyf6ZmQ44CCDQo+ICsgIOWQkei0oeeMruiAheaM
h+WHuuWwmuacquaOpeWPl+eahOihpeS4gembhumcgOimgeetieW+heS4i+S4i+S4quWQiOW5tueq
l+WPo+OAguW9k+eEtu+8jOe7tOaKpOiAheayoeacieS5ieWKoQ0KPiArICDmjqXlj5fmiYDmnInn
u5nlrprnmoTooaXkuIHpm4bvvIzkvYbmmK/lpoLmnpzlrqHpmIXlnKjmraTml7bpl7TngrnlsJrm
nKrnu5PmnZ/vvIzpgqPkuYjluIzmnJvotKHnjK7ogIXlupTor6UNCj4gKyAg562J5b6F5bm25Zyo
5LiL5LiA5Liq5ZCI5bm256qX5Y+j6YeN5paw5o+Q5Lqk44CCDQo+ICsNCj4gK+WPr+mAiemhue+8
mg0KPiArDQo+ICstIOW8gOWPkeWfuue6v+WIhuaUr+eahOmmluS4qi1yY++8jOWIl+WcqOamgui/
sOmDqOWIhu+8jOinhuS4uuW3suS4uuaWsOaPkOS6pOWBmuWlveWHhuWkh+OAgg0KPiArDQo+ICsN
Cj4gK+WuoemYheiKguWljw0KPiArLS0tLS0tLS0NCj4gKw0KPiAr6LSh54yu6ICF5pyA5ouF5b+D
55qE6Zeu6aKY5LmL5LiA5piv77ya6KGl5LiB6ZuG5bey5Y+R5biD5Y205pyq5pS25Yiw5Y+N6aaI
77yM5bqU5Zyo5aSa5LmF5ZCO5Y+R6YCB5o+Q6YaS44CC6Zmk5LqGDQo+ICvmjIflrprlnKjph43m
lrDmj5DkuqTkuYvliY3opoHnrYnlvoXlpJrplb/ml7bpl7TvvIzov5jlj6/ku6XmjIfnpLrmm7Tm
lrDnmoTpppbpgInmoLflvI/vvJvkvovlpoLvvIzph43mlrDlj5HpgIENCj4gK+aVtOS4quezu+WI
l++8jOaIluengeS4i+WPkemAgeaPkOmGkumCruS7tuOAguacrOiKguS5n+WPr+S7peWIl+WHuuac
rOWMuuWfn+eahOS7o+eggeWuoemYheaWueW8j++8jOS7peWPiuiOt+WPlg0KPiAr5LiN6IO955u0
5o6l5LuO57u05oqk6ICF6YKj6YeM5b6X5Yiw55qE5Y+N6aaI55qE5pa55rOV44CCDQo+ICsNCj4g
Kw0KPiAr546w5pyJ5qaC6KaBDQo+ICstLS0tLS0tLQ0KPiArDQo+ICvov5nph4zliJflh7rkuobn
jrDmnInnmoTnu7TmiqTkurrlkZjmnaHnm67mpoLopoHvvJvmiJHku6zlj6/og73kvJrmg7PopoHl
nKjkuI3kuYXnmoTlsIbmnaXlgZrkuIDkupvkuI3lkIznmoTkuovmg4XjgIINCj4gKw0KPiArLi4g
dG9jdHJlZTo6DQo+ICsgICA6bWF4ZGVwdGg6IDENCj4gKw0KPiArICAgLi4vZG9jLWd1aWRlL21h
aW50YWluZXItcHJvZmlsZQ0KPiArICAgLi4vLi4vLi4vbnZkaW1tL21haW50YWluZXItZW50cnkt
cHJvZmlsZQ0KPiArICAgLi4vLi4vLi4vcmlzY3YvcGF0Y2gtYWNjZXB0YW5jZQ0KPiAtLQ0KPiAy
LjIwLjENCj4NCg==
