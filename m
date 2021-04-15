Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD40C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 07:31:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 560096124B
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 07:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhDOHb1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 03:31:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:34262 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230481AbhDOHb0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 03:31:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F2240B035;
        Thu, 15 Apr 2021 07:31:02 +0000 (UTC)
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device
 node
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, kraxel@redhat.com,
        corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
        sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
        geert+renesas@glider.be, hdegoede@redhat.com,
        bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
Date:   Thu, 15 Apr 2021 09:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek
Content-Type: multipart/mixed; boundary="0wv6kulGO214cTfq6f1JKjyueQv6191wM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com, broonie@kernel.org,
 sam@ravnborg.org, robh@kernel.org, emil.l.velikov@gmail.com,
 geert+renesas@glider.be, hdegoede@redhat.com,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device
 node
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
In-Reply-To: <20210408081353.ojt2kgnnbh6kp6gp@gilmour>

--0wv6kulGO214cTfq6f1JKjyueQv6191wM
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.04.21 um 10:13 schrieb Maxime Ripard:
> Hi,
>=20
> On Thu, Mar 18, 2021 at 11:29:19AM +0100, Thomas Zimmermann wrote:
>> Make sure required hardware clocks are enabled while the firmware
>> framebuffer is in use.
>>
>> The basic code has been taken from the simplefb driver and adapted
>> to DRM. Clocks are released automatically via devres helpers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
>=20
> Even though it's definitely simpler to review, merging the driver first=

> and then the clocks and regulators will break bisection on the platform=
s
> that rely on them

I'd like to keep the patches separate for now, but can squash patches 6=20
to 8 them into one before pushing them. OK?

>=20
> Another thing worth considering is also that both drivers will probe if=

> they are enabled (which is pretty likely), which is not great :)
>=20
> I guess we should make them mutually exclusive through Kconfig

We already have several drivers in fbdev and DRM that handle the same=20
hardware. We don't do this for any other pair, why bother now?

Best regards
Thomas

>=20
> Maxime
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--0wv6kulGO214cTfq6f1JKjyueQv6191wM--

--SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB367UFAwAAAAAACgkQlh/E3EQov+CH
pg//bMJ+KF31xJS80Yp3UYwR5ZDzqcFK8VJsXQlS0l9gPkL4h5UjqC4epAFMowC5SN9yT9/021BU
USacme1cMq/wavzNFVmRy9gJhdtNY2nkw7tonnb3zywIHogxzjkFteneL7HCDY4GRcTXuC2wQKd7
MwpgR0B7+kaipzMgeIQIGZDsX/105RK8miDgFNvwM+uDU6plq7P3UOIMVWbGp+iVO8k2ZpAS5xqf
Yvfde1DzjJlGuK25czPI0LDgR1bVARr3YuCns6d8Jb2xKJDT9GSd/Fcyssfb4J488L7lwaT9ykBd
GSjkFvmOI4xuWVYTnvIERj/9uQp4PVm6dtqay+Cy8kQNNiES8zkFW0XHokQS5oLEFxm+uI/Tnx4/
bWluy5pWuOga0IetyO4l4kjs/hqwljOd9vk/PmorSCxtVPwCjDfa7hBzQWkU/wVU/PwfTnWb0EsD
Cb1MoHb5+f78gCOIVrYmJzGHhf5w6AawNhandKeKeQQF13veqqTupOLCzNd9jYHQ9mbdr2CL6Leh
xbJG/jtjffKvW+Foq4ZMpWc5l1BfYFak12F17TKBlsYqMob3sFgw7MrMKXCPDI9uFUgLQL5K5XYH
onP/iT09KkNFVjNcDX/PrFipPOJ0EZTLukom3Swq0dyrQ16lLuRoFRBOuhKiRTrg3h+ekjsREbum
3v4=
=651j
-----END PGP SIGNATURE-----

--SQg9uzgboJkx2SEFJBIFGBDmAUNGAV6ek--
