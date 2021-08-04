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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EFBC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:44:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 428C4608FC
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 06:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235070AbhHDGpK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 02:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235030AbhHDGpK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 02:45:10 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD40C0613D5
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 23:44:58 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id u10so1783216oiw.4
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 23:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cpCintpTuaVWdTzRL812yokzlSzJYG768q7+LGmDNXE=;
        b=LwiwSVCnSgZONOBetESacS2XTA6TG4jnv37eCpogpT984K3oLA3BGdRI0YpVb+3lT2
         QkO06EPYOMYm98Gbh5M/4q/lAEhiAchhejiC2JVafz6Qu0jGlkiQAEhnc7Jv7On75huY
         c9uJiL2UL/sN0YQFZJ5QGfVdxYuZ2Gd2Lgk/YujHDllkohBwZGFbiXpZJPHIRiU7wbqB
         RGB20d3TYeeK10tL43wyQ4aFmkcsrGwrYLQ6UCaKynpTubuUzqrYPdlTudXPZRyAk2/+
         ZG+y+3cjB7aebdLVkxCQSmn8OZpFs9t/EY3ql65aW0ZFc4hVMHIjnNS6kTUcc4RGeAmQ
         qtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cpCintpTuaVWdTzRL812yokzlSzJYG768q7+LGmDNXE=;
        b=eVoUIU/uCAvrmSqNwRLMoDZ4tQ9tzH/4oGF+uZHGibeugciIpjWI3kKXyVDg+GUBAA
         sk8lxZ0DwJpP8daHTy62oBhppobOLWZRGGBMRxxPXw1X1ks7jhkjNjsDkPD0AbJOGYuI
         u1iIYdztSsZ8C2LEB5xmJVqfSPdGcjBl+K2MQ9Di0PXTj7zhh2kD1arRW2ZR7Aq3DI80
         /+pwR/Cvv08ksr4u/aol91rggGFH5CKAqiWd2n6o8QxbDLLf/5pKbUm53s8oTxMQv/MI
         xCU3SFKKCDiXp/RHUfPvXR8U3vSzinlQIRYqvdSXh0MLXjhWS1uRb4bWjKOn8v038tp6
         Y44Q==
X-Gm-Message-State: AOAM531alJH+SB543Pio2O2a4C6OYfqsH82WDMhGPwW9vFNZv4YRF8sF
        qKd8OAAUNn4uG4Cg7JmBq26lllH663Z0wlq5jCQ=
X-Google-Smtp-Source: ABdhPJwgu6ywyaIJHntayHuYF+0qUKtsxrAMxKCgpkkDIQl3sTIW9KTpxIbBYTyxYA08/AeAJszTl9/XXkpzthAeSFI=
X-Received: by 2002:a05:6808:209d:: with SMTP id s29mr17009912oiw.103.1628059497681;
 Tue, 03 Aug 2021 23:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <32f06dd4d9fdd412d48d4fe0b09c6ea9da75380e.1627823347.git.siyanteng@loongson.cn>
 <CAJy-Am=h5TcH9kJgsChheRruwCBoeKi6dnPFNsHM4+hYUpmbjg@mail.gmail.com>
In-Reply-To: <CAJy-Am=h5TcH9kJgsChheRruwCBoeKi6dnPFNsHM4+hYUpmbjg@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 4 Aug 2021 14:44:48 +0800
Message-ID: <CAEensMxnOzwiyx+odwsrSr=5=ohyUzniJCT=RHd915uRSfWF_Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] docs/zh_CN: add virt acrn introduction translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn,
        =?UTF-8?B?6ZmI6aOe5oms?= <chris.chenfeiyang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIx5bm0OOaciDTml6XlkajkuIkg5LiK
