Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BF0C6FD1C
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 16:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCVQSP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 12:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjCVQSO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 12:18:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C19C46B7
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 09:18:12 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id s8so23848475lfr.8
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679501891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91NUsnI2JWzfZ4bANRRwcZ4orsUryFhVkgWXPdVK98g=;
        b=G2s79NLcITgAksd3/kq8VJtWspJVsPtOCodre7wqiFjOGu3tfqxEGcHiiTKs9xXS8g
         nwTXUK9QA5CbXOAbXfd+kxBIrw8HMUUewNAP0B71MjIkc5fHVCIv6eXxUxjmLljY1lMy
         nkE30ypFZwFDgsjEIjrBSqFee//emPM2Ig3TP9YTWrXf9yzM6JbK4GM1eeXEQybU/PUb
         GETetZGN2DggKxOYhw1jwg4XprUTKPaWloeltxSiG5FYNJUzkEDTjEIvspbM1dRSvjGN
         H9OPDl7W4ebTwMXIsaEPtjILjg0BbMztfI898jPtHg9QT/tZViD2dRCgwc9pBKe78T3J
         uMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91NUsnI2JWzfZ4bANRRwcZ4orsUryFhVkgWXPdVK98g=;
        b=0TTIPC5C0tUuT1egVnUYqJOX1JutkPAShFpGJLbvm0zYajfcMnIQonvqt7FvyZI6tn
         vtgA+/QiZpYzT1BkjertYxve1EBZ3KejxZpCHMC1cfnNQHMShAj5SNyt/2Ks/3RIvklW
         q+fwn1W29y9prBE5sLJENHV4k5v1Z1N6zPg0hPS/1Mr0/RxmwF3nNm7A+OvJobrAgaU0
         R2FTRzejvFq4PpuachUyINqJbMQN7h3kA1G36e0hXEr7LpWuqYPhs6bNSJBnB5jFrzxW
         N9rgOiH8wRCSXLxa6p8tjSreZH0CF3QXGK8xDmNmN+s2MJlRlmkEBfx2wVIs91zeXfrm
         rY0g==
X-Gm-Message-State: AO0yUKUHc9zAd8J3FO2GdIkZqRhIvUV/MqOGAkHaVr0iT2y94uyK0JAN
        5/gsAklKF5BzfR3lSwOFdW9liD3gRzdfki4qTE+0cA==
X-Google-Smtp-Source: AK7set9Y6w1sy23dklqHJdPn+k27VHykRl6SZ39SZtwN0MftCWxQu9UvUwQzQP7Nv3+x+O3Su2kEKylKZtHjHnLlD3Q=
X-Received: by 2002:ac2:41c6:0:b0:4d5:ca43:704a with SMTP id
 d6-20020ac241c6000000b004d5ca43704amr2061085lfi.13.1679501890831; Wed, 22 Mar
 2023 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183220.513101-1-evan@rivosinc.com> <20230314183220.513101-4-evan@rivosinc.com>
 <3351107.e9J7NaK4W3@diego>
In-Reply-To: <3351107.e9J7NaK4W3@diego>
From:   Evan Green <evan@rivosinc.com>
Date:   Wed, 22 Mar 2023 09:17:34 -0700
Message-ID: <CALs-HsuCejsEtS65pH=SBp74V2gw2d2WmkL44muWr6+VSocO5w@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com,
        Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 21, 2023 at 9:41=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Evan,
>
> Am Dienstag, 14. M=C3=A4rz 2023, 19:32:17 CET schrieb Evan Green:
> > We have an implicit set of base behaviors that userspace depends on,
> > which are mostly defined in various ISA specifications.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >
> > Changes in v4:
> >  - More newlines in BASE_BEHAVIOR_IMA documentation (Conor)
> >
> > Changes in v3:
> >  - Refactored base ISA behavior probe to allow kernel probing as well,
> >    in prep for vDSO data initialization.
> >  - Fixed doc warnings in IMA text list, use :c:macro:.
> >
> >  Documentation/riscv/hwprobe.rst       | 24 ++++++++++++++++++++++++
> >  arch/riscv/include/asm/hwprobe.h      |  2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h |  5 +++++
> >  arch/riscv/kernel/sys_riscv.c         | 20 ++++++++++++++++++++
> >  4 files changed, 50 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwpr=
obe.rst
> > index 211828f706e3..945d44683c40 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -39,3 +39,27 @@ The following keys are defined:
> >
> >  * :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimpli=
d``, as
> >    defined by the RISC-V privileged architecture specification.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the=
 base
> > +  user-visible behavior that this kernel supports.  The following base=
 user ABIs
> > +  are defined:
> > +
> > +  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: Support for rv32ima or
> > +    rv64ima, as defined by version 2.2 of the user ISA and version 1.1=
0 of the
> > +    privileged ISA, with the following known exceptions (more exceptio=
ns may be
> > +    added, but only if it can be demonstrated that the user ABI is not=
 broken):
> > +
> > +    * The :fence.i: instruction cannot be directly executed by userspa=
ce
> > +      programs (it may still be executed in userspace via a
> > +      kernel-controlled mechanism such as the vDSO).
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the ext=
ensions
> > +  that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_I=
MA`:
> > +  base system behavior.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_IMA_FD`: The F and D extensions are suppor=
ted, as
> > +    defined by commit cd20cee ("FMIN/FMAX now implement
> > +    minimumNumber/maximumNumber, not minNum/maxNum") of the RISC-V ISA=
 manual.
> > +
> > +  * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as d=
efined
> > +    by version 2.2 of the RISC-V ISA manual.
>
> just wondering, is there a plan on how further extensions should be added=
 this this?
> [as we have this big plethora of them :-) ]
>
> Aka things like Zbb and friends will probably also be relevant to userspa=
ce, so just
> fill up RISCV_HWPROBE_KEY_IMA_EXT_0 with more elements and once full swit=
ch to
> RISCV_HWPROBE_KEY_IMA_EXT_1 , RISCV_HWPROBE_KEY_IMA_EXT_2, etc?
>
> Or do we have some more elaborate sorting mechanism?

That sounds reasonable to me. I tried to think about a couple of
possible sorting patterns, but when I played them out mentally they
were only ever aesthetically pleasing with no technical benefit, and
possibly added technical debt.
-Evan
