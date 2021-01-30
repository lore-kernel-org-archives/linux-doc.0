Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9290C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 08:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1E7A64E26
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 08:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhA3I61 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 03:58:27 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:60628 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhA3FXf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jan 2021 00:23:35 -0500
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10U5Luqb015268
        for <linux-doc@vger.kernel.org>; Sat, 30 Jan 2021 14:21:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10U5Luqb015268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611984117;
        bh=UdMLDJAGaZpk8dCMmfVlvbmUIM62bF76xnRx7WCunCM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0jNgVnZO27BmM3bNHmbY0jsIFz6VhFZ+6WCRtaMpzuaHcdChwLUcwxOGSiCM71ghv
         4R1dkCIap8bM69ARNshUierrUIjsMGg79qw7wmWQOLpkqNFsg3ys8I4RCBf70rxZPO
         E7drJTaAg/TGIZQAZw8qtB21y7QyDAZNjApO3wgDPZBi8ai/wOrFAUNRaWBmxGCFXO
         zieAUof3M+91bQdgnvQOUfmADgKjYyscJoAsMDjIzlcMKuZSb9Ij7vax6+12Ct1/Pu
         BXzcUCfZ0RxLPN35TfGJagDFI+y4DiJTCXPhVzB6skemIRHW44QKi4rEMD0vRxmWio
         N346loykQ4IhQ==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id e9so7461586pjj.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Jan 2021 21:21:56 -0800 (PST)
X-Gm-Message-State: AOAM533LP/8nuA21R7h00qcEgwPU2iMYJwrZ3OSc2xgGytkIyGSvhMzO
        5N10c6klLjglClY6g4BUwSjPUg/JLRyXT1A7Spg=
X-Google-Smtp-Source: ABdhPJyZ/ZdP3qShk81jxNb3rEcIHysbunje9rrxa/krFWZnT/Vw8PkxADP3ZbGk2o+uT6AKKbHcF+GPF7kRxa4w5pA=
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr7795605pjh.198.1611984115931;
 Fri, 29 Jan 2021 21:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20210130022337.11175-1-nicboul@gmail.com>
In-Reply-To: <20210130022337.11175-1-nicboul@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 30 Jan 2021 14:21:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQQZqbsnByXkLFWhxJ6HP6QOozxTQsLuamavi57YrAuZA@mail.gmail.com>
Message-ID: <CAK7LNAQQZqbsnByXkLFWhxJ6HP6QOozxTQsLuamavi57YrAuZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix typo in Documentation/kbuild/modules.rst
To:     Nicolas Bouliane <nicboul@gmail.com>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 30, 2021 at 11:25 AM Nicolas Bouliane <nicboul@gmail.com> wrote:
>
> Signed-off-by: Nicolas Bouliane <nicboul@gmail.com>



The code is correct.
'$$' is escaped '$', not a typo.

NACK.




> ---
>  Documentation/kbuild/modules.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index a1f3eb7a43e2..44a18bccdd5a 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -205,7 +205,7 @@ module 8123.ko, which is built from the following files::
>                 KDIR ?= /lib/modules/`uname -r`/build
>
>                 default:
> -                       $(MAKE) -C $(KDIR) M=$$PWD
> +                       $(MAKE) -C $(KDIR) M=$PWD
>
>                 # Module specific targets
>                 genbin:
> @@ -239,7 +239,7 @@ module 8123.ko, which is built from the following files::
>                 KDIR ?= /lib/modules/`uname -r`/build
>
>                 default:
> -                       $(MAKE) -C $(KDIR) M=$$PWD
> +                       $(MAKE) -C $(KDIR) M=$PWD
>
>                 # Module specific targets
>                 genbin:
> @@ -268,7 +268,7 @@ module 8123.ko, which is built from the following files::
>                 KDIR ?= /lib/modules/`uname -r`/build
>
>                 default:
> -                       $(MAKE) -C $(KDIR) M=$$PWD
> +                       $(MAKE) -C $(KDIR) M=$PWD
>
>                 # Module specific targets
>                 genbin:
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
