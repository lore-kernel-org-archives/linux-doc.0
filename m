Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40D5C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 12:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3CA96139A
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 12:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350141AbhESMWe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 08:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26407 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349646AbhESMWb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 08:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621426871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iT4YtjBsBt0s/M51Kj84dkt6amzmmMXBn/lNki8qQn0=;
        b=ZefcU8PzDyCvDFwxwj6QzsO4ystN8p7Rbz1oSSuV7uas2fzqrp6WVZfgPW6Ir854umfZhy
        paqU0opFyPlOAVELm69pkVbh9sT8IY092TTvnukKVUIBQ442mscH2qYAOZCeLTg7inZ3L/
        c85b4iFwLo7kN8EVMmBRrZVafAv+InU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-dEsSE0M2PcCocaGQmCGQBg-1; Wed, 19 May 2021 08:21:10 -0400
X-MC-Unique: dEsSE0M2PcCocaGQmCGQBg-1
Received: by mail-qk1-f197.google.com with SMTP id z12-20020a05620a08ccb02902ea1e4a963dso9646149qkz.13
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 05:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iT4YtjBsBt0s/M51Kj84dkt6amzmmMXBn/lNki8qQn0=;
        b=TjoYEUtxxlIlxd8idgytLVwRKAw6RP1UFZa0k9tEj4gPNVvIhB6KXg7RW2Q5jwrIP6
         tDE1Z/nUB5z/g4eWWu2S0ykYS4mu+oG971q5qxbz5yBASceRb/ZGCKJBftJiU864xP9B
         8uNdHQm+AuO4GuQnnTBUdY5W/k5OIa2sesOQyTBOP169pruZ8G/Q/XUz/2Rf8+RtkQiB
         dPGfb7zqwfQfJ11k9UWIyMt9qhv/+/qip8gB/TimtBspgpJqgQ+v7JyO2DxNXzyr6L1q
         l9/yN965tzr86woC6OXhKJ+s5bCizD0z/KxqG9taWJxBpJGZ9fWMiWhldU6DwpaA+TRs
         LLuQ==
X-Gm-Message-State: AOAM532FCsqvdLdnYCA9YgBRWKZtyBBjCjT6x0h22pC0NIFxvHsRmYxR
        GDGxFegy2Vt6tdAEMP/RW6TTqUTFkKpWZUH6I6T0/ztXI/HJKC7XcAwYPXBBfh/Uzzkq5vTH5sr
        ntHWi9dR9GF/sKMKn0V+K
X-Received: by 2002:a05:620a:818:: with SMTP id s24mr7432101qks.425.1621426869766;
        Wed, 19 May 2021 05:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym25A+8CZrSnha27nfGC/bkh618yND6m6b6Lo8EgcNF6Oma7UyN8ZK+yut+/9S1ILrFjJgwA==
X-Received: by 2002:a05:620a:818:: with SMTP id s24mr7432081qks.425.1621426869529;
        Wed, 19 May 2021 05:21:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id o10sm15018668qki.72.2021.05.19.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 05:21:09 -0700 (PDT)
Date:   Wed, 19 May 2021 08:21:08 -0400
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
Message-ID: <YKUCtA4FrfmkNrn7@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s>
 <2217153.lfGrokb94b@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2217153.lfGrokb94b@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 19, 2021 at 09:35:10PM +1000, Alistair Popple wrote:
> I think the approach you are describing is similar to what 
> migrate_vma_collect()/migrate_vma_unamp() does now and I think it could be 
> made to work. I ended up going with the GUP+unmap approach in part because 
> Christoph suggested it but primarily because it required less code especially 
> given we needed to call something to fault the page in/break COW anyway (or 
> extend what was there to call handle_mm_fault(), etc.).

I see, thank. Would you mind add a short paragraph in the commit message
talking about these two solutions and why we choose the GUP way?

-- 
Peter Xu

