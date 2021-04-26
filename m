Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80F6C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 12:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7405A6109E
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 12:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDZMSt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:18:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:53800 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231550AbhDZMSt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Apr 2021 08:18:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 06774AAC2;
        Mon, 26 Apr 2021 12:18:07 +0000 (UTC)
To:     Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        virtualization@lists.linux-foundation.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sam Ravnborg <sam@ravnborg.org>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <86308b36-57ec-a796-90c1-e4349e914823@suse.de>
Date:   Mon, 26 Apr 2021 14:18:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lBuP66u9y4XjZkJNHdNatNsdpuWhHd6se"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lBuP66u9y4XjZkJNHdNatNsdpuWhHd6se
Content-Type: multipart/mixed; boundary="V0T90OAKdCCCeuCZ7w2gMsS6W7UBMI5xV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg KH <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <86308b36-57ec-a796-90c1-e4349e914823@suse.de>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
In-Reply-To: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>

--V0T90OAKdCCCeuCZ7w2gMsS6W7UBMI5xV
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.04.21 um 10:46 schrieb Daniel Vetter:
> On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
>> Hi Thomas,
>>
>> On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>> This patchset adds support for simple-framebuffer platform devices an=
d
>>> a handover mechanism for native drivers to take-over control of the
>>> hardware.
>>>
>>> The new driver, called simpledrm, binds to a simple-frambuffer platfo=
rm
>>> device. The kernel's boot code creates such devices for firmware-prov=
ided
>>> framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or bo=
ot
>>> loader sets up the framebuffers. Description via device tree is also =
an
>>> option.
>>
>> I guess this can be used as a replacement for offb, too...
>>
>>> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM hel=
pers
>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. Du=
ring
>>
>> .... if support for 8-bit frame buffers would be added?

Offb doesn't seem to be tied to the simple-framebuffer support. So=20
adding a new driver or extending the simple-framebuffer code would be=20
required. Not a big deal, though. Patch 3 of this patchset adds the=20
ability to create generic drivers within DRM.

>=20
> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former=

> shouldn't be a big thing, but the latter is only really supported by th=
e
> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> works, and we keep that illusion up by emulating it in kernel for hw wh=
ich
> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> best. The uapis are all there for setting the palette, and C8 is a defi=
ned
> format even with atomic kms interface, but really there's not much
> userspace for it. In other words, it would work as well as current offb=

> would, but that's at least that.

I think we can just use a shadow palette in the drm driver: If the drm=20
framebuffer is in C8, use the userspace's palette. If the drm=20
framebuffer is in XRGB, use a palette that represents RGB332. The driver =

would do on-the-fly conversion; just like cirrus does.

Best regards
Thomas

> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--V0T90OAKdCCCeuCZ7w2gMsS6W7UBMI5xV--

--lBuP66u9y4XjZkJNHdNatNsdpuWhHd6se
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCGr30FAwAAAAAACgkQlh/E3EQov+Cr
DA//Sx7ui9rpLZrPjInOfeQNs5CuN7Mfjm+qaTu0vtwwp7G/+91vczboJ/wIVoLEgso2U5Sudpk9
+IliCPmPBFdfk6+zQ0chMyMl4YSrpTvgu4nIZTRljRH0Fcscv0aSU67oXxEhar/o5augSEFabmMw
SGu+uc4lrTYw0EuP7IO6oK7OY2AwF/eYbYhrhN17Sz7ftEeVKCr8WAGvtFHFFef+6qEKQy4Z2CZx
hVnAcCHp3nhLqD8tnl50qTkqog0CNhUwNcnVYZWU4jNnppidVVjnHwuElfgyJ2LX9E+mHX7LWZj9
+4X1b/q7y7ltgHQLBVxnLrJk6RN5Ek3Rxbam6CsaC/9drg+2M7ut9K2UZRGsd3Z5uo9uTGmQimTG
D8RgglwYn9Q3IxY7TdixyI+imA8yoxTPOn1ZjACeJOzMBSzOkn95JPTiaJvmFTq1mqZzFaWIhKEf
ngJNIf7zmZqkgN63HP6V7GJvqOYgwOFd4qZDAc8LNXjkm4o43HiuUJu7VepMLdPwVzrMpaqXq64W
DqsZVkVrjuQmqFwNvmBMpnA/XwpfDuIxDUrpcwEP3WoC+4lSStc9Ekd1/SxOY/M2CZdb9adgdyio
QkLRiHA2kdja4yVhWBbSMJMs5cdR0QHmqUcDiseb5iJ/oWRENeN5e7lwWhtS7UtCmS8f22uFfXk1
66I=
=YuuR
-----END PGP SIGNATURE-----

--lBuP66u9y4XjZkJNHdNatNsdpuWhHd6se--
