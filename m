Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E198D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Mar 2019 17:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389344AbfCART5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Mar 2019 12:19:57 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44546 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389262AbfCART5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Mar 2019 12:19:57 -0500
Received: by mail-qt1-f196.google.com with SMTP id d2so28549951qti.11
        for <linux-doc@vger.kernel.org>; Fri, 01 Mar 2019 09:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DHWPXUSg70P7oFntkIS7YhwNkOCIzd5Ta8zUZclrvFA=;
        b=a38jITjrVIFkNfD3sYQsTaS2Kaxy+KixXPvDeyZn5S8usJMZ/5lRTCMB2yAnydkY7r
         DsXdk145tMNPvCXHcjqRkVP15u/Qn1GLCwusg+6nVaUqWUu9jaB3auETlD7xRypZAqrg
         2cJo1/T76aCKJ+peFfvoJwrKwJ2MTxaGfj3ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DHWPXUSg70P7oFntkIS7YhwNkOCIzd5Ta8zUZclrvFA=;
        b=csSBl8i7yMT3GZlm3A65Ip1VxC8y5T/x7Fx49s9zkNsjUFqQTdzNBDSG3LsJ/lop18
         8gAksOryb7mSt6c7FrrtCszLXVxdEVgeMi0iyaNO/R+vB76H8lk0K1qiuUlKMixi0qwW
         dfURntraq2HXCRye3VyVMKVICttuv0aEo+1l/5QQFKV0v/TenrVYWO10r/YAQgfSS+9h
         qLdfk4/wZP0A1ok5pMRsf6QHM0BPc067KidwYW0tmMLgDvzEe8Vm52mWHIWX+0EmikbC
         H2a5TQWIGfo5FHlaAH6ACen6DIuMQabgyaOg0mwWNkRm0PniqwsapayOA7DkEegbXQz7
         TC4A==
X-Gm-Message-State: APjAAAWAX6fLll5ii4wRBWSd6IgFE9Mo9wWNTgyUf6ciUtddhgMRJ5bs
        L+2HDnLiYj0YObHITKasCSwVJg==
X-Google-Smtp-Source: APXvYqwUBsEMjs7fHoewfpA+usetH+sLk7wnSGVfLfrB2V8pslnDzmEBpnGnO9ol8VGVY1bV5GFoCw==
X-Received: by 2002:ac8:1aa6:: with SMTP id x35mr4937634qtj.218.1551460796033;
        Fri, 01 Mar 2019 09:19:56 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id l24sm15097453qtf.27.2019.03.01.09.19.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2019 09:19:54 -0800 (PST)
Date:   Fri, 1 Mar 2019 12:19:54 -0500
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
Message-ID: <20190301171954.GA217990@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
 <20190228144306.GA138215@google.com>
 <CAK7LNARTHJP=HzyBg_oBBL4whpxHXeijqk=zKLYpt=1GBLNGAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARTHJP=HzyBg_oBBL4whpxHXeijqk=zKLYpt=1GBLNGAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 01, 2019 at 03:25:05PM +0900, Masahiro Yamada wrote:
[...]
> > > I am guessing the user will run these commands
> > > on the target system.
> > > In other words, external modules are native-compiled.
> > > So,
> > >
> > >   target-arch: arm64
> > >   host-arch:   arm64
> > >
> > >
> > > Is this correct?
> > >
> > >
> > > If I understood the assumed use-case correctly,
> > > kheaders.tar.xw will contain host-programs compiled for x86,
> > > which will not work on the target system.
> > >
> >
> > You are right, the above commands in the commit message work only if the
> > host/target are same arch due to scripts.
> >
> > However we can build with arm64 device connected to a host, like this (which
> > I tested):
> >
> > adb shell modprobe kheaders; adb pull /proc/kheaders.tar.xz
> > rm -rf $HOME/headers; mkdir -p $HOME/headers
> > tar -xvf /proc/kheaders.tar.xz -C $HOME/headers >/dev/null
> > cd my-kernel-module
> > make -C $HOME/headers M=$(pwd) ARCH=arm64 CROSS_COMPILE=aarch64- modules
> > adb push test.ko /data/; adb shell rmmod kheaders
> >
> > The other way we can make this work is using x86 usermode emulation inside a
> > chroot on the Android device which will make the earlier commands work. One
> > thing to note is that Android also runs on x86 hardware so the commands in
> > the commit message will work even for x86 Android targets already.
> >
> > Also note that this the "module building" part is really only one of the
> > usecases. eBPF is another which needs the headers - and the headers are vast
> > majority of the archive. Headers take 3.1MB out of 3.6MB of the archive on
> > arm64 builds.
> >
> > How do you want to proceed here, should I mention these points in the commit
> > message?
> 
> 
> 
> I do not request a re-spin just for a matter of commit log,
> but this version produces an empty tarball.
> So, you will have a chance to update the patch anyway.
> 
> In the next version, it would be nice to note that
> "external modules must be built on the same host arch
> as built vmlinux".

Ok, I respun it with 1 more minor nit for arm64 building. Please take a look.

> Let me ask one more question.
> 
> I guess this patch is motivated by
> how difficult to convey kernel headers
> from vendors to users.
> 
> In that situation, how will the user find
> the right compiler to use for building external modules?
> 
> 
> 
> 
> Greg KH said:
> 
> We don't ever support the system of loading a module built with anything
> other than the _exact_ same compiler than the kernel was.
> 
> 
> For the full context, see this:
> https://lore.kernel.org/patchwork/patch/836247/#1031547

IMO this issue is not related to this patch but is just an issue with
building external modules in general. It is up to the user to use the right
compiler, etc. I will let Greg comment more on that.

thanks,

 - Joel

