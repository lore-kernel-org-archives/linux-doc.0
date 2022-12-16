Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD04C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 16 Dec 2022 08:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiLPIOg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Dec 2022 03:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiLPIOX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 03:14:23 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13532C677
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 00:14:22 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id f9so1263472pgf.7
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 00:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CzyFqgjsTJXNxMYCOnMD04vZ+kf5qFBXEoHINuusw3c=;
        b=lib8gzYQmd8fPriHCK/IvMxczDEuxztvonn3KDhzGMbcheyGk5oMJSqQnAdhoCSVGg
         dGZ2jP54vAHREJIS7qEZ8bdzUxY6yZobfGe1cYcbdc6DAiDBLLLR0/oPE2wE5FG7uaw0
         TeIc12/RQeWVIyDL9Lr3QXbtlye++gccACBukbg9SSsArS6XWSq3hLUKQuomMUx8ZxLm
         YA9c8A0YZER6Z4WFV4+p434J4pzt70zj98Jx1MpTr8CBmvKYsXsHLBr/56kxuvUXsX9J
         MM/kFDtWicfGTU1kADGdRDFAoGO4n4EgWo2CcKZTM7TNgxVFyvcsxFy8qL7fq0tmTDHF
         Lkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzyFqgjsTJXNxMYCOnMD04vZ+kf5qFBXEoHINuusw3c=;
        b=4WKah3Zgjx5ablD9xblatTg5ImHO079quld1P8I2SyMXiF0gIBkb/orhVajCvBdaUY
         wSgV6sW7oQ6F88URncRTXUXpQ8XThuhtbK1gz4hzOcZPF5314BENd5/2n6zxf1qirTAL
         ZR4/dUlyOmYwQZVz7ZjFpyCQo0Eokww5bP/IIVH3DtmEwku7X29PJrBQDRxP/wP5lFdl
         si/5ItZFXD88Zhasj7nA5w3Piftq7gGKhEvPisijpXVrRB4FVpsnNiz6UN04lumfUegY
         c1pPIQHhypSuOGjHV7RX/P91zZwuaaB3239E4nJwPMG8IZfkM68hkBa00VDr2keorR/u
         c1xw==
X-Gm-Message-State: ANoB5pmnPC0OQRUlCuByUWgfNzYjL+CQ3XjnME5O7Bwrd8IkBCHEteMK
        V3Gol+0nhmjAAOhL9qLceAXHxpcofoc=
X-Google-Smtp-Source: AA0mqf73YX5CX0krCEvCNfSXzvDV2lIP19ZPco6cwsg9Q39Mmu01pFXWLVdQBXQwem5ilmC3xpkQ8Q==
X-Received: by 2002:a05:6a00:2481:b0:576:3005:bb4d with SMTP id c1-20020a056a00248100b005763005bb4dmr43005755pfv.31.1671178462343;
        Fri, 16 Dec 2022 00:14:22 -0800 (PST)
Received: from debian.me (subs03-180-214-233-84.three.co.id. [180.214.233.84])
        by smtp.gmail.com with ESMTPSA id v18-20020a62a512000000b0057622e8e82csm865164pfm.191.2022.12.16.00.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 00:14:21 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 1DC40103E00; Fri, 16 Dec 2022 15:14:17 +0700 (WIB)
Date:   Fri, 16 Dec 2022 15:14:17 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
Message-ID: <Y5wo2WblrsHpM8sH@debian.me>
References: <20221214185714.868374-1-tytso@mit.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="atVPVJIhshz/d2bo"
Content-Disposition: inline
In-Reply-To: <20221214185714.868374-1-tytso@mit.edu>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--atVPVJIhshz/d2bo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 01:57:14PM -0500, Theodore Ts'o wrote:
> +* Software Engineers are not allowed to contribute patches to the Linux
> +  kernel.

Software engineers turned product manager or support desk people?

> +  * The time interval between kernels used in the organization=E2=80=99s=
 servers
> +    and/or products, and the publication date of the upstream kernel
> +    upon which the internal kernel is based.

I.e. the time for rebasing internal kernel against upstream one? For
example rebasing against several stable minor releases (x.y.z) is easier
than forward porting out-of-tree commits into new upstream release
(x.y).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--atVPVJIhshz/d2bo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY5wo0QAKCRD2uYlJVVFO
o0TPAQD32sXijW8VawW9Wk14rY/7gb/uK9uMV+l3HFKp64BxOAD+Kh7NfUBVv6EH
4gH28i054Q2XGGZMarbHU+KzRsTtAQI=
=iqz8
-----END PGP SIGNATURE-----

--atVPVJIhshz/d2bo--
