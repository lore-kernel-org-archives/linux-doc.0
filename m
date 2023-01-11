Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9078C54EBE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Jan 2023 08:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjAKI7H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Jan 2023 03:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbjAKI6W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jan 2023 03:58:22 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFA710568
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 00:58:21 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id c6so16106668pls.4
        for <linux-doc@vger.kernel.org>; Wed, 11 Jan 2023 00:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOonr+NEoGFH/iq6NuEDMlmfm74QrHbTRChmi4DoBtc=;
        b=NCSinN9LoF6ekuT7B8kg6W5vhkW1Z9At1Panfwu2j2h89uld8a0ZNRScZNW3XDCK6g
         8r0f69G72KlAvosr7NDMl7WeW0dkClZUym9ucZsc3SIzu6VaLLTYkv+ogtWiLlTaqv03
         NnckoPbq7AOhOSjK0cw8k1PrUhEi+zxbmmp/xlzksvsqK6Giw0kDP+YXioX2gTfBemJr
         2mOUjeClySAXGbNEdliiqMD8jJkIuJVH/1q0X16wyp1OxEW1iXsT9nUD0djoWdN4o/+y
         Aludqoi2s310LCGHI2+vQjhZpttrs8LaEc3JS9jobu7z9pEAnwlbNYPcuM+pMn23XvIG
         YJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOonr+NEoGFH/iq6NuEDMlmfm74QrHbTRChmi4DoBtc=;
        b=LDTVb0wgX9POdlJK4kHWxkqCaaUYf0Miz+miJXHAlzJPMOL+MYMgMx/h+omPf43zEr
         p4gTrOtsYNXNxtvA2ZQbQgsPx8+q+CBCL/lV+Cy3E6EOwOrhgh+ZX1Ap3HhdZrxASL0Z
         9EID991U9rOuPKicjX6Sj9cMBHeftX5S6SzPlLrTbWNmXZa3dEYJkRhqPnupjxyiWUOm
         27YwAyhl/oCOa7rDmGXB3K6FZnjtKS9YPEN4KY4KZc6FO3/5KsOA2pD7s7ai7gj3Pt9J
         JZxVF3+eckoTVDsge+bRzjxVw/e+OpwCQu0GSwxZdPjlgvbTkqY5F23/W0zblmY4g2Ck
         AlfQ==
X-Gm-Message-State: AFqh2kqOwaJc2co50oCg2RwL7NqMtx/2M/9QyvTJ/+PSgRxlbZkgdNU7
        wiA7jETvVs/C8dx3eTgI8IVS7EJWE0gM5q9FwOo=
X-Google-Smtp-Source: AMrXdXu2wz/OQTyNfZDi1bigcdIpv8H9Dz2avO43GN/F94ZcxWnAHlge/t8jnOtuNpx2ey/9t1RkUtCLrVxu9P7zx+0=
X-Received: by 2002:a17:90a:5889:b0:225:bc87:5175 with SMTP id
 j9-20020a17090a588900b00225bc875175mr5751083pji.190.1673427501146; Wed, 11
 Jan 2023 00:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20230111083423.513461-1-siyanteng@loongson.cn>
In-Reply-To: <20230111083423.513461-1-siyanteng@loongson.cn>
From:   Yizhou Tang <tangyeechou@gmail.com>
Date:   Wed, 11 Jan 2023 16:58:09 +0800
Message-ID: <CAOB9oOY=_1X6ztx+TALbqUZvsHqujiK7QCpq9hTQSNXnWY2tRw@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Add a glossary of Chinese translation terms
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        me@lirui.org, siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

WWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPiDkuo4yMDIz5bm0MeaciDEx5pel5ZGo
5LiJIDE2OjM05YaZ6YGT77yaDQoNCj4gKyogUEVMVDog5a6e5L2T6LSf6L296Lef6Liq5py65Yi2
77yIUGVyLUVudGl0eSBMb2FkIFRyYWNraW5n77yJDQrlrp7kvZPotJ/ovb3ot5/ouKoNCg0KSU1I
TywgaG93IGFib3V0IHRoZSBmb2xsb3dpbmc6DQpmb3JrIC0g5Yib5bu6Pw0Kc2NoZWQgZG9tYWlu
IC0g6LCD5bqm5Z+fDQpOVU1BIC0g6Z2e57uf5LiA5YaF5a2Y6K6/6ZeuDQpIdWdlUGFnZSAtIOW3
qOmhtSAgKGhvd2V2ZXIsIEFsaWJhYmEgQ2xvdWQgTGludXggdHJhbnNsYXRlIHRoaXMgd29yZCBp
bnRvIOKAmOWkp+mhteKAmSkNCk9QUCAtIOaTjeS9nOaAp+iDveWAvA0KDQpUYW5nDQo=
