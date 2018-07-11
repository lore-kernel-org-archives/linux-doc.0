Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7E6AA7D048
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 15:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbeGKP7C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 11:59:02 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35348 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733301AbeGKP7B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 11:59:01 -0400
Received: by mail-wm0-f65.google.com with SMTP id v3-v6so3113939wmh.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0NiVOQl85yPhLiBSFHhmGg9rxycMtbbw4a1glDcPLjc=;
        b=KTWspeQN5zZzDEdpFmgNsgAHsBQGjOLm6Gv60DBSYHYIxqSR4Ekl0F8lt+QKlSu9Dk
         +/Tui4stQ74EswHDMXRGMTbyi2vodfx0OrfmN/qlKc/quuKSsXywW9/xw6sjHae1mWTB
         vZ55wYL2B+CcscN3Zm5JP35t3NZQZjwrucz4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0NiVOQl85yPhLiBSFHhmGg9rxycMtbbw4a1glDcPLjc=;
        b=EXzfQuKpUqPaiUi2tqp6rtUtTS70c/pNDbSHbUja0q+EJOeTw3hvpG6b4ePRFtJo89
         e7lg+QzY5Tn6VzPDDHvblCppiRIquVS+KJ9HmQRC5k5Wl2kjEA54NLt5URBDh37U82K2
         dhWtJ9RLocjjm1myzmuQKg0eOSYFEMNe7CVqZ6O9KGCVHpXy34ITDdCyhGRz9OA4pcLX
         DeImG6js7HENj5cXvFcnLYZgW4SXMyqTTyrU2cQC2i46yZDhMr8Fn4sB64Bvp+dBB7Ah
         W7tukM/Secp53eypIhByVus20aqT0E+aH/SsYLE6yB8HZ+ysu5nsTLDSQNcIA0Pt6Nty
         8DIg==
X-Gm-Message-State: APt69E2XQUq0mpQjOQK6vRiYiZmufnYXmGtt0e5LklSY+niVlXN2oNC4
        q2pqSEa1c19/Hf+0Yr6uNVTHPg==
X-Google-Smtp-Source: AAOMgpeTh+4i89VdFA+B0t+Off1AW7YW6XMp7H8a2PriDQscXYiMleromtW1dhvTw6cZgM5sh8oHyQ==
X-Received: by 2002:a1c:7c13:: with SMTP id x19-v6mr19106956wmc.27.1531324441364;
        Wed, 11 Jul 2018 08:54:01 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id b190-v6sm3712157wma.24.2018.07.11.08.54.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jul 2018 08:54:00 -0700 (PDT)
Date:   Wed, 11 Jul 2018 17:53:55 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will.deacon@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] doc: Replace smp_cond_acquire() with
 smp_cond_load_acquire()
Message-ID: <20180711154830.GA14348@andrea>
References: <1531216943-6382-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1531314530-11624-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180711153840.GS3593@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180711153840.GS3593@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 11, 2018 at 08:38:40AM -0700, Paul E. McKenney wrote:
> On Wed, Jul 11, 2018 at 03:08:50PM +0200, Andrea Parri wrote:
> > Amend commit 1f03e8d2919270 ("locking/barriers: Replace smp_cond_acquire()
> > with smp_cond_load_acquire()") by updating the documentation accordingly.
> > Also remove some obsolete information related to the implementation.
> > 
> > Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Will Deacon <will.deacon@arm.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Boqun Feng <boqun.feng@gmail.com>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Jade Alglave <j.alglave@ucl.ac.uk>
> > Cc: Luc Maranget <luc.maranget@inria.fr>
> > Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
> > Cc: Akira Yokosawa <akiyks@gmail.com>
> > Cc: Daniel Lustig <dlustig@nvidia.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > ---
> >  Documentation/memory-barriers.txt | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> I have queued this for further review, thank you!  Just to confirm,
> the reason that the old passage was obsolete is because ARMv8 implements
> smp_cond_load_acquire() as a straight acquire load, correct?

Thanks.  Yes; the generic code builds on a control dependency and an
smp_acquire__after_ctrl_dep() (which defaults to smp_rmb()); but the
required ordering on arm64 is given by (its) smp_load_acquire().

I thought that entering this level of details (and keeping it up-to-
date ;) wasn't really worth/needed for this high-level doc.

  Andrea


> 
> 							Thanx, Paul
> 
> > diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> > index 0d8d7ef131e9a..c1d913944ad8b 100644
> > --- a/Documentation/memory-barriers.txt
> > +++ b/Documentation/memory-barriers.txt
> > @@ -471,8 +471,7 @@ And a couple of implicit varieties:
> >       operations after the ACQUIRE operation will appear to happen after the
> >       ACQUIRE operation with respect to the other components of the system.
> >       ACQUIRE operations include LOCK operations and both smp_load_acquire()
> > -     and smp_cond_acquire() operations. The later builds the necessary ACQUIRE
> > -     semantics from relying on a control dependency and smp_rmb().
> > +     and smp_cond_load_acquire() operations.
> > 
> >       Memory operations that occur before an ACQUIRE operation may appear to
> >       happen after it completes.
> > -- 
> > 2.7.4
> > 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
