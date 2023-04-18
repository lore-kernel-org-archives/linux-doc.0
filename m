Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F8BC77B75
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 16:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjDRQnZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 12:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbjDRQnW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 12:43:22 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA5210277
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 09:43:19 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1a6670671e3so19996945ad.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1681836199; x=1684428199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EI0tXRwzJg1CxP2c/386HAhch5rVHFdN2/6jKvh2HxM=;
        b=GkX06FUQ//rDOHadMgR8CxNTR8YS+xZB3cC9uP9/mD2fk0SxJVeaYx9NRU60KH0iZN
         ck0EvZyVCu3Mi1tDqVXymDudsuoDaVhE1Q00Y6Lsx4oD5ylHi3J+D/Mh5LJ3f5RG1A8q
         OFli+ciVF67TPTeFFb5kGKCqA7DLYPehR+w4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681836199; x=1684428199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EI0tXRwzJg1CxP2c/386HAhch5rVHFdN2/6jKvh2HxM=;
        b=DV/h6qNly5wwPPB5YI3EJona4/+AuBsg9FLtJfGhmx+LLNyonmTZTJup6lM6fw2tEk
         AeOSaZ+0JOpQR53PJPM8jh8OZUAUp9VcYKMZxgEX6myQFkJoCkcvWUn9kehyZvOXL4BI
         qTB5UTiB2YetqygvmkkFRD9tgPcE7FJRe5yGQbnXt0osiDTNO5ZnVkSVLVk1Zb+UM3NF
         phxCYeYCAiKr6kQC+An7h/aPSJqWiFIZLyx5152n2DwG8BWSKNRnKdMclQwRH1LC+6if
         ONQ1s532BUhggl7GyJ44ad93jVVYm1Hj+66BaRT54dWlaoGH7iVjwWwZoIQf6cYqiiGn
         cc9w==
X-Gm-Message-State: AAQBX9dTQ/c5m2BzNEbYsEN22IXtpvjdFdUmZmNco3HUd/OP7kcjg6AI
        VlrMTv9f8kdjA8IwpWs4X6HAQCJ+TmU+F31vVfV8
X-Google-Smtp-Source: AKy350aVTDS4DC0sb8DZUPCXT0pwXJk0a0YNagw4pCKeLGyY+nYagZ7EbBKNjrvMvF/PkOAWLbNhYq7mBdKN1K9PSvc=
X-Received: by 2002:a17:903:2346:b0:1a6:4543:d295 with SMTP id
 c6-20020a170903234600b001a64543d295mr1115236plh.5.1681836199357; Tue, 18 Apr
 2023 09:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <CAOnJCU+72PV1=o1c_TpogkmBT36278BneVWEMr1=tqX0CZi+ag@mail.gmail.com> <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com>
In-Reply-To: <aadca595b4a24e36932ba41e61f4e263@AcuMS.aculab.com>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Tue, 18 Apr 2023 22:13:07 +0530
Message-ID: <CAOnJCUJ7mY+fh9VqE4dRntnVAEAc26=NnOCPUqkXk6ky__cUZQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To:     David Laight <David.Laight@aculab.com>
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 14, 2023 at 2:40=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Atish Patra
> > Sent: 13 April 2023 20:18
> >
> > On Thu, Apr 13, 2023 at 9:47=E2=80=AFPM Alexandre Ghiti <alexghiti@rivo=
sinc.com> wrote:
> > >
> > > riscv used to allow direct access to cycle/time/instret counters,
> > > bypassing the perf framework, this patchset intends to allow the user=
 to
> > > mmap any counter when accessed through perf. But we can't break the
> > > existing behaviour so we introduce a sysctl perf_user_access like arm=
64
> > > does, which defaults to the legacy mode described above.
> > >
> >
> > It would be good provide additional direction for user space packages:
> >
> > The legacy behavior is supported for now in order to avoid breaking
> > existing software.
> > However, reading counters directly without perf interaction may
> > provide incorrect values which
> > the userspace software must avoid. We are hoping that the user space
> > packages which
> > read the cycle/instret directly, will move to the proper interface
> > eventually if they actually need it.
> > Most of the users are supposed to read "time" instead of "cycle" if
> > they intend to read timestamps.
>
> If you are trying to measure the performance of short code
> fragments then you need pretty much raw access directly to
> the cycle/clock count register.
>
> I've done this on x86 to compare the actual cycle times
> of different implementations of the IP checksum loop
> (and compare them to the theoretical limit).
> The perf framework just added far too much latency,
> only directly reading the cpu registers gave anything
> like reliable (and consistent) answers.
>

This series allows direct access to the counters once configured
through the perf.
Earlier the cycle/instret counters are directly exposed to the
userspace without kernel/perf frameworking knowing
when/which user space application is reading it. That has security implicat=
ions.

With this series applied, the user space application just needs to
configure the event (cycle/instret) through perf syscall.
Once configured, the userspace application can find out the counter
information from the mmap & directly
read the counter. There is no latency while reading the counters.

This mechanism allows stop/clear the counters when the requesting task
is not running. It also takes care of context switching
which may result in invalid values as you mentioned below. This is
nothing new and all other arch (x86, ARM64) allow user space
counter read through the same mechanism.

Here is the relevant upstream discussion:
https://lore.kernel.org/lkml/Y7wLa7I2hlz3rKw%2F@hirez.programming.kicks-ass=
.net/T/

ARM64:
https://docs.kernel.org/arm64/perf.html?highlight=3Dperf_user_access#perf-u=
serspace-pmu-hardware-counter-access

example usage in x86:
https://github.com/andikleen/pmu-tools/blob/master/jevents/rdpmc.c

> Clearly process switches (especially cpu migrations) cause
> problems, but they are obviously invalid values and can
> be ignored.
>
> So while a lot of uses may be 'happy' with the values the
> perf framework gives, sometimes you do need to directly
> read the relevant registers.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)



--=20
Regards,
Atish
