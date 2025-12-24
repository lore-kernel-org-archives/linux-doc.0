Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27CD145A1F;
	Wed, 24 Dec 2025 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766593100; cv=none; b=n38f2BijXjY8I5xpIy5R1ih1J6HMP6LVQFEEoyg03NlSem/QyyCt8SlLgIABfoNRRbBDMCRfB3vOYMCiLAYqNgGAf4WFY/Ptp2BTMLVFei4o00n2z+VmCujrS70TKhiCklwxfNqgxMZ/P0aG34DC/mvCtH4Cq7ReqyFft/paqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766593100; c=relaxed/simple;
	bh=iMXkABTtT2jUhTkS7ZjEcPSXT6V0xsOrCKrSf5gKHPw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FZU4ix5zZwg3DBjWf+PFIoqh5HCZJxCUICC8NQouyXJPv2HvmdjIEYzpzber1HISA+ttsh+LEf+SX0rxmrYP9P1KLZ8nNXKGk1QToLYLIKrlJ/B9K9icLRimp8zwgXRyrD3Ji4ipYv198NZliUr0bOp9dhy7AmHVtcRFW+H+pak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D05z/P4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D05z/P4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61406C4CEFB;
	Wed, 24 Dec 2025 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766593098;
	bh=iMXkABTtT2jUhTkS7ZjEcPSXT6V0xsOrCKrSf5gKHPw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D05z/P4QjZ7p4TL5L15ojXlcWgzhV1Gi/+Eo7Ufub27W7j34IDH06EmosV417zLWj
	 1ezFaVtg/V4eCjwHulpzhOV0evhWSpGqsd/myV66ya5pHJgkNpIMtGQKHqRXugnkF7
	 iBnC9GZFZXIEwg/+CkBMTiZPiIYGlGwe+cYiRd7s5Gww+0pX5FxfpvNube1wLW4kmD
	 0lbjjE3Hpgxv6aflGPeOsMlVMrFPy+f9X1EFGsXJJJ9/Dmw5hVXteYEdgoNSapPt7o
	 CEEf7DKnDFuhiye+PcbPoDELep/hpMRqxSbSYHPgB5ib7OLYrTUYtKo+20WC3FoioJ
	 tHIirx3VMMmcg==
Date: Wed, 24 Dec 2025 10:18:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: will@kernel.org, linux-kernel@vger.kernel.org, bagasdotme@gmail.com, 
 maddy@linux.ibm.com, krzk+dt@kernel.org, alex@ghiti.fr, conor+dt@kernel.org, 
 haren@linux.ibm.com, dan.j.williams@intel.com, jose@osyx.tech, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, 
 linux-arm-kernel@lists.infradead.org, nathan@kernel.org, pjw@kernel.org, 
 linux-riscv@lists.infradead.org, catalin.marinas@arm.com, heiko@sntech.de, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, dev@kael-k.io, 
 linux@armlinux.org.uk, neil.armstrong@linaro.org, kever.yang@rock-chips.com, 
 corbet@lwn.net, ajd@linux.ibm.com, aou@eecs.berkeley.edu, 
 davidmcerdeira@osyx.tech, palmer@dabbelt.com, mani@kernel.org, 
 linux-doc@vger.kernel.org
To: joaopeixoto@osyx.tech
In-Reply-To: <20251224135217.25350-2-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-2-joaopeixoto@osyx.tech>
Message-Id: <176659309602.2305345.1814998732546100865.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver
 binding


On Wed, 24 Dec 2025 13:52:13 +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> This patch adds a Device Tree binding for the Bao IPC shared memory
> device, which provides a standardized description of the hardware
> interface used for inter-VM communication in Bao-based systems.
> 
> The binding documents the following properties:
> 
>   - compatible: "bao,ipcshmem"
>   - reg: Memory region for the shared memory device
>   - id: Unique device identifier
>   - read-channel: [offset, size] for reading from the shared memory
>   - write-channel: [offset, size] for writing to the shared memory
>   - interrupts: Interrupts used by the device
> 
> This enables kernel drivers and userspace tools to correctly
> instantiate and configure Bao IPC shared memory devices based
> on the DT description, facilitating efficient communication
> between VMs.
> 
> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  .../devicetree/bindings/bao/ipcshmem.yaml     | 99 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/ipcshmem.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251224135217.25350-2-joaopeixoto@osyx.tech

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

