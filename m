Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E985B37E316
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240798; cv=pass; b=JtEPIaHcgr9sPMXb23tLS2qEePAkhyiZhtRzQgTNhhBUchD63j1Qt4l8kuL6p2dLAPDaMJM5/3VYvcrEqWlatwNkLzO02wkFgn+siKZSeFapcWAH9uf2PnAg+SAXMymL1V2jtxzgOUnsdORCV5lGTiW2R5DjvQ572nnPGIBrQGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240798; c=relaxed/simple;
	bh=W2KRaBZYvG8HVg3eIWgL8kg0vNUppturNmvWPxflHbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryeO5GKmp8V2L5E+sDcoL1H01s16yueIYm07iHOiDHVUxR7g7KQ7Y7Y9E4v5WS5/A+vlhTv1SUfP0rsltIfbNbedKT/GgwHmPPrnlQHYe5V4xIZRrDGwZKc43TaR38GAVDW6/BuMThxAxn+OXW/0BoH7ie+Fgp0KYpTIO6H8tWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z9wZuziO; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z9wZuziO"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ffbaaafac4so8191cf.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 09:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768240796; cv=none;
        d=google.com; s=arc-20240605;
        b=Eo0gnTos6/aX6/KbBOwtV9Sutri2Y1LBNiNfDiLnZ2+jf01T1j5axmzCIIGIUx6Ho0
         AGZnKMvg1gjiwuVd+MDr9rMNjktwcOblO1mWF9n5z+4lI+nUgYJfYpHMrvOexe4B9zL2
         m4KvECgK0JlaP+qegoRI7ZRwukwqg7jSEGjDNm/bibWRExiIBKVq7zk0fWl0ZrTIvzd6
         e5ZnYGDLsjbaPfSMzrynHobaLEyr8IG3sSiWa8JkxLIhhFEgqXox3nkFLUiFhLGzZL5l
         sHLT7moYSFaakVyYgzOb3dm27s0N3MuSYDCC7hf86VN3YpdA8Z3X04qtJ7dWjLPt5v15
         mPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=;
        fh=IdFhMWVjGkPC1m9nckxyu9gH/9XW+LniTCxXDExQG1M=;
        b=lGAp39zYuziF9DNhDpa+Sd0J6gfdG0bpZNYppFyEdr13xZMsZkFLUzizCfiwI7/PMW
         vaesJTl1aksSAjAHCixqwQs/dzsf2pGC8ZCq6xjUqHQz2rITlvqUjsGphoeIDnOJFwXf
         kBVVmL4SgijdB6ItwZrttfqlDAee/lRmdHJj+vaEmVtfimd0IyLXDYXfyR51wz3BY5OJ
         l50x9hxFcL32QLi9nOUPQOosskqOX5qcW1jSp7gO4lbaBGAL5j+GPxvdU/osCoP32gkU
         YkXuKwM6HAnlBPj9NXXZc1sP9pWjCHdDdsGUbqa9kb2yMYLMxkhERXP/QJ9cz2nGTzex
         MmwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768240796; x=1768845596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=;
        b=z9wZuziO/HLkdQvgQlLAQeD650exNhp3chBXsmGignnysuk3g8vtBx1tED3fq1fp4Q
         XhTgrjRzniyPykzbI6ggldfLy+EjSZasJ35/9ajLagge7t0vh2BXqLgpImUxaaPoOQcW
         bSC4xSd+TvNOPXWGo7j0YTfRHjN+2HSfNlvTByBKZByVx2gp1OG7oRNk0O3wvb1aFTHF
         VHkUx9DJ1pGTd3RcznuGvaeN07uJWRAs6zOioLQxmotS/fb/C+HsOT9LgSDJGLAOP0Z3
         DC4YQLiWJYS2c7vAxx0kna8t8o1uAwOt8Rc7U98llPuwua9DowDDG6gPNWZUS4OpWnus
         YbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240796; x=1768845596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJjpEAphM/NB+/t61DhxYCEIiQ3uh5viKOO+at6PH6g=;
        b=DpSralX1+F15aOVtwG4/Mf0bp/nvqGADeMd9twA2RBNp7LIcoIfRlSWbeq2oRcLB0z
         z6WaX+n5XEnONy4aVG+pkMZ5zYP44F7Tdw0d1fOi+c7zA1EgvapKa+k+zGLgUUgFtugf
         J6BxnWyB9kSoHHd5IVxguHRzY87VrNvuNLX4CvRjH6wj+TGgf7ut6kSM3pR98PIzq0ni
         cKmnCQ5/+19rjFS0wrvrCKoatp66pfSCQqrirjjRvW8S/llS+5zliMdaf6eaMAW3onx9
         Ykecp1HKBLssDXHXG9a1plzRKgmKEgSpUbGFLJI6zNR+fv76evHTqtCJO+KGTY9/kETr
         r7ew==
