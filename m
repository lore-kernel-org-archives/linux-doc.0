Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A40807D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Apr 2019 21:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731256AbfDYVhY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Apr 2019 17:37:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44189 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729961AbfDYVhX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Apr 2019 17:37:23 -0400
Received: by mail-oi1-f195.google.com with SMTP id l7so1267341oil.11
        for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2019 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGUgSN/1MuaT0sEkx4/PHOTF00tRdaquGMmXyWySbhU=;
        b=edaqH3pXiEXpUmitUuXFWk+YsMBzEo/wRbafWYnIriVAmTmf/hZDKMWYzoNNH8oP+R
         bC+L8TVKnbipZ4SOAofD8rBq1yG2z/wZSk50Q9P9Yr1DrvXxI8TDrkMs++R6/OonwdO9
         74izLWERfec1GdE1xNOK3wfairC7wD1IwRBd6Vw26OFYxJBjlOnzqt22cTdMjpIcf37o
         S+DIWo9AGr3T1ABXIchf3VePE0iuwngS8Nc9fclUuQwhkZbwhtqheo4mssjcPl+ztLbU
         5EcZE3o5HkugWFjrsIq8GzxRoyNKX7lmKmESdN8Ehi+ur56DpKR30L5vQHX/a3wC1u6P
         D1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGUgSN/1MuaT0sEkx4/PHOTF00tRdaquGMmXyWySbhU=;
        b=QIKJApHAZ8Hb9azW/YsmcwhvLVVzKen5SNabN9jGurExBC+zU3dsqIWX0x6O5OqLj8
         ECQJnvJv/7VZ3KST2dMkwH8vZxAL7fWLNNVA8B14y+dywT6QP+SW712IKRrwb2fry7ps
         6HBudEc2OL5S9WrFw/5PhjB/1R/6Be5ggC2+cIIEHkj1ifdkpwcMZR7RCsU2MIJPZOT6
         vTfymabpI2ROW1CG7SYTT+qvZAMOVPVxWMw6WsLMpd0R9D7Gst+rHWmR5BJaEfGU7+Q+
         9Mg0RBxvITMbw43LiJQNZZ++k9VfyXBaig2t8ZlF8gOS3HL3HxA/q0123ZDo7S7mCHoi
         uzeg==
X-Gm-Message-State: APjAAAW9jtzfA4yZRFqBUSWB+Sj7cdZtJFQ3wsvDxghak3/C1+wRZmS2
        x8287uFvmSz9uHL1QfYu+/qf1H9fIZx3EoengZb45w==
X-Google-Smtp-Source: APXvYqxNu7qXytlEj2RXMttlfz2eUzqPPX+vSS3fXl27uou+1aPJ+bT6BWbWn9cn6mf63VhaXUUe6QTIeJnzpNOZ4Z8=
X-Received: by 2002:aca:4586:: with SMTP id s128mr4538562oia.148.1556228242522;
 Thu, 25 Apr 2019 14:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190404220652.19765-1-brendanhiggins@google.com>
 <20190404220652.19765-15-brendanhiggins@google.com> <20190424185813.xabwr4lt6aunvpsd@gabell>
In-Reply-To: <20190424185813.xabwr4lt6aunvpsd@gabell>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 25 Apr 2019 14:37:11 -0700
Message-ID: <CAFd5g45CD7=dMvvRgmLKomirXDWpO59hFSed9A=o0kdBxp7v-w@mail.gmail.com>
Subject: Re: [PATCH v1 14/17] Documentation: kunit: add documentation for KUnit
To:     Masayoshi Mizuma <msys.mizuma@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, shuah@kernel.org,
        yamada.masahiro@socionext.com, Petr Mladek <pmladek@suse.com>,
        linux-doc@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        linux-kselftest@vger.kernel.org,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Felix Guo <felixguoxiuping@gmail.com>, wfg@linux.intel.com,
        Joel Stanley <joel@jms.id.au>, Jeff Dike <jdike@addtoit.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kbuild@vger.kernel.org, "Bird, Timothy" <Tim.Bird@sony.com>,
        linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 24, 2019 at 11:58 AM Masayoshi Mizuma <msys.mizuma@gmail.com> wrote:
>
> Hi Brendan,
>
> KUNIT_ASSERT_NOT_ERR_OR_NULL() should be replaced to
> KUNIT_EXPECT_NOT_ERR_OR_NULL(), right?

Generally speaking, no.

There may be places that I have used it improperly, but I think it is
generally okay to use.

If you are refering to the discussion with Frank and Stephen in RFC
v4, my take was that the resolution was that there were some things I
needed to fix in its implementation, but it is conceptually okay, and
that Frank doesn't want me to use it in drivers/of/unittest.c.
Consequently, I fixed the implementation issues that Frank and Stephen
pointed out, and I am holding off on drivers/of/unittest.c for this
patchset. The usage in this file should be fine.

>
> On Thu, Apr 04, 2019 at 03:06:49PM -0700, Brendan Higgins wrote:
> > Add documentation for KUnit, the Linux kernel unit testing framework.
> > - Add intro and usage guide for KUnit
> > - Add API reference
> >
> > Signed-off-by: Felix Guo <felixguoxiuping@gmail.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
>
> <snip>

<snip>

Cheers
