Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D783EE1DC
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927968; cv=none; b=AAlhan3ODWCM/7gFOW2ee9wUCpQhpJ5aDIFxcyw3cll6hn7hYRtUIUwuCge/ymXr5H/MNHHp1gHSmC32OsC83IPG9nb5mVutrJRofEivAKah9VhOQm+qHrEnrSy2go+UVWpRSOEKCxoK1VGnWmIVRpdpVTnek5ZTdiaVV0VE+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927968; c=relaxed/simple;
	bh=WXSYejeR0VIG/9UGkj4OAcz8AzDp1h9wj77h/FvfddM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GXGnG1HIh14skg31giTx23GX+RMWmVajSPkRQPwr45oqIFifLMrqm+Y4raD+d1A0MkFW1KJ9umKdCCAdYX5ZEWaNB1dvmLsGrDgQrwB/Z7jmUbeOLMwMYhkh/NFas1on5IftY4nrY2Wgbq13TDY2pA/+Pfn01BsavkaFI5gGy9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RxFPQ1jy; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxFPQ1jy"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848544a8496so873887b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784927964; x=1785532764; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=676jeBy0EAQIqzdr2xZT677bczXPwQb8CdOlVs2oUJg=;
        b=RxFPQ1jykx93mSdJgFhrbb8fCipbriJMA131WUmjhSEpem9Cu9M7eSqX2CNdCtXgiI
         /mo+R6CvOWq9ema87ASHwBrgd/03bG8f2/WpqY7LiGbdHfPFYNr8A9nQOWWAZMRx7yyi
         DKbHdRORpQgo9JrBiCY3h1y9Lb8MUWOoEmIk401yilEI1ncGfSdl7lBO8GT6kasJBvmw
         HU2hu9I/PqbqrV6vPPXXq4uTvhRo8u+j00v6kJQxmvEHA6KhEZeKWJbrNozTc9aCbIAI
         t1fpTqbwi8Hu2fLPCQMxVtAL+sfF2aRAn0QvFvDVrAKcpl00KIP+QG64BHEnoX5acMAB
         n4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927964; x=1785532764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=676jeBy0EAQIqzdr2xZT677bczXPwQb8CdOlVs2oUJg=;
        b=IKrrFm4n/B2sOhQ1Tj8DlY5lLrL1VC23W/5KaRsk5/6BwOn1dYMtwRH2WCpAcepmad
         irbBVvPO5zUiL8VcwtUdTb7qyO/IRiFFwZ3lvGTOYkQGM99LQBLQS7fEdLxex919BJ0f
         1J4zWu5nPYcmFj5CIoYgI/cmg8e5W+1xZaQOu3HbSfhpx/n/zBXVLoRxcWEn75uE2Thv
         OfA1YxX476xfKJFshZxEgFmFkOowm8i3MbeTaGAvO9wtlmJ0cZVk9CyZbYUuyw6+fdAe
         XlTte4Nkkn7QAsK4exCpSLFHrK3UwClgZYn9yLDQ1b9Eh42u04GOaG8W3Rvf2JEOrU7R
         lYiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqyaueay/12Rwr1+NWNwqZpxBS0sZKsPwTBILt08M3Np4ququQcrsZbpMCxYZbp9YXj/aoO7KaPwkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/cmTEgwoLhdMyySmclItCN38z/Sppmrj/izVtPr6IvONPszvg
	kfnZPqThq7XWp0kIEwzo58r7B2o+NNzFuTFnApoF0Na85v+LurhBM8TI1nQOgzgc1F+H1blkdkZ
	GwIN8Aw==
X-Received: from pgbf36.prod.google.com ([2002:a63:5124:0:b0:c99:aff5:708e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a8e:b0:3c0:9c19:b275
 with SMTP id adf61e73a8af0-3c67e027041mr22595637.67.1784927958810; Fri, 24
 Jul 2026 14:19:18 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:19:17 -0700
In-Reply-To: <20260703212145.343527-9-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-9-dwmw2@infradead.org>
Message-ID: <amPW1eAPpUuxLoj_@google.com>
Subject: Re: [PATCH v6 08/36] KVM: x86: Activate master clock immediately on
 vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 03, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Previously, the master clock was only activated when the first vCPU
> processed KVM_REQ_MASTERCLOCK_UPDATE during KVM_RUN. This meant that
> KVM_GET_CLOCK could not return the host_tsc field until after the
> first KVM_RUN, making it impossible for userspace to follow the
> documented TSC migration procedure without a dummy vCPU run.
> 
> Fix this by calling kvm_update_masterclock() directly from
> kvm_arch_vcpu_postcreate(), after kvm_synchronize_tsc() has already
> set all_vcpus_matched_freq. This ensures the master clock is active
> immediately, and KVM_GET_CLOCK returns a valid {host_tsc, realtime}
> pair as soon as a vCPU exists.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/x86.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ff45577ed90c..2039bd8518fb 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13110,6 +13110,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  		return;
>  	vcpu_load(vcpu);
>  	kvm_synchronize_tsc(vcpu, NULL);
> +	if (!vcpu->kvm->arch.use_master_clock)

Any reason this can't be?

	if (kvm_check_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu))
		kvm_update_masterclock(vcpu->kvm);

> +		kvm_update_masterclock(vcpu->kvm);

I don't love doing work outside of KVM_RUN that is typically handled by KVM_RUN,
but this seems fine?

>  	vcpu_put(vcpu);
>  
>  	/* poll control enabled by default */
> -- 
> 2.54.0
> 
