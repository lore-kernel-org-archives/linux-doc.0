Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8893D171C
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791492620; cv=pass; b=KYX7Ppr6gN0EEkS3s7BLOGWddjTPPKRwkqLxOoi5E78Ni/vkok7y70cBG2oxbxZCWxHfRxEolesZtLj2R/X4dFYIi2T0+EHoTchr6A87oX/INA1MGBFuuq/lFqZLcZTSdD5efaXBhZhosNhwq9y8IRqHzQwJ6Q29TDcZUvoZmGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791492620; c=relaxed/simple;
	bh=+Ky5C/6RCYoPAglvjbSy+TobFX5nuSe8Upk7a3uWfI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMUBEAnkpuWS6CmRoIvxgK4/ZLSSjlSbkQu7e8zqm+4bXAcw8G/TBpn+TZKuykfd3wbFu3SRKtrxTZWtJ1Hzkc6VOlUk4BSsMpCGS9tuyu01b9+BPZCKQ/2GMfhC/hVObDCAc694rmPqRhNa5xygNuWAh8N1nbTRn4Bbi3dBqGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HstwHEgx; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HstwHEgx"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a6313cb899so26353851fa.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 13:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791492617; cv=none;
        d=google.com; s=arc-20260327;
        b=UQOmtRBJchGtctUhizuxqAZ+XvdBGvI1vYUBJDn3yyG4i3mZQKqTjdhu8D6GnlsK5R
         SOmm0CkQZMOJ+7OMvyb9/plaSBjr5ubXL5jYzMLXZnyscjkCRFQjlCev4lejeNCincKW
         WdtSd7DFdyahhkH5jGgs+IGvd7ppn6Kah8TgZw5pTc09uzr5y2pHOID4RSeHhv1wt6+2
         EXbJLuvdARCSdRh0ikCadVXsmg6K50aPdQ9r974EcfaCeBZ8go/89Vy4EmH0AYZ+egAh
         7HGR9vRiE0hkQZlbgK48y+wUpTmklmeFCJjEMqfLjvjiy9q58NW1E4hyT0m/Ei21qp/8
         XRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Y+mfJq2Q8N5+Mak2eVOy9R5CAvJC/TP33cET0RSU8E=;
        fh=o+CgNUs3Bq/fzaP2BXcOBoOv/y0KTgQ8N+HX5OwBLAo=;
        b=GESaHF5Nyo++rFFi9VjdEg8/HZVjRrPM7HUfcNkcVJJGRN2W7bNlb5iHrfjnC/hrKz
         duW4oV7nnuQ0OzC0gxvKIAPkt+G8YY03xmUzZ7CX1X5x1ev7OyYh+n7+nvaxQsBqdMWO
         /kQdj0zbXryvypkCDrdZK/bB78vuYK4mAd8ZvMEedgo8iNy8HCLTcfJtXaemCRZk9WA3
         BrYAWZtguccRihlt8Xy9voXD8THkcZFsvnpw8evtzwUBVKLeXk+iLVdE6OWybWx9KR9z
         27Vn5rbw7pOdwlwMjy2htRitg8aWw12h0dQS8KTVRWfH2wi8zC1K91xYMyj68UKwU0gP
         nISw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791492617; x=1792097417; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y+mfJq2Q8N5+Mak2eVOy9R5CAvJC/TP33cET0RSU8E=;
        b=HstwHEgxtpn/54POm9e8WYzlRdPWAaKusJFF2/MrbEcRB6RvM+STnbNmPlCwM5Os91
         uQRIfUYMVTawq0UckIhH/IBi1YBNEociVs154LcRs2ey+jwoMaPS++RT7KAAImxIR1Vc
         fF8oddW0pfH04D+xrwTcRePA2foc/g1eulEIv+FYO2nJ4eCqR/Xo4zwcLmbNQka0DR9w
         1mvPyNkHgDam5AcxuYQczmcgAvflL5u7Dp45ea9qwPlvMIWJRgcmPZ3R5pMAHCy/j4Va
         wLNh9kepgHLlS3JkY2dvX9VDCu36GOg/tAHtp/LRYIu4NVTBtPCsB8oHyD0ms3rYv0+F
         kPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791492617; x=1792097417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Y+mfJq2Q8N5+Mak2eVOy9R5CAvJC/TP33cET0RSU8E=;
        b=VjZWrPpqsz8g95DK00ZL6ibKmH6mEVytbrDKzg1Gm43UWhfJGOl1ExH74H155xtEwd
         mEeHGGHHr/hskLl2asCWwScdEOV2wgSaLxupeJwCkoGlIUiahcjUGJkHKfjQ3QBvIHDz
         rzIkguMzu+FAViaNWLcDnx9Td5RZaTfkGYYAGZsg1QP8f+DZ91WQP5X9TyZdXiRtsp/R
         /wPTd6q9mpKPI8sEDEACfH1FlWIu8zy5Vg527rBAHM5NswdBjMSZ0rQn6dXI9HkoXDmf
         K5tHoyPXTST8ZqkBeaPYVHEydd5RG+xPYyR0Vnpzt6UifZIs1krZY3tG2W4NJCKCV1ty
         7mSA==
