Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE53C433ED
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 15:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4084161090
	for <linux-doc@archiver.kernel.org>; Sat,  8 May 2021 15:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhEHPh6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 May 2021 11:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhEHPh6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 May 2021 11:37:58 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E20C061574
        for <linux-doc@vger.kernel.org>; Sat,  8 May 2021 08:36:55 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id di13so13761757edb.2
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T80RW0N0f2bW+RbqzRU+sONErcUEsqlqhrSCovQJd4U=;
        b=J06BUQYI0u+DnqsTFDFBW9BAol4dCToP14yYTvqrpw03eRMBn6wqgvdBIcmTmtUa4A
         5W0K6bMRkpOlnT6CwcVWRYVNjl9UHUiTVQt8AyjTba2fa2urqSpsnng7MZQLkZqrRfpu
         j85e+lD83jQdKI1jb6V7KdAg91qs6OZW5Fam0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T80RW0N0f2bW+RbqzRU+sONErcUEsqlqhrSCovQJd4U=;
        b=BStpTZPkXJwMe1Dj4utYyZhp/BNylWlJcBBnJf6A/5r0zhQ62WaavM98kQFrYy4Glq
         cEkUtILXKoU7QIIAB2+/7eYkkfjWSzZAKKg+6CsQHsBVqghb6Mllhb0QzJaueo93Te8h
         YRGHRjS/xBCjkNTnX46VxA9PV3BIhY7JT+YGmVXdCOpn/vM3glLg8uqXtOkSlb4cM1wK
         IiDaho1M+UpPztAQtDuAE8OvQIpefaenxFnNzh1l3gzK2Ul+Nx8JvCc8vLy/IAoYG8pY
         XGK3O8+nHRYELEPE3WQFaNm+BAIe3n9O4w54nZPp/ynkxgAfVmW52MfBUZzTrmV518Z7
         kqEA==
X-Gm-Message-State: AOAM531ZBv1eAztoXfup1UTSmO3QdTfDF75+CgBD/iCzJ2RO4EwKA3np
        dERz94/OYpRTQ7kfzZxMqIc5WnXMGYwQ3DrAv6E=
X-Google-Smtp-Source: ABdhPJxd2ihbBCoNX3KCbYeuMGz6LAH28O/agJ8+IoyPINGLWacDgf4oBDsosMAnFMARrrg9AJSd2A==
X-Received: by 2002:a05:6402:c1:: with SMTP id i1mr18423654edu.315.1620488214236;
        Sat, 08 May 2021 08:36:54 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id q25sm5390236ejd.9.2021.05.08.08.36.54
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 08:36:54 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id s20so12619035ejr.9
        for <linux-doc@vger.kernel.org>; Sat, 08 May 2021 08:36:54 -0700 (PDT)
X-Received: by 2002:a05:651c:1311:: with SMTP id u17mr12053441lja.48.1620487859712;
 Sat, 08 May 2021 08:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210508122530.1971-1-justin.he@arm.com> <20210508122530.1971-2-justin.he@arm.com>
In-Reply-To: <20210508122530.1971-2-justin.he@arm.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 08:30:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
Message-ID: <CAHk-=wgSFUUWJKW1DXa67A0DXVzQ+OATwnC3FCwhqfTJZsvj1A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] fs: introduce helper d_path_fast()
To:     Jia He <justin.he@arm.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
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

On Sat, May 8, 2021 at 5:29 AM Jia He <justin.he@arm.com> wrote:
>
> This helper is similar to d_path except for not taking seqlock/spinlock.

I see why you did it that way, but conditional locking is something we
really really try to avoid in the kernel.

It basically makes a lot of static tools unable to follow the locking
rules, and it makes it hard for people to se what's going on too.

So instead of passing a "bool need_lock" thing down, the way to do
these things is generally to extract the code inside the locked region
into a helper function of its own, and then you have

  __unlocked_version(...)
  {
       .. do the actual work
  }

  locked_version(..)
  {
      take_lock(..)
      retval = __unlocked_version(..);
      release_lock(..);
      return retval;
  }

this prepend_path() case is a bit more complicated because there's two
layers of locking, but I think the pattern should still work fine.

In fact, I think it would clean up prepend_path() and make it more
legible to have the two layers of mount_lock / rename_lock be done in
callers with the restarting being done as a loop in the caller rather
than as "goto restart_*".

              Linus
