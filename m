Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1876F7D90C
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Jul 2019 17:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfGBRxD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Jul 2019 13:53:03 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33317 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfGBRxD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jul 2019 13:53:03 -0400
Received: by mail-pg1-f193.google.com with SMTP id m4so8054801pgk.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2019 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUzLBUlR97uqGXzOFylb6nkkxBtyYZ1OhN+qvdTrCD0=;
        b=roBJOIwXGuFOf1wltfxmsClcFxlkrjzp9+21T7P87pZ44BH/GjP/X/NuZ8mK2FoMzO
         XotmCr6d6KsdJATAIIUbq5Oy4zR4Azgkp4HhOE4XiupuZAs2/ZBggUQTxGqGQNrNXKUR
         RK1F2iELvIHqPezIMEexxn9HQjKb0Q7OjYsSgJwmHDUbD4xwBf6WQFlfeS4XFqE89Pff
         n78AWxKci0ljIJl3H7X5khQxePoPu8jM9jZ95VMb0Zsz46NlIICQ2qPhYIcCIBC8U20Z
         P1PLSOLwoWTdUhh3getWGZNkHFehqyZ7w/vmIfDcbd6OQGJv5O6KIgY9x4cjlJKaYt87
         yyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUzLBUlR97uqGXzOFylb6nkkxBtyYZ1OhN+qvdTrCD0=;
        b=Pl1IE11IU96Q4baIeL5yy0InaNR4q34oEpNEualw5D/ij1+KdFY5daNVrlq9SPOVd7
         faC9QT2cjK3fzZ+ZJZyFFtLopZrhorvNWFZCe/rVCNwOkukeWHg+JT7lYeEdyjdIiQLu
         6AVqUVSJEOLmvBBl2RbMUO/I2UhoGB+wZ2H5CsTMe6x33ROK06Vj2PGCau3Fhgt3rPhL
         aSSHZPMKHcvlbQ0j9spJ31zaTePLR7bcsKc197mq8CkfhR3j8O6SliHi5GkP6vbh3dbb
         8cnAOSKZXp/Nshg1JlX0gQAPDsyDdhNgn+seFh6sXQpbFJm1cTRDTLS/B+C7Py1xc28E
         3GBg==
X-Gm-Message-State: APjAAAV+Jhp/L6LfkdwXBxa6D8K8hVyfMmnwJn+t42KN4NPIiVGfisiz
        /Q2jPfJG5wFDTBCf3/b93F2J0wbzxFmWVeU0+y8c9g==
X-Google-Smtp-Source: APXvYqw1QIOarVsPwN3Ymzn8KxtORstMAVkiFcCA6YNhVqWiDT/WJraRMIndv08KnJT+5qaDY4tAvp9OnwXy65WsZqM=
X-Received: by 2002:a63:205f:: with SMTP id r31mr23471478pgm.159.1562089981635;
 Tue, 02 Jul 2019 10:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
 <20190617082613.109131-8-brendanhiggins@google.com> <20190625232249.GS19023@42.do-not-panic.com>
 <CAFd5g46mnd=a0OqFCx0hOHX+DxW+5yA2LXH5Q0gEg8yUZK=4FA@mail.gmail.com>
In-Reply-To: <CAFd5g46mnd=a0OqFCx0hOHX+DxW+5yA2LXH5Q0gEg8yUZK=4FA@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 2 Jul 2019 10:52:50 -0700
Message-ID: <CAFd5g46=7OQDREdLDTiMgVWq-Xj2zfOw8cRhPJEihSbO89MDyA@mail.gmail.com>
Subject: Re: [PATCH v5 07/18] kunit: test: add initial tests
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

On Wed, Jun 26, 2019 at 12:53 AM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Tue, Jun 25, 2019 at 4:22 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Mon, Jun 17, 2019 at 01:26:02AM -0700, Brendan Higgins wrote:
> > > diff --git a/kunit/example-test.c b/kunit/example-test.c
> > > new file mode 100644
> > > index 0000000000000..f44b8ece488bb
> > > --- /dev/null
> > > +++ b/kunit/example-test.c
> >
> > <-- snip -->
> >
> > > +/*
> > > + * This defines a suite or grouping of tests.
> > > + *
> > > + * Test cases are defined as belonging to the suite by adding them to
> > > + * `kunit_cases`.
> > > + *
> > > + * Often it is desirable to run some function which will set up things which
> > > + * will be used by every test; this is accomplished with an `init` function
> > > + * which runs before each test case is invoked. Similarly, an `exit` function
> > > + * may be specified which runs after every test case and can be used to for
> > > + * cleanup. For clarity, running tests in a test module would behave as follows:
> > > + *
> >
> > To be clear this is not the kernel module init, but rather the kunit
> > module init. I think using kmodule would make this clearer to a reader.
>
> Seems reasonable. Will fix in next revision.
>
> > > + * module.init(test);
> > > + * module.test_case[0](test);
> > > + * module.exit(test);
> > > + * module.init(test);
> > > + * module.test_case[1](test);
> > > + * module.exit(test);
> > > + * ...;
> > > + */

Do you think it might be clearer yet to rename `struct kunit_module
*module;` to `struct kunit_suite *suite;`?
