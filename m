Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3E3396E6
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813956; cv=pass; b=sDIhyV30eChOmIItFK5KV8MiybWKQs1ls6YY+lOtJ5BE8+bHLpGPvSbdxy342S7IRf6MgGCyKl9liXN5/DLVqfaeND6+VyIPox7uqQesUyHByjXdB2xqdRn0Y6DRrxzwN/7+r51ZN+XHMmi5hZ1TqKHBtjd7V/LceEssddrVUyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813956; c=relaxed/simple;
	bh=y8s3ifhfbIRmZEac0G5rIHRfhu/0TKZaV0wEbXVBJlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q72zNSmamyCszdam99j9bJajXwmpTPMRYP6TKAAgyUfOyIf57l31TX+ETIoDlduqoY+2zD9T3UxluuOLvrd/JNgD+N/61SXMWKmlWxoXUw1gQGh4dgEDKOsLQAA52pvGSWPQp7Vl0EgbAwKAwpL2vqXOMA2ET2jYPyLAsJHiN9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vX1yjyBh; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vX1yjyBh"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee243b98caso481001cf.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 11:25:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813953; cv=none;
        d=google.com; s=arc-20240605;
        b=RODSO8nqUHOPf/fEGEp7w/noM4m7+x9dIww8aCMxh8oGzrxHmIFk70/bvKrrO1Cm8v
         i+uQKOkp5rIPzRa12YQWtot4YLdFdo0DUZ01kPr5g6U59aU94Lf0r15XfKVbb7Sgl6Bv
         GBi3mfoRKOz9b0EkhFE+M63svYLMny684/sROfnIQE048KpytiTp0GGtbaTG6hzP/z0D
         3nOFIgQkyUtiIPXAmUB6sa6NpeRAHkpuPNMZk69XV4jP0QU7Hwq9UGK6Pt7bhEhU9k17
         EhkDPY30pKiOxy+m1+PSYKgnu/ZX3FML3Tnh4qrhYSnCZ7xQBChrKvnOsl6dr//T25J7
         O+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=;
        fh=4MxwlRgwhbMWoOlNff3Tops5HUVm7FDeCzACxrvxAg0=;
        b=YOKstLTCtjfVzfCOgQcYVdA5j1R6/OeKkdtLVYvAPpWqnILXgWMP0RR8DHHRsfk1l1
         NJ81hGaph0W8sykmlE1GbM74k41b4VbJmLeXv2HUWz+6iognpfSw++655csq7qCkTK3M
         9ovYMpbfQWjE0952Rpk9rjweS/EQk2bPm+XsqJKX4cQCEtQ1sbctRBES9EWwyN8ESYTo
         F8kXL2GmitZP4G5cqpRPVfhJcc/shvVkCLBiNjAQxcu0bUSuK+Gc031kOBY1E7xRviOu
         6LQVHtyHItYVN5IhbAZaQjZ39AeCjbFcVTAEItabvr+n/BcZaCmhvvw4BLSE2HnJHoBP
         LXaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813953; x=1768418753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=;
        b=vX1yjyBhmp4CWQ4DaMo8exjlJpva15g3y7A8NIWIfFtzZc0X1a9orno9wSfz+cw3OV
         WNDPy7lGp3OYsX5b2+nd/yizBSFaHc7yHrGOSkQ3olLdVoJsvy7mAsFNCdfmE8P81BSX
         32o3vWMMHtzFj1PYnniArCiMwjmvRFzstZrhXAS+pBtqLh832gytaaIwsMCZej6PUgnI
         r3BxARqmyjA6lP1iFfz8pylBy4pq+YcCeU0DB45P4lHDqwBlFZCeBfpmdRUmYxYvaLc0
         AlYrAzq7PG4R1U9xtApgeNttuusHLanB4wkOynd4RQCGV91+S8n0GJ5pATM/CNIyNSPZ
         LUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813953; x=1768418753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwyOUMrzmFja205ZMg1MEdCnMMj8lyhbUqchQTaZ7Og=;
        b=YGhc+gBjXgNE7Nwr3I+2b954XJmxfihmvTVC9cSiPSiToEzXK8i71dKuieR7/pod8B
         SKXnAWfRKY8wccJGiPROUB35uWVgrw092ROvuDCBCvhcotR4nHf08kZJxR70vu4PnVJR
         fHqC9rmGDLUu/8JXc+D4/SDbRxF2vyuSxBdAysmebfaShUNInoXniiC6oUBnaTFj6HoK
         Qajsq6E6WB+GLzc/bnAW2F5gmKQ+w6BQGpSlRLdCpHAqosF3/GhUXa2G/nsz0CCf+0RM
         Kt42cbQ7mDNf6g00jwdy1xMZXjX6VsjPTbksAtTnwZZ26KHTPsTPIn+uYszc/5EzZleX
         z05Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmX7KrDWlupnariKR9NSKE2drlYoFsxIyUmSfg53be8ZoVVw1IWC8o0eL2w53waHH+t5Fvy51ylOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5NiLk8ioI2gdN5gtlWCZmKFgCCST5a8YSC5/93X9YyxCl3EDw
	ce953DC9Vw8qNVJToJ5RZR0B4ClTXv6QL+IDpaaWoSdB4GjeIRTtKkDLpi0ZnNCdHjX0dFtAHb6
	K9ZIaOh24f1HfN2qaA9XbDiyOVzBG61t6bWikMGWV
