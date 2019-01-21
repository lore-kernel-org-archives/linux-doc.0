Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03FFD7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 07:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbfAUH00 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 02:26:26 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45812 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbfAUH00 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jan 2019 02:26:26 -0500
Received: by mail-qk1-f194.google.com with SMTP id y78so11712604qka.12
        for <linux-doc@vger.kernel.org>; Sun, 20 Jan 2019 23:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lONtkiqyKhw6wJdDMgAWrhoxueC0crWy4Gbu5d+6KMA=;
        b=CkKS14Lo9uQGM6OeAi7F4Ea4m7bmBemzauxSmPJR8q8lHnT0+I9VSHEpiJgB26L5yY
         IiU1U/bK2q9UGg7uU3Grx/NGJmRKBsjrkcXTOXXgTL5Cdq8SkP3NK/4/0aODciA+9qM9
         SITNZP/KbEK5izWX+Eql6+AjgkYk72mkTff/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lONtkiqyKhw6wJdDMgAWrhoxueC0crWy4Gbu5d+6KMA=;
        b=Bh1KbkpwEshvoF1SiIi6mEDLv+VEIiIIrBgjNqGf0CBwKMj/rnaSFATRmxVqeeiVkp
         Wx+4jSSipHKLi60D90EUPbO+h3knUQkfkWLMTsks+kj7YuVoRXF7LRdnw8PxQVlgcerg
         7heDUZ/AorJZTE6YLhy72uMYG6X9MwT0/F/ABbn7LVCYiKKFcCcZst2cbNDjskHeHORt
         /zpnIbnarVRyHu83ZEa6ifheODC5Y4dh5z2LuGGJoEWTlLp6WZ0ZPk0IXAO0RqhCSyE+
         9D2BgiIQtssPb4oiUXQl0V40juEWPn1lRQAQBLzbrIy7Oin2eqqyohfejGgeqTdUIpg+
         PvbA==
X-Gm-Message-State: AJcUukcQ6kj+Yzl7xnsj662L+axG8IIlxkexOb2HG5SIcIpS4K/dFcHF
        430IJ/Ht8Gdcq3lG4uy/YESSJA==
X-Google-Smtp-Source: ALg8bN7gG3MUR1B2ZzE7xUVa0/MOltiUFuC3YhpjOFEk+sIMU51vjqEydy3HqT9DKmC1xvfKsIRnTg==
X-Received: by 2002:a37:2714:: with SMTP id n20mr22697209qkn.349.1548035155889;
        Sun, 20 Jan 2019 17:45:55 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id c12sm84665129qka.42.2019.01.20.17.45.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Jan 2019 17:45:54 -0800 (PST)
Date:   Sun, 20 Jan 2019 20:45:53 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     hpa@zytor.com
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, Borislav Petkov <bp@alien8.de>,
        dancol@google.com, Ingo Molnar <mingo@redhat.com>,
        Jan Kara <jack@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
        karim.yaghmour@opersys.com, Kees Cook <keescook@chromium.org>,
        kernel-team@android.com, linux-doc@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the
 kernel
Message-ID: <20190121014553.GD23827@google.com>
References: <20190118225543.86996-1-joel@joelfernandes.org>
 <20190119102800.GB17723@infradead.org>
 <20190119103606.GA17400@kroah.com>
 <8BD4CB7A-944C-4EC5-A198-1D85C9EE28D6@zytor.com>
 <20190120161003.GB23827@google.com>
 <A40C22DF-B43F-44BA-8148-FC0881087315@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A40C22DF-B43F-44BA-8148-FC0881087315@zytor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 20, 2019 at 01:58:15PM -0800, hpa@zytor.com wrote:
> On January 20, 2019 8:10:03 AM PST, Joel Fernandes <joel@joelfernandes.org> wrote:
> >On Sat, Jan 19, 2019 at 11:01:13PM -0800, hpa@zytor.com wrote:
> >> On January 19, 2019 2:36:06 AM PST, Greg KH
> ><gregkh@linuxfoundation.org> wrote:
> >> >On Sat, Jan 19, 2019 at 02:28:00AM -0800, Christoph Hellwig wrote:
> >> >> This seems like a pretty horrible idea and waste of kernel memory.
> >> >
> >> >It's only a waste if you want it to be a waste, i.e. if you load the
> >> >kernel module.
> >> >
> >> >This really isn't any different from how /proc/config.gz works.
> >> >
> >> >> Just add support to kbuild to store a compressed archive in
> >initramfs
> >> >> and unpack it in the right place.
> >> >
> >> >I think the issue is that some devices do not use initramfs, or
> >switch
> >> >away from it after init happens or something like that.  Joel has
> >all
> >> >of
> >> >the looney details that he can provide.
> >> >
> >> >thanks,
> >> >
> >> >greg k-h
> >> 
> >> Yeah, well... but it is kind of a losing game... the more in-kernel
> >stuff there is the less smiley are things to actually be supported.
> >
> >It is better than nothing, and if this makes things a bit easier and
> >solves
> >real-world issues people have been having, and is optional, then I
> >don't see
> >why not.
> >
> >> Modularizing is it in some ways even crazier in the sense that at
> >that point you are relying on the filesystem containing the module,
> >which has to be loaded into the kernel by a root user. One could even
> >wonder if a better way to do this would be to have "make
> >modules_install" park an archive file – or even a directory as opposed
> >to a symlink – with this stuff in /lib/modules. We could even provide a
> >tmpfs shim which autoloads such an archive via the firmware loader;
> >this might even be generically useful, who knows.
> >
> >All this seems to assume where the modules are located. In Android, we
> >don't
> >have /lib/modules. This patch generically fits into the grand scheme
> >things
> >and I think is just better made a part of the kernel since it is not
> >that
> >huge once compressed, as Dan also pointed. The more complex, and the
> >more
> >assumptions we make, the less likely people writing tools will get it
> >right
> >and be able to easily use it.
> >
> >> 
> >> Note also that initramfs contents can be built into the kernel.
> >Extracting such content into a single-instance tmpfs would again be a
> >possibility
> >
> >Such an approach would bloat the kernel image size though, which may
> >not work
> >for everyone. The module based approach, on the other hand, gives an
> >option
> >to the user to enable the feature, but not have it loaded into memory
> >or used
> >until it is really needed.
> >
> >thanks,
> >
> > - Joel
> 
> Well, where are the modules? They must exist in the filesystem.

The scheme of loading a module doesn't depend on _where_ the module is on the
filesystem. As long as a distro knows how to load a module in its own way (by
looking into whichever paths it cares about), that's all that matters.  And
the module contains compressed headers which saves space, vs storing it
uncompressed on the file system.

To remove complete reliance on the filesystem, there is an option of not
building it as a module, and making it as a built-in.

I think I see your point now - you're saying if its built-in, then it
becomes kernel memory that is lost and unswappable. Did I get that right?
I am saying that if that's a major concern, then:
1. Don't make it a built-in, make it a module.
2. Don't enable it at for your distro, and use a linux-headers package or
whatever else you have been using so far that works for you.

thanks,

 - Joel

