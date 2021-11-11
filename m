Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3A3C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 11 Nov 2021 20:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 224DA61002
	for <linux-doc@archiver.kernel.org>; Thu, 11 Nov 2021 20:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbhKKU1U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Nov 2021 15:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhKKU1T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Nov 2021 15:27:19 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FC8C061766
        for <linux-doc@vger.kernel.org>; Thu, 11 Nov 2021 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=oLbghO9sxXXWtguLPtHAJzdH9bFqjqvJKWSn3VhI5QI=; b=XpeYhjGLwjJrgEPIbtIDUG4v66
        0yM4QCwRwBYyG5jv7z344UGqAZMklHLHWuVZt8MJ8VamHr3bVpMEyDpFE3Ih/m2kgIu0v7xyZhRrh
        cG1aYVdP8cfExxXesazpVcBbCzIBTnnTdsHEV3yU3Y4giFsLRiyG6JDm0ZZMseygKOY8MgRxPrKE3
        5km+Q2+UAnW2rP+mSqvgvY6HpjzoMISBfxOQmw4/D+Noe33Id6JdhS2Jgb+4KHyASlzGK8IRp2Tu9
        QQQvM5mvthhjBBAW4z8ztnLRzKN+mIwJxrdzCAx562aqT/zy5LGPo8p+jKqI0Rq9c0UGYv3b09Gzk
        ajfTKAJA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mlGcW-008hVw-K7; Thu, 11 Nov 2021 20:24:28 +0000
Subject: Re: [PATCH] docs: Add documentation for ARC processors
To:     Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-snps-arc@lists.infradead.org,
        Vineet Gupta <vgupta@kernel.org>
References: <20211111201036.5692-1-abrodkin@synopsys.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <70f4ba74-9e0e-579b-3e17-9144490c73d2@infradead.org>
Date:   Thu, 11 Nov 2021 12:24:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111201036.5692-1-abrodkin@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/11/21 12:10 PM, Alexey Brodkin wrote:
> +Important note on ARC processors configurability
> +################################################
> +
> +ARC processors are highly configurable and several configurable options
> +are supported in linux. Some options are transparent to software

                     Linux.

> +(i.e cache geometries, some can be detected at runtime and configured
> +and used accordingly, while some need to be explicitly selected or configured
> +in the kernel's configuration utility (AKA "make menuconfig").
> +
> +However not all configurable options are supported when an ARC processor
> +is to run linux. SoC design teams should refer to "Appendix E:

              Linux.

> +Configuration for ARC Linux" in the ARC HS Databook for configurability
> +guidelines.
> +
> +Following these guidelines and selecting valid configuration options
> +up front is critical to help prevent any unwanted issues during
> +SoC bringup and software development in general.


Rest of it looks good.

Thanks.
-- 
~Randy