X-Gm-Gg: AY/fxX7T+tgU3l1kG2JCq4ObQLx4qce/e+oeJJLzGp5lTOVaC/DV0frCf1uihudlIr6
	SWhqQM5s5wiEJTi/RRc0HT8GXIkzT3is+suzn4qb3sOHfdJaqdWCf9fhY1oEnfCXNo7FlOdq2E+
	mA6KHXfOgCW/Xo9bL838hsB/n9v3EkwdgQtDRtDmibt9NWIovK4DiJcXayRRqUVXHgs8/tJ5ndo
	mStyXn1sJeYnCsnoSFk+VXvbiL/i/p4w1Gm5nem2pEfz1NYdraSvAMY2kxuXNrEABe+VAjuJv9t
	cMEbcTE=
X-Received: by 2002:ac8:5e06:0:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-4ffb3e48178mr14762551cf.14.1767813952742; Wed, 07 Jan 2026
 11:25:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:25:15 +0000
X-Gm-Features: AQt7F2r6YVCRnMI_bYmOfq7HyyiGhMeA9fZkYBf6xbcFUjdNaJYVtQzKKg3T4fA
Message-ID: <CA+EHjTzDxJsLi315RF43g14psdv44YOuxk6dP6SLgFz4WaY4Hw@mail.gmail.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> Currently when deciding if we need to save FFR when in streaming mode prior
> to EFI calls we check if FA64 is supported by the system. Since KVM guest
> support will mean that FA64 might be enabled and disabled at runtime switch
> to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kernel/fpsimd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 887fce177c92..f4e8cee00198 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1948,6 +1948,11 @@ static bool efi_sm_state;
>   * either doing something wrong or you need to propose some refactoring.
>   */
>
> +static bool fa64_enabled(void)
> +{
> +       return read_sysreg_s(SYS_SMCR_EL1) & SMCR_ELx_FA64;
> +}
> +
>  /*
>   * __efi_fpsimd_begin(): prepare FPSIMD for making an EFI runtime services call
>   */
> @@ -1980,7 +1985,7 @@ void __efi_fpsimd_begin(void)
>                                  * Unless we have FA64 FFR does not
>                                  * exist in streaming mode.
>                                  */
> -                               if (!system_supports_fa64())
> +                               if (!fa64_enabled())
>                                         ffr = !(svcr & SVCR_SM_MASK);
>                         }
>
> @@ -2028,7 +2033,7 @@ void __efi_fpsimd_end(void)
>                                          * Unless we have FA64 FFR does not
>                                          * exist in streaming mode.
>                                          */
> -                                       if (!system_supports_fa64())
> +                                       if (!fa64_enabled())
>                                                 ffr = false;
>                                 }
>                         }
>
> --
> 2.47.3
>
