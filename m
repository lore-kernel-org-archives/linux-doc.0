Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89EFEB64DA
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jul 2023 15:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjGEPwF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 11:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbjGEPwE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 11:52:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED672173B
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 08:52:02 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f96d680399so10484208e87.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688572321; x=1691164321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkUoG+L6Gc/FljCZD/tXYCRllz67Rh2nIbBivClEET0=;
        b=CbnZ3gwfvWWXIIghXULsz6NIP5rnHhM0x78jL+4sIHTjvJeU3DzIlDuIl2Mh31YhRX
         jWmZHVwr/K5jAhyLoKLUWJw1HTq+f1d6YifnbeLqsQj1TN9pHZ2UvXjceftWXXqZ2H8C
         R/Ebm9bWLFlbb/GpueRSSCueHI5XyOjn8x+HjPBU9E6Gh7lN6NvcEqCfsHFZPEo6hR0Z
         np9VLqPcHy/P7eSvTV4qu45BVbxs+pyB3zUyReQK4UmWVF1v6Hw1Q7+RJEuF0Rc6hA6+
         MGEl8ChtNFAgO8RLF1Ln3YEfPhoQpsFjgWDkfAxkCAtYY+qrIZAa8soBmUDkkNVdTge8
         fHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572321; x=1691164321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkUoG+L6Gc/FljCZD/tXYCRllz67Rh2nIbBivClEET0=;
        b=fKTscZ9i9q4NQsi37/XJkQ2OFXBfrV6SPKVmF5ZFsgFs4g57cVcpieh5nljcWQ8NZ3
         E/3FVqIDcwqIi8OR8SYe+AoD/TiLh2ids7uMe8l6K/XE6COBG1mP9T9ydMS7HLhHtCIz
         X688Wex8GLeRdglt5gzF6sYC0RWPjirgFaOwuM6KzpCFms16Y9OvhcQA26uMSnF/7SE8
         F5OlZQ3O1eUBONVPwcLh2lKMk7d9n4L4ro6jOkcb9qHlgH2uOHTkPeK4xe+zQjUfXRhO
         pS01zj7h71oZq4pEArm+bjKnCM5RmkELMEWej2jh01xqFmPWVH5WA3+PsiayS1I9yn7T
         dWmQ==
X-Gm-Message-State: ABy/qLaiL0l5Vve6pfezPcf1oD0qLYf9cCujFF7turBqB1TZlAXpWKj6
        PdG6ydLkTYMyDAnFGQ2iDMJVMKa58lufLjFqGhOS3A==
X-Google-Smtp-Source: APBJJlGKbai8gXpDr4vYUvG8VdKZTo2aCyZEqSPqFeRVC2rVuqdMSLQvBrXDRqYUxwFk4YRBiOa9ouocg7839t3sPDk=
X-Received: by 2002:a05:6512:3da5:b0:4f8:6e6e:3f42 with SMTP id
 k37-20020a0565123da500b004f86e6e3f42mr18675814lfv.14.1688572320599; Wed, 05
 Jul 2023 08:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy> <20230703-girdle-underling-880f633c4c73@wendy>
In-Reply-To: <20230703-girdle-underling-880f633c4c73@wendy>
From:   Evan Green <evan@rivosinc.com>
Date:   Wed, 5 Jul 2023 08:51:24 -0700
Message-ID: <CALs-Hsua+Y9EvZAz0vX=2-2MmuOcnZQ8zYyiZP+2Y873mEgQeQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] RISC-V: Provide a more helpful error message on
 invalid ISA strings
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     palmer@dabbelt.com, conor@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Jones <ajones@ventanamicro.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 3, 2023 at 3:29=E2=80=AFAM Conor Dooley <conor.dooley@microchip=
.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Right now we provide a somewhat unhelpful error message on systems with
> invalid error messages, something along the lines of
>
>         CPU with hartid=3D0 is not available
>         ------------[ cut here ]------------
>         kernel BUG at arch/riscv/kernel/smpboot.c:174!
>         Kernel BUG [#1]
>         Modules linked in:
>         CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00096-ge0097d2c=
62d5-dirty #1
>         Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>         epc : of_parse_and_init_cpus+0x16c/0x16e
>          ra : of_parse_and_init_cpus+0x9a/0x16e
>         epc : ffffffff80c04e0a ra : ffffffff80c04d38 sp : ffffffff81603e2=
0
>          gp : ffffffff8182d658 tp : ffffffff81613f80 t0 : 000000000000006=
e
>          t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81603e8=
0
>          s1 : 0000000000000000 a0 : 0000000000000000 a1 : 000000000000000=
0
>          a2 : 0000000000000000 a3 : 0000000000000000 a4 : 000000000000000=
0
>          a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff816148b=
0
>          s2 : 0000000000000001 s3 : ffffffff81492a4c s4 : ffffffff81a4b09=
0
>          s5 : ffffffff81506030 s6 : 0000000000000040 s7 : 000000000000000=
0
>          s8 : 00000000bfb6f046 s9 : 0000000000000001 s10: 000000000000000=
0
>          s11: 00000000bf389700 t3 : 0000000000000000 t4 : 000000000000000=
0
>          t5 : ffffffff824dd188 t6 : ffffffff824dd187
>         status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000=
000000003
>         [<ffffffff80c04e0a>] of_parse_and_init_cpus+0x16c/0x16e
>         [<ffffffff80c04c96>] setup_smp+0x1e/0x26
>         [<ffffffff80c03ffe>] setup_arch+0x6e/0xb2
>         [<ffffffff80c00384>] start_kernel+0x72/0x400
>         Code: 80e7 4a00 a603 0009 b795 1097 ffe5 80e7 92c0 9002 (9002) 71=
5d
>         ---[ end trace 0000000000000000 ]---
>         Kernel panic - not syncing: Fatal exception in interrupt
>
> Add a warning for the cases where the ISA string isn't valid.  It's still
> above the BUG_ON cut, but hopefully it's at least a bit easier for users.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
