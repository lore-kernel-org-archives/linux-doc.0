Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E86C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 22:48:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 412A061402
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 22:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhEHWtD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 18:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhEHWtA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 18:49:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B9AC061574
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 15:47:58 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h4so17992089lfv.0
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uU2C84LxLUzQFwZElgypUBzdpgy1KMmCT9LOJvhbML4=;
        b=RAYIrloAyTI0escC4FJrZEqff58mGNKpKYKPCWyfaq6tPSVX7E0HvbEpZICexuWOJl
         cTb8VTtrxxvNrokrOEsTOilRR8r0Du+gtbA27yAia0bgOluq1xb1ES21ZBT6x5owDQfQ
         d+VnnukbT/eYVV1K8DnY34CmcMlPrprr6+vgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uU2C84LxLUzQFwZElgypUBzdpgy1KMmCT9LOJvhbML4=;
        b=p1M7a2pJE8NiHo/uWYMIsyEBuHTCfBVqRuLxv8WQEpWjGOqk5BfHuVBUiTxJpFYGr2
         tP4KprNYYYKceiSXtVd9dDWooByWUGnS9O4HJvgruiEay0eqi0BFCgiByLSFiIKRy775
         4sUcqPyzkR+kDwp2oGLCbxaIfIQBiCAsrqSu6WzaOpb17nxoz1dhh/QvUXyI9ZBHg+AF
         wlzxxSVvsN7PhjBL9MQgSS/28n84RtJ+be3jf9aqcw/lB2M37LNTwr1FDsE5waivsSOP
         4tzSLRMUEbugHhugE27N+biaBEj/jmEqvq0xss/4rJXuonWwDl9mK1Y0Ofe+7/4R2Dq3
         4epg==
X-Gm-Message-State: AOAM530eRkJjmB5C3O6pdCUpua7fKDOLRTYsriyIEnINzuMemN+M//7d
        KtOYE6oFkbiyiQXa6KaTmgZVgPIUdzbuJ8noXYc=
X-Google-Smtp-Source: ABdhPJyKFe2ckS1ln36NjzLTHIgnDLwj20v1X1m39QNdrL8F1T8pOKRdNud7JWDuQeFal2HO+2uHyg==
X-Received: by 2002:a05:6512:3b9b:: with SMTP id g27mr11807614lfv.230.1620514075850;
        Sat, 08 May 2021 15:47:55 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id h8sm457368lfv.63.2021.05.08.15.47.54
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 15:47:54 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id r5so734977lfr.5
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 15:47:54 -0700 (PDT)
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr10765354lfg.40.1620514074003;
 Sat, 08 May 2021 15:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210508122530.1971-1-justin.he@arm.com> <20210508122530.1971-2-justin.he@arm.com>
 <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
 <YJbivrA4Awp4FXo8@zeniv-ca.linux.org.uk> <CAHk-=whZhNXiOGgw8mXG+PTpGvxnRG1v5_GjtjHpoYXd2Fn_Ow@mail.gmail.com>
 <YJb9KFBO7MwJeDHz@zeniv-ca.linux.org.uk> <CAHk-=wjhrhkWbV_EY0gupi2ea7QHpGW=68x7g09j_Tns5ZnsLA@mail.gmail.com>
In-Reply-To: <CAHk-=wjhrhkWbV_EY0gupi2ea7QHpGW=68x7g09j_Tns5ZnsLA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 15:47:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiOPkSm-01yZzamTvX2RPdJ0784+uWa0OMK-at+3XDd0g@mail.gmail.com>
Message-ID: <CAHk-=wiOPkSm-01yZzamTvX2RPdJ0784+uWa0OMK-at+3XDd0g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] fs: introduce helper d_path_fast()
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Jia He <justin.he@arm.com>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@ftp.linux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 8, 2021 at 3:42 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But your READ_ONCE() is definitely the right thing to do (whether we
> do your re-org or not, and whether we do this "prepend_buffer" thing
> or not).

Oh, and looking at it some more, I think it would probably be a good
thing to make __dentry_path() take a

       struct prepend_buffer *orig

argument, the same way prepend_path() does. Also, like prepend_path(),
the terminating NUL should probably be done by the caller.

Doing those two changes would simplify the hackery we now have in
"dentry_path()" due to the "//deleted" games. The whole "restore '/'
that was overwritten by the NUL added by __dentry_path() is
unbelievably ugly.

            Linus
