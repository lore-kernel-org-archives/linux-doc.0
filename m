Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94A0C636D6
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 17:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjBIRKP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 12:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjBIRKO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 12:10:14 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C1D66EE6
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 09:09:54 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id y19so2820303ljq.7
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 09:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=40dyMgqFR1jhkwFKYPOlrUymSjEFMlS6pCrNocuBtSk=;
        b=odyZyLnCbQgBbN2iJeJzzPI+MasYlWfH6MjT1G5wK5VryQcBG6POjzlqTxik6huCTm
         MDpKA8YErI8YHhcOz3rimJeq5wS1Vc+hQKWpD1Rsgmohfl29zb0KtL4ScWM05QAgrYdr
         njnHwina4sA1BIoTUh8Y1dz6xqCCSo9t+wyP3UeuwcBTBGXlCXll0SWqlGCTH8u+a6ee
         qvApSLoV0R+k9YKjNHvvAELknWp5r+o6eOuKyf1cMSp5wmeWaIKLkaf0K9z0FPkGirX2
         P0FzV8dzm9WIHBkVLc0waM9YnbNeD5PdD1Q4qcZaJJaCY0wW3I31RxmAjQST7gKE5PjF
         j5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40dyMgqFR1jhkwFKYPOlrUymSjEFMlS6pCrNocuBtSk=;
        b=eAWQnPeiqG+1NeSDS3BZNu+TnfhPhY4jAEI983IyzPbfzVcGU6Cp5Y2NQTLZ/sA0id
         ofQVVFGF16FdQk8J1kBKyPgHvyYDsVg7/YAJmCuJcbxo5lCEB9W1lT1SLzPKnvt8QG3r
         0k3LD5XEZKTDNM/UNEOptbKxa8EWp7GHMhN4irdqodqgdGWPoJkrJL/gettByvjJ0Pak
         n+Lp8paNL37wJi3GYHzHJlgsqoFVbX6x9nrhnc7sK9WwPZpu4Wmn0S7+qmPo8Bsn3VDC
         mFhnWb39mihuS4tfarcgkTsX0/VUYS9z2RBIfY1qEFqujL4kYxYxhPkEmtWis6gWjidR
         Yt7w==
X-Gm-Message-State: AO0yUKUQg7clLVlROQD5c0EwDl3LNMgRztQMY0KcIE1PVxTTX/A2K0Fc
        DKszjflOc1k4/qtb3gTnJ5etKTq5S06UXO+zvUzlPQ==
X-Google-Smtp-Source: AK7set93dRuD5/ioQI1TmSE3wAUYoqC+pSkvpepu4Zbjim1mcGZ49sZ0fEd60UnyJAfwy9BDcu6jvg2t7uOuX5Dzulc=
X-Received: by 2002:a05:651c:3db:b0:290:5b65:ab86 with SMTP id
 f27-20020a05651c03db00b002905b65ab86mr1652382ljp.200.1675962592813; Thu, 09
 Feb 2023 09:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+HsE397cY4HF+5K@kroah.com> <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
In-Reply-To: <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
From:   Evan Green <evan@rivosinc.com>
Date:   Thu, 9 Feb 2023 09:09:16 -0800
Message-ID: <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
To:     Conor Dooley <conor@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
        heiko@sntech.de, slewis@rivosinc.com,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 6, 2023 at 10:32 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Evan, Greg,
>
>
> On 7 February 2023 06:13:39 GMT, Greg KH <gregkh@linuxfoundation.org> wrote:
> >On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
> >> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> >> system call that quite does this, so let's just provide an arch-specific
> >> one to probe for hardware capabilities.  This currently just provides
> >> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> >> the future.
> >
> >Ick, this is exactly what sysfs is designed to export in a sane way.
> >Why not just use that instead?  The "key" would be the filename, and the
> >value the value read from the filename.  If the key is not present, the
> >file is not present and it's obvious what is happening, no fancy parsing
> >and ABI issues at all.
>
> https://lore.kernel.org/linux-riscv/20221201160614.xpomlqq2fzpzfmcm@kamzik/
>
> This is the sysfs interface that I mentioned drew
> suggested on the v1.
> I think it fits ~perfectly with what Greg is suggesting too.

Whoops, I'll admit I missed that comment when I reviewed the feedback
from v1. I spent some time thinking about sysfs. The problem is this
interface will be needed in places like very early program startup. If
we're trying to use this in places like the ifunc selector to decide
which memcpy to use, having to go open and read a fistful of files is
going to be complex that early, and rough on performance.

Really this is data that would go great in the aux vector, except
there's probably too much of it to justify preparing and copying into
every new process. You could point the aux vector into a vDSO data
area. This has the advantage of great performance and no syscall, but
has the disadvantages of making that data ABI, and requiring it all to
be known up front (eg the kernel can't compute any answers on the
fly).

After discussions with Palmer, my plan for the next version is to move
this into a vDSO function plus a syscall. Private vDSO data will be
prepped with common answers for the "all CPUs" case, avoiding the need
for a syscall in most cases and making this fast. Since the data is
hidden behind the vdso function, it's not ABI, which is a plus. Then
the vdso function can fall back to the syscall for cases with exotic
CPU masks or keys that are unknown/expensive to compute at runtime.

-Evan
