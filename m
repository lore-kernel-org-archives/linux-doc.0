Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559645A2A0
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528754; cv=pass; b=YZEc1WuxiArsqKakwFmsRBCWZeEEvvTwRr2H2Sueo0x2S4Y8iNFvJdXHLagWRvRzhesQbfRpjV71ARjr0uWuWxoiObXRsJjlHu/ZYDU7VFTEdE23+ce95goJvsHn5jHS7FYLrArpAyrdb+HzfoNfLMYFX4twhePvzW3i2X1IhUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528754; c=relaxed/simple;
	bh=4NY3b/9uFqqbJNZv2e54a4GGP4HJaG4h9wCOURl2pcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpxOrCpYiVzRai1U+9bh6Gz05AO1A6lr+OWWtjsX08YdUz0H51zE3R/zNfuCbfkKUzV8pUu9fxt/2L0qN6tUpglCBzqR7ESZ4tqNQEC0+KjIPDSmbCk5LGTU8GOzGcVeyx6GoxQBzitRM9Hg1nCzZaYuCQy1fhSSZnYgN/XcHOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdAMV4Ni; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdAMV4Ni"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c263415982eso525304066b.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 23:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791528748; cv=none;
        d=google.com; s=arc-20260327;
        b=ANiKS9FFVoHZxg11H++0jUgt3oUB/idvTULDp6hYVzug/3mAl+gPYNVcxqG/mBD/0C
         IhwJGgjGz9ONCKVbgBChwgSTTIpRu94HKGOp2f8TFgYoZuKdphC+SZWJqhe788c5rP1Q
         QwIv8cmWd9ZA8QEfTvdQYR7FO7ZO7jL+pvxzkf373KE/meYfsPI7Z6aDudJ/7K0uvwJR
         UuNV2nfFODR47lQad1bgtBNL+8ivpzsm3boosonFVQoqaWz8aYnG+PZQlpHhxueMnfGe
         3UfC+mJJxzQaeblF7Ukq1ec6/0u/1G1P8HFI149R4NjKnLKLqjmTCcT0gPEUjgJFgKUA
         cW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        fh=D0qLIaGTUbUvwad9NaeayyEVRAtPnky/fQK4rzLYSXM=;
        b=CkG+pj3silCV3BOGxBdHwFh769gLYNx3dm7GmLFcmQMro/TilhkcH8GD7scyukCdxM
         yfKX2xuFv4YNqZDrR7gX94juUTHu+17D7dHmu+ITeJtf9HEpE6/vUEMo4X4mAIcgn3bM
         Sl0YjX+xV+wL3jpVhbQnfmMT7dJLyNwNHqZGYszUI1WwfyyxoEbwPD5EV+dMKghgWWRZ
         TwmDyUoEqUlFQn3vu1XJ57eQpgD6NwZhdPcgqlHxLAKgEwWP0vbWqNB2TH0pJ6FC7EPm
         I+jMeupw81zByWmBDY9MKujpH4Pdam7/4HH8FboyRgnR7InObT+JsmgIVUFub/g0KqZS
         fwew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791528748; x=1792133548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        b=JdAMV4NiOsNnKzodZ1REyjHh9rZxhax/u/cAmbUKdeMyaIR1WVQqMK33pFmHUGKWWT
         w4CEDkbEG6hiL+/e3UBo2iR65oNMPZsAOB2f8jGB4KEyQJduOVe94SuDO74cK6ZNbJh6
         XQMPcVq7tNvG5KZqLov5JgUtSx5+OYkh3UA6ePd+Y4ec7M3sFMCs2Ktw17qA9QbeiHKw
         epCwfJskhgIKdvANnwtSmb1t4TvjvaOfO9DXT1RdC54oQ43n6PKnkTQxR1kAc2E+dBWZ
         69EIHWDrKqZqb/7/q2WQVkY3UDPYX1pzoI62PVaqmpP0CXR1MFDXzGt+VRcereBHzpcU
         Ouhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791528748; x=1792133548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        b=UKEe/5P3BAPjApuGKq2pMtK4TrxIGkOxnv2G9ee/6h/wXCvWEksN4vojPhbqbsGRjF
         Z80FduF80jhHMJSedeiAeD8g12bsJdmCIuhg2QYfMqeNHPnJPchY3wqEjcmtdRUwoy4X
         SrH9TmLkx5l/LLeVS4bwHRD4jYdHNrRzEvGx4Xt4pgYMy//ou65quoN/w8/9aCi+1OI7
         E/VNzrPYi3Tha5iBo9vplEom9A/lHKwHnqDyzSmTpoTDrINFBZst26WRydEBb3T3Y76Q
         SuTRMjEV3vj84jBYLiOCwN76Q3gmCBtkYD2EKwy20CmrVZWFHA55r/wnzPM+Q4CQ7vKv
         hOxA==
