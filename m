Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A9A327D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 16:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbfDPQ5V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 12:57:21 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:36743 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfDPQ5V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 12:57:21 -0400
Received: by mail-it1-f193.google.com with SMTP id y10so33683504itc.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2019 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EU46mLQQ7G089XieiXXUNG+kvC8Kcv5wsXaiLDfWNPM=;
        b=hmZzhUQ1FwKF58/BA7qKfuPVO7YbSv0RBE33RVGiBatJnffk3jyClBySbZoneDLHaU
         17pi5JG572jswpbG3sm3Yy+GTH0OLGDDyudPCL2O7/hOvS9mIU8IgtEm1/ZbnII+5T1q
         GDdCEPcXsulbIEM6uYikY9Lealf8lno5CoThLmUg6v7WHv5mv9WgNBWIl2eOagfhvJhH
         zOlpODIhHJg0VqCtGk9OtDfx5yZkWZI8HLAFS9u8Q3lepbHr9VSjzROvVVSxaNq8Swuc
         eF0AfeR7boqKeBlAhtCA6cKFpFrMIsaCnXj4ohfJ8E1e8JYuB05X7/sg6ingMGk4WH9U
         mvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EU46mLQQ7G089XieiXXUNG+kvC8Kcv5wsXaiLDfWNPM=;
        b=Cjk62T6CMnKNe22XhQ/XgqPG3g2mX1hndv5PKwxwh2YHhGzC2NgSujAMJ+k8aQH+tr
         olmC1fDnzjYXWWGdg3/xHiIloWCHnFC7jm4AS4YsaXb388YuKOgJ1oGcml1/S26c0kqC
         dagLMXJBqXMq0BN2PwyMNqiUnS2Q8ItOHALqBjYFzN8b+jgOafbIf0bckpEvxYbNMDbG
         h3CN+BENWxYr8fz5ZqaSIB9XsQHQ+PGvTUWtDtSqLieE3JLTYv5RneFZGwbnSa8Jx16U
         GNqDJtXYrfZG9vGa6LjvsVATzR+otJEjN3ygrvKVKU/rnPJ6jIfuUS6t6KgIMpXGLH9W
         Iv5w==
X-Gm-Message-State: APjAAAXArVCPdvMKbBMRmm0Vf3XViWnQYE6DafIP88IAaDZzmlwItjKV
        doToggj79BzdJsROtG+7d2znJ/fP00OrSCrtLHiXEA==
X-Google-Smtp-Source: APXvYqxB08JGEDtscMYEYo8Sg5HwPOOG6oPOAiZrsbLH5xeEilW+y2/SxXthJNaZVzYc8OPGM1YjpXTW7H4SV9tcS6E=
X-Received: by 2002:a24:2458:: with SMTP id f85mr29260925ita.83.1555433839807;
 Tue, 16 Apr 2019 09:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home> <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home> <20190416124939.GB6027@kroah.com>
 <20190416130440.GA7944@localhost> <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
 <20190416094509.1af6326b@gandalf.local.home> <20190416142240.GA31920@kroah.com>
 <20190416164642.krptlz32zusr4pgn@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20190416164642.krptlz32zusr4pgn@ast-mbp.dhcp.thefacebook.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Tue, 16 Apr 2019 09:57:08 -0700
Message-ID: <CAOesGMgGEZ8o-e2uAYLSGeO+RHcXAEzEoKcsjpveOLJZ5pX=4w@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel easier
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Kees Cook <keescook@chromium.org>,
        Olof Johansson <olof@lixom.net>,
        Joel Fernandes <joelaf@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Manoj Rao <linux@manojrajarao.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 16, 2019 at 9:46 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Apr 16, 2019 at 04:22:40PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 16, 2019 at 09:45:09AM -0400, Steven Rostedt wrote:
> > > On Tue, 16 Apr 2019 09:32:37 -0400
> > > Karim Yaghmour <karim.yaghmour@opersys.com> wrote:
> > >
> > > > >>> Then we should perhaps make a new file system call tarballs ;-)
> > > > >>>
> > > > >>>   /sys/kernel/tarballs/
> > > > >>>
> > > > >>> and place everything there. That way it removes it from /proc (which is
> > > > >>> the worse place for that) and also makes it something other than debug.
> > > > >>> That's what I did for tracefs.
> > > > >>
> > > > >> As horrible as that suggestion is, it does kind of make sense :)
> > > > >>
> > > > >> We can't put this in debugfs as that's only for debugging and systems
> > > > >> should never have that mounted for normal operations (users want to
> > > > >> build ebpf programs), and /proc really should be for processes but that
> > > > >> horse is long left the barn.
> > > > >>
> > > > >> But, I'm willing to consider putting this either in a system-fs-like
> > > > >> filesystem, or just in sysfs itself, we do have /sys/kernel/ to play
> > > > >> around in if the main objection is that we should not be cluttering up
> > > > >> /proc with stuff like this.
> > > > >>
> > > > >
> > > > > I am ok with the suggestion of /sys/kernel for the archive. That also seems
> > > > > to fit well with the idea that the headers are kernel related and probably
> > > > > belong here more strictly speaking, than /proc.
> > > >
> > > > This makes sense. And if it alleviates concerns regarding extending
> > > > /proc ABIs then might as well switch to this.
> > > >
> > > > Olof, what do you think of this?
> > >
> > > BTW, the name "tarballs" was kind of a joke. Probably should come up
> > > with a better name. Although, I'm fine with tarballsfs ;-)
> >
> > No need to have this be a separate filesystem, we can use a binary sysfs
> > file in /sys/kernel/ for this as the kernel is not doing any "parsing"
> > of the data, it is just dumping it out to userspace.
>
> What folks keep saying that an fs of header files is easier to use
> than tarball from bcc and cleaner from architectural pov.
> That's not the case.
> From bcc side I'd rather have a single precompiled headers blob
> that I can feed into clang and improve bpf program compilation time.
> Having a set of headers is a step to generate such .pch file,
> but once generated the headers can be removed from fs and kheaders
> module unloaded.
> The sequence is: bcc checks standard /lib/module location,
> if not there loads kheader mod, extracts into known location, and unloads.

May I suggest keeping the bcc-populated headers somewhere else?
Ideally something cleaned out on every reboot in case kernel changes
without version string doing it.

That way you can by default prefer the module-exported tarball, and
fall back to /lib/module/$(uname -r)/ if not available, instead of the
other way around and instead of having to check creation times on the
dir vs boot time of the kernel, etc.

Anyway, that's just an implementation detail. But it's the kind of
detail that all tools that use this would need to get right, instead
of doing it right once by exporting it in a way that it can be
directly used.

> The extraced headers are in plain fs cache and will be evicted from memory
> when bcc is done compiling progs.
> imo much cleaner than kernel maintaining headers-fs and wasting memory.

So, in my original proposal I recommended unmounting when not needing
it, which would remove the memory usage as well.

> Where kheaders.tar.xz is placed doesn't really matter.
> /proc or /sys/kernel makes no real difference.

If done in a location that isn't a perpetual ABI commitment, a tarball
solution is something we can work with.


-Olof
