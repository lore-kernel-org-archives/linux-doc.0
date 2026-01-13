Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0A726F2A0
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315118; cv=pass; b=UiD2qbDps33RWSPkbT6psqYkwKPrG8r+dxFf7CzaGESXfcyA9XpYPYNiybceDDsp2jYcFJIvb1ocehoOI9YeMnvcQ4MSpiRoN2bPmL3yGaBtuvZ9qA9whO3nxNQbcmpglk0U17qZcYYIWuHnADlGKvisMtXBX9v69lgHk8V8O7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315118; c=relaxed/simple;
	bh=HCdvS5NkY0vXw8KWKY8kVRjAzF9gX4xS/N5ZGLvpz88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7tqU0k5sUcN9DmIAhRxw2LZEqF2lN2tRxNtCtgbwfR41Htm5TQVXnuE2YizGEtcP5cUN6HPnmNst61cHW9x0Fm02H7wIVQNi6quKKCuYtkMeCKg3eRJZkUR9aMXfuXlt8+I+yYWIcJcNyTLiiQVtguTTjgHC2SmCUpaMqke7Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Kfo9pME; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Kfo9pME"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee147baf7bso320851cf.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 06:38:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768315116; cv=none;
        d=google.com; s=arc-20240605;
        b=B1jwjGgwcalrXTIS2EQOk/ImHuxlbEvHzaNS42NW/9H5V4ljJIsqlz59pss5DQ/XGT
         fm78CytWGQ3q+nGLDQn55TILMCwV7gO2YvPM0HkKKBkgRny2i1tgZi4DqZ0x/y/rcigV
         lDigkkpx4ApYCMI0GYsz8FZsweFwkDOzCcE0I9O63I+ZH7S3JypysFL5iW9ugM4ninWN
         go/Xeg+ekMIrsZMVP3zdeymPPADHVhXz1hvlIQXLWseSlGa3PwPh4tvrbW6i5g2hQD9y
         S9BrwTMq3lHJwF7mecfRwH8pXYO8CZu4BdL29M6QRrj/su6Jm3xo3EIG55pIMAJDttjC
         C8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=;
        fh=o/t6oOAlomxiUlJyHjcpdQM5lsF8y+bsppla42vJJA8=;
        b=DCXs43yoxWa5X4Gx6ZarxX/+ePTiDl9JmzJT2JlfHcGqkGLcz43ZzAfYiPu4X+IprG
         +uXcAPLGN3gzvV27PhZjDrebiydvGtPgZm4IWN8YmO0/QxyDJovzLnRuUGeduRqM9p8b
         f4GmeH9ixMm+Cry2H4uHkVUHbgVIpxMoDOxdwnEKsoIMaXT4NF9OqikI1PcZiVBqqB5s
         3JsqjeFZwCKKylOqqXMprhZwhHczLSn73oRBN+0LFtljuUygVk+1iUan9SD2fTlDhtti
         LPUjb4CUWOU610l+qGkLacgUUm12SojttsIp3hVaXtGd+xuk9/9KTQDy8l8QCa8n1MOg
         Wt2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768315116; x=1768919916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=;
        b=3Kfo9pMEuU9AQPTMSP7KjhmahlErlXGn4E0euTU7WbUvjOk/93PI8BCBzWMJZdcMSX
         wHbxi88+CFd/plzvNFD5w9P/AXMhwLqveoVYT+y4ept78PTtXfYbreWsBsKUj9qhduHa
         M47aloV5zJIb7N0fYJz9ni7W1nwlyh04eZqiOXk0KK44AEXykqudsH9XkZ5vvI3hbPnq
         aSrt65yS6yKgBlHWYt7iZtldd5aD/d7F+7ivB7Jj91UP+BGAws/rknP1Hc/E5HU8eV7H
         XeVEXO6/tPY0tV1/sfe+X0nbsOxAZtGcJJav/dCtmdiIgFZFAgT7UJAAC/AeZGHSyG/q
         hoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315116; x=1768919916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0SrzDaVUXRmKWRvPdSPBpUEx4WP+XB1ix/xiAgEPgg=;
        b=h0JEIn71kk5jzruxmHTaV1atAuk4wNpqRJGAWjLvPVJRh8ZgOC2khQQPO06DesNiw8
         SDqsx+AFTgM8fUqiuGrHm5GX6rX5PAYahY7C1Xjy1jndCDlI2cvfgp/Q+gz2BwGxG/Y9
         jwlWL1P4Q81iihpXltAWy/QozxMmfD69HyVNNqO6IsC8EMPurehJ6Cr39oIKnyc6sxDe
         JyfAs/fSHbk3Y5aWqytkxaLmzacCgVpNO4fcnrl4HKIUIDdDn/G2q6nQ4wHBQSsI5Xer
         woTecv6yygkEO0eF1H6Bl5yoS88pItwzg9JhS4khZq1j3poXsOdmoOHN8WuTcHY5VdKN
         5jyg==
