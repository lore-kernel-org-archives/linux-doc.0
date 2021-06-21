Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95930C4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 13:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71006611C1
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 13:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhFUNfL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 09:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbhFUNfL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 09:35:11 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A8DC061574
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 06:32:56 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so8222737pjo.3
        for <linux-doc@vger.kernel.org>; Mon, 21 Jun 2021 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QI/G9F05SOZzH+BMTmtZirHzJSFSQCGc/JYF2spwjig=;
        b=n0UyMkwSqqjwtMRWDJa/eBwzimyXxQRr3p2Waj412xalSIf+o8ZtS5n+AWjPov05WQ
         gA7BS0U0OgFXna5ZmBSMOtHaosY6ylRNKxa50ogohV5wdVJF4CNqlqCobQAaTM6OzRdc
         7QTghCXjKqPnB7Zzaa3fOMVgo2Axp6OfSMsFPAGtnMuceQtODt1M9uaR2N/9Jk4xukIw
         1cfivrgzYtyNFdDOAji5BQcVSjCQXdKuul8SKyViJectc6EAy9h02oVn4UjaXN517k+i
         rHAPkC2FFfgky1cmu7BV6Ra2ZIV7+nk9gu1ACTD+m2X3G6m5ot52iES1n2HQ3TEdYdMs
         3foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QI/G9F05SOZzH+BMTmtZirHzJSFSQCGc/JYF2spwjig=;
        b=Ikd7GVmnNH9RFTc3OX3dWiHZKoqg4mGw33+5cTeJaXa7kEHNWiZuQ3RNWsea3VdfXt
         tKm3oydO+F055vu1ZM2n91KD78G3SY7PbuSPqqzRU0/yI2dcbcR0J1ZBqIgxvQ3+wB5w
         nNyTpdu56ExOt/A98jaYtzI+WgNCnZfb4QPZvlhKIHJMvjKv9CeqHh00/+pND8r0q78Z
         wHZ4W2CvEa8NqJrVMv5/qwbRNeMl1BqXjpV0+ns9pzGU7A12Ujs/5swPv3Fr3ifwlY9N
         5Sr2aqU+Hc6ZE1V+Myyc68VMNcBMAZnirQE61cyjvF/jE+ZOL7wNoY98aGpRhIclGbTf
         frBA==
X-Gm-Message-State: AOAM5337MbupDL/vAH1R3Z4nCBvm4cr4N23cbPNyXWWcHAAzd442GGKk
        lZke2z0XN6xjjU1dcTqm+RYiuJc4NZp0lHCsdCk=
X-Google-Smtp-Source: ABdhPJyW1jBxQOyNS87mRKku3GRZg0iD8O1TuGFstg08pnTtHUuROsXMO5HDavVGC+mBJLail9JLXxzLcoDAKK3mhzg=
X-Received: by 2002:a17:902:6b09:b029:112:1e7a:a227 with SMTP id
 o9-20020a1709026b09b02901121e7aa227mr17869490plk.31.1624282376159; Mon, 21
 Jun 2021 06:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624169811.git.bobwxc@email.cn> <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
 <e7972da7-d17a-e48a-368e-b5f313625e3d@gmail.com>
