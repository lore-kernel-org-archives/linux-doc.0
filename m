Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BB43CE69
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582335; cv=pass; b=pNPhJGE+vLnRRp9Oxi3ZymRRMG9baJ71MOzVOf2gygzjALj2XW/+iErb/IOFJAB1+uHc/8bRwZrMcSmd+VAR7/+xp/JwF06dKEviGpFQT8LjZDNRI7X5CQ6vf/UogArsiZQ9VdGQkvd3UPJAGcKnkJIl1SzWYzdprjQEKJhidOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582335; c=relaxed/simple;
	bh=uIVVpMDmMGX0h/fu4HXu0BYDldpKQW0ZxH1umBAPys0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECAHotUGr438acyxBIZ9/LwFO+728zUOwI0K+LjncZ6GmPF9iGDwoDzeW9Xiu9o6j+SoUIdgrDtM9pzdJbOFNOMx3ZruC3hQUio0SeaqRm5r5uFVSIiI/e7kTfTqmIMW4dpc+Iso/sMjKrCYBWhCt/80cAotFzDgn6LwT/x7fYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvZkwirj; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvZkwirj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso6066301a12.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 07:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582330; cv=none;
        d=google.com; s=arc-20260327;
        b=jP2MZ6vGHFeL62wqzUEEmIC8seVHnfFgrOAKvFtu5lkk0GdlqfDdqlxXRmXmZTpKPE
         EPdcERvJMo8vP9rSm5rsHG1NKlAWfDR5UOqQONIHQ4mDnIVMNQY10yCvsyRbJRKbHv7z
         hWVjWcZmzd9mdsgat7KEge6L0TAzVvc8qkC9U+EtNu5Us/GF2Mhf7AWEIeLpnWz69G3q
         DGy5+yFXvNlHvVcO5RRaJB4x6f24Jd3OWcfShk20f/K2P6RE2NmQo0AGU6q7T9cJiLkc
         1yMob6lmg+JwhcyXK/TLeDmCNPRLHSElW8UCGCtmkyfNLez4of7mVfUv3h6znViGcPxZ
         sHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        fh=FL5duxCkcKZrFz80cBZCgQq7vBUX7GcoXs3OciQVCdc=;
        b=izuAHkFVjczubBjI3LURdSA11bAS2IHU15c49CgXoLkxHsk4VcQgDbKV+p/9pPRV4i
         hgm8GPhGpIDEOghTnoa7gda7b4xopgSiWNwVHMTEvPP1b0X1opx44r1A1rPtkFI4VNNr
         XPJh3hr5oqmxFfSG1T4XRvdI182eZkxpHykNGUxYSW2nT0aUcTKNBatjYjKWtSc5SUz7
         L+rETkFCkYWJiAIr+53fxGwFf6xX3gwsnrfjsuPxZCNZP0pfYqSEFi7GyKGGpg2oVTKJ
         d8Iih9hCIOuwKDYYMDH6iv870ZNpapGe04EZZJdA/lGlLzyRqRO4T0Wblu6GQ6EV7kSp
         KAsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787582330; x=1788187130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=VvZkwirjYSsd3dI2r3gNzvi5pI3wSfJrsSArNnW9Y2ROIlS/8QRqNL7LGDH9aypVsc
         23FFX6uhpzplKWd9Tpj7WM7Upx/qo58j3lnRS+OpS2bSjfCKL2vV60oEyXYqJFvszkS3
         sOj43oeVmWALH3aG3FgepLaidHbJf1cZ1J2UMl+DbxeRlgCMuebqjY0i3h492P9LXFSD
         Ku5qlv5/1IaE5Bryclv5tUNCFYY1gbwZYrSNXeAWy40WyrDTiPMH0h9YsmThxk+ATW1s
         pzvzRncB89LCfhFdxCyWHj2T2ytuIhdFRSNun2OBa5y4UKTa9XL1y6pTWgkNMqdkytUa
         Tqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582330; x=1788187130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=F3FI6Jxb5N2JYgOIetDqvQyfE+zT8sNxB4vrbkB5xZR+kN5agmVqqppWL3HU85nkSV
         EmvwACwywmGrZiJlZMKIl/+l/4r+zaoBYG03a++oips00mAYFBshCB/jggwoq3RPNlX/
         lBs6Q8+ubdVO8Mo01wrBV7Zxivt8lQ9/vUKyZeBJMEViCm9V4hAsSkHoNkxUXN7MPQvj
         nwgZPur08yiiRD9REGxkAQ1WQnmy0M2fmlt8JCyzFLe6rMUt0GFCZYJLEQahBSWw5RkZ
         o0mVo1CqnE1pN3R9TPZSn+mMam3zw7T+GFldmCV05Aj5X+baUX1lI2DR4q2URohYW/dr
         Lb6g==
X-Forwarded-Encrypted: i=1; AHgh+RrsuvyN++P0uO5wIHLuv3iufG99ROjvbearBK2wzrFYmRbjvIQFsU2qSzjvU5wJPI2Qj5zwno96eG8=@vger.kernel.org
X-Gm-Message-State: AFuF++mUZNw6bLIPKrZFosiYnDLRw/orMr7y/TNUdis3mzX0JdZ1F7Zq
	zQTQd86TUpU8t2/u62nGCi0XdqXMkVxE46IMukHPROXs06crzET7yRQCrLY8Qs/qTsGy9UZtvKu
	fTlSxsDdXvFfD4C2TxOHZHqZJk8SWxOqGV8ZO7Pt4tQ==
X-Gm-Gg: AR+sD1094vUif+CnVebcqUYs1VcEKtIJPf1zubGjzRC8CcESrKblV3UwwdbDDNWvwtI
	FP1SYdylJ98wIlQLty4RtJnx+qVPM4MYwVz2vec8Sk8D9QnEZDpPlK76KQ09a23l69r4Mq15Zt6
	6CKMa5lIW2Xd+slPe4dMnzvQgRxfC+luqF80j+Nm0Kd6h3qku2WTrywTMKpnxUSaeYvLtPkP/mK
	RdYZ4AgJGOvBKNgYrzyjq9X+lYFOnUE5uKDyzwrASQFpkb6A6dl1sC4N3jcTBl714MxyimuYdAY
	OG+ftJhkt6byYneg9Q9tDif5lIuedOx5C2oj+fY3S84j8xGoK5KhTADinoZl20lJlddvgTuvfOt
	C41E=
X-Received: by 2002:a05:6402:a50a:10b0:6a4:cc9:e32b with SMTP id
 4fb4d7f45d1cf-6a582b608b0mr13946214a12.9.1787582330522; Mon, 24 Aug 2026
 07:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com> <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Aug 2026 08:38:38 -0600
X-Gm-Features: AcwNN1WkCFZbvWxe4PQA8OwbQcV2Qi4oWD0S_a9VEHwbP89HadQ5rWBGiqMxI74
Message-ID: <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote:
>
> From: Shenwei Wang <shenwei.wang@nxp.com>
>
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
>
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol. For more details of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Since
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..b9b559b186af 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,34 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Contains
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>
> @@ -150,5 +178,30 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +        };

As I (and Arnaud) have stated before, I don't think this is the best
way to lay out bindings for rpmsg-gpio nodes.  I am currently thinking
about a representation that aligns better with other virtio devices.

> +      };
>      };
>  ...
> --
> 2.43.0
>
