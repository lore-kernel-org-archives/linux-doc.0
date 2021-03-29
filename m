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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ABDC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92D826195C
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhC2MZw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 08:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhC2MZQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 08:25:16 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3384AC061574
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 05:25:13 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ap14so5997857ejc.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Mar 2021 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KsyojraZXQwHf1rm8jPUKOWv7XN+3SkSevy/ft2RgKc=;
        b=ulcowhHHfHwwzIs4MUy8lhz0vptPn8a9uVRRKeJNoaJoPfmAdwxNAyT9U6R3vYg01D
         vCHIMTneDC74UVhHk/aNQ7+CLNyrTJow1re0G4D1G6pISIlORAptm19ntHa1Vsj6OXpW
         rzjR3XMYP2C0VvJPoWSrflNWrNVrY9mZ2DMFDmHM8YnR0l0mMbSbSzHsWqBj+am8Gf6i
         QclYLiEGWqd/vGwX/yfJS90geZDKeQVmDXwV+bCEYz5byHmGQYfq24tWYwWgYCvMDUuc
         pfze8/Yp5Vj7Ic1oeSX8GEw39Ml1kI48sJBnMZ9xFuaaRzDpfUqZsfUjg2Tp3LSI26S6
         BVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KsyojraZXQwHf1rm8jPUKOWv7XN+3SkSevy/ft2RgKc=;
        b=Fzyp/cop/YjvdZ0U8VzbvGQN9zh+b3cSApzIjCsp5zzN49MUX5ctKhZv1TgAmHwiAL
         fqoqfcGNIwO57bR7k9LPBxFjuPx7E7spJ4RlpfPPtnakIq8dHeriMKvCQCIyqhsURtSu
         EJJiRVllsKo7WkM5QDue8T59oocdet2gvIae3wYNCDDc39jAzpUTXNZpr90btUqiNuWx
         tdyA388gjFKMUeJgDqmJkaUIg/RiliRxICTEvIuARtv0xfB43iZGslhBMGoRW4cJWl4V
         s3f3JyZqhJhuy4VRCEJ1RUGRcLPnqnkChIatwgY67NX2ozUGaKQbhpyUWdwOYYGp+xte
         qkfA==
X-Gm-Message-State: AOAM531u/BFUUiWrOcbYLzx+Im4VnggkZOqXiqK30fR9N61t3XwR2hDF
        wlVbyjn4Fau7axGi6pz7Hx/P3RKWPDmmw5lCyx4=
X-Google-Smtp-Source: ABdhPJzbtJQBh6huGaAErwTXq6DMg+YPJDLqvaZwOYn3PotUBR4yJWAYJsYJHk7khfoyg/rJvMPfYoSd0mnYB8nfclQ=
X-Received: by 2002:a17:906:af91:: with SMTP id mj17mr27376712ejb.230.1617020710489;
 Mon, 29 Mar 2021 05:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210324150731.4512-1-siyanteng@loongson.cn> <20210324150731.4512-2-siyanteng@loongson.cn>
 <5623c525-2898-4583-bd0c-df2dd4059bea@www.fastmail.com>
