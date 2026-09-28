Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB50440A2F
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578616; cv=pass; b=a7E/FHV0P+Fmeh4SakDWM8uJllRFMTCZtJ2ugg2nI/JnG99AqV+/3wqDQ0n4AZzL/SELgNestegNpwTBQruKa/u8ZcxzjL11GfN656horz4INrV+OSReqkQkDDB/wrLlc5xLfj8J9G8sfQlfay9kvDpZS9Xp9ute6EAII972sC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578616; c=relaxed/simple;
	bh=oDVFyTgc0jEjWTx3wGakD1eVCDxa9++gL5VON22nCjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4K1MC5ClQMfOv8jVVmNTYwGc/zHRRWpgh2YGH/c9U/jEgsI5pdeFs93j3NM7pfXkslKb36RuTnbYelzsI9WX1vGXcgul14dwCnAxAdRs8bh3IouywKgGr0LwGkL3241yP7xHOntGEVvou01iRYkHX55XHWfCeeeJZ1YhtNcBmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/IV2XUt; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/IV2XUt"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so3722e87.1
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 23:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790578611; cv=none;
        d=google.com; s=arc-20260327;
        b=YlwpuhVZpFT6kcZHsbQrQFAldqCpFvV7RQDJo3+vx5v5BNSDOIP6LkEksjrRrRzcNb
         YYlNuzzCY/87uIOutdMKft6K8WMoT+EpFCe3zpkRQGwQ0hhtEGaj6PEGRxRA2qQpd9qP
         eeHkfR0673vbAXSsnKKRiZpN/gE/+e2tBuEgPpS5kmB550SU/mkiKklM5iSznUN+xSrD
         r809zOKE6mok/SPIrh29LFjVEIaBfHX5Wu9r1F68rY5wFzvgPj4ap57sk2lsmq52GbX2
         1pYuTFKK9Q6M4wOelOdOw4E3xbKnk6akosY9vcdET1AK7V8NbHdK8r54DdhzO9m1JK8s
         xj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        fh=ZQVRCT6iJkuwchkszoj7nhT0RqYIjSNBHstAVCK1xuA=;
        b=UNMfQGgfOWvYwm+WxqNdudIw1FCg7ZvhkBc6sx14+a5LJcVeviSLEKecIHRVsySFum
         P4nFNng4+6ZdVDjmuXhgSJE4k7knXdR9FyorPx+sJHtx2EMCyMyxBLlpVSnSgnloKo7p
         lmXiCSfVftlK+kOuGcmeX6JWslLRFq3wL+3PVver9XURIztjML7vOfiEaSndluPgbrBA
         FRVrPpLp5vIWgiRTZ0BVco12BC0OrgUBoP49diwh2Tyh2LYcI3U10NOJRTrUg72XkMTr
         CXlqHYxQNDfn6EB/IqnqtZ4nNEaJ8968RyNgJdKTnDdl0838BatrH64mN65xT+NYf0Ao
         eo1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790578611; x=1791183411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        b=O/IV2XUtt5v++XKoGnEV+x35eWOPUL9sGjlf3wSWbuTO4kBPNiMaPE+IoNhhnUDGMz
         TB+gXTjCnWA1QoK9JpR2eZlcNuu+IV04PP5cEwysiIAXsJgkqueMzO2H72bUTlLYLeLN
         1wABQNlX7FgJ7hJo21L3fdm8pb/i1fRFwWl3NEK/1a2ma85MAlpwpSmmQ0Hg8Q0gv/F7
         DLT5sIqWhYM2QNnLLYlpJLWQ7vHz22hBsxyVGVkh4mpKQQnti1pFL+oF+9W/3SKNQqmF
         TdZ4UnN9T8xEI3sDbl6DYm+KcfR6FK13iVGixBZdbnuSq5rpNsJ22KIQHSqIQNdCB8oh
         wUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578611; x=1791183411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        b=znumskpvvqEZkpQKmAU57BJSXUFZbdZNsWaa3M5a2i4YU5JrLZdsPzohbPzjKJf+NT
         sU04/8aIcayVqOFEm8KSUM4SixKfk6+LpJO+u1/9AsqAlCOmRBz2wqZcVn4wV+ss2YdL
         +gEEvqAqlecexzulI7p5IZiiro1slMceF0opdK0LjH0SOSt6Q07yzoF6Xh4CnkcLEPu+
         0rgRcBNnbW9po4c9EuyFRcR3QONBAj0OknxntFYtoK2mWLewBErpGstCZSm7P5MkfVZN
         HYTqKDq1lc0wt7mNqUPvMxxBv7TSWLcDSbVv4dhZ8uQvwZyCnh+Jp2eiKdl+P4wLKrDK
         kE0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8BwARTjMbpLsV7FkDzFyJmnSsm4wi/xpfkxPt/miFj/CQlyxkEEg89jdbrb2T8Q8v3EGgCyZ1QoQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6WDCDBuHvCGaFQC4XoJeT4qQrV1cWGFbOqLIR1nZ3weQxmcEa
	JaE3zLOzIIWJYcF7gV6L8+tuLAEZzqP3ANEM5bYFJZxQGOmGCIlQa1kxFi8Cjm+GlBZ2ODHOwyS
	pqH/3Uo856lU3TFCX1VeS949N4lP/fU/oIEWMgD/n
