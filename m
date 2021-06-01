Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01CBC47080
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 22:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A436D613C1
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 22:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbhFAWna (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 18:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbhFAWna (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 18:43:30 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E131DC061574
        for <linux-doc@vger.kernel.org>; Tue,  1 Jun 2021 15:41:48 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7D5472CD;
        Tue,  1 Jun 2021 22:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7D5472CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622587308; bh=XC50YHo5lnCFWij3ytl3EbMXb5rt7T+5r4MOrlpGGGE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mwcAxQhMnpDtVHh2W++1kVdjbsSFptANwOCpRQ2HLOsWSUjVbYgJc6IRmeZocX4RI
         3au9G+11FidEefETVNxarTnnn6EatuW3FXxJjq8CVlnRQJXBhSVp056A5zEp+9KjVy
         6xU6Ps92Nqc59RaqqjjW2ef0Co96a8e7YZ8JmOQ88ekxg+vOkpPUNMP+WThjcUNhkH
         1D97EcvhjeS6uqMXH3EBDY2UAGevu5eY423AKofafG3K1Nc5N+PUanIocIaam4BKla
         nEK1KfAWWm3ZLXk4myiazjf2FnKAOpwSoE2rjiQMqcL/l3MO5dO79b9br59xwQfEMU
         WVGiR13fqSqNQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, bobwxc@email.cn, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN: add core-api symbol-namespaces.rst
 translation
In-Reply-To: <20210527064347.3936694-1-siyanteng@loongson.cn>
References: <20210527064347.3936694-1-siyanteng@loongson.cn>
Date:   Tue, 01 Jun 2021 16:41:47 -0600
Message-ID: <87r1hl8axg.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Translates Documentation/core-api/symbol-namespaces.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v3:
>
> * update Documentation/translations/zh_CN/core-api/index.rst diff.
>
> v2:
>
> * Some bad translations have been modified as suggested by Xiangcheng.Thank you for your review.
> https://lore.kernel.org/linux-doc/20210429052252.GA9451@bobwxc.top/T/#t
>
> * Pick Xiangcheng Wu's review-by tag.
>
>  .../translations/zh_CN/core-api/index.rst     |   2 -
>  .../zh_CN/core-api/symbol-namespaces.rst      | 142 ++++++++++++++++++
>  2 files changed, 142 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/symbol-namespaces.rst

Applied, thanks.

jon
