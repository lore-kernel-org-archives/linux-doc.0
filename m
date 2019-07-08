Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 947B07D910
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Jul 2019 20:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405120AbfGHUkk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Jul 2019 16:40:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39448 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbfGHUkj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 16:40:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so7778305pgi.6
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/EH/dsB4RqvQOyHG8BqAIo5WKk7GQxacBNIaWqTFNQk=;
        b=Cdb6f6dII91+peQ4OxFhgsypxNIcC8Z96r5C/ePNEUz85za5Vbi9Ob9WFL7Wp+O6qA
         s2FU4elMc5PHawGRh4mEgei2UKYeL/Om110iQOt9EZjbTGZ35yhM+QknG6GV4EILqbGV
         fSE/mjTDSVLrTvE9E8XjufRwxMYJiGpgmnm9Gj+28y8fI57C27MrUrxnEuTgssOH22rV
         X2wra0aYtt04uPd5Nd5e58e/ejOR/kNGkFgfkF6uBhS0Gc+UnNjzMr5rpGuXODaRO3/6
         S/LEDw4EBPf512R+tktyLb6BY2Kbd/uedF4s+xPbNcfpXnjQo8TaENBYjaBvCticdcKk
         s+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/EH/dsB4RqvQOyHG8BqAIo5WKk7GQxacBNIaWqTFNQk=;
        b=s6yFxypayaknQJg3uEPnJI7V8I/3LSFNy5Zq6ESD884MfjW4Glh1e7505z6BCilEsy
         JrgfOfom9zu8erxXtpupuXL7RnFpvhS022AuCT1tqKPr+Y7dLHo5efpC5XGjQ0zwQ7la
         Ij/wEnlkmwbS/0hwPBg/Ss8y8exB5w8SQpAvBE5BlPwHmYXzFGDLH8YQvFvMyhSSCs+g
         vxGfcdYSnkUvXcz5fVIuEjyLobrPCGB7t4qG8HyBH61EPdH5FFMLUDuFfG34650sk5aG
         ine3CrSFcxWrWal2Hg1QXHfFnsZK7vZMdQlUhXGZXiw9lZVqiNh19htBQbdIZp4G8SvF
         ZD2g==
X-Gm-Message-State: APjAAAV9/OnmX+ijo6qAKATTgzhMzQyG628HUKdSf/FQk1AoBZC1FNjv
        ALUizsBiO1wKFyqwpP0j9m8sYOkpoKrBaimLfuCCgQ==
X-Google-Smtp-Source: APXvYqxcFK88vAm0YlECpUDpB3imcSno03RwL+0jyEa5ghv7TUPzQiwa16nbo1CO7XiLvpWqedp7ntBebsLNBqTl9bk=
X-Received: by 2002:a63:205f:: with SMTP id r31mr26169271pgm.159.1562618438201;
 Mon, 08 Jul 2019 13:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-2-brendanhiggins@google.com> <20190705201505.GA19023@42.do-not-panic.com>
 <CAFd5g45cF9rYc8YupnCgd=7xz_yW+_TMp_L+cSFUBW7d9njnVQ@mail.gmail.com>
In-Reply-To: <CAFd5g45cF9rYc8YupnCgd=7xz_yW+_TMp_L+cSFUBW7d9njnVQ@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 8 Jul 2019 13:40:26 -0700
Message-ID: <CAFd5g44XV0zDpNgyDPSFMq86kSvwGb_WjhxzK=AoDMjwXD5CgQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] kunit: test: add KUnit test runner core
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        shuah <shuah@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 8, 2019 at 11:08 AM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Fri, Jul 5, 2019 at 1:15 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Jul 03, 2019 at 05:35:58PM -0700, Brendan Higgins wrote:
> > > Add core facilities for defining unit tests; this provides a common way
> > > to define test cases, functions that execute code which is under test
> > > and determine whether the code under test behaves as expected; this also
> > > provides a way to group together related test cases in test suites (here
> > > we call them test_modules).
> > >
> > > Just define test cases and how to execute them for now; setting
> > > expectations on code will be defined later.
> > >
> > > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> >
> > Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> >
> > But a nitpick below, I think that can be fixed later with a follow up
> > patch.
> >
> > > +/**
> > > + * struct kunit - represents a running instance of a test.
> > > + * @priv: for user to store arbitrary data. Commonly used to pass data created
> > > + * in the init function (see &struct kunit_suite).
> > > + *
> > > + * Used to store information about the current context under which the test is
> > > + * running. Most of this data is private and should only be accessed indirectly
> > > + * via public functions; the one exception is @priv which can be used by the
> > > + * test writer to store arbitrary data.
> > > + *
> > > + * A brief note on locking:
> > > + *
> > > + * First off, we need to lock because in certain cases a user may want to use an
> > > + * expectation in a thread other than the thread that the test case is running
> > > + * in.
> >
> > This as a prefix to the struct without a lock seems odd. It would be
> > clearer I think if you'd explain here what locking mechanism we decided
> > to use and why it suffices today.
>
> Whoops, sorry this should have been in the next patch. Will fix.

Err..no, this shouldn't be here at all. Sorry about that. I just need
to rewrite the comment.

> > > +/**
> > > + * suite_test() - used to register a &struct kunit_suite with KUnit.
> >
> > You mean kunit_test_suite()?
>
> Yep, sorry about that. Will fix.
>
> > > + * @suite: a statically allocated &struct kunit_suite.
> > > + *
> > > + * Registers @suite with the test framework. See &struct kunit_suite for more
> > > + * information.
> > > + *
> > > + * NOTE: Currently KUnit tests are all run as late_initcalls; this means that
> > > + * they cannot test anything where tests must run at a different init phase. One
> > > + * significant restriction resulting from this is that KUnit cannot reliably
> > > + * test anything that is initialize in the late_init phase.
> >                             initialize prior to the late init phase.
> >
> >
> > That is, this is useless to test things running early.
>
> Yeah, I can add that phrasing in.
>
> > > + *
> > > + * TODO(brendanhiggins@google.com): Don't run all KUnit tests as late_initcalls.
> > > + * I have some future work planned to dispatch all KUnit tests from the same
> > > + * place, and at the very least to do so after everything else is definitely
> > > + * initialized.
> >
> > TODOs are odd to be adding to documentation, this is just not common
> > place practice. The NOTE should suffice for you.
>
> Because it is a kernel doc? Would you usually make a separate
> non-kernel doc comment for a TODO? I guess that makes sense.
>
> Thanks!
