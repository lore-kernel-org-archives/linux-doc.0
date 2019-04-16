Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BBE3F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 13:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbfDPNEq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 09:04:46 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36884 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728326AbfDPNEq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 09:04:46 -0400
Received: by mail-qt1-f196.google.com with SMTP id z16so23157763qtn.4
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2019 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dyyODE0ttOiq2JOet6neCffQ3LW3uGHaT76cMdNhKQU=;
        b=eMBoAjAKEC2QPSkTtDC6zvFgkqallSe5jceNRkvWTHVIv0/CzW/7FA1R+eGoa7gVTr
         k8Mz1DmnuNoJN4ufsTxFiCwyOYbxTT1yYgm7cnF4SIi17fgl7gYwV3YF1xyyqZXdfI4f
         SGbGuBkJ8D2PgdfISiUuWqNPS1+V6K83Kjkm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dyyODE0ttOiq2JOet6neCffQ3LW3uGHaT76cMdNhKQU=;
        b=F27wcDcOJx1s+UgsMNFL+XGB5e/j3kFcwnGAG8HYgzBQkS9CGAYo0SnzPfy8d9XhGk
         tCYL3wdrajtZNUOSGBxr2x7DDYSmR4OiyLI8A/3p3D47Rb2dV3L0iVNijVDd/HvS6gSj
         6mLQlxblJa5vLSrIbeH0GGOzjNu6x94ZXvANKfbSptNJ5exQWxAfd34CwTfCvr/gqJkS
         +43gen1RKIhbept+Ergjf5kf61m/pihLO1EVgOA64ig1QvhPeet5MyP2AtJTA49WIS6I
         vRk/z6IVXkuSKrtM/5hJ1lxzmTlI2ntfYpbCrZQ3vuWZdoG+lwdEzD02AvgccuT22TRz
         q5Wg==
X-Gm-Message-State: APjAAAWLZJpJ5ExbKwY1AJF24yJU+2hwKIQ+F/+PZEP3nphYJhm5PdnC
        n+KgKwBvLwwYc+NIhv3LEMMxSw==
X-Google-Smtp-Source: APXvYqyZ3MqAhTolVZpGfpu1m/BSpRdSq8K4VmKrQqrbquHpwonTER/JgjiaLdXnjqn3OwEM7gL1MQ==
X-Received: by 2002:a0c:b5d0:: with SMTP id o16mr65052800qvf.187.1555419884823;
        Tue, 16 Apr 2019 06:04:44 -0700 (PDT)
Received: from localhost ([2600:1003:b45e:46c8:3e5b:dc27:4ea5:df4a])
        by smtp.gmail.com with ESMTPSA id x28sm34955986qtx.71.2019.04.16.06.04.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 06:04:43 -0700 (PDT)
Date:   Tue, 16 Apr 2019 13:04:40 +0000
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Kees Cook <keescook@chromium.org>,
        Olof Johansson <olof@lixom.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
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
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
Message-ID: <20190416130440.GA7944@localhost>
References: <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home>
 <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home>
 <20190416124939.GB6027@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416124939.GB6027@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 16, 2019 at 02:49:39PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 16, 2019 at 08:33:06AM -0400, Steven Rostedt wrote:
> > On Mon, 15 Apr 2019 22:50:10 -0500
> > Kees Cook <keescook@chromium.org> wrote:
> > 
> > > On Mon, Apr 15, 2019 at 9:41 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > > > I agree with this assessment. We shouldn't use config.gz as precedence
> > > > for this solution. config.gz should have been in debugfs to begin with,
> > > > but I don't believe debugfs was around when config.gz was introduced.
> > > > (Don't have time to look into the history of the two).  
> > > 
> > > I don't agree with this: /proc/config.gz is used by a lot of tools
> > > that do sanity-check of running systems. This isn't _debugging_...
> > > it's verifying correct kernel builds. It's a fancy version of checking
> > > /proc/version.
> > > 
> > 
> > Then we should perhaps make a new file system call tarballs ;-)
> > 
> >  /sys/kernel/tarballs/
> > 
> > and place everything there. That way it removes it from /proc (which is
> > the worse place for that) and also makes it something other than debug.
> > That's what I did for tracefs.
> 
> As horrible as that suggestion is, it does kind of make sense :)
> 
> We can't put this in debugfs as that's only for debugging and systems
> should never have that mounted for normal operations (users want to
> build ebpf programs), and /proc really should be for processes but that
> horse is long left the barn.
> 
> But, I'm willing to consider putting this either in a system-fs-like
> filesystem, or just in sysfs itself, we do have /sys/kernel/ to play
> around in if the main objection is that we should not be cluttering up
> /proc with stuff like this.
> 

I am ok with the suggestion of /sys/kernel for the archive. That also seems
to fit well with the idea that the headers are kernel related and probably
belong here more strictly speaking, than /proc.

thanks,

- Joel


> thanks,
> 
> greg k-h
