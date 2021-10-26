Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFFDC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 16:04:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D09760EFE
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 16:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbhJZQHC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 12:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237183AbhJZQG7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 12:06:59 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCC0C061767
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 09:04:33 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id v16so5275255ple.9
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4WWQGYrQCvtEZnOxLDKvqrp7vtMClIRGrA2VVosNxMg=;
        b=e2ZR7eRJoZP0usdtriUJ+SrF+NnmKLfIhJWwBKdVNTiwiHS46Oy+LfMa65CnJ7uhJq
         xSsDMelUoga+5PRYmsXijqw67w5dZrZQ+iNv5rd+kpKH+AJ9JbS4K5UOD2/x9Ql/qpto
         jvx2hpUWkmAj5ffiaz4pR8XI3eU7a2JQDeFFTOBHXYbVTDP07v1rHAogKpbcC1U3Mppq
         6y9WGfrNAWQZ8mM/N4Ru2MsyJFvlZpwCudUr4HlqLRftLXh5IYL6AZP3eVo9dHcvWQ8A
         snlKz6b0JAat0NyeA6mvvcukWIdX9QETG2T4Tpb7k3KgBXi+upSyoKMJxb9ZYMuXcund
         r2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4WWQGYrQCvtEZnOxLDKvqrp7vtMClIRGrA2VVosNxMg=;
        b=DQq+pfrO1SHNf/IVHxkdxWGWb5DpAlQFK3o8qWEf2qyTVR/5b2t8TmEmd2MAf3K3s7
         dvoNk045gYIotWV6gTBNIfm31TNm4a8Bwph+0GcQdlUR915zNCdUVkWZC6AsiUvs2XMA
         DkDCpICgVYQJ122HDyVjJhS78LDH8RotZPXxoHlxKwdAWDcndgRICImD+JLtgvaFxex/
         D7mqKBLPIbXFt7VlZK69wJvrXw4az6M1QMA0COukSRfXA/+yTPmF3Ps4eCeYDtAjhhqt
         p8yzDaga+teJU7wqrCexKLoF7bY7LGf/jfyfB1Pgxmuc7Cz8TQiP56IiPWY8myvccdCz
         Vs6A==
X-Gm-Message-State: AOAM532lU1nJnZF/zILeZE9rWWfnqBaiE4FbknI7z6KdcMBPlDFLP0Ir
        F8dChXdL5u4HxZwSBK8LgLel4g==
X-Google-Smtp-Source: ABdhPJzxwDp2GSt/EEYcM2AYIWmy4Dai4riGyxZYe458XIKeYNyhC7aXxAzhZ4uZwTYC4Lcbb9xrkA==
X-Received: by 2002:a17:90b:1511:: with SMTP id le17mr25542928pjb.99.1635264273125;
        Tue, 26 Oct 2021 09:04:33 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 141sm8576391pge.23.2021.10.26.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 09:04:32 -0700 (PDT)
Date:   Tue, 26 Oct 2021 16:04:28 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     zhenwei pi <pizhenwei@bytedance.com>
Cc:     Wanpeng Li <kernellwp@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wanpeng Li <wanpengli@tencent.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] x86/kvm: Introduce boot parameter no-kvm-pvipi
Message-ID: <YXgnDBOXh2v3gzU4@google.com>
References: <20211020120726.4022086-1-pizhenwei@bytedance.com>
 <CANRm+CxAVA-L0wjm72eohXXWvh9fS7wVFzfKHuEjrsiRFuk9fg@mail.gmail.com>
 <YXB4FHfzh99707EH@google.com>
 <08757159-1673-5c7b-3efc-e5b54e82d6c3@bytedance.com>
 <CANRm+CzcTUWYJeaj3eWKH84YZYgeMZz3kbpn13c8i97iYGGHFQ@mail.gmail.com>
 <5b718b32-cd92-920e-c474-27b9cafeec60@bytedance.com>
 <ec014e8d-eb5f-03cc-3ed1-da58039ef034@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec014e8d-eb5f-03cc-3ed1-da58039ef034@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 25, 2021, zhenwei pi wrote:
> Hi, Wanpeng & Sean
> 
> Also benchmark redis(by 127.0.0.1) in a guest(2vCPU), 'no-kvm-pvipi' gets
> better performance.
> 
> Test env:
> Host side: pin 2vCPU on 2core in a die.
> Guest side: run command:
>   taskset -c 1 ./redis-server --appendonly no
>   taskset -c 0 ./redis-benchmark -h 127.0.0.1 -d 1024 -n 10000000 -t get
> 
> 1> without no-kvm-pvipi:
> redis QPS: 193203.12 requests per second
> kvm_pv_send_ipi exit: ~18K/s
> 
> 2> with no-kvm-pvipi:
> redis QPS: 196028.47 requests per second
> avic_incomplete_ipi_interception exit: ~5K/s

Numbers look sane, but I don't think that adding a guest-side kernel param is
the correct "fix".  As evidenced by Wanpeng's tests, PV IPI can outperform AVIC
in overcommit scenarios, and there's also no guarantee that AVIC/APICv is even
supported/enabled.  In other words, blindly disabling PV IPIs from within the
guest makes sense if and only if the guest knows that AVIC is enabled and that
its vCPUs are pinned.  If the guest has that info, then the host also has that
info, in which case the correct way to handle this is to simply not advertise
KVM_FEATURE_PV_SEND_IPI to the guest in CPUID.
