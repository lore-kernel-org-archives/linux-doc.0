Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B90CB7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 13:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966260AbeF1NwQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 09:52:16 -0400
Received: from mail-wm0-f46.google.com ([74.125.82.46]:35110 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966009AbeF1NwP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 09:52:15 -0400
Received: by mail-wm0-f46.google.com with SMTP id z137-v6so9199064wmc.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9IsqMTmPfoOWC8YQ7OF+QZpnRr3INUW4vs303iXWhuk=;
        b=nUQMLk04i6l1kDurgFefITkbCqPFDDmXrWym2B8HVKjkc11CpCbTlW+YpyY909I50R
         fSsT2eGm3QlCBw6MWT3MGHg//88/8OzudickrgP3rUzVUCsT9UDWrE3MIQmOb5XqPiCy
         u/obY/1UT0ZAeCG16FsaSzgUFKqbyF3RIMGXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9IsqMTmPfoOWC8YQ7OF+QZpnRr3INUW4vs303iXWhuk=;
        b=VBTJ19sLYWrl9XG2OgZvjzkxnykuaaTa8Tv0aEVvSj4P0KVH4qozcG5lHUrI1I5P0f
         WZqx3OppH8TQW9xz+MEyvISOqb+qGvApEfw7Pphfj5B7VV06FIjtCFvUkbYejdaLrxcM
         KC09mE2qzvZMtFCdOrfxCHvLqi+tjdHrrKcwSIJxVZsZCpJZPRQWsx6zSzj+mNJCwFNp
         C133MLqvqzbn5TUMtKSKKSB8OTn/dH40wON44jCSUt5z9tO2fuZVEXFwKHAvdreEw15M
         /2I6ThhqIjglXGpWH94h4G/Kk+bOrB00tG0SNCFwRNrxJokG44KhkYMpBBVSKu1IZh5G
         LuJQ==
X-Gm-Message-State: APt69E2OMa6RCKCvDtTGpVC4tz9GVe+0ij17YjuZqcY+psi/hKZLvFNK
        AangIRPSMxd0GYgzS7EN1sn48g==
X-Google-Smtp-Source: AAOMgpeOwOJ6TedpePJkX495j7sfDWjRncvQTU9k2UNayZCP/Tg2pyIIiKk/jAs5JwmgtUsXilJKfw==
X-Received: by 2002:a1c:9788:: with SMTP id z130-v6mr8695704wmd.88.1530193933833;
        Thu, 28 Jun 2018 06:52:13 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id s3-v6sm7964962wrp.76.2018.06.28.06.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jun 2018 06:52:13 -0700 (PDT)
Date:   Thu, 28 Jun 2018 15:52:06 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 2/3] locking: Clarify requirements for
 smp_mb__after_spinlock()
Message-ID: <20180628135206.GA16107@andrea>
References: <1530182480-13205-3-git-send-email-andrea.parri@amarulasolutions.com>
 <Pine.LNX.4.44L0.1806280947080.1812-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1806280947080.1812-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > + * smp_mb__after_spinlock() provides a full memory barrier between po-earlier
> > + * lock acquisitions and po-later memory accesses.
> 
> How about saying "provides the equivalent of a full memory barrier"?
> 
> The point being that smp_mb__after_spinlock doesn't have to provide an
> actual barrier; it just has to ensure the behavior is the same as if a
> full barrier were present.

Agreed; will fix in the next version.  Thanks,

  Andrea


> 
> Alan
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
