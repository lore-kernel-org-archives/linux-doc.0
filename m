Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7017C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 03:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjFEDIG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 23:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjFEDIE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 23:08:04 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4342BA9
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 20:08:02 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-19f9f11ba3dso4007888fac.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685934481; x=1688526481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmucptkZoDu3+K08LKOsMYAoXOw3eVCfWImOiCZOdF8=;
        b=X+TDiHxfgevZOeX20EHHhoXH2LvvAtjtpoG85idHqVCYPVuM/OgwXjMZ4NHjNJY86Z
         GaQ11IlULLuCY3w1Gmw6vpbm1Z1HEmOf0SYMrWBhWSueRiw0vJkVMbUwfsftq6QSCRC6
         Tx3S4muvvYff4VTGE67lUnpDgScieCAYX8wOGACR0IQxD+bl8RFcwl5u6S9BfU/q0/ym
         pxYuvOuK97Gi2zavSuNFVgJl18kEIujAVrxr3oHASiYn481x6FfxDWJEqH5OHww4BN9Q
         lP9evoAT37Mb64bWXI/e1uGMxM/2mzPZu2FBN5sgap9Bi8uKDmUlae/GHdIfcm4HbL27
         FZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685934481; x=1688526481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmucptkZoDu3+K08LKOsMYAoXOw3eVCfWImOiCZOdF8=;
        b=ODlqZVfgVbKNBEUzPNYfHwnT+1a2dwMkowKqKeUqFuikZ5Ye4PYnnBDeEyelRzO/79
         6BKGUc3k/NYUIhwWDqTWbsvoF1JIRL09hKrk504S+Fjxbzklt9K2p/P8azXdv75ok03A
         ibvw9DN6DPkkKSXKDegnxGt8X8ey3PDbASN6lfVWDJ93O+A9Ptx1bsj1Rr/5XYrhlFV1
         kuGbXzUcQdQ689WpJ/ru7MLoF+lgTxsOaOqud4mPZz4WHjm7r0HhDJ9j4+zz4p5w++Vf
         RPls1hgcYKZpTDDznspwCT0OLGtE3cPQ/Gezu/1aTBme6TmWYwzL3xJ28mMTo30HmYrR
         zdXA==
X-Gm-Message-State: AC+VfDyQAqyjWsqEoEaEAVYE3Dx3merCjLfomrzgIUpj+vg0M00zPQ2W
        B6Gjk1OfPi0hH6nIoIrMJTg=
X-Google-Smtp-Source: ACHHUZ7m72Kp1UdoPnUIdV5YMJ3ZbM2ARYoaAbyUayvanFIB8zvJRCRnKJZXF5okiIpHRPeTIC+3Kw==
X-Received: by 2002:a05:6870:98a6:b0:1a1:2939:3f13 with SMTP id eg38-20020a05687098a600b001a129393f13mr8256009oab.24.1685934481111;
        Sun, 04 Jun 2023 20:08:01 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-4.three.co.id. [180.214.233.4])
        by smtp.gmail.com with ESMTPSA id c3-20020a656183000000b0053b92b26412sm4246493pgv.14.2023.06.04.20.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 20:08:00 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 0E7941061BF; Mon,  5 Jun 2023 10:07:57 +0700 (WIB)
Date:   Mon, 5 Jun 2023 10:07:57 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/4] Documents the meaning of "buffer" in dm-integrity.
Message-ID: <ZH1RjWUfq3Af4fiB@debian.me>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
 <20230604190604.4800-3-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HSFYUBcIsEVvpXlP"
Content-Disposition: inline
In-Reply-To: <20230604190604.4800-3-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--HSFYUBcIsEVvpXlP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 12:06:02PM -0700, Russell Harmon wrote:
> "Buffers" are buffers of the metadata/checksum area of dm-integrity.
> They are always at most as large as a single metadata area on-disk, but
> may be smaller.

Hey, I forgot to mention below.

Where is the subject prefix? The patch title should have been "Documentatio=
n: dm-integrity: Document
buffers".

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--HSFYUBcIsEVvpXlP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZH1RjQAKCRD2uYlJVVFO
o4s9AQDcc+iJrSPFyOxiVtNsDj14f0Sd9tDmnXoUZ7wDxKqPRAEAquh4m8KjN8Cx
crwOHqbq0WwzkHlXZuPC2dSSz1XGmgs=
=lfu6
-----END PGP SIGNATURE-----

--HSFYUBcIsEVvpXlP--
