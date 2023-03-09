Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39575C64EC4
	for <linux-doc@archiver.kernel.org>; Thu,  9 Mar 2023 02:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjCICJg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 21:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjCICJa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 21:09:30 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A873DBCFE3
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 18:09:22 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id y10so587974pfi.8
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 18:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678327761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VS3AXIwcRw820RnLjgpGP/BBNGjI+j0Fm4Nh92FrgK8=;
        b=NI8IKNIvRjA2wV7rhsTvraJhLBIh2MIjWNRishIs/2w/AzE8h7ZcOsmiA4EAwyR1Kx
         OPrudqLlKENdhbNqT3qG8onKY8T492+Ui5ZgrHJajJoY6ezB4VTkxWa5QGBHlap9c7lC
         7BAvAOT3Md+FTEpZGPoR1LLZ/lRvQvPsvdvzrrv3oKcAwnTqsdLnMMNtLAKPMUfAFz5c
         99mXtC78VnAxMFSUj1q4PrcGycdgdFPr3jUCfzRp2DYS6GQfOFB81x9cZ3uhcgWBy/68
         YZryvPBRWrQTO9l21OyVApAlu6bbLETGTyR5HhwherSmJNi8N9arqQeLZnB0pZJ1Z4jZ
         C+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678327761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS3AXIwcRw820RnLjgpGP/BBNGjI+j0Fm4Nh92FrgK8=;
        b=0r7AmIeRt5atJdxlgfH8ARY2HJTa3LpA4nATWoizqIoBpqDuXomlsB5pBpTBguyY+I
         D54fxlNbeOcLVYOlIGz7eW7nxxxWPR7i0wM2KgwLqBU1bgjVsf0bh1uLSSJYhQB1R3Tm
         v+qWXDOdHcEf+/qoX5kfCchkntSrwfPpUJQEyyvJpzTTVGFKPoCylCQOZdVdJXHijKcd
         3t724NnnlT7Xk7Cot84lc9t4wCKzzvQvXKhJQU0Vo99ezX76gSpjSAWt1+Aov8cUy9SM
         HgsEVjHtbbCVo+puzu8D1yb1whcWhmI5xz1gECMY5QjySw+qEg1BqeNEtOjnckr+WeFB
         D4kA==
X-Gm-Message-State: AO0yUKXetyuYeIdhu2uezqxMLILkxJtRyfjbWnicFctRhqmadtvEnP2b
        AP5avZ1lGYSnFProoGyI2jE=
X-Google-Smtp-Source: AK7set+C7A3B6QZEqAPJFTVUfTc0XGX8tKvcy9/pUJVio9nDUX9GR/aVwL336tqmMMClCRtxbVEc6A==
X-Received: by 2002:aa7:95a8:0:b0:5a8:5e6d:28d7 with SMTP id a8-20020aa795a8000000b005a85e6d28d7mr16406922pfk.0.1678327761730;
        Wed, 08 Mar 2023 18:09:21 -0800 (PST)
Received: from debian.me (subs02-180-214-232-87.three.co.id. [180.214.232.87])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b005dd98927cc5sm10037028pfh.76.2023.03.08.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 18:09:21 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 021291065B8; Thu,  9 Mar 2023 09:09:18 +0700 (WIB)
Date:   Thu, 9 Mar 2023 09:09:18 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH -v3] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
Message-ID: <ZAk/ztzvvljtUSbu@debian.me>
References: <20230308190403.2157046-1-tytso@mit.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ax6hxieRVdQn5Y9b"
Content-Disposition: inline
In-Reply-To: <20230308190403.2157046-1-tytso@mit.edu>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Ax6hxieRVdQn5Y9b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 02:04:03PM -0500, Theodore Ts'o wrote:
> As a follow-up to a discussion at the 2021 Maintainer's Summit on the
> topic of maintainer recruitment and retention, the TAB took on the
> task of creating a document which to help companies and other
> organizations to grow in their ability to engage with the Linux Kernel
> development community, using the Maturity Model[2] framework.
>=20
> The goal is to encourage, in a management-friendly way, companies to
> allow their engineers to contribute with the upstream Linux Kernel
> development community, so we can grow the "talent pipeline" for
> contributors to become respected leaders, and eventually kernel
> maintainers.
>=20

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Ax6hxieRVdQn5Y9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZAk/zQAKCRD2uYlJVVFO
ow7+AQCKAOAwQn2c7/KXx7LaPfmv5sS21Lrb3pGbArzTwEhAjwD+PCIUCoc4/PcJ
SGZLFmdCgB1zy9oawK2O5IsjH/mTRQU=
=iuKl
-----END PGP SIGNATURE-----

--Ax6hxieRVdQn5Y9b--
