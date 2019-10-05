Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0B467D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sat,  5 Oct 2019 10:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfJEKMy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 5 Oct 2019 06:12:54 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37950 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfJEKMy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Oct 2019 06:12:54 -0400
Received: by mail-ot1-f41.google.com with SMTP id e11so7338244otl.5
        for <linux-doc@vger.kernel.org>; Sat, 05 Oct 2019 03:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFOCBrqNZDwM6pl40B9XkMxOq6CUdwnHiKCt7Sl+jQc=;
        b=ROLJEM3IWUFRfBFi581FXDXj/cI+jXWMRiCVo4oqUdNxxyDcxLLHMZLQ0YcpqBrB6u
         KUlHgJr+/f5lTzTwdB2B2JgngdPmmU8a4vA/K6yutWjbzHLcV7Vc5PMWHxCdodpo8Jv1
         WdU0czR3Uor9cydhW3UQOQxZPoa7+BFPyKhginQOEyRH3Tu75z3PlEHARHiVeXETpTvY
         nca3sT/fpRLTXmVacqgb+STlL0W8nX/BebaY6+737GiP+qGw+8aUxG2kQiHr50uQkU/5
         GhY4pBUHQIV285SI4FZASifcEv9R1CvuoH1YVTpad5k3FvkVk+obf7dkXUnaztM4lKJz
         nuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFOCBrqNZDwM6pl40B9XkMxOq6CUdwnHiKCt7Sl+jQc=;
        b=b5icssGXXbfJnO6ikcJOtW2fL9xLI9nkKcewFT7UBOYvktk7C7Lpx9gTtuRXwXcgkr
         0fNpP5dGKmTJkAwdLWQxTp84PtNT/x5LJ28HNZo6vvKHM1gZb4l0graHU0kHgMeg9Rwh
         QMpW5/rg/77bG7l4K0mdJlurIaYyqruYegv0LZN+7rGt8m4JUddUxWlRnsdSx+CUOQGR
         gxU7xWiw3GfweBnY6CMp7OqJvW+DLC7sXzi8gx1iM62W3lXyoRe5X/25A/h4T7GEdnxA
         Ft7u5kpXcT40KqJctI+vU/a5n5VZcVCOEoHtiyrBKXL8BTjKoNkBzSClqR6NP8htD6ju
         omdw==
X-Gm-Message-State: APjAAAUKvHoRmYo8i+EooNeR38GI4CkRyHUk2F8ZLDnbjzn9WWVsX46r
        dh1K4Kj0Lucf2UWptqSZtZNq5MdW7Km8Iw4DxK6a7eL7
X-Google-Smtp-Source: APXvYqz1VQ4AIEzazmZG0WklBEiTZb1+tjjoI27/iBUhnOoUuzK7HY+CHdNWsvuhnUaqQnmfKGo1mxnKaD4tKpuoNMQ=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr8653199otr.363.1570270373154;
 Sat, 05 Oct 2019 03:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191003124820.57a0fca8@lwn.net>
In-Reply-To: <20191003124820.57a0fca8@lwn.net>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sat, 5 Oct 2019 03:12:42 -0700
Message-ID: <CAPcyv4iKhVPd1KoMRLsMdr16F-ziPpMxV-HCFVLOgzY6EFusUg@mail.gmail.com>
Subject: Re: [PATCH] genalloc: Fix a set of docs build warnings
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 3, 2019 at 11:48 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Commit 795ee30648c7 ("lib/genalloc: introduce chunk owners") made a number
> of changes to the genalloc API and implementation but did not update the
> documentation to match, leading to these docs build warnings:
>
>   ./lib/genalloc.c:1: warning: 'gen_pool_add_virt' not found
>   ./lib/genalloc.c:1: warning: 'gen_pool_alloc' not found
>   ./lib/genalloc.c:1: warning: 'gen_pool_free' not found
>   ./lib/genalloc.c:1: warning: 'gen_pool_alloc_algo' not found
>
> Fix these by updating the docs to match new function locations and names,
> and by completing the update of one kerneldoc comment.
>
> Fixes: 795ee30648c7 ("lib/genalloc: introduce chunk owners")
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Thanks Jon. Apologies for the lack of due diligence on my part.
Changes look good to me.

Acked-by: Dan Williams <dan.j.williams@intel.com>
