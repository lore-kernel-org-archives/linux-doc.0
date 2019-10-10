Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DA417D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 23:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfJJXUW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 19:20:22 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33501 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbfJJXUW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Oct 2019 19:20:22 -0400
Received: by mail-qt1-f193.google.com with SMTP id r5so11296130qtd.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2019 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=nRzsXUYX1Vn9zmeoL5CxM2e+8mSHdi5U0zkrK8ruq28=;
        b=u7STbV6Nf9BEb8lek2LE5FxFx/KCqYCiqLxJ0+6iTzXY2X79xfL5KJ1u7BnF5zhjM/
         PHXsqq7fbqivrD6tGPTmFKF3PNajAflnKX2p6VcXQ27pxz8wxWb+lOLZl+9bzy825zxF
         /3os/Biu3HXlbXL4Md9kEXt00bqyubT09mYoRFXIfb8sAoHOzVnm52nKgS+tusX1L0KD
         XXRERzp6WH2WqnefLyxsVUi4lj0yM/5kl9pf1MCPuE62UD4TpbQ3dQKXSWY4/FNo/Cat
         Bg0VenxuSzQwoi9448aaOj4SLtm47glnjhGzllhVfMYEAqaFXzckOtDaV4LxucXNtPDA
         UdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=nRzsXUYX1Vn9zmeoL5CxM2e+8mSHdi5U0zkrK8ruq28=;
        b=mdLC9/6xHrqnyJMMwTZ3mllckT8+tRl9HQDO6L1braNkxMtc5WTK9rTxGO3OcIe1uO
         SGORPzz/h3NlI345R0NZEMKfIwoEiq6y+aEvPJ4huh6XeMVK8xLLgchIz+TMzFglFB3I
         SU96OhaU+jiPB5xpM4MtxG8UVYPZYXlUYGg5o/0PTEPNtsOmSZeVcGP64CCjPuttHUy/
         yAI+OxyoY163jbTMjHYP09NXSHa6zqtM/n0CUV6JwTRcQsXCJ5VzeDRkcx44ZdyOshQH
         xw9gMJTY4/gotTX7IZJeh1awtmvX7xJWHs8mm4B+WIxrUPhAifBk8loBmzCGMjR2IGDn
         rywg==
X-Gm-Message-State: APjAAAWelbH5BK6o+qh6Up4yS+cvlIHgMfeMk/3kkF32K0Z+Ee5XPYJG
        zrKhqbbt0/84yDR2OifWcrzR/g==
X-Google-Smtp-Source: APXvYqwp7UVXtdlmZp2oYKdWOn7HN7Z1Oxpb2JTm5wkzLcWIIVpO9P3FGDk5Ts36dpPUCPSX5q3DrA==
X-Received: by 2002:a05:6214:13e3:: with SMTP id ch3mr13118794qvb.215.1570749619676;
        Thu, 10 Oct 2019 16:20:19 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id h9sm3538762qke.12.2019.10.10.16.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 16:20:19 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:20:03 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        Tal Gilboa <talgi@mellanox.com>,
        David Miller <davem@davemloft.net>, linux-doc@vger.kernel.org,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH] Documentation: networking: add a chapter for the DIM
 library
Message-ID: <20191010162003.4f36a820@cakuba.netronome.com>
In-Reply-To: <e9345b39-352e-cfc6-7359-9b681cb760e8@infradead.org>
References: <e9345b39-352e-cfc6-7359-9b681cb760e8@infradead.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Oct 2019 15:55:15 -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Add a Documentation networking chapter for the DIM library.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Tal Gilboa <talgi@mellanox.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <jakub.kicinski@netronome.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>  Documentation/networking/index.rst   |    1 +
>  Documentation/networking/lib-dim.rst |    6 ++++++
>  2 files changed, 7 insertions(+)
> 
> --- linux-next-20191010.orig/Documentation/networking/index.rst
> +++ linux-next-20191010/Documentation/networking/index.rst
> @@ -33,6 +33,7 @@ Contents:
>     scaling
>     tls
>     tls-offload
> +   lib-dim
>  
>  .. only::  subproject and html
>  
> --- /dev/null
> +++ linux-next-20191010/Documentation/networking/lib-dim.rst
> @@ -0,0 +1,6 @@
> +=====================================================
> +Dynamic Interrupt Moderation (DIM) library interfaces
> +=====================================================
> +
> +.. kernel-doc:: include/linux/dim.h
> +    :internal:
> 
> 

CC: linux-doc, Jake

How does this relate to Documentation/networking/net_dim.txt ?
(note in case you want to edit that one there is a patch with 
updates for that file from Jake I'll be applying shortly)
