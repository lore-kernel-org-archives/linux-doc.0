Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1235CB9E
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974184; cv=pass; b=Bal82dk5I7v3FdTrxmF5dTuhRgbqHaXFPpcz0jDz3AA1QzPcqMjyWYN1B1YeO//m1k8Npev0azl2+U6roJc9v8MiYhu8wB/Q4JMJYJ79PGDIciS8DMFImVRO7zD1lvyc2rUrAR/uIqCNw2kcmd88Tok0MfN2HClzqKaHpxfVFNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974184; c=relaxed/simple;
	bh=RJop5DvCjIWLKeaevl0mMUi6g/p1XvGrRQjivQIYqSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxbJQNWfAbT4CuPR3TiR0RmkVywSo3TdroudqbMSkfwyRhZ9y8h4ureC5hYFuiEKXWO5DktQ0IzDjE/n/o7RW2OaKPgaASJKRf2EQNLCnYKVhLltoxwS3Tv/0AUE+Q5IW96agREEIMr6quEzCpQJSpnleT1yyp8hfEW3q166Fto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aOnZrg1O; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aOnZrg1O"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4edb8d6e98aso578441cf.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 07:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974182; cv=none;
        d=google.com; s=arc-20240605;
        b=DmH5rzYzcm9/ZFG+l8q8pM9m/TMQsnuHTePfEE80YnhiyeoHMkGlqMbHWWJhKvinO2
         /hS/0WiB9NfYA8G4aep6d5CjKnVn1/CxckgEg+WEO12YWRoSsyGGny2YftTW/iEECAfS
         s1I5e6FiwDGySnvPw0bj+DPa61GdSXoPpIgiQM6xP/0qeVlEbe4Ssyx9yPZfZ6FVL2Vc
         xuKsDMvpUcQkmZ/XDPlDYVLoWyU66yxmfcE8YDwLPQrgQRI7pE3sv06gmGNkZ/b3q2le
         tyquOtoVcx1OOxDZauKwc37oCJuVUAVSVk0ZWtu/wAfE2yJs6AF1Yvwv4zGLcxmwnRFn
         jZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=;
        fh=PugKwyW+jMX282aCUu/tuAlHCaCswKkBshn9wfXay38=;
        b=kIyPvybqX6kacXkk6hafPHSAZyQnHcHeGNKuMhxMaIrPQ41Vsd7TOwmMcnu/3qn5Ww
         +IG12dKwYBBZG1cWM9FLKpX2vDbCoAAYZVG7PAy0lbpzU631UDDzuP0OIUtYM+GKJS1h
         Ulmu3BpZxL3WAxW2vegjoCa6boLIueIWULMdVAYxICdiFdeperWXCq0+zrpzZDk38ZYC
         FJkQ30eDgOYPQ5ADGFvSPZVfJF3HnX1OhlUlr/3GwgDBxcoZUeg97xkYnY3+fJUwCNNb
         FhojY+Kcw84lBzH+eVSW68jKmHZAouNoB8lki921eUbVYyOT4kVZTHrb6Y79DiVIOsUi
         2/ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974182; x=1768578982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=;
        b=aOnZrg1OPl7eDlojGo98JRYTJvq/PnfnNQZ9XcAV/DHytRrdch0y/4x5n+5k3Xp8E8
         9mSQAxxSyg1covqqhLMvcHpYWZBomI6se0JkRaPkoQ4M3cYxLK62tmjM2eqwghvtyA2/
         s9chezLI2pDKYDGOa6EyZQDuvSO7XvMiX7rLgzM5khLqUpDYvLfcXsZT/mfCjeJENi/F
         KtDCFATbEQkFlr/c5a6EGPZcMsViCLHgVsP80mwTf3t47xFHMBtQUBpRtSKnphrzLNxX
         lhcUwN7gu/HVScIFCq3BILbuoqHBxaA9PlA77RyrxyzMWGQAwN57xNwzWIRDZ/gu0J2d
         5nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974182; x=1768578982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5CL8FxNgdT9nItA6mQg13QZSgYd92jfbMmDmpgGf0w=;
        b=r6D4SzU2HZdNnhV4LTB3euVx7BoaVBzHuq9JyZdZJkGQfaKObWfCeuzy/oXvz1x9lV
         FkQriGedXHbNk/Oe3sbtBbmAc2O+V8I7D3DhHBkF+Mvj8nttEhC23nSEqUs9vys47oNh
         eEwJRWdG2Q5zs1LQYmkCFYVVw8ge3slsZ+MCaSVrpTJ5aTgjFT8QUFEnbQkZgsgYVYxD
         M8xYMqQk4K/hvqad5A6ml/uvKT1qL3C4dqHZPi4XKhqg4HA5dpePwM7pMvKX/q8afZNY
         AjczXk5MW5ltv8UMskQLns0xehp/PV4IxfY//BpzDZSUu7bDPjLlY+JLyqwl9ZmS/GoW
         fIrg==
