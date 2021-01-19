Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0F6C4646B
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 18:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DEB322E01
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 18:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730005AbhASS32 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387927AbhASS3Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 13:29:16 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF92C0613D3
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 10:28:26 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id r9so14422664qtp.11
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 10:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ke7qD8F84c1d4EOseUsfShNOeUs7V6JI/1ybkVdZuas=;
        b=XmQ0R0kZqyfx6kYtmKEuaQdnV3pA/Gk5AOzBRpiTYl4tlHVj1r8AGgHQ4HlCBrkqJq
         d3htfUs3a6Vo7BoCaKhfTS/pKV/wBzzmfP1qsXIQg8CQxxbNzgZLm/tv7iPsO1sHRvpU
         TCZW7i1jjllBwoa546R0ibB0zkSMqcrkOGwMgnllWMEUgURDH4T3uEK++bfZv7/+4pbj
         kS8q1ESLc1z39UecPfNCeUXmJIGhwHZBA/TwP+5YpJBnaym8fbHoGkHnHv5RdAWXulup
         dtDZh1pKug65yM1CA0ASf5OqBnSDmxdk7ota2wSPE6R9R/dxgH45I+bA7mqqlvFaweeD
         jp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ke7qD8F84c1d4EOseUsfShNOeUs7V6JI/1ybkVdZuas=;
        b=EqefLUgiVGcR3GCO1BfruqnfzjztUTV6j9/+lzrj6XkEblDh2euE+XHfR3p7J5C4I8
         63zX6k702vDx9bkMrpTyttnwlVzSAY3j5NcdjMFo0YQKquM5aDE+rbacssxQ4O4MLb/V
         2enzpeDlOmTh+ImfgmiEPp+KrakKS6hpYRvIty8h0RgmcYt8Ok57CvyoOz/0HFwxIQcY
         AZQ1oTom4OFMg5QRY0nLvYCp1kq7KdOFzZuyRgOmneCk5Fx8E0N0hEMvhll7Fh9OXq95
         51BGOYj9+a0og2DTspwUcRWrB2nzRv1GmptjwsChJuYPR7Y2AXqLDBeYzZx9kVu+WaOp
         VB1w==
X-Gm-Message-State: AOAM5326I2FRldqYAJ7djuQQRx4F/49xHZhij8ykspzeIWzE8cB69gsf
        hHcu7yHSVTdWm6nlnXzp1jncCQ==
X-Google-Smtp-Source: ABdhPJzA1g7p43l6AtNResDMMVS5o5wIwQMrXjddyfwRGWf3w+KrQJOMwx++nssqWWJKy8HjuEBVXA==
X-Received: by 2002:ac8:2adb:: with SMTP id c27mr2484368qta.145.1611080906055;
        Tue, 19 Jan 2021 10:28:26 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id u5sm13640579qka.86.2021.01.19.10.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 10:28:25 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l1vjt-003pdK-4n; Tue, 19 Jan 2021 14:28:25 -0400
Date:   Tue, 19 Jan 2021 14:28:25 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com,
        david@redhat.com, osalvador@suse.de, dan.j.williams@intel.com,
        sashal@kernel.org, tyhicks@linux.microsoft.com,
        iamjoonsoo.kim@lge.com, mike.kravetz@oracle.com,
        rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
        mgorman@suse.de, willy@infradead.org, rientjes@google.com,
        jhubbard@nvidia.com, linux-doc@vger.kernel.org,
        ira.weiny@intel.com, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 03/14] mm/gup: return an error on migration failure
Message-ID: <20210119182825.GA4605@ziepe.ca>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
 <20210119043920.155044-4-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119043920.155044-4-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 18, 2021 at 11:39:09PM -0500, Pavel Tatashin wrote:
> When migration failure occurs, we still pin pages, which means
> that we may pin CMA movable pages which should never be the case.
> 
> Instead return an error without pinning pages when migration failure
> happens.
> 
> No need to retry migrating, because migrate_pages() already retries
> 10 times.
> 
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
>  mm/gup.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
