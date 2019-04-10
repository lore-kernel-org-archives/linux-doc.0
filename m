Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA5FA7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 15:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbfDJPpI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 11:45:08 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35697 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbfDJPpI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 11:45:08 -0400
Received: by mail-ua1-f68.google.com with SMTP id a46so942505uae.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2019 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EOOzgOmnaW9PWM1ThtEHEbDTMZ3kGVHOn2+NNi5Gr40=;
        b=jO0olwCUmQkkI1+UF+TH3pc/VdIW42NCfyqi4pVYh0vexHpxwwY110t7HxlD3kSVrQ
         RHuZDOs8QheyCF5zbqqnai3cB0/tAjohu+Hdrzm2D58eUSaMZuirE6al7j5xLaNTnGYx
         TD+k5xm7dte+cGWrAZkqXLB5WF/TcuCWzHld4/qSq8RNmoLTsSFWfo2GbSddF4IWwgKR
         11LVYFGEAJmSoqg+tvdwmb2bBuxXnS8tBGerYJPG/39vD2iZZtiClf+aSSyozDzUIKS9
         a6Lzz2GFyxt5Ez0+ld/Z/7G9Iyf8sDTgwVa1cn2iBy82VCYnLJbitOTc9hKh2ub+WOl8
         eRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EOOzgOmnaW9PWM1ThtEHEbDTMZ3kGVHOn2+NNi5Gr40=;
        b=smDMxFBh5uxcQgk1ZbtemKyXT97cpKvMr8KcaradXDwupCrCGfLkkIJFgoFlaRn4ww
         YXCcIzVB8KjYBULAWMMSL+dl9v+0iYz4V1ixu9f4ildFn1v+c9+eKRXPAT5EjHe2C/TT
         FZdfyo1SbArFo0+gIoUry4c8fZNt5cGKqSOYSdxSK1xtdDGvb3wJ9324WeoSJMUKdsew
         MiQ7tks9fa/gt/AGCTOQwoYDHhziGVP70lSXF8mWNOL6ZJ7K0SY3Sz1yxbH8DQ/D/Ytd
         BV8F71xe2KEjIWkiH79eVNOFp2qTO8CcvOlwsIIU9ZvJeC50nKHtDzueV69J0VG07/X5
         COkg==
X-Gm-Message-State: APjAAAXjQKh+EscXDnI4WQ4RvUbUi2hzg3pYCfhMfvNEKUImj81OzJbA
        x/PGtsH1Q/bKEebneoevvQ/PVn7mqq0RFf7bth5sXQ==
X-Google-Smtp-Source: APXvYqw0TI6DnAqeMlVRPllfSCLVHooW+otPIG1dlwODTmK+smWDmG5Y1DN8DH9kflLZ4gQiLHA/ylQEgFCoCVv/w/A=
X-Received: by 2002:a9f:2c09:: with SMTP id r9mr21462395uaj.56.1554911106679;
 Wed, 10 Apr 2019 08:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <79b6bdbc-890a-5a51-7fa1-aec57889046a@opersys.com> <CAOesGMgGFunOeMt93f57fPspdDSHp2twahhudEDhMvZ=VPJHaQ@mail.gmail.com>
In-Reply-To: <CAOesGMgGFunOeMt93f57fPspdDSHp2twahhudEDhMvZ=VPJHaQ@mail.gmail.com>
From:   Daniel Colascione <dancol@google.com>
Date:   Wed, 10 Apr 2019 08:44:54 -0700
Message-ID: <CAKOZueuQFiUVA2N0jj3cb6WkN1AjwDz2C+Q85W_spcjyMLYmjA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel easier
To:     Olof Johansson <olof@lixom.net>
Cc:     Karim Yaghmour <karim.yaghmour@opersys.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Manoj Rao <linux@manojrajarao.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        atish patra <atishp04@gmail.com>,
        Daniel Colascione <dancol@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
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

On Wed, Apr 10, 2019 at 8:16 AM Olof Johansson <olof@lixom.net> wrote:
> Anyway, see my other reply just now -- CPIO + a filesystem view, and
> providing said cpio archive in debugfs for those who want to copy it
> off themselves might be something that fits everybody.

I don't think it's worth increasing the complexity of the kernel for
the sake of a little userspace convenience. By including the headers
in the kernel, we solve an important coordination problem --- but we
should solve this problem in the simplest possible way, pushing
whatever complexity possible to userspace, which is more flexible and
which evolves faster. Providing a compressed archive is fine. The user
burden is not large: it's just extracting an archive from a standard
container format. The kernel has no special advantageous way of doing
this job. If userspace wants to cache extraction, it can hash the
compressed archive itself and use the result as a key: it's only 3MB.
But extracting the archive every time is fine. We're not talking about
a huge amount of data, and I don't see a need for the kind of
long-term caching that would require revalidation.

As for cpio vs tar: IME, people are much more familiar with the
latter, and they're both omnipresent on unixish systems. I think it's
fine to rely on a tool that's been part of POSIX for over 30 years.
