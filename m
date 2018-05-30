Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3FD9C7D048
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 19:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753666AbeE3TWB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 15:22:01 -0400
Received: from anholt.net ([50.246.234.109]:46624 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753686AbeE3TWA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 May 2018 15:22:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 66B0910A17E3;
        Wed, 30 May 2018 12:21:59 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id H9W929dVA8os; Wed, 30 May 2018 12:21:56 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 1982210A0D70;
        Wed, 30 May 2018 12:21:56 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id AD7F42FE2D89; Wed, 30 May 2018 12:21:55 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH V3 2/6] hwmon: Add support for RPi voltage sensor
In-Reply-To: <20180525193717.GA24967@roeck-us.net>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com> <1527276279-23876-3-git-send-email-stefan.wahren@i2se.com> <20180525193717.GA24967@roeck-us.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/25.2.2 (x86_64-pc-linux-gnu)
Date:   Wed, 30 May 2018 12:21:55 -0700
Message-ID: <87lgc1ne3w.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> writes:

> On Fri, May 25, 2018 at 09:24:35PM +0200, Stefan Wahren wrote:
>> Currently there is no easy way to detect undervoltage conditions on a
>> remote Raspberry Pi. This hwmon driver retrieves the state of the
>> undervoltage sensor via mailbox interface. The handling based on
>> Noralf's modifications to the downstream firmware driver. In case of
>> an undervoltage condition only an entry is written to the kernel log.
>>=20
>> CC: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> ... assuming this will go through some arm tree.

That's fine with me, I can pull this whole set for 4.19.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsO+dMACgkQtdYpNtH8
nug3oxAAlBRyVsZ6QhTzWCVsN0WIhFcdikUzDJB2NACRXaE6EnCIWHuomXpssLjD
VwD5lJzew2X7yl8uT6DZhp3K+eaCBtKkeNfB/etzSLEgF6Zy1JMlou/CU4APQjt8
jEv1tHxs7RzmnEx7WltRuzqYQQknVo9YEy4CGQddNxCuePIuXVDpocDy//6Hb4pk
Z5xa7GpYhMduCYqMKACA14B3lCdVTt4aVZOGdinKjzQ6seMecmchF+bR7EpPBVFR
CTTriV5qFv/shc95J/F6aGKQDtHyz7Dx2vuQ4JgyIcI+fATRXYPuTqjb7MnTrxXY
OVfOFVPldTtGXWBe2fK861uIeuu2/3SM2ajAsm5G/h7kzsQrxsSfrOdgsU1h1cK3
LNBFc0hODEdZGrkUuBT1gM/xVU2+wlTVQBbFSjU2f+9OHpGMJZBq7BOlqDSxCON5
OKkz77wnsZjg3Hoi+1z5PpdzQ97o03QwDxM7x6sSzuBrr6ghhtXBEHjyShOX/PQA
lbHit7S/rfJCc5/1zWIeDramgOZw5hUGhf7GOJZmsf8HGYVngEKgeuHZsHi9Soct
Y1T0XNTmw+lPp6SdjgqtdHAbKPJe6h23z/EFrr0zVyW2bc+ZJK9irkM3oGj4UPUC
jeI6538+6ny86V0GKEbhFdWL/ceUnwOtUQnKQftPDSSB4xz7WD0=
=xEf9
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
