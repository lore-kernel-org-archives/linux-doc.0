Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF69C433FE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Nov 2022 22:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiKDWBA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Nov 2022 18:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiKDWA6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 18:00:58 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8584383
        for <linux-doc@vger.kernel.org>; Fri,  4 Nov 2022 15:00:56 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-13be3ef361dso6938550fac.12
        for <linux-doc@vger.kernel.org>; Fri, 04 Nov 2022 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ru2O27KhwLVb1DWRXQb8XtQqCurqYDAL67PCWqMfqE=;
        b=p5z1DkIlfx8i6AFUMDT/HshPZbplUxGPOa98ZuyhLM+4EdBOr+wIzBhw2b2/4CxMEQ
         0+7AmUHdoOPEOw2BMwCbpy6N5TGdtONibPiVtSHpm44nafbKshwffZgG4/x7owqOjORU
         g7z6ub2sAkT+IrWAvrMFh6EKsZlR/WuMtYF1oLL8Dwt5cmUYxvPsYc5P6gDB5pgq6OFh
         yxlTHRxs2XWQweRJ42RypWc+ltWhJTqpFBH0d52eDjnWvdxJfrMd+/8LyuQfg7X5hh3M
         2ON9mWd+97DPM5nYE8ZazS7svxlZAl8gP6US0A38vxeXncc6JYPBL2a7925Sa62wG9Vd
         lEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ru2O27KhwLVb1DWRXQb8XtQqCurqYDAL67PCWqMfqE=;
        b=l2x7dnpuIfWnGYNazRGjNCxeBcIHm4LGe79AeuulRWzkL550R1m4VXp7Q0q9tViIvC
         h3df8Y+ekRDKtp3W14E6VAaG2GrqUksXA2X1K+V5aq3N4pjRwRofyDjWhNhZhGDJUEnj
         qEMQNAdLzVRGvvai1XqLfG883JYaP88+hjCD0V/oRqs9yJ2aXVELc8RDTf4xj9MINkeE
         DZfB7+Nyx4IvUZgPYu7/YO6KJQqjZ652ddQSOMfheONV8yWtSa2k/EHibvxkDkftztmP
         a+O8b0oRGwGsAqvLXq+1twS4f5GmN50muv1OdjFSVfxayNNfG6CAdyl3UQ+rrj0PLlAY
         7ygw==
X-Gm-Message-State: ACrzQf3CrupFzrKnDkh1Ezaed8PdWALZ2K6i9G7aIx3LmROVKE7llC3c
        EDNUzhJ7SHlGeBfy6j8iOVyfyvKq0v6HkX1dt8WfJw==
X-Google-Smtp-Source: AMsMyM4bGltVDYrrDGLU9k+sm/2cljesNpv6yCiTtOf7czHWrEhygAy+4nXAiY5LPqr5OsvB7nfwL42Xxb/PwWY2wq8=
X-Received: by 2002:a05:6871:8a3:b0:13b:18ef:e8df with SMTP id
 r35-20020a05687108a300b0013b18efe8dfmr22205078oaq.181.1667599255959; Fri, 04
 Nov 2022 15:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221104213651.141057-1-kim.phillips@amd.com> <20221104213651.141057-4-kim.phillips@amd.com>
In-Reply-To: <20221104213651.141057-4-kim.phillips@amd.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Fri, 4 Nov 2022 15:00:45 -0700
Message-ID: <CALMp9eSpKGCYK_1r3o326ui5RVoH73_RR5-LR2Div9Jm5zvk6A@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/speculation: Support Automatic IBRS under virtualization
To:     Kim Phillips <kim.phillips@amd.com>
Cc:     x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tony Luck <tony.luck@intel.com>,
        Babu Moger <Babu.Moger@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 4, 2022 at 2:38 PM Kim Phillips <kim.phillips@amd.com> wrote:
>
> VM Guests may want to use Auto IBRS, so propagate the CPUID to them.
>
> Co-developed-by: Babu Moger <Babu.Moger@amd.com>
> Signed-off-by: Kim Phillips <kim.phillips@amd.com>

The APM says that, under AutoIBRS, CPL0 processes "have IBRS
protection." I'm taking this to mean only that indirect branches in
CPL0 are not subject to steering from a less privileged predictor
mode. This would imply that indirect branches executed at CPL0 in L1
could potentially be subject to steering by code running at CPL0 in
L2, since L1 and L2 share hardware predictor modes.

Fortunately, there is an IBPB when switching VMCBs in svm_vcpu_load().
But it might be worth noting that this is necessary for AutoIBRS to
work (unless it actually isn't).