X-Forwarded-Encrypted: i=1; AKwUvBz5vkhoUBsAKs5W1Mt282fukQPyh0pae8jxheDYaENLZqkCuuSDxD/SNHlPG4Qm6Sac0mTTxMW6tR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZGB3FU+VoYuo6F0QiJCT7zMKyzJ9Kpr6TZdVEpNXMWMTsqVz8
	o/Gef7/jFEpw+m0BxNAPR7gCYxesUpuzwjckvXrnSmJ6WlPRLnwX0WcoTWQk1YshdMv7/+W85cQ
	u3MapYHxQGkSkVUg0I0nlQBtYyixF2fQ=
X-Gm-Gg: AYBFou37rlAaM9oAcvtzYdaoLDFZhOIXeGnfbF32dZF9e4G/w4DeSYACx+J03DaW3Mi
	8JI/kEbqIuCd69IoJXwJuL0bOSA2K8RIKOA6gzXh1LFSBAK+TsMiUabtdv7ulRj+B+0TN9B7/G3
	t94KSbV16EIW7X20jU5xD9wgtn/BCa/GWzTNzfjnEX9a4zAwlBnDe5UPjJg4NEvOAon7boY2eyO
	BfHBsCshs0aphT6abIRI9AoqIqba5AkuB29IgQtuHeCaSkldXLrtqoE8wOVbPjR63OpeyST/CDl
	DmLM4NpYpVQP7OQRUzg4HBDf1BS6zMMRjnUM6OoIPbzVS25EcOuEp78barNLCv8eNJuph4ZB7Du
	Q46Ydwh7eACr6GAK1zmUMLZbnwRk6cCO2zq7ez+5yww==
X-Received: by 2002:a17:907:a089:b0:c2d:cbc9:3529 with SMTP id
 a640c23a62f3a-c31a9ffd78amr101019566b.20.1791528748116; Thu, 08 Oct 2026
 23:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 9 Oct 2026 08:52:16 +0200
X-Gm-Features: AclHuK9oTCyjIBQo-KDpBuWM_JxhK4IiThl5vFb7lnINqfE-VDcwwfdZ-Pom2sQ
Message-ID: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/22] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 2672971b83f3..bed3f1c8d9d2 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -16,6 +16,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
>
> --
> 2.54.0
>

The kernel test robot reported undefined references to __ashlti3,
__ashrti3 and __lshrti3 with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy.

Alpha doesn't currently provide these helpers. CC_HAS_INT128 confirms
support for the type, but doesn't guarantee that the generated code
can link without libgcc.

I suggest dropping "alpha: select ARCH_SUPPORTS_INT128" for now and
bringing it back once the required helpers are implemented and tested
with size-optimized builds, including UBSAN. Removing the select
eliminates the missing references in the affected objects.

There are no functional dependencies on this patch in the rest of
for-next. I tested rebasing without it: the page-table-check and
hugetlb patches each needed a small Kconfig context conflict resolved,
keeping their own selects and omitting ARCH_SUPPORTS_INT128. The
remaining commits replayed cleanly, and the resulting tree differs
only by that one-line removal.

Magnus
