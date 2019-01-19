Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F15547D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 19 Jan 2019 17:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbfASRns (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 19 Jan 2019 12:43:48 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46587 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbfASRns (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jan 2019 12:43:48 -0500
Received: by mail-vs1-f65.google.com with SMTP id n10so10346816vso.13
        for <linux-doc@vger.kernel.org>; Sat, 19 Jan 2019 09:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J9f9Ib7OsMwZwSlG36Gi36yT7CnmZRZfUF9UxxUakKI=;
        b=v+O2pcT2uhD1PvHK6ViSG+YUjJlHzZa1JJcO26IowOx2qvJSVyYhm2A0SUrd1xapeY
         cI1s49YTUy1HstWhV0tgi9VdAVv8M931J3F49jpUo5A0kdRJFrHc9zt01wOS6yLxCIOn
         dgQ1PdvMoohT1CqX87vPAU8L3YJGZIjgy2SOVUDQP58kZvNZu1+d5fRNS5jMCtpGwcUS
         yo61Yy0u1xG1c5mNpQCuL9EWekMYIVAIbPVWTYQ3HppUWQxty5x6RWRXfjzBADpVe16s
         lS2phFEXdjhKKUvVRe9FRdFmimmnOZHAez+2JsopuU6Chu51unJi7XV0iLwPY3gANIxL
         nuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J9f9Ib7OsMwZwSlG36Gi36yT7CnmZRZfUF9UxxUakKI=;
        b=IVFN2n8qAJcwkmUbj7dEq+u2TqVLjglB5U0GI1x6w2rX1Qbm2IlUQpzGyD2vQOLZ1M
         vbcXIZIm3V3jOHgLiCDuk9rdFhKYVcifZlvflxZsEzdKkFG7O5HxbJLd/JUFAWg0v+Kd
         kbR7H8OPfcJzuBxd3kjdDXK9GLc1XA0i8V7SrAEpbQneKwa1k8mRT3izH+TpuypXAImQ
         +4CMcPruEmeQg1I5PqtA7W14c+55e1lTGO5zSKll+ixBVz0qzCrN+RViNgiUNFIp76P7
         6tVMft4E8EcqQdvubPn5wyIRhTQQZ/JYrT0vKu8TcU1BKgFfzzmKIJHwuQiji16/Bc+3
         g25w==
X-Gm-Message-State: AJcUukdJJtTwFPP41u3xQa2EG/93XqOYz8gI4XZX8UtErJD0/TBd7tvs
        glUd8jbgzkOfDiJl8lkvpvkDHrFiUxTSE0whvVGOTg==
X-Google-Smtp-Source: ALg8bN59BJ4yHuqXxBqfA3BqnqKOmafpnOPQJSZwsU6WI7HCLxcH+4LiZAA8vKsWakY/u0SZFYVd9MuNcaVU+jvYmEM=
X-Received: by 2002:a67:f943:: with SMTP id u3mr10178670vsq.149.1547919826517;
 Sat, 19 Jan 2019 09:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20190118225543.86996-1-joel@joelfernandes.org>
 <20190119082532.GA9004@kroah.com> <20190119162754.GC231277@google.com>
In-Reply-To: <20190119162754.GC231277@google.com>
From:   Daniel Colascione <dancol@google.com>
Date:   Sat, 19 Jan 2019 12:43:35 -0500
Message-ID: <CAKOZuet+7a4jdox6rebMN=kJtDn5RUYzvNjFh+Pzn2UkuP0Y8Q@mail.gmail.com>
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the kernel
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        karim.yaghmour@opersys.com, Kees Cook <keescook@chromium.org>,
        kernel-team@android.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 19, 2019 at 11:27 AM Joel Fernandes <joel@joelfernandes.org> wrote:
>
> On Sat, Jan 19, 2019 at 09:25:32AM +0100, Greg KH wrote:
> > On Fri, Jan 18, 2019 at 05:55:43PM -0500, Joel Fernandes wrote:
> > > --- /dev/null
> > > +++ b/kernel/kheaders.c

Thanks a ton for this work. It'll make it much easier to do cool
things with BPF. One question: I can imagine wanting to probe
structures that are defined, not in headers, but in random
implementation files. Would it be possible to optionally include *all*
kernel source files? If not, what about a hash, so we could at least
do precise correlation between a candidate local tree and what's
actually on device?

BTW, I'm not sure that the magic constants you've defined are long
enough.  I'd feel more comfortable with two UUIDs (16 bytes each).

I'd also strongly consider LZMA compression: xz -9 on the kernel
headers (with comments) brings the size down to 5MB, compared to the
7MB I get for gzip -9. Considering that this feature is optional, I
think it's okay to introduce a dependency on widespread modern
compression tools. (For comparison, bzip2 -9 gets us 6MB.)
