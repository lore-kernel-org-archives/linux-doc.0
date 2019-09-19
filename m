Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB8597D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Sep 2019 06:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388379AbfISGwH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Sep 2019 02:52:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:41194 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388141AbfISGwH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Sep 2019 02:52:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D2054B633;
        Thu, 19 Sep 2019 06:52:04 +0000 (UTC)
Subject: Re: [PATCH 01/11] drm/vram: Add struct drm_vram_buffer to VRAM
 helpers
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, sam@ravnborg.org
References: <20190918142307.27127-1-tzimmermann@suse.de>
 <20190918142307.27127-2-tzimmermann@suse.de>
 <20190919055833.nswf244h3wjq5e6v@sirius.home.kraxel.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <cdf0cb86-c913-66d0-0f73-dedc47b111f5@suse.de>
Date:   Thu, 19 Sep 2019 08:51:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919055833.nswf244h3wjq5e6v@sirius.home.kraxel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tHEfDVazBhh9zwPW2nhmyXrLM0moz5zhR"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tHEfDVazBhh9zwPW2nhmyXrLM0moz5zhR
Content-Type: multipart/mixed; boundary="vovViMIt58rjqd8pyKBIX3a1pJ106Gtqg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: corbet@lwn.net, airlied@linux.ie, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sam@ravnborg.org
Message-ID: <cdf0cb86-c913-66d0-0f73-dedc47b111f5@suse.de>
Subject: Re: [PATCH 01/11] drm/vram: Add struct drm_vram_buffer to VRAM
 helpers
References: <20190918142307.27127-1-tzimmermann@suse.de>
 <20190918142307.27127-2-tzimmermann@suse.de>
 <20190919055833.nswf244h3wjq5e6v@sirius.home.kraxel.org>
In-Reply-To: <20190919055833.nswf244h3wjq5e6v@sirius.home.kraxel.org>

--vovViMIt58rjqd8pyKBIX3a1pJ106Gtqg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 19.09.19 um 07:58 schrieb Gerd Hoffmann:
> On Wed, Sep 18, 2019 at 04:22:57PM +0200, Thomas Zimmermann wrote:
>> Drivers with dedicated video memory occasionally need to reserve a mem=
ory
>> area for a specific purpose, such as cursor images or sprites. Using G=
EM
>> VRAM buffer objects can be problematic. For small buffers, GEM VRAM bu=
ffer
>> objects are inefficient as they are aligned to page boundaries.
>=20
> I would still allocate gem objects for that.  Then use them as pool
> instead of using them directly.
>=20
> Not sure this is worth the trouble just for the cursors though as they
> are big enough that page-sized allocations don't waste memory.
>=20
>> And they cannot easily be placed at specific memory offsets. This can
>> lead to memory fragmentation and is a problem for hardware with only a=

>> small amount of memory.
>=20
> Note that there is a flag to change the allocation strategy
> (TTM_PL_FLAG_TOPDOWN).  You could allocate the cursor objects
> with the flag set.  Should be good enough to avoid fragmentation.
>=20
> I have a patch doing exactly that for qxl, for the same reason:
> https://git.kraxel.org/cgit/linux/commit/?id=3De00e913a64c6fba9630b311f=
8bc71bd7c9842479
> (no, that patch wasn't sent to the list yet).
>=20
> We could do the same for vram and either let the driver explicitly ask
> for top-down allocation, or use some threshold like the qxl patch.
>=20
> So, I'm not convinced we actually need the drm_vram_buffer
> infrastructure.

Well, OK. I don't mind using GEM buffers if they can solve the problem.
Half of the patch set is unrelated to VRAM buffers anyway.

Best regards
Thomas

>=20
> cheers,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--vovViMIt58rjqd8pyKBIX3a1pJ106Gtqg--

--tHEfDVazBhh9zwPW2nhmyXrLM0moz5zhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2DJZMACgkQaA3BHVML
eiPjwAgAlSupAfWDKmsopUWAr0iHQS75s7d26+I/B2R0Ryp0NigRkOiQGreg+n2n
kEwbsyiLOaoRLixH2RAEhwqa2NrTfkteOTwiSBE9bhwEvdagjk16K00EhP2IYOpX
o2VCM3FAMlV3EEcHcFVFbCmhoyOC0G9FP8OE/DCV679sZywnO5jGeViv/4BsLbWs
5fb9Yvr/vz8ERfF27fP3kjpSwd2EVsEVdyOyYoHTCEGugfFPVNMUWGKuRr1iB/OB
oGWDbr7yYELtlpKh49XjFrVgWQqDD5ssom0mBpOrsvnQPEYkPMtBNfMxCm/kpseY
8KVwckqhITalwm3tEE5VL+EkHRNRqQ==
=L9IT
-----END PGP SIGNATURE-----

--tHEfDVazBhh9zwPW2nhmyXrLM0moz5zhR--
