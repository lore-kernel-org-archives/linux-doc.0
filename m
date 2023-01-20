Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450DDC004D4
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 02:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjATCyi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 21:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjATCyi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 21:54:38 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809BC9B131
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 18:54:37 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so7808715pjm.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 18:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4a9uQnCPAXTrBqi7c8vUTZzrQbZzTY4NuvqzCcjH6w=;
        b=lgqUGY82DQ88m35LIkuurOpZEwKVwKTVcCXBvlf9EAT+DCwzHe2Slra61cRT6ItGuk
         kJMUVq6Kde/svxxBaZ8GnUgVmEDLpRy55TWGrE0qrhJEtKEummvm0QzS9jkmyr2uBWj2
         SDUaP5LtyVqhJC13QO2GSv2gztjPUUTa/gTkbmaGS8rumfcHL786Y9/SK8OPPTixPB29
         6c1HZPb3RhpemeIyMDagEKjnxzdt5cnxf1w6DN7Fq6j6V8FTuYJ5dx3vjP96EaM7eG3Q
         z7kffhz+iWJb+MCRbY0HS82jy5C11yfd3Og2Ryy3kpW9sHMKBJdaA+4V5LO3GUE9zZRw
         xEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4a9uQnCPAXTrBqi7c8vUTZzrQbZzTY4NuvqzCcjH6w=;
        b=Evm5EHxLiAgoKphbu7QEJsx/ylMRPcSy7HtSorjOBT0kfhlOgyle9iLzlq9ZZB8pRx
         yba+EI0iqQCeYvohlZjUXA1ax9P5jyeuXWqS5k1TwE961akTDFjOai5J6UkMQN0Wur3+
         Ia2wjhaq7IXkgGWIxY2YdnxmpTkyRYTq82Ocn7dEr+5xmDvRffTPBTfu/QerRpOFDXO7
         P6GuM3wRuBLSUjxyODRq4L5MH/0VENAg89PXElnI16xq9aIBVRLwXpI9r8HYL1i9h394
         oz/BHaNQ/VRWpzTsGdwEnYIeuAdgN7wPBe/E4X5q60DrYqQLT42lMRo2s0SkwPjptabH
         z9vQ==
X-Gm-Message-State: AFqh2kr/gw6Q271clHrtyAoXtZL3yQxjWiC26W2TVzS64uml1y0qG6RR
        Qg5A8H6BWKnM7SNUzBpMz8M=
X-Google-Smtp-Source: AMrXdXu7tbwdSPRu7AplmjccpUpSs2KevldYB5rRdLAVAeC4tVQDf6bfqM9uZVxJWzhmBhzIikh+jw==
X-Received: by 2002:a17:90a:e617:b0:229:5027:c2d9 with SMTP id j23-20020a17090ae61700b002295027c2d9mr14235176pjy.34.1674183276996;
        Thu, 19 Jan 2023 18:54:36 -0800 (PST)
Received: from debian.me (subs32-116-206-28-45.three.co.id. [116.206.28.45])
        by smtp.gmail.com with ESMTPSA id x4-20020a634844000000b0044046aec036sm21542207pgk.81.2023.01.19.18.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:54:36 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 261CE104293; Fri, 20 Jan 2023 09:54:30 +0700 (WIB)
Date:   Fri, 20 Jan 2023 09:54:30 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
Message-ID: <Y8oCZnF0e/aMkmtg@debian.me>
References: <87o7qu5al3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IYhNM+3bAPuGOoio"
Content-Disposition: inline
In-Reply-To: <87o7qu5al3.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--IYhNM+3bAPuGOoio
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:11:20PM -0700, Jonathan Corbet wrote:
>  # Custom sidebar templates, maps document names to template names.
>  # Note that the RTD theme ignores this
> -html_sidebars =3D { '**': ['searchbox.html', 'localtoc.html', 'sourcelin=
k.html']}
> +html_sidebars =3D { '**': ['searchbox.html', 'kernel-toc.html', 'sourcel=
ink.html']}
> =20

In the sidebar, I see process/ is misorganized. That is,
process/{development-process,submitting-patches,code-of-conduct}.html
are at top-level entry, although these should have been children of
process/.

> +
> +/*
> + * Tweaks for our local TOC
> + */
> +div.kerneltoc li.toctree-l1 { font-size: smaller;
> +		text-indent: -1em;
> +		margin-left: 1em; }
> +div.kerneltoc li.current {font-weight: bold; }
> +div.kerneltoc li.toctree-l2 { font-size: smaller;
> +		text-indent: -1em;
> +		margin-left: 2em;
> +		list-style-type: none;
> +	      }
> +div.kerneltoc li.current ul { margin-left: 0; }
> +div.kerneltoc { background-color: #eeeeee; }
> +div.kerneltoc li.current ul { background-color: white; }

I think only the visited page should be highlighted in bold, not its
full hierarchy.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IYhNM+3bAPuGOoio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY8oCYQAKCRD2uYlJVVFO
owvwAQDauY7YJIxMau8e2Q0gmzPsVXn9VZ8NWy3hlYEwmpPidAD/V/gjeBFMFdlX
hyq4+NN6HrtZR3BEuQfK5aJtV4kZrQ4=
=rDp7
-----END PGP SIGNATURE-----

--IYhNM+3bAPuGOoio--
