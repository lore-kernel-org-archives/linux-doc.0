Return-Path: <SRS0=n+aG=DT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C767FC433DF
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 20:43:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77B6B208D5
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 20:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nkPnEYk/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgJLUnd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Oct 2020 16:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgJLUnd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Oct 2020 16:43:33 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC13C0613D1
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2020 13:43:33 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id p11so9321123pld.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2020 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A6mr2GZ0DBJINQQpjmdYC2+OXujmO1pjxp1POyMlL2Y=;
        b=nkPnEYk/TLpBpiZhbw9Co0vkESAqfDQdMLbvHaLr/5IjpIdqevfPju7kohqgEo7ksk
         j9P4eHXHwHse0/oE9MbGn0/vvREbCk0OI8mhvlDRWvcZK/YTrWdc7u0RFoY/0Xiq7owD
         nfZ04P9MBRZDiskcE9fB7lgt/sSthpVDBiOtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A6mr2GZ0DBJINQQpjmdYC2+OXujmO1pjxp1POyMlL2Y=;
        b=NX16S+n/9/gdRoLBffKsr97YaSW7/ZAZRVFLnR8cyD2x6fMzWmFtAVwW1V/+4iExtt
         SwIHTRkt6Q/fRBoegVexLTE6o0jPCPLmywd30mtM8ahTGZu0IUEjc3JrNRakJKkvV4x4
         n/29csX5TJxZzxPsFxdQlmdc8hc2lDFUzK1x/eO5LGvoKA1zv+ONEk2tAkK4ORTAC2yO
         A0zXulYZEvPtEcGHHIZPzWD5SUbe7qhhkx1+Q+T8FAVy5RLUOm0iK9gYes8RJuAQHVEb
         V/NQybCY067K3vCqGSVqBxBSPrSrTqThMNWAH9jCPtncnBi51Z6TpUajpl8t70zlux7X
         Wb6Q==
X-Gm-Message-State: AOAM532oDsq6MSqBShQZ4HrbvUUoWDw8XbHM/rLlNS4RsaDonxmRMViF
        Kv+jU0Oq/AIolFzN7FJ7bnv7zQ==
X-Google-Smtp-Source: ABdhPJy1Hfs3WCk1tNDDRBB108LnSHEMkiQWQrCzfTBIswhUfzDcCcfAA0yjxRQniPbRDHSo0ZL6TQ==
X-Received: by 2002:a17:902:8f82:b029:d4:bf4f:13da with SMTP id z2-20020a1709028f82b02900d4bf4f13damr16441277plo.40.1602535412935;
        Mon, 12 Oct 2020 13:43:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w5sm21123501pgf.61.2020.10.12.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 13:43:32 -0700 (PDT)
Date:   Mon, 12 Oct 2020 13:43:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christopher Lameter <cl@linux.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <guro@fb.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 2/3] mm/slub: Fix redzoning for small allocations
Message-ID: <202010121342.836D3C26CF@keescook>
References: <20201009195411.4018141-1-keescook@chromium.org>
 <20201009195411.4018141-3-keescook@chromium.org>
 <alpine.DEB.2.22.394.2010120754010.150059@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2010120754010.150059@www.lameter.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 12, 2020 at 08:01:04AM +0000, Christopher Lameter wrote:
> On Fri, 9 Oct 2020, Kees Cook wrote:
> 
> > Store the freelist pointer out of line when object_size is smaller than
> > sizeof(void *) and redzoning is enabled.
> >
> > (Note that no caches with such a size are known to exist in the kernel
> > currently.)
> 
> Ummm... The smallest allowable cache size is sizeof(void *) as I recall.
> 
> 
> mm/slab_common.c::kmem_sanity_check() checks the sizes when caches are
> created.

Ah thank you! Yes, I really thought there was a place where that
happened, but I missed it. This patch can be dropped.

-- 
Kees Cook
