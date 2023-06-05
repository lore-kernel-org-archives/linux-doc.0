Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAECC7EE2C
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 03:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjFEDDp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 23:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjFEDDm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 23:03:42 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC97A9
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 20:03:40 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-655fce0f354so542020b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 20:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685934220; x=1688526220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mWdcdMrnJAiS6RTXwcszHE76XJTG3Hdf8nB/jbpd3sE=;
        b=J386yKEwjWsTGr1SbV3Ja8Z805ivZdzva5NzDs7tBoQVI1oi0HhhrZtRZ+Vk/4Dz7L
         /EW4q8/Jed+WffG1iGFesxZLE/L61lChNGEAW6LXtSCP3NiMpa49BTb+2oE7X8asJRuo
         DCWZ3YXG4bnhyW5Mei2eocE+Xi1y/epfQTnTDj7qR5l0NnJgMfZi9DZIKxfuQ8bgqPto
         DkpiPT7h1tfx8TLdimAcZ1I9r4vgVAN/DBYraZk6kGguPoFNLV0J5iee18SSI9wXRuzY
         ato+7fTxg94KTnZhku3t8M1ORe71cUyJe/M8sd9h0OMdRA/qSpAaf9c1Q2k1R+5XFLQB
         oJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685934220; x=1688526220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWdcdMrnJAiS6RTXwcszHE76XJTG3Hdf8nB/jbpd3sE=;
        b=MpO8ZYHJpiC1Uj8ySKbY82s+I78isk0rUQm9Tg+3UBzrNjyiqVxJyzOGz0SYyM/LZy
         EJI3DXVrb+BvOFuCm5MPcMtPgAy4Jj01b/E7841fr+bRJ3FONfa146xf/h6DxuFl2IGw
         QVPoBZNyYl9EJ83q3F059+OKqwhIFEf/QzXnV9EOin7txeUixBomWSW8fWgdsrBaC4nN
         ugZgayiUoUqoH9AtLnQgIpuE0RQwmM3QXcVs/AlMEzOHwzx+4Rw5NFRERK5mAA5FyXeK
         2IiyDfePIXqcZXm8Fa0G4o+UlHI6K2QAk/2st8+8AyIrCp9ojvxg/7pILE0jd9Jqypz0
         Atcw==
X-Gm-Message-State: AC+VfDx/ro4374vor8lxDDZ0eVf6nqyZr89XXEVk8Af7om3hKR3xxw7G
        0A8u+LA2OQfCrFAZPnbUrtY=
X-Google-Smtp-Source: ACHHUZ5dLXDuCWKOvSzBoUeuxSbRiWl1XIV1WVcIvw22mJXmktHBWwuzPd0rErU3hgWNKOnUXQDe0w==
X-Received: by 2002:a05:6a20:6a29:b0:10f:7abd:fe5e with SMTP id p41-20020a056a206a2900b0010f7abdfe5emr1706724pzk.40.1685934220141;
        Sun, 04 Jun 2023 20:03:40 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-4.three.co.id. [180.214.233.4])
        by smtp.gmail.com with ESMTPSA id jh9-20020a170903328900b001ae6fe84244sm5305566plb.243.2023.06.04.20.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 20:03:39 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 662B41061BF; Mon,  5 Jun 2023 10:03:35 +0700 (WIB)
Date:   Mon, 5 Jun 2023 10:03:35 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] Fix minor grammatical error in dm-integrity.rst.
Message-ID: <ZH1Qh90x9ncsBTik@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-2-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z3sn9xHmM8qUPI9d"
Content-Disposition: inline
In-Reply-To: <20230604190604.4800-2-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Z3sn9xHmM8qUPI9d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 12:06:01PM -0700, Russell Harmon wrote:
> "where dm-integrity uses bitmap" becomes "where dm-integrity uses a
> bitmap"

Do you refer to one bitmap or uncountable bitmaps?

I'm confused...

--=20
An old man doll... just what I always wanted! - Clara

--Z3sn9xHmM8qUPI9d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH1QfgAKCRD2uYlJVVFO
o/gpAP9RK9WaR4BvjyBdNTLm1Kzc1nL90zNY2tiFSqbcge/AYQEAgG9dzN/yqqoQ
Ij6oURSY8AgZdiio9UHtbtzcqObi/AI=
=JT5b
-----END PGP SIGNATURE-----

--Z3sn9xHmM8qUPI9d--
