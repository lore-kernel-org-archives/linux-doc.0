Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464B2C433E6
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18EF823A22
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbhAUTdh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:33:37 -0500
Received: from ms.lwn.net ([45.79.88.28]:36110 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbhAUSvK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jan 2021 13:51:10 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B3CB8615F;
        Thu, 21 Jan 2021 18:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B3CB8615F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611255027; bh=sbsHFAH86AOtDyGQjg0eGz0zupBshKqKdJPjqbJQxes=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HPswWyYZYZsL1icvgJcoR6ZqYXEs2j6Wg4kvSnoEdSyanBSWo6TaaYZs/ceqjdApG
         Zf780Yc6P6E5E+lXTpnmmJPHRhXjeCdjCj0pWSyVidMXbiEXgV8KdBcWy0HDqxlHm+
         fKD5SkrqCo5kx+aFLoziitXvlcxrW1bZf5tmTZvCYSHorM1luT3SvR9u6tV6+pfBFL
         BUOJMMJQp5NQHyzZYs1rrJ3yVBolMk+UCMtkKXtg1pLhJg+W7Ps89r3e5gpF7bSTL3
         vPHzcC2CLK93pFPZXqP6GZ2HePs1BJRuwbnSoH6lAy5d1ZxN8pYKOsSZeCBLiiPZvp
         YgeimySvc0gZA==
Date:   Thu, 21 Jan 2021 11:50:26 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: remove cn_index tag in mips
Message-ID: <20210121115026.77f2afa2@lwn.net>
In-Reply-To: <20210121024113.16344-1-alex.shi@linux.alibaba.com>
References: <20210121024113.16344-1-alex.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Jan 2021 10:41:13 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> It's a unused tag with a incorrect big name but just for mips arch.
> So remove it.
> 
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/translations/zh_CN/mips/index.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentation/translations/zh_CN/mips/index.rst
> index 27a2eae8484a..b85033f9d67c 100644
> --- a/Documentation/translations/zh_CN/mips/index.rst
> +++ b/Documentation/translations/zh_CN/mips/index.rst
> @@ -5,9 +5,6 @@
>  :Original: :doc:`../../../mips/index`
>  :Translator: Yanteng Si <siyanteng@loongson.cn>
>  
> -.. _cn_index:
> -
> -

Applied, thanks.

jon
