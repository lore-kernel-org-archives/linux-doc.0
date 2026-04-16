Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9FA372EFF
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776379532; cv=none; b=VADqGbNSnNp/EbS3Q9XkT+rRzSHEAPNNrEDb4H/2TvOsyHwSnoSdKVTha0jseZN/JO0OPHqb5AKaPybUIbJUwPGn940BdV1TDY7yuU/6z8kT0tsif0wmggCNLozv/UGBDR9QmCoMNbwU/GceQq9VjE5Syj8p1kcf6gSR4PnLsgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776379532; c=relaxed/simple;
	bh=ZdK1a4wtfo6i5zxop3WmUHjbFCExnKakE+Bz0u8FlGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lX1/frxXJ9C4TKYcPBxItnvBOERe8Z4v1qFKCkIRyISeYTkrWoqFKXxeAmurXaDw2qLwDu4uGxbr6Xd/+3ShAg46OvUYgrY/QnVJObbnzVgMJZekDAxDzz0bMiw1nAegbHge3CAf/K/Ib+MudVDBF9kGEK55FxRAQUQbZV5Vp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oD2Q4702; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oD2Q4702"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f220f1dabso61880b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 15:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776379529; x=1776984329; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx0IUbv8zstyDUBxyHbJwQtyJ++166gxIFGlq89qnlY=;
        b=oD2Q4702I7BSwNuCN9gviJkqII58feIyTGV4IS4oBltdYOC/Q3A9c1P8TaiAUOrIP3
         EVJeizfDfbB7UQ+og3yB9nLAcx6e0dP15MgEthMcQHrvROh/YjifaOlUyvIVVeksJ5kz
         dtl0YZTOBcUBMSlFtQiUXp/PbzMkzwjKMoZTurguZRFRFZgiPxbwnsoCx0Vl2f9/M/5c
         uzRHU9intoNYo+EKRayFpDEbRLy4NQ6FyiOxeyv+2sAhy+Q1hlHL3GsEEIFnZxJ1+IWb
         4iGmNUrYWlI2PqKVIB75p+knrafvxc63ueKpIR+XzK/u0gWCk1ciBp9/CM2WymSDF830
         9XAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776379529; x=1776984329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx0IUbv8zstyDUBxyHbJwQtyJ++166gxIFGlq89qnlY=;
        b=faJxUZriRZzi5uCnz/wUPxAHnHBOHG106rwQ/+VbhGxXxKhIdwQcvQTlM21MRMOxkb
         xSO5XdOhyBT+wiBQBzH6E3+t54XgIx2raYhwkMRMBS2kprwFdVwEOGnEamFWhCvgs8Ls
         VIBDYA2bkPHL1dz5rUETAGm3KIceXzYwta/bb50qBZU8boj3hggDK1L+rXnWOQI9aex9
         xjocxNs2lxb4+JuQrMUI5zci/BOpUf/0C5GYp+2+5Kx/0qw2QGIqER8g5lWM9Svk7SWc
         fThoEWZErHiBn3M8LC56IjfOaki0XpwZLLEebzZzuCtsN25sVpBlaaxfgfSJi7A9D2U8
         Katw==
X-Forwarded-Encrypted: i=1; AFNElJ88h+MxBa7U3vD9OCh3M7yamUvcgOMghOfPasbuAURcltKWWqDdEqqjIKqvtNJG644WPO62kt62JtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcl5BbBoc2eTC0NcbiBNYqOpcE2rcvnVuOXmu5y0CVMCQm1kd4
	6fB9MDQUwQlTxbJ+DHQZyzKuviOVwyifacMi6CXR8AvwXHOCq/bF0H29cqdxxWU7bbNVlp7rSrV
	AQzRwdg==
X-Received: from pfbjw37.prod.google.com ([2002:a05:6a00:92a5:b0:82a:5e62:7b95])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d87:b0:82a:ea3:c172
 with SMTP id d2e1a72fcca58-82f8c9341f5mr143500b3a.46.1776379529104; Thu, 16
 Apr 2026 15:45:29 -0700 (PDT)
Date: Thu, 16 Apr 2026 15:45:27 -0700
In-Reply-To: <20260414-vmscape-bhb-v10-9-efa924abae5f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260414-vmscape-bhb-v10-0-efa924abae5f@linux.intel.com> <20260414-vmscape-bhb-v10-9-efa924abae5f@linux.intel.com>
Message-ID: <aeFmh8Fz6xzkfQKb@google.com>
Subject: Re: [PATCH v10 09/12] x86/vmscape: Use static_call() for predictor flush
From: Sean Christopherson <seanjc@google.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	David Laight <david.laight.linux@gmail.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Asit Mallick <asit.k.mallick@intel.com>, Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 14, 2026, Pawan Gupta wrote:
> Adding more mitigation options at exit-to-userspace for VMSCAPE would
> usually require a series of checks to decide which mitigation to use. In
> this case, the mitigation is done by calling a function, which is decided
> at boot. So, adding more feature flags and multiple checks can be avoided
> by using static_call() to the mitigating function.
> 
> Replace the flag-based mitigation selector with a static_call(). This also
> frees the existing X86_FEATURE_IBPB_EXIT_TO_USER.
> 
> Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> Tested-by: Jon Kohler <jon@nutanix.com>
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---

For the KVM change,

Acked-by: Sean Christopherson <seanjc@google.com>

> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 45d7cfedc507..5582056b2fa1 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11463,7 +11463,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>  	 * set for the CPU that actually ran the guest, and not the CPU that it
>  	 * may migrate to.
>  	 */
> -	if (cpu_feature_enabled(X86_FEATURE_IBPB_EXIT_TO_USER))
> +	if (static_call_query(vmscape_predictor_flush))
>  		this_cpu_write(x86_predictor_flush_exit_to_user, true);
>  
>  	/*
