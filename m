Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D90E7D913
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 15:52:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbfBKPwJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 10:52:09 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33751 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731479AbfBKOhf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 09:37:35 -0500
Received: by mail-qt1-f193.google.com with SMTP id z39so2504760qtz.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Feb 2019 06:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BL5iHRkcccKA8FdHxpHE3KhsniMEbRJogSEslS7YXsg=;
        b=F5nUGw7xJFBiSmrVMvBoczItu39z9beFNKW72xK61xl/VPP5OVTf2vVOqWknSZXsdl
         hFmwtB3WZB8XRfMS9vbQDMixANp9gJ9cpvHX/FSP+oIzDTxPd4m8LtI3QANo8ZkPllit
         xOp3BUtDjFZffnEI26yHiCLjQvX6iSrYaTbYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BL5iHRkcccKA8FdHxpHE3KhsniMEbRJogSEslS7YXsg=;
        b=sxc6uz7v/uCLthzFpCLs4riGzK2BIhPP/urIhab8X1K/gZl/PtlsI1bc/EzrLJYQhg
         j4WI10DnS+MYPtsDS3hPlscdLALFBoks11bcWkmLOyGzlnmkBM9RRqioQSVIMoDgdUqX
         XUpTaAmPq2tG/1UEkGMFSJUTlU+XsohjGiboZcoBAev2OKWGaEErPiTwz/G13JcQEw1b
         b0ApG4D2XkeAhKkDOFuDYl07eH86WTaxWrpuHUAb+J++WhIKELNVz8ViQq0IXEybb2cN
         H9wmgDiiqKtDcO4yzg94fKtXUbmqivSnLiO61mTfJTC2KV6boUwMwIv/ahBK/fLWDSFm
         5/3g==
X-Gm-Message-State: AHQUAua8kxZB/Fq3/q+/4em9bp0NuwURuiZgeZbQ5qBAIA4Wl4p828xy
        Q28j905rvfwhKjGMnJSay60WZw==
X-Google-Smtp-Source: AHgI3IawcAstlgS88lkJsxuVLLYVGdCNMjXBuwKt1XW0f1RkPhCru48k6TsQG+HGsnFDYQwHkxC5DA==
X-Received: by 2002:a0c:8698:: with SMTP id 24mr8163114qvf.188.1549895854417;
        Mon, 11 Feb 2019 06:37:34 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id 55sm10863520qtq.88.2019.02.11.06.37.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Feb 2019 06:37:33 -0800 (PST)
Date:   Mon, 11 Feb 2019 09:37:32 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>, atishp04@gmail.com,
        dancol@google.com, Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Manoj Rao <linux@manojrajarao.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
Message-ID: <20190211143732.GA210318@google.com>
References: <20190207211102.154634-1-joel@joelfernandes.org>
 <CAK7LNAREaZdc6=SgR215j25+By3upKe11EpRFZFC-fYAFa5roQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAREaZdc6=SgR215j25+By3upKe11EpRFZFC-fYAFa5roQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 11, 2019 at 10:39:43AM +0900, Masahiro Yamada wrote:
> On Fri, Feb 8, 2019 at 6:13 AM Joel Fernandes (Google)
> <joel@joelfernandes.org> wrote:
> >
> > Introduce in-kernel headers and other artifacts which are made available
> > as an archive through proc (/proc/kheaders.txz file). This archive makes
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
> > tar -xvf /proc/kheaders.txz -C $HOME/headers >/dev/null
> > cd my-kernel-module
> > make -C $HOME/headers M=$(pwd) modules
> > rmmod kheaders
> >
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> > Changes since RFC:
> > Both changes bring size down to 3.8MB:
> > - use xz for compression
> > - strip comments except SPDX lines
> > - Call out the module name in Kconfig
> > - Also added selftests in second patch to ensure headers are always
> > working.
> >
> >  Documentation/dontdiff    |  1 +
> >  arch/x86/Makefile         |  2 ++
> >  init/Kconfig              | 11 ++++++
> >  kernel/.gitignore         |  2 ++
> >  kernel/Makefile           | 29 +++++++++++++++
> >  kernel/kheaders.c         | 74 +++++++++++++++++++++++++++++++++++++++
> >  scripts/gen_ikh_data.sh   | 19 ++++++++++
> >  scripts/strip-comments.pl |  8 +++++
> >  8 files changed, 146 insertions(+)
> >  create mode 100644 kernel/kheaders.c
> >  create mode 100755 scripts/gen_ikh_data.sh
> >  create mode 100755 scripts/strip-comments.pl
> >
> > diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> > index 2228fcc8e29f..05a2319ee2a2 100644
> > --- a/Documentation/dontdiff
> > +++ b/Documentation/dontdiff
> > @@ -151,6 +151,7 @@ int8.c
> >  kallsyms
> >  kconfig
> >  keywords.c
> > +kheaders_data.h*
> >  ksym.c*
> >  ksym.h*
> >  kxgettext
> > diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> > index 88398fdf8129..ad176d669da4 100644
> > --- a/arch/x86/Makefile
> > +++ b/arch/x86/Makefile
> > @@ -240,6 +240,8 @@ archmacros:
> >  ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s
> >  export ASM_MACRO_FLAGS
> >  KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)
> > +IKH_EXTRA += arch/x86/kernel/macros.s
> > +export IKH_EXTRA
> 
> 
> This does not exist in any of released kernels.
> 
> See commit 6ac389346e6

Ok, thanks fixed it in v2 which I just sent and rebased on linus master branch. 

- Joel

