Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22A2C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 23:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjBPXTb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 18:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjBPXTa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 18:19:30 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E0D474DB
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 15:19:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y25so4726903lfa.9
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 15:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuO7vwGoOqdehwY6pqxVzJ9kdVjxxXH/3O2BPwil+Ps=;
        b=zYVTTyh/hg97GwfGgLK3MjOi0ALc/LOCuuyuUxgdlGxBYM5iui3yw2y/DJ/yZbiMKn
         PpEZ8PuSpksvmy+jfy1rFSc9xfLF/4p1r80LMmvSj30bRggPoJsaVIZyDPdCrMn8bjno
         pixn8w08Zf8lPPHPFPgNm7ICQjbU+mzAnvDbO9ZE346uW897c6el7wTUAW011DK6pJBG
         MncC+8Id/WGOAIeleavJ1vrvX19IT9aNgYn8HKr74tlv4jqj9kMQ0XfdR9sGbmuPI2ij
         yfYjmTPC/ZKivABzI3T44Pfv2TrmHa/QF4gl2BxWvW6TyFySOAejiXJJzblE0+Y4rRW/
         f6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuO7vwGoOqdehwY6pqxVzJ9kdVjxxXH/3O2BPwil+Ps=;
        b=t14vzVWINp9Z3xCssiMA5IWRCQhfUp8p5l3M4dYdXSRy1/bB6S4MLMhF7nthjPiu+h
         YbSp6jcRm+44tJbHnavJzzRq6tbLjMNwEozqdUEdzsQt4zZjtJ17rdehCOV/vnV31bIo
         NrUqgHCT37W25zP0pBvfTHGdCeEKlcX1m0IpH3AfVh+g+af6wn//KEKLRjrH6nH85e4r
         O7or7J89SRN2lKnHn6IM+jMrXPqarQ5nt4OJ4JupnllkmWQdGR9od5ifHcGHVwhXUu7e
         QEEtsnfiZ4Fx8wCo8ld2iaMblchOcLM0kSmn5FB/A+DSQqoN0r2G/3Qkb0HzLG76km2t
         7YwQ==
X-Gm-Message-State: AO0yUKVR5KSk7mAiRdrPMnlXILNsE1kCZh9PFXdUAw16YYq5Uz7SqpRm
        v8ppyoByu8R4B8RZ2Ru7XmM3Nxg9UWDHIBTcEZe+5Q==
X-Google-Smtp-Source: AK7set/bHPEPiCF7ABIwAYwHhJ93j6aVjwc5DsJvP1JwGfHRwCixVRwQ4IYybqkOks8P+AzIzxXJUhvC/3k9tQ82wtE=
X-Received: by 2002:a05:6512:507:b0:4dc:807a:d14a with SMTP id
 o7-20020a056512050700b004dc807ad14amr413602lfb.9.1676589567141; Thu, 16 Feb
 2023 15:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com> <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
 <6FA7F803-1B4A-418E-9368-E205F3A6CF27@jrtc27.com> <ed5133d1-5592-4367-8919-4416be506455@app.fastmail.com>
In-Reply-To: <ed5133d1-5592-4367-8919-4416be506455@app.fastmail.com>
From:   Evan Green <evan@rivosinc.com>
Date:   Thu, 16 Feb 2023 15:18:51 -0800
Message-ID: <CALs-HstoeoTWjTEZrLWouCgwq0t3tDB6uL=tB68RJDs1ub4Frw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jessica Clarke <jrtc27@jrtc27.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 16, 2023 at 5:30 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 15, 2023, at 23:43, Jessica Clarke wrote:
> > On 15 Feb 2023, at 21:14, Evan Green <evan@rivosinc.com> wrote:
> >> On Wed, Feb 15, 2023 at 1:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> Palmer can probably speak to this with more authority, but my
> >> understanding about the motivation for an approach like this goes
> >> something like:
> >> * With the nature of RISC-V, we expect a lot of these types of bits
> >> and bobs, many more than we've seen with the likes of x86 and ARM.
> >
> > We=E2=80=99re already at (I think) 51 standard user-level extensions th=
at LLVM
> > knows about.
>
> Do you have an estimate of how many of these require kernel support
> beyond identifying the extensions?
>
> >> * We also expect in some cases these values to be inconsistent across =
CPUs.
> >
> > That=E2=80=99s also true of some Arm SoCs.
>
> Right, but it's also something that we should not encourage, or
> need to make easy to use. On arm64, the kernel support for having
> asymmetric aarch32 mode was kept to an absolute minimum, and an
> application is expected to get the information from /proc/cpuinfo
> before pinning down a task to the correct subset of all CPUs.
>
> >> * So, a syscall with a vDSO function in front of it seemed like a
> >> good combination of speed and flexibility.
> >>
> >> You're certainly right that HWCAPn would work for what we're exposing
> >> today, so the question probably comes down to our relative predictions
> >> of how this data will grow.
> >
> > The other big problem is vendor extensions.

Since the key range can grow without accruing a process startup time
penalty, this proposal handles vendor extensions fairly well, no?
(Contrasting at least against hwcap bits, which once allocated have to
be copied into every new process forever).

>
> My biggest concern is how this would be synchronized between the
> interfaces that are available to users. What we have on other architectur=
es
> is a set of string identifiers in /proc/cpuinfo and a bitmask in HWCAP.
> Ideally these are added in pairs so the information available to shell
> scripts in human readers is the same that is available in the auxvec
> data.
>
> Adding a third interface with the same information or a superset
> requires more work in ensuring that each extension is available
> in exactly the right places. Ideally I think there should be only
> one table of possible CPU features so nobody has to make the
> decision about which ones are important enough to add to one
> interface or another.

That makes sense. In this case, the proposal is that RISC-V would use
this mechanism and generally abandon hwcap. So my hope is there should
still only be about 2 spots to maintain.
-Evan
