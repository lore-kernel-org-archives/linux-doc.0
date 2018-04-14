Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8751A7E22E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 06:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750926AbeDNG1V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 02:27:21 -0400
Received: from www.zeus03.de ([194.117.254.33]:53022 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750883AbeDNG1U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 14 Apr 2018 02:27:20 -0400
Received: (qmail 22369 invoked from network); 14 Apr 2018 08:27:18 +0200
Received: by mail.zeus03.de with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted, authenticated); 14 Apr 2018 08:27:18 +0200
X-UD-Smtp-Session: l3s3148p1@eo+YFMlpwKkgAwDPW99LAAId4P/+oMhl
Date:   Sat, 14 Apr 2018 08:27:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sam Hansen <hansens@google.com>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/i2c: sync docs with current state of
 i2c-tools.
Message-ID: <20180414062718.3tbsdb6jhjurpfta@katana>
References: <20180412213342.138010-1-hansens@google.com>
 <20180412222457.x4jdwt27ylgi74o3@katana>
 <20180413141359.793919fb@endymion>
 <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413204937.440437e9@endymion>
 <CAP9bUy6Hf+cQzAAckou3QPTk0mJM4xJ4xq-hf+RwyVmD3Le+qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="63ldwbganmqjq6vv"
Content-Disposition: inline
In-Reply-To: <CAP9bUy6Hf+cQzAAckou3QPTk0mJM4xJ4xq-hf+RwyVmD3Le+qg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--63ldwbganmqjq6vv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> (also, did I send the v3 patch series threaded correctly?)

Yes, that worked. Thanks!

Things to improve there: I was both in To: and CC: field, so I got mails
twice. Jean was missing completely.


--63ldwbganmqjq6vv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrRn0EACgkQFA3kzBSg
KbaO5w//W/3a7z6XYo+5KE+Nek2G6K49ZDoMt/c9w4xbvL354cxoh9xzTcuPWJH2
Nbowz9VejPic0ZtoIdZ+PO+OYj/s3G8KrnKLIUQxW1GwKzE9b13s33TUhICCXqkH
SI6/U81YUOlOASNvDmIa/SUugZK0AEW7Q1AwnRQurGzNaJ9XjEkCJHzy9QZqEQbp
7lJDh0qCjSrJpSvYsl1RLMnaQcKrIQ7SiFCCAPH+ilBaho7xfbdFRFgUBDq4O9o2
y397ZU7Y3npsTP08SL5el3H25DmAaj4sjgiFL/tEsYdNyuqDkC0jBtX8tKT7vv6k
T+ychYVyNvNFuS9RUBYPWYhhlUPt6eqjq9/jHWz+N2AXNqr1sRHMBMan1hPdww/H
49niaLHYLuihrvPHSMcJPExusIQpSIyC/xf45xK6fXqdBjOFYoV7CAGBOQy4AUiI
nhq+MHrJGZHvn/sahlhNG9ZdCIGXtcFj9tBLQX40JjrfVJ7X2g9vvS2kDtpOnnZ8
JwxXMJupI86FcjiSqsr1cdnQypX4bmLEpNaiFftdDFzegDtB36mBOzlf1y35b0bF
FNvYIptegwdZLmHHoodDDNmtuLUIT8RRKekXACwS8YNb8GLvLJqjydgv2kD4RODp
k9B3h0Ee1UybDXrqQc0ShE6vhHf7/SJ7PXuZ2Ew+6NCUVovchYE=
=Qg3j
-----END PGP SIGNATURE-----

--63ldwbganmqjq6vv--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