X-Forwarded-Encrypted: i=1; AKwUvBzGdiqiaG1kMqJ8XW36CgxXH6C5TsAv8ezNUyFO8WjCXRuiSFXVhOL3UalU7fL0f4Gk27g+OaW+h2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUZrF53F6KKkay4sZo/WV57WwWyAjNdlVdwRtY+E8+z/bqtlCG
	Qk+k9VA/83qwjOhKkMFQvlGeRYWv0AQuKsPkTvOgOpW4k0gmCEiW5zfmOgWuCoUBGj2ETUAppOf
	3VxLn936K0WjBo8+UJsBtkerVOmmF+Ng=
X-Gm-Gg: AYBFou20RpGqUlm1Uqrz7+VuPJr9ILm6zVFC+CTvkhbo6EH4YOpVBZ9Kdm/jprFHdq5
	D5sGZtEozGmmfAzvGnrZy3UiKCjoHefCow/v+AsOG8CNvlwRBJQFY0TxmlRtGweCkh8axLv33fL
	iszEWpZQIGZ6x7YqYaYfxQvW9Uo8Zn75N7M/aZefgkjgWfN/9QiHciHKol2/shklSYXimVhAJRs
	/k8+dPbSZsksCQWVwuGyn+4QaN0MPwUdMvyoJS3lNJ/3znHJGi94JvrjNIvoKCP7rlFuDWW4C8I
	SX5FSAuxY85T2TyK5vAeroLV6LYZYYz2i+fH2kCh3f68voOg/ItoI4layni5aUpBQxWqwL+q/sx
	TuqzzuijZNqTriA==
X-Received: by 2002:a05:651c:54f:b0:3a9:7b12:b35b with SMTP id
 38308e7fff4ca-3a9a2cdce44mr16039891fa.12.1791492616403; Thu, 08 Oct 2026
 13:50:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219205514.4434-1-linmag7@gmail.com> <20260219205514.4434-2-linmag7@gmail.com>
In-Reply-To: <20260219205514.4434-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 16:50:04 -0400
X-Gm-Features: AclHuK9UPXD6K5FX9DY4hrF5YfgulYHlXuNIz0cKjHqwtO0P0ypylPhzs_uPvgs
Message-ID: <CAEdQ38EQ_yoSHEKF12bfwmQpxDaU76YzKgUw5ipHz=Ux_bB09A@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, glaubitz@physik.fu-berlin.de, macro@orcam.me.uk, 
	macro@redhat.com, mcree@orcon.net.nz, ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 19, 2026 at 9:53 PM Magnus Lindholm <linmag7@gmail.com> wrote:
> +           if (IS_ENABLED(CONFIG_DMA_CMA)) {
> +                   cma_page = dma_alloc_from_contiguous(dev, count, order, gfp);

Two problems here.

cma_alloc() can sleep, and alpha_pci_alloc_coherent() is called with
GFP_ATOMIC by some drivers. This needs a gfpflags_allow_blocking(gfp)
check before going to CMA.

The fourth argument of dma_alloc_from_contiguous() is "bool no_warn",
not a gfp mask, so passing gfp makes it always true.

Also, because the buddy allocator is tried first without __GFP_NOWARN,
a large allocation that then succeeds from CMA still produces a page
allocation failure splat.

I think all three go away, and the patch gets a lot smaller, if you
use the helpers dma-direct uses:

      page = dma_alloc_contiguous(dev, size, gfp);
      if (!page)
              page = alloc_pages(gfp | __GFP_ZERO, order);
      ...
      dma_free_contiguous(dev, virt_to_page(cpu_addr), size);

dma_alloc_contiguous() already refuses non-blocking callers, and
dma_free_contiguous() already falls back to __free_pages() when the
page is not in a CMA area. That removes the hand-rolled
release-or-free logic and both gotos.

> +                           cpu_addr = page_address(cma_page);
> +                           if (!cpu_addr) {

There is no highmem on alpha, so this cannot fail. Please drop it.

> +   /* __GFP_ZERO already did this, but keep the old behavior explicit. */

Either drop the redundant memset in a separate patch or leave the line
alone; the comment does not help.

> +   parse_early_param();

This moves the point at which every early_param() handler runs on
alpha, not only "cma=", from start_kernel() to the middle of
setup_arch(). I think that is fine, but it deserves its own patch and
changelog. The comment is also misleading: parse_early_param() works
on its own copy of boot_command_line, so the strsep() damage to
command_line is not the reason it is needed. It is needed because
dma_contiguous_reserve() now runs before start_kernel() gets to it.

> +#ifdef CONFIG_CMA
> +   dma_contiguous_reserve(0);
> +#endif

The #ifdef is not needed, there is a stub for !CONFIG_DMA_CMA.

About the limit of 0: setup_arch() has already switched memblock to
bottom-up at this point, so the area ends up low rather than at the
top of RAM. Where does it land on your machines? Two cases I would
like to understand:

 - Could a small area (say cma=4M) be placed below 16MB and eat into
   ZONE_DMA?
 - On machines without an IOMMU (mv_pci_tbi == NULL) the area has to
   sit inside the direct-map window to be usable at all. When
   pci_map_single_1() fails on a CMA page, the GFP_DMA retry will get
   the same CMA memory back.

Passing an explicit limit, and skipping CMA on the GFP_DMA retry,
would make both cases well defined.

The Kconfig hunk no longer applies to for-next, and the select should
go in sorted position.

Side note for the changelog: with CONFIG_DMA_CMA=y the default
CMA_SIZE_MBYTES is 16, so it is worth saying that 16MB is reserved
even without "cma=" on the command line.
