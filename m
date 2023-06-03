Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D766FC77B73
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 12:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjFCMug (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 08:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjFCMuf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 08:50:35 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B65F5
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 05:50:34 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53fb64b3368so1623171a12.0
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685796633; x=1688388633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3+BN/msO9N0mLkjvZX/WeFDqGUSTUi10KeGYtSRPn8=;
        b=WcdJ5db8SpF+7Z9Mgld6LKA3AFANFfOvRJPEKGX4Q1Aa27/SVtm80Dcdtfaf3QRcWu
         XgvkdEAgPmwgM2/tew1uTt/76Qi/u/q4/fgMkr52vHpUkWcrbbpaYo2YYoUaYPqHl1as
         IyJ2lA0cy/yl+qile4nwxdKk7gCbA7x2PUoHyyMV8SkUUhzkrIP/gpzG9u2NldQc2bNJ
         /7mVCj+sQDFvi3+/zcb3uhl4A8iqaHNCxTvQ2mVvcGhcKQDO8SCYb2K4yPvDK1s7rSNK
         zQ7fAOGgN6bFQZo/NIZb50Rt7s/Tg+/DypcFCLIWs7U1JGmNNpONGtz5J829ic8NaEZj
         ZUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685796633; x=1688388633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3+BN/msO9N0mLkjvZX/WeFDqGUSTUi10KeGYtSRPn8=;
        b=ErYvhTOdVBqZvq7r5CJA6sRzQeLQJRE8Vct6eLQyLlEAYlB1SdzC5ngHo1E3gJaKIt
         naDmQGa1nQFadJykI6Hby4qnZkGGPFhVILdcOHZg+Cyvt7FYZS/mMFxWa81z0BdyGhIn
         hNiCDeZP2Gku4JrzQH7usZrITY+8UvEUDF4FW8O0lxy58Cxs+pOA4msMA9HVEgbTIIy7
         IAUew+9vPyyk9ezn0/j5AevUAEAdhQtyHNk1om3cZD4Xgng0l2O+IAWEHcw7UuWARyHV
         se4aySaD2Q5XfdKqM09Of6NE6rrucryUUOTx3Lb0EFg1n9bOc9sTNCsrV/z0s9FfQndM
         t1Dw==
X-Gm-Message-State: AC+VfDz24U3p5Ou6nhfC6122Gd3FkelQgah63N2U4CVgWYT/BP6GfkzS
        gcXq2oFGiJ0LZe9PthnXVDs=
X-Google-Smtp-Source: ACHHUZ4gLl/xOpectOIjLYWNGUcmE9PAkvHkWOLhO70Bg6SSw5dmS0ttDNkqZBjhSB7ZNzaXZpOLwg==
X-Received: by 2002:a17:902:d505:b0:1ae:57d4:efbc with SMTP id b5-20020a170902d50500b001ae57d4efbcmr1467938plg.13.1685796633536;
        Sat, 03 Jun 2023 05:50:33 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-18.three.co.id. [180.214.233.18])
        by smtp.gmail.com with ESMTPSA id ix20-20020a170902f81400b001a285269b70sm3103021plb.280.2023.06.03.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 05:50:33 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 35E111069C9; Sat,  3 Jun 2023 19:50:30 +0700 (WIB)
Date:   Sat, 3 Jun 2023 19:50:30 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>, mpatocka@redhat.com,
        snitzer@redhat.com, dm-devel@redhat.com
Cc:     Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] Improve the dm-integrity documentation.
Message-ID: <ZHs3FqIWkkuFxMjS@debian.me>
References: <20230530002032.15227-1-eatnumber1@gmail.com>
 <CA+zrezTKon+02mfMRsW34Tkovqn3FsSD2_9tk-+a4icjt9PsDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XVArsN7NhrhXjAZn"
Content-Disposition: inline
In-Reply-To: <CA+zrezTKon+02mfMRsW34Tkovqn3FsSD2_9tk-+a4icjt9PsDg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--XVArsN7NhrhXjAZn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 03, 2023 at 03:02:09AM -0700, Russell Harmon wrote:
> Apologies for my inexperience here, but is this patch likely to get
> included? I see there's been no discussion.
>=20

tl;dr:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
>=20
> http://daringfireball.net/2007/07/on_top

Next time don't top-post here; reply inline with appropriate context instea=
d.

Bye!

--=20
An old man doll... just what I always wanted! - Clara

--XVArsN7NhrhXjAZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHs3FgAKCRD2uYlJVVFO
o5PPAP9htOp2ajlrdlZygU/aGwwxv07nU6VNumDM05NqxZ+LFAEA1alMSdN2/KAw
Gk/nzfnApbFJA82uiTlqw8oIzL0tvgk=
=D5kI
-----END PGP SIGNATURE-----

--XVArsN7NhrhXjAZn--
