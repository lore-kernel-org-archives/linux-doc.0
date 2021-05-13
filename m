Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7054BC433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 16:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E846143F
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 16:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbhEMQWK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 12:22:10 -0400
Received: from ms.lwn.net ([45.79.88.28]:44234 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235054AbhEMQWH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 12:22:07 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 590F42E7;
        Thu, 13 May 2021 16:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 590F42E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620922856; bh=G9GoZMt8HvHe/+QCpF5q/VBN9vA5iMAUOnYtoQlC9OE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LPsybRzoliLDOgNb7gVD11xN7GbQDfALAUbgV/pbux4zWzItaiCmV+QXz3aE9YMyX
         ONtMG9ULGituOeEZBsF7CleJ2qnk3cM7syIlYBYDljT2FgNdhJAhx1oCkRitebS+lk
         WRvxyrPSWlervodHVarDSEE24ZFXjXJ9de/a6WZwLwD534uL3LsdLYJNB9e4ydKdzp
         P6+xK2WNE0dIgt2QGgy8l4faoxYoTrze9IUy/IsjpLDfD+yKqA/mFER1L6375Of50R
         hxGfhqTJaKTRywAM9K+fHewNYA7h5DY+W18CenbA1C9d4P/gkFILFewZqYKC8rehev
         QRD/XkiN16E5w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: Re: [PATCH v5 0/3] docs/zh_CN add three core api docs
In-Reply-To: <cover.1620286208.git.siyanteng@loongson.cn>
References: <cover.1620286208.git.siyanteng@loongson.cn>
Date:   Thu, 13 May 2021 10:20:55 -0600
Message-ID: <87k0o261w8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> * As Matthew and Xiangcheng suggested:
>
>   call kernel-doc to generate related docs (0001 and 0002).Thanks!
>
>   I tested it on other computers (at least three) with no problem,
>   But on my computers it prints 1000+ warnings, I tried to find the
>   cause in the past few days but no clue.
>   So, the two patches may print as follows:(maybe your computer won't print anything)
>
>   linux-next/Documentation/translations/zh_CN/core-api/kernel-api.rst:235: WARNING: Duplicate C declaration, also defined at core-api/kernel-api:235.
>   Declaration is '.. c:None:: struct list_head *prev'.

This is the same problem I just talked about in my other message.  I
really think we need to just leave the kernel-doc directives out of
translations; we certainly don't want to add all those warnings.

Thanks,

jon
