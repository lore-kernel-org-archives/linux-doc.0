Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BF4C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 09:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiI3JNv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 05:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbiI3JNt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 05:13:49 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB77E15264B
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 02:13:48 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id j24so4142183lja.4
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 02:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=tATPWI+YvdlyRPh34ivWOX6mWW1Ax9MaFCGvcqesNfk=;
        b=dj/1k0IXssRSrkRo6k059S1KVq7obUUDb52BjhTprKk3IEn3HMLA8u0L0daJjvo8d2
         a86SKxOTlmXIYHildyX9H84kJl8C9o5K87IPztX4tnjVdDa3uNr6aYoYp/DqX3vJRX8Q
         mEX7VdTGLQPUZeifg1upKlBcr6SSe2T2m86Vd/HIHl7dUsLt83IOuVDtgEulbTl/s6sn
         0dEjyFrwvIm/NW67Isx/V/W8Zprw0d2/b4oEFo3PMaJnym5uPWFyiwPlrCdeBZsZX1ui
         b5xs/7mVOitFaOy9lCgCRHAktNkBtf5JtkAkVVtOzAY5nuvzaPiVsZ0zj0cEIakSKhos
         xrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tATPWI+YvdlyRPh34ivWOX6mWW1Ax9MaFCGvcqesNfk=;
        b=cVb+i5jgE4WipjG77kHwwzCHsOt+v8Ua2dQavE6NS/jaZqTALU/5UvwVb7PvKEAk/8
         V/eup6bZeO3rmIYqUuDjSuLQRn9zbGUD+jFRvFd91UhtU/YdtmSra8aHyktfIGS9WKgu
         OFvQ8hPJuUzwKqq5Hu7q+Qa6d+kYQDmS9hf2xf9gdqm96mlNd77wRr0sf8SxwEy39zVu
         UKfbw7cnE556qTJk1g9GmalFKmOB8cHVjKecopylk+FBa46B5h+jrRPUkjVUDPNX8zIR
         xFTBHChd1a1lE6BgJRbu1eUhNQZhPaB5Pt+WmOBX0w43bV917UQ/8eE1e7Iafkn4eP1W
         le9g==
X-Gm-Message-State: ACrzQf0oayqK46joBJ1XGw7UAHx+VcuT593xVluHFTf1iMc4EOVVoWQB
        16Mu2+1uQUjfuJVbatyYZRkVmaqMFMuLmmZihIUvUInMHtXZTzm6
X-Google-Smtp-Source: AMsMyM7NGo8AMmKLyNZCZDUVRBFBHlPIcANssXIz+OJjKwCDHrPmoTzIRK+Vk4zSyROzIE7a7lds7ouQ3VGu4mQqMDo=
X-Received: by 2002:a2e:b004:0:b0:26b:3f4f:69a0 with SMTP id
 y4-20020a2eb004000000b0026b3f4f69a0mr2677277ljk.203.1664529226979; Fri, 30
 Sep 2022 02:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664360331.git.siyanteng@loongson.cn> <60017007349357dc1fd8fa849a5ddb5672f8ab5b.1664360331.git.siyanteng@loongson.cn>
In-Reply-To: <60017007349357dc1fd8fa849a5ddb5672f8ab5b.1664360331.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 30 Sep 2022 17:13:10 +0800
Message-ID: <CAJy-AmkEvHOBRgiBnQKZ+igFr9CLpbX4QWBMpH4MBeuEpEVeVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] docs/zh_CN: Update the translation of ksm to 6.0-rc7
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpPbiBXZWQsIFNlcCAy
OCwgMjAyMiBhdCA2OjMyIFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4gd3Jv
dGU6DQo+DQo+IFVwZGF0ZSB0byBjb21taXQgYmM2YTI4MjhhOTYzICgia3NtOiBhZGQgdGhlIGtz
bSBwcmVmaXgNCj4gdG8gdGhlIG5hbWVzIG9mIHRoZSBrc20gcHJpdmF0ZSBzdHJ1Y3R1cmVzIikN
Cj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0K
PiAtLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21tL2tzbS5yc3QgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL21tL2tzbS5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9tbS9rc20ucnN0DQo+IGluZGV4
IGQxZjgyZTg1N2FkNy4uZjBmNDU4NzUzZDBjIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9tbS9rc20ucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJh
bnNsYXRpb25zL3poX0NOL21tL2tzbS5yc3QNCj4gQEAgLTMwLDcgKzMwLDcgQEAgS1NN55qE55So
5oi356m66Ze055qE5o6l5Y+j5ZyoRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRt
aW4tZ3VpZGUvbW0va3MNCj4gIEtTTee7tOaKpOedgOeos+WumuagkeS4reeahEtTTemhteeahOmA
huaYoOWwhOS/oeaBr+OAgg0KPg0KPiAg5b2TS1NN6aG16Z2i55qE5YWx5Lqr5pWw5bCP5LqOIGBg
bWF4X3BhZ2Vfc2hhcmluZ2BgIOeahOiZmuaLn+WGheWtmOWMuuWfnyhWTUFzKeaXtu+8jOWImeS7
o+ihqOS6hg0KPiAtS1NN6aG155qE56iz5a6a5qCR5YW25Lit55qE6IqC54K55oyH5ZCR5LqG5LiA
5Liqcm1hcF9pdGVt57uT5p6E5L2T57G75Z6L55qE5YiX6KGo44CC5ZCM5pe277yM6L+Z5LiqS1NN
6aG1DQo+ICtLU03pobXnmoTnqLPlrprmoJHlhbbkuK3nmoToioLngrnmjIflkJHkuobkuIDkuKpr
c21fcm1hcF9pdGVt57uT5p6E5L2T57G75Z6L55qE5YiX6KGo44CC5ZCM5pe277yM6L+Z5LiqS1NN
6aG1DQo+ICDnmoQgYGBwYWdlLT5tYXBwaW5nYGAg5oyH5ZCR5LqG6K+l56iz5a6a5qCR6IqC54K5
44CCDQo+DQo+ICDlpoLmnpzlhbHkuqvmlbDotoXov4fkuobpmIjlgLzvvIxLU03lsIbnu5nnqLPl
rprmoJHmt7vliqDnrKzkuozkuKrnu7TluqbjgILnqLPlrprmoJHlsLHlj5jmiJDpk77mjqXkuIDk
uKrmiJblpJoNCj4gLS0NCj4gMi4zMS4xDQo+DQo=
