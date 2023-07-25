Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2110C0015E
	for <linux-doc@archiver.kernel.org>; Tue, 25 Jul 2023 06:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjGYGbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Jul 2023 02:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjGYGbm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jul 2023 02:31:42 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA0618F
        for <linux-doc@vger.kernel.org>; Mon, 24 Jul 2023 23:31:41 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d16889b3e93so701473276.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Jul 2023 23:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690266700; x=1690871500;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrj98RVsYDkN3I+mRutJXnGpYUzzBqioSCRH0Vn7DU4=;
        b=TY2YDXA+R3gSuz6cU667d4nfNItMjC0n6W1CkTqCG/q78IeOWkvZj329AN9s4Rt05g
         uR038QrbwLZ91o45WUPaU0IJZUPVzhumEvfiZOM111V+x1fGs6npU6622bwy64H/dwLi
         Oaoc3wR+eCWc4erhlak+tGSnMDqH6Yxa8OiHT9Ujx+q9AGbkyLnju6+igXlHkmYqy5pC
         MZaNmL1o/UnPBlqxb8UFKV+pCrgp9nHpXb0YdhbB3vw8lGW5iWrxReFVKhb9CSIsPzGD
         qu7pMYkrBOfCRMJP2GEncl274r688aMrenu0hjvb5Hc2T+y3Px4Rynom7QfQEd5e5b2U
         /njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690266700; x=1690871500;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrj98RVsYDkN3I+mRutJXnGpYUzzBqioSCRH0Vn7DU4=;
        b=TJBe/7xLwMQ375trPcOpCZt6b4lupYd62wSnXXq+OhbzWYMOcmheR6mQzwmo/UAU5Z
         QIeiBa4JsPR7RpbcVwgtHoy7mRuJpPBFd+CXVNV3i1ZqOe5EqoUCW3y3yFTQ0W4dQuMN
         dbh3VT54R/AiQetUtC/YuQ1DZqAekMbAHCjwWPMpE27jieSfB6k/sGrLa8SCLVX+025h
         SdnXWOWfIMsKt/Sr0n8Fh1Y91GoERDAHVz7yS+GCtms7mmtc+iLhTszvCUyHE2Li7Ib/
         BgQ/v8FXxAKY9NeSsGXQOIIbtMu0W9qjS1gpifJPkbaHYfyhQYIoQw6rzR2UBgqD1rBC
         sgwQ==
X-Gm-Message-State: ABy/qLYuTV+wePV2DrR3GBGmZKy59uHU1Jv6f25JWbkRdlSGFsnI3YAR
        btguHABO1ylrGHE/0TMHTEFdMg==
X-Google-Smtp-Source: APBJJlHSZGwBYUc/vfdJDHS6kXY/0v8KCebzo6RyCN6zn9jLR2ocm9Dr30nN2c2wcFKECAMdhTP8sg==
X-Received: by 2002:a0d:ef42:0:b0:583:9018:29ec with SMTP id y63-20020a0def42000000b00583901829ecmr10318516ywe.32.1690266700276;
        Mon, 24 Jul 2023 23:31:40 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l188-20020a0dfbc5000000b00576c534115bsm3367972ywf.34.2023.07.24.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 23:31:39 -0700 (PDT)
Date:   Mon, 24 Jul 2023 23:31:31 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] tmpfs: fixup Docs table for huge mount options
In-Reply-To: <20230725052333.26857-1-rdunlap@infradead.org>
Message-ID: <329bd13b-8970-ce41-1068-2928d4dd7b24@google.com>
References: <20230725052333.26857-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Jul 2023, Randy Dunlap wrote:

> A table's header and footer lines must match its text columns in
> width, so extend the header/footer for column 1 to match the text.
> 
> Fixes this documentation build error:
> Documentation/filesystems/tmpfs.rst:116: ERROR: Malformed table.
> Text in column margin in table line 4.
> 
> Fixes: a0ebb5aa2de3 ("tmpfs: fix Documentation of noswap and huge mount options")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/lkml/3084e97c-3a7d-ace8-2e9c-31642fd663df@google.com/T/#me28ed2124bca2e632eee86ff1d986e5c1f731a7c
> Cc: Hugh Dickins <hughd@google.com>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
> I guess that Andrew will merge this since he merged the previous patch.

Acked-by: Hugh Dickins <hughd@google.com>

Many thanks, Randy: your rapid rescue service is much appreciated.

> 
>  Documentation/filesystems/tmpfs.rst |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff -- a/Documentation/filesystems/tmpfs.rst b/Documentation/filesystems/tmpfs.rst
> --- a/Documentation/filesystems/tmpfs.rst
> +++ b/Documentation/filesystems/tmpfs.rst
> @@ -110,13 +110,13 @@ configured with CONFIG_TRANSPARENT_HUGEP
>  your system (has_transparent_hugepage(), which is architecture specific).
>  The mount options for this are:
>  
> -===========  ==============================================================
> -huge=never   Do not allocate huge pages.  This is the default.
> -huge=always  Attempt to allocate huge page every time a new page is needed.
> +================ ==============================================================
> +huge=never       Do not allocate huge pages.  This is the default.
> +huge=always      Attempt to allocate huge page every time a new page is needed.
>  huge=within_size Only allocate huge page if it will be fully within i_size.
> -             Also respect madvise(2) hints.
> -huge=advise  Only allocate huge page if requested with madvise(2).
> -===========  ==============================================================
> +                 Also respect madvise(2) hints.
> +huge=advise      Only allocate huge page if requested with madvise(2).
> +================ ==============================================================
>  
>  See also Documentation/admin-guide/mm/transhuge.rst, which describes the
>  sysfs file /sys/kernel/mm/transparent_hugepage/shmem_enabled: which can
