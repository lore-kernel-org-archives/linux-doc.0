Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55671C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 01:20:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B853601FE
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 01:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbhDSBVZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Apr 2021 21:21:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:52628 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233117AbhDSBVY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 18 Apr 2021 21:21:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E8FDAAC87;
        Mon, 19 Apr 2021 01:20:54 +0000 (UTC)
From:   NeilBrown <neilb@suse.de>
To:     Fox Chen <foxhlchen@gmail.com>
Date:   Mon, 19 Apr 2021 11:20:48 +1000
Cc:     Fox Chen <foxhlchen@gmail.com>, corbet@lwn.net,
        vegard.nossum@oracle.com, viro@zeniv.linux.org.uk,
        rdunlap@infradead.org, grandmaster@al2klimov.de,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 05/12] docs: path-lookup: remove filename_mountpoint
In-Reply-To: <20210316054727.25655-6-foxhlchen@gmail.com>
References: <20210316054727.25655-1-foxhlchen@gmail.com>
 <20210316054727.25655-6-foxhlchen@gmail.com>
Message-ID: <878s5f2hov.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16 2021, Fox Chen wrote:

> No filename_mountpoint any more
> see commit: commit 161aff1d93ab ("LOOKUP_MOUNTPOINT:
> fold path_mountpointat() into path_lookupat()")
>
> Without filename_mountpoint and path_mountpoint(), the
> numbers should be four & three:
>
> "These four correspond roughly to the three path_*() functions"
>
> Signed-off-by: Fox Chen <foxhlchen@gmail.com>

Reviewed-by: NeilBrown <neilb@suse.de>

Thanks,
NeilBrown


> ---
>  Documentation/filesystems/path-lookup.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/fi=
lesystems/path-lookup.rst
> index a65cb477d524..66697db74955 100644
> --- a/Documentation/filesystems/path-lookup.rst
> +++ b/Documentation/filesystems/path-lookup.rst
> @@ -652,9 +652,9 @@ restarts from the top with REF-walk.
>=20=20
>  This pattern of "try RCU-walk, if that fails try REF-walk" can be
>  clearly seen in functions like ``filename_lookup()``,
> -``filename_parentat()``, ``filename_mountpoint()``,
> -``do_filp_open()``, and ``do_file_open_root()``.  These five
> -correspond roughly to the four ``path_*()`` functions we met earlier,
> +``filename_parentat()``,
> +``do_filp_open()``, and ``do_file_open_root()``.  These four
> +correspond roughly to the three ``path_*()`` functions we met earlier,
>  each of which calls ``link_path_walk()``.  The ``path_*()`` functions are
>  called using different mode flags until a mode is found which works.
>  They are first called with ``LOOKUP_RCU`` set to request "RCU-walk".  If
> --=20
> 2.30.2

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJCBAEBCAAsFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAmB82vAOHG5laWxiQHN1
c2UuZGUACgkQOeye3VZigbm5bw//cQM0d2KnUsWnwghd3sBsi/kR4I9uB+PHaldh
Cwd4VQUGFXf4aRDVNdHAG007u5uzsPlmBfj3wNmbkDNFyjJx0ZR+O2ynuIbSpbw8
60ekBPdRPkxYIua8gyiE3yIe46efYeBwvmd5OAnMOYLnjHjopA6DB5TkDu8FUYh7
Yy8cLArlKwnMANebpGI7zsH4mbwCHdT+LhkPaH5HdsL+j4YKjRfcrtnI5keX0aJV
RpHqFFLFbS3NZF+X2mudN23SEqnk+k0qotF7gUj+pJVsy6Hucuf96XCperY2fsS5
ibgKCGCflusJRTGpGJpYaoqZAngfihH+E35Xtz/qRQG18gXX4yjkv0q4Q1fNn+Mi
fRIe1zP8GWTmiCjyO0gqH3hi4Hh5Am+uniA40+Mi8Nusw39LtTtrJi+i7D+GLNxt
vT7fXFTF+lHkmmR7GH6/acbSfQn6ikuE6mdFOQc6V9rEneOfrI/gkhjdn5OZkZQQ
AxZas+iNB6x+J0zcCpfAgwfLVh4c4T1HzLbf2NZwN2MCz1D6pY+AF7q1Qqdzqm9u
ca2N8fAfabd/TgO9D1q6yGVGmnVqYTyB8+/MOkY5zMZVNfrvxgEsoD2Al2dPKpHF
XcNrwRR3EIQCY6PeqZxDjAGRiXxyysPLFLR+tLRzULg1lsMaiRysWd+l8d7xYs5D
DGYg5ks=
=Qh7g
-----END PGP SIGNATURE-----
--=-=-=--
