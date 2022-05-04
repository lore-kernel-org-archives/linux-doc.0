Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838E3C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  4 May 2022 06:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344936AbiEDGeV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 May 2022 02:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344977AbiEDGeA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 02:34:00 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2575CC1A
        for <linux-doc@vger.kernel.org>; Tue,  3 May 2022 23:30:24 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id h1so384614pfv.12
        for <linux-doc@vger.kernel.org>; Tue, 03 May 2022 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RlGAzlCLtGRgz+Ob/kqgcv0i3pJhGJb9BnVRZ2vQdxY=;
        b=Ga+eoSIzBqoRsJmDI/sn0/kTZh8suVw/qg1GR3fLDAkmNP3PVIibNY0wG67uFaCbs0
         oofVxGg6Qwcovl/j6f9rZwnk32OQ1OXpyrcW0ZZIK8rhKUFrrj4jKpWoIbiQHNcG+KYH
         l5u9AV/Y8PErf8kn7tecPosppgqvhJCjBuBUkWggfigLL449kOg4r3sH46nJmwvCtTQQ
         9TlT+HXwWPNdNYCiGzsF6mYXnZ7TqjnC2xP5fzMUmQGnBVy21PfsW34jTwfFJ3AZllg+
         26K5+1cLl5QY+98gIqhBWu0GoFowDjxPjHke+cq3dLgmyVO4EBgu7qZ0coUsOd5jVaYH
         bqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RlGAzlCLtGRgz+Ob/kqgcv0i3pJhGJb9BnVRZ2vQdxY=;
        b=RoIZl2TNi/RaTPsontTvz+JkcW+VURfQQQWznhlP6z36ZC5j+X/q5dnRLYkfTBbCQq
         vDi1mk26S7n86+A+xJbKoeXqlPKodv7hNw9vb1rOOscw8wjKL8E0B1xqT4SxZWfno6UQ
         7ket1tLCkWOQlNTBo6mc+CAV3ncOwAcM2AeZH1TsIN3Fogoifb84pc1Q6HWkjEt7hamE
         XPpapw5aWSDvQKCTUVFspsG7CtdTXW10cIvuaWfP+DFm904bUQuBhgbNuqYuQB6JgiNE
         uhy7jsdGKLFIaPkdyxZeU/GTThotPb/9BRVvBpw1UYveHD7jWq/DjGJa4xuKjNZUtN8z
         P0Zw==
X-Gm-Message-State: AOAM531piecIeT8ZtDTV1ifqEp9dbIQqaA+M5QCbzMDvxE5mf/KjKpW9
        AY42UGJ3vcbNNJxPoJnFmz2kVu89Ics=
X-Google-Smtp-Source: ABdhPJxo8f66Vcme2Ih8C3bNQYCcDzCPyOW8KQ0TOY1Bj0xJaF6mdCKkBDEgyR1YH5TKQ562DzzXhg==
X-Received: by 2002:a63:6846:0:b0:3c1:9e29:fb50 with SMTP id d67-20020a636846000000b003c19e29fb50mr16777208pgc.410.1651645823627;
        Tue, 03 May 2022 23:30:23 -0700 (PDT)
Received: from localhost (subs09a-223-255-225-72.three.co.id. [223.255.225.72])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090a931200b001d98af21128sm2438543pjo.19.2022.05.03.23.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 23:30:22 -0700 (PDT)
Date:   Wed, 4 May 2022 13:30:18 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Message-ID: <YnIdepZMH2HgoTx+@debian.me>
References: <20220503063032.3680308-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503063032.3680308-1-willy@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 03, 2022 at 07:30:32AM +0100, Matthew Wilcox (Oracle) wrote:
> Closely following the outline of Mel Gorman's book "Understanding the
> Linux Virtual Memory Manager", add a new outline.  Preserve the current
> contents of the mm underneath the new outline so we can transition those
> documents to a more sensible place later.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/vm/bootmem.rst         |  5 +++++
>  Documentation/vm/index.rst           | 27 +++++++++++++++++++++++----
>  Documentation/vm/oom.rst             |  5 +++++
>  Documentation/vm/page_allocation.rst |  5 +++++
>  Documentation/vm/page_cache.rst      |  5 +++++
>  Documentation/vm/page_reclaim.rst    |  5 +++++
>  Documentation/vm/page_tables.rst     |  5 +++++
>  Documentation/vm/physical_memory.rst |  5 +++++
>  Documentation/vm/process_addrs.rst   |  5 +++++
>  Documentation/vm/shmfs.rst           |  5 +++++
>  Documentation/vm/slab.rst            |  5 +++++
>  Documentation/vm/swap.rst            |  5 +++++
>  Documentation/vm/vmalloc.rst         |  5 +++++
>  13 files changed, 83 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/vm/bootmem.rst
>  create mode 100644 Documentation/vm/oom.rst
>  create mode 100644 Documentation/vm/page_allocation.rst
>  create mode 100644 Documentation/vm/page_cache.rst
>  create mode 100644 Documentation/vm/page_reclaim.rst
>  create mode 100644 Documentation/vm/page_tables.rst
>  create mode 100644 Documentation/vm/physical_memory.rst
>  create mode 100644 Documentation/vm/process_addrs.rst
>  create mode 100644 Documentation/vm/shmfs.rst
>  create mode 100644 Documentation/vm/slab.rst
>  create mode 100644 Documentation/vm/swap.rst
>  create mode 100644 Documentation/vm/vmalloc.rst
> 

These new documents are stub, right?

-- 
An old man doll... just what I always wanted! - Clara
