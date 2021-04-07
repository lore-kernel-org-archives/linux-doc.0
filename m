Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_QUOTING
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF9CC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8E8B61369
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhDGHNj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDGHNj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 03:13:39 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EABC06174A
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 00:13:30 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w70so17862827oie.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 00:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OHGl+ra94LJ3FzEPI9ong5XEpzfEDs7YdzPhmR08y3Q=;
        b=Eyy0oA8AfV2W+l43TaEJXkY6EAU1bNtIOkZo3e0IXuMGIwMZNjcCvTJetPf2tMqfRc
         h7MLKrJ4aix0b0W1CyTi2/Hc/5IAe11nEo+OEfuJW1yxjVLLr6o6L4oN5IQ2OpHlOVrr
         lU5fxpl/bZgJD0/LPyY+/SupeR8ZV2dEUkNKhwQwnEJ1kkb67Ny33+TxWYIOWvai74W4
         gbtfJhFIQyaz7aDgW72Us1qdZRpee6NAKjO2vigL7yYSbAwhYc2n9ZM5SescaVmoDt/1
         sx6gCzKKil7uCRqwHONWxw3mrQjG/iFHqbLeMPIhsSXks5I7orpsi/5qB8mNBhDXmdRg
         iXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OHGl+ra94LJ3FzEPI9ong5XEpzfEDs7YdzPhmR08y3Q=;
        b=C2sjxaRDobIkbRVDb72FZAMO8NUqQjF1VIv9cr/TlXmfmJmXEXo7CWgQB+nG6xl2Es
         NescsXNW6jlQPyAcH/f5OXrhrrforoid6Q8SLLMMs1q6g0uLxDVONofk7V+gc9zLju53
         Y4EhmssRGRpxw3IHR14rIn0U1y1OWMKPy3WbfVMr0J4A2TMvmU5Tk2wxx1/G3DzqvDQ2
         5DtBtlwT3KVwXQbuq4iEMJb+0+1KRLGoHyifTzMCty7Q6nP6a9dAAcElAjsoFr1xtKPn
         ovLWbU77MYRpIafZWRV2GWUO9N+rzOSYVqE+Ro9fvVUK+xiCQDUD7wXzmVjciVFLcHu7
         lGzQ==
X-Gm-Message-State: AOAM531Lm97OHDg8Hs57127gnYyrqrAAkRsoT0LvVBXBo4jKHkIVRxFZ
        D8KkltUBqDJZfWBJLKSdS45qpBT6znz63860RAQ=
X-Google-Smtp-Source: ABdhPJztRTdd2RZlRaQmD8Jt23f6nWO+W4bgOOK6WBgFalb7OkFa6QSYqr0Nwada9AsBCodq3GJXo9HPC3TKOpnpGX0=
X-Received: by 2002:aca:4104:: with SMTP id o4mr1326081oia.127.1617779609848;
 Wed, 07 Apr 2021 00:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-5-siyanteng@loongson.cn> <20210406161250.GD15259@bobwxc.top>
 <CAEensMxwJ02n9QL+4pN7K4heNm4Wa0RfkEixnJ-tzrZ6RiZ=pg@mail.gmail.com> <20210407050831.GB20005@bobwxc.top>
