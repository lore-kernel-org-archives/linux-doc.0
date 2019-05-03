Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 750997D91B
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 May 2019 05:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfECFsb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 May 2019 01:48:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41812 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfECFsa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 May 2019 01:48:30 -0400
Received: by mail-ot1-f68.google.com with SMTP id g8so4291435otl.8
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2019 22:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJk8vxgxnyREeORp3ZGYiUe4W63+mvTYx011g+D2w9I=;
        b=gVy2A/3xGfxoPlL5Ko9/iS3jo2EDVupQVAr70qs6RZrFHNgUtzEok56tjyUqT06FB0
         N61EUVCJQSGnIGYHynH3drr29YDViWxqPU9Sza34pLTsoxVh0uUM8E5CV1L0C/mIM9w0
         WGa5tKq18lnS81IMo5BcR1Ykh3Nl7b9ExnnVx27s6jE5lyDFV5nm2p2xr1/VPFBW2Ah2
         kgZSCZQGbf96we5F6/cwHf89KEU3jBrsGd1WH/gd1lUYccvZTH42q4V6uaQ3GXtHhroy
         5qgEL+EjcYwXRo906ivSwsvihl3a7m9bzISXOlTNYJMfYhl7JWVTEbNxfJuRwSUQRKBU
         kRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJk8vxgxnyREeORp3ZGYiUe4W63+mvTYx011g+D2w9I=;
        b=bmGXbb5uOjh3yu4G8dNPtPkgDi/umpIMsjrpnW8PBzrNQtqMR3WHb9QUiyQdD6ca/d
         hs7cnC44lTbd1BLvCa1cTWgzO0r5GJIOxDMozLtufamBeDrXZCPiZOKo1GyLtRIOTRrl
         UaPuF6sgywStsOcTSn/P+H8j0sbEcpwQ0yNCXVrjkIoxAR67dXAE2J70D1cYwskXANR7
         CrS7+jciqOWjsmOiSF8aov1V/rEWknJqNolJH6cPS+ONUL71lZv4S+FteCGUOX7vGRuC
         /V5gWwS8No0x+9tn/PiFpzMFY2hilZe6mM0kjLYaZLD8C9pSooDEwWUrF41eSO0CwlC0
         ih8Q==
X-Gm-Message-State: APjAAAWYxhxkvXvqS8oGvJH2t8+WlHLXBp5QdjCCu/soLfq5I+ZLDFu9
        3t9k6ZsvYTb3XsJ86f3AXj0MES/+wzU6hAELtg/iKg==
X-Google-Smtp-Source: APXvYqwsEAlSz/eNFlgajgo4Kt8DHISJN+MfNVQqCm9syohvOOWU5/fOAXzlAO0OoVTlNR0j/l6/cH2CfoUTavBQdJA=
X-Received: by 2002:a9d:3621:: with SMTP id w30mr5187084otb.98.1556862507760;
 Thu, 02 May 2019 22:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com> <ead23600-eecd-cf74-bdd1-94a6964e29b2@kernel.org>
In-Reply-To: <ead23600-eecd-cf74-bdd1-94a6964e29b2@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 2 May 2019 22:48:16 -0700
Message-ID: <CAFd5g463PQGn3618Vo2Spu81zzL40jM6Skr1gSWtJqMx7Faj5A@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like logger
To:     shuah <shuah@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
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
        Logan Gunthorpe <logang@deltatee.com>,
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

On Thu, May 2, 2019 at 6:50 PM shuah <shuah@kernel.org> wrote:
>
> On 5/1/19 5:01 PM, Brendan Higgins wrote:

< snip >

> > diff --git a/kunit/kunit-stream.c b/kunit/kunit-stream.c
> > new file mode 100644
> > index 0000000000000..93c14eec03844
> > --- /dev/null
> > +++ b/kunit/kunit-stream.c
> > @@ -0,0 +1,149 @@

< snip >

> > +static int kunit_stream_init(struct kunit_resource *res, void *context)
> > +{
> > +     struct kunit *test = context;
> > +     struct kunit_stream *stream;
> > +
> > +     stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> > +     if (!stream)
> > +             return -ENOMEM;
> > +     res->allocation = stream;
> > +     stream->test = test;
> > +     spin_lock_init(&stream->lock);
> > +     stream->internal_stream = new_string_stream();
> > +
> > +     if (!stream->internal_stream)
> > +             return -ENOMEM;
>
> What happens to stream? Don't you want to free that?

Good catch. Will fix in next revision.

< snip >

Cheers
