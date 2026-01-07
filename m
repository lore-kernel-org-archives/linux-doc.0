Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734BF331A4B
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813987; cv=pass; b=uv9BUrTBke4K1WXLT1wiCg/watCjEGrUBngyEG8RmSbv4cd8yIeRwuYhkzasNV0uDbTJYEJW8xNXMhSYjzyeVQurvLChqhQ7VwVxFaPGnhCV3/L/dEwx5DuoZfXc94DFftbI03xtnuHFNSQ9/48uM2EXqIfBe9aY5Bz5lCJ3kIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813987; c=relaxed/simple;
	bh=2LhpsPeSyE8bX8HA6xDr9D/rfFVNInchGx8D0QTzubs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUpOYeM/xt2VVeuZRZ8rUxKlrZEpNKySMq7fGmkueiyw+aHQdZyOLEgrJr4XjLyACBvzut154nD0NOPaldyyI1W64n19cktKt2iiasJ72uH87ZrkRhClAmcajFdtsokE1+6xesvNrDCHOBEov7nj/+pm75kRZV+qKGXhrkdTZlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BKqTNx/d; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKqTNx/d"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4edb8d6e98aso720431cf.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 11:26:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767813984; cv=none;
        d=google.com; s=arc-20240605;
        b=gVuwkUa7PeLhoD5fZcuYRjfU7wkXMtyO9eAhZrvNBtciV1qWQLFwnapwmfJAjrWOkb
         lqXhrLXIEBonY+OuAQ/M8fcwl2SZ90VsronUh1rYxAoiQnNCtmEVaZfpQlOEdGkid+jS
         49Gp59Gh03UbEbGlGnSn4andpR8qvZRKrldhUtdASaAKRdhyRxOtMQomYsem4b4wLjvA
         WrGbazwOM2CJngu6cjl2mHA/+HYcDQiyUINRHLjs9ed+jjZI9phsJaJBv/5CyvmBZXRY
         SOHzCfIjVyCAUaeePfSMu4eOLGtCv1xV0a0twlAAqgWEI/HMaT3TSoMEUUxfWWqm2mqA
         MF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=;
        fh=CKoa8BpgwSShNLCjVLmdDJpw4oFL/fJIxkPHqwYKCiE=;
        b=PqaEgSpdPjAops+Dyhkqx/oboxCHAJ5+8hdPpEBaPaY2p5Qi6Gxp4tmxC4yw5VhixH
         qkXKrK5NIeaQliizcMJfTBKv5A/U7zneoKNep25bI7/Ul171Tz+3GjDsJ5PARej3mjxz
         0wn/Scc57DgKcaWYQMYH2xzPqEK5le/gm3gy9IsqB94BJUxvcGY8OIwEi6iu3HauyNvu
         Kf336i0x3yyKAmDuf7yN9FSwXwmqSAwGnhqe8I2V7U+mk7sLphkTZQ497+T5CUMCskrW
         KyYZIcoT0UX+ha010lIsptP2vxB9psoAUPtEHQkKqzTp3gX/xTmMv8lZu/LXidXB7YO5
         3zSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767813984; x=1768418784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=;
        b=BKqTNx/dRzg0zFWE+h3P30e/ZQqpYPrHRtHwoRfzxIAMhrBgKBcjzdydRIWKSg7SsE
         gtx/suaYozcBSsVPh/jsxJ8K4yYllQM04FpNTciw4x9uqYOPxzU4DagpLhl+AuOCVb6V
         n6vKWwcYnNdh/C/rtKnDVvRWHGhHqg4vk9NxYrAocwehf/0+1Jg7E05p1dt2alT3f5Se
         xY0Dd9X/odEq6muhhXAtLUZDliohR0oXSgivre+tCIuLte29h6eVCTefIOxnLpL68/jj
         hl1Elt21T+wHa26chyGvc5W/2or0/a+CTq8udA1rc+POmXxWfMzFQqmLa38dIxuob25S
         uJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813984; x=1768418784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWQBkRucMfj+8IZule2bckxNws/YyczMOLNESP4WNJk=;
        b=eRpZmE3Wwhi8wKHANTurFgAAkFIDDdSAGjcT8L4Of83HotwkzbmBRC4XycX3Z9H8sm
         5WcLOzPgyfL1sg/VEl+s2RKwId18nkzFENEn4cYifstWG8mrEMz0RZfAEQpw8bcjnm7M
         ZkGYCLdMJWVhSaAxTv9zR8nWW7m15c55tu6rhP41zJ+nud5hoto7WzAWp9fbqOZLQfcx
         Ct8my8yeKfYrVLucpkzVkj97HGX6yyBOenGdAyg+rncazMjJCb0rGMrBIGyJywVzf3Py
         favsNOSRi8GZpRGWjPac3vsjoDyIJ9U8uGmbl8FEIDu9T066WyV+3dfWl8K0uyrA1YF9
         f7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXX/QEFHc8OEuRHW/7ooaXx11bwmWSHzDEXyKTNgUvKi3xJU17IJIBSicBD/rVp7alyA5gQkOwZU2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWMOjwKPF59VZ2yyKzML/bmO9FHKNPLWDpIUm/hWl5TKbvGvM
	zJEsVU5+Ami2p0Z0P10Mk9iGeFVY9Qv1Vkj60NVrN9Z+314xuj9P/Bhx5i1nr7rql3iy8MpA5GG
	3ulg65yOA3WKEiD7cMiDrYPYWVj4HVfV2u1ntcoRI
