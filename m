Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980BCC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 12:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD5B22AB9
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 12:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbhAGMXX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Jan 2021 07:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbhAGMXX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jan 2021 07:23:23 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA49C0612F5
        for <linux-doc@vger.kernel.org>; Thu,  7 Jan 2021 04:22:42 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id n142so5260133qkn.2
        for <linux-doc@vger.kernel.org>; Thu, 07 Jan 2021 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iQCFF7Idhr2G6w+CkYDajOHCzBRjDPguD8Lo9f+cp5M=;
        b=NpCvkun1lBkXWaCrTZf3MToAiiG2shditRsGPRoFbliJfZ7ecrSCF9GFqRLZQVVoy5
         cEfElKZz5VJubz9uoii1lXN7JObXOLdFq4vMquCTLzgqDlBu9eTE4movume05j7McrIi
         O8OUbfvw4Ee/LnQEc2ixYDJN2dY2RaAsd8kx257nM63pSINhotjNZiJKKReirkSiQSJ9
         5Kf1tBEUVSZYkeNi6T0gQUA1AdImNc+jLe9+POiQfveyJP9qnKuzK+2nFgj3u655+c0K
         SS6iOS1dv3yXjNB65ouMN4L3PZ4UpWFsCByaQ96QcTKe3ahOZUMjCv/knddgmAUwcWIe
         eBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iQCFF7Idhr2G6w+CkYDajOHCzBRjDPguD8Lo9f+cp5M=;
        b=NcZMTkpPGeiC9qDAoBZssLkvHn83p+KyO1AKsPZ3QMvuYTSRR2s0m5VdvPSbVfmiVi
         s1qJUkYDlvzg0+EzbDArLa1IvghI0wZSBhAmBJuzHLu4BNwI7BPmerdnjHuIKU7D8uM9
         5be6eNvVemNGao+dErhNbOqFXOSRYb011TWK0N/3rxM2NnQ8RGusvhvjRVbxTsjzMS1X
         3G9xqNiEd4Lhl9A7r3j36UPtlUHNdC16hFlTqW91BTSJDt5lRxu1fidjzqrqn3wrQUHd
         FiGr/dH7wbjp06fjkMq3K5lC34pjfLkAdymS/ldKJXN05nArD8/XdrjbKqVMyzb9EF8o
         XsFQ==
X-Gm-Message-State: AOAM530ywNFyoQXGg2dYAgl41PPg3pX/x7SKjnHqAT2pmxJBmSi9NRef
        lW7cYT5cR4MQ3R2GE/L9cOHfslrqnjSiKEXMJCbLt6uJ3Y8YI55j
X-Google-Smtp-Source: ABdhPJzIlSbVbqyfQ4v6aRX0X4DVCmR0dDJMgjdScgkcSOrGiyo0awN9NSyL6wyvwi9EQf9v4PW+UFLst2bOewvEmNM=
X-Received: by 2002:ae9:c013:: with SMTP id u19mr8710243qkk.59.1610022162077;
 Thu, 07 Jan 2021 04:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20210107022337.1791010-1-siyanteng@loongson.cn>
 <20210107022337.1791010-2-siyanteng@loongson.cn> <45db18b6-f471-4f9d-5ffe-9ab7ee45469e@linux.alibaba.com>
