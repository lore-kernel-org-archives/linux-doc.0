Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A7EC77B7C
	for <linux-doc@archiver.kernel.org>; Fri, 12 May 2023 07:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240145AbjELHey (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 May 2023 03:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240133AbjELHet (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 May 2023 03:34:49 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6CA18C
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 00:34:48 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-52c759b7d45so8732029a12.3
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683876888; x=1686468888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wIRjY786zvxHY4a6mypqKOsHPyDd4PJQ/fnVBHIkgIA=;
        b=aNzVR+8YB8YUtiHjnUFUPvgMX3BD7qoEfFK9TLENtusFTp7HV0wXEM7EIggTIdhlcc
         mrpy2+7apUuY0RJgZVnmYBQUJC2rmFSp0UuVBGEOeayBUWEGI7zrATvVsDNMgja7TvlM
         TeXgNH5jSh/IX/Z4NLw8vIe4aN4Ijf7lcoyVJ5KbaO3plBepI0gLIR8rrBAe4+hbeEOC
         mAh+fbBdmTIOtkUi7RZcKB+YJ2rrMm4zExcBEF+KPLVgd1riqw38GTSVBUeipu7TnAZi
         2AzRVRAbcyDV5jBS2r4ORgK4Pia4YfMZvgavOB46HYy7aEqjc4epdbu4UxN0u1AcszP0
         MKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683876888; x=1686468888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIRjY786zvxHY4a6mypqKOsHPyDd4PJQ/fnVBHIkgIA=;
        b=icoy5MD5NyK369v6Ipbzz2/6ZcnnLQe9m3k/GBa6txQfFAlnWn93WhAJMMZaed1m32
         +BIgnlRPUJ3IWUOGCr6saryNOx0v3CgkvFLRzIk4QnL9EjPm6VRRFSxzir0Rh5zMR+iT
         6q6qxOZDVJai4E/Gap3spPKJ0hqWy/zIWHuwR2LjUZdesix+wu6Ae56T0Z+mvUwhVxa7
         D6Z3Yxn7YQxyaQKiZEnsXQP2sFvwsnMbFKCNF0kSo2xFQiaxKyJ8Agf2MLdeLr4Kio1y
         nPm0KPx0SA+pkrZWfC7fCKC6gqzoqeOIf1Wfl+X6uTysqpOqqQNktIPrFbM+P8rJrVix
         wGjQ==
X-Gm-Message-State: AC+VfDw+KOuOY0ZYfYF/euPjVn3VRlrO31cFfUQrs+varAwD23VZ8U/Q
        74/gsXCZMJ3dDFR0RicE8nI=
X-Google-Smtp-Source: ACHHUZ4/B6yl59yow1dccbA41qFTinpfoMiG3tNG5p197qsc2qLIA3buPeon3TmdVwUgFAx3ZATP4A==
X-Received: by 2002:a17:902:e881:b0:1ac:83d1:9269 with SMTP id w1-20020a170902e88100b001ac83d19269mr20372601plg.16.1683876888213;
        Fri, 12 May 2023 00:34:48 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-8.three.co.id. [116.206.28.8])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902728d00b001a217a7a11csm4159210pll.131.2023.05.12.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 00:34:47 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 384F6106AFF; Fri, 12 May 2023 14:34:43 +0700 (WIB)
Date:   Fri, 12 May 2023 14:34:43 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Vineeth Pillai <vineeth@bitbyteword.org>
Cc:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Documentation: sched/deadline: Update GRUB
 description
Message-ID: <ZF3sE5XJATIgoTUM@debian.me>
References: <20230511014625.3443409-1-vineeth@bitbyteword.org>
 <20230511014625.3443409-2-vineeth@bitbyteword.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T4eTZ9Uy2DBX2fAI"
Content-Disposition: inline
In-Reply-To: <20230511014625.3443409-2-vineeth@bitbyteword.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--T4eTZ9Uy2DBX2fAI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 09:46:25PM -0400, Vineeth Pillai wrote:
> Update the details of GRUB to reflect the updated logic.
>=20
> Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>

You seems forgetting my Reviewed-by: from v1 [1], so I give it again:

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

[1]: https://lore.kernel.org/linux-doc/b97d63e4-0ff7-720b-30d7-ad27611e9a8c=
@gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--T4eTZ9Uy2DBX2fAI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZF3sDgAKCRD2uYlJVVFO
o2wKAP0fpSZGlIP2NpYWPg0NRig8bMo7UYSu54pfUhFZ7xt1EQEAvytaBBfTAH+L
G8L+cfY4owqKIIMi9uwCjqpALRjRcQU=
=IID7
-----END PGP SIGNATURE-----

--T4eTZ9Uy2DBX2fAI--
