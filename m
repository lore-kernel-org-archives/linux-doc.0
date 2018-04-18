Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 807837DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 08:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753710AbeDRIKv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 04:10:51 -0400
Received: from sauhun.de ([88.99.104.3]:34704 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753693AbeDRIKr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Apr 2018 04:10:47 -0400
Received: from localhost (unknown [145.253.130.2])
        by pokefinder.org (Postfix) with ESMTPSA id F122630B6FD;
        Wed, 18 Apr 2018 10:10:45 +0200 (CEST)
Date:   Wed, 18 Apr 2018 10:10:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sam Hansen <hansens@google.com>
Cc:     linux-i2c@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation/i2c: adopt kernel commenting style
 in examples
Message-ID: <20180418081045.btkr3cdfdka34ph6@ninjato>
References: <20180413174257.139182-1-hansens@google.com>
 <20180413174257.139182-3-hansens@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h7p3f5dcjag6inyh"
Content-Disposition: inline
In-Reply-To: <20180413174257.139182-3-hansens@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--h7p3f5dcjag6inyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2018 at 10:42:57AM -0700, Sam Hansen wrote:
> The example I2C code is rewritten to adopt the preferred kernel block
> commenting style.
>=20
> Signed-off-by: Sam Hansen <hansens@google.com>

Applied to for-current, thanks!


--h7p3f5dcjag6inyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrW/YUACgkQFA3kzBSg
KbYIFg/+LjKEfIdoy/XaK6bFryLQ+mF+9Wmt7LmGsWUm3i0bUtfkwfY5qvgergCo
sX1gwvFeBzGkMpLspO1vcv3/uV37eKJpotlQ8SP6wb0ucB/YZNtmCkrfcGZofwdB
8lLfeJ8wMkU2Y7RxahXmCkRqCbvh7uKtHj37fu8gEhnErvWbB3o0njGkJSOyv36x
EfQOFIYIhuaxA2W2JV2l4v/AiZqUQ1HeKmRXKsqYdrdzbeiwSdGEa+LsiQprC10f
ZoyPhaoFIWzDOjnqTvGga3swdIG0mVz4N1OaeiECvzfl0E+9UvuuyPwdQb6WHSLg
DJzNtE5JvyajdAIOey618LmyFR/3GEJJJtzViXizpnzk2inTUNkeXAlJ95dlA5ez
iWsI0J8Sl3tDO/QbrdDXp9V8pt4FC53sF5VB7/pVNIyZ5UZcuDsyLjsBAueGkD21
bTKoxSOUW4CNS7ZmdMl4m0ID8K4D751IBE0ql0sZJEVLt75szMljNYnEU7nV4M7K
5KPfxiAq4Kxv++4z47g/O5TZxshBfkHAL/rKX4PgDnpoqmNquKB2cp21WOQYd4+a
w7zQ+d9+vO7ayHxkJzuQWWcDtG/wIcCJssIy4/D26O/tdw2qiznA70ncv5MMvafy
Oo9OeXwC+Kuf+cswT/vF9BYjL//DVNyXWC4XW7KE+je2mfoG4Hk=
=kUkQ
-----END PGP SIGNATURE-----

--h7p3f5dcjag6inyh--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
