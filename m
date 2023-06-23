Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6B2EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 19:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjFWTBR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 15:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjFWTBQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 15:01:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4519A1FD2
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 12:01:14 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b47742de92so17519371fa.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1687546872; x=1690138872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00/Y6ptXh35aGcl0eDeOuw0hr2DowGhnnzQCBPE2/o0=;
        b=IK507L00753xrSymrZD52v17Z1Yu5+ftbblUBW0TXY0SRqtXDcO8MvJ5dq3lQC/NnM
         eUi1IRDlos3YzYdTtDlOioLr7x8gpQlIu08+R7xjpvHbTyvZaQ9Anc34eN2KUcKTdGNf
         A56xbBUwGMP5vd0wamo/bvV7G/2+swSRuCbhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687546872; x=1690138872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00/Y6ptXh35aGcl0eDeOuw0hr2DowGhnnzQCBPE2/o0=;
        b=QnKIIBClOm6wu3J1yenzaoP1tQGunozhEnAg/yStXMf/mFj3GFardRZ0FPSLw8tQxz
         72UO9vfn5C5Km3rCzKIQzXoWF0zcCBb0ZraJbNe3PN24kU3QFgWpE7xKMIgMl4UU62dI
         ufhb0fWjlxf5qWEnE0fDr8sDzU+FQpfE7Mxe8LsSeI8cjtvmb9A0MgezJ/I551vZPkri
         7juCfyG5cU4eHJIpAm5Alfit1ihIJ2SQzYEHjo9HJXhB9hVo3C7RV02fkhWge1rid15s
         PkHR7IxsDXupL+tdNNLteKQeUv9QyaUrcYT/vZBQt0xpjIrPyQd8FbLndJ2XXTVLAR00
         UIkg==
X-Gm-Message-State: AC+VfDwKd2vf/V8OfVB7bXqF6NlIcTyKaJYMPvkij2NnLOEssLGdAbE1
        mVwf1laDLZGO5wmXrlVj/QP4lye5tfla40qWXaj/
X-Google-Smtp-Source: ACHHUZ6ZOyOCx6Oh8AEg5iMwbZ8jUGBWgHD+lAZfOT7YG84geuqIl15CpywJvjeYJ+eMQPrNCvi/nfGTts5WtZwXc2c=
X-Received: by 2002:a2e:3211:0:b0:2b4:7d83:c807 with SMTP id
 y17-20020a2e3211000000b002b47d83c807mr9418756ljy.50.1687546872091; Fri, 23
 Jun 2023 12:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230623095547.51881-1-alexghiti@rivosinc.com>
In-Reply-To: <20230623095547.51881-1-alexghiti@rivosinc.com>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Fri, 23 Jun 2023 12:01:00 -0700
Message-ID: <CAOnJCUKmwScQtA2E-3L__ixa8+HxjgMqPv1KaXtS4CdBZQ3mSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 23, 2023 at 2:56=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> The bootargs node is also added by the EFI stub in the function
> update_fdt(), so add it to the table.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/arm/uefi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
> index baebe688a006..2b7ad9bd7cd2 100644
> --- a/Documentation/arm/uefi.rst
> +++ b/Documentation/arm/uefi.rst
> @@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the k=
ernel scans for) the
>  following parameters:
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -Name                        Size     Description
> +Name                        Type     Description
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  linux,uefi-system-table     64-bit   Physical address of the UEFI System=
 Table.
>
> @@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mma=
p descriptor format.
>
>  kaslr-seed                  64-bit   Entropy used to randomize the kerne=
l image
>                                       base address location.
> +
> +bootargs                    String   Kernel command line
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>

--=20
Regards,
Atish
