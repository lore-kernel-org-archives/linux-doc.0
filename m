Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12EF57D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 03:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfCHDnX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 22:43:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52604 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfCHDnV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 22:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5T5HnXFovSAB6yDLKswYuDj6oYIxs2i+euVwKEB0nBg=; b=slag2IDE09BgNwLAXHE58EFrV
        BeBNzYjSP0lQNBzmdXlAilUEqRhZvNXIdgGLbITxDx2jIRNsPppaEIZUIv+Zc59HmD7zM7g0WVZNs
        9XfM8lPT6Is1GNQAHIXIYyLKD5jscgn3sNOt56iF0qdB4m3qYppwFF6RGUvZkg0maiWY1FAzN5g7s
        7xaXAX7QZwlWZBuVA0Hvy56Ldl+ndPGTMPlKLViliVcDArYUjyNw5Ch0dtf/Cq4bNItdeHBl4QNnp
        +oBXlYe9th8feoaG3MIoXtZlpfp41PsVbpU3Kry5zz9RDyZ2FDPC2n1/s/WkuwirVJG4ulB2bzy3n
        O5tFKHZlg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1h26Pp-0006mk-8r; Fri, 08 Mar 2019 03:43:21 +0000
Subject: Re: [PATCH 9/9] docs: Add blank line after SPDX licence identifier
To:     "Tobin C. Harding" <tobin@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190307211153.28400-1-tobin@kernel.org>
 <20190307211153.28400-10-tobin@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9e949377-f3d1-1d58-8966-3f9923b0ac05@infradead.org>
Date:   Thu, 7 Mar 2019 19:43:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307211153.28400-10-tobin@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/7/19 1:11 PM, Tobin C. Harding wrote:
> Sphinx emits warning
> 
> 	WARNING: Explicit markup ends without a blank line; unexpected
> 	unindent.
> 
> This is caused by a missing line after the SPDX license identifier.
> 
> Add blank line after SPDX licence identifier.
> 
> Signed-off-by: Tobin C. Harding <tobin@kernel.org>

These are also already fixed.

> ---
>  Documentation/laptops/lg-laptop.rst   | 1 +
>  Documentation/misc-devices/ibmvmc.rst | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
> index d9e560dfd045..f2012d2dcb9d 100644
> --- a/Documentation/laptops/lg-laptop.rst
> +++ b/Documentation/laptops/lg-laptop.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0+
> +
>  LG Gram laptop extra features
>  =============================
>  
> diff --git a/Documentation/misc-devices/ibmvmc.rst b/Documentation/misc-devices/ibmvmc.rst
> index 46ded79554d4..b46df4ea2b81 100644
> --- a/Documentation/misc-devices/ibmvmc.rst
> +++ b/Documentation/misc-devices/ibmvmc.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0+
> +
>  ======================================================
>  IBM Virtual Management Channel Kernel Driver (IBMVMC)
>  ======================================================
> 


-- 
~Randy
