Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BE19D8A7
	for <linux-doc@vger.kernel.org>; Mon,  2 Jun 2025 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748852125; cv=none; b=l83p9s4Mk0kN5fhEMp6L2+PqPfGplNX2OI/yAZgY9bbbPbtMxAWiQWpw5XO/u+AYKfIe2vW19jXEhFXkCr3w0rrGbmq5jOX4Z5oNB3c+wzltod51V4NfU07kP6Y1/Lo/+M/W1mdSaXr4UBD8J38YSr99EaIPD+5m0xL8PRxDXe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748852125; c=relaxed/simple;
	bh=b5WLvoDKr8I2SUBF8e44pplZtOcRqwZjkC3rqpPEaUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmz/j+1gUjV555o8tTFp24a4rrIVnLV7ALIt3CBmIo2L4ldIcudTMz7D+SlgvIkP39FBYq7MhGQLyt1Dc1xRPHGTwbbOCJcJYoor7zlNsVmG7/blhYzOkQvxWswy+3nAr1WDt2NkWnSTc8OA0Lbdgv3IQqvTXkVY7Dlf5vBNZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=19Z89PPv; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="19Z89PPv"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e812fc35985so1033251276.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Jun 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1748852121; x=1749456921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=;
        b=19Z89PPvcwGBoxPHcOYizASJm4sUeWPFZ9FrBcosW1XQwYwk1hSYSFKN4Efw6x3Yg2
         b3uZTOSnSRm0S0IeKOwP1QUJzfoNoiDDcWspGjrp2zV75nyGC9x7WCVHAe4h2/s7VyuO
         6XTkRpJo+Ic884g8M+zHrTlhWVx08nZtzq4E9Q8wJjfn9U46fn/485ohv37BE/WtNXoy
         URGY7LczZJp895Ju73+eH74Py4r5kJAv3a+ztb5yP9W8POMuwxJClIDRFQfOPAXlJQfC
         WufS5mS1F+LyvwKGJOatVyXEreEgo+wei9M+RNat6nn7cI3Y/a6VfqnNslpkFxOUzoCc
         7oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748852121; x=1749456921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX5KaHY06tu+FKC0bEyE1X52oSF5H+UGj7sz8V9wh8Q=;
        b=rL7KLN2/niOWhRhYc81KeZuHGMrnhQlDw0z9GK6SmJHBG8+xnP8xJR3IkV8vOI15zT
         IcLGGHtUwRw59njI6rRY+BCn6VCUnd8weQAwfxVPOGmsnxPU0qBSCDrT4poz/3rVFK8T
         yGENfD+L6rW9w173hLR+TfzU54MLAn9jFgxn/VElCmLAa+SZRS9KqanaVlmbKbJ4nLwr
         B3tM0uH7I3N0wkfUVtOr9j730EBnVRNeiSWHohaqci7etT6Syfe0/OODFMfezd8fI14c
         EeqMmPDZlmKOu/K17TvQSnL08OikwAN0ToXrXrjBO3gZjaNuTMySqDI5w66pHJ0QdhLg
         7zfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDwK1cPvoJhbLyz/aVMeO8dCxkZhJJgqbaBs07w5nW331zua9KEh80Zh+WwWquNaCV+EX7Ug14orw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJVrjTAfXSLC6Av4P0aYiDGUVcq1C9TuXM0TKD0t9Q0uF7XCvI
	B7GA0aS0t8ljZZTjOhO9+uSwLz03CYcJ7BKc5OEJK7PTS+by7THFpEZOGuLCjknWWH8=
X-Gm-Gg: ASbGncv8/hEyNWLXsHL9AepqeUi+jmMXmUAm1YoQ2z3LNwZu9m99G+9vbKGBpovtcck
	0PlF5hKmulBDia7Fan5hJumb9jmwhKsW8jAGhbB12Fiue1qe1wpC861xw0tLR894fimQ51xYYiy
	M4YcsIgSw/M5ahiLPIOp2t9ON57ZQ6JLC9TUEwmMXF8LOsulFJ79urbEY1KHRuVemNHfJOdVcsA
	ZygiQA0gkv0P1PJo7wEv7GDY9yTWHS6Zwil/z2VayjVF1jRlUBcItBIdrXr77eVuO8VtbW4g5VY
	4sFG1+/Gld26icslRIMQr4dtxqqeeUyChyuhljAArfkorV8bKAanB9s9BUcunHkI0ZJsHpa5c50
	fMSxJfUTeu9Rpi1757AE=
