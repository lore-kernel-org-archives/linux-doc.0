Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62531346A01;
	Wed,  7 Jan 2026 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804397; cv=none; b=Dk6UBXVlUPT5zYcBu5jxHyZmvIXngwIIC9tUHbfEiMJtDIiTwHqU6Y2SfGbYtClunadLv1wctoUwPMbHMChZuNkp+iFFTedElpy3Yx8Z52mYpeSAU5AAyq9cW8z3PbEvO7Y4dO2E10vrHVQ+6QuidArHYU0QcsocuJiBHsBXbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804397; c=relaxed/simple;
	bh=/SBqPx/EU0Ra0r1lSHOAFbtaicp7N+NevaXS9/9ljWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0t1NwsGMlxx3s+9MjmgEub6ykpsuF1yMY5YnFpPFkmdpyfMMQuf4CadTfdLIq1S/a1hbZzAPAfHx8+UsiCnGE8/ixpqlgrTWOYyNrIH2elAb1jVrMsPYkqEuQPb/RiDNwYwrx+6fLugjq4LrnqMhMXD9aPy+979eYplSv4/4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU0dLCEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU0dLCEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF57C4CEF1;
	Wed,  7 Jan 2026 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767804396;
	bh=/SBqPx/EU0Ra0r1lSHOAFbtaicp7N+NevaXS9/9ljWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IU0dLCEPHd1+6jawwi7Fj3rHd7vW85ypZBAOnMqE/0POs39BCwIAbTYJTysYuvDue
	 AdXgdGTptCWecugylfGlJQwzAYC+GAvWer09E0Fk6VksqsGQG3JFqfXVYtI/04qlW0
	 kLdPZC1qKh2qJvmZ2rdyAF1H+cRdnFscmUnFtIe01e56EDHViefBupYBhnBrmmkM43
	 MFd8ahXv0jA8cycTcmonUJ+3Tyo4Rs+/8FUJm/rg8dg3ehSXciHBA4bJmVfVbH4+qQ
	 fLMjWoJ3iEje+GlPxhBd8Fh3J77XkpzM+MwgNd8T2Ak0yOmy6XSzJon3OHW9LmGFEe
	 6KbkGVV0EfvjQ==
Message-ID: <8a1a9ebf-a3ed-4077-aa07-48cc98e071f9@kernel.org>
Date: Wed, 7 Jan 2026 17:46:28 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: Add Bao IPC shared memory driver binding
To: joaopeixoto@osyx.tech, linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bagasdotme@gmail.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 corbet@lwn.net, dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
 devicetree@vger.kernel.org, dev@kael-k.io, gregkh@linuxfoundation.org,
 haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech,
 kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-2-joaopeixoto@osyx.tech>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260107162829.416885-2-joaopeixoto@osyx.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2026 17:28, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> This patch introduces a device tree binding for the Bao IPC Shared Memory
> device, which enables communication between Bao hypervisor guests through
> dedicated shared-memory regions.
> 
> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>

Respond to feedback instead of ignoring it. I don't see any changelog
either.

Last posting was LLM junk so I will not spend much time on this.

A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830


> ---
>  .../devicetree/bindings/bao/bao,ipcshmem.yaml | 82 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
> new file mode 100644
> index 000000000000..fa91800db99a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bao/bao,ipcshmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bao IPC Shared Memory Device

Nothing here is suitable for bindings, really. Simplified node for
establishing channel of communication to hypervisor would be allowed.
But multiple devices for that? No point. Develop proper interface with
your hypervisor for all this.

> +
> +maintainers:
> +  - José Martins <jose@osyx.tech>
> +  - David Cerdeira <davidmcerdeira@osyx.tech>
> +  - João Peixoto <joaopeixoto@osyx.tech>
> +
> +description: |
> +  Shared memory based communication device for Bao hypervisor guests.
> +
> +  The device describes a set of shared-memory regions used for
> +  communication between Bao guests. Each guest instantiating this
> +  device uses one region for reading data produced by a peer guest
> +  and another region for writing data consumed by that peer.
> +
> +properties:
> +  compatible:
> +    const: bao,ipcshmem
> +
> +  reg:
> +    description:
> +      Shared memory region used for IPC.
> +    minItems: 2
> +    maxItems: 2

Look at other bindings.

> +
> +  read-channel:
> +    description: |
> +      Shared-memory sub-region that this guest reads from.
> +
> +      This region is written by the peer Bao guest and read by the
> +      guest instantiating this device.
> +
> +      Consists of two cells:
> +        - offset into the shared-memory region defined by `reg`
> +        - size in bytes
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2

Drop property, reg defines it.

> +
> +  write-channel:

Drop property, reg defines it.


> +    description: |
> +      Shared-memory sub-region that this guest writes to.
> +
> +      This region is written by the guest instantiating this device and
> +      read by the peer Bao guest.
> +
> +      Consists of two cells:
> +        - offset into the shared-memory region defined by `reg`
> +        - size in bytes
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2


> +
> +  id:
> +    description:
> +      Driver instance ID.
> +    $ref: /schemas/types.yaml#/definitions/uint32

NAK, not allowed. Read writing bindings.


> +
> +required:
> +  - compatible
> +  - reg
> +  - read-channel
> +  - write-channel
> +  - id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    bao-ipc@f0000000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +        compatible = "bao,ipcshmem";
> +        reg = <0x0 0xf0000000 0x0 0x00010000>;
> +        read-channel = <0x0 0x2000>;
> +        write-channel = <0x2000 0x2000>;
> +        id = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index c7591b2aec2a..c047fbd6b91a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -223,6 +223,8 @@ patternProperties:
>      description: Shenzhen AZW Technology Co., Ltd.
>    "^baikal,.*":
>      description: BAIKAL ELECTRONICS, JSC
> +  "^bao,.*":
> +    description: Bao Hypervisor

Vendor prefixes are for companies. What is the company here? What is
stock ticker or website?


>    "^bananapi,.*":
>      description: BIPAI KEJI LIMITED
>    "^beacon,.*":


Best regards,
Krzysztof
