Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D648AE16
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881422; cv=pass; b=kziwsQi7SaRQhGuTBcdZS/os81ZytaeEOKlgkmXAAv+1jXLxfv+ocFR9AaduEchVANxz4jfs7nggp0iiMF5c2MPcR4KDrFY7BH8QUkUzdpX5/9JZ6SUluQ+bY9wCDqt+u0Kl1BTDZzjvmrgg5TWOI6pSEQZluBCH49o1V23NDtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881422; c=relaxed/simple;
	bh=nd9v6rOTsgtmeIcSOzUf+JTIDj5sX0xCl7dm1iZzN1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZhLfstlqi9qodN9u5YYWex96eR5QRAHzsN1iKR20prW0c9H3ymtQb++rSdmboA5VeNqdM0uRDLk9IHwr5yA0dBCNuVc/XHCdy2Gz1odxzFKJNOC9ORgP1maelUY3tTHFnVnI3qrsuBQVfvFn+PBSiRi0BJAc3FABqhBmOAg8as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NRz6DqXa; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NRz6DqXa"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ffbaaafac4so742901cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881418; cv=none;
        d=google.com; s=arc-20240605;
        b=GCRtLXygezDwkum8DpsEXKKDHk46u8DlsathgT2pmNLPuSQlVL0RlHKv7diXR/Xix2
         QHbbY6au4PHlAaw5w078G0wTHJm+LIwOnWw62wyo8VQH6FAikHEXTdktSsjx1ACekvEH
         gouduLYc5+u2tgyfVhQZDvpEhUs2729Z1BhJlKlgB7qIv5hoJXQdSjp7UVWynbQb2Lfz
         Ozv73RR3hXoOAulwf77uYqkWkwSI9RhGq8wP4gm+8Q4Au+OUSOpUo+deOjcgsdudzc/b
         1wm/9whidZz+mQX8af6bjnyidl9UcYSeXxCE0r5rParkhoxeKzDviLJ+RXtgzPaPEICk
         BFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=;
        fh=03sGled8jWg6t7Asg0pmr3UOfI0vcj9bE3V2oLrbh9c=;
        b=b2yn2mKmZLZjsH/3loVQOAPk1FqKKoGGE859227KS2/dZtnwpEaSkveyetYa0UqUdj
         +SMSELJBQVPltHBnBN4VEuo7vHo1uwwQfeeOZR+k42XjwBSVPBIyIUrmS1REAOD3uuXN
         FQJxR6Y3ym7mjeagVHLJDzeaiPzrKBDXSmjQ1vXFRdZNzUIWCv5khBZaAQV/OgVA4evk
         NVkbrAfs2sdpTQ0Mnx/q53eZPR9xUHuUXp0g1SEYgXDVK+k5B5jj8mqiv/5FtEGARLB+
         xNYtjJYDwfho89GRb5D0bPgAh/93IuhDVfi+gqYEr3MW20UAwEKC6jsuKMrxmh1tSeZ0
         wRIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881418; x=1768486218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=;
        b=NRz6DqXa4ClVdKehiDwldRMqmgo3ZwyGOugTTSKJGN7TMEzEW730F1zQwwvuFOPK/t
         K+Ug2iifvUaf+MWX0jmC6f42mdd8oXTHeeZIxbypxamL9QvATvZO0EnRW0VHEhAo37MT
         pOD9fdVkJyXCsMQ8pFWzPv/8to/m9zXiHo9y5X/nkzObA1dOfrsjuCR2bmepspAWt60r
         huLuUEqGosGpeB0yBFBt9BYswxRdbBasEHIUJKLstIMjR3uktGB7D5fSPEtZWFXt5I5W
         1miepmmRdpppRQCPv2/KLURU7U8bt+T3sb6stn9yUzAQNyy89j0yJ30leftE/x6kj2cm
         LqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881418; x=1768486218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6v8yJzivCkGRPQD2RD9WlokTdTcLOTAtGeFegCEmXw=;
        b=bQQCbKt6Rcsnw1yxTVN0oauFpciDaxwewZkpnVyfUNtwJq3Z2zSFZEXI/91eLb+Y89
         k2Mk+uuosNa32qVdoiekRZPDXLhA5r0tYcp98VNV6mv0ftfgwAHCKChT7beL80bjAQqJ
         9lBlgNIXm6b6kBbujBIRtj59u4l4A4Q1sY1cEHKeFBwul2SHkG2KVOu+8Shxm03c9M3u
         W4LhgHTdsbT/Ud2SF2FbSgMtfvuLjcRkE8nfe1iupxOOrwOqV2B8EK4TNzzT/S0ZeqJr
         P3g0Bmyly6syJYr6xP11nJZ6WD8d/tp7C5P/fts8xFs9HXM5iJIUA+FR7axyy3yoiTGH
         VSyw==
