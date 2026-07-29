Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DE73F9F51
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338412; cv=pass; b=lNAorBSAPdjYwJuu1ABzS7pNYRu/1k1lnEJel4uaQ1IiQPcoJ1ls2hxPRytPwnblfs3hsoIrIB8wdvGaIIj4tUjWPVhkjEkEzhOBFlKp65R7R6s4S3He5Lf5TT/Yjtrde7/EI5R6kc3XB0qtfeYpFfxT7Ykos5TCu14evnRaRww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338412; c=relaxed/simple;
	bh=3BAdkEbGZqLfwXxKr2RxchaDtVa9lkmIZOkFm2/fWWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1jklRt4v9XRg8bNlCs1kft3H53CXf/3eDdAzMAz5kLDfl94c0qMceGB+sYhQKpL6lv5mWOexfD6gx8dVI5F1IftBxwJGmtjl0BnNmc2zc/inRamlu3M84GjXypGm/FpesAMehwlT26hMaqCIWNEJqFx2gT3cnNjgAls+4tyc9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=flwBmU+8; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="flwBmU+8"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c10e86e52so279981cf.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 08:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338410; cv=none;
        d=google.com; s=arc-20260327;
        b=ixQuAOry071z0xWN+qAsXYQhwKP8g6e3geGZUH8qfSNzZnvHmeH3l5jU2KyFTNACcM
         RDzU4Jg1GTKLIvKWhMjnqnSUSe/gJe6JonL+av9HXQQNQEIaSxim7dlQgHQmCTtsfxEX
         oNgpcHUjpxCjeUU28CWbLrxzfNMR1GoXlnWaYqVvZ3ZCFeMuU+AeCHdzQDnSgZvuGgIB
         ptFcqGMP2rh67p5yRGrMY1ODOjgHEaZxEBv/AB9nHFSvMd5D9kWmc19iA+U4sZRCb8TV
         uYlsv67AP/twrRXnX3Dy10TFv6yMib+Z5iyX9JlevilCbFGkW24D/VC/jyXoLOWYfWQR
         +N5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        fh=sMFCiCASx7T08zO+9zLdPGx3kazMoGxxRKM7IssjZCg=;
        b=p07YR3fns12G1DdOjlrtPTKcTB7pjg5asr5PAhoGYgL7uTk24TnFhOAkpm2NJcVS1s
         kiHo753qrvWW3LWq8wIFJjR5YrFP7vXbxHkfhiD4+RvYIjM1WH/5CyBlXBFnFeRVJ+Yf
         J2T4TLsBo7ci9cFZtICUdacWdfaZ4lqzbqRPLuBR8WhkLp2o5EH8D6f6BZVOWah7STRM
         LH+XOWaYKxpaBQC00oF4HLuSiomJfUiZEsErhEr/SOyASDtZ8A/+LFXljTp5CNqihrNL
         JlQwgPCXNO6UtpG0KpE7BlKsoF3U0Tc5sfj3p4On9W5h+BBXP708HOWXL6A3788QyMjq
         49Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338410; x=1785943210; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        b=flwBmU+8K3TKZ4m+kVr/qD3PwiqtKxCBtZOWMCEzCQPDKE660BJkTnvZLrrGCOKwAI
         VCQojgYDfZCWaOWKJM0M2Y9PVXPYOToE49vwJ4NHRZ1VuERrWOQOEwKUp4CDr9mVMOur
         oEFVHoWrY5dqdiWN/uvtTMIS//nmrNtYWM2m/Qj65HxLpQxEU0uGnJqFFUV90VNySugR
         ct1kaHpci+Sg45BXe77xef1s2HKul1bAoWqSFoZyCm3G3sWuZOsOHGZWrl5xwtrCxsXF
         opnkgHIe8rGQxa+fMtlMC2Pr1NpX/F3eGQ4CKrhQ2TVbccGaAALanGXG0LZzyioKaqRd
         NVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338410; x=1785943210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JYgZt/35SRTSOby0/Cc9E+OqarqONJhII6K0Q/18dbI=;
        b=MnjexhTwEgapJTDQqoK2DpliCNnMATNC3q55ig8t0ktwJyO5QR/XJkzLud9YDiNIyD
         8bihifjQMzNaxLqqCoBTNsYMYrF1CPDaiGNLSe6mjNTf+xvZBjCQK7UQADL1gGbuS66V
         G1HaPTQOm4XqxujmvI0ZWmHqKvI+hJiFejFyG63vpNe2fFl08iF83lIg9EwwTL21xHMH
         9Plh+ns76LPAtVyLiCDnFogOEABSuyQtV3nSXEtIPZSpp1HlfFeWDu3O+eU6IMUidZnp
         PgvcO6jPOrTz/hCwwbNHWe7ot3FBXmLECGY2bCbvcO3eMwKE1a0b0ScdlQYJqFRhcfuc
         MD+w==
