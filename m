Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B13DC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 19:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiFXTkr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 15:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiFXTkr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 15:40:47 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A327A82690
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 12:40:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3EC4C31A;
        Fri, 24 Jun 2022 19:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3EC4C31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1656099644; bh=xGkNjMQlA7twhq5ItZxmsqHZjYjJLUT0RoUDd04cRIg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VpXk9ZGCqht3iC4s8aVA0s92PbrkvL1fnZRi4DHfLWZoDi7P5jrbSzQCCqax20kiD
         /apzfese/GNmkwvNcAMUFM3MFwf+d5FSNDS3m78on++2fP6ojlKSMyLWoLoYWkFgDf
         4/NqnGcO7I318UsJvfqySdRNhJPfEICaMLC17dS0O54HtgJwZ2g0DmpEDw9ObaQL/B
         1+sKiLhvRnTIjP6pC0BgAGuSNpSx7xg+bZm2JhOIsGS60lMyC1Y1O32v8k1wYKGPGS
         puhUsZryArNGf9Tt3WeU6NhYKIlDuYHLlXCiKcPWADljDe10rLOoZO74hDER0vCY62
         jbuHf2MUddx/Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v4 0/2] add page_migration and vmalloced-kernel-stacks
 translation
In-Reply-To: <cover.1654585011.git.siyanteng@loongson.cn>
References: <cover.1654585011.git.siyanteng@loongson.cn>
Date:   Fri, 24 Jun 2022 13:40:43 -0600
Message-ID: <87y1xl3l50.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v4:
> Modify some words under Xiangcheng's advice:
> =C3=97true=C3=97 -> *true*
> =E8=99=9A=E6=8B=9F=E6=9C=BA  -> VM
>
> v3:
> Modify some words under Xiangcheng's advice.
>
> v2:
> Resolving conflicts on next-20220513.
>
> v1:
> Translate .../vm/page_migration.rst and .../vm/vmalloced-kernel-stacks.rs=
t into Chinese.
>
> Yanteng Si (2):
>   docs/zh_CN: add vm page_migration translation
>   docs/zh_CN: add vm vmalloced-kernel-stacks translation
>
>  Documentation/translations/zh_CN/vm/index.rst |   4 +-
>  .../translations/zh_CN/vm/page_migration.rst  | 228 ++++++++++++++++++
>  .../zh_CN/vm/vmalloced-kernel-stacks.rst      | 133 ++++++++++
>  3 files changed, 363 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/page_migration.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/vmalloced-kernel-=
stacks.rst
>
Series applied, thanks.

jon