In-Reply-To: <45db18b6-f471-4f9d-5ffe-9ab7ee45469e@linux.alibaba.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 7 Jan 2021 20:22:30 +0800
Message-ID: <CAMU9jJo0WfWjraMJ4o1Mp8Tqh16HCEopv=CQbd0ewJG89SQgCg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs/zh_CN: add Chinese booting file
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VGhhbmsgeW91IHZlcnkgbXVjaCwgeW91IHdpbGwgc2VlIGl0IGluIHRoZSBQQVRDSCB2My4NCg0K
VGhhbmtzDQpZYW50ZW5nIFNpDQoNCg0KQWxleCBTaGkgPGFsZXguc2hpQGxpbnV4LmFsaWJhYmEu
Y29tPiDkuo4yMDIx5bm0MeaciDfml6Xlkajlm5sg5LiK5Y2IMTE6MjflhpnpgZPvvJoNCj4NCj4N
Cj4NCj4g5ZyoIDIwMjEvMS83IOS4iuWNiDEwOjIzLCBZYW50ZW5nIFNpIOWGmemBkzoNCj4gPiBU
aGlzIGlzIHRoZSBDaGluZXNlIHZlcnNpb24gb2YgYm9vdGluZyBmaWxlDQo+DQo+DQo+IFVoLCBJ
IGd1ZXNzIG1vcmUgY2xlYXIgYW5kIGRldGFpbGVkIGNvbW1pdCBsb2cgYW5kIHN1YmplY3Qgd2ls
bCBoZWxwDQo+IHVzZXIgdW5kZXJzdGFuZCB5b3VyIGNoYW5nZXMuDQo+DQo+IGxpa2UgdGhpczoN
Cj4NCj4gc3ViamVjdDogZG9jL3poX0NOOiBhZGQgbWlwcyBib290aW5nLnJzdCB0cmFuc2xhdGlv
bg0KPg0KPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1lbnRhdGlvbi9taXBzL2Jvb3Rpbmcu
cnN0IGludG8gQ2hpbmVzZS4NCj4NCj4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcg
U2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0NCj4gPiAgLi4uL3RyYW5zbGF0aW9u
cy96aF9DTi9taXBzL2Jvb3RpbmcucnN0ICAgICAgIHwgMzEgKysrKysrKysrKysrKysrKysrKw0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vbWlwcy9ib290aW5nLnJzdA0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21p
cHMvYm9vdGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9taXBzL2Jv
b3RpbmcucnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjMwOTlkMGZmZjdhNg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9taXBzL2Jvb3RpbmcucnN0DQo+ID4gQEAgLTAsMCArMSwz
MSBAQA0KPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsNCj4g
PiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXItemhfQ04ucnN0DQo+ID4gKw0KPiA+ICs6T3Jp
Z2luYWw6IDpyZWY6YERvY3VtZW50YXRpb24vbWlwcy9ib290aW5nLnJzdCA8Ym9vdGluZz5gDQo+
ID4gKzpUcmFuc2xhdG9yOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4g
Kw0KPiA+ICsuLiBfY25fYm9vdGluZzoNCj4gPiArDQo+ID4gK0JNSVBT6K6+5aSH5qCR5byV5a+8
DQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsNCj4gPiArICDkuIDkuptib290
bG9hZGVyc+WPquaUr+aMgeWcqOWGheaguOmVnOWDj+W8gOWni+WcsOWdgOWkhOeahOWNleS4gOWF
peWPo+eCueOAguiAjOWFtuWugw0KPiA+ICsgIGJvb3Rsb2FkZXJz5bCG6Lez6L2s5YiwRUxG55qE
5byA5aeL5Zyw5Z2A5aSE44CC5Lik56eN5pa55qGI6YO95pSv5oyB55qE77yb5Zug5Li6DQo+ID4g
KyAgQ09ORklHX0JPT1RfUkFXPXkgYW5kIENPTkZJR19OT19FWENFUFRfRklMTD15LCDmiYDku6Xn
rKzkuIDmnaHmjIfku6QNCj4gPiArICDkvJrnq4vljbPot7PovazliLBrZXJuZWxfZW50cnkoKeWF
peWPo+WkhOaJp+ihjOOAgg0KPiA+ICsNCj4gPiArICDkuI5hcmNoL2FybeaDheWGtShiKeexu+S8
vO+8jGR05oSf55+l55qE5byV5a+85Yqg6L2956iL5bqP6ZyA6KaB6K6+572u5Lul5LiL5a+E5a2Y
5ZmoOg0KPiA+ICsNCj4gPiArICAgICAgICAgYTAgOiAwDQo+ID4gKw0KPiA+ICsgICAgICAgICBh
MSA6IDB4ZmZmZmZmZmYNCj4gPiArDQo+ID4gKyAgICAgICAgIGEyIDogUkFN5Lit5oyH5ZCR6K6+
5aSH5qCR5Z2X55qE54mp55CG5oyH6ZKIKOWcqGNoYXB0ZXJJSeS4reWumuS5iSnjgIINCj4gPiAr
ICAgICAgICAgICAgICDorr7lpIfmoJHlj6/ku6XkvY3kuo7liY01MTJNQueJqeeQhuWcsOWdgOep
uumXtCgweDAwMDAwMDAwIC0NCj4gPiArICAgICAgICAgICAgICAweDFmZmZmZmZmKeeahOS7u+S9
leS9jee9ru+8jOS7pTY05L2N6L6555WM5a+56b2Q44CCDQo+ID4gKw0KPiA+ICsgIOS8oOe7n2Jv
b3Rsb2FkZXJz5LiN5Lya5L2/55So6L+Z5qC355qE57qm5a6a77yM5bm25LiU5a6D5Lus5LiN5Lyg
5YWlRFTlnZfjgIINCj4gPiArICDlnKjov5nnp43mg4XlhrXkuIvvvIxMaW51eOWwhumAmui/h+mA
ieS4rUNPTkZJR19EVF8q5p+l5om+RFRC44CCDQo+ID4gKw0KPiA+ICsgIOS7peS4iue6puWumuWP
quWcqDMy5L2N57O757uf5Lit5a6a5LmJ77yM5Zug5Li655uu5YmN5rKh5pyJ5Lu75L2VNjTkvY3n
moRCTUlQU+WunueOsOOAgg0KPiA+DQo=
