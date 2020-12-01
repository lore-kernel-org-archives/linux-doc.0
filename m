Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394B4C64E7B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 14:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D13802076C
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 14:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICa9ez6x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391698AbgLAOod (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 09:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391697AbgLAOod (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 09:44:33 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56D9C0613D6
        for <linux-doc@vger.kernel.org>; Tue,  1 Dec 2020 06:43:52 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id t4so2957802wrr.12
        for <linux-doc@vger.kernel.org>; Tue, 01 Dec 2020 06:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JIA0Scl4OIMMkSS/5dfb1RixGjs/UhotRuHwz308dGA=;
        b=ICa9ez6xKvXoVFd5a+nyt9V7db40a6UDXltW3gu+5eDTPPoS7Y+JHn0qhh505cto8f
         GRLJkOPi8X4qfWqafWsQ6KrEg1FBVyXFnMuueku5Rvh2nAkHFVLVmB94DGc7SMapcND8
         iCfVQkWismF7cf9Pxzp3Pi5NrsRfBnkClOAt3axQ3sGSRNPGhXQv7qFGz5pajfx4cjxn
         5vFpF4gkJTjJGtnvbwVNxH5lm7Jc0cCZfd9IXPiS4SNeZVCufI98odvCCzyskxTIRMwx
         S+gz72PQ6q5hfrC4mBZr8J/bOiuIbHPAIKUX5idfyO8GKJNpNm3oeMe1COzvBl6m/a3D
         I85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JIA0Scl4OIMMkSS/5dfb1RixGjs/UhotRuHwz308dGA=;
        b=ib5SIO+zIIO2pklUZf2EAvFVHxHNODOMOUywSGmanGVA13bk5O2pjEEGxTIhTLPPI7
         yts1CLriU4EfU04u5vKOb6YVq98IlCqIf0aObtZ7DFPd1RfMeS8pOUZ6kVeSX0wt3IoG
         9KraEN5lbO8mFqK7Q/MOVs8QI5fb1CtA6q99Ivy43bX35X0RHA8l154K/6H+QZEemAlW
         uVVRxXzTduM+QZFWwYrEjujolmJ50W5adDmphJbVsmfBjClg+Qh8F+/MUWTnj9J7ZgGB
         U0w9FE2lVDvYcal3reLdqOPNk/VwP/6HgsgU/AmZwdgmhQY0sPiiX8QKmCfIqwOomW5s
         VD4w==
X-Gm-Message-State: AOAM531y9Ah2+wNO6fS2tHcf+7taASEwow616YpwAMz11eqFVA1MPfrL
        J/8etlMOdXCs0kyXPBOShjV6ng==
X-Google-Smtp-Source: ABdhPJxFvoIa6LKNTCZysKjYl0L3o6ekKKdzC32vTURn5ckCGb5MJxfK027unJvURm7vUyFNvUoRNg==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr4467528wru.70.1606833831387;
        Tue, 01 Dec 2020 06:43:51 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:7c5f:5ab5:ac1f:89ce])
        by smtp.gmail.com with ESMTPSA id y130sm99756wmc.22.2020.12.01.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:43:50 -0800 (PST)
Date:   Tue, 1 Dec 2020 14:43:49 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, kvmarm@lists.cs.columbia.edu,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH v3 06/23] kvm: arm64: Add kvm-arm.protected early kernel
 parameter
Message-ID: <20201201144349.bglz7yicc3peixe6@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-7-dbrazdil@google.com>
 <20201127163254.zxdrszlveaxhluwn@bogus>
 <20201201131913.u7m2eifvtus74dra@google.com>
 <20201201140734.GA86881@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201140734.GA86881@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > > be just me, but if you agree please update so that it doesn't give remote
> > > idea that it is not valid on VHE enabled hardware.
> > > 
> > > I was trying to run this on the hardware and was trying to understand the
> > > details on how to do that.
> > 
> > I see what you're saying, but !CONFIG_ARM64_VHE isn't accurate either. The
> > option makes sense if:
> >   1) all cores booted in EL2
> >      == is_hyp_mode_available()
> >   2) ID_AA64MMFR1_EL1.VH=0 or !CONFIG_ARM64_VHE
> >      == !is_kernel_in_hyp_mode()
> > 
> > The former feels implied for KVM, the latter could be 'Valid if the kernel
> > is running in EL1'? WDYT?
> 
> I reckon we can avoid the restriction if we instead add an early stub
> like with have for KASLR. That way we could parse the command line
> early, and if necessary re-initialize EL2 and drop to EL1 before the
> main kernel has to make any decisions about how to initialize things.
> That would allow us to have a more general kvm-arm.mode option where a
> single kernel Image could support:
> 
> * "protected" mode on nVHE or VHE HW
> * "nvhe" mode on nVHE or VHE HW
> * "vhe" mode on VHE HW
> 
> ... defaulting to VHE/nVHE modes depending on HW support.
> 
> That would also be somewhat future-proof if we have to add other
> variants of protected mode in future, as we could extend the mode option
> with parameters for each mode.

Agreed that 'mode' is a more future-proof flag and I would very much love to
have an option to force nVHE on VHE HW. I however expect that the early stub
would not be a trivial addition and would not want to get into that in this
series. Could we agree on 'protected' as the only supported value for the time
being?

David

