Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38142C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 21 Feb 2022 10:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345826AbiBUK15 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Feb 2022 05:27:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353346AbiBUK1b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Feb 2022 05:27:31 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A8E40911
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 01:49:03 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id u12so19083646ybd.7
        for <linux-doc@vger.kernel.org>; Mon, 21 Feb 2022 01:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fN4kzaBB8lsLIwrLCEwSLVQm53jkjF0j2SNQYe9MFEQ=;
        b=p8e3SPd3rxJ1GoXlss8/Q0zRvrH0JOIJ4u2smB5uzaIDelwZZ2C1L6Jl2oHoXT32v4
         ZPta8iY+x5ORo0vKDepyyHTx905CRBgZ3EuOkyon5BRAs4PCAvTNw/P/BFGjexjCAo17
         IzuAsX9grXZPCREpphpPS7TViNivkQZA+QMgMKvE6wxxZIUQdte1hCMTDjGqH/+/piKS
         4FTmfbH5/EJDfIcPGZUArK92+IsKrIF7O2Xc/DNs02igM4OTmE1VwzsIJdADmMnQg4hg
         9y7VNWTpOQrPANPkJ2YKyjHV7asXMn3aF158dIwyPcOCB5oZ3NgTrCzbLVcQcEn0hdo8
         GALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fN4kzaBB8lsLIwrLCEwSLVQm53jkjF0j2SNQYe9MFEQ=;
        b=T+AoBtYm1aAHZzTo9kCCTzppvIjQEQkeFYfK8fb2WS4FjkDrHNVBgZd9q2rsgJCHej
         PK/GdKIfF4pSCUt5LDb9dltvYzMwaAQfM4bvr1h2QaE2gW9s+0AEU+qMp5ATDYdKopbV
         D67QE54AK1kXWYkqKhJQN2tyVlc5JlqbOuViqfQ4TgemLGzw+qGVWUOTwwMQC8ewqDv9
         oKHU496AQcfi2FE+qv5qBoLvqH5uMSfI9yb88P3a+0VbZTecMTbZX8P+O1Q+UoF+ifUN
         xY5VvhE5kxErHOgtfJf4Y9UC6nRQtqecfce2dbMgBrq8PvZGY50MrMuH1QOrrTAwhvYV
         8dng==
X-Gm-Message-State: AOAM531GTE/IR8usa+VAt/0pp6CEIF7SEyxGIWnm3jAheOHi3Euf2ViS
        TK6fhGiZkv/wmSFmdpgRZLKXH59/qfYH/wx1ZC4=
X-Google-Smtp-Source: ABdhPJyOpVlNIALKUviQWEaRVKTEi1H/kmQjgirbqFdpk+8EyiKoKGjFnXdCi0h0MGfGfp+1yZUz1laFuzkWoMyLcxM=
X-Received: by 2002:a5b:f0b:0:b0:624:b2f2:cc91 with SMTP id
 x11-20020a5b0f0b000000b00624b2f2cc91mr464882ybr.324.1645436938519; Mon, 21
 Feb 2022 01:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20220212080024.1684590-1-xu.xin16@zte.com.cn> <20220212080344.1684782-1-xu.xin16@zte.com.cn>
In-Reply-To: <20220212080344.1684782-1-xu.xin16@zte.com.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Mon, 21 Feb 2022 17:48:17 +0800
Message-ID: <CAMU9jJrbptic0LCxA8f-ejq9u13BWfGEghvmxLqopBnRZ9cn_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] zh_CN: Add translations for admin-guide/mm/ksm.rst
To:     CGEL <cgel.zte@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng01@gmail.com>,
        Alex Shi <seakeel@gmail.com>, xu xin <xu.xin16@zte.com.cn>,
        Yang Yang <yang.yang29@zte.com.cn>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PGNnZWwuenRlQGdtYWlsLmNvbT4g5LqOMjAyMuW5tDLmnIgxNeaXpeWRqOS6jCAwMDowMuWGmemB