X-Forwarded-Encrypted: i=1; AJvYcCVOyY8xNY8zx04IR/hxshWugeiQ8HXbTwYbsHAKKTiTXn4cnTwq2YQ22DYzQKt/Ns0YvUkGcWF2LDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVpabiDXDqiTkMr7Hzhy5q+NUYRjIKrvknHYMqpOAuspeiw65i
	bryMei9FSaHX8i1hONoJ1EwQ4MLhRgYBzOJOoJowyYlIZKvdM7K14sd05TyCKNTbqFFrNHkMwxw
	ANkumU6ErafEvD6a13KfVP0Wwd3W+ZXzrQZJvwxB6
X-Gm-Gg: AY/fxX59AAWdqcBImkvsYFQzSYogv9yW6toX4ZdC2t3PtXRbrwpic+gZwnn8xbYKOn9
	PC7HtTUgLjagGn/dkKYXlJQ6IHQk33eBfPcMo49CvotDhb0VlLmBnUpSPBrvMnJskeuumP6DLMF
	+2IHZAQVRG6OhjH61Op7Op2WB05JApkIk66gqUiLz7euNGvr/rh1jKr7oBj2ren54jHwYnNMw5U
	7PxuIuZrdSdvl4OZltj2Rlr1kvTdLYCP5vSe+aHTGE1zbu5N2BGPhatejTAyorzK+YZYo6/
X-Received: by 2002:ac8:7dc5:0:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-50119766a66mr21632291cf.9.1768240795172; Mon, 12 Jan 2026
 09:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 17:59:17 +0000
X-Gm-Features: AZwV_QiQU0Otl0OZ50pDvqjq5GLQexN4JJXUaeH6JoNDjhaymp7I-l_cuFsktUI
Message-ID: <CA+EHjTwQ4fLBE1YXoB6M0eamSgGDW=nfLaC+-_surBfVbh3byQ@mail.gmail.com>
Subject: Re: [PATCH v9 19/30] KVM: arm64: Provide assembly for SME register access
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> Provide versions of the SME state save and restore functions for the
> hypervisor to allow it to restore ZA and ZT for guests.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_hyp.h |  3 +++
>  arch/arm64/kvm/hyp/fpsimd.S      | 26 ++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
> index 0317790dd3b7..1cef9991d238 100644
> --- a/arch/arm64/include/asm/kvm_hyp.h
> +++ b/arch/arm64/include/asm/kvm_hyp.h
> @@ -116,6 +116,9 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
>  void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
>  void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
>  void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
> +int __sve_get_vl(void);
> +void __sme_save_state(void const *state, bool restore_zt);
> +void __sme_restore_state(void const *state, bool restore_zt);

Would it be a good idea to pass the VL to these functions. Currently,
they assume that the hardware's current VL matches the buffer's
intended layout. But if there is a mismatch between the guest's VL and
the current one, this could be difficult to debug. Passing the VL and
checking it against _sme_rdsvl would be an inexpensive way to avoid
these.

>
>  u64 __guest_enter(struct kvm_vcpu *vcpu);
>
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index 6e16cbfc5df2..44a1b0a483da 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -29,3 +29,29 @@ SYM_FUNC_START(__sve_save_state)
>         sve_save 0, x1, x2, 3
>         ret
>  SYM_FUNC_END(__sve_save_state)
> +
> +SYM_FUNC_START(__sve_get_vl)
> +       _sve_rdvl       0, 1
> +       ret
> +SYM_FUNC_END(__sve_get_vl)

Since this is just one instruction, would it be better to implement it
as an inline assembly in the header file rather than a full
SYM_FUNC_START, to reduce the overhead?

> +
> +SYM_FUNC_START(__sme_save_state)

I think that this needs an isb(). We need to ensure that SMCR updates
are visible here. Looking ahead to where you introduce
__hyp_sme_save_guest(), that doesn't have a barrier after updating
SMCR. The alternative is to call the barrier where it's needed, but
make sure that this is well documented.

> +       _sme_rdsvl      2, 1            // x2 = VL/8
> +       sme_save_za 0, x2, 12           // Leaves x0 pointing to the end of ZA
> +
> +       cbz     x1, 1f
> +       _str_zt 0
> +1:
> +       ret
> +SYM_FUNC_END(__sme_save_state)
> +
> +SYM_FUNC_START(__sme_restore_state)

Same as above.

Cheers,
/fuad







> +       _sme_rdsvl      2, 1            // x2 = VL/8
> +       sme_load_za     0, x2, 12       // Leaves x0 pointing to end of ZA
> +
> +       cbz     x1, 1f
> +       _ldr_zt 0
> +
> +1:
> +       ret
> +SYM_FUNC_END(__sme_restore_state)
>
> --
> 2.47.3
>