X-Forwarded-Encrypted: i=1; AHgh+Rq/zh/7b6GDFeB1QGs8jcjZ8miHpk4dtLNrbiBUn63/3D5WIyUBUyS015HNbZlWs4bInYDvtwHf1r0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznn0s4SVVXkir1JyfXq8eHNHfCi1vkW0d4ZriwuHjEwwdMXJ71
	qj//+vCyCZijoHgDpnxH2o1/Hb7xOSmcNXR96vswV7dSESIAxFbFi4VF+KUYSKBO1fakY5uzZ4d
	gSOTHxzaZLz6eS+Bi2q2QKbDV7c/NtQOkc5xCc1/k
X-Gm-Gg: AR+sD13ftjJHJ3Q7wDQ/IU8bjUq4x0HSa0ilV9y6QNknqBTNFa701saQb55ektU/zu4
	RXs8Hq0EcDI3AzADMzkPiY2DkjITMt/cAZUCL9S90YEg9M/KxJ8vLIOcbiRkZ8GI71iBTBK++Ft
	H+IZPdelB13X6xqgPTMnyWFsrRKmsSDp+o0RFMDrd7FsTKl2KyKTi/0KrvXv31ZlXjkwPdQQCFo
	PsphyPW1LtnvNs5hygM+HDAluCr4xiYQawJXs/s7LG4rCqqP7oOe0Lr5un4aX7Dp/6MjcOH/Lah
	y+KAyU2czUfXBsEPQ9YyaC2NyXtkB3d76qfAHiaTtC+aTyNxeUdvMd/s+qBfmk8U8UBm1Plrypf
	0IlKlxQEs3w==
X-Received: by 2002:a05:622a:9014:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-52b34e95118mr803001cf.4.1785338408902; Wed, 29 Jul 2026
 08:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-3-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:19:31 +0100
X-Gm-Features: AUfX_mwnVrQrZWbAViwhlMWDHtZtcw4flUU1g4ENMs-4TGfR7On64kQESsXcw8M
Message-ID: <CA+EHjTyYk0Dcc-8RbvQZHFBZ7HM7cekfg3O5MR4jo57qX5SohA@mail.gmail.com>
Subject: Re: [PATCH v9 03/16] KVM: arm64: PMU: Freeze counter count after
 first run
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> PMU configuration is VM-scoped, but SET_NR_COUNTERS can be issued
> through any vCPU. Checking only whether that vCPU's PMU has been
> initialized allows userspace to change the counter count through an idle
> sibling after another vCPU has run.
>
> Reject the attribute once any vCPU has run. This keeps the VM-wide
> implemented counter mask and the PMCR_EL0.N value stable after guest
> execution begins.
>
> Fixes: b7628c797376 ("KVM: arm64: Allow userspace to limit the number of PMU counters for EL2 VMs")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/pmu-emul.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index b5df6843dbcd..b4b877f31097 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -1087,6 +1087,9 @@ static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>  {
>         struct kvm *kvm = vcpu->kvm;
>
> +       if (kvm_vm_has_ran_once(kvm))
> +               return -EBUSY;
> +
>         if (!kvm->arch.arm_pmu)
>                 return -EINVAL;
>
>
> --
> 2.55.0
>
>
