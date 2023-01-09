Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26DDC5479D
	for <linux-doc@archiver.kernel.org>; Mon,  9 Jan 2023 21:38:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238078AbjAIViO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Jan 2023 16:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238133AbjAIVhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jan 2023 16:37:40 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D593F138
        for <linux-doc@vger.kernel.org>; Mon,  9 Jan 2023 13:36:31 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id jl4so11020456plb.8
        for <linux-doc@vger.kernel.org>; Mon, 09 Jan 2023 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQWJ6Cr4IImJL6zlxqosQINLILCXhpE6Qg/8UMNu6m4=;
        b=M9R9bE9rVQWpi71VTT8izHtCpN0eyRyeYdZK/eCdyXJtkqhTwVbhK/iVBschylObSm
         PnmzFdmE41k3PMDKxveFDOcC7/QB4cGyGIXLeR8hpJVFzIgzTzmn0DlF6kG2BccsV/kv
         UWtxlY0xHabBPyiUfwByOsz2dVez1SdUmS7tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQWJ6Cr4IImJL6zlxqosQINLILCXhpE6Qg/8UMNu6m4=;
        b=RXnfVkwEserJ2TdO64tOImT0bMxcGFWyV4UTF4ikqSLmYROITqJvNCIcdwLlVYo+x3
         z4L2N32e1Or3NL459AOtE4hmVXL6SmRuUCrewITbay7dhqsuY62Zmv25N/SGhCMKruYe
         RfJDXFqpAmGJbRgs+Igcp7IN1siKqJntxfR5gsWWWKiy6CkfCThHma7ywCiPfxmiPI4V
         hTJIlNXlI+P9heCmQoJy8imk8JmRRyKoHPpGxW0KsmVS7A6uKZ92Eb0sK4V0bWzlTSN9
         MXFiWWsgM4fBgYNcwLIrpi5xEgno1zaxMxuxcWEEgZTVBFYi5ufr2Scg2l1D6ww/PIpn
         qo2w==
X-Gm-Message-State: AFqh2kp7qn/tQudMcbS386D7dcFKUhr2pBwaGiQX84Pk8Ko1XotuWwH8
        FQXe0vAJyyyscNydKbYlmkUJ38D6N+h7JPnuWz12
X-Google-Smtp-Source: AMrXdXvWWUsWUWXZOJID137JCYPjYorrUW7Yb0R8SUea6RrsFVbpKQXNtb2bAvCBWVga2pBRkAsIUfAXCp8kbbOkedw=
X-Received: by 2002:a17:902:d645:b0:193:150e:a8ef with SMTP id
 y5-20020a170902d64500b00193150ea8efmr1222338plh.71.1673300190704; Mon, 09 Jan
 2023 13:36:30 -0800 (PST)
MIME-Version: 1.0
References: <mhng-72f383f6-a85f-4587-9fa6-f85fb9f27ec8@palmer-ri-x1c9a>
 <87359wpy9y.fsf@meer.lwn.net> <87y1rooje8.fsf@meer.lwn.net> <Y4srdBCmYJFx+ypW@spud>
In-Reply-To: <Y4srdBCmYJFx+ypW@spud>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Mon, 9 Jan 2023 13:36:19 -0800
Message-ID: <CAOnJCU+DhxcPjgftMspWAzhsms_8sXnGS++vbp1iJDB0XcOxLQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: riscv: note that counter access is part of
 the uABI
To:     Conor Dooley <conor@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 3, 2022 at 2:57 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Sat, Dec 03, 2022 at 03:45:35AM -0700, Jonathan Corbet wrote:
> > Jonathan Corbet <corbet@lwn.net> writes:
> >
> > > Palmer Dabbelt <palmer@dabbelt.com> writes:
> > >> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >>
> > >> I think I merged the last one of these, but if the doc folks pick it up
> > >> that's fine with me.  Otherwise I'll take it when it comes back around,
> > >> so folks have time to take a look.
> > >
> > > "Doc folks" applied it, thanks. :)
> >
> > Actually, I take that back.  I'd missed this part from the patch:
> >
> > > Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
> > > it to be applicable, just getting a patch into patchwork while I don't
> > > forget about this.
> >
> > ...but b4 happily picked up a couple of *other* patches from this thread
> > and applied them instead; I've now undone that.  Sorry for the noise.
>
> Huh, I accidentally put an "in-reply-to" header on this patch. I have
> been updating some of my submission helper scripts & I must have left
> the field populated from sending another set by accident:
> https://lore.kernel.org/linux-riscv/20221129144742.2935581-1-conor.dooley@microchip.com/
>

I don't see the patch upstream. Is this patch merged already ?
If not, please hold on merging this for now. We had some discussions
around this in the perf community.
Here is the thread
https://lore.kernel.org/lkml/Y7gN32eHJNyWBvVD@FVFF77S0Q05N/T/

TLDR; Even though x86 allows unrestricted access through rdpmc (not
default), it still reads zero unless a privileged root user modifies
the MSR interface exposed by the kernel.

Quoting PeterZ

"RDPMC is only useful if you read counters you own on yourself -- IOW
selfmonitoring, using the interface outlined in uapi/linux/perf_events.h
near struct perf_event_mmap_page.

Any other usage -- you get to keep the pieces."

"Anyway, given RISC-V being a very young platform, I would try really
*really* *REALLY* hard to stomp on these applications and get them to
change in order to reclaim the PMU usage."

We need to decide what's the best approach for RISC-V. The current
text in uABI will let users assume that
cycle/instret can be read without any issues which is wrong.

There are few options what we can do for RISC-V:

1. We can trap n emulate and report 0 always as suggested by Mark in
that thread.
2. Continue to allow the user to read the counters directly but
expects the garbage value depending on the other activities
on the system. Hopefully, folks will fix their application by that time.

Once we have the procfs interface, we enforce the behavior by breaking
the application.

In either case, the uABI needs to be updated accordingly.

> Apologies!
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



--
Regards,
Atish
