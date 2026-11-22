Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305798;
	b=r4I17keRxTFNMMfieed9hnsbh6FAv7hKA+XWjz0gHev3vj+BPPkK9gh9+AEOID44axT4
	 tPvNU0Aj7K3WAmTw10GZBrqbs653hxwJIK2nJdY9g5GTFk84LMgBeRdLh5Kei0VRJV527
	 4nOgBS00yRFa3fhX9Ygo8I7Tte8P8KxTlTHhlIQ1RLTloHNCUmSM5xz7Ekrz5IByU4GD/
	 wCPQaK5GElKAqvIOPk4G9dD8vEP/tZBIhvF66aRS9mPc4a923VOhQwIg5bOvTmnK2BOeA
	 ywKfNhoVxm7g9E20BKWhQRZ23wc02vZhe/BGignVzAnjw3v0DOag6/Fsx5Qxd75d0KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305798;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rYwFnnQpoq8LFGaav+MzPqD+Y6qhmYWK6HkRe9C2QeM=;
	b=MXOJGGkHsh++Gu2rNkVAnhF8PuZsdEdSARvcRpoVdV+Lzbb5rmQBl5M8KeMplIkmxUJb
	 mpHISMu3XMeHgyqPGp0Amtceme8uxGnI6k4xB6M1pAxmmovAoaI+3NTAx9HjTuWz2EqYO
	 U5MXqpjvAWTsUO7DGZAST8RrWe8QBOukC3dE2KCWBCgv5Mk8Zp7P8zMhUJ51S7AAS/MTP
	 UVi8tXDaRrXLH5ixl65XAC6I9467qfzZEbou0csQ1O8ZZoTM2u9+Y6MpZdXn5c0ID7Z2G
	 IxeoznOWhy68a8LNbax8nuWGJvIVehXFhl0OHIuYRABgWiJNDXXNzFFZ0mIaLDsdsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtJ0Z3R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0A9606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VEtJ0Z3R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90F21F000E6
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 00:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305797;
	bh=rYwFnnQpoq8LFGaav+MzPqD+Y6qhmYWK6HkRe9C2QeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VEtJ0Z3RFtXNNE2efuwBF9CxDfb5B95yqKPcNQxO+t6NQf2t7QVUT+e83OzRKAMas
	 Et0FX6zr/HpTXZ5u0nCFgtAJcbM3xmt+CdbOTavu7JuGUwlLBBCzSXWSBMUHF60mot
	 W1ZNteOFWWRkKFzRoukBOv18VzqXbm1bdBQSQZ+YkPx6etZg5GiT4lxSLMQVjMSGJm
	 N93oZS9RYlL4Rhdrjy/c6vsZybDkDHQd4i/Kc7D6X/edXWGCsEA7YjMzk/e3TGl26A
	 yJFtqNMD3FGLZ8qKwWBx8sP5O3wXEbjRHI9lzpGMrneITPKqXsS1KiLBXvZ7Uf1BQ/
	 74VNAmNGVNzbg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so20767551fa.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 16:03:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHkZWTawyH0Ffl5OYriTvlAnmnBR3GWOp6AZ3E5oEF5nh2vW7gJ4s+DSpFHkzOU39Qxsf3UW+UEEG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gPrltSyJhILg6vzle/yONcbIA++7sIFOfnuSOJtKg8Mvza2+U
	ZlqEMmSPFLmuXlKe+k+1rc8w2nH95MD3LYrIUthsWsF5c09ikKkKF3UCzyc7mctbm8qIAFCFTE3
	sbhk9SSFawX+gWN1YZZHRWlejU8+fMm4=
X-Received: by 2002:a05:6512:238a:b0:5c1:4bd9:d696 with SMTP id
 2adb3069b0e04-5c1bc6803dfmr2119235e87.8.1795305796393; Sat, 21 Nov 2026
 16:03:16 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-1-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 01:03:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmd=+v0c+zZwLVafR0aFRnt95weQ=_oaOaYdHUbXktvdA@mail.gmail.com>
X-Gm-Features: Aa3M54r3uff-3u27-GWxVyER9ELrI4OraGs3jCVFrFZTcTH5Wtzi-qad91fCkZY
Message-ID: <CAD++jLmd=+v0c+zZwLVafR0aFRnt95weQ=_oaOaYdHUbXktvdA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/15] Arm Core Local Accelerator Driver
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> * Driver interaction with architectural support: I've opted to treat the =
CLA as
>   a device rather than a CPU extension, so it's implemented as a (mostly)
>   self-contained driver.

What the current proposal does is to create nodes in the base of the device
tree, which makes the device tree parser instantiate those into
platform_device:s,
then each cla_device piggy-backs that platform device.

I don't think this is a good idea, I wouldn't use platform_device for this
since you can just look up the nodes and instantiate the cla_device:s
with a proper struct device inside all of them.

I think it's a better idea to put these inside the CPU nodes themselves,
they are there after all, intuitive right? Init code can loop over the
CPUs and instantiate a cla_device for each CPU directly without
having to detour over an opaque platform_device.

Devices inside CPU nodes will not (I think??) be populated
automatically, so you can add code to loop over the CPU nodes
at device_initcall level or any time during the boot process deemed
helpful. This also saves you from adding devices for CPU cores
that are flagged with status =3D "disabled"; which could happen.

Yours,
Linus Walleij
