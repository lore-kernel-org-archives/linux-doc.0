Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87E3B9617
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781680189; cv=none; b=kE5sSC/EW0d10cA/kmF0fYpK/d5ABUqn9yeO+infsnEXQ2RQv14zfNIO8cB+Tkf0ihHXYJZWLQU3NOJ9oYhiMFPndmKOJf2gFGyegfmtJ+ZzVZMaAZURHKHxzNsi8WBZP8t6nfA+8ugpWBtzSWTGYWOQdrJ/L0APxeDeZDug3s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781680189; c=relaxed/simple;
	bh=iVrtPWbggK31kf+NMVcxt/bIB/zBj/D8Klfi+iYlymo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTTp0cRP1KxZXcMBTpkFu4CogwtQvwJjFjqT0YQtYZA/eOXOsvGkNZMg6c030AvpVRjFcjaOkpIQXIkQLcrN8U5S7AYX5A5IcksfD7EeZYYw1BK+P6ThVyarKBrm/0UuavKrOx5u7aDBsESnl5kUxqxAZxYcpSTplpkNMb8DDzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966dac1b720so137214241.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 00:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680187; x=1782284987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdX/1r/VC5gVdSWCvpldxzdbyoom7W8WRGEDFlCTq6c=;
        b=TYy9KbZmE6mPx5/hUpdv0oktBwU8PGTkyZWdkMoFyjJTDxRQ2+RK73PEOFQfnX1tpp
         o83bbTCFwqN9fuy8JnwP0wRjRY6EK9FOvAxYDiOJHEaYcfbOQ5xYiSkMgC/+60eo1yqd
         MNBMw23wP8fp8AWj+L6lmo2KH+fqEPdLW+MEsK1Euv4PD7mNAQlJJqgeiGzoaFf0B3xc
         +acCh7+LvPT5TpK7bJQ7TdOIxnKEQxh9bkRTmpUiiW4+9pmg3xUp92L3ELeb6/bOnhAv
         vNPAUk1ytxdvBqgbn4WG5vTK2kd/fkIwWhX1fWdCV6TWWpfxd/1Nbtso2351ZWdbZsby
         +hmg==
X-Forwarded-Encrypted: i=1; AFNElJ+JwrampS/s6xxxZVDEfa3bEfNSIoOCRAGI/9B2sj4pg12pb2vDD5Ztll3d9Ey3TE5kToCZ43e92uI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2874b5t22SfhFDfqH5ApbNJiAOtQWH+KThJQL1CA3dOX6of6
	3ajz+tYtTZUqw2btSSMsNn+ZkAANaekynrd5FIj3iLMKf5IkYsXrSdKuAsztA5RO
X-Gm-Gg: Acq92OERSmJr0rhp7a4Kjn0Exv6Wmr702wP5J8ZJ+4zYfO9eIQjDxHBhooCQJ8T9Stf
	8xM+Q+csgN10RXAuBp+wtYTFog7GJ/zSl4ESMMYYma8dZQxcZM9dm9a0j0v+E3s/BmN5dAT4xiw
	CU8H7G+9yjnQzR7v4obQZLYMYypFeS/oAA0jjwJgoAGY5ba1DLDm5Ox4jRp9f2INQcdW6VbO3lU
	118CQO2vRLAK6owPrqKjRa8jrImT9K1kBWhFISXzzQAxchBllG5buZXTSpvskYvGAuxfHCUB5lS
	IqwPAlyjY1uZ8s0VuoZje6GXaeyPNPTdKEWn99cMHJ0/8hCKKXrkzlddQooZhRpDnO464sa7uM6
	zJEiV7jdwJ91H0ARRakjG3kBWMbFEHTjkorTosuA2mC0AREthcBbYc6epbpEyookebF3hvtrsiH
	3LE5mtHSJqjqlLKIFbMWqNBXrTNrIhAZpgW8yB9lyVHKLK85ibAg==
X-Received: by 2002:a05:6102:44c7:10b0:6cc:f252:6929 with SMTP id ada2fe7eead31-7246c7880e7mr954104137.16.1781680187517;
        Wed, 17 Jun 2026 00:09:47 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72084cd88e7sm6363104137.4.2026.06.17.00.09.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:09:47 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6cfd2b2e7b1so1770529137.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 00:09:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ942NMXFGghrFSaPfU1KWLWDImAx5cli6y0YAfGhU5gRAenIfWzAQzTK1jbTxSvlpaQbRdZ6cpJKVs=@vger.kernel.org
X-Received: by 2002:a05:6102:8386:20b0:631:e729:4575 with SMTP id
 ada2fe7eead31-7245cec45e5mr949237137.5.1781680186567; Wed, 17 Jun 2026
 00:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org> <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 09:09:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
X-Gm-Features: AVVi8Cf4irFbaHbMK6oTTjowYmtlzx-ojJFWgXAHjFGSCYVJj8Ydp7M37Z78yvQ
Message-ID: <CAMuHMdX7XuHQDSsX4P7NZ46_OnCX2o25szuALwSs2z+PHq+JNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 17 Jun 2026 at 05:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> or APB interface configured to 32 bit, it can therefore access only
> the first 4 GiB of physical address space. This information comes from
> R-Car V4H Interface Specification sheet, there is currently no technical
> update number assigned to this limitation. Further input from hardware
> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> limitation.
>
> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
> common for many ARM GICv3 implementations. Therefore, add an extra
> of_machine_is_compatible() check.
>
> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4901,6 +4901,18 @@ static bool __maybe_unused its_enable_rk3568002(void *data)
>         return true;
>  }
>
> +static bool __maybe_unused its_enable_renesas_gen4(void *data)
> +{
> +       if (!of_machine_is_compatible("renesas,r8a779f0") &&
> +           !of_machine_is_compatible("renesas,r8a779g0") &&
> +           !of_machine_is_compatible("renesas,r8a779h0"))

of_machine_compatible_match() with an array of strings might generate
smaller code (I didn't check if 3 entries is enough to trip the balance).

> +               return false;
> +
> +       gfp_flags_quirk |= GFP_DMA32;
> +
> +       return true;
> +}
> +
>  static const struct gic_quirk its_quirks[] = {
>  #ifdef CONFIG_CAVIUM_ERRATUM_22375
>         {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