X-Forwarded-Encrypted: i=1; AJvYcCUnj8fagNosMut1X+XiKPfL2ZGmtLb5SXxjEXsq1Z44gie/AllZsUDdNk596ZjcZXEclECp9DOmsT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmHt8JSZmgQDVVx4MyopuoiFwOGx2ofjYe3MvvMHpuT9NswU/W
	bYg66UG+pkDUuXAO2x6Jhocrf7Xav9+1ikEwvhjZl8Qoz8Hnm88sLafxcO6rUiNBgSBUuEe1g9+
	K2Vej/PS7Ya901hEjtWA76rFPFIBMh8pBBeQoWm72
X-Gm-Gg: AY/fxX7ICLUZ1RFRbpj/2RyvevNTBWVVseOqWxVd5APl8gd4xx/DUE7LwQ1L0mU+Q3T
	h/hCs2H7lHHronX6zdOaO9c6jz5zX1vT/gZKgXVtFCllFqGGVGTYa9+VHpS7PdhO70mXmJNabnv
	2/1iV8/oMIDnds9RUh1VOQXOqLKBw/fIvZR8P8FraKZ4mivAzPJEdUxDY2sjjvufvmWEljs3Dom
	ivaZR1pQLEQDC9NJD4KWJoTk3DnJDP/ugbc1WMPxgkSU9c6huSk0sbuurlO9vf1QHMSLO+V
X-Received: by 2002:a05:622a:1827:b0:4ed:ff77:1a85 with SMTP id
 d75a77b69052e-4ffcb233993mr10494381cf.17.1767974181223; Fri, 09 Jan 2026
 07:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-12-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-12-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:55:44 +0000
X-Gm-Features: AZwV_QjYKCnQMH_dJFXuijQwcG8RABb6JnH52RR1LbUrpQK_8_OFYA5NFixm6a4
Message-ID: <CA+EHjTy95BPnZzZcrR8eOekTm9Cv41D_BCkH1puWtDG3JO6yTQ@mail.gmail.com>
Subject: Re: [PATCH v9 12/30] KVM: arm64: Rename sve_state_reg_region
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

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> As for SVE we will need to pull parts of dynamically sized registers out of
> a block of memory for SME so we will use a similar code pattern for this.
> Rename the current struct sve_state_reg_region in preparation for this.
>
> No functional change.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/guest.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index d15aa2da1891..8c3405b5d7b1 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -404,9 +404,9 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   */
>  #define vcpu_sve_slices(vcpu) 1
>
> -/* Bounds of a single SVE register slice within vcpu->arch.sve_state */
> -struct sve_state_reg_region {
> -       unsigned int koffset;   /* offset into sve_state in kernel memory */
> +/* Bounds of a single register slice within vcpu->arch.s[mv]e_state */

nit: I'm not sure that the space saving of s[mv]e_state is worth the
added difficulty or reading compared with writing sve_state/sme_state

That said:
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> +struct vec_state_reg_region {
> +       unsigned int koffset;   /* offset into s[mv]e_state in kernel memory */
>         unsigned int klen;      /* length in kernel memory */
>         unsigned int upad;      /* extra trailing padding in user memory */
>  };
> @@ -415,7 +415,7 @@ struct sve_state_reg_region {
>   * Validate SVE register ID and get sanitised bounds for user/kernel SVE
>   * register copy
>   */
> -static int sve_reg_to_region(struct sve_state_reg_region *region,
> +static int sve_reg_to_region(struct vec_state_reg_region *region,
>                              struct kvm_vcpu *vcpu,
>                              const struct kvm_one_reg *reg)
>  {
> @@ -485,7 +485,7 @@ static int sve_reg_to_region(struct sve_state_reg_region *region,
>  static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>         int ret;
> -       struct sve_state_reg_region region;
> +       struct vec_state_reg_region region;
>         char __user *uptr = (char __user *)reg->addr;
>
>         /* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
> @@ -511,7 +511,7 @@ static int get_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
>         int ret;
> -       struct sve_state_reg_region region;
> +       struct vec_state_reg_region region;
>         const char __user *uptr = (const char __user *)reg->addr;
>
>         /* Handle the KVM_REG_ARM64_SVE_VLS pseudo-reg as a special case: */
>
> --
> 2.47.3
>
