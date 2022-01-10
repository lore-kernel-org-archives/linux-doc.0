Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA2DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 03:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238294AbiAJDKH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 22:10:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbiAJDKG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 22:10:06 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B69C06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 19:10:06 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id 19so15727789ioz.4
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 19:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o0CqFBC3kzyVEjsUwCdRYfMH0uE4DYiS80GjmvBKTYM=;
        b=iaQ6YF6CDKYMFzdUbNpOnfI5EB0Kj16iOcFCjvQPEo/GtKX8t9WASHigxfelJ4Xzhx
         9YJTcW2RP5VMU5rGERpXfnVXWNsnbGb8S6XS1pgxVfLmQvTHW6ft3qFj6/nwiwMegFrw
         jitHksb5qOpgLQpgy+Tg1lLrXjL9BDitT6VDT8kQzFtlGTQIaQkza5V1dZ2itRoCD4Vt
         /U+EXMzZ1J/y9Ukd5aMfFeiMlKeQ54FvdFu+ZykHOve4l8ct0K3++wswHVHU+0qwJI19
         Xn1f+0crIOmgetjKu06yderqJlh3jJCKe6JWHJ0S6MIW4Ah/SAaS1VDeDiyHem9r5yX6
         ZJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o0CqFBC3kzyVEjsUwCdRYfMH0uE4DYiS80GjmvBKTYM=;
        b=FPUpQl3YQIEX+p/PMLlLyq2NPyfmUAS+sPNXT59u7XVRP6xybrbmYPT+fMSrbswCXw
         pCF9cx/QUvHySppYYC4vpH3+Daq/O2nkijY4msdlZhKtUhUfAgQRlxwBoL5b/RlX+/lO
         ZupCp81QVqRcv6yHE1fOZNNxUFLFlrayGRyU2kT3qb21PS7aDzA2gAS/6f84Bxp2va6a
         RjGcMYXdPY6TYtPh7kQu89Mmo7NDSXSpIYazjKLFoheZNEeypG1Yl3IyafSj9nl3m105
         i63xxfOqGi+jh+Wyisav7btvNd4ObMupg2Hmb+ikhPAAFRHl3W5ht7LCvs8gqityCKsf
         kY8g==
X-Gm-Message-State: AOAM532HjuTeVP9VZi1UXXHKFH57QkybfxxSrYfqSDh+C1996TwI6Eti
        1GxyYweyTwr0F9MDogPF3wD09JXeCKe71Bo70do=
X-Google-Smtp-Source: ABdhPJxwSSWyQxj4jyWEMXamHTbk+8lGEfMfkzNLL6BF+ss4mepkCEZAvilRMW6yEZais34Q+XXVfXf3p+uaPkecom4=
X-Received: by 2002:a05:6638:204c:: with SMTP id t12mr32969105jaj.169.1641784205799;
 Sun, 09 Jan 2022 19:10:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641782124.git.siyanteng@loongson.cn> <b0ade8762e0bf0be2a38b4c37c3cae656962254b.1641782124.git.siyanteng@loongson.cn>
