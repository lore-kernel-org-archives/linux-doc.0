Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 958917D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Feb 2019 23:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfB1X1z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Feb 2019 18:27:55 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34466 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbfB1X1y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Feb 2019 18:27:54 -0500
Received: by mail-qt1-f195.google.com with SMTP id w4so25769005qtc.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Feb 2019 15:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xWDbgPyPORkCT+/xgiItSx7wHOtxmHnj4rSzLgtTLKc=;
        b=G1RQ+ECQeMr60kO4r1ZkhYD+3Ntx/+zn5QM6zXYoPKZ1+Ypta9xmQK7xgJ8MqBSAnz
         7096XDsMJfXisgLXhRMSwWz7wTTlyRPys+wGUrVghyI5CG2fHkhMGoZi5R+9MisQLz5C
         1ypSB6uaLK0iR3hZqBgOY10fRnfgMBqfIBIG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xWDbgPyPORkCT+/xgiItSx7wHOtxmHnj4rSzLgtTLKc=;
        b=LnSFoj+dRyJAPx3RhdORosf6sP7oVhnTOZStO7g1LGo+j89lmWpp/LMejC0/NyJIfg
         jRvom/JzBJ5vM62sx1yHzq/LQsqSLqFi/NkbxspcDNLTZyWgMmwNWVcTptr6dr0pGb7d
         EH5RqJc13qRBT5tmeQB1xbL61rzlbXPivgNI2lr4+sY3EBOciQ+aOsD7Mal2J3aPYILW
         nZNWenlHdsP8oaJX8wJThn7iXtx+vBQFpjIhsFKA0AtS20B8h4KAn1CW1OlubXmBciQL
         A32c1BoPS60IgMDIaSOGfKW0j9sEPMk/9FuaZl22sChNXNPw+F6wkX+iPHwoBPwdO1C/
         CIvA==
X-Gm-Message-State: APjAAAXB1iFjHWGL4BKffo+MqGTaBTOEmcVWXfBsR2uIu3MZTlB1ve6P
        IeMCyiqYkRxZyKgGomQPbfcBJw==
X-Google-Smtp-Source: APXvYqw4r+UaA3CrJtnaKan7IMyZtlQMubNJDHssmoo4+UiLRFPgNNOIlIFEzlqRMJl+KQPs6uc0+Q==
X-Received: by 2002:ac8:19f5:: with SMTP id s50mr1580095qtk.25.1551396473234;
        Thu, 28 Feb 2019 15:27:53 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id l16sm11523673qke.20.2019.02.28.15.27.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 15:27:51 -0800 (PST)
Date:   Thu, 28 Feb 2019 18:27:51 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        qais.yousef@arm.com, Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
Message-ID: <20190228232751.GA218988@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
 <20190228144306.GA138215@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190228144306.GA138215@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 28, 2019 at 09:43:06AM -0500, Joel Fernandes wrote:
> On Thu, Feb 28, 2019 at 11:17:51AM +0900, Masahiro Yamada wrote:
> > Hi Joel,
> > 
> > 
> > On Thu, Feb 28, 2019 at 4:40 AM Joel Fernandes (Google)
> > <joel@joelfernandes.org> wrote:
> > >
> > > Introduce in-kernel headers and other artifacts which are made available
> > > as an archive through proc (/proc/kheaders.tar.xz file). This archive makes
> > > it possible to build kernel modules, run eBPF programs, and other
> > > tracing programs that need to extend the kernel for tracing purposes
> > > without any dependency on the file system having headers and build
> > > artifacts.
> > >
> > > On Android and embedded systems, it is common to switch kernels but not
> > > have kernel headers available on the file system. Raw kernel headers
> > > also cannot be copied into the filesystem like they can be on other
> > > distros, due to licensing and other issues. There's no linux-headers
> > > package on Android. Further once a different kernel is booted, any
> > > headers stored on the file system will no longer be useful. By storing
> > > the headers as a compressed archive within the kernel, we can avoid these
> > > issues that have been a hindrance for a long time.
> > >
> > > The feature is also buildable as a module just in case the user desires
> > > it not being part of the kernel image. This makes it possible to load
> > > and unload the headers on demand. A tracing program, or a kernel module
> > > builder can load the module, do its operations, and then unload the
> > > module to save kernel memory. The total memory needed is 3.8MB.
> > >
> > > The code to read the headers is based on /proc/config.gz code and uses
> > > the same technique to embed the headers.
> > 
> > 
> > 
> > Please let me ask a question about the actual use-case.
> > 
> > 
> > To build embedded systems including Android,
> > I use an x86 build machine.
> > 
> > In other words, I cross-compile vmlinux and in-tree modules.
> > So,
> > 
> >   target-arch: arm64
> >   host-arch:   x86
> > 
> > 
> > 
> The other way we can make this work is using x86 usermode emulation inside a
> chroot on the Android device which will make the earlier commands work.

I verified the steps to build a module on my Pixel 3 (arm64) with Linux
kernel for arm64 compiled on my x86 host:

After building the headers, the steps were something like:

1.Build an x86 debian image with cross-gcc:

sudo qemu-debootstrap --arch amd64
  --include=make,gcc,gcc-aarch64-linux-gnu,perl,libelf1,python
  --variant=minbase $DIST $RUN_DIR http://ftp.us.debian.org/debian

2. Push qemu-x86_64-static (which I downloaded from the web) onto the device.

3. Tell binfmt_misc about qemu:
echo
':qemu-x86_64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x3e\x00:
\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/qemu-x86_64-static:OC'
> /proc/sys/fs/binfmt_misc/register

4. adb shell and then chroot into the image

5. follow all the steps in the commit message but set ARCH and CROSS_COMPILE
appropriately.

After Make, kernel module is cooked and ready :)

thanks,

 - Joel

