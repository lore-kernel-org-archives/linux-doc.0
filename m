Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED253C636CC
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 21:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjBOVO4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Feb 2023 16:14:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBOVO4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Feb 2023 16:14:56 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE74D7
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 13:14:55 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so320578lfv.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 13:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1gQtmlRBhpSJ40ajJoTyktY/WnEFbQ+Gi+issmQ3qU=;
        b=ZKZR82o1JYYe14j7LfX/wQTXfDrD3ih0AoR7f+3SDLTKATYgPzCMEAUnUkZzUA/+DX
         QWYoRJG/TGiaTqb34QpT1WfKCZ+eYENcPkPiWeQE7I4AmUrCHVzeMVU25cDCmexT5f4C
         1MOqUXvdkIhjDry1uM4ZR3ro2TI1L+F3IIiDJR8PIKsSF9ppE9FVhBsJmB7r0yuzvcc3
         7wyHq/J4YfGovrsD+GApWNFljd6GXYMtkfdw+saKP7bI7kOWawLukydV6eXrxa9xQfTZ
         9DxhRkVheK33LhW5CHDzJxkOzthCn81C82GL+SUnsDy0yK3zfDp+g0sBT9AJUI3y2cPN
         kVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1gQtmlRBhpSJ40ajJoTyktY/WnEFbQ+Gi+issmQ3qU=;
        b=NZIEyIT5FJqzrZzBCBq99ZBLwcOfPkNHHInFe4cFUTo8Nz749T3PHX1LlefMj8/Ur5
         55yNnLmXxRFSttYPQhljFw7CIjNTNtck7UKLkX9OiqeSfuHscwHzMUmiXBow0byN2YfM
         lP9SeNjkbxI83cAaBm/+36jIoj3ftuCny3zakmgttMI5MvLZQMQ8211L6GiAXGWdJN3W
         poB+dG1CdGjKrj5VcME/Bt3qnkUwgY0+pqO2qJQePDXE+dadZtlvzRW4R+tH0E322GDm
         jV9KwBwyS5+x7pmpbXIxjSjrNhk+Xb1Ma0nyZyWuxLFmNJ2V/l1NveVI77ShkHOvbzI+
         41zg==
X-Gm-Message-State: AO0yUKXJ7wsRgSUS4dI4sjyCOxO9NHEVqoD8H5gPlJp/9KJoyDD0N5zY
        49SZlCBo4lHuU57PktuSzXbKKwJaSlo0BCai7VtkGQ==
X-Google-Smtp-Source: AK7set9HNLqLqmvl/qQOOm2AvS5tnhyFklJKHOM0CSXZu5uWUVPpDBcsV7m40liFRQynQZO4GW6u4p+S+8fNfafnfzs=
X-Received: by 2002:ac2:43b9:0:b0:4db:182b:2d74 with SMTP id
 t25-20020ac243b9000000b004db182b2d74mr1004018lfl.9.1676495693301; Wed, 15 Feb
 2023 13:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
In-Reply-To: <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com>
From:   Evan Green <evan@rivosinc.com>
Date:   Wed, 15 Feb 2023 13:14:17 -0800
Message-ID: <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Conor Dooley <conor@kernel.org>,
        Vineet Gupta <vineetg@rivosinc.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        slewis@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        "Conor.Dooley" <conor.dooley@microchip.com>,
        Dao Lu <daolu@rivosinc.com>, guoren <guoren@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruizhe Pan <c141028@gmail.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Tobias Klauser <tklauser@distanz.ch>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 15, 2023 at 1:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Feb 6, 2023, at 21:14, Evan Green wrote:
> > We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> > system call that quite does this, so let's just provide an arch-specific
> > one to probe for hardware capabilities.  This currently just provides
> > m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> > the future.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
>
> I'm not sure I understand the problem with
> AT_HWCAP. While the bits in AT_HWCAP and AT_HWCAP2
> are limited, I don't see us running out of new
> AT_* words to use for additional bits. Presumably
> the kernel would already have to know about the
> name of each supported HW feature and could assign
> a unique bit number to them.

Palmer can probably speak to this with more authority, but my
understanding about the motivation for an approach like this goes
something like:
 * With the nature of RISC-V, we expect a lot of these types of bits
and bobs, many more than we've seen with the likes of x86 and ARM.
 * We also expect in some cases these values to be inconsistent across CPUs.
 * While we could copy all that data into the aux vector every time,
it starts to look like a lot of data, not all programs care about all
of it, and a lot of it is static, making all the copying wasteful.
 * Another option that would solve most of this would be to point to a
vDSO data area from the aux vector. This solves the copy complaints,
but makes that vDSO data ABI, and requires it all to be known up
front.
 * So, a syscall with a vDSO function in front of it seemed like a
good combination of speed and flexibility.

You're certainly right that HWCAPn would work for what we're exposing
today, so the question probably comes down to our relative predictions
of how this data will grow.

-Evan
