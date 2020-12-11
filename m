Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E706AC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2AB322B47
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394507AbgLKUYs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394467AbgLKUYh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:24:37 -0500
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA82EC061793
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:23:56 -0800 (PST)
Received: by mail-qt1-x842.google.com with SMTP id a6so7414334qtw.6
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ELqdRXlB+MjwvvNKBuEm7rQwzLSIQMH5YM/Dpnj0Am0=;
        b=BxCjNUzeRilpLNFa++B1NsYrYbCN9twqCH3qY3QELZYysTlTjgXGfyhr447n9wmYfO
         5aaPIRP7vqa3uynlTB2ZW9HaNgMq/linzUslEIxqMf8IhIwA7rXgncZ7ENiyoJu2c1w0
         K8Q+HjqPk4VjfOvFV0RfQcgntEggt9NeEYdn9EH96zhyjMygI3vlV+9PWsTyIHCWJj4j
         n4I+4Rq6P4/92l064bPU7e+VARtuNHVCE8dt8Biwr3NZtrCka9wwZ5EhrzePVhMqSbg9
         CtvRX98LxYchtQNkYXxces3ryzg325UrqmKpOz+2+N+/RQ1uuB9YcH/b6WRZYqSYcCFI
         dx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ELqdRXlB+MjwvvNKBuEm7rQwzLSIQMH5YM/Dpnj0Am0=;
        b=ISMdLjJddJKijUHR/8AqRpGme5CVBMu+OPhVfIcboPhSvs37GSzNNV3TAuP8ZM19bt
         fOZHTl/9AacBbuU6e3AaYC2uO4RVMFQm5aW774+VVF0BGTmSxZQGcWtxV3UPPhySN7GV
         rwoCzsdMl2os6R20e0523NRzBRJ+HC+DG0r9/oV0dKqrx05wteyv7j9EssZG78c3bIs3
         8w/x9U5w+NTC/GTjPNTGQq2UDCWta60O2qiAqfu+xdXX2ZYeFC4gDWUuT543OV0S99sX
         TiZxsVxGzT2hDh+KpN0yF7/zmjnr/uIzX563coKxZlRejfuIxQepwdDtMxkN5L9BvHeD
         /p0A==
X-Gm-Message-State: AOAM531ESQXhJ/W9KsJBoGdEpJgof8HwcY2hjVS5XrO+CW5vwgXPOIPi
        jPUAZyt8ijZO+u07ftgUcfNyHw==
X-Google-Smtp-Source: ABdhPJy9rue36Wb0wJHhBUETw/119DrBaQGbguszUb9eoNfHAzOrBGwR8fu58hiomMY5ZuNPWOmxWw==
X-Received: by 2002:ac8:3ac5:: with SMTP id x63mr17550095qte.376.1607718235945;
        Fri, 11 Dec 2020 12:23:55 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id 187sm8409820qki.38.2020.12.11.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:23:55 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1knoxG-009L1i-FW; Fri, 11 Dec 2020 16:23:54 -0400
Date:   Fri, 11 Dec 2020 16:23:54 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, vbabka@suse.cz, mhocko@suse.com,
        david@redhat.com, osalvador@suse.de, dan.j.williams@intel.com,
        sashal@kernel.org, tyhicks@linux.microsoft.com,
        iamjoonsoo.kim@lge.com, mike.kravetz@oracle.com,
        rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org,
        mgorman@suse.de, willy@infradead.org, rientjes@google.com,
        jhubbard@nvidia.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
Message-ID: <20201211202354.GA2225686@ziepe.ca>
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-6-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211202140.396852-6-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 11, 2020 at 03:21:39PM -0500, Pavel Tatashin wrote:
> @@ -1593,7 +1592,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
>  				}
>  
>  				if (!isolate_lru_page(head)) {
> -					list_add_tail(&head->lru, &cma_page_list);
> +					list_add_tail(&head->lru, &movable_page_list);
>  					mod_node_page_state(page_pgdat(head),
>  							    NR_ISOLATED_ANON +
>  							    page_is_file_lru(head),
> @@ -1605,7 +1604,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
>  		i += step;
>  	}
>  
> -	if (!list_empty(&cma_page_list)) {
> +	if (!list_empty(&movable_page_list)) {

You didn't answer my earlier question, is it OK that ZONE_MOVABLE
pages leak out here if ioslate_lru_page() fails but the
moval_page_list is empty? 

I think the answer is no, right?

Jason
