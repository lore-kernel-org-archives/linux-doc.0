Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAFFC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  6 May 2022 21:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377509AbiEFVPY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 May 2022 17:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbiEFVPX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 May 2022 17:15:23 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179D06EC7B
        for <linux-doc@vger.kernel.org>; Fri,  6 May 2022 14:11:39 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id kl21so6269375qvb.9
        for <linux-doc@vger.kernel.org>; Fri, 06 May 2022 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mDV8DfRAfy7rdHB2lGgr61RBfkcSTbKg06tN5HiDgPY=;
        b=LgdPRxHNHfL4LGiCf4uxJj/T2UPUONvsuIV8YvPds2oE0fdnlSIArMrIEjMx3AibuE
         70d76Rxvz++8IHAIwY0QTJW93xAp3wtIN9o6gNIQ2+Uxb26OmkT9QvS92mIV6eceEwWm
         H3nDI+bbGjH+w8qe9o+45hjNb8TEKABN1Rd5UbvOrEoXtbtXMiuQhx4LkhPH1R8p+zvK
         nqbGEnMdaxAU82UkiksTFe275NUJLyHI+7TfwrSVYSVfu5YdA0ac05ZwXhBtL9am/wOf
         4OubWfazMLl3/upH39Crr5v0cKvfdVHxHLwIupse2AtJ9i7S5m3QV7k+QWhm911nN3Kj
         rWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mDV8DfRAfy7rdHB2lGgr61RBfkcSTbKg06tN5HiDgPY=;
        b=DRStQjPLvU7y8/DsuI6NN2jEQOfQE5Y+9nvFkLczYTrZcVditEUDNi/6C5u2RDDU9G
         tP/qq1ptkmsSs4qAKXjdVYQnA/qKVoqYz2WVBlmHl4UnjxBgrmh6FMC6j3pcAve3oWqe
         YMAHqjlS9vsTWN72NhOq5a/UOEfsiisNWKp//rN249FCJ7CB2t9D/vU3dsfsEm9v4+xu
         4aaqP3vj4M7R8TqNZdMt/j2y34KTpCPHXYNF/HujvVqMIJB5OJB6KO+2BV1hGqZEBT5T
         Z/Ypr/+EpjJaMDFEGfJ+GegoQX6AKWlFGgdAmuY+gUGZkhZ7f9V71nGWMWtOvt8Tq4Nt
         augQ==
X-Gm-Message-State: AOAM530NO110JNiNiWgFG2KDPyYtrUjg23AR0qMv+WwsoW9iPhyX6Ktr
        pTAecsIfj9kS/5SPduUdTb8pY0h1BLmUjA==
X-Google-Smtp-Source: ABdhPJwv3MfrFWDQdfinKjk+57JhKPepoa+NdvBQRayOjalvLwaPsqOXoq2YAJwM9ta9VeRLaQ9tqQ==
X-Received: by 2002:a05:6214:508f:b0:45a:bab4:c7dd with SMTP id kk15-20020a056214508f00b0045abab4c7ddmr4003986qvb.34.1651871498193;
        Fri, 06 May 2022 14:11:38 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:538c])
        by smtp.gmail.com with ESMTPSA id 2-20020a370a02000000b0069fc13ce243sm2783765qkk.116.2022.05.06.14.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:11:37 -0700 (PDT)
Date:   Fri, 6 May 2022 17:10:42 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Message-ID: <YnWO0gNbjzucDyCe@cmpxchg.org>
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

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
