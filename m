Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA49E7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 06:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbfDAGVj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 02:21:39 -0400
Received: from ozlabs.org ([203.11.71.1]:59597 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbfDAGVj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Apr 2019 02:21:39 -0400
Received: from spoke.localdomain (localhost [127.0.0.1])
        by ozlabs.org (Postfix) with ESMTP id 44Xj0d3SsGz9sQw;
        Mon,  1 Apr 2019 17:21:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
        s=201811; t=1554099697;
        bh=07q8tXMo88WI7t77jFF7qGxdsavc2yv3LQLXa8qvsTg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=TWw5SZakcuTVHPsCiwox2cRwlDaiUoTEZ5LE86NCrvdUeXpleRTVuG7UtHeU9VKMK
         Oxoq0BjEj1gakvJAQx6FbXbnIbCOSLMB30QJC3pSK5YmR0iHFTDpAO91Nhksco64dK
         M1kWDLQUSdxsYmEgdHoKx7/G73MtqZQXJWTqWypwqmwkL+ELM+aTMZTI9qtWkjuZLq
         PV0Kf0tu5Om7svdL2KKRbnc6oTtpkhS4L5ucAjoMRE1Xnw1PTiXN5ifq1Wj4OCtFAA
         pHm2Dc8ijneVXje/lRAu0hXKaz6dScnNP1oqIpPZ3RPlAuwFyTYrMbDhnEM4LNHMkT
         mDVIFPlZbj2Ww==
Received: by spoke.localdomain (Postfix, from userid 1000)
        id 6B8992A0352; Mon,  1 Apr 2019 17:21:37 +1100 (AEDT)
Message-ID: <282f7310ef16e0d37161b0bb2d03baa57c40db69.camel@neuling.org>
Subject: Re: [PATCH] Documentation: powerpc: Expand the DAWR acronym
From:   Michael Neuling <mikey@neuling.org>
To:     Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-doc@vger.kernel.org
Date:   Mon, 01 Apr 2019 17:21:37 +1100
In-Reply-To: <20190401061156.31366-1-joel@jms.id.au>
References: <20190401061156.31366-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-04-01 at 16:41 +1030, Joel Stanley wrote:
> Those not of us not drowning in POWER might not know what this means.

Hehe... thanks!

> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Michael Neuling <mikey@neuling.org>

> ---
>  Documentation/powerpc/DAWR-POWER9.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/powerpc/DAWR-POWER9.txt
> b/Documentation/powerpc/DAWR-POWER9.txt
> index 2feaa6619658..f6c24e54ce83 100644
> --- a/Documentation/powerpc/DAWR-POWER9.txt
> +++ b/Documentation/powerpc/DAWR-POWER9.txt
> @@ -1,10 +1,10 @@
>  DAWR issues on POWER9
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> =20
> -On POWER9 the DAWR can cause a checkstop if it points to cache
> -inhibited (CI) memory. Currently Linux has no way to disinguish CI
> -memory when configuring the DAWR, so (for now) the DAWR is disabled by
> -this commit:
> +On POWER9 the Data Address Watchpoint Register (DAWR) can cause a checks=
top
> +if it points to cache inhibited (CI) memory. Currently Linux has no way =
to
> +disinguish CI memory when configuring the DAWR, so (for now) the DAWR is
> +disabled by this commit:
> =20
>      commit 9654153158d3e0684a1bdb76dbababdb7111d5a0
>      Author: Michael Neuling <mikey@neuling.org>

