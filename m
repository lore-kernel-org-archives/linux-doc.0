Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06112ECAAD3
	for <linux-doc@archiver.kernel.org>; Wed,  7 Sep 2022 03:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiIGD3T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 23:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiIGD3R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 23:29:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6DE89807
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 20:29:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x14so5043935lfu.10
        for <linux-doc@vger.kernel.org>; Tue, 06 Sep 2022 20:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=0gqWYaRkocwEtCfAxf3y8Kw/e6lte6RXsFFn9MPeC3U=;
        b=eWnP7EJSA/qyVy5HUT6SjbztsdgH1w3W7u3jURZMWarpNQOQwieBpD7fn0K84iIMbK
         MWyeZSk13ZcXQdLyUDYsllboeCtGQ1+1IJ/MOK9NCWwYaXVBp3mb6Va/+JrcGlXoRKHD
         tcZ1C3YQy1jE1puEyIswov9qNuh5TLTrh0Mjlxbf5kOa2CjleCQOaNNl9eGUoPG7sPOU
         dQA9KCyZNBQQ5hbV5LNlFbx2kl4LurbRh3NBT0TTJ9Z/kXdEaCang+ejLPlEHxzjxhVs
         7UVZpWZGmCUL+Qav7HZWw35QJG6IuRTsRyKyhqMPLiVlAwHxEKZgCZM+TqxO+d27g3rB
         bh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0gqWYaRkocwEtCfAxf3y8Kw/e6lte6RXsFFn9MPeC3U=;
        b=2uz7pZ5WewDMGJ/VlgSFWbTjXJWgfyTccZAYZRwtgcJKdC8zlNLzuF7hDPgkIfSebZ
         F5bptbjMYdXnrPhjubFGQkehHQPq+V4KfumYV8BpFMxJgf0Qylr8IGX9ceB/dDQm411G
         s39L2CmFMlk5gsKjTrNEssJN7ZwfZ5fu82yjGdZELDmwPips2oz+lSqQgO0VXjih/xhX
         Fo4sWQqet4NtE3bLoVYoqb5pKbxk9nFQryeIlRDupK7zuYNf98wsRvXQpjazD/rPbtmE
         5LN6eME0xYJELl1+z7T0ZbyjhuwWe6Fo20lApv1BHKoig9zprA670MYAY9d56FlPLV1F
         6a4w==
X-Gm-Message-State: ACgBeo3iA5UAQSz1hd86nJOm1/QjPTE58JORJB5JewL/QYaTQLYlACu/
        vRDX4v3EYWNTCJ4hLxEU25NfTEVV+U9Nn5QrW4+Dwa6Q+Dc=
X-Google-Smtp-Source: AA6agR7o43h0F7/kb+WegWbdhHu1R7ZaXEFGVkChAVBCyUEzZG5ZREQaK3h3OMVy1xfTJ4h56XzQafDjUxiZVyXd0xs=
X-Received: by 2002:a05:6512:3d92:b0:494:97d0:6e27 with SMTP id
 k18-20020a0565123d9200b0049497d06e27mr454024lfv.153.1662521354746; Tue, 06
 Sep 2022 20:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662449105.git.siyanteng@loongson.cn> <07d23cedda1e2cd8cf40d68059024d116f8d004e.1662449105.git.siyanteng@loongson.cn>
