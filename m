Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026F73DE421
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842701; cv=none; b=Jda5tVzEtZDXmiSUH4OaA8SNWMxStjTHzf5pcFfpH9FDXnAkGWWyD/Vk0EdRuZJm1jR0vNRCAoQJx7o4AmiwYq/uTK2fjSbga7gq6gQMXOhTTVW1Ibe86D+jCjP8WnpYAFz+gtRhsPgRTa9xVJaXYJcRrGjDulVsV3G/QKr0nr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842701; c=relaxed/simple;
	bh=OYJNr+fvg0ooEirPKzpg45GmiwT9K/fc8PU+rAViuKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okns7YYNiL36kTe5greqKZ/XJiYXp6LQ2oXhjmtf9FNk/bA5IaDs8EsHbVJSb9k1gJjaWIDEj40Z1dKczbOKO1/a08CNXlOy/zqmLrBwYvHyP2xhMzFmHzMrt6NzD2G9ODf37lNUG5ZOLhN7ZqYGs+OpUT0iNt0sDAmvgtIv4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebb89109aso3799282e0c.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 11:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782842699; x=1783447499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCVJ3/YfnMGwAtAU15rL0FQBriNX8zfFDwNu+BCGAtk=;
        b=LtWLxAZAMtbUOHfEIQkaGe0mQjVT47et82atk/PX33m9JU30yoWHzYUvPRpvVJ4UF0
         XHaex3relDoD40lTHBFm9lyaBmpXEtZP9l/WMO13nKjKqVtJv/+Zzf0zm0U1csa9KHlG
         0dpNuYbRoPpVu7nXcr+unk5cNh3/7Mc5K0KvA9TqMejlGM1wRlid1/XEaKzJYklpi+CL
         xBXyJI6tvceNxxJFN5bV3CNqO21fkSmbCmeTaq4g5Yurlg+/UnBgQcQ6YM5wjgpabrNU
         cCvRQAO0Mwo7nsU5CWKrJwId3GUAMX8DNnA8+f3O6cZtKjSdLc5NBfZGG8zaQy4fqzei
         1+pw==
X-Forwarded-Encrypted: i=1; AHgh+RoKz3ZrGa9A269WaqQgHsgLM0sDiykXppFfVOJbfx64Me2QMrQkxdrf9iBNlN6HaiT5M5hDOTzbtxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGYPLBI5LCO7wxaw/Oq1PF99XfGGtc2FEMi6gIL5Q86D5P0Fiz
	tZR1s6UmN09AH9wLHJ50Y4lIGBNdujZ9se/68aBFA4jZL0xb5VKXiYU43vTl8luKA1k=
X-Gm-Gg: AfdE7ck9TFfTOi7oa7BKAP4d6IoczAa4wKNObMe4Az2vuN7ZK6KVIw/23ykCBk70/QE
	hukGBnYPbjmaHPCJU8MqtF26sbVnnlOb1SPkWPnj18USmiAoGZuaDAvvPk4+Tb1ZR95U4frmVKd
	BodnsvhzA54HxQWU82VjAyaj1VoId+a2+SjpF2zGP5RBt4uzW7MKg3DzWzfbr6eL61oZERv3MRY
	+oQsXHrhJ2GaOvuTuHAeFLGiKglD8D24Ox30bJu8SFl2yKiRs1VpWAbeME+XZKcEqZgnr0PHnYi
	puVqRPcw5HtRN7Q5h5AFeZftBV9l5ibioCxoZ7DN/uX0Qp0yd45Uu8nJj7/G6JiGlqehi/RX99p
	bGQn8Yv6dXDT5qDriS3l+EzrAxyemkQ3KrNJotBGUIQXVycPQhOY/w1RycgMbcY+YLH72Xwk//E
	mevIMxskU7+nGnxmdtb4VCDw/MLNzNc93yFtBew7A+WZ5IXIwgYw==
X-Received: by 2002:a05:6122:6161:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5bdbebd1b66mr2357760e0c.1.1782842698997;
        Tue, 30 Jun 2026 11:04:58 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1aef7cdsm1804486e0c.13.2026.06.30.11.04.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:04:58 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-73a442f7cd3so865493137.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 11:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq2blPY1KVE1Hefs9iV967nPdxGjlhTrkC5/+VCeCh1v2wH3Huuk8bItGKsnHhcmGvTGwp1eozuWew=@vger.kernel.org
X-Received: by 2002:a05:6102:5805:b0:738:472f:2ca9 with SMTP id
 ada2fe7eead31-73a369ec1bcmr2473065137.7.1782842696311; Tue, 30 Jun 2026
 11:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 20:04:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
X-Gm-Features: AVVi8CcCGeVbbcW5z0757KT0rVC9sZPZEWMHF1Z1kDBEh7vVAiL0IbidDTttqgc
Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek, Shimoda-san,

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
>
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
>
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
>
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>         return rcar;
>  }
>
> +static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
> +{
> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +       struct device_node *msi_node = NULL;
> +       struct device *dev = dw->dev;
> +       struct resource res;
> +       u64 addr;
> +       int ret;
> +
> +       /*
> +        * Either the "msi-parent" or the "msi-map" phandle needs to exist
> +        * to obtain the MSI node.
> +        */
> +       of_msi_xlate(dev, &msi_node, 0);
> +       if (!msi_node)
> +               return -ENODEV;

This is not backwards-compatible with existing DTBs.
I noticed because PCIe is broken on Gray Hawk Single with R-Car V4M
after this series.  Indeed, "[PATCH v2 4/4] arm64: dts: renesas:
r8a779g0: Add GICv3 ITS and update PCIe nodes" only covers R-Car V4H,
but not R-Car S4-8 and R-Car V4M.

> +
> +       /* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
> +       if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
> +               return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
> +
> +       /* Derive GITS_TRANSLATER address from GICv3 */
> +       ret = of_address_to_resource(msi_node, 0, &res);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
> +
> +       addr = res.start + GITS_TRANSLATER;
> +       if (addr >= SZ_4G)
> +               return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
> +
> +       *msi_addr = addr;
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
