Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5ADDA7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  2 May 2019 20:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfEBU0I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 2 May 2019 16:26:08 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36263 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfEBU0H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 May 2019 16:26:07 -0400
Received: by mail-ot1-f66.google.com with SMTP id b18so3349889otq.3
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2019 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UjYVT5cAdmQKUfv9t8ccIVDdyBls+aL8RkatsPsXvcs=;
        b=S/NLBkmmg3Md+sTx08gED5HrktmpwZikr8idsPoedLBx4NGY0vsICG/2JByh1OPLMl
         SoIkyImRxqPDEOFyC2ZMo66T4y64AzxZJe60LUPIIZ+2whbKVnm1u/h2cZWzkh0Pg7xc
         EXNw4yJNZ9fhJbGVtdrs9Sah16nUmTboVs4KkvhykHpn/i4zj9XsNumXBLK6Ynb0YPNG
         +tpKFc1Qf+4khDJxrAPPVZg4LS8WUK6j1vznFw5a8jr0zVqX9peLg5vYA1eBwQqixHhg
         xvPSDH5tHp5fJ/MAFS5gSf8uCUub0+kg9vZwn+lDYmBqYVC0qg8nx8pyREf5ogAUd63R
         E26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UjYVT5cAdmQKUfv9t8ccIVDdyBls+aL8RkatsPsXvcs=;
        b=Yyy2mFEl+dHOkBG81xRKsCjG7slTe8hMhIcjIDI4KupO4x6kuF2lXpj1HndplEKdBj
         /XTXKOwDOb7NZUrrjRvnFDAAGxLPiONCfp7V1ThhrGdrRUaVwlJ3Yfw626rG1ktC4VXW
         tb1iHsqfDOuDhjdmF5IL2ZK8PC8drwmtrDqIuDrO/gKbPQkJ2a2hjnBPN+LZ9NtHYIig
         JbOqNoka8KMIdm6PuWPAlZYkjlxDItyXZgtgmesWyh+5x2wi2reQ65P0d1UgChIKSqoS
         oe1gO5C0FhLJEtvOTDLhiQW36hMp9W2B65+BF5fb8wCkxhUw6UlZqeOmFrG4xkqtMG4S
         yrkQ==
X-Gm-Message-State: APjAAAUcPjv8/0h4JnikHHAxnkcDVsD5CcSkWw5qJ6kgt1bQITrzzFIh
        9wAYq23mf3XVzrM1cJwKw5WbAlfPLh7o+1aC/4iuPw==
X-Google-Smtp-Source: APXvYqxyYrm8zG8OMTTxqGADAYUvr/vXQpVESafN7Cz0pZWyjDkgKl1eFOtZxYdb1jr2uV1YoMkUpLh/i+1PnNqQJjM=
X-Received: by 2002:a05:6830:204a:: with SMTP id f10mr3731908otp.83.1556828766432;
 Thu, 02 May 2019 13:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com> <20190502110008.GC12416@kroah.com>
In-Reply-To: <20190502110008.GC12416@kroah.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 2 May 2019 13:25:54 -0700
Message-ID: <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like logger
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
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

On Thu, May 2, 2019 at 4:00 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 01, 2019 at 04:01:13PM -0700, Brendan Higgins wrote:
> > A lot of the expectation and assertion infrastructure prints out fairly
> > complicated test failure messages, so add a C++ style log library for
> > for logging test results.
>
> Ideally we would always use a standard logging format, like the
> kselftest tests all are aiming to do.  That way the output can be easily
> parsed by tools to see if the tests succeed/fail easily.
>
> Any chance of having this logging framework enforcing that format as
> well?

I agree with your comment on the later patch that we should handle
this at the wrapper script layer (KUnit tool).
