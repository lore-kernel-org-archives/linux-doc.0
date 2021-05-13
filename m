Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB37C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:27:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F13B761168
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234849AbhEMP2r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 11:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbhEMP2l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 May 2021 11:28:41 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B884C061756;
        Thu, 13 May 2021 08:27:31 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E4B6D2E7;
        Thu, 13 May 2021 15:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E4B6D2E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620919651; bh=k8SMaQe5QJRfP4QfPx7FriwV1OFFuTOejTKjMmLhKTs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UG+tSqEtPnczVmPl4dfkO/uAeKKW+7r/OYiB/3Rmrg7nQhzoC4gw25ktzMJLJC5Jf
         0+YbUHEyOxehKAIl/1oR+b0Ku/SAQMu6zQiIoygu8rkpp0oCtHEOxx4QEhuYT3x8Th
         vQGhHM7aKv1onT8ux5eWNqTTBbGmibAIrm5AnNdmFmBcBdURZmMUpFjjhj9Vk+eJUk
         qmPYueAcUdUOqr/AabmkPrO/DtHgVHFJUysLzWhFdDSlFEEtacSgiMjYsCgUp1GSQO
         IX+hZNgEYbagRRQiBj0A8ahHLWFacTIEssXt43qQUdiGbB0pE31FJoJH7Sa+pKuj1R
         8Wvldf9GpuKGQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wan Jiabing <wanjiabing@vivo.com>, Alex Shi <alexs@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wan Jiabing <wanjiabing@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
Subject: Re: [PATCH] docs/zh_CN: fix reference file and update translations
In-Reply-To: <20210506081414.14004-1-wanjiabing@vivo.com>
References: <20210506081414.14004-1-wanjiabing@vivo.com>
Date:   Thu, 13 May 2021 09:27:30 -0600
Message-ID: <874kf67ixp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wan Jiabing <wanjiabing@vivo.com> writes:

> In commit da514157c4f06 ("docs: make reporting-bugs.rst obsolete"),
> reporting-bugs.rst was deleted and replaced by reporting-issues.rst.
>
> In commit cf6d6fc279360 ("docs: process/howto.rst: make sections on
> bug reporting match practice"), related sections were adjusted.
>
> Fix the reference file and update some translations.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  .../translations/zh_CN/process/howto.rst         | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

Applied, thanks.

jon
