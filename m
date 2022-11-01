Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE8BC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  1 Nov 2022 09:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiKAJDk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Nov 2022 05:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiKAJDk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 05:03:40 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEE9E07
        for <linux-doc@vger.kernel.org>; Tue,  1 Nov 2022 02:03:38 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f9so12902991pgj.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Nov 2022 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp+csowDa92K9Gj0Zlh1HwJPe/hGB3+s+A80Tb78+7c=;
        b=PlBnwCFj/devdsxINsouq1TNwqE3Gv2Cf42Gt4oDsBmwhywKBOs0UW41+PzLJyeB/I
         alwC/d8+Rx1OBVva+gPVisQjliGQ9UhP6NJhF6rdpQfNbCPuWnDXrqh8SY4PGEimAjOf
         4UdSWxS3W+0wGX/eaXmgYFf7AzGjsAgu125OI+2Pwg0tvJJP4ouhixL2+G1iyqUXrl3h
         IcQgkE7argHMeHF6uAAaAzinarZAW4TCPwd9bPSS62vb/KCjzT39f1E/xct/IEzquRB8
         P28tm6bbLzYiRrFAgb77qtI0qslEjLedbzSK2onquhZ9uBvDi3e+fnd7UqCPKRsrHV2R
         hHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp+csowDa92K9Gj0Zlh1HwJPe/hGB3+s+A80Tb78+7c=;
        b=hU0WTzoFljkgjtFYTVv0keWtn58olbZFKA1lZiy9WQkYvdfoui5qYO/TjayPm+uRpY
         QHY+AkKOnZn6V26UpY5sS1jFIw6piV8shMjo2cxztDIrY6ErK75eyMC4xrUXlRjekhJS
         +RqvBRZJ+Ovgo041IHxn4SFqBsmQmmnAa+mdGTWOxnuTHfZxMf5kBbwCmrVIfOLQXPKW
         NyO8QBOO7pgJRXiAGRDBgPqrB66IQeaXs4PJRe3gjOQSp/k/Or7af+2bnUWlUoBWgMi5
         aJT+m0oPRgCdt68K3ZKng4vopBWUtK5rTr2RjlhYgHrubtO65JEcpD+1cWUtXRhSME+q
         gHtQ==
X-Gm-Message-State: ACrzQf2nbJhFEJaHElkoMJpGZcsaClUfnO1MfWfOkce4/k+BnxY5x3xQ
        ycPoqWlaYwNK1WmBF80VZeE=
X-Google-Smtp-Source: AMsMyM66rtYVH7/JlJZJMrQXeQVD3xLeP/D4a2pKGRHeo6+m+qYIkLeoSfDNZx+42IS3EyGBZ3i9Bw==
X-Received: by 2002:a05:6a00:4c9c:b0:56b:a9bd:ee4f with SMTP id eb28-20020a056a004c9c00b0056ba9bdee4fmr18822763pfb.35.1667293417505;
        Tue, 01 Nov 2022 02:03:37 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-24.three.co.id. [116.206.28.24])
        by smtp.gmail.com with ESMTPSA id x184-20020a6231c1000000b0056bbd286cf4sm1216532pfx.167.2022.11.01.02.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 02:03:37 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 8C749101AC5; Tue,  1 Nov 2022 16:03:33 +0700 (WIB)
Date:   Tue, 1 Nov 2022 16:03:33 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
Message-ID: <Y2Dg5fYVfhoJmOX3@debian.me>
References: <20221031180230.1420544-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yURbL6TMLgVl+TwT"
Content-Disposition: inline
In-Reply-To: <20221031180230.1420544-1-bjorn@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--yURbL6TMLgVl+TwT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 07:02:30PM +0100, Bj=C3=B6rn T=C3=B6pel wrote:
> +
> +
> +RISC-V Linux Kernel SV57
> +------------------------
> +
> +::
> +
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +      Start addr    |   Offset   |     End addr     |  Size   | VM area =
description
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +                    |            |                  |         |
> +   0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-spa=
ce virtual memory, different per mm
> +  __________________|____________|__________________|_________|_________=
__________________________________________________
> +                    |            |                  |         |
> +   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge=
, almost 64 bits wide hole of non-canonical
> +                    |            |                  |         | virtual =
memory addresses up to the -64 PB
> +                    |            |                  |         | starting=
 offset of kernel mappings.
> +  __________________|____________|__________________|_________|_________=
__________________________________________________
> +                                                              |
> +                                                              | Kernel-s=
pace virtual memory, shared between all processes:
> +  ____________________________________________________________|_________=
__________________________________________________
> +                    |            |                  |         |
> +   ff1bfffffee00000 |  -57    PB | ff1bfffffeffffff |    2 MB | fixmap
> +   ff1bffffff000000 |  -57    PB | ff1bffffffffffff |   16 MB | PCI io
> +   ff1c000000000000 |  -57    PB | ff1fffffffffffff |    1 PB | vmemmap
> +   ff20000000000000 |  -56    PB | ff5fffffffffffff |   16 PB | vmalloc/=
ioremap space
> +   ff60000000000000 |  -40    PB | ffdffffeffffffff |   32 PB | direct m=
apping of all physical memory
> +   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan
> +  __________________|____________|__________________|_________|_________=
___________________________________________________
> +                                                              |
> +                                                              | Identica=
l layout to the 39-bit one from here on:
> +  ____________________________________________________________|_________=
___________________________________________________
> +                    |            |                  |         |
> +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules,=
 BPF