k++8mg0KPg0KPiBGcm9tOiB4dSB4aW4gPHh1LnhpbjE2QHp0ZS5jb20uY24+DQo+DQo+IFRyYW5z
bGF0ZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21tL2tzbS5yc3QgaW50byBDaGluZXNlLg0K
Pg0KPiBSZXZpZXdlZC1ieTogWWFuZyBZYW5nIDx5YW5nLnlhbmcyOUB6dGUuY29tLmNuPg0KPiBS
ZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+IFJldmlld2VkLWJ5OiBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IFNpZ25lZC1vZmYtYnk6IHh1IHhp
biA8eHUueGluMTZAenRlLmNvbS5jbj4NCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NO
L2FkbWluLWd1aWRlL21tL2tzbS5yc3QgICAgICB8IDE0OCArKysrKysrKysrKysrKysrKysrKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNDggaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL21tL2tzbS5y
c3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Fk
bWluLWd1aWRlL21tL2tzbS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9h
ZG1pbi1ndWlkZS9tbS9rc20ucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAuLmJiZjY1NGMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9tbS9rc20ucnN0DQo+IEBAIC0wLDAgKzEsMTQ4
IEBADQo+ICsuLiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9y
aWdpbmFsOiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21tL2tzbS5yc3QNCj4gKw0KPiArOue/
u+ivkToNCj4gKw0KPiArICDlvpDpkasgeHUgeGluIDx4dS54aW4xNkB6dGUuY29tLmNuPg0KPiAr
DQo+ICsNCj4gKz09PT09PT09PT09PQ0KPiAr5YaF5qC45ZCM6aG15ZCI5bm2DQo+ICs9PT09PT09
PT09PT0NCj4gKw0KPiArDQo+ICvmpoLov7ANCj4gKz09PT0NCj4gKw0KPiArS1NN5piv5LiA56eN
6IO96IqC55yB5YaF5a2Y55qE5pWw5o2u5Y676YeN5Yqf6IO977yM55SxQ09ORklHX0tTTT155ZCv
55So77yM5bm25ZyoMi42LjMy54mI5pys5pe26KKr5re7DQo+ICvliqDliLBMaW51eOWGheaguOOA
guivpuingSBgYG1tL2tzbS5jYGAg55qE5a6e546w77yM5Lul5Y+KaHR0cDovL2x3bi5uZXQvQXJ0
aWNsZXMvMzA2NzA0DQo+ICvlkoxodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvMzMwNTg5DQo+ICsN
Cj4gK0tTTeacgOWIneebrueahOaYr+S4uuS6huS4jktWTe+8iOWNs+iRl+WQjeeahOWGheaguOWF
seS6q+WGheWtmO+8ieS4gOi1t+S9v+eUqOiAjOW8gOWPkeeahO+8jOmAmui/h+WFseS6q+iZmuaL
n+acug0KPiAr5LmL6Ze055qE5YWs5YWx5pWw5o2u77yM5bCG5pu05aSa6Jma5ouf5py65pS+5YWl
54mp55CG5YaF5a2Y44CC5L2G5a6D5a+55LqO5Lu75L2V5Lya55Sf5oiQ5aSa5Liq55u45ZCM5pWw
5o2u5a6e5L6L55qEDQo+ICvlupTnlKjnqIvluo/pg73mmK/lvojmnInnlKjnmoTjgIINCj4gKw0K
PiArS1NN55qE5a6I5oqk6L+b56iLa3NtZOS8muWumuacn+aJq+aPj+mCo+S6m+W3suazqOWGjOea
hOeUqOaIt+WGheWtmOWMuuWfn++8jOafpeaJvuWGheWuueebuOWQjOeahOmhtemdou+8jOi/meS6
mw0KPiAr6aG16Z2i5Y+v5Lul6KKr5Y2V5Liq5YaZ5L+d5oqk6aG16Z2i5pu/5o2i77yI5aaC5p6c
6L+b56iL5Lul5ZCO5oOz6KaB5pu05paw5YW25YaF5a6577yM5bCG6Ieq5Yqo5aSN5Yi277yJ44CC
5L2/55So77yaDQo+ICvlvJXnlKg6YHN5c2ZzIGludHJhZmFjZSAgPGtzbV9zeXNmcz5gIOaOpeWP
o+adpemFjee9rktTTeWuiOaKpOeoi+W6j+WcqOWNleS4qui/h+eoi+S4reaJgOaJq+aPj+eahOmh
tQ0KPiAr5pWw5Lul5Y+K5Lik5Liq6L+H56iL5LmL6Ze055qE6Ze06ZqU5pe26Ze044CCDQo+ICsN
Cj4gK0tTTeWPquWQiOW5tuWMv+WQje+8iOengeacie+8iemhtemdou+8jOS7juS4jeWQiOW5tumh
tee8k+WtmO+8iOaWh+S7tu+8iemhtemdouOAgktTTeeahOWQiOW5tumhtemdouacgOWIneWPquiD
veiiqw0KPiAr6ZSB5a6a5Zyo5YaF5qC45YaF5a2Y5Lit77yM5L2G546w5Zyo5Y+v5Lul5bCx5YOP
5YW25LuW55So5oi36aG16Z2i5LiA5qC36KKr5o2i5Ye677yI5L2G5b2T5a6D5Lus6KKr5Lqk5o2i
5Zue5p2l5pe25YWxDQo+ICvkuqvkvJrooqvnoLTlnY86IGtzbWTlv4Xpobvph43mlrDlj5HnjrDl
roPku6znmoTouqvku73lubblho3mrKHlkIjlubbvvInjgIINCj4gKw0KPiAr5LulbWFkdmlzZeaO
p+WItktTTQ0KPiArPT09PT09PT09PT09PT09PQ0KPiArDQo+ICtLU03ku4XlnKjnibnlrprnmoTl
nLDlnYDnqbrpl7TljLrln5/ml7bov5DooYzvvIzljbPlupTnlKjnqIvluo/pgJrov4fkvb/nlKjl
poLkuIvmiYDnpLrnmoRtYWR2aXNlKDIp57O757uf6LCDDQo+ICvnlKjmnaXor7fmsYLmn5DlnZfl
nLDlnYDmiJDkuLrlj6/og73nmoTlkIjlubblgJnpgInogIXnmoTlnLDlnYDnqbrpl7Q6Og0KPiAr
DQo+ICsgICAgaW50IG1hZHZpc2UoYWRkciwgbGVuZ3RoLCBNQURWX01FUkdFQUJMRSkNCj4gKw0K
PiAr5bqU55So56iL5bqP5b2T54S25Lmf5Y+v5Lul6YCa6L+H6LCD55SoOjoNCj4gKw0KPiArICAg
IGludCBtYWR2aXNlKGFkZHIsIGxlbmd0aCwgTUFEVl9VTk1FUkdFQUJMRSkNCj4gKw0KPiAr5p2l
5Y+W5raI6K+l6K+35rGC77yM5bm25oGi5aSN5Li66Z2e5YWx5Lqr6aG16Z2i77ya5q2k5pe2S1NN
5bCG5Y676Zmk5ZCI5bm25Zyo6K+l6IyD5Zu05YaF55qE5Lu75L2V5ZCI5bm26aG144CC5rOo5oSP
77yaDQo+ICvov5nkuKrljrvpmaTlkIjlubbnmoTosIPnlKjlj6/og73nqoHnhLbpnIDopoHnmoTl
hoXlrZjph4/otoXov4flrp7pmYXlj6/nlKjnmoTlhoXlrZjph48t6YKj5LmI5Y+v6IO95Lya5Ye6
546wRUFHQUlODQo+ICvlpLHotKXvvIzkvYbmm7Tlj6/og73kvJrllKTphpJPT00ga2lsbGVy44CC
DQo+ICsNCj4gK+WmguaenEtTTeacquiiq+mFjee9ruWIsOato+WcqOi/kOihjOeahOWGheaguOS4
re+8jOWImW1hZHZpc2UgTUFEVl9NRVJHRUFCTEUg5ZKMIE1BRFZfVU5NRVJHRUFCTEUNCj4gK+ea
hOiwg+eUqOWPquS8muS7pUVJTlZBTCDlpLHotKXjgILlpoLmnpzmraPlnKjov5DooYznmoTlhoXm
oLjmmK/nlKhDT05GSUdfS1NNPXnmlrnlvI/mnoTlu7rnmoTvvIzpgqPkuYjov5nkupsNCj4gK+iw
g+eUqOmAmuW4uOS8muaIkOWKn++8muWNs+S9v0tTTeWuiOaKpOeoi+W6j+W9k+WJjeayoeaciei/
kOihjO+8jE1BRFZfTUVSR0VBQkxFIOS7jeeEtuS8muWcqEtTTeWuiOaKpOeoi+W6jw0KPiAr5ZCv
5Yqo5pe25rOo5YaM6IyD5Zu077yM5Y2z5L2/6K+l6IyD5Zu05LiN6IO95YyF5ZCrS1NN5a6e6ZmF
5Y+v5Lul5ZCI5bm255qE5Lu75L2V6aG16Z2i77yM5Y2z5L2/TUFEVl9VTk1FUkdFQUJMRQ0KPiAr
5bqU55So5LqO5LuO5pyq5qCH6K6w5Li6TUFEVl9NRVJHRUFCTEXnmoTojIPlm7TjgIINCj4gKw0K
PiAr5aaC5p6c5LiA5Z2X5YaF5a2Y5Yy65Z+f5b+F6aG76KKr5ouG5YiG5Li66Iez5bCR5LiA5Liq
5paw55qETUFEVl9NRVJHRUFCTEXljLrln5/miJZNQURWX1VOTUVSR0VBQkxF5Yy65Z+f77yMDQo+
ICvlvZPor6Xov5vnqIvlsIbotoXov4cgYGB2bS5tYXhfbWFwX2NvdW50YGAg55qE6K6+5a6a77yM
5YiZbWFkdmlzZeWPr+iDvei/lOWbnkVOT01FTeOAgu+8iOivt+WPgumYheaWh+ahow0KPiArRG9j
dW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvdm0ucnN077yJ44CCDQo+ICsNCj4gK+S4juWF
tuS7lm1hZHZpc2XosIPnlKjkuIDmoLfvvIzlroPku6zlnKjnlKjmiLflnLDlnYDnqbrpl7TnmoTm
mKDlsITljLrln5/kuIrkvb/nlKjvvJrlpoLmnpzmjIflrprnmoTojIPlm7TljIXlkKvmnKoNCj4g
K+aYoOWwhOeahOmXtOmame+8iOWwveeuoeWcqOS4remXtOeahOaYoOWwhOWMuuWfn+W3peS9nO+8
ie+8jOWug+S7rOWwhuaKpeWRikVOT01FTe+8jOWmguaenOayoeaciei2s+Wkn+eahOWGheWtmOeU
qOS6jg0KPiAr5YaF6YOo57uT5p6E77yM5YiZ5Y+v6IO95Lya5ZugRUFHQUlO6ICM5aSx6LSl44CC
DQo+ICsNCj4gK0tTTeWuiOaKpOi/m+eoi3N5c2Zz5o6l5Y+jDQo+ICs9PT09PT09PT09PT09PT09
PT09DQpIaSB4dQ0KDQpUaXRsZSB1bmRlcmxpbmUgdG9vIHNob3J0Lg0KDQpUaGFua3MsDQpZYW50
ZW5nDQo=
