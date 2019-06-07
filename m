Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A6857D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 08:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFGINt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 04:13:49 -0400
Received: from mail.quoscient.io ([80.244.248.206]:34066 "EHLO
        mail.quoscient.io" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfFGINs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jun 2019 04:13:48 -0400
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Jun 2019 04:13:48 EDT
Received: from mail.quo (localhost [127.0.0.1])
        by mail.quoscient.io (Postfix) with ESMTP id 6C8311A00296;
        Fri,  7 Jun 2019 10:07:03 +0200 (CEST)
Received: from [10.43.134.50] (ath.ops-vpn.quo [10.43.134.50])
        by mail.quo (Postfix) with ESMTPSA id F0FB97D8;
        Fri,  7 Jun 2019 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quoscient.io; s=mail;
        t=1559894823; bh=mIoS9exBwdVlE063QANzyxAzSVhSzlKqYqe5NzvBZGQ=;
        h=From:Subject:To:Cc:Date:From;
        b=HeFF5ldzPzxetySl53+6DPva/JMbyLUHl+Exub14YnJzGxcFqoARARvsxy6a3IjO4
         +wdjk+6tDN5bUkZrD2jCoLTh8OxGjordhPdL/tnJYK0t33E+48Xbl1A1Aw5/3CEsBh
         g7OPRgkFlZDZanUaDg4DJJ1Tz1jRU4y2xnLjWveU=
From:   Aurelien Thierry <aurelien.thierry@quoscient.io>
Subject: [PATCH] Documentation: fix typo CLOCK_MONONOTNIC_COARSE
Openpgp: preference=signencrypt
Autocrypt: addr=aurelien.thierry@quoscient.io; prefer-encrypt=mutual; keydata=
 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
 UPiWe0aztzUFHpHi
To:     Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Aurelien Thierry <aurelien.thierry@quoscient.io>,
        linux-doc@vger.kernel.org, trivial@kernel.org
Message-ID: <593f6e44-af55-ac7c-1c67-12e515028fe5@quoscient.io>
Date:   Fri, 7 Jun 2019 10:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix typo in documentation file timekeeping.rst: CLOCK_MONONOTNIC_COARSE
should be CLOCK_MONOTONIC_COARSE.

Signed-off-by: Aurelien Thierry <aurelien.thierry@quoscient.io>
---
=C2=A0Documentation/core-api/timekeeping.rst | 2 +-
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/timekeeping.rst
b/Documentation/core-api/timekeeping.rst
index 93cbeb9daec0..5f87d9c8b04d 100644
--- a/Documentation/core-api/timekeeping.rst
+++ b/Documentation/core-api/timekeeping.rst
@@ -111,7 +111,7 @@ Some additional variants exist for more specialized
cases:
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 void ktime_get_coarse_raw_ts6=
4( struct timespec64 * )
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0 These are quicker than the non-coarse versions, =
but less accurate,
-=C2=A0=C2=A0=C2=A0 corresponding to CLOCK_MONONOTNIC_COARSE and CLOCK_RE=
ALTIME_COARSE
+=C2=A0=C2=A0=C2=A0 corresponding to CLOCK_MONOTONIC_COARSE and CLOCK_REA=
LTIME_COARSE
=C2=A0=C2=A0=C2=A0=C2=A0 in user space, along with the equivalent boottim=
e/tai/raw
=C2=A0=C2=A0=C2=A0=C2=A0 timebase not available in user space.
=C2=A0
--=20
2.17.1


