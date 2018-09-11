Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BBF137D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 17:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbeIKWxb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 18:53:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726782AbeIKWxb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Sep 2018 18:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5NX6wVqFgfcsO5bnuNT/M5hBLlzqx0yJ2dKiSUMMry0=; b=Gb5RbwGqBfiIArfmkhXqjf3Ho
        SFnCD2Q06qTakvIH866pF2PnZdEJ/oYxcWYMhgcxg9gZglbgxgTuL0jvAwTAv1/bqqJXOWvDlkvy1
        Zq8vRM2cHYU24KghyG1GK2oEpT43JybuHc7cA48hH1Z66YfRf93JMx4CugxZKuUtk/qK4iPierbRm
        KmNHe9jcGmnoA/kWr5t4aKWsW4FIZuqT6hS/j9EAHyqbVXIDXzRWBVuD0whaAU4b8N6W1SyjF3Bct
        s0Oyj5fcx+ermgMH/KyIc8HlE2VPzTjf1m5lcP6+QN3/T0cW1VWtG2h4cbE9hZDVCN4fX20Y5u5z/
        lsvpjDwuA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fzmqY-0003Re-WC; Tue, 11 Sep 2018 17:53:07 +0000
Subject: Re: nodocs in 4.19-rcX
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <ace3eeb9-0a15-a4ff-cf2d-af9335fd9810@infradead.org>
 <20180911092522.7a335ce8@lwn.net>
 <e1ae3f3f-5cd0-6542-9f95-69ea7e5ecafa@infradead.org>
 <20180911162410.GB30245@rapoport-lnx>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <34e83216-953f-600a-88e3-5e084f79b2be@infradead.org>
Date:   Tue, 11 Sep 2018 10:53:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180911162410.GB30245@rapoport-lnx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> From 1d7ab80e5388d993b7b262b24da1f3e55f30f508 Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Date: Tue, 11 Sep 2018 19:16:36 +0300
> Subject: [PATCH] docs/boot-time-mm: fix kernel-doc directive for including all
>  but DOC:
> 
> There were several rounds of the patches that enabled "functions" directive
> with no parameters in kerneldoc.py to allow including all the kernel-doc
> comments except the DOC: sections.
> 
> Yet, the boot-time-mm.rst sneaked in with the older version of that
> directive and was not updated. Update it now.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/boot-time-mm.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/boot-time-mm.rst b/Documentation/core-api/boot-time-mm.rst
> index 03cb164..6e12e89 100644
> --- a/Documentation/core-api/boot-time-mm.rst
> +++ b/Documentation/core-api/boot-time-mm.rst
> @@ -76,7 +76,7 @@ These interfaces available only with bootmem, i.e when ``CONFIG_NO_BOOTMEM=n``
>  
>  .. kernel-doc:: include/linux/bootmem.h
>  .. kernel-doc:: mm/bootmem.c
> -   :nodocs:
> +   :functions:
>  
>  Memblock specific API
>  ---------------------
> @@ -89,4 +89,4 @@ really happens under the hood.
>  
>  .. kernel-doc:: include/linux/memblock.h
>  .. kernel-doc:: mm/memblock.c
> -   :nodocs:
> +   :functions:
> 


-- 
~Randy
