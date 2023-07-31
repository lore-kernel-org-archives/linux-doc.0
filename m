Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5775C001DE
	for <linux-doc@archiver.kernel.org>; Mon, 31 Jul 2023 18:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbjGaSlx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 14:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjGaSlw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 14:41:52 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BC71BDC
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 11:41:46 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b8ad8383faso41489815ad.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690828905; x=1691433705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzKrgNc3Hgfb6L/RX8dybHJyyzsATQi7i4SjIHxiTK8=;
        b=7CmjFV1AnDhI5/M/zhmaHF0OK5FILWZwEsPQMMPRI1N/5srP4kRwYl9EVyA+PQRTxR
         wdCBabvdpIBKzyDf2xmONsWDRuQEwIdfV40ukehPJmCyhYzdIvlOAtziYwjk1RFCM0Tx
         KGLnNFM3/ZgtwiPvsBLVIDq+NZZQ9kmy5PYqkfK4Hq9Hzer0sdUt2uyguZeCFNF0fhRY
         Y7tBM4qVazWjcCOljhKYo1kRr54WhgP0dje/dBW62YaGwnJZiO1snkAhvv3k5GJ5sGGq
         NQCZwdLa0FwTJGGzoRTeas9eVlZz2m3XYENibpI44ySOvYTHAH9Dw3ZHvtIOKITijG1Q
         30lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690828905; x=1691433705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzKrgNc3Hgfb6L/RX8dybHJyyzsATQi7i4SjIHxiTK8=;
        b=EDxsmQn1AVnCj2mWRU6gLMoteErZl+6nPBNLAXl/+1B7gQ9s4dmxj1k6XggJxLI7mO
         /BD6mR7CoB8A4eAcTQNaNcEgBEfAwXHXAuMEx8UhFDbFFmft5JNXcsFd6Bezp+FEtjQR
         88lrBWJgwCX8j5S+A89kukLYli6aK5cREgh3LD2C7eFwiMV2Y9wtVz2iJM9nx39ChwWC
         yVyRHnuvZIElnwOjXnLu4o8Sk8E+iFWLy9H2b97RXJSl0bcwlep820zloyYT1f8KcmuJ
         /KLQDsS051eR58UK947v8k0yAhvL4XrZlz+afVwIPNHe7Xiv/KOvUHXG0vcblL3srrOw
         DBOQ==
X-Gm-Message-State: ABy/qLZUqxR38kDmQ/m91D8xL/yNIHDxoARxsX1MqS8EEgUQhRux5g6E
        YbR/cluXG5Fx//63HiVh2UVSAA==
X-Google-Smtp-Source: APBJJlFVjWHSuD4tos4pR8R7r78yUcI/3HXwP0KaLwM7yCHHX/hfQay4mYqlBvT31cj6LhxC/POSvg==
X-Received: by 2002:a17:902:b20b:b0:1b8:7e53:70f with SMTP id t11-20020a170902b20b00b001b87e53070fmr9118625plr.27.1690828905345;
        Mon, 31 Jul 2023 11:41:45 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902f7ca00b001bbb1eec92dsm8924742plw.224.2023.07.31.11.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 11:41:44 -0700 (PDT)
Date:   Mon, 31 Jul 2023 18:41:40 +0000
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>
Subject: Re: [PATCH v2 4/6] KVM: Documentation: Add the missing description
 for tdp_mmu_root_count into kvm_mmu_page
Message-ID: <ZMgAZMp148BRrazJ@google.com>
References: <20230626182016.4127366-1-mizhang@google.com>
 <20230626182016.4127366-5-mizhang@google.com>
 <ZJsFKjbaCKk+fFkv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJsFKjbaCKk+fFkv@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 27, 2023, Sean Christopherson wrote:
> On Mon, Jun 26, 2023, Mingwei Zhang wrote:
> > Add the description of tdp_mmu_root_count into kvm_mmu_page description.
> > tdp_mmu_root_count is an atomic counter used only in TDP MMU. Its usage and
> > meaning is slightly different with root_counter in shadow MMU. Update the
> > doc.
> > 
> > Signed-off-by: Mingwei Zhang <mizhang@google.com>
> > ---
> >  Documentation/virt/kvm/x86/mmu.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
> > index 5cd6cd5e8926..97d695207e11 100644
> > --- a/Documentation/virt/kvm/x86/mmu.rst
> > +++ b/Documentation/virt/kvm/x86/mmu.rst
> > @@ -231,6 +231,11 @@ Shadow pages contain the following information:
> >      A counter keeping track of how many hardware registers (guest cr3 or
> >      pdptrs) are now pointing at the page.  While this counter is nonzero, the
> >      page cannot be destroyed.  See role.invalid.
> > +  tdp_mmu_root_count:
> > +    An atomic reference counter in TDP MMU root page that allows for parallel
> > +    accesses.
> 
> I find the "parallel accesses" simultaneously redundant and confusing.  The fact
> that's it's an atomic implies that there are concurrent accesses.  And need for
> an atomic is really just a minor note, i.e. shouldn't be the focus of the
> documentation.
> 
> On a related topic, the description for "root_count" is stale now that KVM keeps
> references to roots.
> 
> What if we take this opportunity to unify the documentation?
> 
>   root_count / tdp_mmu_rount_count:
> 
>      A reference counter for root shadow pages.  vCPUs elevate the refcount when
>      getting a shadow page that will be used as a root, i.e. will be loaded into
>      hardware directly (CR3, PDPTRs, nCR3 EPTP).  Root pages cannnot be freed
>      while their refcount is non-zero.  The TDP MMU uses an atomic refcount as
>      vCPUs can acquire references while holding mmu_lock for read.  See
>      role.invalid and Root Pages.

Ok, I think this one is reasonable and this clarifies that this field
only works for root pages.
> 
> And then add a section specifically for root pages?  I think trying to cram
> everything important about root pages into the description for their refcount
> will be difficult and kludgy.  E.g. this doc should also provide an explanation of
> previous roots.
> 
> Root Pages
> ==========
> 
> Key talking points:
> 
>   - Definition of a root page
>   - Lifecycle of roots for both the shadow MMU and TDP MMU
>   - Previous root tracking, and why only KVM doesn'y track previous roots when
>     using PAE paging
>   - The importance of preserving roots that are currently not referenced by any
>     vCPU, i.e. why TDP MMU roots are initialized with a refcount of '2'
>   - Why shadow MMU roots don't gift a reference to the MMU itself, i.e. why they
>     naturally survive their refcount going to zero
> 

I am not sure if I can add the whole section in this commit. Maybe
I can push it back separately into a different series. For root_count, a
brief introduction of root pages should be good enough, which is explain
in your suggestion: page that "will be loaded into hardware directly
(CR3, PDPTRs, nCR3 EPTP)".
> 
> >   Accessing the page requires lifting the counter value. The
> > +    initial value is set to 2 indicating one reference from vCPU and one
> > +    from TDP MMU itself. Note this field is a union with root_count.
> >    parent_ptes:
> >      The reverse mapping for the pte/ptes pointing at this page's spt. If
> >      parent_ptes bit 0 is zero, only one spte points at this page and
> > -- 
> > 2.41.0.162.gfafddb0af9-goog
> > 
