Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1DFC38A02
	for <linux-doc@archiver.kernel.org>; Fri, 28 Oct 2022 18:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiJ1SbT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Oct 2022 14:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJ1SbS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Oct 2022 14:31:18 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612881F181F
        for <linux-doc@vger.kernel.org>; Fri, 28 Oct 2022 11:31:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0CB3F2A0;
        Fri, 28 Oct 2022 18:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0CB3F2A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1666981878; bh=tgyv+nYcM446dXmogzPrWxTgK8vwaVbCAS80SE2HvM4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=URZwTkvSTWCBQ6qhjjQypJg4lLBW8E4djvgA6hyx9w9C7vxSVg6Kg5FdUs1/VcZ1Z
         YZyhWNXDp6mOOMDp+alM4ZF90E859hyTI2Fmgq5twV1t2UZI6y2JIv6IdQ0mkc1XcT
         i+1sNHUB8aCifMwHR+qUpRu79B4riklI8rYLZcxWObjbZiZnSEtx+ddAt47FVX5w8/
         5zAWS+2+KaIzMeDe8T//bXi7sDSAEsT1wpnqI2s6PMV2IrmQrtrNWw5fJ/yF6Dw6fN
         LEj4oqvNc3KcmLBM0l4fqduZUboOIU/Ynr7yMszj/7lCM2H2jwgGZLE2t7ziDVsVxr
         PHxACcHXyILeQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Binbin Zhou <zhoubinbin@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V2 0/3] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 2)
In-Reply-To: <cover.1666171735.git.zhoubinbin@loongson.cn>
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
Date:   Fri, 28 Oct 2022 12:31:17 -0600
Message-ID: <87leoz6bre.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> writes:

> Hi all:
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
