Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34BEC2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 21:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFC10613B4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 21:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhFQV5B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 17:57:01 -0400
Received: from mail-il1-f176.google.com ([209.85.166.176]:35686 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhFQV5A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 17:57:00 -0400
Received: by mail-il1-f176.google.com with SMTP id b9so6747765ilr.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 14:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OHep6PXwBmyeT5FVWp4Sgo7lDyr2cr2ckzn+84Qw82o=;
        b=AfdlFK4LhDaT7rcJrTq22EnwccTZB3IOaoCYTMpSphVy0UsUuCFjC13sEmL+OPdpaN
         656Z5GUqt+QgqxkrJK+L75DzSgxHSe9gAJ6o9h5Ijn0EDZaB7Gefx6Bhi523zrCUfZtV
         nle5Hh+6EwaIUOgUJ0l5xpnZR5//vmt2g8Hsyj8Hm9FTVF7WNjWxTvyOUZFIoK4jxFmv
         w5Y3fDbQy567vUeGNiUnXxQXPdbnRTd07SOnBFxbESO6ApDwEbOcpTjRCjJrC44zHu6z
         nNniNLD8ny70L5qOa9+scPjEGaAzqF8z6/DWJoTT8gDVt8lFrNx5yuWNfCTLUXerZoCb
         dR6g==
X-Gm-Message-State: AOAM532yoyoppPJvC+XSMriE5XWcvhzjypUBXZp+kCRzt0a+i49XAc2h
        FBrlFdSTiHrimZhwLdKEiGE=
X-Google-Smtp-Source: ABdhPJw2dk1pc1r6EzR+5HdW0LNIXYR5eS+5g3CDAYbr7MYZKxdC7x8KM7xaoB/cO/C75TKnSFF9Rw==
X-Received: by 2002:a05:6e02:d05:: with SMTP id g5mr4803826ilj.34.1623966891543;
        Thu, 17 Jun 2021 14:54:51 -0700 (PDT)
Received: from google.com (243.199.238.35.bc.googleusercontent.com. [35.238.199.243])
        by smtp.gmail.com with ESMTPSA id r6sm3402205ioh.27.2021.06.17.14.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 14:54:51 -0700 (PDT)
Date:   Thu, 17 Jun 2021 21:54:49 +0000
From:   Dennis Zhou <dennis@kernel.org>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] mm/doc: Include percpu documentation in html docs
Message-ID: <YMvEqYjWG9HcxElV@google.com>
References: <20210617204325.2278730-1-willy@infradead.org>
 <20210617204325.2278730-3-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617204325.2278730-3-willy@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, Jun 17, 2021 at 09:43:25PM +0100, Matthew Wilcox (Oracle) wrote:
> The kernel-doc was written, but not included in the html documentation.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/mm-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index e46f01c4b200..89a53ac00249 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -87,6 +87,12 @@ DMA pools
>  .. kernel-doc:: mm/dmapool.c
>     :export:
>  
> +Per-CPU memory allocation
> +=========================
> +
> +.. kernel-doc:: mm/percpu.c
> +   :export:
> +
>  More Memory Management Functions
>  ================================
>  
> -- 
> 2.30.2
> 
> 

Acked-by: Dennis Zhou <dennis@kernel.org>

Thanks,
Dennis
