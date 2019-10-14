Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4EA867D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Oct 2019 15:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732422AbfJNPPY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Oct 2019 11:15:24 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58308 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732223AbfJNPPY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Oct 2019 11:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LVM7BVj9OgHZ5K1jJr1/pra8aU+Cv3c8zLVFk3+XdXU=; b=jj25XlIGQnK83pDt60ggoZ0l9
        km5A3bVwGU4GOdTMAxJ1J+1/etGcdBPPVGm5seqlw6KLuk2izqjHEjiQEgKBom2eQvDw3fIn0jXx/
        5X5ZIQtyY32ykjg3beA7P/gGFX+O1wZp3295K4/k0SOwSGW5PKBlYZ4EuIQ/Si2kqzioZDzzgTLAa
        Kbe+eKzSg+/F08ij+Kxh29k2GX05Fwr+RkESJxpbr7KS8b9RxmonxCCr+jJ0XaaSbb5FG94451R7T
        JzF1s0gOaYCDOmREbSTACP++5sUFNG2VgOeAbB15opJBWw3RLos7/dsV5UkpbTKNQuTGdS+TXQ/Ju
        Zx7SOvoRQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iK24B-000446-Rj; Mon, 14 Oct 2019 15:15:23 +0000
Subject: Re: [PATCH] docs: admin-guide: Extend short title underline in sysctl
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     corbet@lwn.net, gor@linux.ibm.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org
References: <20191014110008.GA3814@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <57187e31-06b8-6ffe-2141-71f6c137bab8@infradead.org>
Date:   Mon, 14 Oct 2019 08:15:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014110008.GA3814@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/14/19 4:00 AM, Adam Zerella wrote:
> Title underlines should extend the full length of a title,
> Sphinx is currently displaying the following warning when
> building the htmldocs:
> 
> sysctl/kernel.rst:397: WARNING: Title underline too short.
> 
> hung_task_interval_warnings:
> ===================
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 614179dc79a9..383eda89f411 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -394,7 +394,7 @@ This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.
>  
>  
>  hung_task_interval_warnings:
> -===================
> +============================
>  
>  The same as hung_task_warnings, but set the number of interval
>  warnings to be issued about detected hung tasks during check
> 

I sent the same patch on Oct-08 but no one has merged it yet.

https://lore.kernel.org/lkml/55ce9772-cffe-f28f-d002-088127842980@infradead.org/

-- 
~Randy
