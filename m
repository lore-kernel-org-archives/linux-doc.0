Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0683DB330
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015656; cv=none; b=HLyD4ycptg3AncX2JU4EgVFalSDScY1rfISLUX2Mszv4INmzV67S+Vv+gMdIXUXrgaf1QlUbvTm8ACK+jZzOesqRaY4FbPhRlzKowi+pHiZgsRJnP98Bm77+z2cFtWgFi28hHsUqPQ8KCyXzBJbrk8B+CFZ4izKSx4eutMPU8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015656; c=relaxed/simple;
	bh=THxugq6t+PDXlFGTMulIef3VfnF0pxoHGHT4/GfoOOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k00K+3BqdhcMrR6xu01U9uurt/J1HgkC9aV6Pkr96R0kZgUqFRFuUNVIHUw+AgCx2mSzGQhAOzbkbtzYpkpS0R5j3JJ/6dpHMcB/VRPjQayZ7B/gZ4a4nSSD76AlL9NvXwrIG75oZUMyBrIj8SRpp7H38n8Z7RNk/jupoqMHs48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so324153e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 00:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784015654; x=1784620454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BgRx/9A4mxiDsRVEDvyTiz/IgVDal/aTcWb8tkjr7jw=;
        b=AdLZY7o89ipuAEBi5Yr1F2M7+eMDboBc9cblirdEI1WPyrA2tr5uiAUdaNYL7dlR6V
         xjawGfGTCfAamqIv4BPSPYcUaF5RCd2RULL0MH3SoBGaavmtb6pBdcGmPK/NRmFkT+Tw
         wIk+/+3QcIhX0L5dfBch9ngEpy+5zxqsCo3nQLUjYYsZTC3hYT8OmYvRO6ifuMksOZFw
         k3CNjucgYcS4IUwC0vd4cE+K6k2GMy4fWhyYDn5dxWuVtmjAw/QKyK6uDEripAfPlB8Y
         fhbs1uoNfUc3HvTWOXQDzZcL1VjFNtACfrrx+mRDxHY3vYbjJe6gQb9tmv5hZmRktKP0
         pI7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpLlDwTZMpmA12UuQOqQP8IYIJDMlh0inF8Sxt2rBtmRnkfI+399o/HNOdIpfPowHqX1Q4dOWQSdhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZId6pNp8N3vzbPOzSIOLnQvD3d3Te68js+4XkaTlUFaaoZPYJ
	lIKDccrNQshTpGcGLzAWMtrha+KJ2BQ7Rq8VPvQFF0V/ZVHCJa7fWA3+YjvhqetZi+E=
X-Gm-Gg: AfdE7clBBADU3doo/fDLtK3mk1bjO/QfpW4eAybre2A4zYixgHYdARrnxxXs1M4QguA
	RO+Rt0pKZpLq27FBarjgzKkJ/+nswwic7G2iyCdixQfPiR2+UICweqZ/cCg4ikJuYaEq15r+q13
	tRuWQI+5KJUIkoVMe6uRcVe1HzJ4K4HAsmozaammuw59oJHmq0JJX4QF0uuk0/h8e1bg5XZyKLI
	AmgMCIP5jFFo9AK985znWiX9yXTYopxbtZEN3JuNSeoOLQPyyqZBEtFJish5uaQ+I7fWlBuaN1d
	6GvV/+FABnjvBK50g5K3DlMqMhrcvVvhf17d+r/Xgo3SYaIwrlNg/vPlsTs+aYxCxBlrHY1J6ba
	cbIjDR/67OUNK+ispcbA7W613GfDs2Z8IT4XE1M3cK0T7pClfvOaoKNgap6xQX6Zw9whnHNim2F
	yS9F1UTfvM38sDqCoF4i+DCaPeB7k4cmhQU2Fw8WjGLOJpjbyUPTjzGqD2c99uVh0D
X-Received: by 2002:a05:6122:e461:b0:5bd:9d27:1ded with SMTP id 71dfb90a1353d-5bfbf0a95fbmr8529431e0c.3.1784015653733;
        Tue, 14 Jul 2026 00:54:13 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfbc09a065sm6105758e0c.5.2026.07.14.00.54.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:54:13 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so324147e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 00:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8iyg4arL3/j181h/YefbYGbahYDxoFbzpFp3GHmNhdyiNiWFl1+v4wyifVaZ5PFUmBxc6vfs+V84=@vger.kernel.org
X-Received: by 2002:a05:6122:83f2:b0:5bd:ecad:8f9c with SMTP id
 71dfb90a1353d-5bfbf172175mr7212570e0c.6.1784015653328; Tue, 14 Jul 2026
 00:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713175400.GA1258926@bhelgaas> <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
In-Reply-To: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:54:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
X-Gm-Features: AUfX_mzs8lWdOW-5Jg3BgK8EeDUWxqE-PpZFEV2XQkTM46SmNqGtsnsDEZCmeKI
Message-ID: <CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> >> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> >>> On Thu, 09 Jul 2026 21:10:03 +0100,
> >>> Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> >>>>
> >>>> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> >>>> copy the one GITS_TRANSLATER register offset macro directly into
> >>>> the driver.  This repairs the ability to build the driver on
> >>>> non-ARM non-GIC targets the way it was possible until now, which
> >>>> retains good build test coverage.
> >> ...
> >
> >> So in the end, it is either this patch or limit the build to
> >> arm/arm64 . At least this patch still allows building this driver
> >> with more compilers on the various build bots, so I would opt for
> >> this patch here.
> >
> > I like the build coverage, but duplicating the #define doesn't really
> > seem good to me.  It makes readability worse because cscope/tags now
> > sees two definitions without an obvious reason.
>
> I can rename the macro, or ... sigh ... I can reduce the driver to build

That would obfuscate the code?

> only on ARM/ARM64. Which one do you prefer ?

Just add the dependency for compile-testing, just like
PCIE_IPROC_PLATFORM does.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
