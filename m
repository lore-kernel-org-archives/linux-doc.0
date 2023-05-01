Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB9EC77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 15:34:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjEAPeJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 11:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjEAPeI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 11:34:08 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659DA118
        for <linux-doc@vger.kernel.org>; Mon,  1 May 2023 08:34:05 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ab25e8a4a7so25064731fa.3
        for <linux-doc@vger.kernel.org>; Mon, 01 May 2023 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682955243; x=1685547243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOUg2Qc8aphe+30HNqY5ybX4gjABL3Ib/MKnnLtzDrs=;
        b=cjIapAexQolPOJup6sm/QwTf4sMOe74fhKip8P0hVHqe2uBZV2gPyiY2kmDq94orez
         sQyh4Ypk7uCS74wWWjh+ZaQw6RCHpsvzzGa5WaopghrovB/P1YzkePHy5w1+2tPyfA1p
         IBEJleXckQ7WtwIDpU9iQQ7GnZUDjnkJUVBMqKxSMfYrOSUWOLOcnyPbkUZagObFSuah
         EDpubk2wNji3BPh5mOZ6Lw0kYu8i2t9ZmRT2IFTlx9sf9gFHi44jThiNm97M+AJSnVDk
         tHcK6pC/DuqrJ6BBeQbvepcxHsEUr5nhBYpMZk+IwMe/gd9/vwajrlLLSQZXQtH61Ng2
         i6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955243; x=1685547243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOUg2Qc8aphe+30HNqY5ybX4gjABL3Ib/MKnnLtzDrs=;
        b=JSJCUZxFGB5Je+7f8DS7/Ol/9mO0n+I56ocOJ6HBVAlKAzHjvxv5tAB+EJyURP7G+p
         aoUGjnbQuAtSdc8+O2TVbDB0HYjrs0/IdoSnd/5sH1RxgaOmbO3lv2i7M+//sqBFQgj7
         5BaBxMr6MUDbFwxKAm56uZEaDUw2Nru2PbFiJQTNXcj39lVsq2vOMrbwUG2p6Q9/t+I6
         PZeh5phrn0OhmMwDzTsTa28+H6JNkSeMmZAsv/vHjhfK1WMMXS7tj3qyBAQ705+Rmv9b
         dqjUCQnxDjCc7+2kG4SeQA8JBWmiDWcTBBrig6dF2L5C5bEzQsXRAm0FM3z62qxZv9Kj
         uC6g==
X-Gm-Message-State: AC+VfDxx03TmwO20FM1HUm/gNvFrOwqyh51zc6LVdMAsqh2qPeEdBl9w
        9YQpDPjgwTGESB8+ye4Az3dKSIRw7LJ1PhdY3zqoEA==
X-Google-Smtp-Source: ACHHUZ6IU1u2FvDTXJXMw4IA/nV32AFHoZw5qaY7705jJwaFYxe2yKKPjDwdVUL9OpvJlWKadFzOU1Hesphz9OxjV0k=
X-Received: by 2002:a2e:3c05:0:b0:2a8:c75d:8167 with SMTP id
 j5-20020a2e3c05000000b002a8c75d8167mr3689817lja.4.1682955243666; Mon, 01 May
 2023 08:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230429-gruffly-chrome-fd94628cc5ff@spud> <mhng-8585bbf5-7d6a-4e09-9c5f-8c6f36092b76@palmer-ri-x1c9a>
In-Reply-To: <mhng-8585bbf5-7d6a-4e09-9c5f-8c6f36092b76@palmer-ri-x1c9a>
From:   Evan Green <evan@rivosinc.com>
Date:   Mon, 1 May 2023 08:33:27 -0700
Message-ID: <CALs-HsuxeN4O5VYCRDebs0qLpojTzeafCSkWWEhx0eTqvG9X1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: hwprobe: Expose Zba and Zbb
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Conor Dooley <conor@kernel.org>, aou@eecs.berkeley.edu,
        abrestic@rivosinc.com, ajones@ventanamicro.com,
        coelacanthus@outlook.com,
        Conor Dooley <conor.dooley@microchip.com>,
        heiko.stuebner@vrull.eu, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 29, 2023 at 1:07=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Sat, 29 Apr 2023 06:40:51 PDT (-0700), Conor Dooley wrote:
> > On Fri, Apr 28, 2023 at 12:06:08PM -0700, Evan Green wrote:
> >> Add two new bits to the IMA_EXT_0 key for ZBA and ZBB extensions. Thes=
e
> >> are accurately reported per CPU.
> >>
> >> Signed-off-by: Evan Green <evan@rivosinc.com>
> >>
> >> ---
> >>
> >>  Documentation/riscv/hwprobe.rst       |  7 +++++
> >>  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
> >>  arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++----=
-
> >>  3 files changed, 45 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwp=
robe.rst
> >> index 9f0dd62dcb5d..21f444a38359 100644
> >> --- a/Documentation/riscv/hwprobe.rst
> >> +++ b/Documentation/riscv/hwprobe.rst
> >> @@ -64,6 +64,13 @@ The following keys are defined:
> >>    * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as =
defined
> >>      by version 2.2 of the RISC-V ISA manual.
> >>
> >> +  * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation exte=
nsion is
> >> +       supported, as defined in version 1.0 of the Bit-Manipulation I=
SA
> >> +       extensions.
> >> +
> >> +  * :c:macro:`RISCV_HWPROBE_IMA_ZBB`: The Zbb extension is supporte, =
as defined
> >
> > Why is one EXT_ZBA and the other is IMA_ZBB? You do not use IMA below,
> > so I assume this is a copy-paste mistake.
>
> Looks like it.  Either way this was too late for the current merge
> window, so no big deal.

Copypasta! I'll fix it.
-Evan