X-Forwarded-Encrypted: i=1; AJvYcCW23FNPHrhStxlGuiNMivQxwuuZPT9Qj1ZgSlksL5rgQ0Odr4x1U8y/fle7dWhiwWoTu0rVkSTTruk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNUvdgqg6I5WRrOYuj1vTqzOwYqpltz2QxEu6zd+z+IYRdg6Q
	IXOY7XmN0NTSsMvEweIcwCRyELdxSnr92MTX+0jnP8YjyeStJaUgr4mS4QQndBxRf300chZQo+N
	gcWQOjSciAayEyCISz69hzkOWMAgFmUnlcYtSMvqI
X-Gm-Gg: AY/fxX7cm4jsd0xmJP+z2ixnL2vLk3S9h54dlraagDutv5LPrwnVVOXoIxqn1fxk1sv
	lgoo1MTRQoBSkci9iFN8o42Lzf+SSLqGJhonz/6u6V5z0Zvdkylwc5lsZIEbbvcmAudvMbaR6AO
	GaUkAYBcoAM+lJlyyg4r02BykW+kOOMLG9gchKZbeQAlc3hgNyjFQ0INa32HWft5P4RTOcjwecN
	5VT8yuwbWrZskYt/k15ZqzNfzCAhVae4FzaKmWPWtDsS2r6RzV6Zl7jUhyev05K8f9hehyg
X-Received: by 2002:a05:622a:1191:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-4ffc0897ee3mr8604171cf.1.1767881418089; Thu, 08 Jan 2026
 06:10:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-6-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-6-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:41 +0000
X-Gm-Features: AQt7F2rcFTpAi-WrxH-BJGuce-rrvqsGKbxHYZVaorpjl6SSauHiDAfYA3cghe4
Message-ID: <CA+EHjTznG=6+bYW+mmmBs_QqZ2rXkKTzNxA5KSh3S67H_BBaHg@mail.gmail.com>
Subject: Re: [PATCH v9 06/30] KVM: arm64: Pay attention to FFR parameter in
 SVE save and load
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
> The hypervisor copies of the SVE save and load functions are prototyped
> with third arguments specifying FFR should be accessed but the assembly
> functions overwrite whatever is supplied to unconditionally access FFR.
> Remove this and use the supplied parameter.
>
> This has no effect currently since FFR is always present for SVE but will
> be important for SME.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/hyp/fpsimd.S | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
> index e950875e31ce..6e16cbfc5df2 100644
> --- a/arch/arm64/kvm/hyp/fpsimd.S
> +++ b/arch/arm64/kvm/hyp/fpsimd.S
> @@ -21,13 +21,11 @@ SYM_FUNC_START(__fpsimd_restore_state)
>  SYM_FUNC_END(__fpsimd_restore_state)
>
>  SYM_FUNC_START(__sve_restore_state)
> -       mov     x2, #1
>         sve_load 0, x1, x2, 3
>         ret
>  SYM_FUNC_END(__sve_restore_state)
>
>  SYM_FUNC_START(__sve_save_state)
> -       mov     x2, #1
>         sve_save 0, x1, x2, 3
>         ret
>  SYM_FUNC_END(__sve_save_state)
>
> --
> 2.47.3
>
