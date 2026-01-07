Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B292C0F79
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 19:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813933; cv=pass; b=a1bw5b7ukOzXOXKDncCmtov8/zXbEXPkVzKkfmnDAk30J7yx+9ZUuUd4ptWhRL1tq+kEdXQ/Ixt8WcXfmKDdmQSSk+BTCJO8k9jagWd2e6NGxYjrZ7Nxln06K7R2bRWtyLyA8YXJXjHwzR2kNinquWpHPRKHfjU86O3aczoNW6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813933; c=relaxed/simple;
	bh=z8fphxS7A/1Qur4z0EwbQJFYY7ZrGXkIomdruCTWhiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnAIbuNvEUvGtSW1E3z0lmZCKi0hoj6JLJQZ7K8ErfUbFw0lEcgFJwp3kLjc2zBokh2AUax7GWdR7g8GmC4IzjZyMiU2+0o2RFdRCIUksXHqV2DbXiApfqKq5r7FLbjL+rl+p4DK6JzLB0I1nbF+6Bg/drKzRtamOeBPz3L4tB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=md6V+HBO; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="md6V+HBO"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee147baf7bso575611cf.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 11:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813930; cv=none;
        d=google.com; s=arc-20240605;
        b=hV7vXiDSyum7oS/4Fcx840UomPkVlpibwhAk3gCcB2CETRpaEUD0kmCJAeYHowGlI3
         4XCQLyg8ua5cFdFyuw1kRBnBhubuG2IKC2n7gaXeU5jVdxOON3bT/KjAv9dkC4aB17nA
         tAceDxtd2ht+gc6aWALGmXGGB9JRpe8mqYPvn4Bhl01gsIynWhsY8vpaF/zNI5SeQi2g
         5t/Yuyl49J5+MTdBouzrtPVlERxlMQpyEV6TeFS0MKZKGHOwZdm+ZueAqNyxDpjG9J6X
         lDp2y98QAabSWNOskEk3Akc5ZGaYshbQr+Y1J2ARXXb1rcG1xmX0+X48x8OCLowTE7VY
         y1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=;
        fh=1RaugrmVe3B1Ck2iZ7KMtietyRnXL+PQy/rLga3PiAU=;
        b=GrM0DqK1UIPa+BQsLie70KhI0ANXdU2iBBJ9s+5QNSdjXcXbzPKskj2XluJZ/LgQPc
         2sxjZQKo3TbbvQbCWhgyDUP8+Fk1p2CjoUARVvJW5qbUdFQKx21Ma9KIj04k4Z4k+R8O
         dDW7FD8z0JQ2UI1NOjUvp8bF/ppDJbADQSOzXw99k2Ga3sZCTD+wQQZuaXoLx3md49Bl
         8whqvSqbRaVune+NEx4qY+kM6U70b+q/VdSL0OKZMxBVFrXjuozZHLHotgPoPDFLVPFd
         FCWvHm/YeJk1c51CQWDtRrnGgXurE+AqVb21EWNLpuP8xSC2cIXb/lt84C3SrY+gSUVe
         mmaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813930; x=1768418730; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=;
        b=md6V+HBOPniNT9Y/pRAoZBDQhjcszlVdyKa+xECql/xfCKUBkHI49FBoMgYD9STLgV
         iP9h5KoAv32fDrbf2kHOGhvP4wcYPWZz/g8dZYgqMD8Wi/3mOyNWmEdY+9BXlIhq1nPL
         4Aukl4E3l3MU9V8jR5URmnHstzKmTxFvYCRMr3LjNxJE0B5P79uX8SVYW172m3lM7alB
         Zu9y0e+RkvL/j7jJGpaUUe/k5O6mQBGWO8I4t6Mba6z4kTmiXWQCkLsOm1dvOo0s6Ocp
         JjRIHshv4SJjpToVrA7dNTGHU8xBkuEdUPGw3GAz8P8Earvyydb0ZXriMqCSk1VlnRZB
         v/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813930; x=1768418730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdQze0tFMfdCcZRE+Fz1xsHkvoih7BkzLiCp0crO/Bc=;
        b=BTJ9DYTYlDfyJ9rw5qRqsqh/hKCZTfJ9dMSrmagD8YWpWUYVD33MGT8rD+5oq/E+WG
         mhf6pH8yKjOzVRY5o8jskzH9KbBcye6cM0Ap/ZiiutNdm+xMrtrT5xt/NEt+U2RAgchn
         zoASp5/ax5WTnokb1amiL9rfHmhmWzFBwx9Lj9HSSydiri2lHldLjgzbbzBXg6s3sW9Y
         DLDtbim0Rd8IqTc1T2mzNsUBr0N4P6UxVbRLSSjE/lUKDFfzUuTsT3BM+YYjD4ET67I3
         7lby8ixOCziCDVnp63xUhJNAEUuNbyTPy8aW9RP1OtEY/RnyWKRqNN9JkqdSDCFYUaxq
         aZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQsHlBYD03AJi7Q2HhsYQZAn+d2LyBysCcCVi237x00MOHPasv+S8yVd3LEOQDHhAG3V3Fm6Y6lM4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2L9NGlz7Dfcw3yQt6MoZ8620u7EbSK//L4WDz7QqRuppikUHE
	s6yLTwZdTYHOS/ekcXZ6WhwayFFoO11i0g1qC5zKIJL2FU11R5+Ghtl0+F2/kubQD2NTZZdQpYP
	Nm15Bdlsvippdwc4ziMW1/XgDnedsZSLdFtZFrq2q
