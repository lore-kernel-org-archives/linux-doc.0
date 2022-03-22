Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94260C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 08:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbiCVID5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 04:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiCVID4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 04:03:56 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BD22AE0B
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 01:02:29 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id q11so19327030iod.6
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 01:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+cjItZt53Nj0IR+GpDaDIMEC8rx9bVPQDTQ43S5bvVY=;
        b=dCYIj2wdNh3zNCwor1oj3K9Lq92w1Qr5E+Q1PmSoM4bN3gEH/XKCkK7xG/unYTvBlV
         dOlZ6xeF0YU6jdJ4WxkbfApQ/xkRD2Ul/A4mKoZ+9wHZkGiuIGfatRhwQrDT0pVCO+R4
         UJBqkL9BHOcbY+0FeQXuxzuZZojkp8wIalLasA3kJcuTpFy+G/Cq2UgsDPdh9w9xAvc1
         r3YhX+JPgqVh9vlGKkEc1aGQ/V5/8GOkv343GVr0WsYybhpB3XHlARcNUo5Xc6SWnu5q
         qpKx0x05OwJSODBn0u9U02K6mH9VGyxx0GlQzO9p1xjnwrsIELobMwIWsdRC8zEWuotm
         E+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+cjItZt53Nj0IR+GpDaDIMEC8rx9bVPQDTQ43S5bvVY=;
        b=sI0zle8p8hdRM+wQHtQirHVMvBKPaBII1+t/9MB8FkUmVrQELmrsERxt2luRdI8VuW
         ltbfYrT6TJYXfPPSPmEv1iLdxQBOKclTM4byf25XBaBVk8TBMBfVIz7v8fIEj0vEYAHW
         n+3yU6l7L8UQqZlZeND/uBix7NwOCLDn6HnL2TR5Vv1hOSADCz+C09j6iEloPOskgdgm
         JLDv/V/0e/PeMCenWqqOm7h2r4fTMrLtjuoGdyeBXryszF/iLjff3tTD7w2BxlZ9YGCC
         5FdnlbJg+ZwJt24TOmbJssQ7JqtkZbwXTKWEXlQ37iwS2r3u8AZA5YWavccOz5KpXVJv
         WlPg==
X-Gm-Message-State: AOAM531ywOy2qrZfhR0TrPv/LX59ahlUZRe817K2dFsl6rZWwxaZY3ZG
        v311/aNIlDp6qoIzaysp7wbE+lv5YSp63vZVMHs=
X-Google-Smtp-Source: ABdhPJzoAQVwYkw/OSr3Z0rBTgGGhABZanEZVy874Tr6orXkE0qv6kTKcWbAlnvqeSmDzwZmpqiQ9Ty/vMoryR4E2m0=
X-Received: by 2002:a6b:8f15:0:b0:645:dfdb:7a35 with SMTP id
 r21-20020a6b8f15000000b00645dfdb7a35mr10982225iod.36.1647936148843; Tue, 22
 Mar 2022 01:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <144153c9b9f611d508255b339299d62e56e470be.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <144153c9b9f611d508255b339299d62e56e470be.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 16:01:52 +0800
