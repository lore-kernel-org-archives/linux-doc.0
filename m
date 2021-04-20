Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E53DC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 22:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCE63613FF
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 22:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbhDTWEH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 18:04:07 -0400
Received: from ms.lwn.net ([45.79.88.28]:58656 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233769AbhDTWEH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Apr 2021 18:04:07 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7B4AD491;
        Tue, 20 Apr 2021 22:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B4AD491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618956215; bh=ABw3ALTNPVggwGPq0MEaa26ItHebn2QbITf6fu7eXbs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Knc4OZv84HbTVl34xP0s0qgbkKZM5uyp+Ox5nNQl8U3S8SdjGBUc+XRWpEBZLadcK
         RycoGAQVOKbv0h4LUPbfIdVVhCnYqSJ4HluU2Ul/9Iav9Xp3p5Xk36s2vA2hyzB2Au
         28Ie1f4YecJcxhzzx5BeDZP9O4Ab+f4mG5cs2xH5Zr8vOngTGA+1u9AfVvXT0fTGu6
         iLhFRXtWi6J88Ek8OO8iBmPRscPBVAilMGS7oLR2a8zbeTW7lCsTqdrIisNNOCfylO
         Q7dLr5xvruuaT/RfsH6EH2pnYjtJdU3+JPXLG0AMUxGn6U+Lq1RUqcPE/Tkbu21k5x
         dc2Phqwna7Deg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
Subject: Re: [PATCH 0/3] add three core api docs
In-Reply-To: <cover.1618836460.git.siyanteng@loongson.cn>
References: <cover.1618836460.git.siyanteng@loongson.cn>
Date:   Tue, 20 Apr 2021 16:03:34 -0600
Message-ID: <87pmyoipft.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This patch add three core api docs.
>
>
> Yanteng Si (3):
>   docs/zh_CN: add core-api kernel-api.rst translation
>   docs/zh_CN: add core-api printk-basics.rst translation
>   docs/zh_CN: add core-api printk-formats.rst translation
>
>  .../zh_CN/core-api/kernel-api.rst             | 433 +++++++++++++
>  .../zh_CN/core-api/printk-basics.rst          | 118 ++++
>  .../zh_CN/core-api/printk-formats.rst         | 577 ++++++++++++++++++
>  3 files changed, 1128 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/printk-basics.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/printk-formats.rst

Please, don't forget to add these files to index.rst.  This suggests to
me that you haven't tried a docs build; please always do that too.

Thanks,

jon