X-Gm-Gg: AY/fxX5DoYLNawtF6d31E2Nzf/ttJLjCBt9qWq8I6t/zgb9rAEFHHAfEVVuaZmkxF4r
	xqQAtLBh8IxVBtRunTtvHJW8cp/czt0Yj2CH87Jm1L1PzU79Qi5yD/xBJlrHrVI8hi3hl3U5+vk
	5ZTguhxv58TNTCRR9bczgLYvlran4YWdWz0UnznLRtAn4hDFEg+Q/B5/nCWSYDR+kASJ22wP6kp
	JezoyCpc+/i9GxyDT3Aonc0Fm1sOc7LbJXoO9WwsFQp/S7+/Fla1phTHcFPh+zrTd+68y01
X-Received: by 2002:a05:622a:5cc:b0:4ff:7d0c:c1cf with SMTP id
 d75a77b69052e-4ffb3aa6b6bmr15709851cf.0.1767813929956; Wed, 07 Jan 2026
 11:25:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-1-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:24:52 +0000
X-Gm-Features: AQt7F2osm9O_NLuokFKY_-m1ya4_XJF8FlJHLjM1yNQTzxjP3vc84G0MiN9eNTY
Message-ID: <CA+EHjTwsX9+3XZBZo8PHvaP24fVxBKSdg_raJGL46nX5hE-4rA@mail.gmail.com>
Subject: Re: [PATCH v9 01/30] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
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
> Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the

nit: definiton->definition

> information in DD0601 2025-06. This includes somewhat more generic ways of
> describing the sharing of SMCUs, more information on supported priorities
> and provides additional resolution for describing affinity groups.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

It matches the spec.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/tools/sysreg | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8921b51866d6..6bf143bfe57c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3660,11 +3660,15 @@ Field   3:0     BS
>  EndSysreg
>
>  Sysreg SMIDR_EL1       3       1       0       0       6
> -Res0   63:32
> +Res0   63:60
> +Field  59:56   NSMC
> +Field  55:52   HIP
> +Field  51:32   AFFINITY2
>  Field  31:24   IMPLEMENTER
>  Field  23:16   REVISION
>  Field  15      SMPS
> -Res0   14:12
> +Field  14:13   SH
> +Res0   12
>  Field  11:0    AFFINITY
>  EndSysreg
>
>
> --
> 2.47.3
>