Message-ID: <CAJy-Am=xgmq2rM_gfGtQoefrvKite2Gh_6JChNJMtKp1SKL9WA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] docs/zh_CN: add vm overcommit-accounting translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vb3ZlcmNvbW1pdC1hY2NvdW50aW5nLnJzdCBp
bnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bs
b29uZ3Nvbi5jbj4NClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCg0K
PiAtLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdCB8
ICAyICstDQo+ICAuLi4vemhfQ04vdm0vb3ZlcmNvbW1pdC1hY2NvdW50aW5nLnJzdCAgICAgICAg
fCA4NiArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi92bS9vdmVyY29tbWl0LWFjY291bnRpbmcucnN0DQo+DQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gaW5kZXgg
MWZiODBhYTdhMDhiLi4xYzZlYzg0N2EyZjMgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gQEAgLTMxLDYgKzMxLDcgQEAgVE9ETzrl
voXlvJXnlKjmlofmoaPpm4booqvnv7vor5Hlrozmr5XlkI7or7flj4rml7bkv67mlLnmraTlpITv
vIkNCj4gICAgIGh3cG9pc29uDQo+ICAgICBtZW1vcnktbW9kZWwNCj4gICAgIG1tdV9ub3RpZmll
cg0KPiArICAgb3ZlcmNvbW1pdC1hY2NvdW50aW5nDQo+DQo+ICBUT0RPTElTVDoNCj4gICogYXJj
aF9wZ3RhYmxlX2hlbHBlcnMNCj4gQEAgLTM4LDcgKzM5LDYgQEAgVE9ET0xJU1Q6DQo+ICAqIGht
bQ0KPiAgKiBodWdldGxiZnNfcmVzZXJ2DQo+ICAqIG51bWENCj4gLSogb3ZlcmNvbW1pdC1hY2Nv
dW50aW5nDQo+ICAqIHBhZ2VfbWlncmF0aW9uDQo+ICAqIHBhZ2VfZnJhZ3MNCj4gICogcGFnZV9v
d25lcg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0v
b3ZlcmNvbW1pdC1hY2NvdW50aW5nLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZtL292ZXJjb21taXQtYWNjb3VudGluZy5yc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44NzY1Y2IxMThmMjQNCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9vdmVyY29tbWl0LWFjY291
bnRpbmcucnN0DQo+IEBAIC0wLDAgKzEsODYgQEANCj4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlv
bi92bS9vdmVyY29tbWl0LWFjY291bnRpbmcucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs6
5qCh6K+ROg0KPiArDQo+ICsNCj4gKw0KPiArPT09PT09PT09PT09PT0NCj4gK+i2hemHj+S9v+eU
qOWuoeiuoQ0KPiArPT09PT09PT09PT09PT0NCj4gKw0KPiArTGludXjlhoXmoLjmlK/mjIHkuIvl
iJfotoXph4/kvb/nlKjlpITnkIbmqKHlvI8NCj4gKw0KPiArMA0KPiArICAgICAgIOWQr+WPkeW8
j+i2hemHj+S9v+eUqOWkhOeQhuOAguaLkue7neaYjuaYvueahOWcsOWdgOepuumXtOi2hemHj+S9
v+eUqOOAgueUqOS6juS4gOS4quWFuOWei+eahOezu+e7n+OAgg0KPiArICAgICAgIOWug+ehruS/
neS4pemHjeeahOeWr+eLguWIhumFjeWksei0pe+8jOWQjOaXtuWFgeiuuOi2hemHj+S9v+eUqOS7
peWHj+WwkXN3YXDnmoTkvb/nlKjjgILlnKjov5nnp43mqKHlvI/kuIvvvIwNCj4gKyAgICAgICDl
hYHorrhyb2905YiG6YWN56iN5aSa55qE5YaF5a2Y44CC6L+Z5piv6buY6K6k55qE44CCDQo+ICsx
DQo+ICsgICAgICAg5oC75piv6LaF6YeP5L2/55So44CC6YCC55So5LqO5LiA5Lqb56eR5a2m5bqU
55So44CC57uP5YW455qE5L6L5a2Q5piv5L2/55So56iA55aP5pWw57uE55qE5Luj56CB77yM5Y+q
5piv5L6d6LWWDQo+ICsgICAgICAg5Yeg5LmO5a6M5YWo55Sx6Zu26aG157uE5oiQ55qE6Jma5ouf
5YaF5a2YDQo+ICsNCj4gKzINCj4gKyAgICAgICDkuI3otoXph4/kvb/nlKjjgILns7vnu5/mj5Dk
uqTnmoTmgLvlnLDlnYDnqbrpl7TkuI3lhYHorrjotoXov4dzd2FwK+S4gOS4quWPr+mFjee9ruea
hOeJqeeQhlJBTeeahOaVsOmHjw0KPiArICAgICAgIO+8iOm7mOiupOS4ujUwJe+8ieOAguagueaN
ruS9oOS9v+eUqOeahOaVsOmHj++8jOWcqOWkp+WkmuaVsOaDheWGteS4i++8jOi/meaEj+WRs+ed
gOS4gOS4qui/m+eoi+WcqOiuv+mXrumhtemdouaXtg0KPiArICAgICAgIOS4jeS8muiiq+adgOat
u++8jOS9huS8muWcqOWGheWtmOWIhumFjeS4iuaUtuWIsOebuOW6lOeahOmUmeivr+OAgg0KPiAr
DQo+ICsgICAgICAg5a+55LqO6YKj5Lqb5oOz5L+d6K+B5LuW5Lus55qE5YaF5a2Y5YiG6YWN5Zyo
5pyq5p2l5Y+v55So6ICM5Y+I5LiN6ZyA6KaB5Yid5aeL5YyW5q+P5LiA5Liq6aG16Z2i55qE5bqU
55So56iL5bqP5p2l6K+0DQo+ICsgICAgICAg5piv5b6I5pyJ55So55qE44CCDQo+ICsNCj4gK+i2
hemHj+S9v+eUqOetlueVpeaYr+mAmui/h3N5c2N0bCAgYHZtLm92ZXJjb21taXRfbWVtb3J5YCDo
rr7nva7nmoTjgIINCj4gKw0KPiAr5Y+v5Lul6YCa6L+HIGB2bS5vdmVyY29tbWl0X3JhdGlvYCDv
vIjnmb7liIbmr5TvvInmiJYgYHZtLm92ZXJjb21taXRfa2J5dGVzYCDvvIjnu53lr7nlgLzvvIkN
Cj4gK+adpeiuvue9rui2hemZkOaVsOmHj+OAgui/meS6m+WPquacieWcqCBgdm0ub3ZlcmNvbW1p
dF9tZW1vcnlgIOiiq+iuvue9ruS4ujLml7bmiY3mnInmlYjmnpzjgIINCj4gKw0KPiAr5ZyoIGBg
L3Byb2MvbWVtaW5mb2BgIOS4reWPr+S7peWIhuWIq+S7pUNvbW1pdExpbWl05ZKMQ29tbWl0dGVk
X0FT55qE5b2i5byP5p+l55yL5b2T5YmNDQo+ICvnmoTotoXph4/kvb/nlKjlkozmj5DkuqTph4/j
gIINCj4gKw0KPiAr6Zm36ZixDQo+ICs9PT09DQo+ICsNCj4gK0Por63oqIDnmoTloIbmoIjlop7p
lb/mmK/kuIDkuKrpmpDlkKvnmoRtcmVtYXDjgILlpoLmnpzkvaDmg7PlvpfliLDnu53lr7nnmoTk
v53or4HvvIzlubblnKjmjqXov5HovrnnvJjnmoTlnLDmlrnov5DooYzvvIwNCj4gK+S9oCAqKuW/
hemhuyoqIOS4uuS9oOiupOS4uuS9oOmcgOimgeeahOacgOWkp+WwuuWvuOeahOWghuagiOi/m+ih
jG1tYXDjgILlr7nkuo7lhbjlnovnmoTloIbmoIjkvb/nlKjmnaXor7TvvIzov5nlubYNCj4gK+S4
jemHjeimge+8jOS9huWmguaenOS9oOecn+eahOmdnuW4uOWFs+W/g+eahOivne+8jOi/meWwseaY
r+S4gOS4quWAvOW+l+WFs+azqOeahOahiOS+i+OAgg0KPiArDQo+ICsNCj4gK+WcqOaooeW8jzLk
uK3vvIxNQVBfTk9SRVNFUlZF5qCH5b+X6KKr5b+955Wl44CCDQo+ICsNCj4gKw0KPiAr5a6D5piv
5aaC5L2V5bel5L2c55qEDQo+ICs9PT09PT09PT09PT09PQ0KPiArDQo+ICvotoXph4/kvb/nlKjm
mK/ln7rkuo7ku6XkuIvop4TliJkNCj4gKw0KPiAr5a+55LqO5paH5Lu25pig5bCEDQo+ICsgICAg
ICAgfCBTSEFSRUQgb3IgUkVBRC1vbmx5ICAgLSAgICAgICAwIGNvc3QgKOivpeaWh+S7tuaYr+aY
oOWwhOiAjOS4jeaYr+S6pOaNoikNCj4gKyAgICAgICB8IFBSSVZBVEUgV1JJVEFCTEUgICAgICAt
ICAgICAgIOavj+S4quWunuS+i+eahOaYoOWwhOWkp+Wwjw0KPiArDQo+ICvlr7nkuo7ljL/lkI3m
iJbogIUgYGAvZGV2L3plcm9gYCDmmKDlsIQNCj4gKyAgICAgICB8IFNIQVJFRCAgICAgICAgICAg
ICAgICAgICAgICAgIC0gICAgICAg5pig5bCE55qE5aSn5bCPDQo+ICsgICAgICAgfCBQUklWQVRF
IFJFQUQtb25seSAgICAgLSAgICAgICAwIGNvc3QgKOS9huS9nOeUqOS4jeWkpykNCj4gKyAgICAg
ICB8IFBSSVZBVEUgV1JJVEFCTEUgICAgICAtICAgICAgIOavj+S4quWunuS+i+eahOaYoOWwhOWk
p+Wwjw0KPiArDQo+ICvpop3lpJbnmoTorqHmlbANCj4gKyAgICAgICB8IOmAmui/h21tYXDliLbk
vZzlj6/lhpnlia/mnKznmoTpobXpnaINCj4gKyAgICAgICB8IOS7juWQjOS4gOaxoOS4reaPkOWP
lueahHNobWZz5YaF5a2YDQo+ICsNCj4gK+eKtuaAgQ0KPiArPT09PQ0KPiArDQo+ICsqICAgICAg
5oiR5Lus5qC4566XbW1hcOWGheWtmOaYoOWwhA0KPiArKiAgICAgIOaIkeS7rOaguOeul21wcm90
ZWN05Zyo5o+Q5Lqk5Lit55qE5Y+Y5YyWDQo+ICsqICAgICAg5oiR5Lus5qC4566XbXJlbWFw55qE
5aSn5bCP5Y+Y5YyWDQo+ICsqICAgICAg5oiR5Lus55qE5a6h6K6hIGJyaw0KPiArKiAgICAgIOWu
oeiuoW11bm1hcA0KPiArKiAgICAgIOaIkeS7rOWcqC9wcm9j5Lit5oql5ZGKY29tbWl0IOeKtuaA
gQ0KPiArKiAgICAgIOaguOWvueW5tuajgOafpeWIhuWPieeahOaDheWGtQ0KPiArKiAgICAgIOWu
oeafpeWghuagiOWkhOeQhi/miafooYzkuK3nmoTmnoTlu7oNCj4gKyogICAgICDlj5nov7BTSE1m
c+eahOaDheWGtQ0KPiArKiAgICAgIOWunueOsOWunumZhemZkOWItueahOaJp+ihjA0KPiArDQo+
ICvlvoXnu60NCj4gKz09PT0NCj4gKyogICAgICBwdHJhY2Ug6aG16K6h5pWw77yI6L+Z5b6I6Zq+
77yJ44CCDQo+IC0tDQo+IDIuMjcuMA0KPg0K
