Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929A0C7EE24
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 03:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjFEDRt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 23:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjFEDRt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 23:17:49 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B645C4
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 20:17:47 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so3991253a12.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685935067; x=1688527067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5aMetwcrs//TXCNHEA0pW9fSv0jcazh9bmNTsbqRNkU=;
        b=lpHsgHSMlSoJ4GG7X1qZnwf+gVuTPcLa5LQnmnpg8Jr7IbJBLL0ORi5Rz+9yjuS9jY
         Xifh/+tQgf8wHJGGL9Pc7vK3y1ToM3okUwkl+Vpetc07Hz9i8uy6Eir1DTT2AGnXMEKj
         /hb62XW54LcRu7TPmxJa4usOYfMP1/sWz47jVocMnJ6tHEXUNP+0paLrg0I4jDM++qLM
         0R65eVBsAPPcAnIhC//YAEfum9LV0/nP/KQ4YKvUio1q3nYrHGu33iox/RlRZa8/qX4r
         9VX2LLmwn5H4wERGKtdpE4Gh9j91eXt21meZWcIifTkJvw0+ChKY8qeGhX4U86ji3Cc+
         7EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685935067; x=1688527067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aMetwcrs//TXCNHEA0pW9fSv0jcazh9bmNTsbqRNkU=;
        b=cL1xq22PfNUQDIYHLqM0b2rdJOlJoILCHIi65zYsgakGC9nTEINycSyxi2+AEhCVAA
         tFfMQZ16WFZCSKu8sTeYaB3JwQyi+uXgs6y2HZt6WxvJ+YxBvLJGlXOck7D2yVls7e1q
         ELIh1adtsS0v5PQ6lEJECi8O7yeWypkZpLXANOEfrf04iDPCeZFaed+kG+e41mIXMHpv
         fIaVX0y1cmNojm5yJwqlq7Gw+OjOpZM9XnUtXQpGkp67ELTaHrLY0R/ooXaNt2YESUO9
         0d26h1Dc8ldf+wiprkYD0MGfErQpKeNRpw6a/RxTKd30+KqavLBAryDlPTqGoQsYU/L6
         7gUg==
X-Gm-Message-State: AC+VfDzHMEwbl8TiJw67HdhwLhV4va4BVGCV4FcU1IUuvmV78nVit5e+
        UdX4XZW7aS0ypkZx01/mON0=
X-Google-Smtp-Source: ACHHUZ7iRL6grHx8Dac+vN6c6jM+ap+mvvqPm/e4O0p1JmbMreSBJw6lZiZoP3S5Wg0TScQrYPx2WA==
X-Received: by 2002:a17:90a:194:b0:259:43ec:1a6 with SMTP id 20-20020a17090a019400b0025943ec01a6mr2387419pjc.17.1685935066633;
        Sun, 04 Jun 2023 20:17:46 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-4.three.co.id. [180.214.233.4])
        by smtp.gmail.com with ESMTPSA id j11-20020a17090a318b00b0025393752cd5sm14740556pjb.1.2023.06.04.20.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 20:17:46 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 0A53F106291; Mon,  5 Jun 2023 10:17:42 +0700 (WIB)
Date:   Mon, 5 Jun 2023 10:17:42 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 4/4] Document an example of how the tunables relate in
 dm-integrity.
Message-ID: <ZH1T1hK1CzHhhNuo@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-5-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qoyQOOMAMXl/9xUL"
Content-Disposition: inline
In-Reply-To: <20230604190604.4800-5-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--qoyQOOMAMXl/9xUL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 12:06:04PM -0700, Russell Harmon wrote:
> For example, on a device using the default interleave_sectors of 32768, a
> block_size of 512, and an internal_hash of crc32c with a tag size of 4
> bytes, it will take 128 KiB of tags to track a full data area, requiring
> 256 sectors of metadata per data area. With the default buffer_sectors of
> 128, that means there will be 2 buffers per metadata area, or 2 buffers
> per 16 MiB of data.

Again, the patch description duplicates diff content.

--=20
An old man doll... just what I always wanted! - Clara

--qoyQOOMAMXl/9xUL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH1T1gAKCRD2uYlJVVFO
o3iyAQDwoPhoPAvgul4DiPijeirtGcmdlL0kovm9Uu1PDS11XQD6A5b3RZrZNq5i
o/EK1clwCzBXe1Au9n0C5RC80JAp+wc=
=rRde
-----END PGP SIGNATURE-----

--qoyQOOMAMXl/9xUL--