X-Google-Smtp-Source: AGHT+IEbpwlX9RNF9WpXDfglu7SHNHUDlo1hyRYlQSKKylNeA/9j/0aUc+ELyV9kOi9X6Sh9wsvWsA==
X-Received: by 2002:a05:6902:723:b0:e7d:d830:41e0 with SMTP id 3f1490d57ef6-e7f81e05026mr18622675276.12.1748852120773;
        Mon, 02 Jun 2025 01:15:20 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7f733ec580sm2134765276.28.2025.06.02.01.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e812fc35985so1033211276.0;
        Mon, 02 Jun 2025 01:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWNZiUlC/Pocy3U76jL1naPxAfdP+6fdSp6DFpXrcAm8jXR75j/di0M4L0zZlP/PVyVwxf62yaY/981Xpj@vger.kernel.org, AJvYcCWXx1a37V/bDdM0sGzYGNYTC/BekLXJDsiemakqqHKxdcROsSrdE2zMMmhTdnT2YM16oDudRnSARFEt@vger.kernel.org, AJvYcCWqGhJucBtBMf2M6RwzIPcIsVK4ujaJd+jf4VT99Enf62rqudxxGPurRPaSJLG6jDLtHHc2Lrvidr//@vger.kernel.org, AJvYcCXTWcdNuqEnDSVHihQgFei2hLFQASwC8QrVlxFQdUdwZqwKUt7bFQePvSDrljpOxQuDpd0xBeds18t375k=@vger.kernel.org
X-Received: by 2002:a05:6902:723:b0:e7d:d830:41e0 with SMTP id
 3f1490d57ef6-e7f81e05026mr18622596276.12.1748852118798; Mon, 02 Jun 2025
 01:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net> <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+2mvUDWWvtPSryAiCNJP_=1vNRxARxWTS=-O-LTQO3Dg@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 2 Jun 2025 10:15:07 +0200
X-Gmail-Original-Message-ID: <CAAObsKBPywWbe43AeY24P_13zH5m_BCb9arAhf+FVq+w=Z3j6A@mail.gmail.com>
X-Gm-Features: AX0GCFvNhfOr4abfwc18aAyYDuAfUB75c0n6dwgqbzT_BxLwdikrZIB5A8pfreA
Message-ID: <CAAObsKBPywWbe43AeY24P_13zH5m_BCb9arAhf+FVq+w=Z3j6A@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Kever Yang <kever.yang@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

[adding Kever to CC]

On Wed, May 28, 2025 at 3:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, May 20, 2025 at 5:27=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.n=
et> wrote:
> >
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > v3:
> > - Split register block in its constituent subblocks, and only require
> >   the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >
> > v4:
> > - Change required node name to npu@ (Rob Herring and Krzysztof Kozlowsk=
i)
> > - Remove unneeded items: (Krzysztof Kozlowski)
> > - Fix use of minItems/maxItems (Krzysztof Kozlowski)
> > - Add reg-names to list of required properties (Krzysztof Kozlowski)
> > - Fix example (Krzysztof Kozlowski)
> >
> > v5:
> > - Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
> > - Streamline compatible property (Krzysztof Kozlowski)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++=
++++++++
> >  1 file changed, 147 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43=
c4b8250cdd1b9ee86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
>
> Is this really a distinction in the h/w? If you change which core is
> the top one in the DT, does it still work?
>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-rknn-core-top
> > +      - rockchip,rk3588-rknn-core
> > +
> > +  reg:
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    items:
> > +      - const: pc
> > +      - const: cna
> > +      - const: core
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
>
> It is odd that the non-top cores only have bus clocks and no module
> clock.

I'm not sure I get what you mean by module clock, but the TRM says this:

"36.5.2 Clock and Reset
1.5.2.1 Clock Domains
RKNN has two clock domains, one is AHB clock, the other is AXI clock.
AHB clock, which is
the clock for AHB interface, while AXI clock, which is the clock for
AXI interface. AXI clock
also used for core clock for every Calculate Core and Control Core.
Clock frequency can be
controlled by CRU, please refer to the relevant sections. Automatic
localized clock gating is
employed throughout the design in order to minimize the dynamic power
consumption.
Almost all of the flip-flops are clock gated in the design. Block
level clock gating also
implemented in every separate block. If a block and the interface to
the block are both idle,
then the clock of that block will be gated automatically. This feature
can be disabled by
software."

So maybe the AXI (aclk?) clock is being used as what you called the
module clock?

> But based on the clock names, I'm guessing the aclk/hclk are
> not shared, but the npu and pclk are shared. Since you make the top
> core probe first, then it will enable the shared clocks and the
> non-top cores don't have to worry about them. If so, that is wrong as
> it is letting the software design define the bindings.

I don't really know what the pclk and npu clk are needed for, but in
the TRM I'm seeing references to the pclk being related to the core 0
(TOP):

pclk_nputop_root_sel
pclk_nputop_biu_en

Couldn't find similar references to the "npu" clock though.

Cheers,

Tomeu
