Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1DBC636D4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 22:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjBOWnr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Feb 2023 17:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjBOWnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Feb 2023 17:43:45 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5FF24134
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 14:43:43 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bu23so175912wrb.8
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 14:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nXdn4YzDoM0iF73Zmjo9+E9vHioH6H+aNis+Nm9tKQ=;
        b=PQnDiG2mGCPp4v/7j0ZmtNBwITcIvFmkjw5yT5SMk5SXcMwDq890BR6Kziw95pom06
         YSykh6oEIJ0xmLwL2LHzbZe5lO9Kxrqk5hoR1p4A7FuSErCF2tsxCsPXX/SExNetMDJi
         Q6tZ/1FEnacXaWUontH2YRie6Ae1jT+D2/961qfdOACLHNTzWlaDHzs3RVEThl6GJDxG
         gpZp7DjYRE/JjFy81ePgsBWSRdwz1k0ESwtNXiChzw+ozgUpLlKgrp2jtPeY2zJqGstA
         vPjF3V5yLb8Udr1GEnH+Bwi3Z2jH/3nUsHFWjJ0QhoQ57LcncKTnTSZPZstEdGIfVqgk
         6iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nXdn4YzDoM0iF73Zmjo9+E9vHioH6H+aNis+Nm9tKQ=;
        b=1Y2tSX45oWloEb9nna3lHHsjFQFtqjdg0z9bOPwqOCc5yMyoFOgQZdXklyLvg1bCRv
         TzKa0tM+jwUEIsmc7eyvkDKrCI7YMAp7a0RJL6Qqi4u+veCITQdwIekRbLGliajBNUFA
         9KmIJ++h1xqR7936ebhVumgUArCw0/Zf2mW6e3k2upDT7GPpQwN1Ey374tKuv8WTLWp/
         PuZBoptoj5XdmE/oMUaGo4G3t8INuTojMZMWqgGmk9wH6WwRM7S0z7+HaMWUJmcl51VW
         tRRpBGZ80VXJdzS1jjbEbISCiOpjoTgLZ5eJnkGxlRuqeYypg4Myae1GIc8WJ0j/bLg1
         Sr9A==
X-Gm-Message-State: AO0yUKXCiDwc6npEjElFaxKICXZYe3AbbgOnLm3lEkoOWvgn91+yFiSF
        tdBaWqN1kYgRdntWir19/DCb2w==
X-Google-Smtp-Source: AK7set98K5jOTFHXvTnJFhewS8kQNi6s1VNOzQfcaEUH0oYmf+Z3IJxRq5HqzV+LOohnSOiuZeHFjA==
X-Received: by 2002:adf:e4c9:0:b0:2c5:7c7a:78f7 with SMTP id v9-20020adfe4c9000000b002c57c7a78f7mr239350wrm.45.1676501021541;
        Wed, 15 Feb 2023 14:43:41 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d6dcf000000b002c3f9404c45sm16991637wrz.7.2023.02.15.14.43.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2023 14:43:41 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
Date:   Wed, 15 Feb 2023 22:43:40 +0000
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        linux-doc@vger.kernel.org,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        "Conor.Dooley" <conor.dooley@microchip.com>,
        Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tobias Klauser <tklauser@distanz.ch>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Vineet Gupta <vineetg@rivosinc.com>,
        Dao Lu <daolu@rivosinc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Ruizhe Pan <c141028@gmail.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6FA7F803-1B4A-418E-9368-E205F3A6CF27@jrtc27.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
 <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
To:     Evan Green <evan@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 15 Feb 2023, at 21:14, Evan Green <evan@rivosinc.com> wrote:
>=20
> On Wed, Feb 15, 2023 at 1:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>=20
>> On Mon, Feb 6, 2023, at 21:14, Evan Green wrote:
>>> We don't have enough space for these all in ELF_HWCAP{,2} and =
there's no
>>> system call that quite does this, so let's just provide an =
arch-specific
>>> one to probe for hardware capabilities.  This currently just =
provides
>>> m{arch,imp,vendor}id, but with the key-value pairs we can pass more =
in
>>> the future.
>>>=20
>>> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> Signed-off-by: Evan Green <evan@rivosinc.com>
>>=20
>> I'm not sure I understand the problem with
>> AT_HWCAP. While the bits in AT_HWCAP and AT_HWCAP2
>> are limited, I don't see us running out of new
>> AT_* words to use for additional bits. Presumably
>> the kernel would already have to know about the
>> name of each supported HW feature and could assign
>> a unique bit number to them.
>=20
> Palmer can probably speak to this with more authority, but my
> understanding about the motivation for an approach like this goes
> something like:
> * With the nature of RISC-V, we expect a lot of these types of bits
> and bobs, many more than we've seen with the likes of x86 and ARM.

We=E2=80=99re already at (I think) 51 standard user-level extensions =
that LLVM
knows about.

> * We also expect in some cases these values to be inconsistent across =
CPUs.

That=E2=80=99s also true of some Arm SoCs.

> * While we could copy all that data into the aux vector every time,
> it starts to look like a lot of data, not all programs care about all
> of it, and a lot of it is static, making all the copying wasteful.

Bitvectors are pretty cheap, this is negligible.

> * Another option that would solve most of this would be to point to a
> vDSO data area from the aux vector. This solves the copy complaints,
> but makes that vDSO data ABI, and requires it all to be known up
> front.

That doesn't seem like a huge deal, other than my usual point of
needing a standardised portable cross-platform API for this, so that
shouldn=E2=80=99t be =E2=80=9Cthe=E2=80=9D generic interface programmed =
against by applications.

> * So, a syscall with a vDSO function in front of it seemed like a
> good combination of speed and flexibility.
>=20
> You're certainly right that HWCAPn would work for what we're exposing
> today, so the question probably comes down to our relative predictions
> of how this data will grow.

The other big problem is vendor extensions.

Jess

> -Evan
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

