Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CCB269898
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 08:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026220; cv=none; b=nOWCRkXYaPbyBh0/04I+Ov25rXo6qe0JDK/WIDcxQhNEBKT+Briyma7mYw1pNMLvM0iAYlReSY48m+ObHraZjQEbCHE5EbbDhB/iiRtAXlco3Q1rCRdqSDI2FjcLHakTjJemXqEBtyVeKHBjzTjQC7rnYkJh/BFtCyb1LgbDa4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026220; c=relaxed/simple;
	bh=lZUMVPd+TjXOnbewMrKPKU2D7vXCosD5LXoZwVJJ2Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1W8ppi6HeaAzL4GJg6+emvXfdDzPi31DZyoutcfHqPp4+6l/JQNw+Cvsmv2RKPwo7LJM+JpwdWQRGP3et8pbcHqFN3u4KxoB5kRkC3iSkVpC4/FLWcrn8XDZ3djIUAhTvj8DdlVshCb3BZue4pEMA8OCmpezGNwRNPZADN4L0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=hP40nAtp; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="hP40nAtp"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-708d90aa8f9so59834767b3.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 01:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749026215; x=1749631015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
        b=hP40nAtpC+FRA1i2/eBrUmPSmU9lS4LBPhlKK35WcwEU7lh8gzXNCnOPQUtgAlFTqq
         9E2NGaiMGQGkpgwc7SDsdN8biceeUpNBYK4Cm8DqOrvaehYuslhMXPVhjLDhY+vRY3Lu
         mU/fVLPM1ZzVmhLLMbGcY+VsjT1gA+dFic7w7gcFVUnUCVspr4k31X3+REWiNvBRRbKH
         VEQ01x4sxUbmY8DJdk+Fsk2Zu24CN0IVOl60bAq7O4u+hAXBaT0m6kCE2zayq7Xwl2YT
         vdGYwnWqWaGNOTHIum4GwW6DFf+/5iUVI5EfLqhKoge7N9bUGE/LqV6gBi6XiZV5NlUK
         Yh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749026215; x=1749631015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJmj/95wgXcHpVI6Ou9qJ8Nq5fJR29OVttEikN7mIco=;
        b=WWDcQZOoNKz5DoYw3xb+mMri/RW3gHMSM1T2Vd8FirrV78InDmOmr102nOlvuYxy8u
         YaZtvi7k3cBMot7GvxzGRH0okd3gw6h1SAb477ry10VzWyRlG6AltyRrjrtvKegmGNd6
         i6M3NPOqXPVDlnxq6Lk4e/00oPXygzvyOHTBR1CcAIDCxh7yT1sbsHnVQ1V6RjkTKNGn
         LgvrqAiZF6XkGzodNTNfopNmWqFTzuFivxM/+5KIUSoakQMo/0AQH4dxMBhiAlYUdbpR
         rn8uacIHM65hyZz/GS4TXGVoMibkM/yHjamCQUNMAi29G2mIa0UzD3KfyFESSr3mykbF
         +MNw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ9LvFq9U1YOnQn2YWsC78oJ4GTWH50+PXHN4sTjUtPW/7HdxXy5aUKGNv6dYfvTJNt7HcJ4tu9Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPZTRzbOFcTn8S+qSd4h0DkM+pkB/AZ80Gg062WyzrSZeMkkH
	nsG+VZtbCN4EriCRnfBu5pBnxrv8fxzhiWstNeWoi+zJ/m3IxtmuXaJIj9ekycw08e8=
X-Gm-Gg: ASbGncvc4REptFXsPwlPyGPjKXv8IKKgldm9TFLrvEdYhD7J6uxa/0g2GJp5h4gJ8wT
	uyCkddsEKomkOjxg73kqy1va9r+E0GPrQlVZf/hSRyQeyyb8Eai120MN4eD8R0umnd+avP+DlFh
	mYj1PP0ZBi8mMffNXXxqu0gVjXhUK6m0OkyVloO1luG/nH2ViseCbeCQxyqk1yr/1uW44Rz/esU
	eCpuUqaQLhNXCl0stA+MNJsG6dIjMJmyxx6WtlrVEPrcAWEy04IpzFgq9eP0bAozsAhi//Xh6bn
	hBXPWvTrSycE8mNv4IKR0LQshoaBDZpbZUqHhAmHgs4iA3YJFeAP8/JI5QXDOeLynA0TG8PKS7d
	kUEtqxKzgOJ1EWfb5w9U=
