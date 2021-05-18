Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C9CC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 21:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E1EF60FF0
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 21:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352404AbhERVSC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 17:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25457 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235250AbhERVSC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 17:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621372603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6yuOc2aL9R33jaIl7mlMHhqH6hbm5A0t+kn6e6OKsWE=;
        b=S7oIJY1pBUY+y3xOY9sHqrU9CfblvFEvJZJ3pV8M0MfBEz4sV2n52FW0dsscQbRePEPone
        f/FXagl3vNCkFUasOmL3/j4Tg2cil5PFtD537sMB+9DKgfl46Sl1g7QTwY5gFnUr6rPC2c
        q9QEtwR6Y8kz+cFxqUOsynomcOSJi6k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-b5zagoRHMTas5470OWPl2A-1; Tue, 18 May 2021 17:16:42 -0400
X-MC-Unique: b5zagoRHMTas5470OWPl2A-1
Received: by mail-qt1-f198.google.com with SMTP id b17-20020ac854110000b02901f279c73d75so4460670qtq.2
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 14:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6yuOc2aL9R33jaIl7mlMHhqH6hbm5A0t+kn6e6OKsWE=;
        b=gh+ziZVPrzr94TZtxIxt+fnPIMKnRnyGamk3O11HVPUqIuHNtnvuGTKrIQ+5MsVTI0
         oV24G7eelAwEIRzVHkfLKp4krXr6mwWyfEJsKlETHKEH/Yd4GT/zFHCN7WRhN2095RTE
         9e4ZrbqWDsxilCAyYlykz6pAu128FMHu1P1hn4szSbzon3tLuruRsXCHw2acA/KtlVsY
         JcpXdCTso5nhU5Y5LwhN2cpUdSH2B8OJdj4kfLdDFN5s8gZ4DB8FmUMz1Yur1MlHUfQT
         k+DjBxyS5Wj2RVJurnQNEj9IJmObwfNcb7x3iKxxgTpDnIfzsw1nIkYv/UzsklhW1r42
         BZuQ==
X-Gm-Message-State: AOAM532LFsTlv0NGJ3JNtxwiwG7o1SEi2+ghDTZeZldDzXeChPMLZ8c4
        Io7XXJmbnp3oIGg6x0qV7ndXUDfZSwHzO14rYo5HJkNb0FT8BaxmILgrx+KWDwaGy0By4U0vEuC
        OBNHxum4YzKo3F3jOCED1
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr7111163qta.172.1621372601483;
        Tue, 18 May 2021 14:16:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7CflObEdpN93nC2c9rCnQMv5qBohaNF3R0O5eiJLrnt/E6MHpUTkD6EfDzN6tiXMS/VwRag==
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr7111124qta.172.1621372601142;
        Tue, 18 May 2021 14:16:41 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id v66sm13507150qkd.113.2021.05.18.14.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 14:16:40 -0700 (PDT)
Date:   Tue, 18 May 2021 17:16:38 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, nouveau@lists.freedesktop.org,
        bskeggs@redhat.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, jhubbard@nvidia.com,
        rcampbell@nvidia.com, jglisse@redhat.com, jgg@nvidia.com,
        hch@infradead.org, daniel@ffwll.ch, willy@infradead.org,
        bsingharora@gmail.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKQutvAa3NlgGaMm@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210407084238.20443-6-apopple@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 06:42:35PM +1000, Alistair Popple wrote:

[...]

> +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> +			   unsigned long address, void *arg)
> +{
> +	struct ttp_args ttp = {
> +		.mm = mm,
> +		.address = address,
> +		.arg = arg,
> +		.valid = false,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.rmap_one = try_to_protect_one,
> +		.done = page_not_mapped,
> +		.anon_lock = page_lock_anon_vma_read,
> +		.arg = &ttp,
> +	};
> +
> +	/*
> +	 * Restrict to anonymous pages for now to avoid potential writeback
> +	 * issues.
> +	 */
> +	if (!PageAnon(page))
> +		return false;
> +
> +	/*
> +	 * During exec, a temporary VMA is setup and later moved.
> +	 * The VMA is moved under the anon_vma lock but not the
> +	 * page tables leading to a race where migration cannot
> +	 * find the migration ptes. Rather than increasing the
> +	 * locking requirements of exec(), migration skips
> +	 * temporary VMAs until after exec() completes.
> +	 */
> +	if (!PageKsm(page) && PageAnon(page))
> +		rwc.invalid_vma = invalid_migration_vma;
> +
> +	rmap_walk(page, &rwc);
> +
> +	return ttp.valid && !page_mapcount(page);
> +}

I raised a question in the other thread regarding fork():

https://lore.kernel.org/lkml/YKQjmtMo+YQGx%2FwZ@t490s/

While I suddenly noticed that we may have similar issues even if we fork()
before creating the ptes.

In that case, we may see multiple read-only ptes pointing to the same page.  We
will convert all of them into device exclusive read ptes in rmap_walk() above,
however how do we guarantee after all COW done in the parent and all the childs
processes, the device owned page will be returned to the parent?

E.g., if parent accesses the page earlier than the children processes
(actually, as long as not the last one), do_wp_page() will do COW for parent on
this page because refcount(page)>1, then the page seems to get lost to a random
child too..

To resolve all these complexity, not sure whether try_to_protect() could
enforce VM_DONTCOPY (needs madvise MADV_DONTFORK in the user app), meanwhile
make sure mapcount(page)==1 before granting the page to the device, so that
this will guarantee this mm owns this page forever, I think?  It'll simplify
fork() too as a side effect, since VM_DONTCOPY vma go away when fork.

-- 
Peter Xu

