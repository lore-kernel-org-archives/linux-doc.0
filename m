Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C99EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 19:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjFZTtY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 15:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjFZTtW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 15:49:22 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830E21729
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 12:49:20 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f954d78bf8so5199888e87.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 12:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687808959; x=1690400959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YM/3jytDSw5aCGEFIsFzQqRvaDLcL3uFF5ne8/Vpng=;
        b=rMvt5DOa+d5Ev5t6uxa2w3H7fN1E2vJqXHCzpIonlVWY9h+igGLjmlZap8F+vkqtfQ
         79RaVl6dSRLrmiu06nwDUzUSon2uM3LeanriiR/CYMO7edw3M6BvR09M46AovO3JXaL7
         OFtOfbEyiNBrVuVv5xg5uo8kii5Nywg04nYGSciIqIf4MW6D9LuAszTbpu1RLonGsO0C
         OF4MgCAqHnfcuC5jhTXDosFecrA8UB2gxJ9dfWHn6KFckVjjTyoOqdegIjAUzb2tc2RT
         YAdVdwIFZQsNtTbOrkrCAP+xl06QBopBxyhgNtPQaqOXhD2EUxKVJAzR4Pwx2/G5Oem5
         E2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687808959; x=1690400959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YM/3jytDSw5aCGEFIsFzQqRvaDLcL3uFF5ne8/Vpng=;
        b=TCnEj/CGnsOwqOcEePm3ulieF7KpPQBHQ60Qd+mZmgYXXKO17/woGX30L90140a1zQ
         ZovJMC+CFPZ+PT0wTbX5mwMh0lkP/PGenTHZWAl9QSW3y7NxDd9iQzFbiU5sKd3KDm7B
         vesLeJbiQg03Wx9Ece9VY70auqWxKFl894RstGlovT7Xr3OywqcMawttdcElVztenhOg
         KMz9ivbVx2ufSIn+ADAPzPENrpd4DjYU6wFh5LLul48fjNKwEFa8LJybkvrxIEifwxWc
         mkECIFsgDlSmnHywSPUcR8CrK5LLrMgOhORMP3MHzcAqo0SIxiWrD/mKboNHwN+rKiOC
         +XWQ==
X-Gm-Message-State: AC+VfDyDeggECdzqqCiT+Onzhc7NnDPhdK8PPYLDXbSSZixgX7uNYGsd
        gxr0yK3NIYCKpe4if1w04l+8Qbq6mt2pNi+IMjPIAA==
X-Google-Smtp-Source: ACHHUZ6avkdLR+FgKz1qS04UPjaf9BSA07AhepW4v7HvSFw74n2Fsq9w2aB6inJFNBV5gr+Rt0Rv48bZvLGzKw/tTEk=
X-Received: by 2002:a05:6512:3b8e:b0:4fb:744e:17db with SMTP id
 g14-20020a0565123b8e00b004fb744e17dbmr3081195lfv.1.1687808958688; Mon, 26 Jun
 2023 12:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230623222016.3742145-1-evan@rivosinc.com> <tencent_817CE182DEDA938E03B848314821098D4408@qq.com>
In-Reply-To: <tencent_817CE182DEDA938E03B848314821098D4408@qq.com>
From:   Evan Green <evan@rivosinc.com>
Date:   Mon, 26 Jun 2023 12:48:42 -0700
Message-ID: <CALs-Hsv+iS055GUJdotYxmn5ST9y9yT7P1PiG4DLPU+rzPO20A@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Probe for misaligned access speed
To:     Yangyu Chen <cyy@cyyself.name>
Cc:     ajones@ventanamicro.com, alexghiti@rivosinc.com,
        andy.chiu@sifive.com, aou@eecs.berkeley.edu,
        apatel@ventanamicro.com, conor.dooley@microchip.com,
        corbet@lwn.net, greentime.hu@sifive.com, guoren@kernel.org,
        heiko.stuebner@vrull.eu, heiko@sntech.de,
        jeeheng.sia@starfivetech.com, jszhang@kernel.org,
        leyfoon.tan@starfivetech.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        lizhengyu3@huawei.com, masahiroy@kernel.org, palmer@dabbelt.com,
        palmer@rivosinc.com, paul.walmsley@sifive.com,
        rdunlap@infradead.org, samuel@sholland.org, shosie@rivosinc.com,
        sunilvl@ventanamicro.com, xianting.tian@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 24, 2023 at 3:22=E2=80=AFAM Yangyu Chen <cyy@cyyself.name> wrot=
e:
>
> Hi,
>
> Thanks for doing this.
>
> On 6/24/23 6:20 AM, Evan Green wrote:
> > I don't have a machine where misaligned accesses are slow, but I'd be
> > interested to see the results of booting this series if someone did.
>
> I have tested your patches on a 100MHz BigCore rocket-chip with opensbi r=
unning on FPGA with 72bit(64bit+ECC) DDR3 1600MHz memory. As the rocket-chi=
p did not support misaligned memory access, every misaligned memory access =
will trap and emulated by SBI.
>
> Here is the result:
>
> ~ # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,rocket0
> mvendorid       : 0x0
> marchid         : 0x1
> mimpid          : 0x20181004
>
> processor       : 1
> hart            : 1
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,rocket0
> mvendorid       : 0x0
> marchid         : 0x1
> mimpid          : 0x20181004
>
> ~ # dmesg | grep Unaligned
> [    0.210140] cpu1: Unaligned word copy 0 MB/s, byte copy 38 MB/s, misal=
igned accesses are slow
> [    0.410715] cpu0: Unaligned word copy 0 MB/s, byte copy 35 MB/s, misal=
igned accesses are slow

Thank you, Yangyu! Oof, the firmware traps are quite slow!
-Evan