> +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> +  __________________|____________|__________________|_________|_________=
___________________________________________________

The memory layout figure above should have been in table format (it is
written as such, isn't it?):

---- >8 ----

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-lay=
out.rst
index 35f76798b6e41b..f87b63a0cc9cfa 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -102,34 +102,32 @@ RISC-V Linux Kernel SV48
 RISC-V Linux Kernel SV57
 ------------------------
=20
-::
-
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-      Start addr    |   Offset   |     End addr     |  Size   | VM area de=
scription
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-                    |            |                  |         |
-   0000000000000000 |    0       | 00ffffffffffffff |   64 PB | user-space=
 virtual memory, different per mm
-  __________________|____________|__________________|_________|___________=
________________________________________________
-                    |            |                  |         |
-   0100000000000000 | +64     PB | feffffffffffffff | ~16K PB | ... huge, =
almost 64 bits wide hole of non-canonical
-                    |            |                  |         | virtual me=
mory addresses up to the -64 PB
-                    |            |                  |         | starting o=
ffset of kernel mappings.
-  __________________|____________|__________________|_________|___________=
________________________________________________
-                                                              |
-                                                              | Kernel-spa=
ce virtual memory, shared between all processes:
-  ____________________________________________________________|___________=
________________________________________________
-                    |            |                  |         |
-   ff1bfffffee00000 |  -57    PB | ff1bfffffeffffff |    2 MB | fixmap
-   ff1bffffff000000 |  -57    PB | ff1bffffffffffff |   16 MB | PCI io
-   ff1c000000000000 |  -57    PB | ff1fffffffffffff |    1 PB | vmemmap
-   ff20000000000000 |  -56    PB | ff5fffffffffffff |   16 PB | vmalloc/io=
remap space
-   ff60000000000000 |  -40    PB | ffdffffeffffffff |   32 PB | direct map=
ping of all physical memory
-   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan
-  __________________|____________|__________________|_________|___________=
_________________________________________________
-                                                              |
-                                                              | Identical =
layout to the 39-bit one from here on:
-  ____________________________________________________________|___________=
_________________________________________________
-                    |            |                  |         |
-   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, B=
PF
-   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
-  __________________|____________|__________________|_________|___________=
_________________________________________________
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  |    Start addr    | Offset |     End addr     |  Size   | VM area descr=
iption                                          |
+  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
+  | 0000000000000000 |    0   | 00ffffffffffffff |   64 PB | user-space vi=
rtual memory, different per mm                  |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | 0100000000000000 | +64 PB | feffffffffffffff | ~16K PB | ... huge, alm=
ost 64 bits wide hole of non-canonical          |
+  |                  |        |                  |         | virtual memor=
y addresses up to the -64 PB                    |
+  |                  |        |                  |         | starting offs=
et of kernel mappings.                          |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  |                              Kernel-space virtual memory, shared betwe=
en all processes:                               |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff1bfffffee00000 | -57 PB | ff1bfffffeffffff |    2 MB | fixmap       =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff1bffffff000000 | -57 PB | ff1bffffffffffff |   16 MB | PCI io       =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff1c000000000000 | -57 PB | ff1fffffffffffff |    1 PB | vmemmap      =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff20000000000000 | -56 PB | ff5fffffffffffff |   16 PB | vmalloc/iorem=
ap space                                        |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ff60000000000000 | -40 PB | ffdffffeffffffff |   32 PB | direct mappin=
g of all physical memory                        |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ffdfffff00000000 | -8 PB  | fffffffeffffffff |    8 PB | kasan        =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  |                                   Identical layout to the 39-bit one f=
rom here on:                                    |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ffffffff00000000 | -4 GB  | ffffffff7fffffff |    2 GB | modules, BPF =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+
+  | ffffffff80000000 | -2 GB  | ffffffffffffffff |    2 GB | kernel       =
                                                |
+  +------------------+--------+------------------+---------+--------------=
------------------------------------------------+

However, for consistency, other similar figures should also be converted
to tables (as separate patch).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--yURbL6TMLgVl+TwT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY2Dg5QAKCRD2uYlJVVFO
oyoHAQDSvuixaPsTu33sJAg6+XOwOCjsAT9k0V97zVoeWcDVWwD/TSOkf07TlUXD
TPktqmAI6ey9cx5GFTqFoUnqWP2GQAk=
=u90+
-----END PGP SIGNATURE-----

--yURbL6TMLgVl+TwT--
