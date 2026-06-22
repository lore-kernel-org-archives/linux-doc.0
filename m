Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A2F3A257F
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121986; cv=none; b=C0oQNl4ywphj7hZjeRaM/W9zsFtEa6DRj6d/Mc61mnzJELPhl52B32LGOpYAguQcyUMYLZhMPbJFx4ps1fN4WnIUga9kSDR3bFEEbdT/p+MAnn1Wa4Ln0FD6qrJ6UgRqt2x/A2o5PTDqLsVabJFScEOvQPaw7QZVkcrT3NLqZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121986; c=relaxed/simple;
	bh=MnAXpId2QrsxBwStKm73em8Wh8kEZ3EOPZC5i6ugnWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVR6ANtPCqRkiy3TeOVJ8aUbqCJhkrzYUuoRXpYz/eQF3SBrFvnEAFWjJJQWHy+yOhHW0grRHpts1JNnOKQvdKpQ4vOiNubPXAQdBPMJkt8/Uj/+8k3tafP+uQdRnsnvSTfn1Ckf4MWwr2eGn5+zkCfUyWSVNPOOM0E07uUw6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so3357996e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121983; x=1782726783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTo0C41gBRbYARs5bY4lNZzY8eziG+D7rVsU/ecROJ0=;
        b=H3i5EQNn1PdfNu1BxPuAPkwXWEtv6GbxZB15H7c92jWlD6bq+qtF8V4yW3QtlvT6ut
         EYAyfqzvJ+RLbR2J5zQ3cSGyj+O9TxUTR4mUpfRFEEPKNvy54U5wenwalE7q2It0eTwZ
         Bhe6mHf1YuK9sQB8v5lx2v1dbrZCyhWoqdkDMlD7v1jaBEvIf+83+Skv02T//v0s6t7B
         +HknogpCHApIpeRbul+rELoZxM3a1ELvmOcIVM/r9MFUIJQl/VD1wL0ceaJ2KuMPrx3J
         2Ee45nqvusR5h0Gf3Jl7zMCuscjx2+x4vRdTh55hHTMhMLD8SA7pPaZ+Lifwlq0WUksB
         C+yg==
X-Forwarded-Encrypted: i=1; AFNElJ9aV5nzeUU4A07wTGrnFETcxcb3rpwogVefsgvkV7X9R7opR5uo1LTwUk6WyJ3ayFss3OlG0jRca8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNnVJ9JcaeAtl1pOK5/njDPjdvuVTTBKydlgUhhP7Cl9l6Kgl8
	y5vyRvlSbCbly77DjSwmiQOEqvGhtrAiU9kbaeOwyxlKf/SzSNP3whKfWfbOq0B+
X-Gm-Gg: AfdE7cm29DpplsqFPfcZCX0HPul4fsCCUrdB5Hy6loZpDlYfy3RGufVTcKM+MDe4Rqa
	EZmRKuNpi5L3J0vemTfDW6NNgaY6YgD1PIoR5w+rGqQPTOZhhsoqUTBoZA3mxc4wfOZNnZ9F9bS
	4TVF/ROt4coZSASCjJnW0OCOQIM8AMyHbowD5XdLAsenVIEtaLJtKGBdsRlhcl2ZkglAa8cZ5g1
	e2Pm7hlV9EDyvjDBF11S4oRf5QIau7ti8Pa6a8+OIp+bbHXBSLdb89VcxgvIdBGjWvrOWSRvskM
	FQid8+reQz2cgpaYXDipl1GGUdhpljRr8Co3846KOrwe6camly5sPioFXlQSAvJH4Q50qFQXwxS
	j3tRrhBuJ1hV4vFmQ+DTp7/6rtmakebdpa5V0Wi6Wm5aOSHUCA4a/7TvG3TyxBOBruT8itra48v
	oNzZdm3u1tELEGMZH89G+VFQ/GwSxMc9FeYeIyR3f1VJnrjUxPKQ==
X-Received: by 2002:a05:6102:38c6:b0:729:b483:665f with SMTP id ada2fe7eead31-72a1f6edaf4mr7412493137.19.1782121982939;
        Mon, 22 Jun 2026 02:53:02 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c0e9590sm6013316241.3.2026.06.22.02.53.01
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:53:02 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966c8dcceedso1608633241.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 02:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99YFVItI8dAD3T26p0UJxBLwzoK5zSnurkKqEtTqgsloxPWanabGvwgEODl2pPIn/4nAEKFG8JIsA=@vger.kernel.org
X-Received: by 2002:a05:6102:c03:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-72a1d8282d2mr7518654137.8.1782121981650; Mon, 22 Jun 2026
 02:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 11:52:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
X-Gm-Features: AVVi8CeD0QzByTLrjVPd1X2DDUj0G8mjwUUWpPVDpYqqWicL4mNi4MB1Xhj4X1I
Message-ID: <CAMuHMdUxT87M1oQvPP_h4YX4vXFaVbbG+LCG8EdmuLTuHNtybQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] irqchip/gic-v3: Refactor GIC600 limited to 32bit
 PA erratum handling
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The GIC600 implementation is now known to be used on multiple 64-bit
> SoCs, where it has address width for AXI or APB interface configured
> to 32 bit, and it can access only the first 4GiB of physical address
> space.
>
> Rework the handling of the quirk to work around this limitation such
> that new entries can be added purely as new compatible strings, with
> no need to add additional functions or new its_quirk array entries.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4890,10 +4890,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>         return true;
>  }
>
> -static bool __maybe_unused its_enable_rk3568002(void *data)
> +static const char * const dma_32bit_impaired_platforms[] = {
> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
> +       "rockchip,rk3566",
> +       "rockchip,rk3568",
> +#endif
> +       NULL,
> +};
> +
> +static bool __maybe_unused its_enable_dma32(void *data)

__maybe_unused can be dropped...

>  {
> -       if (!of_machine_is_compatible("rockchip,rk3566") &&
> -           !of_machine_is_compatible("rockchip,rk3568"))
> +       if (!of_machine_compatible_match(dma_32bit_impaired_platforms))
>                 return false;
>
>         gfp_flags_quirk |= GFP_DMA32;
> @@ -4968,14 +4975,12 @@ static const struct gic_quirk its_quirks[] = {
>                 .property = "dma-noncoherent",
>                 .init   = its_set_non_coherent,
>         },
> -#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002

... as the #ifdef is removed.

>         {
> -               .desc   = "ITS: Rockchip erratum RK3568002",
> +               .desc   = "ITS: Broken GIC600 integration limited to 32bit PA",
>                 .iidr   = 0x0201743b,
>                 .mask   = 0xffffffff,
> -               .init   = its_enable_rk3568002,
> +               .init   = its_enable_dma32,
>         },
> -#endif
>         {
>         }
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
