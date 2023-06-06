Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADBEC7EE23
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 02:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjFFCQM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 22:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjFFCQL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 22:16:11 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFC811B
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 19:16:10 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-256931ec244so4784992a91.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 19:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686017770; x=1688609770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C5XyoZjWsuOCRV87SUXSoI1z8iAmtIIbTjGmQ4j3EJ8=;
        b=hdWbrRa4Fi5VSH7GYleswA8LBDhJHmZd2cT5dzDxy9OF3VeBcM3dDqjToGMmjW4lo8
         3qE4CEiizuk8qjEV+jlnQ/lt7n02FBQQhdgSGvcPW9NUZf5va8X62VJvpV+5KicZ1V3Q
         6z/hpUb1dbmrbOeEs9Tm93w4ue+tXNqkBXNYohXN8YMpZaKjjxKBI3lOXjs8Juy5FG4h
         uODdthiGP5jhQKzgWTivXeXBzuIICMES1BnmGf04NxDwosGevlT/d/gdI3sJeAXWVjMo
         t2xxTa9wbYvUKA8S+BYD1u+WLhp3axp4CYZBuqX+wyuggQvrjkXYxrlPnQZ5q+ZgLARh
         EHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686017770; x=1688609770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5XyoZjWsuOCRV87SUXSoI1z8iAmtIIbTjGmQ4j3EJ8=;
        b=g54CKWIn5G0wuWqsZIZtf1HN75zjLan4LMSprCQsLPrx8DWvKmx+OB+VtYHyvp9vJ+
         0U3yG2THiwCIaNmgW7zTOaIslrxPgVVWz52Hty0I5HfSXeamKaBd2sjjY/CWUS/oX9vF
         uKhMPafq72+3okwZJfkRWwKIADW/EG6VGjUluuzTGndRFyDBvApaRvsB00VQVPoBnQuY
         td7ccO+Ivs2H+lM0bApbgB3gS35h6IU1tri4tyt/DnNVrXdwBHzEzR06Mh3u5NWmLAva
         QOwp9GQQDk3t6Bm76ZiFSPJGC2UKEjsIRXKRWfcASHGzriK6qsBB8DNg2lXNj7Q+c5ZA
         N5pg==
X-Gm-Message-State: AC+VfDxFijcNUIddeMDRSfU9pGuZ01HOnnN8jSKEkIC8N4X1GNHFhwTz
        c7N4Pn3KgiL+xg8A8j7G8bg=
X-Google-Smtp-Source: ACHHUZ5N9RU4fhFUW5Lc67Fb7VuqKmhcmQPducBgOZuXThdKJqR83I91aNFur900MA4NmiMh3ZWtBA==
X-Received: by 2002:a17:90a:1a11:b0:255:a1d9:4486 with SMTP id 17-20020a17090a1a1100b00255a1d94486mr641168pjk.1.1686017769632;
        Mon, 05 Jun 2023 19:16:09 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id gf18-20020a17090ac7d200b00256b9d26a2bsm8318745pjb.44.2023.06.05.19.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:16:09 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id CB2161069FD; Tue,  6 Jun 2023 09:16:04 +0700 (WIB)
Date:   Tue, 6 Jun 2023 09:16:03 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/4] Document dm-integrity default values.
Message-ID: <ZH6W4yegFI1ioMzt@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-4-eatnumber1@gmail.com>
 <ZH1TmkyVJbIlNUEE@debian.me>
 <875y82yre1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9h4JANILIPQgPJG"
Content-Disposition: inline
In-Reply-To: <875y82yre1.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--M9h4JANILIPQgPJG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 07:23:34AM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> > On Sun, Jun 04, 2023 at 12:06:03PM -0700, Russell Harmon wrote:
> >> Specifically:
> >>   interleave_sectors =3D 32768
> >>   buffer_sectors =3D 128
> >>   block_size =3D 512
> >>   journal_watermark =3D 50
> >>   commit_time =3D 10000
> >
> > Your patch description duplicates the diff content below. Please write
> > in a mood that evocates curiosity to read the diff (and make sure it is
> > also imperative).
>=20
> Bagas, this is a typo-fix patch.  It does not need to be nitpicked into
> the ground.
>=20
> Russell, Bagas is inadvertently teaching you another lesson about the
> kernel development community; it includes a certain number of people who
> like to push contributors around with authoritative-sounding messages.
> These people do not always need to be listened to.

OK, thanks for the tip again!

--=20
An old man doll... just what I always wanted! - Clara

--M9h4JANILIPQgPJG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6W4wAKCRD2uYlJVVFO
o+HiAQClaUBtBehl8TpkH8yaVIXPPll/LkDnss0br3iiXPCjFAD/XUI9GPV0AyGM
9q7MPwXm/t0Xxn84QJSh1OtLXeSHUw8=
=b2Ha
-----END PGP SIGNATURE-----

--M9h4JANILIPQgPJG--
