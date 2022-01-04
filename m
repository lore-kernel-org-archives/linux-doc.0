Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BEEC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 23:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbiADXEq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 18:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236000AbiADXEp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 18:04:45 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13243C061784
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 15:04:45 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id u6so58566586uaq.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 15:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LGTDOKUFi7zO+d79pWO817pqCCSEiZUvdJ5m+8rvxCA=;
        b=Vq2UWrZRZ/V3IkL5xQPw4sK457GrJq/WGgnD994N8UpM5fE4ZpVWKkQjEJSUlRCC+S
         N80GiReieK9NC9xQVyvz9BhxYpwc7LWf6W4aM36q8k0Q69cY4+L2TfuN/oxwngrztnXF
         grm2OJ2nWYPzJUuXJoi/p4GKhsZup4A6WaVvS/mI2TD1KIyXvGEZgG33WSiJ6ccRLS1r
         jFxOohSEa8Jgp0MojMyyxYnPe5RJvAsOP5jXHv6Qqsrb6ENA2zOEmpT6XzjnESBDuUGP
         kDVZmzUh6zyRshn0uZqGSzMas96FCWFCWJbaEtXUxGcZ2vshAc44NreDhAWTpkUIfqvl
         c2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGTDOKUFi7zO+d79pWO817pqCCSEiZUvdJ5m+8rvxCA=;
        b=3347IHpkNDaFR7IyiVRz5z3gyzSLVn4BgYgCd5RhLg9CVV+/zjTCbllJJCh5i/GA6a
         bF0I9UOCuzZls16I2i59pqhCo7/gFvLM9ymXtzhQDoJOx96cYwIxMGAfbv2SYRWhFaJu
         JzDLiHcsW5Ry4qzPOE8PQNAPDMHUf+PXZ0RX0xL4l478yG+dRZQcdybaVkZsf2nx2cKe
         BzJBlqZE82UBpom+va1Gv1oe6w7B9xp35+pHJsaWOktV6o/0aP6AXZ599+lajZS6P8ZY
         1ZHvvz1421ST+gwkt7wTU1KxEqAZkz+j26ze/YBOcWeZzgoDVepm8+afiMCR+AN4laoO
         thwQ==
X-Gm-Message-State: AOAM532s1UwKXF1rgeg4lSSOftDJq4YyQZ3LUewEmvJnAUdmStvyR/Fk
        ObYYqMTuJPnpXs+X6y5cJolyxnvBX+v99p2SYf3PTw==
X-Google-Smtp-Source: ABdhPJzrzdQ9oZ8c9KxNThr7KVaZnd8IRIGK4zN+HrR/xQOECiyYuhQgixfNU7D+urgXsf2w6BRuPu+/B7sopDGcZBs=
X-Received: by 2002:ab0:6201:: with SMTP id m1mr13499007uao.25.1641337483580;
 Tue, 04 Jan 2022 15:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20211123000102.4052105-1-almasrymina@google.com>
 <YaMBGQGNLqPd6D6f@casper.infradead.org> <CAHS8izM5as_AmN4bSmZd1P7aSXZ86VAfXgyooZivyf7-E5gZcQ@mail.gmail.com>
In-Reply-To: <CAHS8izM5as_AmN4bSmZd1P7aSXZ86VAfXgyooZivyf7-E5gZcQ@mail.gmail.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Tue, 4 Jan 2022 15:04:31 -0800
Message-ID: <CAHS8izNw87-L=rEwJF7_9WCaAcXLn2dUe68h_SbLErJoSUDzzg@mail.gmail.com>
Subject: Re: [PATCH v7] mm: Add PM_THP_MAPPED to /proc/pid/pagemap
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>,
        "Paul E . McKenney" <paulmckrcu@fb.com>,
        Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Xu <peterx@redhat.com>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <florian.schmidt@nutanix.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 13, 2021 at 4:22 PM Mina Almasry <almasrymina@google.com> wrote:
>
> On Sat, Nov 27, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Nov 22, 2021 at 04:01:02PM -0800, Mina Almasry wrote:
> > > Add PM_THP_MAPPED MAPPING to allow userspace to detect whether a given virt
> > > address is currently mapped by a transparent huge page or not.  Example
> > > use case is a process requesting THPs from the kernel (via a huge tmpfs
> > > mount for example), for a performance critical region of memory.  The
> > > userspace may want to query whether the kernel is actually backing this
> > > memory by hugepages or not.
> >
> > But what is userspace going to _do_ differently if the kernel hasn't
> > backed the memory with huge pages?
>
> Sorry for the late reply here.
>
> My plan is to expose this information as metrics right now and:
> 1. Understand the kind of hugepage backing we're actually getting if any.
> 2. If there are drops in hugepage backing we can investigate the
> cause, whether it's due to normal memory fragmentation or some
> bug/issue.
> 3. Schedule machines for reboots to defragment the memory if the
> hugepage backing is too low.
> 4. Possibly motivate future work to improve hugepage backing if our
> numbers are too low.

Friendly ping on this. It has been reviewed by a few folks and after
Matthew had questions about the use case which I've answered in the
email above. Matthew, are you opposed to this patch?
