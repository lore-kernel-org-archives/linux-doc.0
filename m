Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE042D7DF1
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 02:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772849235; cv=none; b=lBY7akhoRfc7BZW58exhoH48tdY3420/9FJ+B5nQYaQ6Mpv4kCjiLpVCdw/KgK5ZaRy0aRw11RQrJGoLanMR7PaIif4RODZUMaX4vB36AHWOK5MX7CO4t0/G151aOUY5oOUjVlDZrbfWeIzR4MWipiKxRH1mC6SdHU8YNBKq5fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772849235; c=relaxed/simple;
	bh=zl3C3R9LMNZuD8fFBXpLcvHjwMV/uqnWTf/1hBT8wsI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hZVLUaHOKArgiclEh2NdKXGzEuAVPK9eycpow6FbEbCRgEPfKP8V4zWQTFTq+gHFp7AXMkk2CRdUFR5O75cWnMTsNkLV36UpDRgq8r7zvvjMmBE32vHx1XXEsvPLncZy6Z7hAvlfrbwSyok1XgsBqWQ2eD9tJRValDrcvsGYeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XwxBtjP+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XwxBtjP+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ae6dd98043so38732685ad.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 18:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772849233; x=1773454033; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+UoRrpddV2Fy8n72X0PUQuiXrofIoHgnww81/fG+ME=;
        b=XwxBtjP+3acTVw1qfu1vBIGSen5vXPQ70icSX/Wfxi4Rw8jo8gyuXWXA+d/E4hZZ5i
         CTqZTMaa7n2CsNEpp9ZaiF4kK1RYtaTRYiubXa9aUHpx5BZJ4fdmAReQ256Hyv/hF+/m
         uxSrWC2OSd3M647XXb2pJ11duCMJIysXWVMpUqf8o/CuTt57nyVHGsFIdGT7o9aGkKxu
         mt/qpkx5+g7u79E9AqX+aIEZxf6ID7jgWs61g8SfZdI61WNlCcOOgd3v/qy09EFKEcWY
         2fukQqOuvH2W0GYllUnv9icP3LAr/bhPw/Jh/cLOLa+dkk8XatkB0jaoAwIpHDU2qhyy
         pw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772849233; x=1773454033;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+UoRrpddV2Fy8n72X0PUQuiXrofIoHgnww81/fG+ME=;
        b=M1H4Ga/q+pmw1iaXe05J1tjHLBksUIMIbKhL1mQuVzi1/lm9NgSlcpu1rrpkL5gPYB
         E2/v4q7DEf9+fOBgUbE93LYpX0Vwv5kzYwn617CusQt01M8OML8IJZZJxronYaBG9s8f
         ZxOLPAlknJffFipWCgV3GqIV215Hcc3MsQVPimc5OPuVd9Twe0LyfG9+7FtWlo2ruyVt
         xbdDGSkFaV+hoOx+3a2PuqKxGY7Rrzakuj1zAenaad5e+RgMxZZsakA7YmcRDjFQJcpq
         Ci/sgfxl/49lOd5x/VcvSqh/SF9uwCRa/TFTzgl1yuvt1Dme3QpsK8zmvHEXTDd7MoMI
         tmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQsiSBe66HfxKtlZLu7us6AW7RVVvHT2OLSgBgHRMtMtADrKpBABflafGDWFkVjgVvGAp7LE577bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70AJErhjCK/mC7c7LC6V6z/S1CHjMg2iX7Bt46nD5rPRdyoMq
	x3+C9MHF2DM85W2wks0iv0kvhBtkAJefqpt+kowpozjswUPZzRMac/fOFMHFyRdiGh2xWweWBVW
	/ntei6A==
X-Received: from plcp17.prod.google.com ([2002:a17:902:e351:b0:2ae:5344:9e72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c406:b0:2a9:484c:ff2f
 with SMTP id d9443c01a7336-2ae823a1df5mr41713865ad.23.1772849232601; Fri, 06
 Mar 2026 18:07:12 -0800 (PST)
Date: Fri, 6 Mar 2026 18:07:11 -0800
In-Reply-To: <20251026201911.505204-14-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-14-xin@zytor.com>
Message-ID: <aauIT-6fK5Jl2Ig6@google.com>
Subject: Re: [PATCH v9 13/22] KVM: VMX: Virtualize FRED nested exception tracking
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org, sohil.mehta@intel.com
Content-Type: text/plain; charset="us-ascii"

On Sun, Oct 26, 2025, Xin Li (Intel) wrote:
>  arch/x86/include/asm/kvm_host.h |  4 +++-
>  arch/x86/include/asm/vmx.h      |  5 ++++-
>  arch/x86/kvm/svm/svm.c          |  2 +-
>  arch/x86/kvm/vmx/vmx.c          |  6 +++++-
>  arch/x86/kvm/x86.c              | 13 ++++++++++++-
>  arch/x86/kvm/x86.h              |  1 +
>  6 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 550a8716a227..3b6dadf368eb 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -760,6 +760,7 @@ struct kvm_queued_exception {
>  	u32 error_code;
>  	unsigned long payload;
>  	bool has_payload;
> +	bool nested;
>  	u64 event_data;
>  };
>  
> @@ -2231,7 +2232,8 @@ void kvm_queue_exception(struct kvm_vcpu *vcpu, unsigned nr);
>  void kvm_queue_exception_e(struct kvm_vcpu *vcpu, unsigned nr, u32 error_code);
>  void kvm_queue_exception_p(struct kvm_vcpu *vcpu, unsigned nr, unsigned long payload);
>  void kvm_requeue_exception(struct kvm_vcpu *vcpu, unsigned int nr,
> -			   bool has_error_code, u32 error_code, u64 event_data);
> +			   bool has_error_code, u32 error_code, bool nested,

I think we should pick a different name, as both VMX and SVM declare "nested" as
a global boolean.  I.e. this creates some nasty variable shadowing.

Maybe is_nested?
