Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC27ECDFA1
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 08:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiJXIhk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 04:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiJXIhj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 04:37:39 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9961960503
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 01:37:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id o12so15532963lfq.9
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32Uw/ssHLVQC/Pd3D06p0g284CGb23INV/ZOvqGR1Mc=;
        b=pbu49AC55DlPeQFAxgu06kguycdJ4yXbtmwAW30bUPaxWdD0IrB7nV0fZsdArS3OCo
         IyMrp5rj35AwWH+Af8AbzqfHnA+6yGfulUQRLiicdkd7/pHzfubsG90SbvZh5PQr0Kkk
         i2gV82oOSvSex9uY5wCPvRbIPjRrsCrTWI4ywspfpgJs/JYzFJUGtJOLG9a+NZbHLWzg
         npkH5ak/5crZ/YT4Db2rP7yDdS/7kdpJQlZezrmqxSkFeBeIQlTdKsOhJcgklRcVyifR
         vWj7cmqSPhox7g2kz0uS8lyY3fNSQREFThAQGWIjDQ1ABSYa0aXwU9tdR5sngkEqcVoR
         XsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32Uw/ssHLVQC/Pd3D06p0g284CGb23INV/ZOvqGR1Mc=;
        b=SkK1TJ3aE5xbHaaTXU6vh+9csTnd+MOfHLijRYsjIbPblyCYfkZ4EIw/Wut8sMCJLC
         yf/5/boU0FMe5pVr4DToaqxIUaKAm81SdGEN1qn8HNYwgC5/W+JOf+fK7m8pfEg6w8HQ
         xDBGSv+twvi1H26+Qq+WYOJHk0gAEdeoZ9/4feS404/l6OCswXZcW0AKZrJ8Rl0Sx2at
         8WUhdeFF2cc+4x+730B8bGo05v/KRmMgiGLG/xb2gbAdyBE8998v7UGyPkql3UUWoRgy
         vWlvS5JyoYb4Mm/T3EP2/N9tiVdl0wn9+i4o+ANlTc6PjYIFs79QoKrK3q4/MFfvQIMa
         WsVw==
X-Gm-Message-State: ACrzQf1aRRwzTlgW0esyR62rFjmxSY1gbHavUbfkceSyc09KhwPpVQWk
        5QKtW4nDzOI5wxspNv/7upMj/zStreqZOTcZkn8fJ45ROK0Qiw==
X-Google-Smtp-Source: AMsMyM7DMy/bPs21uHtnE47pMdHLgi7bMVCYWMOAGdZP7lUPVC1SaxZULPKn6ALVQNAMtz9rKCVCyfM750+6NT7Yz9s=
X-Received: by 2002:a05:6512:208a:b0:4a2:6cc7:cee5 with SMTP id
 t10-20020a056512208a00b004a26cc7cee5mr11717310lfr.153.1666600656838; Mon, 24
 Oct 2022 01:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666171735.git.zhoubinbin@loongson.cn> <bd81bd620eb6c64effd2d0d52831f39911fc1659.1666171735.git.zhoubinbin@loongson.cn>
 <CAJy-Amm-qK5NU=bourLGQ-A7G3ST1NDdu-KrK4eomZMdjNWYBw@mail.gmail.com> <64c6dc26-8dae-69c2-2c6d-c6ebaa170060@loongson.cn>
In-Reply-To: <64c6dc26-8dae-69c2-2c6d-c6ebaa170060@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 24 Oct 2022 16:37:00 +0800
Message-ID: <CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com>
Subject: Re: [PATCH RESEND V2 3/3] docs/zh_CN: core-api: Add errseq Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU2F0LCBPY3QgMjIsIDIwMjIgYXQgMTE6MDkgUE0gQmluYmluIFpob3UgPHpob3ViaW5iaW5A
bG9vbmdzb24uY24+IHdyb3RlOg0KDQoNCj4gPiBIb25zdGx5LCBJIGRvbid0IHVuZGVyc3RhbmQg
dGhlIG1lYW5pbmcgb2YgdGhpcyB3b3Jkcy4gOi8NCj4NCj4gQWNjb3JkaW5nIHRvIHRoZSBzcGVj
aWZpYyBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24sIHdoYXQgd2Ugd2FudA0KPiB0byB0
cmFjayBpcyB0aGUgZXJyb3IgYWZ0ZXIgdGhlIHNhbXBsaW5nIHBvaW50IGBgc2luY2VgYCAsIHNv
IHRoZQ0KPiBgYHNpbmNlYGAgdmFyaWFibGUgaXMgb25seSB1c2VkIGZvciBjb21wYXJpc29uIGFu
ZCB3aWxsIGJlIGRpc2NhcmRlZCBsYXRlci4NCj4NCj4gSG93IGFib3V077yaDQo+IOeUseS6juS7
luWPquaYr+WcqOmHh+agt+eCueWQjuS4ouW8gyBgYHNpbmNlYGAg5Y+Y6YeP77yM5omA5Lul5LiN
6ZyA6KaB5Zyo6L+Z6YeM5L+d5a2Y5pu05paw5a6D44CCDQo+DQoNCkdldCBpdC4gaWYgc28sIGNv
dWxkIHdlIGdpdmUgYSBiaXQgbW9yZSBpbmZv77yfIGxpa2U6DQrnlLHkuo7ku5blj6rmmK/lnKjp
h4fmoLfngrnlkI7kuKLlvIMgYGBzaW5jZWBgIOWPmOmHjyhzaW5jZSDml6LmmK/ph4fmoLfngrkp
77yM5omA5Lul5LiN6ZyA6KaB5Zyo6L+Z6YeM5L+d5a2Y5pu05paw5a6D44CCDQoNClRoYW5rcw0K
QWxleA0K
