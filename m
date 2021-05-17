Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D34EC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F09A3611BE
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbhEQSbe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 14:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbhEQSbc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 14:31:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D640C06175F
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 11:30:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 08315307;
        Mon, 17 May 2021 18:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 08315307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621276216; bh=MLHbWrN+Tsu/e4K60+zt6vVXL1CX0CaV7FUYJ+70Gc8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=E0xGWgms1Zl/3s+CASb3yyaq6Ua1jmwFP8mHOzht4UShJgwMFrcAQ51gUZmF17Z/U
         KkxZgY8s6I9a6KFIdIv7uPStr8ul8887dZWIm+QCwyQLEoJWR9IB11q4C055YKcj2S
         9ZI6vCY7SIMLmx1DilcQkDHNx7pvxdToh5myAHEKyXCppLI8ErWumxpARs3xAfxVdx
         hu30H7yGRPBvib29VLwIYxrnbStXIDPUGWO81sFF8J7b7ERyUhBzFYCLHMOHT3bOCZ
         QS8pIpSE7sRY50JJIL4v4scWdJt38nqG7VZFXZ/QglYhf5aVIgvcpuQL1YG1uycK1M
         qP2qpUnCU6yhA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v6] docs/zh_CN: add core-api workqueue.rst translation
In-Reply-To: <20210517132927.3461185-1-siyanteng@loongson.cn>
References: <20210517132927.3461185-1-siyanteng@loongson.cn>
Date:   Mon, 17 May 2021 12:30:15 -0600
Message-ID: <87a6ot2oy0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This patch translates Documentation/core-api/workqueue.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> v6:
>
> * Writting Changelog under three dashes(---)

Applied, thanks.

jon
