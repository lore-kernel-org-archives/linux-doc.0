Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EB6C77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 03:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjEAD6J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 30 Apr 2023 23:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbjEAD5j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Apr 2023 23:57:39 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D89124
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 20:44:32 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a9253d4551so15350705ad.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682912672; x=1685504672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7Lt1ePSiCJmD58+SS4kPwUGSEKnQa+7sMnDRQu80eM=;
        b=ATbHhpBF1Ag6ZYljN1gIg1Tv3ecumW7dIsJs5JqcaMTZnczqc2AyZ1crozSGW6fFYu
         pW2qdkutU/xAzCouzWpbjv88r8kuzCfjVvmcSLRPYaguJEHImWKAlvvoANjha1BhvDnt
         HcJSrx/bvr1EilLq/a9IYTsJZ46Gw1QJvVm2SJ36Q+yW8JLYQxaZ/sPh4zZh09fjIjc8
         uWoRkHb7q3wu84LaSZdtSYKLJS8GS1ZtJNcG+JCfVI+6oR8+eJfgpUxhKZCXjqYhuIwt
         cnB94SlQtKpZM2ugsUaA2WwmwHKbLtCLPurX6xXcOEetpI0vwM0BAEWI80MRDdkssbgc
         sJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682912672; x=1685504672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7Lt1ePSiCJmD58+SS4kPwUGSEKnQa+7sMnDRQu80eM=;
        b=fYWOowcVaRV6JvUFgzDkekA3DrsO57m7z1vVaxoSzCKJ7HiBzVHuskXvzMmZ1c5ynV
         OUPK/bUL3Sk4Fhw4OEFSSpB+SPbRBjfqnvf+wnSTxOgEBR4k+c2Z7//1n4mess5mq1I/
         E+jENcGO5AQ8PxHbrE7LrWp4I78OwpJd5LL6v04Ieir9OGTAeDEcfLcRYx+j+O4AHYIG
         K2DKO5WJNMNclydGINfIRZDezfVFnRZtEs2OsdLqp+0Mzj3mN1fubYlH7kJyBYR/5J0c
         vzKwYPsEsKeJOzZ3Wyr3Mw/zuMsfE0Cjd8FKImKZ1s1VacU7COqZDq5E19bfvsYmubpP
         VamQ==
X-Gm-Message-State: AC+VfDxO3MpcyPcHt3DxInCxHJN0mvkL+lab8dxcFM2N9vMyF5nkMqhM
        xeKa74tnBGIReaoGQ+7HK6/bme9hOZVmnw==
X-Google-Smtp-Source: ACHHUZ4QCClf0Vg359wPek5uZtdcjr70YoiRTzvgtc+Q5zW16+Qd5pGGUvXN4Ppa1fxNngHM0sWyVA==
X-Received: by 2002:a17:903:1208:b0:1a6:6a7c:9fde with SMTP id l8-20020a170903120800b001a66a7c9fdemr13796327plh.14.1682912672007;
        Sun, 30 Apr 2023 20:44:32 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-13.three.co.id. [180.214.232.13])
        by smtp.gmail.com with ESMTPSA id jh22-20020a170903329600b001a5262134d7sm16905510plb.202.2023.04.30.20.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 20:44:31 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 4B7FE10696E; Mon,  1 May 2023 10:44:28 +0700 (WIB)
Date:   Mon, 1 May 2023 10:44:28 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Anup Sharma <anupnewsmail@gmail.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: fix 'make htmldocs' warning in trace
Message-ID: <ZE81nDjXfdyjvaeE@debian.me>
References: <ZE7JRVqg8MoeO73e@yoga>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="08qfAfrgo2H2Ra2N"
Content-Disposition: inline
In-Reply-To: <ZE7JRVqg8MoeO73e@yoga>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--08qfAfrgo2H2Ra2N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 01:32:13AM +0530, Anup Sharma wrote:
> Fix following 'make htmldocs' warnings:
> Documentation/trace/histogram-design.rst:
> WARNING: document isn't included in any toctree
>=20

Already fixed by f2ea95289a79b8 ("docs: trace/index.rst: add
histogram-design.rst"), so obviously this patch doesn't apply.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--08qfAfrgo2H2Ra2N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZE81lgAKCRD2uYlJVVFO
ozGgAP0T9WYZ3qctr5DThNsLUWSrVIy+4mEIyJC3EMx+8H0+KgD/UyppC4sCzVaA
ofPGcCTSvBDZs+EOnfhg2j5w6VoQawQ=
=nNEG
-----END PGP SIGNATURE-----

--08qfAfrgo2H2Ra2N--
