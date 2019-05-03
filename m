Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2822C7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 May 2019 15:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfECPI3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 May 2019 11:08:29 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40777 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfECPI3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 May 2019 11:08:29 -0400
Received: by mail-pf1-f193.google.com with SMTP id u17so3029861pfn.7
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2019 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kNTkQVNOA2OoGY05E27L56yuHsdvzUwDV9bMvSlE76A=;
        b=MFvmRDDkIMtc9BaQDjrWPOSUDO9Jo1/wdFL+oMmuaFtd8BrX+9VVatnVk8YjQSnsoW
         BsziOIyoxXHvWBYgvME24AJwRTKzg1v5hpxTEyKu2vSeYGAOa5tUX3uW7FhbKDdETQyb
         5v+yKc70MV3v8Y806ihEUUkgJzSgITzNo64UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kNTkQVNOA2OoGY05E27L56yuHsdvzUwDV9bMvSlE76A=;
        b=PsbyJodiqe9eezW4jgNb1I+hgvJi5XloMjvMluMMpqEzTw8QwYG+TwL6EictCZkRED
         ir0J2/8Zy+eiO6HyERVZKyZxS/scTLw7g8ewKtq5mE3OpBE6bCsQ4Eay+1hpy9pGCAXg
         eW9S5D8Ft3k6KIDRejaxAXM9/tg7LPLc2BWXl/Kxq9iag6GTpkPG9hJmACSzPBUyQhLv
         MUpfcJEQRIBYP/GdO7rSn7zy3g+wNkdOUUCNhhWFW/Xth4Kk9XAWhARYph3sAYQFQ29k
         r1BiItT+8CMTPh3YFGMBi4XuppeHSpew6U+Senfeb6DdtmeqVd8PIaRRWli4oEsqVhod
         ozSg==
X-Gm-Message-State: APjAAAWkR/jCBruKzYS9BMv+Df1BrXduyx87nZMf6+KjdVlgaMpwt9qx
        kKufqDgUJoz9iIwaoXVFXYusyQ==
X-Google-Smtp-Source: APXvYqw24XwNGkccqq09Ydr+Lfzc0vUPYmCja1k9q/7RdUIA3TyzF/y1fhaSR7qOXsBcDbXc//83LQ==
X-Received: by 2002:a65:5c82:: with SMTP id a2mr11014324pgt.378.1556896108024;
        Fri, 03 May 2019 08:08:28 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id d3sm3262715pfn.113.2019.05.03.08.08.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 08:08:27 -0700 (PDT)
Date:   Fri, 3 May 2019 11:08:25 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v7 resend 1/2] Provide in-kernel headers to make
 extending kernel easier
Message-ID: <20190503150825.GC253329@google.com>
References: <20190426190430.172543-1-joel@joelfernandes.org>
 <20190427133844.GA29366@kroah.com>
 <20190429132602.GA165075@google.com>
 <20190429135455.GA2412@kroah.com>
 <CAK7LNARkGLQ_P4LSuC69QN8XPN47W5ujkDE3EauLrwnBgygsSA@mail.gmail.com>
 <20190429142425.GB29007@kroah.com>
 <20190503103315.0149ca71@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503103315.0149ca71@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 03, 2019 at 10:33:15AM -0400, Steven Rostedt wrote:
> On Mon, 29 Apr 2019 16:24:25 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > Hah, ok, I'll be glad to queue this up in my tree.  I'll take it now,
> > and if people who really object to this being in /proc/ and want it in
> > /sys/, we can add a follow-on patch before 5.2-final is out to move the
> > file to that location.
> 
> I really don't think putting it in /proc now is a good idea. Let's put
> it in /sys now. If we don't do it now and it gets into a main release,
> then that will become the permanent location for it.

I will send a patch to move it into /sys/kernel on top of this. Hope everyone
else is also Ok with that as the location.

thanks,

 - Joel

