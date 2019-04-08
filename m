Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 05A9D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Apr 2019 16:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbfDHQhm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Apr 2019 12:37:42 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45847 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfDHQhm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Apr 2019 12:37:42 -0400
Received: by mail-vs1-f67.google.com with SMTP id o10so5397946vsp.12
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2019 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9IlUa8m3xDpekIS/zrks2Wt9SrOTYVzn9mule2toAB4=;
        b=KtUUCfcwmLx3US+MM/FL/0J3T5kftE8Tq0Hk2fz6BaZ9d4N7oYXaLCuy0zdBrdWxfp
         NDJbe+9A1dwytgj7gxQQXpTTnHKAAMfhfxuvZwZx8QZDkpQXv8nwjx1DqTwOnPwXh6FK
         +0HUP+k1AJ0ECJsEuByWwaL+WfaeNBaizb3iIoLLsc6tfqQz22Bu0lmKLJYupcQFk5tk
         jfNy6o0DyvbxbGMA6Gwkqw5+RZMTsgoDzC59xf1+bQ6z5IiCThtlJ7o3qmvubydSRxgi
         Ox85EteCxoWRa0MMKXLhBKSiVDYWqjaOKa38WLDpZP015Ach7Kmx2uxWDxqSzS5sMl/u
         SKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9IlUa8m3xDpekIS/zrks2Wt9SrOTYVzn9mule2toAB4=;
        b=MnAD5n/D6sMldgU368SPgwsgwM2bY/MD0LM8FlahwIf9UA163vefZ6hS9CRrYrHb5t
         Fu/5v6T9HilJDdxpw7TeB7MVVji8nQcWsYNYKUaTvJcgtOoG8vZhL0xDrjvF0RTXQ9of
         EAGjz1gfX/oYfDfxTMlG7DNKxnoge96kujSad1DT+nRQ6tvTsEdpDyuQhYpktrYAD2BZ
         ftwJyNB2wwKiK+1QGiPzZTRgKOD9l/Y2LPxHaZIk+9aO0RruM5UV8SlJNGpw4bgXPgAM
         vPhRGOlFIrqNOp8NkvCA8oxWYOeLu28Ne6Asjf1WyLZOMcsCzasgatc6Rs+jSm77NMRZ
         1mnw==
X-Gm-Message-State: APjAAAWS0BLZ20vzqi0qMFSPSO5fGqlg42EuZ+QNkYFDiAXG/MOFyv9q
        +E5pjCBPy0WpMajct2VRkZGFbMpAFPaHHBcWtBLezA==
X-Google-Smtp-Source: APXvYqwMFSCSdejVc781Rn2RwWEegSZcxCFAJc60CoAIQzAT1GnGpVuTE7cvq+PbThfylgDoBswb5m6X8viqhHLD6og=
X-Received: by 2002:a05:6102:212:: with SMTP id z18mr17595535vsp.218.1554741460796;
 Mon, 08 Apr 2019 09:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190320163116.39275-1-joel@joelfernandes.org> <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
In-Reply-To: <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
From:   Daniel Colascione <dancol@google.com>
Date:   Mon, 8 Apr 2019 09:37:28 -0700
Message-ID: <CAKOZuetS6Bg0ubxQgCBKVKeWOzuwH_C=nCRn-OPmHYJvs6sybQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel easier
To:     Olof Johansson <olof@lixom.net>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Manoj Rao <linux@manojrajarao.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 8, 2019 at 9:29 AM Olof Johansson <olof@lixom.net> wrote:
>
> Hi,
>
> On Wed, Mar 20, 2019 at 9:31 AM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> >
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> > it possible to build kernel modules, run eBPF programs, and other
> > tracing programs that need to extend the kernel for tracing purposes
> > without any dependency on the file system having headers and build
> > artifacts.
> >
> > On Android and embedded systems, it is common to switch kernels but not
> > have kernel headers available on the file system. Further once a
> > different kernel is booted, any headers stored on the file system will
> > no longer be useful. By storing the headers as a compressed archive
> > within the kernel, we can avoid these issues that have been a hindrance
> > for a long time.
> >
> > The best way to use this feature is by building it in. Several users
> > have a need for this, when they switch debug kernels, they donot want to
> > update the filesystem or worry about it where to store the headers on
> > it. However, the feature is also buildable as a module in case the user
> > desires it not being part of the kernel image. This makes it possible to
> > load and unload the headers from memory on demand. A tracing program, or
> > a kernel module builder can load the module, do its operations, and then
> > unload the module to save kernel memory. The total memory needed is 3.8MB.
> >
> > By having the archive available at a fixed location independent of
> > filesystem dependencies and conventions, all debugging tools can
> > directly refer to the fixed location for the archive, without concerning
> > with where the headers on a typical filesystem which significantly
> > simplifies tooling that needs kernel headers.
> >
> > The code to read the headers is based on /proc/config.gz code and uses
> > the same technique to embed the headers.
> >
> > To build a module, the below steps have been tested on an x86 machine:
> > modprobe kheaders
> > rm -rf $HOME/headers
> > mkdir -p $HOME/headers
> > tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> > cd my-kernel-module
> > make -C $HOME/headers M=$(pwd) modules
> > rmmod kheaders
> >
> > Additional notes:
> > (1) external modules must be built on the same arch as the host that
> > built vmlinux. This can be done either in a qemu emulated chroot on the
> > target, or natively. This is due to host arch dependency of kernel
> > scripts.
> >
> > (2)
> > If module building is used, since Module.symvers is not available in the
> > archive due to a cyclic dependency with building of the archive into the
> > kernel or module binaries, the modules built using the archive will not
> > contain symbol versioning (modversion). This is usually not an issue
> > since the idea of this patch is to build a kernel module on the fly and
> > load it into the same kernel. An appropriate warning is already printed
> > by the kernel to alert the user of modules not having modversions when
> > built using the archive. For building with modversions, the user can use
> > traditional header packages. For our tracing usecases, we build modules
> > on the fly with this so it is not a concern.
> >
> > (3) I have left IKHD_ST and IKHD_ED markers as is to facilitate
> > future patches that would extract the headers from a kernel or module
> > image.
> >
> > (v4 was Tested-by the following folks,
> >  v5 only has minor changes and has passed my testing).
> > Tested-by: qais.yousef@arm.com
> > Tested-by: dietmar.eggemann@arm.com
> > Tested-by: linux@manojrajarao.com
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>
> Sorry to be late at the party with this kind of feedback, but I find
> the whole ".tar.gz in procfs" to be an awkward solution, especially if
> there's expected to be userspace tooling that depends on this
> long-term.
> [snip]

The approaches you proposed were explored in detail on this thread and
other related threads. The tarball in proc approach is a simple,
pragmatic approach that allows makes a lot of scenarios Just Work
where they didn't before. Approaches like a new filesystem, a
mountable block device, a custom debuginfo format, and so on add
complexity without providing concrete gains in functionality. We'd
like to get this work into the tree sooner rather than later.
