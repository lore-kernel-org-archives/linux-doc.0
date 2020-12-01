Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A266C64E7A
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 13:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36A0E207FF
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 13:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a5w9Ab02"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgLANVQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 08:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgLANVQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Dec 2020 08:21:16 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF26AC0613CF
        for <linux-doc@vger.kernel.org>; Tue,  1 Dec 2020 05:20:35 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id u12so2622456wrt.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Dec 2020 05:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2UsigzSoUrcWefZPVlh907PdAiwKvnJCxqM3bK865xE=;
        b=a5w9Ab02L7z/Ws6Swour5XHiDemqkyRoJMnrsjmQ7dP6ZLcdnSPl4rl7uCSoefsSgY
         CSEM/hSiuG2V+lMG6XWUBoFP+umx/Z1SVH3TjxButBNmxRpd+woEE6TVMNN9WHNpy5tJ
         ZEYGU8NtIHTuGypVh+KkDpgmLvcDC2pLG0Er10VjuCtRBenorREyUgLQLwVpFN6JBDEW
         ronnfqxfmwHhCPQ01dnSKmwWets/XfGXKFw/uOqsdAVJTRapDsOCz5sJzwWUOq1ktIfu
         4cGDQDzbuGu30W2f/qjd8TvucoBxOFs8kFxke2+S46bX1rPSzpW/5asHiBqkHtlmriyV
         MPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2UsigzSoUrcWefZPVlh907PdAiwKvnJCxqM3bK865xE=;
        b=arBHfbCCNRqMDDHTZcgf22IKIvv2Vcrn7LAlYq3W/VcjqhZSfiWCm+KIa8lnVjSLsM
         RDAOoSMlNsID62DUAFHMxA+3h5112S92N1UNex5xpRk0NPOASp+9q0L6o/ppEBznM4yW
         Btjj6mYOaefCPyHo8i/DxF/wGTPdQr+RJY+bL82KX7hyazcje3A16vyWMb4umidZW8yV
         vUBQFhPO1XLNQI19FeR1ejJqsl/ZIPHKKoI5StRpGOa4VIauPOyinXdDTNKe+ladax1z
         kqB/ssechArK7IrF/A9XuT/DWrCxeayFArOyLqcTInIvCg8sVGDTWsuPk3bnNHNoOc0A
         xWQA==
X-Gm-Message-State: AOAM530b6lHVbGeRqNooYmopzTjANb02cGIK0lScRSBuJt2aJqYFZu+G
        BncGJSLJLMEEjGykWJkcy+rwvQ==
X-Google-Smtp-Source: ABdhPJyca9R4xKZARa2KQnxST/3CMFlBn6fpNOSPil/kBrj5VNBo6V2f44HqUyGs2N30XTmZGFFNLA==
X-Received: by 2002:a05:6000:c7:: with SMTP id q7mr3842571wrx.137.1606828834384;
        Tue, 01 Dec 2020 05:20:34 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:7c5f:5ab5:ac1f:89ce])
        by smtp.gmail.com with ESMTPSA id u66sm2979560wmg.2.2020.12.01.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:20:33 -0800 (PST)
Date:   Tue, 1 Dec 2020 13:20:32 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH v3 16/23] kvm: arm64: Forward safe PSCI SMCs coming from
 host
Message-ID: <20201201132032.we4jbsvtsngwixse@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-17-dbrazdil@google.com>
 <20201127165159.3s7hob5tgjcrbz33@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127165159.3s7hob5tgjcrbz33@bogus>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 27, 2020 at 04:51:59PM +0000, Sudeep Holla wrote:
> On Thu, Nov 26, 2020 at 03:54:14PM +0000, David Brazdil wrote:
> > Forward the following PSCI SMCs issued by host to EL3 as they do not
> > require the hypervisor's intervention. This assumes that EL3 correctly
> > implements the PSCI specification.
> > 
> > Only function IDs implemented in Linux are included.
> > 
> > Where both 32-bit and 64-bit variants exist, it is assumed that the host
> > will always use the 64-bit variant.
> > 
> >  * SMCs that only return information about the system
> >    * PSCI_VERSION        - PSCI version implemented by EL3
> >    * PSCI_FEATURES       - optional features supported by EL3
> >    * AFFINITY_INFO       - power state of core/cluster
> >    * MIGRATE_INFO_TYPE   - whether Trusted OS can be migrated
> >    * MIGRATE_INFO_UP_CPU - resident core of Trusted OS
> >  * operations which do not affect the hypervisor
> >    * MIGRATE             - migrate Trusted OS to a different core
> >    * SET_SUSPEND_MODE    - toggle OS-initiated mode
> >  * system shutdown/reset
> >    * SYSTEM_OFF
> >    * SYSTEM_RESET
> >    * SYSTEM_RESET2
> > 
> > Signed-off-by: David Brazdil <dbrazdil@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/psci-relay.c | 43 +++++++++++++++++++++++++++-
> >  1 file changed, 42 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> > index e7091d89f0fc..7aa87ab7f5ce 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
> > @@ -57,14 +57,51 @@ static bool is_psci_call(u64 func_id)
> >  	}
> >  }
> >  
> > +static unsigned long psci_call(unsigned long fn, unsigned long arg0,
> > +			       unsigned long arg1, unsigned long arg2)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	arm_smccc_1_1_smc(fn, arg0, arg1, arg2, &res);
> > +	return res.a0;
> > +}
> > +
> > +static unsigned long psci_forward(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	return psci_call(cpu_reg(host_ctxt, 0), cpu_reg(host_ctxt, 1),
> > +			 cpu_reg(host_ctxt, 2), cpu_reg(host_ctxt, 3));
> > +}
> > +
> > +static __noreturn unsigned long psci_forward_noreturn(struct kvm_cpu_context *host_ctxt)
> > +{
> > +	psci_forward(host_ctxt);
> > +	hyp_panic(); /* unreachable */
> > +}
> > +
> >  static unsigned long psci_0_1_handler(u64 func_id, struct kvm_cpu_context *host_ctxt)
> >  {
> > -	return PSCI_RET_NOT_SUPPORTED;
> > +	if (func_id == kvm_host_psci_function_id[PSCI_FN_CPU_OFF])
> > +		return psci_forward(host_ctxt);
> > +	else if (func_id == kvm_host_psci_function_id[PSCI_FN_MIGRATE])
> > +		return psci_forward(host_ctxt);
> 
> Looks weird or I am not seeing something right ? Same action for both
> right ? Can't they be combined ?

Sure, happy to combine them. I thought visually it made sense to have one
action per ID.
