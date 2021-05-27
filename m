Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966DBC4708A
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 16:14:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AAD56128B
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 16:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237251AbhE0QPr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 12:15:47 -0400
Received: from ms.lwn.net ([45.79.88.28]:48246 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237178AbhE0QO5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 12:14:57 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3645F383;
        Thu, 27 May 2021 16:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3645F383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622132001; bh=/d4pP2zrUGkT7iJtGYVDfAYOzwJ2qNZp58uhs5HoRBE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gorx5xi0+C04pC4PV6ha1Hzu7Ea9ddTnV2Lk0fkQasCa1KnqxESpf1QQGXlsmU+HY
         lle1PIy+dVbz4d8fyWrKMz1xOsgcX465DsMxGljNJIcYVzJyRKjJjVlItELiog/Fq/
         No6ZoE5axY8dfzgKP4EX/VmjCEdUADHLU1Fze0HGW6Vh2tSL2uyE+IuaZVD5I4V+dv
         Z+CQJpzavEWWSSrPfKdVzppgq0Nqd+O5/o8yoOBIeBwISjHcyL+xlpmBUTiuPpnbmO
         csbNIJl2i3IDce80rU4/e1bhRXsY9PZfqHqa8QV1O+O79ZuIjswFXl1h5pUZgEGdU1
         243gjGiypCt+A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com
Subject: Re: [PATCH v3 0/2] docs/zh_CN:add core-api refcount-vs-atomic.rst
 and local_ops.rst translation.
In-Reply-To: <cover.1621823299.git.siyanteng@loongson.cn>
References: <cover.1621823299.git.siyanteng@loongson.cn>
Date:   Thu, 27 May 2021 10:13:20 -0600
Message-ID: <87r1hs2lzz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v3:
>
> pick Xiangcheng Wu's review-by tag.
>
> v2:
>
> Some translations have been modified as suggested by Xiangcheng.
>
> v1:
>
> Translate Documentation/core-api/refcount-vs-atomic.rst and .../local_ops.rst into Chinese.
>
> Yanteng Si (2):
>   docs/zh_CN:add core-api refcount-vs-atomic.rst translation.
>   docs/zh_CN: add core api local_ops.rst translation
>
>  .../translations/zh_CN/core-api/index.rst     |   4 +-
>  .../translations/zh_CN/core-api/local_ops.rst | 194 ++++++++++++++++++
>  .../zh_CN/core-api/refcount-vs-atomic.rst     | 154 ++++++++++++++
>  3 files changed, 350 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/local_ops.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst

Applied, thanks.

jon
