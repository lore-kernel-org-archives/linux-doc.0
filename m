Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4D6D57D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Feb 2019 14:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfBZOf5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Feb 2019 09:35:57 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42960 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfBZOfx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Feb 2019 09:35:53 -0500
Received: by mail-pf1-f195.google.com with SMTP id n74so6332491pfi.9
        for <linux-doc@vger.kernel.org>; Tue, 26 Feb 2019 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AUt4iAfRYbk6BwjoCKxvIK1Q45AuJd2RFSG+AdGqGGc=;
        b=XRKcLkoJARsdGGCLNMsEu1Vu8sk3uYCwX73ehOf3+cVLv75cO4w/3UTqMluqhaIGyh
         cCy4xvROzeQSaFXI2Iu8ow09wzrfeUVrM4ZBHYRiwLLWx0shcllKfcDdFKilrD1Kr8Mf
         pLE8gRxiLBO8WSSp7OrsZFKA+euo20XGdvScqo95ZZCUwpBjOnXMacjezDCcsLkt/Mth
         pHEFCvychKIJQf6QLymBizZy5Tzkwkra5iyXKKlgGp2QSjfkxadk85kayKTWgP4jHqma
         lYOKPh4aOy50Vdd3ysijeaTRxrjd48CuRB+UX9PdLo8hQkWNFjb25zGeU7TCq+mn7l5N
         FWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AUt4iAfRYbk6BwjoCKxvIK1Q45AuJd2RFSG+AdGqGGc=;
        b=my4m5Fo7ejcqdDYvdDSXjtz34ey/EFGN4o38CAAOaeTDvO8EFh3s7AOuicv/UidfSJ
         2xR1Xtycy44n+uMkTSXR6sHDEzEnjsK5eF3niWjrXCgTA6PtKLK3DkObl8rp9LiNH6hh
         WyDSUJBVpNXEeRvQausN/VN02iAUAYtf2uW5LSTFvke0rGpvvyE6yGfKWVbPH4qIPG3j
         9l2ZtrIrMffZ1NY8457u5tWo6AJJKPxjGKqxfCW/9TqkDhEKGtb1qCQRMeim3ZtsU9TI
         h+wuc3aeCbstpOHcsa0eVRrAWLIEE4v0pHaHEsmIJi/FsTIgIqsjwLvfJh/g1A/G6LY5
         jnug==
X-Gm-Message-State: AHQUAuYYUBXEiue8noljNn/3k5VDM/Aj7WkQNYVZ6bHF1TUjANp1GS11
        AJGlW8LA2uytO5ZgXSMsgSpwlByAmtkjP7JG8Jor1Q==
X-Google-Smtp-Source: AHgI3IbiQNlPq53/tUpD5IAq8EfXkU5pkBI8V4LoDzop7lQaXJ2OSriJDpc1tkZELm721YxkXsfJtn4Ts8mziEe1cTs=
X-Received: by 2002:a62:6383:: with SMTP id x125mr25941741pfb.239.1551191751796;
 Tue, 26 Feb 2019 06:35:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550839937.git.andreyknvl@google.com> <a958e202cdbe6e1bac8a37b7f3d9881d1b22993d.1550839937.git.andreyknvl@google.com>
 <a38275b0-f6cd-20e1-3c48-544846586a16@intel.com>
In-Reply-To: <a38275b0-f6cd-20e1-3c48-544846586a16@intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 26 Feb 2019 15:35:40 +0100
Message-ID: <CAAeHK+wLm7zSUC8dJv3LgdyvpkBN8u_24ene6b91PgM570VWbQ@mail.gmail.com>
Subject: Re: [PATCH v10 06/12] fs, arm64: untag user pointers in copy_mount_options
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 23, 2019 at 12:03 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -2730,7 +2730,7 @@ void *copy_mount_options(const void __user * data)
> >        * the remainder of the page.
> >        */
> >       /* copy_from_user cannot cross TASK_SIZE ! */
> > -     size = TASK_SIZE - (unsigned long)data;
> > +     size = TASK_SIZE - (unsigned long)untagged_addr(data);
> >       if (size > PAGE_SIZE)
> >               size = PAGE_SIZE;
>
> I would have thought that copy_from_user() *is* entirely capable of
> detecting and returning an error in the case that its arguments cross
> TASK_SIZE.  It will fail and return an error, but that's what it's
> supposed to do.
>
> I'd question why this code needs to be doing its own checking in the
> first place.  Is there something subtle going on?

The comment above exact_copy_from_user() states:

Some copy_from_user() implementations do not return the exact number of
bytes remaining to copy on a fault.  But copy_mount_options() requires that.
Note that this function differs from copy_from_user() in that it will oops
on bad values of `to', rather than returning a short copy.