In-Reply-To: <5623c525-2898-4583-bd0c-df2dd4059bea@www.fastmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 29 Mar 2021 20:24:57 +0800
Message-ID: <CAEensMyJvtZtbupHKDgxE914joNqrL_rmm73KxeMUpdMBbEWWQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] docs/zh_CN: add cpu-freq core.rst translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgSmlheHVuDQoNCkRvIHlvdSBtaW5kIGlmIEkgYWRkIHRoZSBmb2xsb3dpbmc/DQoNCis65qCh
6K+ROg0KKw0KKyBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+DQoNCkppYXh1
biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4g5LqOMjAyMeW5tDPmnIgyNuaXpeWRqOS6
lCDkuIrljYgxMToxM+WGmemBk++8mg0KPg0KPg0KPg0KPiBPbiBXZWQsIE1hciAyNCwgMjAyMSwg
YXQgMTE6MDcgUE0sIFlhbnRlbmcgU2kgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCB0cmFuc2xhdGVz
IERvY3VtZW50aW9uL2NwdS1mcmVxL2NvcmUucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0N
Cj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUtZnJlcS9jb3JlLnJzdCAgICAgIHwgMTA1
ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMo
KykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2NwdS1mcmVxL2NvcmUucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vY3B1LWZyZXEvY29yZS5yc3QNCj4gPiBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2NwdS1mcmVxL2NvcmUucnN0DQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjE1NzEwODdjMjU4MQ0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jcHUt
ZnJlcS9jb3JlLnJzdA0KPiA+IEBAIC0wLDAgKzEsMTA1IEBADQo+ID4gKy4uIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpo
X0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiA6ZG9jOmAuLi8uLi8uLi9jcHUtZnJlcS9j
b3JlYA0KPiA+ICs6VHJhbnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiA+ICsNCj4gPiArLi4gX2NuX2NvcmUucnN0Og0KPiA+ICsNCj4gPiArDQo+ID4gKz09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICtDUFVGcmVx5qC45b+D5ZKMQ1BV
RnJlcemAmuefpeWZqOeahOS4gOiIrOivtOaYjg0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4NCj4g5LiA6IisIC0+IOmAmueUqO+8nw0KPg0KPiA+ICsNCj4gPiAr
5L2c6ICFOg0KPiA+ICsgICAgIC0gRG9taW5payBCcm9kb3dza2kgIDxsaW51eEBicm9kby5kZT4N
Cj4gPiArICAgICAtIERhdmlkIEtpbWRvbiA8ZHdoZWRvbkBkZWJpYW4ub3JnPg0KPiA+ICsgICAg
IC0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPg0KPiA+ICsg
ICAgIC0gVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4NCj4gPiArDQo+ID4g
Ky4uIOebruW9lToNCj4gPiArDQo+ID4gKyAgIDEuICBDUFVGcmVx5qC45b+D5ZKM5o6l5Y+jDQo+
ID4gKyAgIDIuICBDUFVGcmVx6YCa55+l5ZmoDQo+ID4gKyAgIDMuICDlkKvmnIlPcGVyYXRpbmcg
UGVyZm9ybWFuY2UgUG9pbnQgKE9QUCnnmoRDUFVGcmVx6KGo55qE55Sf5oiQDQo+ID4gKw0KPiA+
ICsxLiBDUFVGcmVx5qC45b+D5ZKM5o6l5Y+jDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT0N
Cj4gPiArDQo+ID4gK2NwdWZyZXHmoLjlv4Pku6PnoIHkvY3kuo5kcml2ZXJzL2NwdWZyZXEvY3B1
ZnJlcS5j5Lit44CC6L+Z5LqbY3B1ZnJlceS7o+eggeS4ukNQVUZyZXHmnrbmnoTnmoTpqbENCj4g
PiAr5Yqo56iL5bqP77yI6YKj5Lqb6L+b6KGM5a6e6ZmF6aKR546H6L2s5o2i55qE5Luj56CB77yJ
5Lul5Y+KICLpgJrnn6XlmaggIuaPkOS+m+S6huS4gOS4quagh+WHhuWMlueahOaOpeWPo+OAgg0K
Pg0KPiDpgqPkupvmk43kvZznoazku7bliIfmjaLpopHnjofnmoTku6PnoIEgd2lsbCBoZWxwIHdp
dGggdW5kZXJzdGFuZGluZy4NCj4NCj4NCj4gPiAr6L+Z5Lqb5piv6K6+5aSH6amx5Yqo56iL5bqP
5oiW6ZyA6KaB5LqG6Kej562W55Wl5Y+Y5YyW55qE5YW25a6D5YaF5qC46YOo5YiG77yI5aaCIEFD
UEkg562J54Ot5qih5Z2X77yJ5oiW5omA5pyJ6aKR546H5pu05pS577yI6ZmkDQo+IEFkZCBzYmpl
Y3QgIumAmuefpeWZqCINCj4g54Ot5qih5Z2XIHNlZW1zIGJvZ3VzLCDng63ph4/nrqHnkIbvvJ8N
Cj4NCj4gPiAr6K6h5pe25Luj56CB5aSW77yJ77yM55Sa6Iez6ZyA6KaB5by65Yi256Gu5a6a6YCf
5bqm6ZmQ5Yi277yI5aaCIEFSTSDmnrbmnoTkuIrnmoQgTENEIOmpseWKqOeoi+W6j++8ieOAgg0K
PiA+ICvmraTlpJbvvIwg5YaF5qC4ICLluLjmlbAiIGxvb3BzX3Blcl9qaWZmeeS8muagueaNrumi
keeOh+WPmOWMluiAjOabtOaWsOOAgg0KPiA+ICsNCj4gPiArY3B1ZnJlceetlueVpeeahOW8leeU
qOiuoeaVsOeUsSBjcHVmcmVxX2NwdV9nZXQg5ZKMIGNwdWZyZXFfY3B1X3B1dCDmnaXlrozmiJDv
vIzku6Xnoa7kv50gY3B1ZnJlcSDpqbENCj4gPiAr5Yqo56iL5bqP6KKr5q2j56Gu5Zyw5rOo5YaM
5Yiw5qC45b+D5Lit77yM5bm25LiU5ZyoIGNwdWZyZXFfcHV0X2NwdSDooqvosIPnlKjkuYvliY3k
uI3kvJrooqvljbjovb3jgILov5nkuZ/kv53or4HkuoblkIToh6rnmoQNCj4gPiArY3B1ZnJlcSDn
rZbnlaXlnKjkvb/nlKjml7bkuI3kvJrooqvph4rmlL7jgIINCj4NCj4gSXQgbWFrZXMgbWUgIlBh
cnNlciBlcnJvciIgd2hlbiByZWFkaW5nLi4uLi4NCj4NCj4gPiArDQo+ID4gKzIuIENQVUZyZXEg
6YCa55+l5ZmoDQo+ID4gKz09PT09PT09PT09PT09PT09PT09DQo+ID4gKw0KPiA+ICtDUFVGcmVx
6YCa55+l5Zmo56ym5ZCI5qCH5YeG55qE5YaF5qC46YCa55+l5Zmo5o6l5Y+j44CCDQo+ID4gK+WF
s+S6jumAmuefpeWZqOeahOe7huiKguivt+WPgumYhSBsaW51eC9pbmNsdWRlL2xpbnV4L25vdGlm
aWVyLmjjgIINCj4gPiArDQo+ID4gK+i/memHjOacieS4pOS4quS4jeWQjOeahENQVWZyZXHpgJrn
n6XlmaggLSDnrZbnlaXpgJrnn6XlmajlkozovazmjaLpgJrnn6XlmajjgIINCj4gPiArDQo+ID4g
Kw0KPiA+ICsyLjEgQ1BVRnJlceetlueVpemAmuefpeWZqA0KPiA+ICstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvlvZPliJvlu7rmiJbnp7vpmaTnrZbnlaXml7bvvIzo
v5nkupvpg73kvJrooqvpgJrnn6XjgIINCj4gPiArDQo+ID4gK+mYtuauteaYr+WcqOmAmuefpeWZ
qOeahOesrOS6jOS4quWPguaVsOS4reaMh+WumueahOOAguW9k+esrOS4gOasoeWIm+W7uuetlueV
peaXtu+8jOmYtuauteaYr0NQVUZSRVFfQ1JFQVRFX1BPTElDWe+8jOW9kw0KPiA+ICvnrZbnlaXo
oqvnp7vpmaTml7bvvIzpmLbmrrXmmK9DUFVGUkVRX1JFTU9WRV9QT0xJQ1njgIINCj4gPiArDQo+
ID4gK+esrOS4ieS4quWPguaVsCBgYHZvaWQgKnBvaW50ZXJgYCDmjIflkJHkuIDkuKrnu5PmnoTk
vZNjcHVmcmVxX3BvbGljee+8jOWFtuWMheaLrG1pbu+8jG1heCjmlrDnrZbnlaXnmoTkuIvpmZDl
kowNCj4gPiAr5LiK6ZmQ77yI5Y2V5L2N5Li6a0h677yJKei/meWHoOS4quWAvOOAgg0KPiA+ICsN
Cj4gPiArDQo+ID4gKzIuMiBDUFVGcmVx6L2s5o2i6YCa55+l5ZmoDQo+ID4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gKw0KPiA+ICvlvZNDUFVmcmVx6amx5Yqo5YiH5o2i
Q1BV5qC45b+D6aKR546H5pe277yM562W55Wl5Lit55qE5q+P5Liq5Zyo57q/Q1BV6YO95Lya5pS2
5Yiw5Lik5qyh6YCa55+l77yM6L+Z5Lqb5Y+Y5YyW5rKh5pyJ5Lu75L2V5aSW6YOo5bmyDQo+ID4g
K+mihOOAgg0KPiA+ICsNCj4gPiAr56ys5LqM5Liq5Y+C5pWw5oyH5a6a6Zi25q61IC0gQ1BVRlJF
UV9QUkVDSEFOR0Ugb3IgQ1BVRlJFUV9QT1NUQ0hBTkdFLg0KPiA+ICsNCj4gPiAr56ys5LiJ5Liq
5Y+C5pWw5piv5LiA5Liq5YyF5ZCr5aaC5LiL5YC855qE57uT5p6E5L2TY3B1ZnJlcV9mcmVxc++8
mg0KPiA+ICsNCj4gPiArPT09PT0gICAgICAgID09PT09PT09PT09PT09PT09PT09DQo+ID4gK2Nw
dSAg5Y+X5b2x5ZONY3B155qE57yW5Y+3DQo+ID4gK29sZCAg5pen6aKR546HDQo+ID4gK25ldyAg
5paw6aKR546HDQo+ID4gK2ZsYWdzICAgICAgICBjcHVmcmVx6amx5Yqo55qE5qCH5b+XDQo+ID4g
Kz09PT09ICAgICAgICA9PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArMy4g5ZCr5pyJ
T3BlcmF0aW5nIFBlcmZvcm1hbmNlIFBvaW50IChPUFAp55qEQ1BVRnJlceihqOeahOeUn+aIkA0K
PiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4gPiAr5YWz5LqOT1BQ55qE57uG6IqC6K+35Y+C6ZiFIERvY3VtZW50
YXRpb24vcG93ZXIvb3BwLnJzdA0KPiA+ICsNCj4gPiArZGV2X3BtX29wcF9pbml0X2NwdWZyZXFf
dGFibGUgLQ0KPiA+ICsgICAgIOi/meS4quWKn+iDveaPkOS+m+S6huS4gOS4qumaj+aXtuWPr+eU
qOeahOi9rOaNoueoi+W6j++8jOeUqOadpeWwhk9QUOWxguWFs+S6juWPr+eUqOmikeeOh+eahOWG
hemDqOS/oeaBr+e/u+ivkeaIkOS4gOenjeWuueaYk+aPkOS+m+e7mQ0KPiA+ICsgICAgIGNwdWZy
ZXHnmoTmoLzlvI/jgIINCj4gPiArDQo+ID4gKyAgICAgLi4gV2FybmluZzo6DQo+ID4gKw0KPiA+
ICsgICAgICAgICAgICAg5LiN6KaB5Zyo5Lit5pat5LiK5LiL5paH5Lit5L2/55So5q2k5Ye95pWw
44CCDQo+ID4gKw0KPiA+ICsgICAgIOS+i+Wmgjo6DQo+ID4gKw0KPiA+ICsgICAgICBzb2NfcG1f
aW5pdCgpDQo+ID4gKyAgICAgIHsNCj4gPiArICAgICAgICAgICAgIC8qIERvIHRoaW5ncyAqLw0K
PiA+ICsgICAgICAgICAgICAgciA9IGRldl9wbV9vcHBfaW5pdF9jcHVmcmVxX3RhYmxlKGRldiwg
JmZyZXFfdGFibGUpOw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFyKQ0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBwb2xpY3ktPmZyZXFfdGFibGUgPSBmcmVxX3RhYmxlOw0KPiA+ICsgICAgICAg
ICAgICAgLyogRG8gb3RoZXIgdGhpbmdzICovDQo+ID4gKyAgICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAgLi4gbm90ZTo6DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg6K+l5Ye95pWw5Y+q5pyJ5Zyo
Q09ORklHX1BNX09QUOS5i+Wklui/mOWQr+eUqOS6hkNPTkZJR19DUFVfRlJFUeaXtuaJjeWPr+eU
qOOAgg0KPiA+ICsNCj4gPiArZGV2X3BtX29wcF9mcmVlX2NwdWZyZXFfdGFibGUNCj4gPiArICAg
ICDph4rmlL5kZXZfcG1fb3BwX2luaXRfY3B1ZnJlcV90YWJsZeWIhumFjeeahOihqOOAgg0KPiA+
IC0tDQo+ID4gMi4yNS4xDQo+ID4NCj4gPg0KPg0KPiAtLQ0KPiAtIEppYXh1bg0KDQpUaGFua3MN
Cg0KWWFudGVuZw0K
