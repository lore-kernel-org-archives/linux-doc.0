Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0E5D7D910
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 07:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfHMH7a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 03:59:30 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44083 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfHMH7a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Aug 2019 03:59:30 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so48924882plr.11
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2019 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5R0Mn+kXy6miNBPjF2nukdlARFsEwajrrqyvCbZs0pA=;
        b=ElNxu9XWCw3bi/ATpZFZYjmD1lNIywxKKFS5/SHJ+NwUixjR7oQpJwrCG6C82nHfPy
         YE8W4U4AeTrAMqQ2pXMKDLv0qv25tWwlR4csBdCEP98WPeUFvsBeDL1m4hdGu9A+ggXq
         rIp38mmbymsY1BBKpvxm+hERpjOI6axxwbcZj1V8AikaF+Z1aQ1dWRUa9wjwGG01d9h8
         sKGT9tDrSb5EvJwPrCnDwx2/CHTHsgoyEks8OTr6XOvgVMfyBNDjqNOfEiBRGJ6z8hZW
         ZIB+cqqvARstSDttQQKSBm5mxEfD8wl+hAodt9NBsSLUg9+gEPC8zU5ZICyW930HwyEc
         VCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5R0Mn+kXy6miNBPjF2nukdlARFsEwajrrqyvCbZs0pA=;
        b=A7rgvtZjuuXHje6H5Kd7jP/d6vE88/EozqHNH5QljEq62IPB70HvKp/6j2+h23iZ9+
         NGAQHYVT5jzSFXWBm0Avu7nuIIOwBKIkhmSIQGM3u3oJjZ4DX9BvGnRgOA41W2UKk60a
         m6LrivNBw4NaFeENBXqp3BSPUdrnAFVcGD8Yv2JhphG+7gX1xLKpcNZB4wmH2PRtT84S
         boiOJdZ4EUlB9etXazzu1inLd27pcsGlqbYSBukxv4m6Hl+2uMXgq8dgn5YwHsM+nFZT
         o2mbHfWtT78OXDSk90pDrAWV0UuVE14vHVqY1lLZeqmS+LM9obDQAguw+4IwnrSiPCxt
         65RQ==
X-Gm-Message-State: APjAAAUrgxIJhdQzEMKUkSOvMtieBW/GXrBs17/aKABVP++pK441URCo
        M0c9HPSShyetUvt68a2btUHjRPri4wdV9DvcnbeQYw==
X-Google-Smtp-Source: APXvYqyvbUK5kDHossVyHcMfS13gJpm82JS1lGa4QkU7lNSWK1exa+MkZF0H451Y+v9ozGPzr6jJly+0fJd6rna7v9Y=
X-Received: by 2002:a17:902:169:: with SMTP id 96mr23827974plb.297.1565683169131;
 Tue, 13 Aug 2019 00:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-15-brendanhiggins@google.com> <20190813043859.661F82054F@mail.kernel.org>
In-Reply-To: <20190813043859.661F82054F@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Aug 2019 00:59:18 -0700
Message-ID: <CAFd5g44wUOhmxr3r+-LR_igePMjtaRrtT5jGdqPJgb0xPdf+Ag@mail.gmail.com>
Subject: Re: [PATCH v12 14/18] kunit: defconfig: add defconfigs for building
 KUnit tests
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

On Mon, Aug 12, 2019 at 9:39 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 11:24:17)
> > diff --git a/arch/um/configs/kunit_defconfig b/arch/um/configs/kunit_defconfig
> > new file mode 100644
> > index 0000000000000..bfe49689038f1
> > --- /dev/null
> > +++ b/arch/um/configs/kunit_defconfig
> > @@ -0,0 +1,8 @@
> > +CONFIG_OF=y
> > +CONFIG_OF_UNITTEST=y
> > +CONFIG_OF_OVERLAY=y
> > +CONFIG_I2C=y
> > +CONFIG_I2C_MUX=y
> > +CONFIG_KUNIT=y
> > +CONFIG_KUNIT_TEST=y
> > +CONFIG_KUNIT_EXAMPLE_TEST=y
> > diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
> > new file mode 100644
> > index 0000000000000..bfe49689038f1
> > --- /dev/null
> > +++ b/tools/testing/kunit/configs/all_tests.config
> > @@ -0,0 +1,8 @@
> > +CONFIG_OF=y
> > +CONFIG_OF_UNITTEST=y
> > +CONFIG_OF_OVERLAY=y
> > +CONFIG_I2C=y
> > +CONFIG_I2C_MUX=y
>
> Are these above config options necessary? I don't think they're part of
> the patch series anymore so it looks odd to enable the OF unittests and
> i2c configs.

Oh whoops, I forgot that we dropped the OF_UNITTEST from this
patchset. Will fix.

> > +CONFIG_KUNIT=y
> > +CONFIG_KUNIT_TEST=y
> > +CONFIG_KUNIT_EXAMPLE_TEST=y
