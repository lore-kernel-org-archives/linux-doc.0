Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E826DC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Apr 2022 22:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349444AbiDEWet (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Apr 2022 18:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457602AbiDEQPE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 12:15:04 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14741572F
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 09:13:05 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35:2589:2a93:190d:b787])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CC2CD608;
        Tue,  5 Apr 2022 16:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CC2CD608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1649175185; bh=RmelwBOki+XZchdQQMh2js4bXH9A2izy0tECzkxirEc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=E/Ux2cO8kTZTLN8hqH7dz/ROvlpJniPnM7MFmE2jYghxhssydMaiEPoNUepK1lxy8
         WxzNYuzjjh9/k7/vvlfy3Ar3Oq8MomZclIxal3a3y5gCaPgooTo9BXKmlQIpzNG97V
         MDU6yC0LtCSrcWyZbOKdSjmYJtZn254gt0kNdCmUu8YyNziDos7zdWUPqUG3/9qs/g
         rFkLV3v7oi8+BoelTzi3S7hdEoyKqp1lX7o4WcmewCOM+hUiAvGkhbZfvIKtBi4XaX
         lOgGq1dw9mFAJreyoibFr3XRdCt5aem/V36D0QbirVTeFERInHCfWvJtN32+4aYPuN
         NG50DNWOfoazw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v3 00/12] docs/zh_CN: add a little vm translation
In-Reply-To: <cover.1648458742.git.siyanteng@loongson.cn>
References: <cover.1648458742.git.siyanteng@loongson.cn>
Date:   Tue, 05 Apr 2022 10:13:04 -0600
Message-ID: <87mtgzecfj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v3:
>
> * Modify some words under Alex's advice.
> * Optimized some words. [PATCH 2/12]
>
> v2:
> * Modify some words under Alex's advice.
> * Optimized some words. [PATCH 07-12/12]
>
> v1:
> * Translate a little .../vm/*.rst into Chinese.
>
> * It is expected that all vm documentation will be
>  translated in a short time, sorry for the huge review
>  pressure on maintainer. I look like a troublemaker. >_<

Indeed :)

> Yanteng Si (12):
>   docs/zh_CN: add vm frontswap translation
>   docs/zh_CN: add vm hwpoison translation
>   docs/zh_CN: add vm memory-model translation
>   docs/zh_CN: add vm mmu_notifier translation
>   docs/zh_CN: add vm overcommit-accounting translation
>   docs/zh_CN: add vm page_frags translation
>   docs/zh_CN: add vm page_owner translation
>   docs/zh_CN: add vm page_table_check translation
>   docs/zh_CN: add vm remap_file_pages translation
>   docs/zh_CN: add vm split_page_table_lock translation
>   docs/zh_CN: add vm z3fold translation
>   docs/zh_CN: add vm zsmalloc translation
>
>  .../translations/zh_CN/vm/frontswap.rst       | 196 ++++++++++++++++++
>  .../translations/zh_CN/vm/hwpoison.rst        | 166 +++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst |  24 +--
>  .../translations/zh_CN/vm/memory-model.rst    | 135 ++++++++++++
>  .../translations/zh_CN/vm/mmu_notifier.rst    |  97 +++++++++
>  .../zh_CN/vm/overcommit-accounting.rst        |  86 ++++++++
>  .../translations/zh_CN/vm/page_frags.rst      |  38 ++++
>  .../translations/zh_CN/vm/page_owner.rst      | 116 +++++++++++
>  .../zh_CN/vm/page_table_check.rst             |  56 +++++
>  .../zh_CN/vm/remap_file_pages.rst             |  32 +++
>  .../zh_CN/vm/split_page_table_lock.rst        |  96 +++++++++
>  .../translations/zh_CN/vm/z3fold.rst          |  31 +++
>  .../translations/zh_CN/vm/zsmalloc.rst        |  78 +++++++
>  13 files changed, 1139 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/frontswap.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/hwpoison.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/memory-model.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/mmu_notifier.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/overcommit-accounting.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_frags.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_owner.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_table_check.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/remap_file_pages.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/split_page_table_lock.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/z3fold.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/zsmalloc.rst

Series applied, thanks.

jon
