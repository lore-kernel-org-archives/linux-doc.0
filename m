Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1931C76196
	for <linux-doc@archiver.kernel.org>; Fri,  7 Apr 2023 23:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjDGXOH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Apr 2023 19:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjDGXOE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Apr 2023 19:14:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFB711C
        for <linux-doc@vger.kernel.org>; Fri,  7 Apr 2023 16:14:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q16so56058825lfe.10
        for <linux-doc@vger.kernel.org>; Fri, 07 Apr 2023 16:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680909239; x=1683501239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLCKLoInrHAdRrt/0I6H7kvsHh1I3smFNdrczzyqv/Q=;
        b=1BVMFc6cnJvNZ3RCGog/TgUAVTShIApspugpWbu7eb5NWMCf7pwShOSSgxqtalstr7
         /5oEqJlSLieSR/6Fbv9vqMSMmsb7NEJiC1iv1Sl8e8N5TRv6Kgmgs2RNyOtD/3+lS/HB
         VC0jNqy85O2whn7VfMZxF1x5AuNlf45ENRtquDzLd3lJ72FprgdTNqXMSC66Bkz5kraO
         5sH4rcSJ8RwJREALKSNnUUEjeiYuMBnaHqHe+Yzew0lJll7GhNquiEhAg7iHbYkgiLOR
         8tZTJrI9uxuOzfAplYHdH5oerDH1tIxhUTEqK9hp5AvToRNly5zYVQ9c2uoXtwMPlZMQ
         Npog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909239; x=1683501239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLCKLoInrHAdRrt/0I6H7kvsHh1I3smFNdrczzyqv/Q=;
        b=Q6WadXfO8Wbra5y67p0/cb/wg/RSb79mRNO9QtuNi4rsGkK9g4WASxD++UoJbSt/Ji
         z4aVYy3R0nxDZ6ePt+h+jpT1aMCK5hbzkN5FsG+Gl0BJncv6nLZiN0YQWNKK8gITOYj+
         reN71xhdNGFZZJqTZTEScvAd3//6PvvjJ5Juw/npt5UO0DxlnVOTCjx9eO+Tg1xnhHFm
         ZpOU9N+ZNYjfn3/7LSCKO1z9dP2hzWtfv6lJhC2i4RTnPSJX579V1h4Q+MPAse9kA4u+
         ypBFWCZ7qwX5SuuYVdXa/K02+UXX1oJanLEEiKTY7G640E5HNEkV2XJRHSobQ7BFVz9y
         RDsA==
X-Gm-Message-State: AAQBX9dpIoHBSfo1Tf5X/MwuZbXrhA0+vO6/7sP2dIURpIvdCp7rWX8T
        mrvdzvbXsDTfYWV2L/58Ge1hETUNWd0582CKQQAjOg==
X-Google-Smtp-Source: AKy350bzm19IuX0j9iDEEWmFoH1N6yWiSVZDoy915nZ//DbP2dy6HrkAEPcTK3qRSxUvCqRvZzChy9AaY00tladbUn4=
X-Received: by 2002:ac2:54a5:0:b0:4db:5133:59a6 with SMTP id
 w5-20020ac254a5000000b004db513359a6mr1120101lfk.13.1680909239626; Fri, 07 Apr
 2023 16:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230327163203.2918455-1-evan@rivosinc.com> <20230327163203.2918455-3-evan@rivosinc.com>
 <alpine.DEB.2.21.999.2304051354280.19052@utopia.booyaka.com>
In-Reply-To: <alpine.DEB.2.21.999.2304051354280.19052@utopia.booyaka.com>
From:   Evan Green <evan@rivosinc.com>
Date:   Fri, 7 Apr 2023 16:13:23 -0700
Message-ID: <CALs-HstVAGX476SGi_+ct7xxWrBeSE=nGVqckGjm9xo06K-Mww@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] RISC-V: Add a syscall for HW probing
To:     Paul Walmsley <paul@pwsan.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com,
        vineetg@rivosinc.com, heiko@sntech.de,
        Conor Dooley <conor@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Tobias Klauser <tklauser@distanz.ch>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 5, 2023 at 6:57=E2=80=AFAM Paul Walmsley <paul@pwsan.com> wrote=
:
>
> On Mon, 27 Mar 2023, Evan Green wrote:
>
> > We don't have enough space for these all in ELF_HWCAP{,2} and there's n=
o
> > system call that quite does this, so let's just provide an arch-specifi=
c
> > one to probe for hardware capabilities.  This currently just provides
> > m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> > the future.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Folks are already building RISC-V systems with cores that have different
> feature sets inside the same Linux system image - just like some ARM
> vendors are - so it makes sense to pass this information onto userspace.
>
> By the way, Evan, did you intend to update the copyright dates to include
> 2023?

Updated in v6.

>
> Beyond that,
>
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

Thanks, Paul!
-Evan
