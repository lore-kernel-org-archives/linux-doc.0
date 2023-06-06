Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9E4C77B73
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 02:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjFFCR1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 22:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjFFCR0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 22:17:26 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C4E114
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 19:17:25 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-33d5df1a862so15360325ab.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jun 2023 19:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686017845; x=1688609845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vW14s+LE6Ttn8SPLTIyRZdmATyKiDyL2I8ox3trYy0=;
        b=rLjnkdmQI8PFiJOmi+wmXVBOgHPSrf1E9gnzGliRVqTVRZF3ub/OF0ETHszU/Hy7s9
         pkBvyRzTYzgYEifQ6CSnBaXnc5qRcGDYkGuA9T7sRszyqeYbojDC01Fh0XEDAQJxflSc
         A6Ffh23TeqN7at7Fbu7V7wXy8sY5eq4bFhQLrVPp27vYXMww5vIpZ/t9ZkcjSKhXSmik
         lXHAmExr/QuA7KKxrGgdm3tuwwevvwCrvT/T/UoxjLQrMVNtH3+hGK59kH38VlnjRTAf
         WQtw08AlWD9Qh1LQBojSCzXOWI7XpdMzPLo3taYfKuKaBNUeq/RCoNhiCWJkY5PPWoCm
         Jm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686017845; x=1688609845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vW14s+LE6Ttn8SPLTIyRZdmATyKiDyL2I8ox3trYy0=;
        b=NSBnVCgPSFVKt7WZeu1CMuV9n4y6xhf74W472pu3u2f3QQiYKQ0S5F5DAz0ZEkgfSV
         70EMgKNwMK99yI9kHdRVihvOoilYhHfJ0Uofv9Sy+F2FKPAeHAV1H00ZPKvFxv0xs2jm
         oSbxGDUCSFL8jfmP1WTme7vq8zckBY03AO7I6pWKn/N0n08cVr/Nt0WuG/dtUWv61WL2
         ibBwNHgzHgMDNldciZHhw3Hy9wcg9La+2+Gz+YzjbwwAAe899jaYOj1WsfkDb4EOc+s3
         vhR6iVNHHFNPJOP74hiAeRj0G9MKfyWqER3972iXlF0VbyjQKDYIX7ItRKxbvmKJWa1z
         of4A==
X-Gm-Message-State: AC+VfDwS9sW9S3Nrhdj3jZKqjrEZRrni91NAJes0XkY5kd7Eiu9li63t
        0CkOqujpfy666vsreWcALZw=
X-Google-Smtp-Source: ACHHUZ5ag2NMpKr6CzNSt35USmFRvJsmBb6gDSyagdHvLIlRmN8qXlHkiMLlWXIGM7cqZrhRC0fLVQ==
X-Received: by 2002:a05:6e02:110:b0:328:c3ae:12be with SMTP id t16-20020a056e02011000b00328c3ae12bemr857519ilm.13.1686017845230;
        Mon, 05 Jun 2023 19:17:25 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-36.three.co.id. [116.206.28.36])
        by smtp.gmail.com with ESMTPSA id c10-20020aa781ca000000b0062e0c39977csm5774737pfn.139.2023.06.05.19.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 19:17:24 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id C822E1069FD; Tue,  6 Jun 2023 09:17:21 +0700 (WIB)
Date:   Tue, 6 Jun 2023 09:17:21 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/4] Documentation: dm-integrity: Fix minor
 grammatical error.
Message-ID: <ZH6XMbH7mocamzJA@debian.me>
References: <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230605050853.6240-1-eatnumber1@gmail.com>
 <20230605050853.6240-2-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8f6GLla2tqI7Vmyw"
Content-Disposition: inline
In-Reply-To: <20230605050853.6240-2-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--8f6GLla2tqI7Vmyw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 10:08:50PM -0700, Russell Harmon wrote:
> -There's an alternate mode of operation where dm-integrity uses bitmap
> +There's an alternate mode of operation where dm-integrity uses a bitmap

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--8f6GLla2tqI7Vmyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH6XMQAKCRD2uYlJVVFO
o6AhAQCVKdKDcVHOWjP95YAh/XZC8sTMIMLMrijBeuH4mlE0yAEAh0bCR3ECtBLx
g4VuTvLrWIOODkGD9S1EoiMHmNWTBAM=
=64qt
-----END PGP SIGNATURE-----

--8f6GLla2tqI7Vmyw--
