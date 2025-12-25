Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F7623EABA;
	Thu, 25 Dec 2025 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766653132; cv=none; b=o6Tm7hk9dVzECvi+TSi83z0kAs5J642wU0y/LQry82mWpZQQwBynM/MkodJ5rRYT3h1dC1RKS9331DK+xdlRiKViNhJ1rwK8+4takrEBxu3msJwHYaBu9wi53oEULy7gZJy4zVlZTKLJWlWLNMYjtm9JkXO0bKXn/tsPpp4fjdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766653132; c=relaxed/simple;
	bh=/A+yXLh20ez+7i2+8SVOqk3ST9vTqSm2NSu9yEp1zd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2l57sfnBxswH4eD3GHBj+h4LfMAFDca/9CRKOkWy57DmUCXQlbx1u/wejwHHbaAdWMIhUQff2CE1pwHHOY0ls1obhrGAi6g503D0mOUGpScJEf3W5Cpnl+KHgOzh9eRv0zM1c5sGmI1WnhYe7/2QBtVyZfXn2NjLG4QX91kMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+V87cK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+V87cK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C857C4CEF1;
	Thu, 25 Dec 2025 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653132;
	bh=/A+yXLh20ez+7i2+8SVOqk3ST9vTqSm2NSu9yEp1zd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+V87cK7bn9U79Nf0tAGfZtyUU2140czUzXeGJE360fE7oeh6bd5wMGmqdgrabXyJ
	 R6Z6Ulpatmeh6LKAtKpLURsgpfUUzK5oRG6cU2xPYbnsKA/Tx6JHFg0OTp7NDVYHox
	 Frb3L8IJ7KT7ehj9sbtAWuIGh3+7RQ5vwlQ0e9GRDy7HmBdkm3r/buf5VZSdZZPJJe
	 sXI7Ti7aKe/HoAZBfRT3/PzIVfGacfFjggYBVQhydk7iyOzLqHKJZYBZojYstMH6DX
	 Z4pBE1F2watS2QaCZ7ZeDq7yEMPqFs+0v7cXoL9DgUjnAoL99STy3VqXtwiT2a5X1M
	 V/JGXSpM34cFA==
Date: Thu, 25 Dec 2025 09:58:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
Message-ID: <20251225-modest-faithful-mouflon-1c7d63@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-4-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224135217.25350-4-joaopeixoto@osyx.tech>

On Wed, Dec 24, 2025 at 01:52:15PM +0000, joaopeixoto@osyx.tech wrote:
> From: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
>=20
> This patch adds a Device Tree binding for the Bao I/O Dispatcher kernel
> module, which can be loaded into backend VMs. The I/O Dispatcher
> provides the bridge between the Bao hypervisor Remote I/O system and the
> frontend device model in userspace, offering a unified API to support
> various VirtIO backends.
>=20
> The dispatcher handles hypercalls to the Bao hypervisor, IRQ/eventfd
> forwarding, and provides a character device interface for frontend
> devices, enabling efficient communication between the hypervisor and
> userspace device models.
>=20
> The binding documents the following properties:
>   - compatible: "bao,io-dispatcher"
>   - reg: Memory regions for the dispatcher (multiple VirtIO devices)
>   - interrupts: Interrupts used by the devices
>   - interrupt-parent: Parent interrupt controller
>=20
> This enables kernel drivers to correctly instantiate and configure Bao
> I/O Dispatcher modules based on the DT description.
>=20
> Signed-off-by: Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> ---
>  .../bindings/bao/io-dispatcher.yaml           | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/io-dispatcher.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/bao/io-dispatcher.yaml b/D=
ocumentation/devicetree/bindings/bao/io-dispatcher.yaml
> new file mode 100644
> index 000000000000..7795f55d3ff9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bao/io-dispatcher.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/bao/io-dispatcher.yaml#"

You did not even bother to test it.

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Bao I/O Dispatcher Device
> +
> +maintainers:
> +  - Jo=C3=A3o Peixoto <joaopeixoto@osyx.tech>
> +  - Jos=C3=A9 Martins <jose@osyx.tech>
> +  - David Cerdeira <davidmcerdeira@osyx.tech>
> +
> +description: |
> +  I/O Dispatcher device for Bao hypervisor guests. Handles multiple Virt=
IO
> +  backend devices and their interrupts.
> +
> +properties:
> +  compatible:
> +    const: "bao,io-dispatcher"
> +    description: Device compatible string.
> +
> +  reg:
> +    description: |
> +      Memory regions for each VirtIO backend device.
> +    maxItems: 20
> +    type: array
> +    items:
> +      type: integer

Don't send us LLM junk. You cannot come with such syntax, it does
not exist. Sending such LLM output is disregard to our time.

NAK


Best regards,
Krzysztof

