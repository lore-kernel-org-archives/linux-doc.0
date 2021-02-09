Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBC5C433DB
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 10:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E8A064E9A
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 10:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhBIKaK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 05:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbhBIK16 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 05:27:58 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCA5C06178A
        for <linux-doc@vger.kernel.org>; Tue,  9 Feb 2021 02:27:18 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id v193so13429843oie.8
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuPwe6UnW2D70azMPi7ooQm/qzJFfsCFKJ5pbRf3Rag=;
        b=fjNiIqJN11AmOAs1Pa1q8noSSurhramxPWrN+UmCUCz19mWIDz3e7u/5LlRSNHdThF
         3SEZ7MSpAtz9+pzxH2o0Dx3sbAmj0oYCQwbWPReA/QOLUf+HZ5ccnMsn7DBtkieJMPzL
         BA++OnfY3vQP93lMntxdlYu6pI2Pqm/Q0zTQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuPwe6UnW2D70azMPi7ooQm/qzJFfsCFKJ5pbRf3Rag=;
        b=gODoXXFhqXdfF6HLrVniemAlpHLtcYo8rpv92RypDS69IqZTr4/7VpSqi3Ga5hCJaW
         A2vTUuxN0DSsxIKwkDAanGbA+rh4YMmX20xLNjB3aKxpSxuUke5Z/G5s2O46x9B1TH2b
         pZPAqKZjBXFvtt/d/FFM/NtqULlDC2hGAH96eLYU3wor1EVXLlkvf7VDNRuwABouznth
         2B71Y+Rpm066tcOQ/Jm2VuMg4xOoMvwjaFA3qZP7ubd6FUCSzyPFt8iQknhfImt3fwdQ
         3z1L3dFdei5CsX4gIruumcdDkYCoCrY6JWg4Jev/oYnmkQKqwK4yCQkF6VBK/+hVkAlp
         1cBQ==
X-Gm-Message-State: AOAM530BkczOGFP7qePYToUKJkP0gGU4kp0t10ALCc+DpAaF9X9qucz5
        Rvjt8GfWIU45NWFXFm3jeaQS2JtFf38++Yn9DlKusoypjqjHZw==
X-Google-Smtp-Source: ABdhPJyir5D67fhPcTVsC/9F/To+q3sh8YkD1lFXu3j/zAvynT6ofUoVqy6egtyN+Ya2IAdtuesS+PnTgi+/Evagt+A=
X-Received: by 2002:aca:1906:: with SMTP id l6mr1967569oii.101.1612866437717;
 Tue, 09 Feb 2021 02:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20210209010722.13839-1-apopple@nvidia.com>
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 9 Feb 2021 11:27:05 +0100
Message-ID: <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
To:     Alistair Popple <apopple@nvidia.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kvm-ppc@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 09, 2021 at 12:07:13PM +1100, Alistair Popple wrote:
> This series adds support to Nouveau for atomic memory operations on OpenCL
> shared virtual memory (SVM). This is achieved using the atomic PTE bits on
> the GPU to only permit atomic operations to system memory when a page is
> not mapped in userspace on the CPU.
>
> This is implemented by adding a mode to migrate_vma_pages() which unmaps
> and isolates existing pages from the CPU and pins them. The original
> userspace page table entries are migrated to point to device private pages
> allocated by the driver. This allows the driver to enable GPU atomic access
> to the page as it will receive a callback when CPU userspace needs to
> access it.
>
> In response to this callback the driver revokes the atomic access
> permission from the GPU and migrates entries to point back to the original
> page. The original page is unpinned as part of the migration operation
> which also returns it to the LRU.
>
> Patch 3 contains the bulk of the memory management changes to implement
> unmap and pin.
>
> Patches 6-9 extend Nouveau to use the new mode to allow system wide atomics
> for OpenCL SVM to be implemented on Nouveau.
>
> This has been tested using the latest upstream Mesa userspace with a simple
> OpenCL test program which checks the results of atomic GPU operations on a
> buffer whilst also writing to the same buffer from the CPU.
>
> Problems yet to be addressed:
>
> Recent changes to pin_user_pages() prevent the creation of pinned pages in
> ZONE_MOVABLE. This series allows pinned pages to be created in ZONE_MOVABLE
> as attempts to migrate may fail which would be fatal to userspace.
>
> In this case migration of the pinned page is unnecessary as the page can be
> unpinned at anytime by having the driver revoke atomic permission as it
> does for the migrate_to_ram() callback. However a method of calling this
> when memory needs to be moved has yet to be resolved so any discussion is
> welcome.

Why do we need to pin for gpu atomics? You still have the callback for
cpu faults, so you
can move the page as needed, and hence a long-term pin sounds like the
wrong approach.

That would avoid all the hacking around long term pin constraints, because
for real unmoveable long term pinned memory we really want to have all
these checks. So I think we might be missing some other callbacks to be
able to move these pages, instead of abusing longterm pins for lack of
better tools.

Cheers, Daniel



>
> Alistair Popple (9):
>   mm/migrate.c: Always allow device private pages to migrate
>   mm/migrate.c: Allow pfn flags to be passed to migrate_vma_setup()
>   mm/migrate: Add a unmap and pin migration mode
>   Documentation: Add unmap and pin to HMM
>   hmm-tests: Add test for unmap and pin
>   nouveau/dmem: Only map migrating pages
>   nouveau/svm: Refactor nouveau_range_fault
>   nouveau/dmem: Add support for multiple page types
>   nouveau/svm: Implement atomic SVM access
>
>  Documentation/vm/hmm.rst                      |  22 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c            |   4 +-
>  drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
>  drivers/gpu/drm/nouveau/nouveau_dmem.c        | 190 +++++++++++++++---
>  drivers/gpu/drm/nouveau/nouveau_dmem.h        |   9 +
>  drivers/gpu/drm/nouveau/nouveau_svm.c         | 148 +++++++++++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
>  include/linux/migrate.h                       |   2 +
>  include/linux/migrate_mode.h                  |   1 +
>  lib/test_hmm.c                                | 109 ++++++++--
>  lib/test_hmm_uapi.h                           |   1 +
>  mm/migrate.c                                  |  82 +++++---
>  tools/testing/selftests/vm/hmm-tests.c        |  49 +++++
>  14 files changed, 524 insertions(+), 101 deletions(-)
>
> --
> 2.20.1
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