In-Reply-To: <07d23cedda1e2cd8cf40d68059024d116f8d004e.1662449105.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 7 Sep 2022 11:28:38 +0800
Message-ID: <CAJy-Ammih-X-0GnpWUaCvn3RqJ=eXJpa2MpOiajT1cOhyVSkdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] docs/zh_CN: add dt changesets translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVHVlLCBTZXAgNiwgMjAyMiBhdCA0OjI3IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSAuLi4vZGV2aWNldHJlZS9jaGFuZ2VzZXRz
LnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFu
dGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwu
b3JnPg0KDQo+IC0tLQ0KPiAgLi4uL3poX0NOL2RldmljZXRyZWUvY2hhbmdlc2V0cy5yc3QgICAg
ICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9D
Ti9kZXZpY2V0cmVlL2luZGV4LnJzdCAgIHwgIDMgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvY2hhbmdlc2V0cy5yc3QNCj4N
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRy
ZWUvY2hhbmdlc2V0cy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXZp
Y2V0cmVlL2NoYW5nZXNldHMucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMmFjZTA1ZjNjMzc3DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNldHJlZS9jaGFuZ2VzZXRzLnJzdA0KPiBA
QCAtMCwwICsxLDM3IEBADQo+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
PiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ICsNCj4gKzpPcmlnaW5h
bDogRG9jdW1lbnRhdGlvbi9EZXZpY2V0cmVlL2NoYW5nZXNldHMucnN0DQo+ICsNCj4gKzrnv7vo
r5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNu
Pg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICsNCj4gKz09PT09PT09PT09PQ0KPiAr6K6+5aSH
5qCR5Y+Y5pu06ZuGDQo+ICs9PT09PT09PT09PT0NCj4gKw0KPiAr6K6+5aSH5qCR5Y+Y5pu06ZuG
5piv5LiA56eN5pa55rOV77yM5a6D5YWB6K645Lq65Lus5Lul6L+Z5qC35LiA56eN5pa55byP5Zyo
5a6e5pe25qCR5Lit5L2/55So5Y+Y5YyW77yM5Y2z6KaB5LmI5L2/55So5YWo6YOo55qEDQo+ICvl
j5jljJbvvIzopoHkuYjkuI3kvb/nlKjjgILlpoLmnpzlnKjkvb/nlKjlj5jmm7Tpm4bnmoTov4fn
qIvkuK3lj5HnlJ/plJnor6/vvIzpgqPkuYjmoJHlsIbooqvlm57mu5rliLDkuYvliY3nmoTnirbm
gIHjgILkuIDkuKoNCj4gK+WPmOabtOmbhuS5n+WPr+S7peWcqOS9v+eUqOWQjuiiq+WIoOmZpOOA
gg0KPiArDQo+ICvlvZPkuIDkuKrlj5jmm7Tpm4booqvkvb/nlKjml7bvvIzmiYDmnInnmoTmlLnl
j5jlnKjlj5Hlh7pPRl9SRUNPTkZJR+mAmuefpeWZqOS5i+WJjeiiq+S4gOasoeaAp+S9v+eUqOWI
sOagkeS4iuOAgui/meaYrw0KPiAr5Li65LqG6K6p5o6l5pS26ICF5Zyo5pS25Yiw6YCa55+l5pe2
55yL5Yiw5LiA5Liq5a6M5pW055qE44CB5LiA6Ie055qE5qCR55qE54q25oCB44CCDQo+ICsNCj4g
K+S4gOS4quWPmOWMlumbhueahOmhuuW6j+WmguS4i+OAgg0KPiArDQo+ICsxLiBvZl9jaGFuZ2Vz
ZXRfaW5pdCgpIC0g5Yid5aeL5YyW5LiA5Liq5Y+Y5pu06ZuG44CCDQo+ICsNCj4gKzIuIOS4gOS6
m0RU5qCR5Y+Y5YyW55qE6LCD55So77yMb2ZfY2hhbmdlc2V0X2F0dGFjaF9ub2RlKCksIG9mX2No
YW5nZXNldF9kZXRhY2hfbm9kZSgpLA0KPiArICAgb2ZfY2hhbmdlc2V0X2FkZF9wcm9wZXJ0eSgp
LCBvZl9jaGFuZ2VzZXRfcmVtb3ZlX3Byb3BlcnR5LA0KPiArICAgb2ZfY2hhbmdlc2V0X3VwZGF0
ZV9wcm9wZXJ0eSgp5p2l5YeG5aSH5LiA57uE5Y+Y5pu044CC5q2k5pe25LiN5Lya5a+55rS75Yqo
5qCR5YGa5Lu75L2V5Y+Y5pu044CC5omA5pyJDQo+ICsgICDnmoTlj5jmm7Tmk43kvZzpg73orrDl
vZXlnKhvZl9jaGFuZ2VzZXTnmoQgYGVudHJpZXNgIOWIl+ihqOS4reOAgg0KPiArDQo+ICszLiBv
Zl9jaGFuZ2VzZXRfYXBwbHkoKSAtIOWwhuWPmOabtOS9v+eUqOWIsOagkeS4iuOAguimgeS5iOaV
tOS4quWPmOabtOmbhuiiq+S9v+eUqO+8jOimgeS5iOWmguaenOaciemUmeivr++8jA0KPiArICAg
5qCR5Lya6KKr5oGi5aSN5Yiw5LmL5YmN55qE54q25oCB44CC5qC45b+D6YCa6L+H6ZSB56Gu5L+d
5q2j56Gu55qE6aG65bqP44CC5aaC5p6c6ZyA6KaB55qE6K+d77yM5Y+v5Lul5L2/55So5LiA5Liq
6Kej6ZSB55qEDQo+ICsgICBfX29mX2NoYW5nZXNldF9hcHBseeeJiOacrOOAgg0KPiArDQo+ICvl
poLmnpzkuIDkuKrmiJDlip/kvb/nlKjnmoTlj5jmm7Tpm4bpnIDopoHooqvliKDpmaTvvIzlj6/k
u6XnlKhvZl9jaGFuZ2VzZXRfcmV2ZXJ0KCnmnaXlrozmiJDjgIINCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0IGIvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2aWNldHJlZS9pbmRleC5yc3QNCj4gaW5k
ZXggM2ZjMzU1ZmUwMDM3Li5lOWFmZjJjY2M1NzkgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2RldmljZXRyZWUvaW5kZXgucnN0DQo+IEBAIC0z
NCw5ICszNCwxMCBAQCBEZXZpY2V0cmVlIE92ZXJsYXlzDQo+ICAuLiB0b2N0cmVlOjoNCj4gICAg
IDptYXhkZXB0aDogMQ0KPg0KPiArICAgY2hhbmdlc2V0cw0KPiArDQo+ICBUb2RvbGlzdDoNCj4N
Cj4gLSogICBjaGFuZ2VzZXRzDQo+ICAqICAgZHluYW1pYy1yZXNvbHV0aW9uLW5vdGVzDQo+ICAq
ICAgb3ZlcmxheS1ub3Rlcw0KPg0KPiAtLQ0KPiAyLjMxLjENCj4NCg==
