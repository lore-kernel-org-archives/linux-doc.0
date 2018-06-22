Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 065967D062
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Jun 2018 00:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934015AbeFVAb7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Jun 2018 20:31:59 -0400
Received: from anholt.net ([50.246.234.109]:59398 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933452AbeFVAbw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jun 2018 20:31:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id F33C010A1642;
        Thu, 21 Jun 2018 17:31:51 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id FdQTmHLdWtAA; Thu, 21 Jun 2018 17:31:51 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id D704910A0D3A;
        Thu, 21 Jun 2018 17:31:50 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 46E6E2FE21D0; Thu, 21 Jun 2018 17:31:50 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V3 6/6] arm64: defconfig: Enable RPi voltage sensor
In-Reply-To: <1527276279-23876-7-git-send-email-stefan.wahren@i2se.com>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com> <1527276279-23876-7-git-send-email-stefan.wahren@i2se.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/25.2.2 (x86_64-pc-linux-gnu)
Date:   Thu, 21 Jun 2018 17:31:48 -0700
Message-ID: <87zhznd5l7.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> The patch enables the hwmon driver for the Raspberry Pi.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

I've pulled this series to our -next branches now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlssQ3QACgkQtdYpNtH8
nugaug/+J90SL9l3Qkk843Hn/9Ux0y/nathA6+qAfZpPdujCqx3REU+7VyMfggCL
U039D3CcxozqyGSiAgUOD2JxP4j3FxdKYavvL2lhw+FaX4BTw9dIrqyq32Q9h4kf
b31gas0cLC12amKV/kq4ygNOhQ8j1cQMsa08KLV8sp810IZLBg+aAaE0TRli0bQN
AOZNvUn0JjytUS5jnLOB5pkTLJOZ6rxQJTMP7ErdVwk6JboXsYNUFA2QcZsbES4P
AoD1PL3yveo8MftC47xfIaxscN/nu9e0hqg6Mii+U6Jc7rkAyxjLzuA5GhL2mF0O
413gmPPnihohhHpssJrLA6jsCuWVXIQbcRuDEOIprUP9luiryKs5hs9GuUOV2QRn
QArvnRgA2ljfNifVL8EfPrSqfkYBAZVdQAki4dJ4zs+9/2zGD6CILe4xOUkjlWqf
0e55FFq98NBu56D+nT7xOtY+fOld3V5JRaIS+MdF4UtsNRf/eWWECaRXIGfSxm+D
buy0pl4jQm1sdTkA7uhUec8f65TjJ3iPDJijA94FHsGpebfHut6qm/Y9fLg5dqkk
ZSjRh4hohXv5H0QjCsM/HsqjEw3JIToFhbJdKVvRaFxbzV4YMhssEZkt79nkxFZm
L1Di5osdM+tMAYkV68fFAh+oFDOJOfL+OGfHZzN/XqC/Sb/WjKY=
=KY6n
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
