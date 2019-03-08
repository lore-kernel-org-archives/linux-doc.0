Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2EB967D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 17:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfCHR7D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 12:59:03 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38684 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfCHR7C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Mar 2019 12:59:02 -0500
Received: by mail-qk1-f194.google.com with SMTP id z3so4477865qkf.5
        for <linux-doc@vger.kernel.org>; Fri, 08 Mar 2019 09:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W1f5Wda2J5uNjk6aESlDfe8IAn1m1fVzVi5fETvAmjo=;
        b=PGGluBavue/FAI7gDizroJBHQxP2yBnK2z4wjABJrLUhGG+lKAcIgE/dHw260BRckE
         LUUh60Jmy/fgTOVDMDxthpTxwlmPRrVk8lwop0ekHWI6savbJLDZZHCyFja7GoEYYfnR
         O9thZOeAIs7VI3jjClE40IXZ/fVXQYvpdkw84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W1f5Wda2J5uNjk6aESlDfe8IAn1m1fVzVi5fETvAmjo=;
        b=ptSmFGf4rNxxmkri0/yU53ujK+JXZCSOr4UUuViB2/Ek2sLT6Oeau4+0/CjyrPxK+M
         t/qWhVZlN4NpyRN8MDphQ6Ucvq4zWI44LJoj4z5Xwdh0AFr4jZiy9dwStZAd2mH7xRO3
         D/fRaS80igGtQSkYsPKzlapQCKCiPM/QRI2lvDRVlM6pqiIRw/o+UXqnO8ik2d2hJjRo
         aRzmNZJ/d2zdFIrKLhPboCzBsa51zpwgZ/8Gd6ULBlxe+4Nsatav71GNuOzYATF1IObM
         4e8gJCsJgrLhe34enAekuiefvMrZJ96c8j2DRy0cRYQ+TsS3oCiPoT5blY1aDvC2xGZH
         Terw==
X-Gm-Message-State: APjAAAUA+FHYP+fq70jrYXXmn3xjzzTcxnWY9gvtT9Cli4qKKcAPBCVH
        TxD37U/kDtzUba26e+OEoRbL9w==
X-Google-Smtp-Source: APXvYqyxAp+nrfAmh3cy9iq/s8pjc1oQSBMr9XJPCFUq9bjr267Tb8UFa4wFNjMihP1nP0zDc9VRMw==
X-Received: by 2002:a37:7cf:: with SMTP id 198mr15094454qkh.173.1552067941484;
        Fri, 08 Mar 2019 09:59:01 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id j17sm2061239qtj.61.2019.03.08.09.59.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 09:59:00 -0800 (PST)
Date:   Fri, 8 Mar 2019 12:58:59 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        LKML <linux-kernel@vger.kernel.org>,
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
        Android Kernel Team <kernel-team@android.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH v4 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
Message-ID: <20190308175859.GA61742@google.com>
References: <20190301160856.129678-1-joel@joelfernandes.org>
 <CAMuHMdU77UyUs-LvRx-NN_k0Y7MZXQkBdgL2i83veCkvdzeeqA@mail.gmail.com>
 <20190307150343.GB258852@google.com>
 <CAMuHMdW_7BTZREsnz7uMTToCZ4HDOZboMJH8k8UZica2pB=Jew@mail.gmail.com>
 <CAEXW_YQUcA+bnav20tAFQPXYE=epMie4X85diudKs_s-TJ7dsw@mail.gmail.com>
 <20190308140251.GC25768@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190308140251.GC25768@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 08, 2019 at 03:02:51PM +0100, Greg KH wrote:
> On Fri, Mar 08, 2019 at 05:42:32AM -0800, Joel Fernandes wrote:
> > HI Geert,
> > 
> > On Fri, Mar 8, 2019, 3:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > It is just so much easier to use tar + xz at build time, and leave the
> > > > decompression task to the user. After decompression, the files will live on
> > > > the disk and the page-cache mechanism will free memory when/if the files fall
> > > > off the LRUs.
> > >
> > > I'm also considering how generic and extensible the solution is.
> > > What if people need other build artifacts in the future (e.g. signing key to
> > > load signed modules)?
> > 
> > That sounds like it could be useful. I don't see any reason off the
> > top why that would not be possible to add to the list of archived
> > files in the future. The patch allows populating the list of files
> > from Kbuild using ikh_file_list variable.
> 
> Um, no, you don't want the signing key in the kernel itself, as that
> totally defeats the purpose of the signing key :)

*Bangs self to desk*. You are right, didn't think that one through ;)

By the way, my v5 is ready to send. But I am avoiding sending it due to the
merge window going on. I posted it yesterday in this thread as well:
https://lore.kernel.org/patchwork/comment/1241077/

This is likely to be the final version or so, unless Masahiro or you or other
reviewers have any more comments.

thanks,

 - Joel

