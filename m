Return-Path: <SRS0=i7Ry=4J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F86FC35641
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 22:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E407720722
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 22:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="lsNW35b+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgBUWd4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Feb 2020 17:33:56 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6467 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgBUWd4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 17:33:56 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e505a890000>; Fri, 21 Feb 2020 14:32:41 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 21 Feb 2020 14:33:54 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 21 Feb 2020 14:33:54 -0800
Received: from [10.2.168.89] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 22:33:54 +0000
From:   Zi Yan <ziy@nvidia.com>
To:     Matthew Wilcox <willy@infradead.org>
CC:     <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH] mm: Add pagemap.h to the fine documentation
Date:   Fri, 21 Feb 2020 17:33:47 -0500
X-Mailer: MailMate (1.13.1r5678)
Message-ID: <D5D220A5-41A7-4760-8779-C1DF67E1194D@nvidia.com>
In-Reply-To: <20200221220045.24989-1-willy@infradead.org>
References: <20200221220045.24989-1-willy@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: multipart/signed;
        boundary="=_MailMate_39149EEE-96F6-487C-8036-D6D05A8D5443_=";
        micalg=pgp-sha1; protocol="application/pgp-signature"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582324361; bh=wOsiBL3wPbTIZm5meOoGT14rF0q6aJd5evFwDa9Jsb4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:X-Mailer:Message-ID:
         In-Reply-To:References:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=lsNW35b+gOWEJVbEnjMJzQWD/JtkRjFDUKBRK2QYwlEjVqf2sZFrcDxLowK1JtDLP
         9xaEGuVjT5BBfv5WC13X6WagujC4Q2Zd3LovLnOKrBGhfipfb7SU+ZcHvL+eK5Jf90
         yCCjAfXUphV6c0ntazu5rakdJ5tFnx38CbRgJsyqPALk4joAFmwQQhhThr9qoMag4V
         IMRy/mkrF+wplFot7NOdQTCMMoIoyc9ennJSvH/l6xILZT8kXxDq33p5kB3IYn3KUI
         ZfemKUVkoFSIkl0X3W+YDUg+1zQAYzAYdOlX9WkhKhX/9xucdw5BTqbkdIg6JPDYkV
         bVd4eyrgOffjQ==
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=_MailMate_39149EEE-96F6-487C-8036-D6D05A8D5443_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 21 Feb 2020, at 17:00, Matthew Wilcox wrote:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> The documentation currently does not include the deathless prose
> written to describe functions in pagemap.h because it's not included
> in any rst file.  Fix up the mismatches between parameter names and the=

> documentation and add the file to mm-api.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/mm-api.rst | 3 +++
>  include/linux/pagemap.h           | 8 ++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api=
/mm-api.rst
> index be726986ff75..2adffb3f7914 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -73,6 +73,9 @@ File Mapping and Page Cache
>  .. kernel-doc:: mm/truncate.c
>     :export:
>
> +.. kernel-doc:: include/linux/pagemap.h
> +   :internal:
> +
>  Memory pools
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index ccb14b6a16b5..6462df717cff 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -33,8 +33,8 @@ enum mapping_flags {
>
>  /**
>   * mapping_set_error - record a writeback error in the address_space
> - * @mapping - the mapping in which an error should be set
> - * @error - the error to set in the mapping
> + * @mapping: the mapping in which an error should be set
> + * @error: the error to set in the mapping
>   *
>   * When writeback fails in some way, we must record that error so that=

>   * userspace can be informed when fsync and the like are called.  We e=
ndeavor
> @@ -305,9 +305,9 @@ static inline struct page *find_lock_page(struct ad=
dress_space *mapping,
>   * atomic allocation!
>   */
>  static inline struct page *find_or_create_page(struct address_space *m=
apping,
> -					pgoff_t offset, gfp_t gfp_mask)
> +					pgoff_t index, gfp_t gfp_mask)
>  {
> -	return pagecache_get_page(mapping, offset,
> +	return pagecache_get_page(mapping, index,
>  					FGP_LOCK|FGP_ACCESSED|FGP_CREAT,
>  					gfp_mask);
>  }
> -- =

> 2.25.0

Looks good to me. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--
Best Regards,
Yan Zi

--=_MailMate_39149EEE-96F6-487C-8036-D6D05A8D5443_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBAgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAl5QWssPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK8Y8P/iOkUSBhXEoR1HyUUKePPPOHB+o5N6K9ehU8
6PyuXuXv2+iZjFpqa1nd/WjyJcwyLIFxZYd1cY5x7aUPXfcYgqatd7zia4Vh3sF0
1voGgPK/RRFqLWZgo1wjfWu+6X8pPkpdM2Xl87ARHDzFDCTbOd523kgo0XR5kQsZ
iLLsnv0n90X/Bad8cyZybkyIlVVTMFWWHt6hiHhaqQ4JKiDVThHdXiAGjPQ65UUk
jMj73BsaHDp1utJUYGoZsp538514sOQGYkkC2Il3RoBFoW3DtSd674tqBabRYcY8
rrBsrxTXqKL0YJzejBBwe7DrEmY9NrA2PR9X9D6hDzoJN6k7wF2Zt6r2CiyQ6Yib
Bi45s30ayfWqa3/TBlPJvN14DKJNoC/LEYTLc4QCJHJuz6NMZk/Yp6VdF6PfU4lg
jzhY8FWC4TC7ey7cYFusTUn+stCIuDi59nAkMFssVNHdi6EwmvJlxL95LE5qvcGi
jQ+eunbkM5zWnt4BAGCQoQhHa7uDaNnHbhwvvMayCNjPYzTRagXLgqR7WHb2gfHT
WEUCPQ2HlivTLz7gdM2GnGFtkRK/9HyjYJuq3UA7B2haoMEtPc2H9iQW9Omjkj4M
0gpgjHXX6hUm8Dn/7oLMLW6esXLbf8o+F91Ca0RZM6gBP1lJX+VSJPP4S31SuKSU
IJf40mJU
=FDao
-----END PGP SIGNATURE-----

--=_MailMate_39149EEE-96F6-487C-8036-D6D05A8D5443_=--
