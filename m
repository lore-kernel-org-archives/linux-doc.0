Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6FFCA7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 21:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751701AbeEDVhI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 May 2018 17:37:08 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38583 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751630AbeEDVhI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 May 2018 17:37:08 -0400
Received: by mail-wm0-f67.google.com with SMTP id m198-v6so6340608wmg.3
        for <linux-doc@vger.kernel.org>; Fri, 04 May 2018 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JuIk5YV9wlKqfNKLl/RPpYbRAVuoVCeHSuYUAzKsaR8=;
        b=PGZnwS0gbNnOEeKw+LzU0rAG9tfhwKMgScbRz8/9Hq7nyXFww1cM5VDH0HbMzveWEB
         gjjQbYXkfN1Mt/rq3w1YJE9p/219yMo1YaoqZGyhSz4VY1MysU4kfUD/TL/jokSt6bvq
         tlJKtLZ+fFJ/hTuIj4ZvNZQck+3S06yn2aZV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JuIk5YV9wlKqfNKLl/RPpYbRAVuoVCeHSuYUAzKsaR8=;
        b=gqZ+arh+fTFDtYgijvC27xXWQB1vJvI87e9NgYUf+alHfay0t9NZocLopMkjWJdrT1
         A3yYmE6NSXy1tOuYhFStOmbYgCaFOyoDW7E2MheQPe0DUJeRIg7YgDlQDq4WrLwnUfVW
         OkYWfi6FvuR6E2lSjxEzGYcvF6qmICGJ4r1lUsc3rSQSSnH1A/xQ5BDZzvM131IV+XZj
         eulbXJLQBRf4wfnIAs+HgpJwQC33JefkraCOma7dF7tWwqJmMDJAcQQluOPP41lgJYr6
         YBJ4PVP5IiTgmLp1WZSe2uA+hIv9swzwLckCQwsX111eqhPtKGcy90yb9AXWgT4wC0KR
         0rgA==
X-Gm-Message-State: ALQs6tDYP95Ya/K1AKV+95lBsL2F4N4f83hqVetWgMt0fahWKbEmtqca
        29DWVYaNtTkSSea5GVL6wZt7xQ==
X-Google-Smtp-Source: AB8JxZqm3eKDRpEDM3/qQ2BpPsh5OopT4QBs3mB7iIfgimeVwjcoCGQI7ib3ccZHT7fnIh6uQ8HrsA==
X-Received: by 10.28.133.12 with SMTP id h12mr20806345wmd.136.1525469826827;
        Fri, 04 May 2018 14:37:06 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id k82-v6sm2567143wmf.17.2018.05.04.14.37.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 May 2018 14:37:06 -0700 (PDT)
Date:   Fri, 4 May 2018 23:37:00 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Elena Reshetova <elena.reshetova@intel.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: refcount-vs-atomic: Update reference to
 LKMM doc.
Message-ID: <20180504213700.GA5628@andrea>
References: <1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com>
 <CAGXu5jKHb8-P-Y2ecnH9sd6vWhY9cWPfow1Lx_gzRMbHWusRXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXu5jKHb8-P-Y2ecnH9sd6vWhY9cWPfow1Lx_gzRMbHWusRXg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 04, 2018 at 02:13:59PM -0700, Kees Cook wrote:
> On Fri, May 4, 2018 at 2:11 PM, Andrea Parri
> <andrea.parri@amarulasolutions.com> wrote:
> > The LKMM project has moved to 'tools/memory-model/'.
> >
> > Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> > ---
> >  Documentation/core-api/refcount-vs-atomic.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/core-api/refcount-vs-atomic.rst b/Documentation/core-api/refcount-vs-atomic.rst
> > index 83351c258cdb9..322851bada167 100644
> > --- a/Documentation/core-api/refcount-vs-atomic.rst
> > +++ b/Documentation/core-api/refcount-vs-atomic.rst
> > @@ -17,7 +17,7 @@ in order to help maintainers validate their code against the change in
> >  these memory ordering guarantees.
> >
> >  The terms used through this document try to follow the formal LKMM defined in
> > -github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
> > +tools/memory-model/Documentation/explanation.txt.
> >
> >  memory-barriers.txt and atomic_t.txt provide more background to the
> >  memory ordering in general and for atomic operations specifically.
> 
> Will this get linkified by rst ?

I believe not, but I'm not too familiar with rst...  FWIW, I'm seeing that
the above memory-barriers.txt, atomic_t.txt are not linkified.

  Andrea


> 
> -Kees
> 
> -- 
> Kees Cook
> Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
