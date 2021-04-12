Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B6FC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 10:31:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D78C06134F
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 10:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238970AbhDLKbw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Apr 2021 06:31:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:55520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239266AbhDLKbv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 06:31:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 65F37AFE6;
        Mon, 12 Apr 2021 10:31:32 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture
 ownership
To:     Jani Nikula <jani.nikula@linux.intel.com>, airlied@linux.ie,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, corbet@lwn.net
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20210412090021.23054-1-tzimmermann@suse.de>
 <20210412090021.23054-2-tzimmermann@suse.de> <87mtu3kfo3.fsf@intel.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de>
Date:   Mon, 12 Apr 2021 12:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87mtu3kfo3.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3rMFD6xSR3XnkrwKVERWi2cOLJupv54PO"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3rMFD6xSR3XnkrwKVERWi2cOLJupv54PO
Content-Type: multipart/mixed; boundary="E111peNYnhDxvplny6GPHu4T76mhCid1o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 corbet@lwn.net
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Message-ID: <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de>
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture
 ownership
References: <20210412090021.23054-1-tzimmermann@suse.de>
 <20210412090021.23054-2-tzimmermann@suse.de> <87mtu3kfo3.fsf@intel.com>
In-Reply-To: <87mtu3kfo3.fsf@intel.com>

--E111peNYnhDxvplny6GPHu4T76mhCid1o
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.04.21 um 11:36 schrieb Jani Nikula:
> On Mon, 12 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> + * DRM drivers should call drm_aperture_remove_conflicting_framebuffe=
rs()
>> + * at the top of their probe function. The function removes any gener=
ic
>> + * driver that is currently associated with the given framebuffer mem=
ory.
>> + * If the framebuffer is located at PCI BAR 0, the rsp code looks as =
in the
>> + * example given below.
>> + *
>> + * .. code-block:: c
>> + *
>> + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
>> + *	{
>> + *		bool primary =3D false;
>> + *		resource_size_t base, size;
>> + *		int ret;
>> + *
>> + *		base =3D pci_resource_start(pdev, 0);
>> + *		size =3D pci_resource_len(pdev, 0);
>> + *	#ifdef CONFIG_X86
>> + *		primary =3D pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_R=
OM_SHADOW;
>> + *	#endif
>> + *
>> + *		return drm_aperture_remove_conflicting_framebuffers(base, size, p=
rimary,
>> + *		                                                    "example driv=
er");
>> + *	}
>> + *
>> + *	static int probe(struct pci_dev *pdev)
>> + *	{
>> + *		int ret;
>> + *
>> + *		// Remove any generic drivers...
>> + *		ret =3D remove_conflicting_framebuffers(pdev);
>> + *		if (ret)
>> + *			return ret;
>> + *
>> + *		// ... and initialize the hardware.
>> + *		...
>> + *
>> + *		drm_dev_register();
>> + *
>> + *		return 0;
>> + *	}
>=20
> I'm guessing you can't use tabs for the first indentation level
> here. IIRC kernel-doc removes the leading comment marker and one
> whitespace whether it's space or tab, resulting in rst where the
> code-block contents are only partially indented.
>=20
> Please test the documentation build before applying.

I did and I'm pretty sure it looked correct. But I'll double check.

>=20
> Otherwise, the series seems like a nice cleanup.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks.

Best regards
Thomas

>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--E111peNYnhDxvplny6GPHu4T76mhCid1o--

--3rMFD6xSR3XnkrwKVERWi2cOLJupv54PO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0IYMFAwAAAAAACgkQlh/E3EQov+C1
6g//cnxpgye8JoABShTgIx68I43/feliYp54yfl5l+C9cwwSpaxWpeuQFWZ3/jJ09oMe+0UfEga5
8QtSNdZMhHhk0fmp8XCiit0EuIA+EwqYP+yHLhQYFExaa85eJI4PgVI21ttL0DoB+9fR/bv0iEK8
MGOukFMEVBVLC6U3+llzS9bOsNHoma9s/sE3HOK/mqjX4QuVI+O7YWm8KV1nmhzC+AueHFYYywHM
VfGZ82N+qlr3tEcuiUdnyYI0bLM6HBE32+MWPEx8TzEv6r/iNBQkcXynU48MHMpl76GCWwotNynh
cRdIpterX+1E4y8WBC9101Sv+GAEA++ktl/GiQluDgQb6z+MfdpVesyTDkdJtf8AY9+ZnKXA56T2
WQr8a/evAZR3u0/ElH7lZVgriyWexvs3bIzZoTQ+r90/cA7w9lb2TKfhUhoCo6LYUAk3QefrMjS4
0wlJC5L0mhWDIpRBrXxuTzM/k5zkVr7WK618g5FVSqN6W/piMLJv8o0M8Shj0JXjXlLEvpp7rtlz
K7nvnYGrClKAAMWjf1HtYoku4/hoo0BoAuQxAB0578BeKu7dNe7N92J5lQDRfaj/tk7Cf3QRn+dH
gPSadzObM2N4S/a/Z2y0Hfpjtm8GUYloq4MIQpAnEGMG0Adg+XXm5cLdCuNRJ5s945nLwSDTtysQ
Jcg=
=MZBj
-----END PGP SIGNATURE-----

--3rMFD6xSR3XnkrwKVERWi2cOLJupv54PO--
