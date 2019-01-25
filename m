Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B809C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 Jan 2019 20:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbfAYUfF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 Jan 2019 15:35:05 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43430 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfAYUfF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jan 2019 15:35:05 -0500
Received: by mail-vs1-f67.google.com with SMTP id x1so6429223vsc.10
        for <linux-doc@vger.kernel.org>; Fri, 25 Jan 2019 12:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=83fXAUpWsk7Zx8K8xl4WoDl3abwNlJzwQQNiZa7/O/w=;
        b=E25Eh9OGP0rP3TCMmwt2JfLPlF6phN2VI6PWNNrCDOyyLWZZUbUYgKGnlQ8iiLVU1y
         97MHt8bvYGxvsme4utOhQvL1y1TFBRvd+x0xfhs1JU++Pt8lN8G6QEh5kI7si/Zuj5vE
         K0oz1VCKPuwqojUwLnH6Gah3XrXw5tA2ikuTXvutmryrLiFvWdGtHmHVVX8u4qVK3dIJ
         MnHmV59PjFXMrgivECVEKkKlx0ijTnK8THCYIeyO5W+hKGzufukNTX0nXrqih6ExghMp
         0Vx96wX4KahBM+29svrvpSS6yTuv7iPMSJOiHZmM5nmSUtELBndb8dw/TLm5ocIHfqZJ
         c8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=83fXAUpWsk7Zx8K8xl4WoDl3abwNlJzwQQNiZa7/O/w=;
        b=L4KvxFFXziqnIAp8yD1EdVbI6CX985Sckp8I3wTu471BOEG/T4RijSXX2ZZW44KDDz
         DakpR6Z+f21FiBN2Km/A0aKMlZmoyRqBQDQZQ+GCG4AB1LIoqdtUke1qkARxlAmLDums
         4ydz6HlirgpxHn+zwPImZtHzJ2LfY7zRJHAjoFlfusJvUnIYutN2/oVs3eLCFZr/2M4A
         +zmcdz1ir0lT0GPWa32u9flIqtUy991SP4OMEeMIioizCMv7GXvB0xbGGgnNczeGVcUj
         yTY6o/Ob+XALq3sewb1cPvGqTXkHsgWYC7mb7OYnJvCQ1ZOVMS0eqehfEN7QRrBPMOhF
         Dzgg==
X-Gm-Message-State: AJcUukdevBjMuhsswxrTwXuC7KpPQIxpsXKIsNvKOHfqsh6b1xm7D3VN
        jERKjWM/6C6DrAz8seCKN9DmeOETolDE2Pys7MWT0g==
X-Google-Smtp-Source: ALg8bN6wqw3ztqtVmkQ85HN4Mq47HcgXvKDOb3gj7J0vqPajVxyWueh++u+sK3P4k6lPN7u7hc/eivBtxDjUOVBjdbQ=
X-Received: by 2002:a67:b44:: with SMTP id 65mr5106835vsl.77.1548448503258;
 Fri, 25 Jan 2019 12:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20190119103606.GA17400@kroah.com> <8BD4CB7A-944C-4EC5-A198-1D85C9EE28D6@zytor.com>
 <20190120161003.GB23827@google.com> <A40C22DF-B43F-44BA-8148-FC0881087315@zytor.com>
 <20190121014553.GD23827@google.com> <BC774ED4-C0FC-4AA6-9BAF-36930A661D9B@zytor.com>
 <20190122133901.GA189736@google.com> <117d2f96-b0e9-2376-69b7-836fa0c52539@opersys.com>
 <CAKOZuesWgo3CZj49aUChX_-dpijCrVLxgVZChyLLmOWXCLQf-Q@mail.gmail.com>
 <6f82d99a-d877-aeae-3e63-95dff260c445@opersys.com> <20190124205929.GA141510@google.com>
 <50511D3D-7193-4B1C-952E-CCC37FA71388@zytor.com> <CAKOZuesOBTr82vsZo3OUa7hs03EbYMPg2cAhKyZW2QsS3uQXAQ@mail.gmail.com>
 <48D020BD-D344-41CC-9D32-033F592605EB@zytor.com>
In-Reply-To: <48D020BD-D344-41CC-9D32-033F592605EB@zytor.com>
From:   Daniel Colascione <dancol@google.com>
Date:   Fri, 25 Jan 2019 12:34:52 -0800
Message-ID: <CAKOZuesqiiETDRQdPxvgRKLA1sjhiySg_tTPHCB=xGVY4uMstw@mail.gmail.com>
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the kernel
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atish patra <atishp04@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
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

