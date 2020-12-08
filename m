Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29967C4361B
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 21:13:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E96FD23AFE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 21:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgLHVNr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 16:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgLHVNr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 16:13:47 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488BFC0613D6
        for <linux-doc@vger.kernel.org>; Tue,  8 Dec 2020 13:13:07 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id b26so15126034pfi.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Dec 2020 13:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O9P7Yx8VFzWCCAYZubuM8Kn2akF3BiN8tXjMtys17+Y=;
        b=L5cS/IQRJsFrNE1wrnlNkM2ax4xafyjL+6GZOGgovgRJBSpvz0hAYrBACzsPeS+Oe1
         G+lrmZaSukgwT1/7j8rHbSsWhYOQKfZMOLW5X+orEKQebaSPLNbZ90tJ7dcY8uabz+oM
         GVFBb3UPecdyX2mm3bPruW0W1wTqUaR+KaMVXJ1EdzldtzAQGhw1Zx6zioznTtzqLwNF
         ef1pnyDhD8EhyXZQhKynYBdZmx2mTBS71Zbyyz/uSIETyOTBUpce4bDId9MjFr1NrkVA
         ON5lAohMLdtifRwHLF3jJlee6nRyHc6J0jng9qRhWSk+tklg8Pxmftm4LwEu9TLd603p
         DwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O9P7Yx8VFzWCCAYZubuM8Kn2akF3BiN8tXjMtys17+Y=;
        b=VrgKedA4gziM8y955bC7jHWHg5bgB/fR25MRl6OxnvpoEU8H9NnQqTFZrw7IMr68Xv
         75GnZJy+sKs6f6E7QbKtC5qZ898q6LsJoSM8JPqvkhMdI37c4dOV9RdzILkQ3Jlu7aHq
         Nbf7EhYjUXCyzq9WcWyKLC9JBSqKKxllUIxe4mjRnIds1GMeYIQnW4K+WhiWIlH+4le6
         PnJda2EKmAI7ONhlo8jbK3aChmlitT358XP45jo6/GRWzMrfjHWc1dOzCYv9IAyJd3AK
         0kYujs9eJOguC+XpHRu1fAVPGJ/8TOQ5pBNPF55OlalCDdMOTdtQ9AQpGIUXdKJQff49
         1Iqg==
X-Gm-Message-State: AOAM531FzxhYMy6kOcK+BzBS3VagQm0T3/ENoDc6fHYcjqEstLjYLS6x
        geOxl2uvRmpQSKnpN/t8FUip8Q==
X-Google-Smtp-Source: ABdhPJwORoXXi+f1fdDVPYoHcpzT5DXgLPCXxBehn4/sdw05RKt5FVO5JcW7RGhdTE4HV0fOyvayng==
X-Received: by 2002:a63:4b22:: with SMTP id y34mr340pga.214.1607461986630;
        Tue, 08 Dec 2020 13:13:06 -0800 (PST)
Received: from google.com ([2620:15c:f:10:1ea0:b8ff:fe73:50f5])
        by smtp.gmail.com with ESMTPSA id x4sm15739367pgg.94.2020.12.08.13.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 13:13:05 -0800 (PST)
Date:   Tue, 8 Dec 2020 13:12:59 -0800
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Joerg Roedel <joro@8bytes.org>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: mmu: Fix SPTE encoding of MMIO generation upper half
Message-ID: <X8/sWzYUjuEYwCuf@google.com>
References: <156700708db2a5296c5ed7a8b9ac71f1e9765c85.1607129096.git.maciej.szmigiero@oracle.com>
 <370db207-7216-ae26-0c33-dab61e0fdaab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <370db207-7216-ae26-0c33-dab61e0fdaab@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 06, 2020, Paolo Bonzini wrote:
> On 05/12/20 01:48, Maciej S. Szmigiero wrote:
> > From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> > 
> > Commit cae7ed3c2cb0 ("KVM: x86: Refactor the MMIO SPTE generation handling")
> > cleaned up the computation of MMIO generation SPTE masks, however it
> > introduced a bug how the upper part was encoded:
> > SPTE bits 52-61 were supposed to contain bits 10-19 of the current
> > generation number, however a missing shift encoded bits 1-10 there instead
> > (mostly duplicating the lower part of the encoded generation number that
> > then consisted of bits 1-9).
> > 
> > In the meantime, the upper part was shrunk by one bit and moved by
> > subsequent commits to become an upper half of the encoded generation number
> > (bits 9-17 of bits 0-17 encoded in a SPTE).
> > 
> > In addition to the above, commit 56871d444bc4 ("KVM: x86: fix overlap between SPTE_MMIO_MASK and generation")
> > has changed the SPTE bit range assigned to encode the generation number and
> > the total number of bits encoded but did not update them in the comment
> > attached to their defines, nor in the KVM MMU doc.
> > Let's do it here, too, since it is too trivial thing to warrant a separate
> > commit.
> > 
> > Fixes: cae7ed3c2cb0 ("KVM: x86: Refactor the MMIO SPTE generation handling")
> > Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> > ---
> 
> 
> Good catch.

Indeed!  I hate this code... :-)

> What do you think about this alternative definition?  It computes everything
> from the bit ranges.

This has my vote, I was going to suggest something similar for the shifts to
minimize the magic.

> #define MMIO_SPTE_GEN_LOW_START         3
> #define MMIO_SPTE_GEN_LOW_END           11
> 
> #define MMIO_SPTE_GEN_HIGH_START        PT64_SECOND_AVAIL_BITS_SHIFT
> #define MMIO_SPTE_GEN_HIGH_END          62
> 
> #define MMIO_SPTE_GEN_LOW_MASK          GENMASK_ULL(MMIO_SPTE_GEN_LOW_END, MMIO_SPTE_GEN_LOW_START)
> #define MMIO_SPTE_GEN_HIGH_MASK         GENMASK_ULL(MMIO_SPTE_GEN_HIGH_END, MMIO_SPTE_GEN_HIGH_START)
> 
> #define MMIO_SPTE_GEN_LOW_BITS          (MMIO_SPTE_GEN_LOW_END - MMIO_SPTE_GEN_LOW_START + 1)
> #define MMIO_SPTE_GEN_HIGH_BITS         (MMIO_SPTE_GEN_HIGH_END - MMIO_SPTE_GEN_HIGH_START + 1)
> 
> #define MMIO_SPTE_GEN_LOW_SHIFT         (MMIO_SPTE_GEN_LOW_START - 0)
> #define MMIO_SPTE_GEN_HIGH_SHIFT        (MMIO_SPTE_GEN_HIGH_START - MMIO_SPTE_GEN_LOW_BITS)
> 
> #define MMIO_SPTE_GEN_MASK               GENMASK_ULL(MMIO_SPTE_GEN_LOW_BITS + MMIO_SPTE_GEN_HIGH_BITS - 1, 0)

What if we leave MMIO_SPTE_GEN_MASK as is, GENMASK_ULL(17, 0), and instead add a
BUILD_BUG_ON() to assert that it matches the above logic?  It's really easy to
get lost when reading through the chain of defines, I find the explicit mask
helps provide an anchor/reference for understand what's going on.  It'll require
an update if/when PT64_SECOND_AVAIL_BITS_SHIFT, but that's not necessarily a bad
thing, e.g. the comment above this block will also be stale.
