Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5151EE3F09
	for <linux-doc@archiver.kernel.org>; Tue, 12 Sep 2023 18:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237378AbjILSYM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Sep 2023 14:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237362AbjILSYK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Sep 2023 14:24:10 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F176E10EF
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 11:24:06 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-573c62b3cd2so4370021a12.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694543046; x=1695147846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8/1D1hlKrwxGhPYu7s8FW0yjX/NvlYAKUyveN+rZHg=;
        b=RoDfTMpdGYQOL3qxsM/UQYJdoVepEmmHsBXKTD8a12xDCSBeBz0M0t8fZlfFUm3Kdv
         87RxsOHwjEmPO0JUqLr3/wfdXi73kVHbmoqDQ7ZCwg1WRfUqlitl63X3ZgCTwo9Xh9U8
         MVRh3AdeOk7O4mqiwzXX3dDQHYsgVkGz+ExyA6aDNgy4X0a3yEW1lSamfCWt4vXbkq1g
         m1tgZafo/dsa5rtlUjNjUAxHvd9T6Ivs9hLQLX6PLs+l7rCOsEegWhyEz8vyjL5397UE
         eIcs6R9SbM5lmj4HjgFHhTscHIrsHOVvxv7j1BRvPr7YjldRj/ZYKpnXa4tXL9WhYQqv
         yiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694543046; x=1695147846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8/1D1hlKrwxGhPYu7s8FW0yjX/NvlYAKUyveN+rZHg=;
        b=RId8mMslKXH2BbBE67/VR9YrYq+mFnRfT4oxI9t1zSB5hjUTagg98BfaexRPh8jMZ7
         TYo7ZMArT4MAjkK8dKxnl6EoUJsz0ZkS1CxF8N+ITF0TRDCODIe380mECxEo7FgGwqWz
         w3Q1gYfNgeyAcgeJmS6jWic6iQZ75hJ4IRidWvvsNqjDUfo8vvWeWAXuFxHQ+AaVzZBH
         B/nbeeFa6XYdyDetKKdqJOSTmYerMMFwkbIRn0czAdVlfwjOyxjsu8GlAE2IZ6T8Z0Cx
         i0y13879/X2Lki5vgdZtOLyV8L2jQB/2/BAWckV3kCF+saEoXfMH8u1EzL0ge565V+8v
         In0g==
X-Gm-Message-State: AOJu0Yy6AC4bGMVbhz0VDP/jeH7cue+drc6sO5ObHAuA4Zl3YJRGfQwR
        chvVieYP8PJtGYmDQ0nIyfckYg==
X-Google-Smtp-Source: AGHT+IG9chD/RkZ8OOUzGsLf726oa5VFCPJ0BaZ+qbex436wuU+iD6QMGqbR6s+8Yxvxt+tedk1NWA==
X-Received: by 2002:a05:6a21:47cb:b0:153:6e99:edbb with SMTP id as11-20020a056a2147cb00b001536e99edbbmr225106pzc.31.1694543046299;
        Tue, 12 Sep 2023 11:24:06 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id bt10-20020a056a00438a00b006875df4773fsm3989174pfb.163.2023.09.12.11.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:24:05 -0700 (PDT)
Date:   Tue, 12 Sep 2023 18:24:01 +0000
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 4/6] KVM: Documentation: Add the missing description
 for tdp_mmu_root_count into kvm_mmu_page
Message-ID: <ZQCswf8EWAGy8QZI@google.com>
References: <20230801002127.534020-1-mizhang@google.com>
 <20230801002127.534020-5-mizhang@google.com>
 <ZN1R31uo4FGQfKrQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN1R31uo4FGQfKrQ@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 16, 2023, Sean Christopherson wrote:
> On Tue, Aug 01, 2023, Mingwei Zhang wrote:
> > Add the description of tdp_mmu_root_count into kvm_mmu_page description and
> > combine it with the description of root_count. tdp_mmu_root_count is an
> > atomic counter used only in TDP MMU. Update the doc.
> > 
> > Signed-off-by: Mingwei Zhang <mizhang@google.com>
> > Reviewed-by: Kai Huang <kai.huang@intel.com>
> > ---
> >  Documentation/virt/kvm/x86/mmu.rst | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
> > index 17d90974204e..40daf8beb9b1 100644
> > --- a/Documentation/virt/kvm/x86/mmu.rst
> > +++ b/Documentation/virt/kvm/x86/mmu.rst
> > @@ -229,10 +229,14 @@ Shadow pages contain the following information:
> >      can be calculated from the gfn field when used.  In addition, when
> >      role.direct is set, KVM does not track access permission for each of the
> >      gfn. See role.direct and gfn.
> > -  root_count:
> > -    A counter keeping track of how many hardware registers (guest cr3 or
> > -    pdptrs) are now pointing at the page.  While this counter is nonzero, the
> > -    page cannot be destroyed.  See role.invalid.
> > +  root_count / tdp_mmu_root_count:
> > +     root_count is a reference counter for root shadow pages in Shadow MMU.
> > +     vCPUs elevate the refcount when getting a shadow page that will be used as
> > +     a root page, i.e. page that will be loaded into hardware directly (CR3,
> > +     PDPTRs, nCR3 EPTP). Root pages cannot be destroyed while their refcount is
> > +     non-zero. See role.invalid. tdp_mmu_root_count is similar but exclusively
> > +     used in TDP MMU as an atomic refcount. When the value is non-zero, it
> > +     allows vCPUs acquire references while holding mmu_lock for read.
> 
> That last sentence is wrong.  *vCPUs* can't acquire references while holding
> mmu_lock for read.  And actually, they don't ever put references while holding
> for read either.  vCPUs *must* hold mmu_lock for write to obtain a new root,
> Not putting references while holding mmu_lock for read is mostly an implementation
> quirk.
> 
> Maybe replace it with this?
> 
>     tdp_mmu_root_count is similar but exclusively used in the TDP MMU as an
>     atomic refcount (select TDP MMU flows walk all roots while holding mmu_lock
>     for read, e.g. when clearing dirty bits).

hmm, I think all the content within the bracket is details and we should
not mention them at all. In fact, when I see the implementation, the
last refcount of tdp_mmu_root_count is treated differently. Those
details should be instead mentioned in code or comments instead of
documentation as they may evolve much faster.

So, I will remove the last sentence.
