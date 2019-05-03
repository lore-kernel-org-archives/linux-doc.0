Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3424A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 May 2019 06:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfECGsn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 May 2019 02:48:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35188 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfECGsn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 May 2019 02:48:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id g24so4422022otq.2
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2019 23:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B/vgrL6mFJjbubEtdk9xy4dCVOTfDfNigFjtHMJz6Hg=;
        b=BWFlXcxdKPCg7HeydPM9nymqdJaKu5v0FhgYXNSsx2wC9FgZ6BWl9owIL4tp34RHzV
         0O2CI2x3Gf2dd6TLPVl+UCJIuR6ugbJgNiJ5ahKuIYIQ+IA6TXvM7s76WSfiT5u9UOjU
         BAmfjJWmXXmLvLfanifCHtnmcT9eQgxYIv2/nMEQ/h+Jh7SQ4Wq8KAXXS2vmQSRvUjv3
         lY5jQIBJ2XBRYHgExTQbP6djFMEjOYOf+5XNpdQj+/aplIkBZPZ/tX1ygb8a9ZyYzeEG
         YiV5A2XgkK4p5mdxg0WTkGqiAuXfNRl77gHQcoJRclt/bqm0TtNUGFDJL3udF8SKeGs/
         dUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B/vgrL6mFJjbubEtdk9xy4dCVOTfDfNigFjtHMJz6Hg=;
        b=f5QSEOwLEhEvFubcuHoQKXF3XX7lkIrVR47InbxYEaVOydtKPEqIjyAmWU+yNeb/wR
         rXRk7Ox3S+q+S4uRtrxNNOFhhly67mSRvs7tMHRtUOVXF3lypApaoZB1cPYf9uwTXiPW
         PtwqpmZ5PCGvgb1As0DYMar22XyJEya6S8HZgasXsXwaG4yD1FsMlHZVodlPhAFhA104
         z1ZnD7trYhjXQ9CfiwPV5Zb+oyqvzE7jppKn4qb3O2YH+DmKa4c062xHblzm7n4KQDSD
         n/zXGliIeDXlAbWR0J9Ii9C9Y3UIQ80Jvv+bl5SSHS1MRlRkmIuroCXwrU6jzaPGRxha
         /C4g==
X-Gm-Message-State: APjAAAW1OqBuTn3+Nr02sjGOPfDtGnpe6k30veIcbZSA/JQ+w49ppjuD
        dYVo6Vfiyrg9/CCT9CKOPH9yYeH5fDnfpF/X6cYkbQ==
X-Google-Smtp-Source: APXvYqyPne+GcGg5xCp23Lwb83V334Sd3k9K4ces08vt/qj/xTxzgyMfUgwlwCqUT5AUGkcD/SfnjL8zKAwKDrfcpHY=
X-Received: by 2002:a9d:5cc3:: with SMTP id r3mr5382470oti.338.1556866121691;
 Thu, 02 May 2019 23:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-9-brendanhiggins@google.com> <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
In-Reply-To: <0a605543-477a-1854-eb35-6e586606889b@deltatee.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 2 May 2019 23:48:30 -0700
Message-ID: <CAFd5g47hxAd=+72xbPJbWPdZCXRXmtLpsGhUh=zc7MSwfcaGJQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/17] kunit: test: add support for test abort
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        shuah@kernel.org, devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 2, 2019 at 8:15 PM Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2019-05-01 5:01 p.m., Brendan Higgins wrote:
> > +/*
> > + * struct kunit_try_catch - provides a generic way to run code which might fail.
> > + * @context: used to pass user data to the try and catch functions.
> > + *
> > + * kunit_try_catch provides a generic, architecture independent way to execute
> > + * an arbitrary function of type kunit_try_catch_func_t which may bail out by
> > + * calling kunit_try_catch_throw(). If kunit_try_catch_throw() is called, @try
> > + * is stopped at the site of invocation and @catch is catch is called.
>
> I found some of the C++ comparisons in this series a bit distasteful but
> wasn't going to say anything until I saw the try catch.... But looking
> into the implementation it's just a thread that can exit early which
> seems fine to me. Just a poor choice of name I guess...

Guilty as charged (I have a long history with C++, sorry). Would you
prefer I changed the name? I just figured that try-catch is a commonly
understood pattern that describes exactly what I am doing.

>
> [snip]
>
> > +static void __noreturn kunit_abort(struct kunit *test)
> > +{
> > +     kunit_set_death_test(test, true);
> > +
> > +     kunit_try_catch_throw(&test->try_catch);
> > +
> > +     /*
> > +      * Throw could not abort from test.
> > +      *
> > +      * XXX: we should never reach this line! As kunit_try_catch_throw is
> > +      * marked __noreturn.
> > +      */
> > +     WARN_ONCE(true, "Throw could not abort from test!\n");
> > +}
> > +
> >  int kunit_init_test(struct kunit *test, const char *name)
> >  {
> >       spin_lock_init(&test->lock);
> > @@ -77,6 +103,7 @@ int kunit_init_test(struct kunit *test, const char *name)
> >       test->name = name;
> >       test->vprintk = kunit_vprintk;
> >       test->fail = kunit_fail;
> > +     test->abort = kunit_abort;
>
> There are a number of these function pointers which seem to be pointless
> to me as you only ever set them to one function. Just call the function
> directly. As it is, it is an unnecessary indirection for someone reading
> the code. If and when you have multiple implementations of the function
> then add the pointer. Don't assume you're going to need it later on and
> add all this maintenance burden if you never use it..

Ah, yes, Frank (and probably others) previously asked me to remove
unnecessary method pointers; I removed all the totally unused ones. As
for these, I don't use them in this patchset, but I use them in my
patchsets that will follow up this one. These in particular are
present so that they can be mocked out for testing.

>
> [snip]
>
> > +void kunit_generic_try_catch_init(struct kunit_try_catch *try_catch)
> > +{
> > +     try_catch->run = kunit_generic_run_try_catch;
> > +     try_catch->throw = kunit_generic_throw;
> > +}
>
> Same here. There's only one implementation of try_catch and I can't
> really see any sensible justification for another implementation. Even
> if there is, add the indirection when the second implementation is
> added. This isn't C++ and we don't need to make everything a "method".

These methods are for a UML specific implementation in a follow up
patchset, which is needed for some features like crash recovery, death
tests, and removes dependence on kthreads.

I know this probably sounds like premature complexity. Arguably it is
in hindsight, but I wrote those features before I pulled out these
interfaces (they were actually both originally in this patchset, but I
dropped them to make this patchset easier to review). I can remove
these methods and add them back in when I actually use them in the
follow up patchsets if you prefer.

Thanks!
