Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7E2C4332F
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 20:34:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiKIUeX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 15:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiKIUeW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 15:34:22 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D977726AFA
        for <linux-doc@vger.kernel.org>; Wed,  9 Nov 2022 12:34:21 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 920B237E;
        Wed,  9 Nov 2022 20:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 920B237E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668026061; bh=1vJtFNwu7yevJTK9s397qUIspRLhNnqMAbPRlmW68as=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=AsHQ5Fl5hwalL+TrbPt49LoxCNGbX7HxaCOBgvV9fSFlLkZ90pkRfFoOeKmN6FLnd
         td+QrRZJWnbRTh9X8J2OcwIX1g5e2rFbwONgt19/fdV3h1xbGwYX255348Nav3v5xI
         I/j9enVVHAcsU6JALErRfQQAd6XOtX5ArJeCuIdXkJ6EWdXyeMQxzY0fSGyi8r8OTq
         byPXlZythhZzFTFSWo+1U/qnKQ/GABUNzheSiqhzjZC8QgyM/LBr+SxC3c9MAtRurs
         uY8U1DuJ2yPmGjzBylffdAFs0zZIUOnxgF6/ZQqT3Cp3z1YltAvbCQ756FX+3RCMly
         JTAUyIS1mf/Cg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Binbin Zhou <zhoubinbin@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V3 0/3] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 2)
In-Reply-To: <cover.1666689138.git.zhoubinbin@loongson.cn>
References: <cover.1666689138.git.zhoubinbin@loongson.cn>
Date:   Wed, 09 Nov 2022 13:34:20 -0700
Message-ID: <87sfirkgtv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> writes:

> Hi all:
>
> Sorry, it may have been a while since the V2 patchset. Thanks to Alex
> for his comments.
>
> As a continuation of the previous patchset
> (https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/),
> this patchset contains the Chinese translations of the remaining three files.
>
> As follows:
>
> this_cpu_ops.rst
> timekeeping.rst
> errseq.rst
>
> So far, the docs for section "Data structures and low-level utilities" of
> the core-api has been translated completely.
>
> Thanks.
>
> Changes since V2:
> - Take Alex's advices, thanks.
>
> Details: 
> https://lore.kernel.org/all/CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com/
>
> Changes since V1:
> - Take Xiangcheng's advices, thanks.
>
> Details: 
> https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
> https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/
>
> Binbin Zhou (3):
>   docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
>   docs/zh_CN: core-api: Add timekeeping Chinese translation
>   docs/zh_CN: core-api: Add errseq Chinese translation
>
>  .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
>  .../translations/zh_CN/core-api/index.rst     |   5 -
>  .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>  .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
>  4 files changed, 607 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst

Applied, thanks.

jon
