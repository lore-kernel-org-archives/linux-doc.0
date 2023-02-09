Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0ACC61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 17:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjBIRWO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 12:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBIRWN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 12:22:13 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F075A31E33
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 09:22:11 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h16so2475354wrz.12
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAFkfNbHiEr8HwllJiz8cfs+MhJWHOf8ZZUUPVU/5ao=;
        b=YIsyNnM7IEL0PBzA+DW56tRnpXI97JX8dmpOEDgFX4aBvm2xrtL8yUwCl2bLdkTRNp
         L1xe87XzKjHOnIR8dyVn4lDW81ATvYVC6tsPWmKOyfG/VbEYx20QjI9UlrN/PlTWD5hs
         5smBqcX1wYxIch4uJimFGTByjlVOId7FGguVvdw5YZFgNIzJFCnhm9e4ydnH2ajnFu5v
         WMmCUcE8zpUnTqOCrm8eCyLt4Cq1SXCiVuBUh7vDJxI7pIEcJsVwE5zfp5+zQt+e0E4O
         CHSXd1vB3/Taa/CgifJGSLQNhX8u3EvVHu0bCZHkFxy7oJChS+y4Bgqr8b/UqfM2ML8a
         x6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAFkfNbHiEr8HwllJiz8cfs+MhJWHOf8ZZUUPVU/5ao=;
        b=h1WcxJJcoFcNqrWKpO1/9fw2jUEWxAuUGEt5VrolkH6KVI/bvVVyiDmPXszKI4cwi4
         8o0i9yd7spR4b4Zu0WkckHstZQTXenuCU9M7ZN5NcTI1X/zk5iqTUwEoX8yfHYJ2h3E8
         Hl6JLd/gS6DSwygusRwVmYZhmPP7DG238B+NlO9dE5D77uUZx5/27DPnIL/CS5FimH5q
         sSJeTi4BvXfLyPdjpWAgc0K7t2cVQOOBw+fryeD89+6WxLFkuTEQ64u/qllpCby5oaaA
         2PxYo5M4Et4SKwE9s9Fa+J9TnRToho1xWN/4paxL7LE422TdXSdRUSFbwfQVt6VSULZJ
         jskg==
X-Gm-Message-State: AO0yUKWPv5/xOHHFZr91wdVuZhH/25MLpuGEOJb9kGMYdbvY5MxUTmJZ
        d/Ijdb9F7ardGI8NDS23sKBfKQ==
X-Google-Smtp-Source: AK7set8V+ghH5F2VLXDSfjNTPZ+GSq8/0Ptcc3LLJJGbooMrIkILqpG3+jEjkwFIwVG1hV+FHSu5Aw==
X-Received: by 2002:adf:f708:0:b0:2c5:3cd6:4fdf with SMTP id r8-20020adff708000000b002c53cd64fdfmr2440362wrp.39.1675963330574;
        Thu, 09 Feb 2023 09:22:10 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id x1-20020adfffc1000000b002425be3c9e2sm1700768wrs.60.2023.02.09.09.22.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Feb 2023 09:22:10 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
From:   Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y+UpqHstcMahbadE@kroah.com>
Date:   Thu, 9 Feb 2023 17:22:09 +0000
Cc:     Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Vineet Gupta <vineetg@rivosinc.com>,
        Heiko Stuebner <heiko@sntech.de>, slewis@rivosinc.com,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Atish Patra <atishp@rivosinc.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruizhe Pan <c141028@gmail.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Tobias Klauser <tklauser@distanz.ch>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4C20D57-912B-489F-A262-51EAEE79F41D@jrtc27.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com> <Y+HsE397cY4HF+5K@kroah.com>
 <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
 <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
 <Y+UpqHstcMahbadE@kroah.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9 Feb 2023, at 17:13, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Feb 09, 2023 at 09:09:16AM -0800, Evan Green wrote:
>> On Mon, Feb 6, 2023 at 10:32 PM Conor Dooley <conor@kernel.org> =
wrote:
>>>=20
>>> Hey Evan, Greg,
>>>=20
>>>=20
>>> On 7 February 2023 06:13:39 GMT, Greg KH =
<gregkh@linuxfoundation.org> wrote:
>>>> On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
>>>>> We don't have enough space for these all in ELF_HWCAP{,2} and =
there's no
>>>>> system call that quite does this, so let's just provide an =
arch-specific
>>>>> one to probe for hardware capabilities.  This currently just =
provides
>>>>> m{arch,imp,vendor}id, but with the key-value pairs we can pass =
more in
>>>>> the future.
>>>>=20
>>>> Ick, this is exactly what sysfs is designed to export in a sane =
way.
>>>> Why not just use that instead?  The "key" would be the filename, =
and the
>>>> value the value read from the filename.  If the key is not present, =
the
>>>> file is not present and it's obvious what is happening, no fancy =
parsing
>>>> and ABI issues at all.
>>>=20
>>> =
https://lore.kernel.org/linux-riscv/20221201160614.xpomlqq2fzpzfmcm@kamzik=
/
>>>=20
>>> This is the sysfs interface that I mentioned drew
>>> suggested on the v1.
>>> I think it fits ~perfectly with what Greg is suggesting too.
>>=20
>> Whoops, I'll admit I missed that comment when I reviewed the feedback
>> from v1. I spent some time thinking about sysfs. The problem is this
>> interface will be needed in places like very early program startup. =
If
>> we're trying to use this in places like the ifunc selector to decide
>> which memcpy to use, having to go open and read a fistful of files is
>> going to be complex that early, and rough on performance.
>=20
> How is it going to be any different on "performance" than a syscall?  =
Or
> complex?  It should be almost identical overall as this is all in-ram
> and not any real I/o is happening.  You are limited only by the speed =
of
> your cpu.
>=20
>> Really this is data that would go great in the aux vector, except
>> there's probably too much of it to justify preparing and copying into
>> every new process. You could point the aux vector into a vDSO data
>> area. This has the advantage of great performance and no syscall, but
>> has the disadvantages of making that data ABI, and requiring it all =
to
>> be known up front (eg the kernel can't compute any answers on the
>> fly).
>>=20
>> After discussions with Palmer, my plan for the next version is to =
move
>> this into a vDSO function plus a syscall. Private vDSO data will be
>> prepped with common answers for the "all CPUs" case, avoiding the =
need
>> for a syscall in most cases and making this fast. Since the data is
>> hidden behind the vdso function, it's not ABI, which is a plus. Then
>> the vdso function can fall back to the syscall for cases with exotic
>> CPU masks or keys that are unknown/expensive to compute at runtime.
>=20
> I still think that's wrong, as you are wanting a set of key/values =
here,
> which is exactly what sysfs is designed for.

But this needs to be a RISC-V standard interface that can be programmed
against, not something tied to highly Linux-specific things like sysfs.
You=E2=80=99re free to implement that interface with sysfs, but exposing =
that
as *the* interface to use would be terrible for portability.

Jess

> Please benchmark this first.  Heck, if you don't like the
> open/read/close syscall overhead, use my readfile() syscall patch that =
I
> keep proposing every 6 months or so to remove that overhead.  That =
would
> be a good reason to get that code accepted finally :)
>=20
> thanks,
>=20
> greg k-h
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

