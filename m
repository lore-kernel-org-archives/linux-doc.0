Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CA6EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 18:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjFZSAF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjFZR77 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 13:59:59 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3140C134
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 10:59:59 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-262e5e71978so1080516a91.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687802398; x=1690394398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plGPnNmp3bHXDxY2xXZU/U5CRi6+Be1QmjShS9rwEWQ=;
        b=iunKlzH6ltsbsmTPGl7+XjaUEeYmmWTDy3TT6IP4xrB5aNlrVP9Vp1lZHxpk3o75a7
         qjwxuYV1sN3wCVZquQbLIxkIwdl4KzMBXc0rlXex8Cysclc7bpC8alLc7FQd836rfkLv
         j55f8FZweQGGNnoA0+QHljAApsDLS1U243VvAfkj/qfXEbfGJxAGF2sZhjXtGM3TkPgi
         Anm2DbbCLaxLqFjQrVVD4frgeIaYqLnE02wWHyJevds8dex9iGf7Um6Q3G1Tayxjnm0T
         SnJ8p8u4yl2NRftZHyAuVTpgV+QoxhjroYPHQuIO+pYOWUGTTcgBdbYr1kbvFLsPFcDh
         FC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687802398; x=1690394398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plGPnNmp3bHXDxY2xXZU/U5CRi6+Be1QmjShS9rwEWQ=;
        b=VYTrClLm+YwWcX5RlDobG+Hqd8MkSUm+Cwbrl+AqphpYsLX/jexbsFI7JJqgcsgh/9
         v0t/hQV0y468lvPfTEDC1AeCLJxaAQKCHzZ6AoUkL7diB+lwOQSmplLJIJlxa9nNeXjq
         PrVAb9CfVndP0kxOrVdABUdk+LEm/z4uy11ofr6elbb6wzuFoH/GY5p4o267a0MnnHhR
         6Gjn10kze3sWIH0HxLeQdQyrYZUCf2NvrDLumTsQkR0xCJ23Hb9gs4q2vetmoDAHQyAd
         nSK/IIuD6qyV/KIH11AaRngn+HpKumxTVOjhrszoDV80ZUQblZ09v4uDnz+XemSF06NB
         Xdqw==
X-Gm-Message-State: AC+VfDzNRHnWEtVwPoJoVyS3Z75lGfXz3QD86fX3C7M57Au7P49i2moj
        kqYGJc79T9atCGmKLH+Rm7chqg==
X-Google-Smtp-Source: ACHHUZ5jbABWq71//Y5hMCCaB8WfgqHnonyf6ZDBe1jLvP1W7eesLQPS1y1c5A7yuH9Av7TBQKQinw==
X-Received: by 2002:a17:90a:203:b0:262:c41e:1fcb with SMTP id c3-20020a17090a020300b00262c41e1fcbmr9873356pjc.14.1687802398488;
        Mon, 26 Jun 2023 10:59:58 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id h23-20020a17090aea9700b0025dc5749b4csm3932240pjz.21.2023.06.26.10.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:59:57 -0700 (PDT)
Date:   Mon, 26 Jun 2023 17:59:54 +0000
From:   Mingwei Zhang <mizhang@google.com>
To:     "Huang, Kai" <kai.huang@intel.com>
Cc:     "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "Christopherson,, Sean" <seanjc@google.com>,
        "jmattson@google.com" <jmattson@google.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dmatlack@google.com" <dmatlack@google.com>,
        "bgardon@google.com" <bgardon@google.com>
Subject: Re: [PATCH 6/6] KVM: Documentation: Add the missing tdp_mmu_page
 into kvm_mmu_page
Message-ID: <ZJnSGrskpTjhZ3qV@google.com>
References: <20230618000856.1714902-1-mizhang@google.com>
 <20230618000856.1714902-7-mizhang@google.com>
 <4e2eae9ab23748ea32fe07d39a704d65d50a0973.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e2eae9ab23748ea32fe07d39a704d65d50a0973.camel@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 22, 2023, Huang, Kai wrote:
> On Sun, 2023-06-18 at 00:08 +0000, Mingwei Zhang wrote:
> > Add tdp_mmu_page into kvm_mmu_page description. tdp_mmu_page is a field to
> > differentiate shadow pages from TDP MMU and non-TDP MMU. When TDP MMU is
> > enabled, sp->tdp_mmu_page=1 indicates a shadow page for L1, while
> > sp->tdp_mmu_page=0 indicates a shadow page for an L2. When TDP MMU is
> > disabled, sp->tdp_mmu_page is always 0. So update the doc to reflect the
> > information.
> > 
> > Signed-off-by: Mingwei Zhang <mizhang@google.com>
> > ---
> >  Documentation/virt/kvm/x86/mmu.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
> > index 0dbdb7fb8cc6..cbad49c37629 100644
> > --- a/Documentation/virt/kvm/x86/mmu.rst
> > +++ b/Documentation/virt/kvm/x86/mmu.rst
> > @@ -277,6 +277,10 @@ Shadow pages contain the following information:
> >      since the last time the page table was actually used; if emulation
> >      is triggered too frequently on this page, KVM will unmap the page
> >      to avoid emulation in the future.
> > +  tdp_mmu_page:
> > +    Is 1 if the shadow page is a TDP MMU page. When TDP MMU is disabled,
> > +    this field is always 0.
> > +
> > 
> 
> Hmm.. Again I think "TDP MMU is disabled" is a little bit confusing, but maybe
> it's only me having this impression.
> 
> I think you can just delete the second sentence.

It is not confusing but redundant in this case. I will delete it in next
version.