In-Reply-To: <b0ade8762e0bf0be2a38b4c37c3cae656962254b.1641782124.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 10 Jan 2022 11:09:29 +0800
Message-ID: <CAJy-Amn4ULdeU9uew4j-2gSqh_ScBTM81fFEQ_iA2y=c_4Rrjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/zh_CN: add balance translation
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
aWwuY29tPg0KPg0KPiBUcmFuc2xhdGUgLi4uL3ZtL2JhbGFuY2UucnN0IGludG8gQ2hpbmVzZS4N
Cj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0K
DQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQoNCj4gLS0tDQo+ICAu
Li4vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2JhbGFuY2UucnN0ICAgICAgICAgfCA4MSArKysrKysr
KysrKysrKysrKysrDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRl
eC5yc3QgfCAgMiArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0vYmFsYW5jZS5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZtL2JhbGFuY2UucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdm0vYmFsYW5jZS5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5lOThhNDdlZjI0YTgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9iYWxhbmNlLnJzdA0KPiBAQCAtMCww
ICsxLDgxIEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0K
PiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZtL2JhbGFuY2UucnN0DQo+ICsNCj4gKzrnv7vo
r5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PT09DQo+ICvlhoXlrZjlubPo
oaENCj4gKz09PT09PT09DQo+ICsNCj4gKzIwMDDlubQx5pyI5byA5aeL77yM5L2c6ICF77yaS2Fu
b2ogU2FyY2FyIDxrYW5vakBzZ2kuY29tPg0KPiArDQo+ICvlr7nkuo4gIV9fR0ZQX0hJR0gg5ZKM
ICFfX0dGUF9LU1dBUERfUkVDTEFJTSDku6Xlj4rpnZ4gX19HRlBfSU8g55qE5YiG6YWN77yM6ZyA
6KaB6L+b6KGMDQo+ICvlhoXlrZjlubPooaHjgIINCj4gKw0KPiAr6LCD55So6ICF6YG/5YWN5Zue
5pS255qE56ys5LiA5Liq5Y6f5Zug5piv6LCD55So6ICF55Sx5LqO5oyB5pyJ6Ieq5peL6ZSB5oiW
5aSE5LqO5Lit5pat546v5aKD5Lit6ICM5peg5rOV552h55yg44CC56ys5LqM5LiqDQo+ICvljp/l
m6Dlj6/og73mmK/vvIzosIPnlKjogIXmhL/mhI/lnKjkuI3kuqfnlJ/pobXpnaLlm57mlLblvIDp
lIDnmoTmg4XlhrXkuIvliIbphY3lpLHotKXjgILov5nlj6/og73lj5HnlJ/lnKjmnIkw6Zi25Zue
6YCADQo+ICvpgInpobnnmoTmnLrkvJrkuLvkuYnpq5jpmLbliIbphY3or7fmsYLkuK3jgILlnKjo
v5nnp43mg4XlhrXkuIvvvIzosIPnlKjogIXlj6/og73kuZ/luIzmnJvpgb/lhY3llKTphpJrc3dh
cGTjgIINCj4gKw0KPiArX19HRlBfSU/liIbphY3or7fmsYLmmK/kuLrkuobpmLLmraLmlofku7bn
s7vnu5/mrbvplIHjgIINCj4gKw0KPiAr5Zyo5rKh5pyJ6Z2e552h55yg5YiG6YWN6K+35rGC55qE
5oOF5Ya15LiL77yM5YGa5bmz6KGh5Ly85LmO5piv5pyJ5a6z55qE44CC6aG16Z2i5Zue5pS25Y+v
5Lul6KKr5oeS5pWj5Zyw5ZCv5Yqo77yM5Lmf5bCx5pivDQo+ICvor7TvvIzlj6rmnInlnKjpnIDo
poHnmoTml7blgJnvvIjkuZ/lsLHmmK/ljLrln5/nmoTnqbrpl7LlhoXlrZjkuLow77yJ77yM6ICM
5LiN5piv6K6p5a6D5oiQ5Li65LiA5Liq5Li75Yqo55qE6L+H56iL44CCDQo+ICsNCj4gK+S5n+Ww
seaYr+ivtO+8jOWGheaguOW6lOivpeWwneivleS7juebtOaOpeaYoOWwhOaxoOS4rea7oei2s+Wv
ueebtOaOpeaYoOWwhOmhteeahOivt+axgu+8jOiAjOS4jeaYr+WbnumAgOWIsGRtYeaxoOS4re+8
jA0KPiAr6L+Z5qC35bCx5Y+v5Lul5L+d5oyBZG1h5rGg5Li6ZG1h6K+35rGC77yI5LiN566h5piv
5LiN5piv5Y6f5a2Q55qE77yJ5omA5aGr5YWF44CC57G75Ly855qE5LqJ6K665Lmf6YCC55So5LqO
6auY5YaF5a2YDQo+ICvlkoznm7TmjqXmmKDlsITnmoTpobXpnaLjgILnm7jlj43vvIzlpoLmnpzm
nInlvojlpJrnqbrpl7LnmoRkbWHpobXvvIzmnIDlpb3mmK/pgJrov4fku45kbWHmsaDkuK3liIbp
hY3kuIDkuKrmnaXmu6HotrMNCj4gK+W4uOinhOeahOWGheWtmOivt+axgu+8jOiAjOS4jeaYr+S6
p+eUn+W4uOinhOWMuuWfn+W5s+ihoeeahOW8gOmUgOOAgg0KPiArDQo+ICvlnKgyLjLkuK3vvIzl
j6rmnInlvZPnqbrpl7LpobXmgLvmlbDkvY7kuo7mgLvlhoXlrZjnmoQxLzY05pe277yM5omN5Lya
5ZCv5Yqo5YaF5a2Y5bmz6KGhL+mhtemdouWbnuaUtuOAguWmguaenGRtYQ0KPiAr5ZKM5bi46KeE
5YaF5a2Y55qE5q+U5L6L5ZCI6YCC77yM5Y2z5L2/ZG1h5Yy65a6M5YWo56m65LqG77yM5Lmf5b6I
5Y+v6IO95LiN5Lya6L+b6KGM5bmz6KGh44CCMi4y5bey57uP5Zyo5LiN5ZCM5YaF5a2YDQo+ICvl
pKflsI/nmoTnlJ/kuqfmnLrlmajkuIrov5DooYzvvIzljbPkvb/mnInov5nkuKrpl67popjlrZjl
nKjvvIzkvLzkuY7kuZ/lgZrlvpfkuI3plJnjgILlnKgyLjPkuK3vvIznlLHkuo5ISUdITUVN55qE
DQo+ICvlrZjlnKjvvIzov5nkuKrpl67popjlj5jlvpfmm7TliqDkuKXph43jgIINCj4gKw0KPiAr
5ZyoMi4z5Lit77yM5Yy65Z+f5bmz6KGh5Y+v5Lul55So5Lik56eN5pa55byP5LmL5LiA5p2l5a6M
5oiQ77ya5qC55o2u5Yy65Z+f55qE5aSn5bCP77yI5Y+v6IO95piv5L2O57qn5Yy65Z+f55qE5aSn
5bCP77yJ77yMDQo+ICvmiJHku6zlj6/ku6XlnKjliJ3lp4vljJbpmLbmrrXlhrPlrprlnKjlubPo
oaHku7vkvZXljLrln5/ml7blupTor6Xkuonlj5blpJrlsJHnqbrpl7LpobXjgILlpb3nmoTmlrnp
naLmmK/vvIzlnKjlubPooaHnmoTml7YNCj4gK+WAme+8jOaIkeS7rOS4jemcgOimgeeci+S9jue6
p+WMuueahOWkp+Wwj++8jOWdj+eahOaWuemdouaYr++8jOaIkeS7rOWPr+iDveS8muWboOS4uuW/
veeVpeS9jue6p+WMuuWPr+iDvei+g+S9jueahOS9v+eUqOeOhw0KPiAr6ICM5YGa6L+H5LqO6aKR
57mB55qE5bmz6KGh44CC5Y+m5aSW77yM5Y+q6KaB5a+55YiG6YWN56iL5bqP56iN5L2c5L+u5pS5
77yM5bCx5pyJ5Y+v6IO95bCGbWVtY2xhc3MoKeWuj+eugOWMluS4uuS4gA0KPiAr5Liq566A5Y2V
55qE562J5byP44CCDQo+ICsNCj4gK+WPpuS4gOS4quWPr+iDveeahOino+WGs+aWueahiOaYr++8
jOaIkeS7rOWPquWcqOS4gOS4quWMuiAqKuWSjCoqIOWFtuaJgOacieS9jue6p+WMuueahOepuumX
suWGheWtmOS9juS6juivpeWMuuWPiuWFtg0KPiAr5L2O57qn5Yy65oC75YaF5a2Y55qEMS82NOaX
tui/m+ihjOW5s+ihoeOAgui/meWwseino+WGs+S6hjIuMueahOW5s+ihoemXrumimO+8jOW5tuWw
veWPr+iDveWcsOS/neaMgeS6huS4jjIuMuihjOS4ug0KPiAr55qE5o6l6L+R44CC5Y+m5aSW77yM
5bmz6KGh566X5rOV5Zyo5ZCE56eN5p625p6E5LiK55qE5bel5L2c5pa55byP5Lmf5piv5LiA5qC3
55qE77yM6L+Z5Lqb5p625p6E5pyJ5LiN5ZCM5pWw6YeP5ZKM57G75Z6L55qEDQo+ICvlhoXlrZjl
jLrjgILlpoLmnpzmiJHku6zmg7Plj5jlvpfmm7ToirHlk6jkuIDngrnvvIzmiJHku6zlj6/ku6Xl
nKjmnKrmnaXkuLrkuI3lkIzljLrln5/nmoToh6rnlLHpobXpnaLliIbphY3kuI3lkIznmoTmnYPp
h43jgIINCj4gKw0KPiAr6K+35rOo5oSP77yM5aaC5p6c5pmu6YCa5Yy655qE5aSn5bCP5LiOZG1h
5Yy655u45q+U5piv5beo5aSn55qE77yM6YKj5LmI5Zyo5Yaz5a6a5piv5ZCm5bmz6KGh5pmu6YCa
5Yy655qE5pe25YCZ77yM6ICD6JmRDQo+ICvnqbrpl7LnmoRkbWHpobXlsLHlj5jlvpfkuI3pgqPk
uYjph43opoHkuobjgILpgqPkuYjnrKzkuIDkuKrop6PlhrPmlrnmoYjlsLHlj5jlvpfmm7TmnInl
kLjlvJXlipvjgIINCj4gKw0KPiAr5omA6ZmE55qE6KGl5LiB5a6e546w5LqG56ys5LqM5Liq6Kej
5Yaz5pa55qGI44CC5a6D6L+YIOKAnOS/ruWkjeKAneS6huS4pOS4qumXrumimO+8mummluWFiO+8
jOWcqOS9juWGheWtmOadoeS7tuS4i++8jGtzd2FwZA0KPiAr6KKr5ZSk6YaS77yM5bCx5YOPMi4y
5Lit55qE6Z2e552h55yg5YiG6YWN44CC56ys5LqM77yMSElHSE1FTeWMuuS5n+iiq+W5s+ihoeS6
hu+8jOS7peS+v+e7mXJlcGxhY2Vfd2l0aF9oaWdobWVtKCkNCj4gK+S4gOS4quS6ieWPluiOt+W+
l0hJR0hNRU3pobXnmoTmnLrkvJrvvIzlkIzml7bnoa7kv51ISUdITUVN5YiG6YWN5LiN5Lya6JC9
5Zue5pmu6YCa5Yy644CC6L+Z5Lmf56Gu5L+d5LqGSElHSE1FTQ0KPiAr6aG15LiN5Lya6KKr5rOE
6Zyy77yI5L6L5aaC77yM5Zyo5LiA5LiqSElHSE1FTemhteWcqOS6pOaNoue8k+WtmOS4reS9huay
oeacieiiq+S7u+S9leS6uuS9v+eUqOeahOaDheWGteS4i++8ieOAgg0KPiArDQo+ICtrc3dhcGTo
v5jpnIDopoHnn6XpgZPlroPlupTor6XlubPooaHlk6rkupvljLrjgIJrc3dhcGTkuLvopoHmmK/l
nKjml6Dms5Xov5vooYzlubPooaHnmoTmg4XlhrXkuIvpnIDopoHnmoTvvIzlj6/og70NCj4gK+aY
r+WboOS4uuaJgOacieeahOWIhumFjeivt+axgumDveadpeiHquS4reaWreS4iuS4i+aWh++8jOiA
jOaJgOacieeahOi/m+eoi+S4iuS4i+aWh+mDveWcqOedoeecoOOAguWvueS6jjIuM++8jA0KPiAr
a3N3YXBk5bm25LiN55yf5q2j6ZyA6KaB5bmz6KGh6auY5YaF5a2Y5Yy677yM5Zug5Li65Lit5pat
5LiK5LiL5paH5bm25LiN6K+35rGC6auY5YaF5a2Y6aG144CCa3N3YXBk55yLem9uZQ0KPiAr57uT
5p6E5L2T5Lit55qEem9uZV93YWtlX2tzd2FwZOWtl+auteadpeWGs+WumuS4gOS4quWMuuaYr+WQ
pumcgOimgeW5s+ihoeOAgg0KPiArDQo+ICvlpoLmnpzku47ov5vnqIvlhoXlrZjlkoxzaG3kuK3l
gbflj5bpobXpnaLlj6/ku6Xlh4/ovbvor6XpobXpnaLoioLngrnkuK3ku7vkvZXljLrnmoTlhoXl
rZjljovlipvvvIzogIzor6XljLrnmoTlhoXlrZjljovlipsNCj4gK+W3sue7j+S9juS6juWFtuaw
tOS9je+8jOWImeS8mui/m+ihjOWBt+WPluOAgg0KPiArDQo+ICt3YXRlbWFya1tXTUFSS19NSU4v
V01BUktfTE9XL1dNQVJLX0hJR0hdL2xvd19vbl9tZW1vcnkvem9uZV93YWtlX2tzd2FwZO+8mg0K
PiAr6L+Z5Lqb5piv5q+P5Liq5Yy655qE5a2X5q6177yM55So5LqO56Gu5a6a5LiA5Liq5Yy65L2V
5pe26ZyA6KaB5bmz6KGh44CC5b2T6aG16Z2i5pWw5L2O5LqO5rC05L2NW1dNQVJLX01JTl3ml7bv
vIwNCj4gK2h5c3RlcmljIOeahOWtl+autWxvd19vbl9tZW1vcnnooqvorr7nva7jgILov5nkuKrl
rZfmrrXkvJrkuIDnm7Tooqvorr7nva7vvIznm7TliLDnqbrpl7LpobXmlbDlj5jmiJDmsLTkvY0N
Cj4gK1tXTUFSS19ISUdIXeOAguW9k2xvd19vbl9tZW1vcnnooqvorr7nva7ml7bvvIzpobXpnaLl
iIbphY3or7fmsYLlsIblsJ3or5Xph4rmlL7or6XljLrln5/nmoTkuIDkupvpobXpnaLvvIjlpoLm
npwNCj4gK+ivt+axguS4reiuvue9ruS6hkdGUF9XQUlU77yJ44CC5LiO5q2k55u45Y+N55qE5piv
77yM5Yaz5a6a5ZSk6YaSa3N3YXBk5Lul6YeK5pS+5LiA5Lqb5Yy655qE6aG144CC6L+Z5Liq5Yaz
5a6a5LiN5piv5Z+65LqODQo+ICtoeXN0ZXJlc2lzIOeahO+8jOiAjOaYr+W9k+epuumXsumhteea
hOaVsOmHj+S9juS6jndhdGVybWFya1tXTUFSS19MT1dd5pe25bCx5Lya6L+b6KGM77yb5Zyo6L+Z
56eN5oOF5Ya15LiL77yMDQo+ICt6b25lX3dha2Vfa3N3YXBk5Lmf6KKr6K6+572u44CCDQo+ICsN
Cj4gKw0KPiAr5oiR5omA5ZCs5Yiw55qE77yI6LaF5qOS55qE77yJ5oOz5rOV77yaDQo+ICsNCj4g
KzEuIOWKqOaAgee7j+WOhuW6lOivpeW9seWTjeW5s+ihoe+8muWPr+S7pei3n+i4quS4gOS4quWM
uueahOWksei0peivt+axgueahOaVsOmHj++8jOW5tuWPjemmiOWIsOW5s+ihoeaWueahiOS4re+8
iGphbHZvQG1iYXkubmV077yJ44CCDQo+ICsNCj4gKzIuIOWunueOsOS4gOS4quexu+S8vOS6jnJl
cGxhY2Vfd2l0aF9oaWdobWVtKCnnmoRyZXBsYWNlX3dpdGhfcmVndWxhcigp77yM5Lul5L+d55WZ
ZG1h6aG16Z2i44CCDQo+ICsgICAobGtkQHRhbnRhbG9waGlsZS5kZW1vbi5jby51aykNCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBpbmRleCA1
ZmNkYjc1ZDg2ODIuLmZjMzlmMGQ2MDMxOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBAQCAtMjIsMTAgKzIyLDEwIEBAIFRPRE86
5b6F5byV55So5paH5qGj6ZuG6KKr57+76K+R5a6M5q+V5ZCO6K+35Y+K5pe25L+u5pS55q2k5aSE
77yJDQo+ICAgICA6bWF4ZGVwdGg6IDENCj4NCj4gICAgIGFjdGl2ZV9tbQ0KPiArICAgYmFsYW5j
ZQ0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9oZWxwZXJzDQo+IC0qIGJhbGFu
Y2UNCj4gICogZGFtb24vaW5kZXgNCj4gICogZnJlZV9wYWdlX3JlcG9ydGluZw0KPiAgKiBmcm9u
dHN3YXANCj4gLS0NCj4gMi4yNy4wDQo+DQo=