In-Reply-To: <e7972da7-d17a-e48a-368e-b5f313625e3d@gmail.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Mon, 21 Jun 2021 21:32:45 +0800
Message-ID: <CAMU9jJqAf1dYSr6OTq5hA3ivLUmQ7QchnAtZiGtRy2Xrb6r+Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add translation zh_CN/admin-guide/efi-stub.rst
To:     Alex Shi <seakeel@gmail.com>
Cc:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0NuaciDIx5pel5ZGo5LiAIOS4
i+WNiDU6MTPlhpnpgZPvvJoNCj4NCj4NCj4NCj4gT24gNi8yMC8yMSA2OjQwIFBNLCBXdSBYaWFu
Z0NoZW5nIHdyb3RlOg0KPiA+IEFkZCBhIG5ldyB0cmFuc2xhdGlvbg0KPiA+ICAgRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvZWZpLXN0dWIucnN0DQo+ID4gYW5k
IGxpbmsgaXQgdG8gemhfQ04vYWRtaW4tZ3VpZGUvaW5kZXgucnN0DQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBXdSBYaWFuZ0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+ID4gLS0tDQo+ID4gIC4u
Li96aF9DTi9hZG1pbi1ndWlkZS9lZmktc3R1Yi5yc3QgICAgICAgICAgICB8IDg2ICsrKysrKysr
KysrKysrKysrKysNCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9pbmRl
eC5yc3QgIHwgIDIgKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9lZmktc3R1Yi5yc3QNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9lZmktc3R1
Yi5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9lZmkt
c3R1Yi5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uYjZhNGNlZGVjOGViDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2VmaS1zdHViLnJzdA0KPiA+IEBAIC0w
LDAgKzEsODYgQEANCj4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+
ID4gKw0KPiA+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZWZpLXN0dWIu
cnN0DQo+ID4gKw0KPiA+ICs66K+R6ICFOg0KPiA+ICsNCj4gPiArIOWQtOaDs+aIkCBXdSBYaWFu
Z0NoZW5nIDxib2J3eGNAZW1haWwuY24+DQo+ID4gKw0KPiA+ICs9PT09PT09PT0NCj4gPiArRUZJ
5byV5a+85qGpDQo+ID4gKz09PT09PT09PQ0KPiA+ICsNCj4gPiAr5ZyoeDg25ZKMQVJN5bmz5Y+w
5LiK77yM5YaF5qC4ekltYWdlL2J6SW1hZ2Xlj6/ku6XkvKroo4XmiJBQRS9DT0ZG5pig5YOP77yM
5LuO6ICM5L2/RUZJ5Zu65Lu25Yqg6L29DQo+ID4gK+eoi+W6j+WKoOi9veWFtuS9nOS4ukVGSeWP
r+aJp+ihjOaWh+S7tuOAguS/ruaUuWJ6SW1hZ2XlpLTku6Xlj4rlm7rku7bliqDovb3nqIvluo/o
t7PovaznibnlrprlhaXlj6PngrnnmoQNCj4gPiAr5Luj56CB6KKr57uf56ew5Li64oCcRUZJ5byV
5a+85qGp77yIRUZJIEJvb3QgU3R1Yu+8ieKAne+8jOWIhuW4g+WcqGFyY2gveDg2L2Jvb3QvaGVh
ZGVyLlPlkowNCj4gPiArYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2Vib290LmPkuK3jgILlr7nk
uo5BUk3vvIxFRknmoanlnKhhcmNoL2FybS9ib290L2NvbXByZXNzZWQvZWZpLWhlYWRlci5TDQo+
ID4gK+WSjGFyY2gvYXJtL2Jvb3QvY29tcHJlc3NlZC9lZmktc3R1Yi5j5Lit5a6e546w44CC5L2T
57O757uT5p6E5LmL6Ze05YWx5Lqr55qERUZJ5qGp5Luj56CBDQo+ID4gK+S9jeS6jmRyaXZlcnMv
ZmlybXdhcmUvZWZpL2xpYnN0dWLkuK3jgIINCj4gPiArDQo+ID4gK+iAjGFybTY05rKh5pyJ5Y6L
57yp5YaF5qC45pSv5oyB77yM5Zug5q2k5pig5YOP5pys6Lqr5Lyq6KOF5oiQUEUvQ09GRuaYoOWD
j++8jEVGSeahqemTvuaOpeWIsOWGheaguOOAgg0KPg0KPiBhcm02NOS4jeaUr+aMgeWOi+e8qeWG
heaguO+8nw0KSGkgQWxleDoNCg0KbHMgbGludXgtbmV4dC9hcmNoL2FybTY0DQogIFRoZXJlIGlz
IG5vIGNvbXByZXNzZWQgZmlsZS4NCmxzIGxpbnV4LW5leHQvYXJjaC9taXBzDQogIFRoZXJlIGlz
IGNvbXByZXNzZWQgaGVyZSwNCg0Kc28sIEkgdGhpbmsgIkZvciBhcm02NCwgdGhlcmUgaXMgbm8g
Y29tcHJlc3NlZCBrZXJuZWwgc3VwcG9ydCIgOi0pDQoNClRoYW5rcywNCllhbnRlbmcNCj4NCj4g
VGhhbmtzDQo+IEFsZXgNCj4gPiArYXJtNjQgRUZJ5qGp5L2N5LqOYXJjaC9hcm02NC9rZXJuZWwv
RUZJIGVudHJ5LlPlkoxkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2FybTY0LXN0dWIuYw0K
PiA+ICvkuK3jgIINCj4gPiArDQo+ID4gK+mAmui/h+S9v+eUqEVGSeW8leWvvOahqe+8jOWPr+S7
peWcqOS4jeS9v+eUqOS8oOe7n0VGSeW8leWvvOWKoOi9veeoi+W6j+eahOaDheWGteS4i+W8leWv
vExpbnV45YaF5qC477yMDQo+ID4gK+WmgmdydWLmiJZlbGlsb+OAgueUseS6jkVGSeW8leWvvOah
qeaJp+ihjOS6huW8leWvvOWKoOi9veeoi+W6j+eahOW3peS9nO+8jOWboOatpOafkOenjeaEj+S5
ieS4iuadpeivtA0KPiA+ICvlroMgKuWwseaYryog5byV5a+85Yqg6L2956iL5bqP44CCDQo+ID4g
Kw0KPiA+ICtFRknlvJXlr7zmoanpgJrov4dDT05GSUdfRUZJX1NUVULlhoXmoLjpgInpobnlkK/n
lKjjgIINCj4gPiArDQo+ID4gKw0KPiA+ICvlpoLkvZXlronoo4ViekltYWdlLmVmaQ0KPiA+ICst
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvkvY3kuo5hcmNoL3g4Ni9ib290L2J6SW1h
Z2XkuK3nmoRiekltYWdl5b+F6aG75aSN5Yi25YiwRUZJ57O757uf5YiG5Yy677yIRVNQ77yJ5bm2
5L+u5pS55omp5bGV5ZCNDQo+ID4gK+S4uuKAnC5lZmnigJ3jgILmsqHmnInmianlsZXlkI3nmoTo
r51FRknlm7rku7bliqDovb3nqIvluo/lsIbmi5Lnu53miafooYzlroPjgILlsJrml6Dms5Xku47m
ma7pgJrnmoRMaW51eOaWh+S7tg0KPiA+ICvns7vnu5/kuK3miafooYxiekltYWdlLmVmae+8jOWb
oOS4ukVGSeWbuuS7tuS4jeaUr+aMgei/meS6m+aWh+S7tuezu+e7n+OAgkFSTeW5s+WPsOmcgOim
geWwhmFyY2gvYXJtL2Jvb3QvekltYWdlDQo+ID4gK+WkjeWItuWIsOezu+e7n+WIhuWMuu+8jOW5
tuWPr+iDveaXoOmcgOmHjeWRveWQje+8m2FybTY05Lmf57G75Ly877yM6ZyA6KaB5aSN5Yi2YXJj
aC9hcm02NC9ib290L0ltYWdl77yMDQo+ID4gK+S9huS4jeS4gOWumuimgemHjeWRveWQjeOAgg0K
PiA+ICsNCj4gPiArDQo+ID4gK+S7jkVGSSBzaGVsbOS8oOmAkuWGheaguOWPguaVsA0KPiA+ICst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiAr5YaF5qC45Y+C5pWw5Y+v5LqOYnpJ
bWFnZS5lZmnkuYvlkI7kvKDpgJLvvIzkvovlpoI6Og0KPiA+ICsNCj4gPiArICAgICBmczA6PiBi
ekltYWdlLmVmaSBjb25zb2xlPXR0eVMwIHJvb3Q9L2Rldi9zZGE0DQo+ID4gKw0KPiA+ICsNCj4g
PiAr4oCcaW5pdHJkPeKAnemAiemhuQ0KPiA+ICstLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvk
uI7lpKflpJrmlbDlvJXlr7zliqDovb3nqIvluo/kuIDmoLfvvIxFRknmoanlhYHorrjnlKjmiLfk
vb/nlKjigJxpbml0cmQ94oCd6YCJ6aG55oyH5a6a5aSa5LiqaW5pdHJk5paH5Lu244CCDQo+ID4g
K+i/meaYr+WUr+S4gOeahEVGSeahqeeJueauiueJueWRveS7pOihjOWPguaVsO+8jOWFtuS7luaJ
gOacieWGheWuuemDveWcqOWwhuWGheaguOWQr+WKqOaXtuS8oOmAkue7meWGheaguOOAgg0KPiA+
ICsNCj4gPiAraW5pdHJk5paH5Lu255qE6Lev5b6E5b+F6aG75Li65LuORVNQ5byA5aeL55qE57ud
5a+56Lev5b6E77yM55u45a+56Lev5b6E5peg5rOV5L2/55So44CC5ZCM5pe25q2k6Lev5b6E5Li6
RUZJDQo+ID4gK+mjjuagvO+8jOebruW9leWFg+e0oOW/hemhu+eUqOWPjeaWnOadoO+8iFzvvInl
iIbpmpTjgILkvovlpoLnu5nlrprku6XkuIvnm67lvZXluIPlsYA6Og0KPiA+ICsNCj4gPiArICBm
czA6Pg0KPiA+ICsgICAgIEtlcm5lbHNcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJ6SW1h
Z2UuZWZpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGluaXRyZC1sYXJnZS5pbWcNCj4gPiAr
DQo+ID4gKyAgICAgUmFtZGlza3NcDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGluaXRyZC1z
bWFsbC5pbWcNCj4gPiArICAgICAgICAgICAgICAgICAgICAgaW5pdHJkLW1lZGl1bS5pbWcNCj4g
PiArDQo+ID4gK+eOsOW3peS9nOebruW9leS4umZzMDpcS2VybmVsc++8jOimgeS9v+eUqGluaXRy
ZC1sYXJnZS5pbWfmlofku7blvJXlr7zvvIzliJnpobvkvb/nlKjku6XkuIvlkb3ku6Q6Og0KPiA+
ICsNCj4gPiArICAgICBmczA6XEtlcm5lbHM+IGJ6SW1hZ2UuZWZpIGluaXRyZD1cS2VybmVsc1xp
bml0cmQtbGFyZ2UuaW1nDQo+ID4gKw0KPiA+ICvor7fms6jmhI9iekltYWdlLmVmaeaYr+aAjuag
t+WPr+eUqOebuOWvuei3r+W+hOaMh+WumueahOOAgumCo+aYr+WboOS4uuaIkeS7rOaJp+ihjOea
hOaYoOWDj+aYr+eUsUVGSSBzaGVsbA0KPiA+ICvop6Pph4rnmoTvvIzlroPlj6/op6PmnpDnm7jl
r7not6/lvoTvvIzogIzlkb3ku6TooYznmoTlhbbkvZnpg6jliIbliJnkvKDpgJLnu5liekltYWdl
LmVmaeOAgg0KPiA+ICsNCj4gPiArDQo+ID4gK+KAnGR0Yj3igJ3pgInpobkNCj4gPiArLS0tLS0t
LS0tLQ0KPiA+ICsNCj4gPiAr5a+55LqOQVJN5ZKMYXJtNjTkvZPns7vnu5PmnoTvvIzlv4Xpobvk
uLrlhoXmoLjmj5DkvpvkuIDkuKrorr7lpIfmoJHjgILpgJrluLjlm7rku7blupTpgJrov4dFRkkg
Q09ORklHVVJBVElPTg0KPiA+ICtUQUJMRe+8iEVGSemFjee9ruihqO+8ieadpeaUr+aMgeiuvuWk
h+agkeOAguS9huaYr+KAnGR0Yj3igJ3lkb3ku6TooYzpgInpobnlj6/ku6XnlKjkuo7opobnm5bl
m7rku7bmj5DkvpvnmoTorr7lpIcNCj4gPiAr5qCR77yM5oiW5Zyo5Zu65Lu25peg5rOV5o+Q5L6b
5pe25p2l5o+Q5L6b5LiA5Liq6K6+5aSH5qCR44CCDQo+ID4gKw0KPiA+ICvor7fms6jmhI/vvJrl
m7rku7blsIblnKjlkK/liqjlhoXmoLjkuYvliY3lsIbov5DooYzml7bphY3nva7kv6Hmga/mt7vl
iqDliLDorr7lpIfmoJHjgILlpoLmnpwgYGBkdGI9YGAg6KKr55So5p2lDQo+ID4gK+imhuebluiu
vuWkh+agke+8jOWImeWbuuS7tuaPkOS+m+eahOS7u+S9lei/kOihjOaXtuaVsOaNrumDveWwhuS4
ouWkseOAgiBgYGR0Yj1gYCDpgInpobnlupTlj6rnlKjkvZzosIPor5Xlt6XlhbfvvIwNCj4gPiAr
5oiW6ICF5ZyoRUZJIENPTkZJR1VSQVRJT04gVEFCTEXkuK3mnKrmj5Dkvpvorr7lpIfmoJHml7bk
vZzkuLrmnIDlkI7nmoTmiYvmrrXjgIINCj4gPiArDQo+ID4gK+KAnGR0Yj3igJ3nmoTlpITnkIbm
lrnlvI/kuI7kuIrov7DigJxpbml0cmQ94oCd6YCJ6aG555u45ZCM44CCDQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJz
dA0KPiA+IGluZGV4IDQ2MDAzNGNiYzJhYi4uZDc0ZjVlODY0ODk4IDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJzdA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2lu
ZGV4LnJzdA0KPiA+IEBAIC02NSw2ICs2NSw3IEBAIFRvZG9saXN0Og0KPiA+DQo+ID4gICAgIGNs
ZWFyaW5nLXdhcm4tb25jZQ0KPiA+ICAgICBjcHUtbG9hZA0KPiA+ICsgICBlZmktc3R1Yg0KPiA+
ICAgICBsb2NrdXAtd2F0Y2hkb2dzDQo+ID4gICAgIHVuaWNvZGUNCj4gPg0KPiA+IEBAIC04Nyw3
ICs4OCw2IEBAIFRvZG9saXN0Og0KPiA+ICAgICBkZWxsX3JidQ0KPiA+ICAgICBkZXZpY2UtbWFw
cGVyL2luZGV4DQo+ID4gICAgIGVkaWQNCj4gPiAtICAgZWZpLXN0dWINCj4gPiAgICAgZXh0NA0K
PiA+ICAgICBuZnMvaW5kZXgNCj4gPiAgICAgZ3Bpby9pbmRleA0KPiA+DQo=
