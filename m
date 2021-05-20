Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2772C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 20:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B205C60FD9
	for <linux-doc@archiver.kernel.org>; Thu, 20 May 2021 20:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235368AbhETUVp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 May 2021 16:21:45 -0400
Received: from ms.lwn.net ([45.79.88.28]:60042 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235317AbhETUVp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 May 2021 16:21:45 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 271192F3;
        Thu, 20 May 2021 20:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 271192F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621542023; bh=kgtpDPwwAgc5mSkoLXj/9v1MZrxq+TjP7mbNBAtENck=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Cw3rB3CbgpTwriF/afg1uYrg2KFPsyDLt/SLOaptGwARzq9yYJp+mEWOJFhLa5Kjn
         pveD6PChSBYjYTPZSkFNV+6+kBpZV8rFLXmKfv1F27r6TLFWkoOwsCbJwlBFCIotVG
         l8wJWaFhRkyp4Efb2LjE/Dh7WgU2n6VO01k877ZcGcO/OunakmewkJN0KSOZZ2HqJA
         yoDOgIeXg3svgXjZm4RFowzQZi7WUfGSeEIVc3MDHox0Aw5XTugt4cGmx0YBdPEzip
         YPZxysIR64O7hJ6MT+9xpgRlXM1EkUa3mVXV+xuCxtN5uXitPvgSnLLX4Ful9wnu/v
         bAmtZjDXwP1zw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH v4 0/3] docs/zh_CN: add parisc Chinese documents
In-Reply-To: <cover.1620805100.git.siyanteng@loongson.cn>
References: <cover.1620805100.git.siyanteng@loongson.cn>
Date:   Thu, 20 May 2021 14:20:22 -0600
Message-ID: <87bl95nomx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v3 -> v4:
>
> fix detailed description of the contents of the patch 1/3 and 2/3.
>
> diff:
>
> -This ptch translates Documentation/parisc/index.rst into Chinese.
> +This patch translates Documentation/parisc/index.rst into Chinese.
>
> -This translates Documentation/parisc/debugging.rst into Chinese.
> +This patch translates Documentation/parisc/debugging.rst into Chinese.
>
> v2 -> v3
>
> * Pick Xiangcheng Wu's review-by tag for [patch 2-3/3]
>
> v1 -> v2:
>
> * Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review.
>     https://lore.kernel.org/linux-doc/cover.1619665430.git.siyanteng@loongson.cn/T/#t
>
> * Update [PATCH 1/3].
>     Because zh_CN/inxdex.rst has been refactored by Xiangcheng Wu.
>
> * Pick Xiangcheng Wu's review-by tag for [patch 1/3]
>
> v1:
>
> * This set translates Documentation/parisc/* into Chinese.
>
> Yanteng Si (3):
>   docs/zh_CN: add parisc index translation
>   docs/zh_CN: add parisc debugging.rst translation
>   docs/zh_CN: add parisc registers.rst translation
>
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../translations/zh_CN/parisc/debugging.rst   |  42 +++++
>  .../translations/zh_CN/parisc/index.rst       |  28 ++++
>  .../translations/zh_CN/parisc/registers.rst   | 153 ++++++++++++++++++
>  4 files changed, 224 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst
>  create mode 100644 Documentation/translations/zh_CN/parisc/index.rst
>  create mode 100644 Documentation/translations/zh_CN/parisc/registers.rst

I've applied this set, thanks.

jon
