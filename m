Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5504C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 10:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A212A61453
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 10:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbhD2KY5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 06:24:57 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46289 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232261AbhD2KY4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Apr 2021 06:24:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5635258070C;
        Thu, 29 Apr 2021 06:24:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 29 Apr 2021 06:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=P1tHtAumMNzRrOcUKlfsNb4TJuL
        JKNW+cXvT2BmQNvQ=; b=fVRRh+0xm0TsXNl1F5HX8xq7QHBOTVB3hWpKGJR4RTa
        x2VpgZI08sO78iPB3FkVScNwQhHl9wb74zj17knU9bNCDpt90sTMarXburlj+VCn
        NC05NW8RfanKJfXUqK7wMz2eH1Dk7UQCwSNZzam4o04KaQIOeZdjcG5x6YDOf/J1
        wz+By1b7Ilt7cE12DGWsXSmgHJNLvLQ31INoqr4vFrGt1wMc9TBTrkmSuVf5hH/1
        yiz8mxYBEjD60md4MBUZuOwZO9Ier5eO4ejpVL9ef+hGZKqMqQRYWTOK5/kDolyh
        6a4kKxVpxGA+qKxKjlq/pEm8g96bjBkpa0X+cdYAvag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P1tHtA
        umMNzRrOcUKlfsNb4TJuLJKNW+cXvT2BmQNvQ=; b=H1KU5hSxRHIeG/qIyYVOJN
        QHw2A9kqsNX6zbJZf+UT8ZcU5T7rMqLEtuTqPVEKbs3ejD+equQ/aDLba/9efU67
        AwnLHh6HG7umyU1tBbTo97Uh7Jxi74Uy2BKHok3z3axC4aCyCsdpX+3Ib1F8SfEm
        BoCpSaZ0eH44/iJczUwccySE426LgT4BlW3HnCY4PIdJJIhde/sy9++/Cuuawxce
        fg0F/Oa9pTCGD/vuoEzMtPENTNX3/m1/cPxyf4kOA5sV3urw6gyR2LMUG/wW4xlC
        2d1s3RcqrErAP8ZsHrD52jSFjWAd+XDHGqrXtv5TNlYrnYgzPyTwLT+gNhxVgbpg
        ==
X-ME-Sender: <xms:R4mKYDMkgd-og-Z9b5gJJfxABb2s61Sp_MmchNyKepmqHyr5iZBwWg>
    <xme:R4mKYN9XfBET7fA-QODO7Z6lSiWcmk-eWQfbvUBzaEEJ1FaMIHgMOVm88QLjPejb5
    bpZRqwGFo8b_ZbupmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R4mKYCQc2IPo89K8ayH_A1hImoS83LwnMiY5IOdwotzvEJbUU9vrMw>
    <xmx:R4mKYHu_X7rlhgfsi5h_eV_amP7H1zmq8Gx05j0BTP_z8fjguvQTcg>
    <xmx:R4mKYLfNdMzyFkvOnLO5JKllJJRdPVMt9qZoKhkif6LNblOw9JmSrA>
    <xmx:SomKYD-kgGoWqehtdQNXwXcp9AvMoAAX6Mq_PFUUECqBZzOFM3R0Mw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Thu, 29 Apr 2021 06:24:06 -0400 (EDT)
Date:   Thu, 29 Apr 2021 12:24:03 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, kraxel@redhat.com,
        corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
        sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
        geert+renesas@glider.be, hdegoede@redhat.com,
        bluescreen_avenger@verizon.net, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <20210429102403.drx4dn6mq2fo467y@gilmour>
References: <20210416090048.11492-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zk3aewz3ezwumkde"
Content-Disposition: inline
In-Reply-To: <20210416090048.11492-1-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--zk3aewz3ezwumkde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 11:00:39AM +0200, Thomas Zimmermann wrote:
> This patchset adds support for simple-framebuffer platform devices and
> a handover mechanism for native drivers to take-over control of the
> hardware.
>=20
> The new driver, called simpledrm, binds to a simple-frambuffer platform
> device. The kernel's boot code creates such devices for firmware-provided
> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> loader sets up the framebuffers. Description via device tree is also an
> option.
>=20
> Simpledrm is small enough to be linked into the kernel. The driver's main
> purpose is to provide graphical output during the early phases of the boot
> process, before the native DRM drivers are available. Native drivers are
> typically loaded from an initrd ram disk. Occationally simpledrm can also
> serve as interim solution on graphics hardware without native DRM driver.
>=20
> So far distributions rely on fbdev drivers, such as efifb, vesafb or
> simplefb, for early-boot graphical output. However fbdev is deprecated and
> the drivers do not provide DRM interfaces for modern userspace.
>=20
> Patches 1 and 2 prepare the DRM format helpers for simpledrm.
>=20
> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> pageflips, SHMEM buffers are copied into the framebuffer memory, similar
> to cirrus or mgag200. The code in patches 7 and 8 handles clocks and
> regulators. It's based on the simplefb drivers, but has been modified for
> DRM.
>=20
> Patches 3 and 9 add a hand-over mechanism. Simpledrm acquires it's
> framebuffer's I/O-memory range and can be hot-unplugged by a native drive=
r.
> The native driver will remove simpledrm before taking over the hardware.
> The removal is integrated into existing helpers, so existing drivers use
> it automatically.
>=20
> I've also been working on fastboot support (i.e., flicker-free booting).
> This requires state-readout from simpledrm via generic interfaces, as
> outlined in [1]. I do have some prototype code, but it will take a while
> to get this ready. Simpledrm will then support it.
>=20
> I've tested simpledrm with x86 EFI and VESA framebuffers, which both work
> reliably. The fbdev console and Weston work automatically. Xorg requires
> manual configuration of the device. Xorgs current modesetting driver does
> not work with both, platform and PCI device, for the same physical
> hardware. Once configured, X11 works. I looked into X11, but couldn't see
> an easy way of fixing the problem. With the push towards Wayland+Xwayland
> I expect the problem to become a non-issue soon. Additional testing has
> been reported at [2].
>=20
> One cosmetical issue is that simpledrm's device file is card0 and the
> native driver's device file is card1. After simpledrm has been kicked out,
> only card1 is left. This does not seem to be a practical problem however.

Provided that patches 4 to 8 are squashed when merged:
Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--zk3aewz3ezwumkde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIqJQwAKCRDj7w1vZxhR
xQzoAQC8aVGeco8B3vVcrClE5+BRGEZhSjYhCqQzwZFL66BzVQD6AiYFjV583wuE
hdWrQ/KlJmCogKhnvMo5oLJUQ1zzdQo=
=6fHR
-----END PGP SIGNATURE-----

--zk3aewz3ezwumkde--
