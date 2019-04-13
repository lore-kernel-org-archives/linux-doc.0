Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6DEF57D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 13 Apr 2019 03:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbfDMDTC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 23:19:02 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40146 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfDMDTB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Apr 2019 23:19:01 -0400
Received: by mail-vs1-f68.google.com with SMTP id f22so6654425vso.7
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2019 20:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qAmpE3G0oOsflpcYUOecHLM2RaT+tXXFiDXT/2FM05k=;
        b=aSBOYv2SXshliFLxSy4uYTsfmpZPFXrOFc84rPFriHb3qm3rzjl1mGUwpHCSxqcpxR
         g7jt3WCjgzBJ0+BqzTOcD3JPCxC2bB7Vk7UHUwtlBMsRdNPK4Okp5IGmSG5OrBFjy8eJ
         N/HDnZiJP2nyUmMBtxy5DSbTT7IPjR+YH+SYQeo8MnKl6DH/4yVWJnWSG0WT/X6rrMKp
         33an5f/Pu5geWlAzxi0fCXCgcZzftxzxNEbtgoH0S2exKJT+vKWD+/56L7pZ0HNggAZD
         kvFy94aRQtKN0sgRclWG9E+ub3DntOG94yjGRovBiWAejeltQ9aZqa2tEXAnjOfdOAhA
         bW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAmpE3G0oOsflpcYUOecHLM2RaT+tXXFiDXT/2FM05k=;
        b=pJVSB6S4qI+GZ0SI+w9xrq/c4VF3nc43Y5wALVGOzFhLWajAbOoYYWwqppvyKduXdh
         2QefzKY34KO8XkPe+541t1Iweg2Pim89SYSdtELciDMWYLsRvMmml9eaNa/jPMWMm0UW
         WA0c/8eCIBgmOnsB9z8mfO/xFLjwen+A8Hq9mSbMCIJnXrmzG8q80RS2uWyHGJhmbSCJ
         A4JRYx7te6tk2+S0jjHftQMp4ecCiQnkrsMtRAb+wkkATpQBU0GM8rmodEBgd1JXhLls
         UmBGjkqzYo1C3RK9u0NlcTmzxjtWHGVRX/75cIHKQ8vEEKtAkCroxUMRmSGyoilSEI9h
         8mIg==
X-Gm-Message-State: APjAAAWyk9sqJfDlZuzGldFPpsqu70W8mFRrxIfRf1WFAt4GmeVdp4QW
        ZHwYkhn3jfwfFBalh+tHHKJBfdSMEP+zBDSBwEPRKQ==
X-Google-Smtp-Source: APXvYqxV4TtiwDsxsirehWHSbYq4591Y8OO46Atnr9GDtlWJwOcktgDhlMV+aMMJrbGwwhR0oR1tOaInjum0Tt05F7Q=
X-Received: by 2002:a67:e9c8:: with SMTP id q8mr31353496vso.120.1555125540368;
 Fri, 12 Apr 2019 20:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190408212855.233198-1-joel@joelfernandes.org>
 <CAK7LNAQgvhozubW9b2yqnxHAVE17VHHZiq6N4Py_TzFCHN0YUQ@mail.gmail.com>
 <20190412180014.GA175945@google.com> <CAK7LNAT83SijpivFJA8GS=bOsgfnV03fo+-QJFgO1SgmLBOiQw@mail.gmail.com>
 <CAKOZueuf8qM1O7c+m7zRHv1b6-YsZmWoTBfErBLY+yV1pyESmQ@mail.gmail.com>
 <CAK7LNATW0EQ+uYqGgEbzp1pzajs2CBOWT937JOCNnepP3AAD1g@mail.gmail.com> <CAK7LNAS8LroP_N76ZS2OLZKaxSMA3UubdE1r7QzkqCt-TFmnWA@mail.gmail.com>
In-Reply-To: <CAK7LNAS8LroP_N76ZS2OLZKaxSMA3UubdE1r7QzkqCt-TFmnWA@mail.gmail.com>
From:   Daniel Colascione <dancol@google.com>
Date:   Fri, 12 Apr 2019 20:18:49 -0700
Message-ID: <CAKOZuetDdtGoN8aNm6KF2N3Oz-QGO3PeTex=7VLoem_jDeaknw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] Provide in-kernel headers to make extending kernel easier
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 12, 2019 at 8:10 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, Apr 13, 2019 at 11:58 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Sat, Apr 13, 2019 at 10:53 AM Daniel Colascione <dancol@google.com> wrote:
> > >
> > > On Fri, Apr 12, 2019 at 6:49 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > On Sat, Apr 13, 2019 at 3:02 AM Joel Fernandes <joel@joelfernandes.org> wrote:
> > > >
> > > > >
> > > > > > > +extern char kernel_headers_data;
> > > > > > > +extern char kernel_headers_data_end;
> > > > > > > +
> > > > > > > +static ssize_t
> > > > > > > +ikheaders_read_current(struct file *file, char __user *buf,
> > > > > >
> > > > > > Could you stretch this line ?
> > > > > > It will still fit in 80-cols.
> > > > > >
> > > > > > (This is a coding style error in kernel/configs.c)
> > > > >
> > > > > It takes 87 cols if I expand, so I'll leave it as is.
> > > > >
> > > >
> > > >
> > > > Sorry if what I said was unclear.
> > > >
> > > > Since I just did not a good reason to put
> > > > "static ssize_t" in the previous line,
> > > > I meant like follows:
> > > >
> > > >
> > > > [Before]
> > > > static ssize_t
> > > > ikheaders_read_current(struct file *file, char __user *buf,
> > > >                        size_t len, loff_t *offset)
> > > >
> > > >
> > > >
> > > > [After]
> > > > static ssize_t ikheaders_read_current(struct file *file, char __user *buf,
> > > >                                       size_t len, loff_t *offset)
> > > >
> > > >
> > > > (takes 74-cols.)
> > > >
> > > >
> > > > (I am sending this from Gmail, so I am not sure
> > > > how it will look like from you...)
> > > >
> > > >
> > > > Anyway, it is super-bikeshedding stuff.
> > > > It is OK as-is.
> > > >
> > >
> > > What about sorting the files for determinism?
> >
> >
> > Do you mean the order of files in the tar archive?

Yes.

> > I think it is a good idea for reproducible build.
> >
> >
> >
> > It looks like the tar command supports --sort=name option,
> > but I did not test it at all.
> >
> >
> >
> > Perhaps, the sorting policy could be affected by locale.
> > We saw it for the 'find' command.
>
>
> 'sort' command is affected by locale.

It should be independent of locale if you set LC_ALL=C in the
environment while running it.
