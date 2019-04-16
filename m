Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B85727D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 17:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbfDPRWv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 13:22:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38707 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727180AbfDPRWv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 13:22:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id p14so19843918ljg.5
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2019 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=teLrKWBJL8PYLLheXxLHFCByZ+NGmGgF48F54jGmNmU=;
        b=NR1FsJ7cAE+Yhvw6jJ92R3jwPdAFWhBkmWNekvPM0VQugn4LtIkbgJdQ25zvJ31/s6
         EbAsB91gYIvJNKcsOJwyE3t4c9rtdAlNwp+anCsc0fYhptrZcarbrnfheOkROLuxzgmk
         zST7fuy0QSXlySwG2fvxvBU3UINxkvGuufenA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=teLrKWBJL8PYLLheXxLHFCByZ+NGmGgF48F54jGmNmU=;
        b=sLEb5McZkyiLPELRFmmqRTvTiwBUyjGyMzB7uogftL0YBPiOd3551QvKLduHW7ucFG
         r7davzyYtVeOLHF5v7AmTTeovBo10DAQF51a7fLLXeXdDzXUqRODkhKUM0KmP7cSj1nP
         9H1D8848SZJthO0zymumikDSF+oG9Z0P0Bf95eY+woAKuhVLGzc2tmORM79E77MIEn1K
         K19uPTXUQ348dnhzrLzCaLA92MqnumE/UwVu4/HYmH89RfMM9BqROj/Hr9h6GdcK33jp
         7vAgvGgYXlQn30TbiCbfW32tkKlbJYJ+L0nNcfNmmSu6WATgFofr6Vs8/gGLEEZSRVyb
         xCYg==
X-Gm-Message-State: APjAAAWvwDBBX/4soqs6QSCGnczwL6B+SupB2miFYxwIsNgHLiAKrCKV
        RU9LP0OPNJVnuov28V9Me+w4QX5HRoW7onghSinUJw==
X-Google-Smtp-Source: APXvYqxZteqC8ERtgpAkWtZFuixQenPXlZ5ha+FDwpWOAVUTWKODqK1kWk7yAc4GvI7EbPzn7ayGGpGjIsXiUNdmUr4=
X-Received: by 2002:a2e:3803:: with SMTP id f3mr46633107lja.165.1555435369399;
 Tue, 16 Apr 2019 10:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <20190415104109.64d914f3@gandalf.local.home> <CAGXu5j+KPVRcOJ3Ue9ZQF93GyaDhvCnFCvJ_C3WKCx2=SNdDyg@mail.gmail.com>
 <20190416083306.5646a687@gandalf.local.home> <20190416124939.GB6027@kroah.com>
 <20190416130440.GA7944@localhost> <f8b15e31-1aab-ab2c-d44d-47325faab67d@opersys.com>
 <20190416094509.1af6326b@gandalf.local.home> <20190416142240.GA31920@kroah.com>
 <20190416164642.krptlz32zusr4pgn@ast-mbp.dhcp.thefacebook.com> <CAOesGMgGEZ8o-e2uAYLSGeO+RHcXAEzEoKcsjpveOLJZ5pX=4w@mail.gmail.com>
In-Reply-To: <CAOesGMgGEZ8o-e2uAYLSGeO+RHcXAEzEoKcsjpveOLJZ5pX=4w@mail.gmail.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Tue, 16 Apr 2019 13:22:38 -0400
Message-ID: <CAEXW_YS=C8FkC1h4ZQ6_jX8jY==Xe66c+q9cgM=Ci+N7SyNz6w@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel easier
To:     Olof Johansson <olof@lixom.net>
Cc:     Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Karim Yaghmour <karim.yaghmour@opersys.com>,
        Kees Cook <keescook@chromium.org>,
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

On Tue, Apr 16, 2019 at 12:57 PM Olof Johansson <olof@lixom.net> wrote:
[snip]
> > Where kheaders.tar.xz is placed doesn't really matter.
> > /proc or /sys/kernel makes no real difference.
>
> If done in a location that isn't a perpetual ABI commitment, a tarball
> solution is something we can work with.

This is the part I don't get, Olof. It has to be an ABI commitment so
that the tools always work. Why are we so interested in breaking
userspace tools? We want a robust solution, not a fragile one.

thanks,

 - Joel
