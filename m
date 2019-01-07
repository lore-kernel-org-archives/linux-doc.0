Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ACE6B7D0D7
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 04:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfAGEFr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Jan 2019 23:05:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:43676 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726246AbfAGEFr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 6 Jan 2019 23:05:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 06469AD52;
        Mon,  7 Jan 2019 04:05:45 +0000 (UTC)
From:   NeilBrown <neilb@suse.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc\@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Date:   Mon, 07 Jan 2019 15:05:37 +1100
Subject: Re: [PATCH] Documentation/filesystems: fix title underline lengths in path-lookup.rst
In-Reply-To: <abe71918-29c1-ce47-57ad-e1908c7136e6@infradead.org>
References: <abe71918-29c1-ce47-57ad-e1908c7136e6@infradead.org>
Message-ID: <87k1jhjeni.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=-=-=
Content-Type: text/plain

On Sun, Jan 06 2019, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix Sphinx warnings in path-lookup.rst:
>
> Documentation/filesystems/path-lookup.rst:347: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:358: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:369: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:375: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:384: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:513: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:532: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:545: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:701: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:730: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:777: WARNING: Title underline too short.
> Documentation/filesystems/path-lookup.rst:799: WARNING: Title underline too short.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Neil, You didn't get these warnings when you built the docs?

I probably did, but I didn't notice them.
I just ran "make htmldocs" and there are pages and pages of warnings.
When I look closely they do include these ones.  At the time I was more
focused on getting the output to look right.

Thanks for fixing them.
 Acked-by: NeilBrown <neilb@suse.com>

NeilBrown


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlwy0BIACgkQOeye3VZi
gbmmxw//XatW1dyrLNSPZSYhUL9d0/ttCkvK858q7RTO3oKytCBNOKEoyx4bZnjB
dDWe88GW5aPqrW6D97WsKhmEhGgNbdk5pQat/i5uXSBPbGVf84oI5Z/RBrGuYORR
Mis/DQgWWRTEK0bo8H99N/qASk1yyJBK1GV2RqO38mGb+htXYZ0u2/y2IeIWcKEJ
BdtcU7mNHRcv6h4vjRpF7U5gJLABpW2pmM9p1m5vBIOC3pgwipgECrcjoiz9YqKF
nEiAV1HC2RKjgLSwI2DiN1z7OBuPXg9wCUyYOp8jxIT/Db9x+hVMsRQLCDJkJagu
5xVfrLJ4c0bRC2YTRJTwlQL4daMWzzu5SQhUWB75tBrS2+waN8vu4Rfwki9D8+Id
0UzKseJp9gtfwCRG4nModwGAeEg6hTb71NCtzZ6UsPSW6baCPq6jUpBmRZe2z3Iz
2n5W7z1dtezefHqiSodk3c3/UnJrKwWyrBFfiMDDKti10k7RP8yTv1g9yEtwVqtH
tuqh7rjdm8YIJkKNMN/2bYQhx8OJzDc24z6l0NmhFn3GYOE663RRk1svNtC8fi6n
RVZToBTmWpqedNYcrQkkvdJDnI8W4aXX73i93dLVFWttuLoxW/+rxx8y/34R/CSl
6Y35uSydsn2jrfGgQ0BXy3F2flTDYuk19RVhChDx5NoNlMizGNg=
=1AnH
-----END PGP SIGNATURE-----
--=-=-=--
