Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8E477E48
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349177; cv=none; b=m6Oo8urg+oyO8NVZ5pjE9y+U6figd5YNh+JBGhdYWQxbzOWFXsGHVtFRSGwonAc80htw9FGJm86Sj/uabuHlsh2+UGssq5Jje3AvEIYJ4s2kJZOczW4DwRh8/f0LZzmP/zAex71OWOz/RnNz1vVVnfJbiOEwLsIvWPn6lhrZCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349177; c=relaxed/simple;
	bh=GrBIm0BKS+Mu7/OLWlqezUi4tFJ6U0Srqj6VjLPOZaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjUHSYU1BwF4xngzoB9W2bIPkXta2QBFIGTsNJOAWTPtEe79o4nlfGeS+dOfv+rTZkh6Dynz/sa6yStvfD6hRP8h9t/ujxe8nNNMTotyXVL9cpX9kNjv4J4SIs05VpkrNWFibtd88153kvNas6NhDl++7GNEa6IW9YHImMtHlck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97cbbdfc2e0so349380241.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 04:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349175; x=1788953975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEAVGW99jRYpfKK+i5q1QjOfB2bMJtHxW0mUFyR7MIM=;
        b=BL4c549Y67etfQveuhT41oTooYrrSx7uSZn3CHjF/wg6HkHZ5zXxwZJbbTqiFEO4wf
         g/fwDn5G8KC+TKcERS2USPZP8aZOftWzjGAC3ABfsLzO6c/uFJbkfQZhKT4zJlLcB4o/
         ZNOzCiqrrhovZto7n+4ukA+WdeLYoMp3UF6m745LRbLf/D0L1M109Sq3MeQU1M4+REJr
         R4w8TfBckeRq+1QtuiKEW3ZcqC61pcYqP+OStW/Vry+MAMq2ws824ukTxefWn4YID+xF
         ud8e7K0Nm8FniR3iSKiBjMwiaugAQ1plbQ6tj3ZgDB2nqsprYP8EGeWriEUrhXeS+jUS
         1B9w==
X-Forwarded-Encrypted: i=1; AKwUvByBKmOp3oFkDMsyy6dkGql0qqf0foAT83GUrFdV6IgsY6iT/G5YHogzdE2w5gQFM3obmlrDWIB4Xh8=@vger.kernel.org
X-Gm-Message-State: AFuF++kUAYJM6r9H+WL4sgI8U3U1OZZ4LDP99EoGjsPN9oia/Ouizsua
	8XjEEtaFoWfvdAFUgxIvi8WnnvltPcvd7g5uWnjYnv4We/6Za6HQmBcvhyLNrmpH
X-Gm-Gg: AYBFou08nBZfFoOjdN4Y2s9yGGALt2NqxzSjzoQdREgQK6PzuQoLwb7ZFG9PIDlWuT7
	pc2oqcxgjwjSEtkZwrWElXEVE5zw56/Aj3u5tvWl/j2PYTHzdnLg7qKp0XQFSyACx/nyjwpfBcL
	qve4/q+TjrWEVUZzi4LOebvpYGXuIjlu1v+zFLun0shXFyXBrXqzUdaDPhZss+o1mP0o4nhDtpn
	5ovTa4NuHaV+aMop8xADUZdlMVDlQ/zr+PrObQTH3RgyoNxDaqhu1CYU/25VOBSCPMkMZxQX6Yw
	nIQ/kEaZj+bOHXp8vEIe3AMmdeWdxkopmqJrWLSYbuc0O4oOz4OA55fpEI+GMYV5JnJtYbbMyCO
	ANOrUtzZMGYo4pwoO2oGGY+UpXyz+cWrGRG4N0dQu5jufPaLL49fvyea38fqU+8wEOZA+LaQIKi
	2IVdQmO1SK9yNLE5OQoE5EGMjqxkQr1IVtD80h5T9HV7fvpxcAWms2XmO8qT+OW9LA2CeGKwqEZ
	T9i9Ed8OlKj3t1KWnUbUBTaFA==
X-Received: by 2002:a05:6102:3a06:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a1f34dd1dmr1486270137.13.1788349175268;
        Wed, 02 Sep 2026 04:39:35 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980673fbf40sm1833041241.11.2026.09.02.04.39.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:39:35 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so283252137.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 04:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOajLIv4hrtGBfP0NNxgkh8pzBYx6O9FqYNILUFMqBcVCtThbjSS/2zIz225CDjG8p75OP9NasyN8=@vger.kernel.org
X-Received: by 2002:a05:6102:faa:b0:785:bfc7:26f5 with SMTP id
 ada2fe7eead31-78a1f33dfd3mr1197143137.12.1788349174855; Wed, 02 Sep 2026
 04:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:39:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
X-Gm-Features: AcwNN1XYp2AmohzI9M0wS5P-4B-ztdbPdhzMYLGxaK77VTrG86b4xj0U-T2WG1g
Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
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

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