On Fri, Jan 25, 2019 at 12:28 PM <hpa@zytor.com> wrote:
>
> On January 25, 2019 11:15:52 AM PST, Daniel Colascione <dancol@google.com> wrote:
> >On Fri, Jan 25, 2019 at 11:01 AM <hpa@zytor.com> wrote:
> >>
> >> On January 24, 2019 12:59:29 PM PST, Joel Fernandes
> ><joel@joelfernandes.org> wrote:
> >> >On Thu, Jan 24, 2019 at 07:57:26PM +0100, Karim Yaghmour wrote:
> >> >>
> >> >> On 1/23/19 11:37 PM, Daniel Colascione wrote:
> >> >[..]
> >> >> > > Personally I advocated a more aggressive approach with Joel in
> >> >private:
> >> >> > > just put the darn headers straight into the kernel image, it's
> >> >the
> >> >> > > *only* artifact we're sure will follow the Android device
> >> >whatever
> >> >> > > happens to it (like built-in ftrace).
> >> >> >
> >> >> > I was thinking along similar lines. Ordinarily, we make loadable
> >> >> > kernel modules. What we kind of want here is a non-loadable
> >kernel
> >> >> > module --- or a non-loadable section in the kernel image proper.
> >> >I'm
> >> >> > not familiar with early-stage kernel loader operation: I know
> >it's
> >> >> > possible to crease discardable sections in the kernel image, but
> >> >can
> >> >> > we create sections that are never slurped into memory in the
> >first
> >> >> > place? If not, maybe loading and immediately discarding the
> >header
> >> >> > section is good enough.
> >> >>
> >> >> Interesting. Maybe just append it to the image but have it not
> >loaded
> >> >and
> >> >> have a kernel parameter than enables a "/proc/kheaders" driver to
> >> >know where
> >> >> the fetch the appended headers from storage at runtime. There
> >would
> >> >be no
> >> >> RAM loading whatsoever of the headers, just some sort of
> >> >> "kheaders=/dev/foobar:offset:size" parameter. If you turn the
> >option
> >> >on, you
> >> >> get a fatter kernel image size to store on permanent storage, but
> >no
> >> >impact
> >> >> on what's loaded at boot time.
> >> >
> >> >Embedding anything into the kernel image does impact boot time
> >though
> >> >because
> >> >it increase the time spent by bootloader. A module OTOH would not
> >have
> >> >such
> >> >overhead.
> >> >
> >> >Also a kernel can be booted in any number of ways other than mass
> >> >storage so
> >> >it is not a generic Linux-wide solution to have a kheaders= option
> >like
> >> >that.
> >> >If the option is forgotten, then the running system can't use the
> >> >feature.
> >> >The other issue is it requires a kernel command line option /
> >> >bootloader
> >> >changes for that which adds more configuration burden, which not be
> >> >needed
> >> >with a module.
> >> >
> >> >> > Would such a thing really do better than LZMA? LZMA already has
> >> >very
> >> >> > clever techniques for eliminating long-range redundancies in
> >> >> > compressible text, including redundancies at the sub-byte level.
> >I
> >> >can
> >> >> > certainly understand the benefit of stripping comments, since
> >> >removing
> >> >> > comments really does decrease the total amount of information
> >the
> >> >> > compressor has to preserve, but I'm not sure how much the
> >encoding
> >> >> > scheme you propose below would help, since it reminds me of the
> >> >> > encoding scheme that LZMA would discover automatically.
> >> >>
> >> >> I'm no compression algorithm expert. If you say LZMA would do the
> >> >> same/better than what I suggested then I have no reason to contest
> >> >that. My
> >> >> goal is to see the headers as part of the kernel image that's
> >> >distributed on
> >> >> devices so that they don't have to be chased around. I'm just
> >trying
> >> >to make
> >> >> it as palatable as possible.
> >> >
> >> >I believe LZMA is really good at that sort of thing too.
> >> >
> >> >Also at 3.3MB of module size, I think we are really good size-wise.
> >But
> >> >Dan
> >> >is helping look at possibly reducing further if he gets time. Many
> >> >modules in
> >> >my experience are much bigger. amdgpu.ko on my Linux machine is
> >6.1MB.
> >> >
> >> >I really think making it a module is the best way to make sure this
> >is
> >> >bundled with the kernel on the widest number of Android and other
> >Linux
> >> >systems, without incurring boot time overhead, or any other command
> >> >line
> >> >configuration burden.
> >> >
> >> >I spoke to so many people at LPC personally with other kernel
> >> >contributors,
> >> >and many folks told me one word - MODULE :D.  Even though I
> >hesitated
> >> >at
> >> >first, now it seems the right solution.
> >> >
> >> >If no one seriously objects, I'll clean this up and post a v2 and
> >with
> >> >the
> >> >RFC tag taken off. Thank you!
> >> >
> >> > - Joel
> >>
> >> So let me throw in a different notion.
> >>
> >> A kernel module really is nothing other than a kernel build system
> >artifact stored in the filesystem.
> >>
> >> I really don't at any reason whatsoever why this is direct from just
> >producing an archive and putting it in the module directory, except
> >that the latter is far simpler.
> >>
> >> I see literally *no* problem, social or technical, you are solvin by
> >actually making it a kernel ELF object.
> >
> >Joel does have a point. Suppose we're on Android and we're testing a
> >random local kernel we've built. We can command the device to boot
> >into the bootloader, then send our locally-built kernel to the device
> >with "fastboot boot mykernelz". Having booted the device this way,
> >there's no on-disk artifact corresponding to mykernelz: we just sent
> >the boot kernel directly to the device's memory. Now, suppose I want
> >to attach DCTV or some other fancy ftrace-based analysis tool to the
> >device in order to study how mykernelz acts in some scenario I care
> >about. With Joel's approach, DCTV would be able to grab the kernel
> >headers from the running kernel, compile whatever kprobe or BPF
> >incantations needed, and have everything Just Work. If we put the
> >headers only on disk without any way to retrieve them at runtime, we'd
> >need a different path for kernel self-description in the case where a
> >running kernel doesn't have an on-disk representation, and that adds a
> >lot of complexity for everyone everywhere. By providing
> >guaranteed-correct kernel headers via some runtime interface, we make
> >a lot of things Just Work, and that has value.
>
> Joel specifically is talking about using a module, which *does* have to be in the filesystem.
>
> You can't have it both ways, unfortunately.

In general, whatever we support in module form, we also support as
part of the kernel image itself.
