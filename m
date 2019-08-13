Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A134F7D910
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 09:13:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfHMJNJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 05:13:09 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34266 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727636AbfHMJNJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Aug 2019 05:13:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id b29so69010486lfq.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2019 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9ILhd2aCjQh4oMSFsJoowCjN4C8D/s8MJgq4YAEBLc=;
        b=W2oxF32qcEgwvRN+TzYXAddY5GIfE0TU07ZZEMjsnTdZHws8iAZ2t8Ultvl9YT7B9l
         FcqQcsJALGn/N6C5ZuExhftHA8ZS8MNOrSUeIrQu3gBXXLe4ixyR8Oo5hmg4UUGyabxo
         uWv09COtEGpqAdax3WCg5P2ubO3WE1ftRGYMB38Ed3fgj3xpruF/YDRjA5s4U1SsywTz
         raOTZO3u1j8iOcpslIka2xJ8bkvq+QSToLsxoCLDTz8ppRJhCuL8ltvK/wB/IXN51+OA
         Tmzcrff2zT5F1o2XfVqbtXnT9QaUbGOA7cZQ4WzLX6NEXNn++uTMldyauztGbKy/kIWW
         PdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9ILhd2aCjQh4oMSFsJoowCjN4C8D/s8MJgq4YAEBLc=;
        b=SR/JxoXevRCxzvB1FkxAadA7aq+Ge0m82gElbgQcJAI2JvWa/WD09nrDJpd3wXt/Y5
         9ltpAzQ0fdtjNSdUumQMYfu67f6Hald0HXLyiJ1zOP2gRSfOlBEmXAZkf0dTVueNR0JX
         cYsvWusg1Wl4bEnrRN7ZYb33uaUTSdt+tCPTjopMbiJsXsAIvykUNxu0GYxduprMSOSb
         4qDeyqCJejOI9Dge2XwLtDxIsgFN6t6eJflm8HhFWaSjxYwomaKAx9AIwIDiRUZnsFEr
         POelq+Dtlm2bRzPaPgoWlWwc543L41nQUXy6Er1W/wgLgf50eGRAfiEl3r0uBDb0RjxA
         0i/A==
X-Gm-Message-State: APjAAAVFutqmooSa1KrdY4apZu1pZaJDWyQRZ4iHENwJNodxoABRJcvH
        gAnEP3Kyo50T3YjKn508c2+mn8tx3HIMQRmcI4xnuA==
X-Google-Smtp-Source: APXvYqwLnkbduPeN9fnl3i+lRRTsMYZatTj1IuJmhpqxnMiio1q0JfaKumMLZmtQt11+bQEG/iQwBN5AGKfhGyCW+Rs=
X-Received: by 2002:ac2:5dd6:: with SMTP id x22mr21614482lfq.92.1565687586809;
 Tue, 13 Aug 2019 02:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-4-brendanhiggins@google.com> <20190812225520.5A67C206A2@mail.kernel.org>
 <20190812233336.GA224410@google.com> <20190812235940.100842063F@mail.kernel.org>
 <CAFd5g44xciLPBhH_J3zUcY3TedWTijdnWgF055qffF+dAguhPQ@mail.gmail.com>
 <20190813045623.F3D9520842@mail.kernel.org> <CAFd5g46PJNTOUAA4GOOrW==74Zy7u1sRESTanL_BXBn6QykscA@mail.gmail.com>
 <20190813053023.CC86120651@mail.kernel.org> <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
In-Reply-To: <CAFd5g47v7410QRAizPV8zaHrKrc95-Sk-GNzRRVngN741OKnvg@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Aug 2019 02:12:54 -0700
Message-ID: <CAFd5g452+-6m1eiVK0ccTDkJ2wH8GBwxRDw5owwC8h3NscE1ag@mail.gmail.com>
Subject: Re: [PATCH v12 03/18] kunit: test: add string_stream a std::stream
 like string builder
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

On Tue, Aug 13, 2019 at 2:04 AM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Mon, Aug 12, 2019 at 10:30 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Brendan Higgins (2019-08-12 22:02:59)
> > > On Mon, Aug 12, 2019 at 9:56 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > >
> > > > Quoting Brendan Higgins (2019-08-12 17:41:05)
> > > > > On Mon, Aug 12, 2019 at 4:59 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > > >
> > > > > > > kunit_resource_destroy (respective equivalents to devm_kfree, and
> > > > > > > devres_destroy) and use kunit_kfree here?
> > > > > > >
> > > > > >
> > > > > > Yes, or drop the API entirely? Does anything need this functionality?
> > > > >
> > > > > Drop the kunit_resource API? I would strongly prefer not to.
> > > >
> > > > No. I mean this API, string_stream_clear(). Does anything use it?
> > >
> > > Oh, right. No.
> > >
> > > However, now that I added the kunit_resource_destroy, I thought it
> > > might be good to free the string_stream after I use it in each call to
> > > kunit_assert->format(...) in which case I will be using this logic.
> > >
> > > So I think the right thing to do is to expose string_stream_destroy so
> > > kunit_do_assert can clean up when it's done, and then demote
> > > string_stream_clear to static. Sound good?
> >
> > Ok, sure. I don't really see how clearing it explicitly when the
> > assertion prints vs. never allocating it to begin with is really any
> > different. Maybe I've missed something though.
>
> It's for the case that we *do* print something out. Once we are doing
> printing, we don't want the fragments anymore.

Oops, sorry fat fingered: s/doing/done