X-Google-Smtp-Source: AGHT+IGAtiLPhQPOwsV52/wbwHI6aGaNzcA7rtap+Rcs1v0V8QQ0deHXme2lqVPOqUfKUHS1nKWE4A==
X-Received: by 2002:a05:690c:5b41:b0:70e:7503:1180 with SMTP id 00721157ae682-710d99a37f4mr15471087b3.1.1749026214852;
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8acd51aesm28953687b3.84.2025.06.04.01.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7dd151f79eso6290894276.2;
        Wed, 04 Jun 2025 01:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULW+UTfFh+tT0J44z1K6JYbmHlv/wd1MXXy7KKCEtBGCgRyN797NLiJGgErUHzPXOAy1j8TsWLlWFEvLw=@vger.kernel.org, AJvYcCVM/NXB0C5w3H9PDbxdx4ri8kz+r+wR0mHzdoTZllFU2cIVxw7UCYZjGJHgpab0v+R3bmH7+U8Bnwq9@vger.kernel.org, AJvYcCX431fODxXURRvDjMnwc5r0kvbnILTzAMgl36ph0qdgXUQo9BcH8muM4qlc6MQurVWU4qfxZ00XfSf9uohh@vger.kernel.org, AJvYcCXR51l+eC1sz1L0RVb2S89pJmWSbVH8OLrbhdLbrbiuT45xLlBrHwMiWjIlw3kqVx0EY4fXfN8N0Mnd@vger.kernel.org
X-Received: by 2002:a05:6902:2684:b0:e7d:cfd0:957f with SMTP id
 3f1490d57ef6-e8179c4e822mr2337109276.11.1749026214087; Wed, 04 Jun 2025
 01:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-1-237ac75ddb5e@tomeuvizoso.net> <2024813.jZfb76A358@diego>
In-Reply-To: <2024813.jZfb76A358@diego>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Jun 2025 10:36:42 +0200
X-Gmail-Original-Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
X-Gm-Features: AX0GCFvL5nJeCruhYVKFwWz9ImMH3rGz7U0FgI_gqBjbHTrFFbFoGu46LHESGLo
Message-ID: <CAAObsKB6UDp-yBE3oNNn0GkiVN0TeYFkL5nzQCroUHaSK47tUA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:25=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Mittwoch, 4. Juni 2025, 09:57:14 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Tomeu Vizoso:
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
> > v6:
> > - Remove mention to NVDLA, as the hardware is only incidentally related
> >   (Kever Yang)
> > - Mark pclk and npu clocks as required by all clocks (Rob Herring)
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 144 +++++++++++++=
++++++++
> >  1 file changed, 144 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn=
-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-cor=
e.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9a5e9e213912d0997da2f6a=
e26189adf044dcc7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.y=
aml
> > @@ -0,0 +1,144 @@
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
> > +  Rockchip IP for accelerating inference of neural networks.
> > +
> > +  There is to be a node per each core in the NPU. In Rockchip's design=
 there
> > +  will be one core that is special and needs to be powered on before a=
ny of the
> > +  other cores can be used. This special core is called the top core an=
d should
> > +  have the compatible string that corresponds to top cores.
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
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - npu-supply
> > +  - sram-supply
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
>
> should be rockchip,rk3588-rknn-core-top I think
>
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
>
> should be rockchip,rk3588-rknn-core

Thanks. Actually, all the addOf section is not needed any more as we
now know that from a resources point of view all cores are the same.

Cheers,

Tomeu

> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
>
>
> Heiko
>
>
