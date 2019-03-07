Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4425B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 15:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfCGPDq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 10:03:46 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44782 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfCGPDq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 10:03:46 -0500
Received: by mail-qt1-f195.google.com with SMTP id d2so17365674qti.11
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2019 07:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LF3ZaGkaDkYBPIzCy3ko65W4LrXvmffQ2n5IWDXJrEk=;
        b=eBLRAH52F59yMTShnGgcH2g+hhK3F63/5ufdl21vExODLxlgWzSjZBlVEsshaNrkmw
         vcsIqmb1XtEfpvHyskolW9dFdVqQ1qEAHcCMsNtv3ZYOE4j3Xib2Q15LAdHligXFOa52
         wsXwyUJlOZWvxwJLGMrxr3vDxnLS0L+vfXW2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LF3ZaGkaDkYBPIzCy3ko65W4LrXvmffQ2n5IWDXJrEk=;
        b=U4iXVXtp6Gag4X1qxo1FTpe+jYaevylhNgZabdiaOfk9qn4CIbnDo/lmZvQJuilnBb
         zkv8FOitE9y1pU+VM5EFq34qSnBWILP7xMVJkPp8bgnHsq5O/pQ9waf8K40S4kS7g0NO
         tnHC9VtZk10WorBaCQwczPl5GI8DtxKnR5yXM+k42bU8zpTn3UXIMj7y9Au3GWqOrSYU
         j0AFcxCp2fj47fIrLh6VpvbyHMUQKQCCh4eligv2PDfRhbbWYvUuMmiou6TTdDGQOwlc
         RAhqgmxwa1uRfYWWfpxzM9rpP9zM77dwN6QZLNW11HW8i+y8eP+8nHgpDwSLz7BeAIGL
         GlfQ==
X-Gm-Message-State: APjAAAWqnJc8aWcAx0Ctmc+B4S6ebynJHeX9UXMAdetRxZz4X6o6LYMN
        8mrKySWI78EbMdW9W0jF8u0DcQ==
X-Google-Smtp-Source: APXvYqw3/1cSkf0VeAiarh6ht2okqPmKPajl5XY2uMHRvMWvqHpNWQWKwtvAi90ICnXwEeuS46fSvg==
X-Received: by 2002:a0c:d994:: with SMTP id y20mr11084931qvj.100.1551971024981;
        Thu, 07 Mar 2019 07:03:44 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id s16sm3501487qks.90.2019.03.07.07.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 07:03:43 -0800 (PST)
Date:   Thu, 7 Mar 2019 10:03:43 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>, atishp04@gmail.com,
        dancol@google.com, Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, qais.yousef@arm.com,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, yhs@fb.com
Subject: Re: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
Message-ID: <20190307150343.GB258852@google.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 07, 2019 at 09:58:24AM +0100, Geert Uytterhoeven wrote:
> Hi Joel,
> 
> On Fri, Mar 1, 2019 at 5:10 PM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> > it possible to build kernel modules, run eBPF programs, and other
> > tracing programs that need to extend the kernel for tracing purposes
> > without any dependency on the file system having headers and build
> > artifacts.
> >
> > On Android and embedded systems, it is common to switch kernels but not
> > have kernel headers available on the file system. Raw kernel headers
> > also cannot be copied into the filesystem like they can be on other
> > distros, due to licensing and other issues. There's no linux-headers
> > package on Android. Further once a different kernel is booted, any
> > headers stored on the file system will no longer be useful. By storing
> > the headers as a compressed archive within the kernel, we can avoid these
> > issues that have been a hindrance for a long time.
> >
> > The feature is also buildable as a module just in case the user desires
> > it not being part of the kernel image. This makes it possible to load
> > and unload the headers on demand. A tracing program, or a kernel module
> > builder can load the module, do its operations, and then unload the
> > module to save kernel memory. The total memory needed is 3.8MB.
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
> 
> As the usage pattern will be accessing the individual files, what about
> implementing a file system that provides read-only access to the internal
> kheaders archive?
> 
>     mount kheaders $HOME/headers -t kheaders

I thought about it already. This is easier said than done though. The archive
is compressed from 40MB to 3.6MB. If we leave it uncompressed in RAM, then it
will take up the entire 40MB of RAM and in Android we don't even use
disk-based swap.

So we will need some kind of intra file compressed memory representation that
a filesystem can use for the backing store. I thought of RAM-backed squashfs
but it requires squashfs-tools to be installed at build time (which my host
distro itself didn't have).

It is just so much easier to use tar + xz at build time, and leave the
decompression task to the user. After decompression, the files will live on
the disk and the page-cache mechanism will free memory when/if the files fall
off the LRUs.

WDYT?

thanks,

  - Joel