5Y2IMTE6MDLlhpnpgZPvvJoNCj4NCj4gT24gU3VuLCBBdWcgMSwgMjAyMSBhdCA5OjMyIFBNIFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3JvdGU6DQo+ID4NCj4gPiBUcmFuc2xh
dGUgRG9jdW1lbnRhdGlvbi92aXJ0L2Fjcm4vaW50cm9kdWN0aW9uLnJzdCBpbnRvIENoaW5lc2Uu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24u
Y24+DQo+ID4gLS0tDQo+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9hY3JuL2luZGV4
LnJzdCAgICB8ICA0ICstDQo+ID4gIC4uLi96aF9DTi92aXJ0L2Fjcm4vaW50cm9kdWN0aW9uLnJz
dCAgICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92aXJ0L2Fjcm4vaW50cm9kdWN0aW9u
LnJzdA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZpcnQvYWNybi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti92aXJ0L2Fjcm4vaW5kZXgucnN0DQo+ID4gaW5kZXggNjA2MWU3OTBlZTgzLi5iOGY1MDIwMzM0
NTUgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmly
dC9hY3JuL2luZGV4LnJzdA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZpcnQvYWNybi9pbmRleC5yc3QNCj4gPiBAQCAtMjAsOCArMjAsMTAgQEAgQUNSTui2hee6
p+euoeeQhuWZqA0KPiA+ICAuLiB0b2N0cmVlOjoNCj4gPiAgICAgOm1heGRlcHRoOiAxDQo+ID4N
Cj4gPiArICAgaW50cm9kdWN0aW9uDQo+ID4gKw0KPiA+ICBUT0RPTElTVDoNCj4gPg0KPiA+IC0g
ICBpbnRyb2R1Y3Rpb24NCj4gPiArDQo+ID4gICAgIGlvLXJlcXVlc3QNCj4gPiAgICAgY3B1aWQN
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9h
Y3JuL2ludHJvZHVjdGlvbi5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92
aXJ0L2Fjcm4vaW50cm9kdWN0aW9uLnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5iMzEwMzRiY2ZhNGUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdmlydC9hY3JuL2ludHJvZHVj
dGlvbi5yc3QNCj4gPiBAQCAtMCwwICsxLDUyIEBADQo+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wDQo+ID4gKy4uIGluY2x1ZGU6OiAuLi8uLi9kaXNjbGFpbWVyLXpoX0NO
LnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZpcnQvYWNybi9pbnRy
b2R1Y3Rpb24ucnN0DQo+ID4gKw0KPiA+ICs657+76K+ROg0KPiA+ICsNCj4gPiArIOWPuOW7tuiF
viBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gKw0KPiA+ICs65qCh6K+R
Og0KPiA+ICsNCj4gPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4g
PiArDQo+ID4gKy4uIF9jbl92aXJ0X2Fjcm5faW50cm9kdWN0aW9uOg0KPiA+ICsNCj4gPiArQUNS
Tui2hee6p+euoeeQhuWZqOS7i+e7jQ0KPiA+ICs9PT09PT09PT09PT09PT09PT0NCj4gPiArDQo+
ID4gK0FDUk7otoXnuqfnrqHnkIblmajmmK/kuIDkuKrnrKzkuIDnsbvotoXnuqfnrqHnkIblmajv
vIznm7TmjqXlnKjoo7jmnLrnoazku7bkuIrov5DooYzjgILlroPmnInkuIDkuKrnibnmnYPnrqHn
kIbomZrmi5/mnLrvvIznp7DkuLrmnI0NCj4gPiAr5Yqh6Jma5ouf5py677yM55So5LqO566h55CG
55So5oi36Jma5ouf5py65ZKM6L+b6KGMSS9P5Lu/55yf44CCDQo+ID4gKw0KPiA+ICtBQ1JO55So
5oi356m66Ze05piv5LiA5Liq6L+Q6KGM5Zyo5pyN5Yqh6Jma5ouf5py65Lit55qE5bqU55So56iL
5bqP77yM5a6D5qC55o2u5ZG95Luk6KGM6YWN572u5Li655So5oi36Jma5ouf5py65Lu/55yf6K6+
5aSH44CCDQo+ID4gK0FDUk7nrqHnkIbnqIvluo/mnI3liqHmqKHlnZfvvIhIU03vvInmmK/mnI3l
iqHomZrmi5/mnLrkuK3nmoTkuIDkuKrlhoXmoLjmqKHlnZfvvIzkuLpBQ1JO55So5oi356m66Ze0
5o+Q5L6b566h55CG56iL5bqP5pyNDQo+ID4gK+WKoeOAgg0KPiA+ICsNCj4gPiAr5LiL5Zu+5bGV
56S65LqG6K+l5p625p6E44CCDQo+ID4gKw0KPiA+ICs6Og0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgICAgIOacjeWKoeerr1ZNICAgICAgICAgICAgICAgICAgICAgIOeUqOaIt+err1ZNDQo+ID4g
KyAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKyAgfCAgKy0tLS0tLS0tLS0tLS0t
LS0tLSsNCj4gPiArICAgICAgfCAgICAgICAgKy0tLS0tLS0tLS0tLS0tKyAgICB8ICB8ICB8ICAg
ICAgICAgICAgICAgICAgfA0KPiA+ICsgICAgICB8ICAgICAgICB8QUNSTueUqOaIt+epuumXtCAg
fCAgICB8ICB8ICB8ICAgICAgICAgICAgICAgICAgfA0KPiA+ICsgICAgICB8ICAgICAgICArLS0t
LS0tLS0tLS0tLS0rICAgIHwgIHwgIHwgICAgICAgICAgICAgICAgICB8DQo+ID4gKyAgICAgIHwt
LS0tLS0tLS0tLS0tLS0tLWlvY3RsLS0tLS0tfCAgfCAgfCAgICAgICAgICAgICAgICAgIHwgICAu
Li4NCj4gPiArICAgICAgfOWGheaguOepuumXtCAgICAgICArLS0tLS0tLS0tLSsgfCAgfCAgfCAg
ICAgICAgICAgICAgICAgIHwNCj4gPiArICAgICAgfCAgICAgICAgICAgICAgIHwgICBIU00gICAg
fCB8ICB8ICB8IOmpseWKqCAgICAgICAgICAgICB8DQo+ID4gKyAgICAgIHwgICAgICAgICAgICAg
ICArLS0tLS0tLS0tLSsgfCAgfCAgfCAgICAgICAgICAgICAgICAgIHwNCj4gPiArICAgICAgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tfC0tLS0tLS0rICB8ICArLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+
ICsgICstLS0tLS0tLS0tLS0tLS0tLS0tLS1oeXBlcmNhbGwtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ICsgIHwgICAgICAgICAgICAgICAgICAgICAgICAgQUNS
Tui2hee6p+euoeeQhuWZqCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ID4gKyAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rDQo+ID4gKyAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg56Gs5Lu2
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiArICArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSsNCj4gPiArDQo+ID4gK0FDUk7nlKjmiLfnqbrpl7TkuLrnlKjmiLfomZrmi5/mnLrl
iIbphY3lhoXlrZjvvIzphY3nva7lkozliJ3lp4vljJbnlKjmiLfomZrmi5/mnLrkvb/nlKjnmoTo
rr7lpIfvvIzliqDovb3omZrmi5/lvJXlr7znqIvluo/vvIwNCj4gPiAr5Yid5aeL5YyW6Jma5ouf
Q1BV54q25oCB77yM5aSE55CG5p2l6Ieq55So5oi36Jma5ouf5py655qESS9P6K+35rGC6K6/6Zeu
44CC5a6D5L2/55SoaW9jdGxz5p2l5LiOSFNN6YCa5L+h44CCSFNN6YCa6L+HDQo+ID4gK+S4jkFD
Uk7otoXnuqfnrqHnkIblmajnmoRoeXBlcmNhbGxz6L+b6KGM5Lqk5LqS5p2l5a6e546w566h55CG
5pyN5Yqh44CCSFNN5ZCR55So5oi356m66Ze06L6T5Ye65LiA5LiqY2hhcuiuvuWkh+aOpeWPow0K
PiA+ICvvvIgvZGV2L2Fjcm5faHNt77yJ44CCDQo+ID4gKw0KPiA+ICtBQ1JO6LaF57qn566h55CG
5Zmo5piv5byA5rqQ55qE77yM5Lu75L2V5Lq66YO95Y+v5Lul6LSh54yu44CC5rqQ56CB5bqT5Y+v
5ZyoDQo+DQo+IHJlbW92ZSAn5Y+v4oCYID8gd2l0aCB0aGlzDQo+DQo+IFJldmlld2VkLWJ5OiBB
bGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4NCk9LIQ0KDQpUaGFua3MsDQoNCllhbnRlbmcN
Cg==
