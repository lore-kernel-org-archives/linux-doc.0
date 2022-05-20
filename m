Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1DEC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 20 May 2022 01:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344589AbiETBuD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 21:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbiETBuC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 21:50:02 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EDAD682D
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 18:50:00 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id a23-20020a17090acb9700b001df4e9f4870so6714247pju.1
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 18:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bSYkUjPvAsu074e/VjNGWfjNftItgD9OU7BKxmchNu0=;
        b=IctWEQwULe+HOgPbU7d0NJ3bNOOh3R/ed9A6ET0Gs/piG+Bes/Utvzo/JOuyGD8RRU
         RcDWQ8n8fK3gVNdg7zOFFUdQGbLx/Yeu4mzOrLYeaNU76aARYW0jjqtvRRXuDmBVfrna
         g7qU8icOdLj7kU6hSvSdtAKN4mYIBgh28Dejc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bSYkUjPvAsu074e/VjNGWfjNftItgD9OU7BKxmchNu0=;
        b=amc7hEOMIZZpXjYrqdYBtpoyT1QeuYwtFzzyHzmyBnKdyVul6bt6Y3wMIdMa0b4uGA
         6tw2K07Bh0Akc/WmjbHOUBZuAcdUbeVaR2izCYYiNN7bgtG/buvV6dFVlmXLTU/Qs2Br
         Awdct3qX6F0N/MFhExskVX8A7iU1ZwNPV0Rz+kQb5NqlxSoHH4BR94j5ghykAdKZj3o7
         KoCg4KJ4eYldWwGl+ovOLxJpok4CCixk0/TGPB43/dKCcmDsEJN9e8KGOO1Qz800ddE1
         fcfkqP46o0Op9nmlnQJJrb1e2T04AMSgtJXftLh5lQ9j+/Nkahekic7GP0E5IIaE2QDl
         Uv0A==
X-Gm-Message-State: AOAM530wrhWJV/U4TzLq3G92dTyKFgfmFKI5/pQ5/YPJvLzDEXpllbf3
        iVnkmnMARwHy+Fw06XVM4sSELQ==
X-Google-Smtp-Source: ABdhPJxYCaKfJrQpyhnMwy4bw/c5zkQ+q174lh8wbUasjk9l4ZAUxrQCXZ8SzukBnlB3+yq5G+ayIg==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id s7-20020a170902988700b001516e1c7082mr7427960plp.162.1653011400364;
        Thu, 19 May 2022 18:50:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23-20020a056a001d1700b0050dc76281ddsm329776pfx.183.2022.05.19.18.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 18:50:00 -0700 (PDT)
Date:   Thu, 19 May 2022 18:49:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     ilkos@google.com, tjmercier@google.com, surenb@google.com,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
        Mike Rapoport <rppt@kernel.org>,
        Colin Cross <ccross@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
Message-ID: <202205191848.DEE05F6@keescook>
References: <20220519214021.3572840-1-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519214021.3572840-1-kaleshsingh@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 19, 2022 at 02:40:15PM -0700, Kalesh Singh wrote:
> [...]
> +	seq_file_path(m, file, "\n");
> +	seq_putc(m, '\n');
>  
>  	/* show_fd_locks() never deferences files so a stale value is safe */
>  	show_fd_locks(m, file, files);

This comment implies "file" might be stale? Does that mean anything for
the above seq_file_path()?

-- 
Kees Cook