X-Forwarded-Encrypted: i=1; AJvYcCUQFiFUbNMjWvO5H4LKJtBpIaVe/fca3jxBGvc8BhyCpSA1W6g7gm+ThIwW6UvH1y17WuujxxU1oQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyviqPyARm9YYc5/a6kiQwLn/QsNOY2oweiGMGTixA7oCNsHOfy
	gQD5HRohmWAOvvWI2stjs1LOaHqfXSkT5tTgS2jjeJsx3eL/7CF/Qk4W6ccR/x+MbvnM8UK11Yq
	3nrigi9XN6D+YxHehOVKT0Z75trCI7nXCNJxYXMWq
X-Gm-Gg: AY/fxX5KTc77KGsq5OQ3TJq9dkXdOcC+gZKb7lwWYbh/nKFBoJDQtGampBfOFL+vynQ
	PbovvyMEWeFn3OFyjZTrUVA2EnpiEVPEj9aGlKWiz2xxYxFI50DSf3u4aeRqMmJtEj0Q6Gf/bi0
	K3tG2TbAjUn0sjv+Wj1iK12FksXgB7c+ElMLwagbv9jiySzMk9Rp7V7/nPG7OjZLIP44prYLaGT
	0D98j+kKM005UV6bYaeWZiB6QH5smdhLocgHBNf4S+DxNogVeDuENbe9nw7JC2u26kiSEu0U11f
	wTz0m6DzzhRZ6pAPOV25dJ/BwA==
X-Received: by 2002:a05:622a:90:b0:501:19ce:5bdd with SMTP id
 d75a77b69052e-5013a21b63dmr4606041cf.6.1768315114958; Tue, 13 Jan 2026
 06:38:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-25-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-25-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:37:57 +0000
X-Gm-Features: AZwV_Qi2DCwvCxhy1IBJRUhKVRAZLawBqR0npBrkyjREHFYNX_l_ocigtzC7uIo
Message-ID: <CA+EHjTwZCcMFT6gAM2oaQz5V_vqEBmVuggFBbABbXPvC+U919Q@mail.gmail.com>
Subject: Re: [PATCH v9 25/30] KVM: arm64: Expose SME to nested guests
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

On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> With support for context switching SME state in place allow access to SME
> in nested guests.
>
> The SME floating point state is handled along with all the other floating
> point state, SME specific floating point exceptions are directed into the
> same handlers as other floating point exceptions with NV specific handling
> for the vector lengths already in place.
>
> TPIDR2_EL0 is context switched along with the other TPIDRs as part of the
> main guest register context switch.
>
> SME priority support is currently masked from all guests including nested
> ones.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kvm/nested.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index cdeeb8f09e72..a0967ca8c61e 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -1534,14 +1534,13 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
>                 break;
>
>         case SYS_ID_AA64PFR1_EL1:
> -               /* Only support BTI, SSBS, CSV2_frac */
> +               /* Only support BTI, SME, SSBS, CSV2_frac */
>                 val &= ~(ID_AA64PFR1_EL1_PFAR           |
>                          ID_AA64PFR1_EL1_MTEX           |
>                          ID_AA64PFR1_EL1_THE            |
>                          ID_AA64PFR1_EL1_GCS            |
>                          ID_AA64PFR1_EL1_MTE_frac       |
>                          ID_AA64PFR1_EL1_NMI            |
> -                        ID_AA64PFR1_EL1_SME            |

Should we also limit this to SME2, i.e.

+ val = ID_REG_LIMIT_FIELD_ENUM(val, ID_AA64PFR1_EL1, SME, SME2);

That said, we don't do anything similar to SVE, but it might also be
worth doing that there.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>                          ID_AA64PFR1_EL1_RES0           |
>                          ID_AA64PFR1_EL1_MPAM_frac      |
>                          ID_AA64PFR1_EL1_MTE);
>
> --
> 2.47.3
>
