Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D16967D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Jul 2019 18:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfGISBs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Jul 2019 14:01:48 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46721 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbfGISBs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 14:01:48 -0400
Received: by mail-pg1-f196.google.com with SMTP id i8so9813685pgm.13
        for <linux-doc@vger.kernel.org>; Tue, 09 Jul 2019 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUg57n/8w7Mlx4FSaThva6QRBMRQrC57aji70HqhlTs=;
        b=u9enlrUFhNo6CpHlrQV/HgMnM2prP/1x9AkLcEyZIZZ95VhPysZXNdVgTxFeHrQSyj
         D854QOHx1OOVg+bK1q0GL9M26yGnhrklGjHFU0YlePfBqyn8fol1vLU/0tJs5NO+XWNV
         6Qg4G47Yz8EAu+oXnFu1Mzex0KXUQSkc3dP89G7ycpwdK6vtjyVs4n/CA1F66BOgluWi
         cGrmqcEgZcaKnQ36vda5DA3xHSSM91ST4LQMohLGersiVfBM4MAAfBua5GuHtjmb28bv
         cNHp7EXFv/Be9TyDKlfByNT+SveMU7rOne9AoLQN+azT38ic+R4kxi1lUa+FZPUqI2ob
         eorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUg57n/8w7Mlx4FSaThva6QRBMRQrC57aji70HqhlTs=;
        b=fQgMdZ+hJjK5ArqJ9urWEPcCTS923vtYgEMcYqcvq0fmjUZeh8AfVyEAC/1CJ+CrtD
         gvuAhij6vuWbWEUjLibbB0HZxQ8+k1K+LYIJi58ps7jUKwKL01l5YjwzDoikCB+xdDen
         HmQQ/CzLPxEl6hWZUuRh6L3upFO0fH9iPlT7Cw9VE1Xp02N0lBr58fId5IWdWtm1wkiS
         vSssJP5bqONuVAuTiiACf2b21e4CbePSIgNwGQ0GWGKn+p9lTRiwBQfqhzpt4HdSm+eD
         yjx/C2OrOIc7G78ga6+h8Z3186EvISqrGCwZiBPr0mAc5Div25OrReJB/RMyvCapR9sy
         Wokg==
X-Gm-Message-State: APjAAAU31NMDh/VXnVlwmOUHynzRIZipYl7NYGSF11jmETwl0aHl5KtE
        jHKY7v/Vk0QZPpukq3zCR0VuE9p/bjo/imon7/PtJg==
X-Google-Smtp-Source: APXvYqw4HCjsVl+Amh2Teet2qtkXvGz99b/JiD+OyiCx/6U5M9oVU+FrejKuChE3TPRj4OZE1ZrjIBxXffNmybu5Pvg=
X-Received: by 2002:a63:205f:: with SMTP id r31mr32165059pgm.159.1562695307162;
 Tue, 09 Jul 2019 11:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
 <20190709063023.251446-17-brendanhiggins@google.com> <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
In-Reply-To: <7cc417dd-036f-7dc1-6814-b1fdac810f03@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 9 Jul 2019 11:01:35 -0700
Message-ID: <CAFd5g4595X8cM919mohQVaShs4dKWzZ_-2RVB=6SH3RdVMwuQw@mail.gmail.com>
Subject: Re: [PATCH v7 16/18] MAINTAINERS: add entry for KUnit the unit
 testing framework
To:     shuah <shuah@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
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

On Tue, Jul 9, 2019 at 7:53 AM shuah <shuah@kernel.org> wrote:
>
> On 7/9/19 12:30 AM, Brendan Higgins wrote:
> > Add myself as maintainer of KUnit, the Linux kernel's unit testing
> > framework.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> > ---
> >   MAINTAINERS | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 677ef41cb012c..48d04d180a988 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8599,6 +8599,17 @@ S:     Maintained
> >   F:  tools/testing/selftests/
> >   F:  Documentation/dev-tools/kselftest*
> >
> > +KERNEL UNIT TESTING FRAMEWORK (KUnit)
> > +M:   Brendan Higgins <brendanhiggins@google.com>
> > +L:   linux-kselftest@vger.kernel.org
> > +L:   kunit-dev@googlegroups.com
> > +W:   https://google.github.io/kunit-docs/third_party/kernel/docs/
> > +S:   Maintained
> > +F:   Documentation/dev-tools/kunit/
> > +F:   include/kunit/
> > +F:   kunit/
> > +F:   tools/testing/kunit/
> > +
> >   KERNEL USERMODE HELPER
> >   M:  Luis Chamberlain <mcgrof@kernel.org>
> >   L:  linux-kernel@vger.kernel.org
> >
>
> Thanks Brendan.
>
> I am good with this. I can take KUnit patches through kselftest
> with your Ack.

My acknowledgement? Sure! I thought we already agreed to that.

Also, do we need an ack from Masahiro or Michal for the Kbuild patch
[PATCH v7 06/18]? And an ack from Josh or Peter for the objtool patch
[PATCH v7 08/18]?

Greg and Logan gave me a Reviewed-by for the Kbuild patch, so maybe
that's fine, but I don't have any reviews or acks for the objtool
patch.

Thanks!
