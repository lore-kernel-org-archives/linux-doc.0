Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E628C49EA5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 01:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53F6F613A9
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 01:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFXBuP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 21:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFXBuP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 21:50:15 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4A2C061574
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 18:47:57 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c5so3819129pfv.8
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 18:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FcCJRm9dfgIUQATf95x0mzu1dvNPFyKmMsQ6XZUwX5g=;
        b=gtX5vlHdZnBpo2rd+E5gYie5KTPy37zAPe1E2Svvb6tQyDdU9yCr2xi1xQ0DEYMQZA
         dD4iMG358oQI8Bxoh5OtaXcNaxSWU+iglhs1+p8bn5oVNgOvoQ++cepGFrB4HpKyluic
         NXmTGS7Qpk7D0NthyiIuzqhxONCJgMOkt6h+xir+LqCh6Ds/54IjtXceRj4g7qgqh0fn
         VUoeNtLj30Cn3ehdzj+U3U5511qV8x2SF5915HxopCiLvc8zXMHCPz6FI31e1/jpcqyM
         J4fC73E33PZ2cL9AiCxavRPQOXpO0Bfuylby7KNqFl/R3CxdegV3PUYgjlXeptKmdlyU
         cbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FcCJRm9dfgIUQATf95x0mzu1dvNPFyKmMsQ6XZUwX5g=;
        b=rlo89k0QyEdSMjpCfSO3c2sCigR9xwDvV2P2CHn8y/lQQYhV+s/O8T+pDcv+jYJI98
         G6+npz1VBzvwB6pmPIEW4OcG2nygXb1Vsy0VkSEVaTz1o0dhLzqdUc25W0WBY3+8rr3u
         g6mmX26cZjHFHvtFIX3dHncJpCBtnHuhsY2PM83G1T0QvhZx+vwhevWVW4o6KOkbp+PS
         rEZI4JwgDiBKReUBVI7FGXmCqhXSAGZTAT+1IDa8RQn/Bv633+mY3XanugpCb5AY181Y
         DVte0D7dAC+N6GQ6t57DFumnshxcC8wMX5EAkJjxetIbSWY+yOz1j+Gf2hmyA+yBAoqi
         /q/Q==
X-Gm-Message-State: AOAM531TrZ1ZxcxmGLXjDCI6BEsPaYWAcRk9jgSZt5yZ//jDEZ8LGg2p
        2/X5ExZLFJ6ptreHYeWiRmNVvLAvDxL3LqbAfug=
X-Google-Smtp-Source: ABdhPJzTCbUIWMw+miY/oYWl1N9ZS16Glg0kIFjXM7NbflECeMoEk/ynfgL7XKHa4ApEipR44YV8/kLJp9b9SEbHfBs=
X-Received: by 2002:a05:6a00:16d2:b029:300:200b:6572 with SMTP id
 l18-20020a056a0016d2b0290300200b6572mr2581375pfc.62.1624499276860; Wed, 23
 Jun 2021 18:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624434673.git.bobwxc@email.cn> <CAMU9jJq1CRX-yi91z2v2ExfBtkW=QrPoTEm7wRQLHoq1_jGt5A@mail.gmail.com>
In-Reply-To: <CAMU9jJq1CRX-yi91z2v2ExfBtkW=QrPoTEm7wRQLHoq1_jGt5A@mail.gmail.com>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 24 Jun 2021 09:47:47 +0800
Message-ID: <CAMU9jJq247M5wOp+YqkfHWZLcco6pZ-R5+1-4ZaTaa=c1ziHSw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs/zh_CN: Add two new translations in zh_CN/admin-guide
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

teng sterling <sterlingteng@gmail.com> =E4=BA=8E2021=E5=B9=B46=E6=9C=8824=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=889:35=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
Sorry, I may have signed in the wrong place.~>_<~

Thanks,

Yanteng