X-Gm-Gg: AY/fxX5ICBicyqcQP+gB+7oqNUR/G3a6HgWsKB3Zf0Qrec5tr4lisGEV1xljiZyZXSy
	oOVTRtqyDzCXR5nUovClRAhOzZIo3fGIJgrAr5gRfFn28s/FE6GN9Kv0X4rKDL512FeRRXQD8XD
	zfWE7xetn91j0/7E91TtDKJF7wvKATNwi2v29pKKhNrmNg9SFU/o3fxiyyGx5FBeRbVb5IbxAu8
	o3DQ9Oj8TWlhyIjawM/XE44XysurWZahk9eNnB6FC05zJ5IVWWV9+TWNQrwbAG6A8pD6vf9
X-Received: by 2002:ac8:7d0a:0:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4ffbf94a082mr1122261cf.19.1767813983752; Wed, 07 Jan 2026
 11:26:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-5-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-5-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Jan 2026 19:25:47 +0000
X-Gm-Features: AQt7F2qO0uzZBb7qE9TqF-7WKMNBoVsC6m-23DUQhmoLKw26Bq83cmx6SM9OSu4
Message-ID: <CA+EHjTycP4Wz0V7S8hzWygpeXGzeehTL8RFfit7Eaq4rT+Eu+Q@mail.gmail.com>
Subject: Re: [PATCH v9 05/30] arm64/fpsimd: Determine maximum virtualisable
 SME vector length
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

On Tue, 23 Dec 2025 at 01:21, Mark Brown <broonie@kernel.org> wrote:
>
> As with SVE we can only virtualise SME vector lengths that are supported by
> all CPUs in the system, implement similar checks to those for SVE. Since
> unlike SVE there are no specific vector lengths that are architecturally
> required the handling is subtly different, we report a system where this
> happens with a maximum vector length of -1.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index f4e8cee00198..22f8397c67f0 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1257,7 +1257,8 @@ void cpu_enable_sme(const struct arm64_cpu_capabilities *__always_unused p)
>  void __init sme_setup(void)
>  {
>         struct vl_info *info = &vl_info[ARM64_VEC_SME];
> -       int min_bit, max_bit;
> +       DECLARE_BITMAP(tmp_map, SVE_VQ_MAX);
> +       int min_bit, max_bit, b;
>
>         if (!system_supports_sme())
>                 return;
> @@ -1288,12 +1289,32 @@ void __init sme_setup(void)
>          */
>         set_sme_default_vl(find_supported_vector_length(ARM64_VEC_SME, 32));
>
> +       bitmap_andnot(tmp_map, info->vq_partial_map, info->vq_map,
> +                     SVE_VQ_MAX);
> +
> +       b = find_last_bit(tmp_map, SVE_VQ_MAX);
> +       if (b >= SVE_VQ_MAX)
> +               /* All VLs virtualisable */
> +               info->max_virtualisable_vl = SVE_VQ_MAX;
> +       else if (b == SVE_VQ_MAX - 1)
> +               /* No virtualisable VLs */
> +               info->max_virtualisable_vl = -1;

I'm not sure about -1 as the "No virtualisable VLs" value. Unless I've
missed something, this value gets used without being checked,
potentially even assigned to an unsigned int:

> kvm_max_vl[ARM64_VEC_SME] = sme_max_virtualisable_vl();

Cheers,
/fuad


> +       else
> +               info->max_virtualisable_vl = sve_vl_from_vq(__bit_to_vq(b +  1));
> +
> +       if (info->max_virtualisable_vl > info->max_vl)
> +               info->max_virtualisable_vl = info->max_vl;
> +
>         pr_info("SME: minimum available vector length %u bytes per vector\n",
>                 info->min_vl);
>         pr_info("SME: maximum available vector length %u bytes per vector\n",
>                 info->max_vl);
>         pr_info("SME: default vector length %u bytes per vector\n",
>                 get_sme_default_vl());
> +
> +       /* KVM decides whether to support mismatched systems. Just warn here: */
> +       if (info->max_virtualisable_vl < info->max_vl)
> +               pr_warn("SME: unvirtualisable vector lengths present\n");
>  }
>
>  void sme_suspend_exit(void)
>
> --
> 2.47.3
>