X-Gm-Gg: AYBFou1FVz5miL270ggeq7o5cdCR7p/61ZhG5V/ySJiJFhzWlkuvrpvdUeFj5Rm6rfv
	cLINdW0BeUKNCbeW/VqLAESQAID2qvsZAk4iiU4UpuqsbchZtJXo2rP2oiGV1CFs8hVoENfxDGK
	I41HKENuJOcTg7zA6Ty6CTSAkEmujJ2z5jGql8xKt1rkx4nmkl880kVEdW8jaBz0Xv7q39x8R4X
	c6aeiRk0UnBn+vk3pANPVZjObfPPlrP1ErjzQGpvwS2Vp0yJAVIm1EOjngU1FMGau2aV7veGagE
	/XzNN187fCvg5mmm5zRwpJdsQirhk2XNXGojQYtMazW2icPklZd4d2GyxQdIod+NHTmlmUzQy5y
	LryypTT7Mpvz5/qt+7JsUu7Y=
X-Received: by 2002:a05:6512:3d8e:b0:5b8:c8f2:16c4 with SMTP id
 2adb3069b0e04-5b8ef255fa0mr155202e87.10.1790578610464; Sun, 27 Sep 2026
 23:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:56:14 +0100
X-Gm-Features: AclHuK9Nt0wxmbd5-RZTKhrKH6f7Mij28E53-dg3AuD8R3c5qE6gQbIJDKPoGaw
Message-ID: <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Marc Zyngier <maz@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Catalin, Will,

On Tue, 8 Sept 2026 at 15:56, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> MPAMSM_EL1, so what one guest writes reaches the next guest and the
> host. Nor can the kernel make the EL2 writes unconditionally: they trap
> to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> read below EL3.
>
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.

Gentle ping on this one; it has Ben's and Bradley's R-b. I think it
still stands regardless of the other cpufeature work going on now.
Anything else needed for it to go in?

Cheers,
/fuad

>
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>
> Notes:
>     Changes since v2:
>      - Add MPAMSM_EL1 to the registers a guest can reach (Ben).
>      - Carry Bradley's Reviewed-by, dropped at v2 and reaffirmed there.
>
>     v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
>     v2: https://lore.kernel.org/all/20260904103131.627392-1-fuad.tabba@linux.dev/
>
>  .../admin-guide/kernel-parameters.txt         |  3 ++-
>  Documentation/arch/arm64/mpam.rst             | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..e6d543de3cde5 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -575,7 +575,8 @@ Kernel parameters
>                         Set instructions support
>
>         arm64.nompam    [ARM64] Unconditionally disable Memory Partitioning And
> -                       Monitoring support
> +                       Monitoring support. Only for a machine that does not
> +                       boot without it. See Documentation/arch/arm64/mpam.rst
>
>         arm64.nomte     [ARM64] Unconditionally disable Memory Tagging Extension
>                         support
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 67fe515ed501c..e445f4078ee1a 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -87,6 +87,32 @@ The supported features are:
>    MBWU monitors can be exposed to the user after support for more monitoring
>    scopes is added to resctrl.
>
> +Command line parameters
> +=======================
> +
> +arm64.nompam
> +------------
> +Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
> +it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
> +CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
> +the MPAM system registers from the lower exception levels to EL3.
> +Firmware must clear it, or handle the trap and emulate MPAM as disabled.
> +Where it does neither, the CPUs still advertise MPAM in the ID registers,
> +the kernel's MPAM register accesses trap to EL3, and the boot fails.
> +``arm64.nompam`` exists for that firmware: it makes the kernel treat the
> +CPUs as not implementing MPAM, so no MPAM system register is accessed.
> +Set it only on a machine that does not boot without it.
> +
> +It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
> +the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
> +unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
> +guests but no longer enables the traps that stop a guest from using it,
> +so a guest may be able to read and write MPAM0_EL1, MPAM1_EL1 and
> +MPAMSM_EL1. KVM does not save or restore them, so what one guest writes
> +is still there when the next guest runs on that CPU, and when the host
> +does. With MPAMEN set, EL0 and EL1 requests then carry that PARTID and
> +PMG.
> +
>  Reporting Bugs
>  ==============
>  If you are not seeing the counters or controls you expect please share the
> --
> 2.39.5
>