In-Reply-To: <20210407050831.GB20005@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 15:13:19 +0800
Message-ID: <CAEensMxmx8VGBNLH-ONwqP2P5J3j0Aza8z-KW82_JHWv6w1nqQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] docs/zh_CN: add core-api irq irqflags-tracing.rst translation
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
MTowOOWGmemBk++8mg0KPg0KPiBPbiBXZWQsIEFwciAwNywgMjAyMSBhdCAxMTowMzoxMUFNICsw
ODAwLCB5YW50ZW5nIHNpIHdyb3RlOg0KPiA+IFd1IFguQy4gPGJvYnd4Y0BlbWFpbC5jbj4g5LqO
MjAyMeW5tDTmnIg35pel5ZGo5LiJIOS4iuWNiDEyOjEz5YaZ6YGT77yaDQo+ID4gPg0KPiA+ID4g
T24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDk6MDI6MDNQTSArMDgwMCwgWWFudGVuZyBTaSB3cm90
ZToNCj4gPiA+ID4gVGhpcyBwYXRjaCB0cmFuc2xhdGVzIERvY3VtZW50YXRpb24vY29yZS1hcGkv
aXJxL2lycWZsYWdzLXRyYWNpbmcucnN0IGludG8gQ2hpbmVzZS4NCj4gPiA+ID4NCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ID4g
PiAtLS0NCj4gPiA+ID4gIC4uLi96aF9DTi9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5y
c3QgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
NiBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vY29yZS1hcGkvaXJxL2lycWZsYWdzLXRyYWNpbmcucnN0DQo+
ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QNCj4gPiA+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4yYTNm
NTc3YWM2YjUNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pcnEvaXJxZmxhZ3MtdHJhY2luZy5yc3QN
Cj4gPiA+ID4gQEAgLTAsMCArMSw0NSBAQA0KPiA+ID4gPiArLi4gaW5jbHVkZTo6IC4uLy4uL2Rp
c2NsYWltZXItemhfQ04ucnN0DQo+ID4gPiA+ICsNCj4gPiA+ID4gKzpPcmlnaW5hbDogOmRvYzpg
Li4vLi4vLi4vLi4vY29yZS1hcGkvaXJxL2lycWZsYWdzLXRyYWNpbmdgDQo+ID4gPiA+ICs6VHJh
bnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ID4gPiArDQo+
ID4gPiA+ICsuLiBfY25faXJxZmxhZ3MtdHJhY2luZy5yc3Q6DQo+ID4gPiA+ICsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ID4gK0lSUS1mbGFnc+eK
tuaAgei/vei4qg0KPiA+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ID4gKw0K
PiA+ID4gPiArOkF1dGhvcjog5pyA5Yid55SxSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+
5byA5aeL5pKw5YaZDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyJpcnEtZmxhZ3MgdHJhY2luZyIg5Yqf
6IO95Y+v5LulICLov73ouKoiIGhhcmRpcnHlkoxzb2Z0aXJx55qE54q25oCB77yM5a6D6K6p5oSf
5YW06Laj55qE5a2QDQo+ID4gPg0KPiA+ID4gImlycS1mbGFncyB0cmFjaW5nIu+8iOS4reaWreag
h+W/l+i/vei4qu+8iSDvvJ8NCj4gPiBPSyENCj4gPiA+DQo+ID4gPiA+ICvns7vnu5/mnInmnLrk
vJrkuobop6PliLDliLDlhoXmoLjkuK3lj5HnlJ/nmoTmr4/kuIDkuKoNCj4gPiA+ID4gK2hhcmRp
cnFzLW9mZi9oYXJkaXJxcy1vbuOAgXNvZnRpcnFzLW9mZi9zb2Z0aXJxcy1vbuS6i+S7tuOAgg0K
PiA+ID4gPiArDQo+ID4gPiA+ICtDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVOaYr+mAmueU
qOmUgeiwg+ivleS7o+eggeaPkOS+m+eahENPTkZJR19QUk9WRV9TUElOX0xPQ0tJTkcNCj4gPiA+
ID4gK+WSjENPTkZJR19QUk9WRV9SV19MT0NLSU5H5omA6ZyA6KaB55qE44CC5ZCm5YiZ5bCG5Y+q
5pyJQ09ORklHX1BST1ZFX01VVEVYX0xPQ0tJTkflkowNCj4gPiA+ID4gK0NPTkZJR19QUk9WRV9S
V1NFTV9MT0NLSU5H5Zyo5LiA5Liq5p625p6E5LiK6KKr5o+Q5L6bLS3ov5nkupvpg73mmK/kuI3l
nKhJUlHkuIrkuIvmlofkuK3kvb/nlKjnmoQNCj4gPiA+ID4gK+mUgUFQSeOAgihyd3NlbXPnmoTk
uIDkuKrlvILluLjmmK/lj6/ku6Xop6PlhrPnmoQpDQo+ID4gPiA+ICsNCj4gPiA+ID4gK+aetuae
hOWvuei/meS4gOeCueeahOaUr+aMgeW9k+eEtuS4jeWxnuS6jiAi55CQ56KOICLnmoTojIPnlbTv
vIzlm6DkuLrlvojlpJrkvY7nuqfnmoTmsYfnvJbku6PnoIHpg73opoHlpITnkIZpcnEtZmxhZ3MN
Cj4gPiA+DQo+ID4gPiBxdW90YXRpb24gbWFya3MNCj4gPiA+IOKAnOeQkOeijuKAnQ0KPiA+IOW+
ruS4jei2s+mBkw0KPiA+IE9L77yfDQo+DQo+IE9oLCB5b3UgbWlzdW5kZXJzdG9vZCBtZSA6UA0K
Pg0KPiBUaGF0J3MganVzdCBmb3IgdGhlIHB1bmN0dWF0aW9uIG1hcmtzLCBwbGVhc2UgdXNlIOKA
nOKAnSAsIG5vdCAiIg0KPg0KT0shICB+Pl88fg0KPiA+ID4NCj4gPiA+ID4gK+eahOeKtuaAgeWP
mOWMluOAguS9huaYr+S4gOS4quaetuaehOWPr+S7peS7peS4gOenjeebuOW9k+ebtOaOpeS4lOaX
oOmjjumZqeeahOaWueW8j+WQr+eUqGlycS1mbGFncy10cmFjaW5n44CCDQo+ID4gPiA+ICsNCj4g
PiA+ID4gK+aetuaehOWmguaenOaDs+aUr+aMgei/meS4qu+8jOmcgOimgeWFiOWBmuS4gOS6m+S7
o+eggee7hOe7h+S4iueahOaUueWPmDoNCj4gPiA+ID4gKw0KPiA+ID4gPiArLSDlnKjku5bku6zn
moRhcmNo57qnS2NvbmZpZ+aWh+S7tuS4rea3u+WKoOW5tuWQr+eUqFRSQUNFX0lSUUZMQUdTX1NV
UFBPUlTjgIINCj4gPiA+ID4gKw0KPiA+ID4gPiAr54S25ZCO6L+Y6ZyA6KaB5YGa5LiA5Lqb5Yqf
6IO95LiK55qE5pS55Y+Y5p2l5a6e546w5a+5aXJxLWZsYWdzLXRyYWNpbmfnmoTmlK/mjIE6DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKy0g5Zyo5L2O57qn5YWl5Y+j5Luj56CB5Lit5aKe5YqgKOaehOW7
uuadoeS7tinlr7l0cmFjZV9oYXJkaXJxc19vZmYoKS90cmFjZV9oYXJkaXJxc19vbigpDQo+ID4g
Pg0KPiA+ID4gYnJhY2tldHMNCj4gPiA+IO+8iOaehOW7uuadoeS7tu+8iQ0KPiA+IE9yaWdpbjog
aW4gbG93bGV2ZWwgZW50cnkgY29kZSBhZGQgKGJ1aWxkLWNvbmRpdGlvbmFsKSBjYWxscyB0byB0
aGUNCj4NCj4gVGhpcyBtZWFucyB0byB1c2UgMi1ieXRlIG1vZGUgYnJhY2tldHMsIHRodXMgJ++8
iO+8iScsIG5vdCAnKCknDQpPS++8gQ0KPg0KPiA+ID4NCj4gPiA+ID4gKyAg5Ye95pWw55qE6LCD
55So44CC6ZSB6aqM6K+B5Zmo5Lya5a+G5YiH5YWz5rOoICLnnJ/lrp4gIueahGlycS1mbGFnc+aY
r+WQpuS4jiAi6Jma5oufICLnmoRpcnEtZmxhZ3MNCj4gPiA+DQo+ID4gPiDigJznnJ/lrp7igJ0g
IOKAnOiZmuaLn+KAnQ0KPiA+IEkgdHJpZWQgdG8gZGVsdmUgaW50byBpdCwgYnV0IEkgZm91bmQg
aXQgd2Fzbid0IGVhc3ksIGFuZCBJIG5lZWRlZCBzb21lIHRpbWUuDQo+ID4gYWxzbyAg4oCdaXJx
LWZsYWdzLXRyYWNpbmfigJwNCj4NCj4gVGhhdCdzIGFsc28ganVzdCBmb3IgdGhlIHB1bmN0dWF0
aW9uIG1hcmtzLCBwbGVhc2UgdXNlIOKAnOKAnSAsIG5vdCAiIg0KPg0KT0shDQo+ID4gPg0KPiA+
ID4gPiArICDnirbmgIHnm7jljLnphY3vvIzlpoLmnpzkuKTogIXkuI3ljLnphY3vvIzliJnkvJrl
pKflo7DmirHmgKjvvIjlubblhbPpl63oh6rlt7HvvInjgILpgJrluLjlr7nkuo5hcmNo5pSv5oyB
DQo+ID4gPg0KPiA+ID4g5aSn5aOw5oqx5oCoIC0+IOWPkeWHuuitpuWRiiDvvJ8NCj4gPiA+IHNv
IGFzIGZvbGxvd2VkIOaKseaAqA0KPiA+IE9LIQ0KPiA+ID4NCj4gPiA+ID4gKyAgaXJxLWZsYWdz
LXRyYWNr55qE5aSn6YOo5YiG5pe26Ze06YO95piv5Zyo6L+Z56eN54q25oCB5LiL5bqm6L+H55qE
77ya55yL55yLbG9ja2RlcOeahOaKseaAqO+8jOivleedgA0KPiA+ID4NCj4gPiA+IE1heWJlIHRo
aXMgaXMgYmV0dGVyDQo+ID4gPiDpgJrluLjnu7TmiqRhcmNo5LitaXJxLWZsYWdzLXRyYWNr55qE
5aSn6YOo5YiG5pe26Ze0Li4uDQo+ID4gT0shDQo+ID4gPg0KPiA+ID4gPiArICDmib7lh7rmiJHk
u6zov5jmsqHmnInmtonlj4rnmoTmsYfnvJbku6PnoIHjgILkv67lpI3lubbph43lpI3jgILkuIDm
l6bns7vnu5/lkK/liqjvvIzlubbkuJTlnKhpcnEtZmxhZ3Pot5/ouKrlip8NCj4gPiA+DQo+ID4g
PiAuLi7ov5jmsqHmnInmkJ7lrprnmoTmsYfnvJbku6PnoIHvvIzkv67lpI3lubbph43lpI3jgIIN
Cj4gPiBPSyENCj4gPiA+DQo+ID4gPiBpcnEtZmxhZ3MtdHJhY2luZyAgY2hlY2sgdGhpcyB0ZXJt
J3MgdHJhbnNsYXRpb24NCj4gPiA+DQo+ID4gPiA+ICsgIOiDveS4reayoeacieWHuueOsGxvY2tk
ZXDmirHmgKjnmoTmg4XlhrXkuIvvvIxhcmNo5pSv5oyB5bCx5a6M5oiQ5LqG44CCDQo+ID4gPiA+
ICsNCj4gPiA+ID4gKy0g5aaC5p6c6K+l5p625p6E5pyJ5LiN5Y+v5bGP6JS955qE5Lit5pat77yM
6YKj5LmI6ZyA6KaB6YCa6L+HbG9ja2RlcF9vZmYoKS9sb2NrZGVwX29uKCnlsIbov5nkupvkuK0N
Cj4gPiA+ID4gKyAg5pat5LuOaXJx6Lef6LiqW+WSjOmUgemqjOivgV3mnLrliLbkuK3mjpLpmaTj
gIINCj4gPiA+ID4gKw0KPiA+ID4NCj4gPiA+IHdyb25nIGluZGVudCBmb3IgbmV4dCBwYXJhZ3Jh
cGgNCj4gPiBPSyENCj4gPiA+DQo+ID4gPiA+ICsgIOS4gOiIrOadpeivtO+8jOWcqOS4gOS4quae
tuaehOS4re+8jOS4jeWujOaVtOeahGlycS1mbGFncy10cmFjaW5n5a6e546w5piv5rKh5pyJ6aOO
6Zmp55qE77yabG9ja2RlcA0KPiA+ID4gPiArICDkvJrmo4DmtYvliLDov5nkuIDngrnvvIzlubbl
sIboh6rlt7HlhbPpl63jgILljbPplIHpqozor4Hlmajku43nhLblj6/pnaDjgILlupTor6XkuI3k
vJrlm6DkuLppcnEtdHJhY2luZ+eahOmUmQ0KPiA+ID4gPiArICDor6/ogIzltKnmuoPjgIIo6Zmk
6Z2e6YCa6L+H5L+u5pS55LiN6K+l5L+u5pS555qE5p2h5Lu25p2l5pu05pS55rGH57yW5oiW5a+E
5a2Y5Zmo6ICM56C05Z2P5YW25LuW5Luj56CBKQ0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjI3LjAN
Cj4gPiA+DQo+DQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ghDQoNCllhbnRlbmcNCg==
