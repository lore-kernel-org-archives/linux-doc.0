Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B11DF7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 07:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfHMHxq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 03:53:46 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36973 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfHMHxm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Aug 2019 03:53:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so18010992pgp.4
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2019 00:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1w6tEv+UsY5F/hdJoPjOc+8EZA8fHnLVH5Ee68+K+14=;
        b=nVz7SRzwhp+sIStWQOhdw7+eMounsWwWY4b9W+H2splMtvxXWG/v8uX0oyrPhi9Pc/
         DbYNbNpkCoegNiTUpPMiXg34BXPrPJrAjoIA7DyPnMkZHZfSastxpDXvu6zpEH76cIXz
         2ipKiw0wJIDxWMLZyrA5y40OVaB5InZkV31euGDTlfUD9NGVPd2AdaFiZI2HUpl+1Z71
         eZE6OVlRYXpa7v0Ieb0+s2HPAU8hcA299XGRboiSsBb0Wz4QiBbaFXHTBKHp4dwxoDYm
         Lyn/gNUB2QMFaYgVWF7lBw/U70QsznbaxSpwZOVQK35ds3v4ks7lmHH71KHdUCsOoz7q
         RS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1w6tEv+UsY5F/hdJoPjOc+8EZA8fHnLVH5Ee68+K+14=;
        b=byi5eU0iBo/bKAC35qUwQecc+rCedu4+lu4znk1jT+OyxZA9VZWbef0KLHUER0sxxo
         jOsxjnteB0PyVcmy8kL6zyzoERC3/0H6poUGZtp2xQJofsh6ahNV4lfUtdBuleE6i2zJ
         8liG0UF4YOvE7t7W1f+06ix5iWirOb7NDgc592XhxFGeCFHbqW0JnnfDmimGfdHo2VCq
         c8re6WI1PD/j6U77cYnigRKV8SNVoBAHZL2TA6Y2+9iMjFp9+Pm6CsNwj1V7vD8nBnrC
         VGHfZQZqByGyu6SH5uy75ni6duIukqPJSsULFmfn6m05mbAFlz15Ao6yqnmfDFaep9CQ
         ZTag==
X-Gm-Message-State: APjAAAUrvdtTJTpuKgRiSGZr+9i+o/BOFRBl0pyhKRBthrO6+FBRelHf
        /4IxRCOChRFT4uUk2NotJFnjD4MUnVbExtd1gU5URA==
X-Google-Smtp-Source: APXvYqwRt249N6Nnc3lDOtyH2RE286o2POCGTN4Y9Dd+KQhTUzxvnzvxmCpITQmOohY+Myh1tvYfqlbmJVebyc0CKlY=
X-Received: by 2002:a63:b919:: with SMTP id z25mr33087981pge.201.1565682820534;
 Tue, 13 Aug 2019 00:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-11-brendanhiggins@google.com> <20190813042455.4A04320644@mail.kernel.org>
 <CAFd5g46LHq1sQaio2Vj5jt54YN-Y2HuCT8FbALQhJoekkYJ-uQ@mail.gmail.com> <20190813055707.8B2BB206C2@mail.kernel.org>
In-Reply-To: <20190813055707.8B2BB206C2@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Aug 2019 00:53:28 -0700
Message-ID: <CAFd5g45rLTB965BX24DKFauumbdbn=m4kxtzgwr_4uj66Vmzmw@mail.gmail.com>
Subject: Re: [PATCH v12 10/18] kunit: test: add tests for kunit test abort
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
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

On Mon, Aug 12, 2019 at 10:57 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 22:06:04)
> > On Mon, Aug 12, 2019 at 9:24 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Brendan Higgins (2019-08-12 11:24:13)
> > > > +
> > > > +static int kunit_try_catch_test_init(struct kunit *test)
> > > > +{
> > > > +       struct kunit_try_catch_test_context *ctx;
> > > > +
> > > > +       ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > >
> > > Can this fail? Should return -ENOMEM in that case?
> >
> > Yes, I should do that.
>
> Looks like it's asserted to not be an error. If it's pushed into the API
> then there's nothing to do here, and you can have my reviewed-by on this
> patch.
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Cool, thanks!
