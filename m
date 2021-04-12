Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4B8C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 10:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 822DB61249
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 10:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239482AbhDLK47 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Apr 2021 06:56:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:50258 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239267AbhDLK47 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 06:56:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8490DAEFE;
        Mon, 12 Apr 2021 10:56:40 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture
 ownership
To:     Jani Nikula <jani.nikula@linux.intel.com>, airlied@linux.ie,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, corbet@lwn.net
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20210412090021.23054-1-tzimmermann@suse.de>
 <20210412090021.23054-2-tzimmermann@suse.de> <87mtu3kfo3.fsf@intel.com>
 <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de> <87k0p7kcos.fsf@intel.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <36d7fee5-274e-6e54-cfc9-e2e0ff109599@suse.de>
Date:   Mon, 12 Apr 2021 12:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87k0p7kcos.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0pYDG6RDJnAwNJsNIquHsK23hSzyIKyvb"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0pYDG6RDJnAwNJsNIquHsK23hSzyIKyvb
Content-Type: multipart/mixed; boundary="iAwSyjVwjCP9nPBYfD3C5AHHL4JHBzURm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 corbet@lwn.net
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Message-ID: <36d7fee5-274e-6e54-cfc9-e2e0ff109599@suse.de>
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture
 ownership
References: <20210412090021.23054-1-tzimmermann@suse.de>
 <20210412090021.23054-2-tzimmermann@suse.de> <87mtu3kfo3.fsf@intel.com>
 <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de> <87k0p7kcos.fsf@intel.com>
In-Reply-To: <87k0p7kcos.fsf@intel.com>

--iAwSyjVwjCP9nPBYfD3C5AHHL4JHBzURm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.04.21 um 12:41 schrieb Jani Nikula:
> On Mon, 12 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 12.04.21 um 11:36 schrieb Jani Nikula:
>>> Please test the documentation build before applying.
>>
>> I did and I'm pretty sure it looked correct. But I'll double check.
>=20
> Cool, maybe someone added more smarts to kernel-doc. :)

I rebuilt the htmldocs and found a bug in the patchset's documentation,=20
but the output is correctly indented. However tabs are converted to 8=20
spaces, so copying it into source files results in whitespace errors.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--iAwSyjVwjCP9nPBYfD3C5AHHL4JHBzURm--

--0pYDG6RDJnAwNJsNIquHsK23hSzyIKyvb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0J2cFAwAAAAAACgkQlh/E3EQov+AQ
Mg//W6Qa45/jwvctCduk12wg4kFks7bebKamlOcdNG35oMtaQAEio23I+pWw2oQFIyxep2JmQPSP
R8yxug77nbfNbOp17nQ53ea6zQgXG1HsHkMjJ8aOV3D7eHPWNBCRuNMvoz0HoHHq8vTHdRnmrEEJ
+i4MTCwakRwL/MRz/6j0pUVp1JO6Pbb+0LPVii48TVibws5Y9eJ8PuE/DQPgt4osXW29QGiN2doz
curOzr+aS0WgfV1MxCtA7AbCccE+gxyiHkPCrLnka3sg1yRpcIn7D7w+v7YmxjlFb3/I+yc44C/L
QCPNtxYLzXZ7h27WtJeDgW1G6mhQL8kGlOiTUwiJ81afO8F2LVXhfSBxeWrPZF68Vkg+vdRFErBj
ieSljJXWnzyy5pB7R0XE3N1JOWVE2zJHESbt7RBZFROCVwXN0SdIwJCktyoMidL7bUf9bM52teAl
Wo2ESH/vwTW4FHo1uT8SGhJa4ppdWW5sKktRMihV5X+cwH+OdUcCsarKNseh2IhJYI4KP7nbYJl/
A2xsVwXLrP09W05y/TYh/x8GWIxzEi5Z2XqxHNumMMNwne4HZ69pJOxBxQi2r5Uy9BKOEKAm+fbX
iYU03Mv5JBjto7SO1LA+954KJtaLIPXCEvBzSq/9ZMPi7u6nESgrK3EfbPk1fgiv66uPx/zFQYxv
4E8=
=oAG5
-----END PGP SIGNATURE-----

--0pYDG6RDJnAwNJsNIquHsK23hSzyIKyvb--
