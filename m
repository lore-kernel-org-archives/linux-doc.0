Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93B8EE49A0
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 08:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbjHYIQu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 04:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243872AbjHYIQq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 04:16:46 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96282105
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 01:16:39 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3ff006454fdso5646615e9.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692951398; x=1693556198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QarG4D38hejgpRnSoszhs3a63Lzs4eQsWlAcm288Byk=;
        b=SsewulCt2Pc7EMM4EB+kWAAQsOzV4coQxJuejETJvl61nTNWAe9AIN8dsfWmodOhdp
         mYRo5Q1rKMqayxVK+zsxdnCGRkVWeh/zUqra3G4s0o3p28IJLP6jxqzR4S79MJIgxH6U
         4GF126GW7MZpz7K5JJ7CFyVNHF4Y+WTy1QlxB34+Ut/zC2JAZi2Nga1f1XXKBE5FLkBw
         7FOxnNpIfOA95cLJ/x5PopEiCeHDlRqrFc1A2QEt20XTS4HVtRvNS1Ck+XlpIWbJjxTw
         cew9m7iuAMCZd5A3BOczwItc/FWcua8jtpmA8FYJhr6zFWkMttX20vBUlml2l9ik0grv
         5PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951398; x=1693556198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QarG4D38hejgpRnSoszhs3a63Lzs4eQsWlAcm288Byk=;
        b=TmY+7FRJjNoRT6FWxBJMkl4O4XJN0v6dUvAqIo0xA/KRypNKILF3fzO5anzrZDqmm0
         5smA70IpkHp8Ohn05qst25lEO03Op8r5pKTrxYc0a68cBcu946zvK6TqXkhUAh+uMuS3
         1lbl14SJluCe1405svmLVS7wMUXP491hxOCGbd7uBecf12FOGdJP+0OOqqMD7QiXUU8E
         Octd3IqDuaPVg4s3iOFu5b8ix5wJtXWeG3zm8pFxtHGOgtwrPU1GY7bgFjZiv+dWG7w5
         YeqGq7yaYeAU+P5vZ0iO+oWTK/Un20kdyIZNWZLe7F3f9HLgDpsfZq7rYuWoBN73o2We
         M49g==
X-Gm-Message-State: AOJu0Yz+aXjOcTjJzcsCTkqifxZrDshOvKlrmK31zXUsIXwzTPQlz1mj
        MXm0VLSIkG+eNUgM6qc4KTgGOA==
X-Google-Smtp-Source: AGHT+IHMBAQvzVNGufdhNhZVxd3pJA0HX/bQ3/nJpvxpmlK7f8hrq7Gl7fk4p8ovvvBQEZzI7M1xmg==
X-Received: by 2002:a05:600c:204b:b0:3fe:d952:98fb with SMTP id p11-20020a05600c204b00b003fed95298fbmr13665161wmg.8.1692951398090;
        Fri, 25 Aug 2023 01:16:38 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c511200b003fe24df4182sm2329978wms.1.2023.08.25.01.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:16:37 -0700 (PDT)
Date:   Fri, 25 Aug 2023 10:16:36 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Evan Green <evan@rivosinc.com>
Cc:     Conor Dooley <conor@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org,
        Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230825-374a82446ed3eea02fcb41e6@orel>
References: <20230711201831.2695097-1-evan@rivosinc.com>
 <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
 <20230824-exploit-spectacle-ecedd91e9075@spud>
 <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 24, 2023 at 03:06:53PM -0700, Evan Green wrote:
> On Thu, Aug 24, 2023 at 10:29 AM Conor Dooley <conor@kernel.org> wrote:
...
> > Do you want to have this new thing in cpuinfo tell the user "this hart
> > has xyz extensions that are supported by a kernel, but maybe not this
> > kernel" or to tell the user "this hart has xyz extensions that are
> > supported by this kernel"? Your text above says "understood by the
> > kernel", but I think that's a poor definition that needs to be improved
> > to spell out exactly what you mean. IOW does "understood" mean the
> > kernel will parse them into a structure, or does it mean "yes you can
> > use this extension on this particular hart".
> 
> I'm imagining /proc/cpuinfo being closer to "the CPU has it and the
> kernel at least vaguely understands it, but may not have full support
> for it enabled". I'm assuming /proc/cpuinfo is mostly used by 1)
> humans wanting to know if they have hardware support for a feature,
> and 2) administrators collecting telemetry to manage fleets (ie do I
> have any hardware deployed that supports X).

Is (2) a special case of (1)? (I want to make sure I understand all the
cases.)

> Programmers looking to
> see "is the kernel support for this feature ready right now" would
> ideally not be parsing /proc/cpuinfo text, as more direct mechanisms
> like specific hwprobe bits for "am I fully ready to go" would be
> easier to work with. Feel free to yell at me if this overall vision
> seems flawed.
> 
> I tried to look to see if there was consensus among the other
> architectures. Aarch64 seems to go with "supported and fully enabled",
> as their cpu_has_feature() directly tests elf_hwcap, and elements in
> arm64_elf_hwcaps[] are Kconfig gated. X86 is complicated, but IIRC is
> more along the lines of "hardware has it". They have two macros,
> cpu_has() for "raw capability" and cpu_feature_enabled() for "kernel
> can do it too", and they use cpu_has() for /proc/cpuinfo flags.
>

I'd lean more towards the way AArch64 goes, because, unless /proc/cpuinfo
is just a blind regurgitation of an isa string from DT / ACPI, then the
kernel must at least know something about it. Advertising a feature which
is known, but also known not to work, seems odd to me. So my vote is that
only features which are present and enabled in the kernel or present and
not necessary to be enabled in the kernel in order for userspace or
virtual machines to use be advertised in /proc/cpuinfo.

We still have SMBIOS (dmidecode) to blindly dump what the hardware
supports for cases (1) and (2) above.

Thanks,
drew
