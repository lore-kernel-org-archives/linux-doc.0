Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FCD3D3321
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857196; cv=none; b=qZ14D8g02NF83bdIWzMBEbxSttdaoChXuMbxxVRYu5c5fBS1Ij/FEzOsLF52Et01OYH302YNNog1AzW2AJsvsRvn5rkJnGY59vPIOFposdd8GN2iyulLYzcADUvxAhCp4W9hVidFDst67uL5rtIc0riYfBeP48ovypHd4tgsE3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857196; c=relaxed/simple;
	bh=DaAQfNMDqfA4SiBqN/u9osdm8oWxv6NACh882Mgt+no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r74jAeCJLJP270F3yvENCTusa8zx5WO+DQ61c1Mxxv4yruxlTHCzPAKoHOM9pw4iLkYxL71fGs0uEUnX/A/WWjwBUlcUrKEKMm2acC1jh8MfbRWjCui1vHG6EISrDdvwKMoPbec4Rv7K6f3UxY2dYv5btWPUEeKeL5p17dNvNr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-982882c21b1so41009241.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 01:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857193; x=1789461993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jpscs7JaPB6a7DSYaibBo7ovev0XT0EFpj0jxoPpShE=;
        b=SjnA/CKUIlLXZpXXTQmuyS71oWNDfWPah8y3pjrm+w+5gpGYwiqzGhErdjfokj7ufQ
         PzmYTAbnA2Q+nxJaKe+EjR7qMR/x+T4JsnVyBrZ0zyabtun3/x3eZ72lr5RVzAqbXKKu
         WkhTHbI+XG0KPqupVNiJxCW+CK5D07HAAXphw8Vd1ijsVQRDEaVRDESs37RDkybqACso
         I9jjdi+vSu7OV54nleOBBInZTDxDzNqK/il4I+etLgu4Rpz72XV7aHY6LzVHiwMPxawx
         FG81aCpsYDPVPRbpjUyoU3s0koz0evccE8aoJRJgJsECeEDAdqMY3r0e6qxU0oUgzldX
         PzLQ==
X-Forwarded-Encrypted: i=1; AKwUvByeL/0GRjNTOhWkqRe8xF/3P4huyU1Jk4ne9zV2RtilpQXNFjrTyxqKizEjoj8gpkz0WB524vuK5sA=@vger.kernel.org
X-Gm-Message-State: AFuF++k9trpTv4cVvkkhJExp5uOqZKkoyruZvjBwxpV1Brg5ZZ0IUdZ1
	mtIUR7vMbiRZs8VgY2ZWvClWVdAcQ697aZSGR+WZQAIgukMl65wsF+td2lZa6VCF
X-Gm-Gg: AYBFou0BxRSUrgPTfw8o244VSwjvLhZ2ycgVJkEtC83nR8vm6DTqAUfDM1Jyn6jGq5I
	h+ZBnRnZv7ePFAt+we9E1yLiBwuAgBT30BpTSuPfjQO1sTgD0FrvBCH1V++9sPi3zAxc4QfVjBC
	/rvNkEOfqmb3R93YcIByscPmfUVAOw7kBAgtyEQeQZtaQGgdm2/IBXpmqiNRvZLdPvlgmwHcx9O
	3LdmkQhGz0xRTgbgGXpbC1/QcMZ8cmuqhrmqeSrYDhJrQBwCRNb9B97f3EO6X5O7hpheVYcCI/W
	nTfaJQJaqZliblT1FPw+QhOETxcZbs/p4HnSzgRSeRaEICnAG5hnZFW+UVcPVIL0eWQDxA/gVa7
	Yw7QNJIpY3ZIAzP8lTIaxeqdo+dRmYj9d3hENU2XBFmM4opSueSAbyXuXzDla9qxl4ohUYxzlsK
	+1Bx9N64mWxWT82uj0dvg2cqS1N8PDYBad7TgdGv+KN3gYnQmjebIFwx5t1XPOPnIoGRQF5WwDY
	CwvhMATga5gTcebNGNMYQpuVfUeI0c7HlaW
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id ada2fe7eead31-78a4a99f7c6mr10136090137.10.1788857193609;
        Tue, 08 Sep 2026 01:46:33 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ad27bdsm7964362137.6.2026.09.08.01.46.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97e986f1996so1017081241.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 01:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwyROSmeiIpgFm0rEE/pU5kfDaLtKmhlcV+ebCWuvWLu8TTuDubsfj2pX6Wv28KpxBlumHT4CCAdUk=@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-78a4aa3506cmr8542865137.11.1788857192323; Tue, 08 Sep 2026
 01:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
X-Gm-Features: AcwNN1U6U5lTYgv4OCUonWRRw758LHZnUmo8hmQI7dJ9Temn454yHA3PWD6OCBM
Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.

I missed before that "msi-map" is not actually added?

>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -809,6 +809,7 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>;
>                         reset-names = "pwr";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its>;
>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

> @@ -2148,11 +2150,22 @@ ipmmu_mm: iommu@eefc0000 {
>                 gic: interrupt-controller@f1000000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> -                       #address-cells = <0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
>                         interrupt-controller;
>                         reg = <0x0 0xf1000000 0 0x20000>,
>                               <0x0 0xf1060000 0 0x110000>;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                       dma-noncoherent;
> +
> +                       ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
> +
> +                       its: msi-controller@40000 {
> +                               compatible = "arm,gic-v3-its";
> +                               reg = <0x0 0x40000 0x0 0x20000>;
> +                               dma-noncoherent;
> +                               msi-controller;

Likewise, make dtbs_check: "'#msi-cells' is a required property"
And it must be <1>, so msi-parent above is wrong, too?

> +                       };
>                 };
>
>                 gpu: gpu@fd000000 {

I have already queued this in renesas-devel as commit 7fe73a3a3f2c3718
("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes"),
but I can still amend it.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
