Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5686325392A
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786408448; cv=none; b=H2TA7hcGFBBuWn+rkgle65ESNwoWDNlwClgEp74BofKM6UrRwk5FZ7k2OPaLiZjQH3B7zMDBShwGmnXohAQvc4n5zsdDiSHO0Jg1yHfstOOL2mLAk6pkGOGNyXtO6IWR4XDnRd95xUlFMuqomQO/fXwc2VQV9BwqqqfZceye+Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786408448; c=relaxed/simple;
	bh=MMa/hp91Q4DQrF2Z+/sD8leicCizhFmkMuC0Yp4mbJg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZihRlO26a7H7t3Yv2YiLuhVsbf4s5tI1tEP1GmCfRejRGJk9//nGrUiKBSmg9akNreqWvqoRSI/pTOt3WHk+1zMGoFx4ph3Sh3h8j2J10U2LvJHDJGLx06PvxO8Mn/lHZX5crPhvRfonZkl2KrC1TjhkyIgJ/kyDLgKVzw+9DHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pyLHwK07; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pyLHwK07"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2214582a12.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 17:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786408446; x=1787013246; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55Q0ob263MwyA8FHi6NvsRaHz0KhR6aRDC/5/vbhWl4=;
        b=pyLHwK078CLiL2knJHSTlxG1rpLKBQQ1G66F/JGyXKAq4x9VAUna5mFI+RRPRbcPZu
         2R0sW9sA1d2vp+IFF7ttMdlCkPRZ6oFs6x6JlUt78Ps+UD9029Tfnlzq0MN+wyi32slx
         0N8sBstO/c5ks1Rs9DS3bX9XFhJ25BrbdvXbNEdaifWia7Uy1UbT67diRqCFqWTGMmmb
         uQdkM6h7azF0QVH9TUCIe+435iBljx/0GJa001rzqtevjzhqDNi2UtC+14BBLOEd0FuD
         ayVUe/l34iVvO94uHNOn5lAfoLasVZTtE+BJesp/EUI14MXM8SJYpRSEWB3hsUj0UogV
         uG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786408446; x=1787013246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55Q0ob263MwyA8FHi6NvsRaHz0KhR6aRDC/5/vbhWl4=;
        b=CJkWO0P5uCAb7kPCdf3pn0SZb1dB8w0/Ldkh98LheqMbiu0vragQ6gMVLE/WKHGzJt
         gQTfMzuaTZB64lnsvpx7WA0eX/hZDErScj+9YKwmQWYrcR+hc8oTsWMgl90zENN3cGmz
         /dLf/XQwkgyIkoy45/aXyQth7XhScSSoDgQ9jmrbgFmdUYErwkRyLrHkSjA/3c82Wqma
         jvXrEL/boQynvquzbogrmb61QVPWcIq1ep5uQ01LdcPUq9Kr/jidjAXasnmSmrM5dco6
         fmm6aCRWe+T2uozca9BqzHCd9ggJ/6vkGaClhEvUhzKsEUFmuAkehHI3bwJBtQAHSiLf
         MwjQ==
X-Forwarded-Encrypted: i=1; AHgh+RouTaak+mEzGA8q/6rw7/8YGxsVYDCn4tR8SXWA2hATwcaBls8y/gj3aVOYdJ9Smrw5omPI9JlvNZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVmPqeQfir7bUVmLPY92IiFn2FJ8L3dnMQyCMdLyEVl1y0Ez+
	dU7GQRuo0YsKa29JfAaXgEyr5ojyvnSoJhC64eMbPD3C+OgORq9xJ5vKNC5YlwefoMK8KBsvb3P
	80JUcjA==
X-Received: from pgu37.prod.google.com ([2002:a63:1465:0:b0:cbe:a685:dd06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9106:b0:3c3:8651:b302
 with SMTP id adf61e73a8af0-3cc1a372bfemr6394430637.28.1786408446327; Mon, 10
 Aug 2026 17:34:06 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:34:05 -0700
In-Reply-To: <20260713105033.15405-4-sarunkod@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260713105033.15405-1-sarunkod@amd.com> <20260713105033.15405-4-sarunkod@amd.com>
Message-ID: <anpt_cMpS1-ua-jX@google.com>
Subject: Re: [RFC PATCH v3 3/6] iommu/amd: KVM: SVM: Add explicit vCPU running
 state to IOMMU interface
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Eric Biggers <ebiggers@kernel.org>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Li RongQing <lirongqing@baidu.com>, Marco Elver <elver@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Thomas Gleixner <tglx@kernel.org>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 13, 2026, Sairaj Kodilkar wrote:
> @@ -1008,6 +1010,7 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int apicid,
>  					    enum avic_vcpu_action action)
>  {
>  	bool wakeup_intr = (action & AVIC_START_BLOCKING);
> +	bool is_running = apicid >= 0;
>  	struct vcpu_svm *svm = to_svm(vcpu);
>  	struct kvm_kernel_irqfd *irqfd;
>  
> @@ -1024,9 +1027,10 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int apicid,
>  		void *data = irqfd->irq_bypass_data;
>  
>  		if (!(action & AVIC_TOGGLE_ON_OFF))
> -			WARN_ON_ONCE(amd_iommu_update_ga(data, apicid, wakeup_intr));
> -		else if (apicid >= 0)
> -			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apicid, wakeup_intr));
> +			WARN_ON_ONCE(amd_iommu_update_ga(data, apicid, wakeup_intr, is_running));
> +		else if (is_running)
> +			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apicid, wakeup_intr,
> +								   is_running));

Pass is_running here is rather weird.  Given that this is the only call site
that originates outside of the IOMMU driver, what if the exported
amd_iommu_activate_guest_mode() is a wrapper to an internal API and hardcodes
is_running=true?  Then the internal path via irq_set_vcpu_affinity() can pass
an actual variable.
