Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DF0C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 15 Jan 2021 22:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FB3520DD4
	for <linux-doc@archiver.kernel.org>; Fri, 15 Jan 2021 22:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbhAOWcp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Jan 2021 17:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725918AbhAOWcp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 17:32:45 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C1FC061757
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 14:32:05 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id b3so6400297pft.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 14:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ooOPbSdn2JKfhlBwxZ7D3PM2/XriIVf1HYoBmF9K00g=;
        b=oQVolH9tri0XcGLaGNVO5l+bUWdV7hmgvZsCPUdMKTKaWe5ApiqR92YewV8yvUEOQx
         VssCa4fu80HFbsqHdy5uc7/70gWkYeXpWiZ2SMgdum58EXspGSQmEYZ4JH/Mq/dp4dXK
         ekU12eRbwW/MSggLvGAFDpz2urm2SNV0F8Qy7mI+v5965LqgedPDh7tBFZeEZUYdMPEI
         D4YcraAaFPFRGWiMXAPS71GqFbrIHJ4NFtlKveP3tMsLPxiSCceoPNOSHIHUhtY6P0zH
         Wj7SnlJCattg18e8x3rmoIwlsMm3CY48Pt1C8MB8E5ZR+D2duoNg7BjU+caafqyYmhQu
         FnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ooOPbSdn2JKfhlBwxZ7D3PM2/XriIVf1HYoBmF9K00g=;
        b=E/EG9oZDe8OrbDzlnU37dR5MDsxBFM88rxPsjGVnYUaHIQ08ugiZHAwUodpNtoWNQ9
         KJ4AaFAMWQUFF/PSRvVB+dOtYcQOrsXykwak1rcMuo/jklqDQ45JMekyQRVNzCTNb+7B
         OIXqa2gH47dVmvjkczNkGYw3C3vas7mJ5jAzGPTZJicLn6jyRCnWGnkHUZemXhm50ZGP
         OJTBxzwLxE3SWvy54zhnFjAVMlbyiPf7UIwhbMitkQDZ+MuQnkNvpFxkaR8s9Dao86Jy
         qfqf/uTAEgYK+BYXWqD8bMRn6WG7crllvxheBBPlcTjeUm2OemI8ARTlB/XrV+d9IIDo
         fVLQ==
X-Gm-Message-State: AOAM533/1EeqjVSsQ59ar/dR4MEPqQV+b5LMChIsfWkOvnxp4ZQk5U8h
        OuGg6r2NSEv5WK2fJsddm0r5cg==
X-Google-Smtp-Source: ABdhPJy4xjBVHQad+LyI5n5tByZ0GKF5AwVOUQYdkNv+HctNbFa1PPbfz6/rcZSlGFplBtUzgVQgeA==
X-Received: by 2002:a63:d855:: with SMTP id k21mr14754815pgj.399.1610749924356;
        Fri, 15 Jan 2021 14:32:04 -0800 (PST)
Received: from google.com ([2620:15c:f:10:1ea0:b8ff:fe73:50f5])
        by smtp.gmail.com with ESMTPSA id a131sm9375775pfd.171.2021.01.15.14.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 14:32:03 -0800 (PST)
Date:   Fri, 15 Jan 2021 14:31:57 -0800
From:   Sean Christopherson <seanjc@google.com>
To:     Will Deacon <will@kernel.org>
Cc:     Quentin Perret <qperret@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        android-kvm@google.com, kernel-team@android.com
Subject: Re: [PATCH] KVM: Documentation: Fix spec for KVM_CAP_ENABLE_CAP_VM
Message-ID: <YAIX3WkXSURLyj0S@google.com>
References: <20210108165349.747359-1-qperret@google.com>
 <20210115165004.GA14556@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115165004.GA14556@willie-the-truck>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 15, 2021, Will Deacon wrote:
> On Fri, Jan 08, 2021 at 04:53:49PM +0000, Quentin Perret wrote:
> > The documentation classifies KVM_ENABLE_CAP with KVM_CAP_ENABLE_CAP_VM
> > as a vcpu ioctl, which is incorrect. Fix it by specifying it as a VM
> > ioctl.

On a related topic, x86 should report KVM_CAP_ENABLE_CAP as supported, it's had
a vCPU version since commit 5c919412fe61 ("kvm/x86: Hyper-V synthetic interrupt
controller").  I'll send a patch.

> > Fixes: e5d83c74a580 ("kvm: make KVM_CAP_ENABLE_CAP_VM architecture agnostic")
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  Documentation/virt/kvm/api.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index 70254eaa5229..68898b623d86 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -1328,7 +1328,7 @@ documentation when it pops into existence).
> >  
> >  :Capability: KVM_CAP_ENABLE_CAP_VM
> >  :Architectures: all
> > -:Type: vcpu ioctl
> > +:Type: vm ioctl
> >  :Parameters: struct kvm_enable_cap (in)
> >  :Returns: 0 on success; -1 on error
> 
> I tripped over this as well, so:
> 
> Acked-by: Will Deacon <will@kernel.org>

The problem is that you read the documentation.  Who does that?

Reviewed-by: Sean Christopherson <seanjc@google.com> 
