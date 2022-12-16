Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC41C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 16 Dec 2022 08:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiLPIXL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Dec 2022 03:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLPIXL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 03:23:11 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77699120A0
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 00:23:10 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id l10so1592513plb.8
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 00:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wF8cZ0NUFSrFQKdDnBSyfh6MjMIZMaAqfKhwDD4QpNM=;
        b=Cj5u8y23Tq3Arxn3g7+Y2vpg4NjqbXrORsy2OCqcvk7nW7rxsgaQ5quSVEiLjh3cJJ
         N1jA2p0tjYLYgh/4mNuUc0BU8WwUgqfaGvNn2TppkGq7Pcolq8WCg97rG2HdcwNkBHxu
         a77vQgX34us1f9KHQ958uMlByPMG4Al/rr2mmLBNSMK7qjjpCLI7G+T7KiEZ/AbAMZYX
         pLzulQjrJvYdJXOLLgYQOmHr1gzbYkc1G88VFlRC2UOaog6eehY//RFmefgtHuJfyVR8
         sszUne/ZxWm2CRD3leYw1joImhjmS1CA/n9bh2ZjJREgC7TZDBTXjaTeTg9C03Ti2/V8
         W4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wF8cZ0NUFSrFQKdDnBSyfh6MjMIZMaAqfKhwDD4QpNM=;
        b=hGyOy63kkxXbXutpnWIeTBiODP9B556tOySlQJrgnXZ+hgrku/YdW0vaqqkWBPPa95
         kE5zMdR/nSCy+Elb6IiuRfImXQv7GMnwwtNJWxhnzX7zvyyZwBuBTPkVitJa7nRGURbe
         kT7A+H3MxDbLp7duTEtyGJYYJ0KXXS+bqGae8HO5rUCe53HoJyIYwo8tEWZO/eAi4V4p
         NQfXM16Zsi514Q9KRQ4pbSdYJtbnSwBNPofiEENCdYcGfw3C0kdzFc/AWEo0+I8vNEgU
         FmIsjzBghLboHCzUCD9lnEH8eJM1LBlj62UXVDeUTXLfvx0snRr0mbXkhiVzVylTtvL6
         qb1g==
X-Gm-Message-State: ANoB5pkR91QW1GIngCX6t5jZXXhg4jhVqW26Zs3iBExrAK5FAkqijI/w
        5T6mWcR8ZBcRMdHrO/9h9wYKWJlsaBU=
X-Google-Smtp-Source: AA0mqf5yfbc7wysI6yq0YLZZeLR8YqQHE7Ihhx7+b4AHv4kvHH1OtdWdFa84TNHpAfgC93T4gv/rxw==
X-Received: by 2002:a17:902:aa91:b0:189:b8a2:27ed with SMTP id d17-20020a170902aa9100b00189b8a227edmr29660799plr.57.1671178989968;
        Fri, 16 Dec 2022 00:23:09 -0800 (PST)
Received: from debian.me (subs03-180-214-233-84.three.co.id. [180.214.233.84])
        by smtp.gmail.com with ESMTPSA id jj11-20020a170903048b00b001783f964fe3sm988134plb.113.2022.12.16.00.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 00:23:09 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id E4ED2103E00; Fri, 16 Dec 2022 15:23:06 +0700 (WIB)
Date:   Fri, 16 Dec 2022 15:23:06 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: Documentation/process: Add Linux Kernel Contribution Maturity
 Model
Message-ID: <Y5wq6lm4KxMjjk/q@debian.me>
References: <20221214185714.868374-1-tytso@mit.edu>
 <20221215151436.236233-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="00fGcdxqoi1QlJud"
Content-Disposition: inline
In-Reply-To: <20221215151436.236233-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--00fGcdxqoi1QlJud
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 04:14:36PM +0100, Linus Walleij wrote:
> > The goal is to encourage, in a management-friendly way, companies to
> > allow their engineers to contribute with the upstream Linux Kernel
> > development community, so we can grow the "talent pipeline" for
> > contributors to become respected leaders, and eventually kernel
> > maintainers.
>=20
> These are noble goals. Also the bullet list is short, formal, and
> to the point. This is nice.
>=20
> I kind of side with Michael Tsirkin's point that quantitative
> measures of performance can be harmful or give a false impression
> of control. Consider this example:
>=20
> linux$ git log --oneline --author=3DWalleij |wc -l
> 4301
> linux$ git log --oneline --author=3DMcKenney |wc -l
> 3346
>=20
> There is something about some code in the kernel being more
> "core" than others that needs to be taken into account, albeit
> it is maybe an elusive concept. There is a hierarchy from
> contributing syntactic changes to coding style to contributing
> and maintaining say RCU.

Don't forget reputation produced as a result of contributions from the
company as a whole. For example, cdjrlc.com is known for noisy "redundant
word"-stripping patches and ignoring critical community reviews; ZTE
with "atypical" corporate email setup for which Greg dislike; and Intel
which (as you may know) has positive legacy to the community with its
high-quality contributions.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--00fGcdxqoi1QlJud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY5wq6gAKCRD2uYlJVVFO
o5gwAP9Bq4pjHReH8VrUXYVYKSpSt0dLNPm/bf+xDLwwviCXrAEA8RgRhKaoc5Xe
DLn2ughwTqOaf/cyKySxrKm1b66qngA=
=Vh+S
-----END PGP SIGNATURE-----

--00fGcdxqoi1QlJud--
