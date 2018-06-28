Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 847547D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 13:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965570AbeF1NLB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 09:11:01 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:33815 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965459AbeF1NK5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 09:10:57 -0400
Received: by mail-wr0-f195.google.com with SMTP id a12-v6so5484664wro.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=czgCCwu5w8+Is78rh064XF2WOlg+3jlPMkGkQxjSbgI=;
        b=dMOodLTe7fotjawJjvny6HiMZLMx4DiUPptbG2rckHkpqbSKU+HECKwlv9SoW4MO+m
         4fyjdoALBvwfK5XCGclBc65BtlJWrpu5HOqI7gYGUYAumYCNGsj8pCFZmBRXibsxD7xp
         eXpx3R8yDWjQMu1U+9UiyQnVKJfnf/NfWqt6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=czgCCwu5w8+Is78rh064XF2WOlg+3jlPMkGkQxjSbgI=;
        b=D7raMhXXkLTV77EGLgVZY5azrqpjUI10PrVQMnsPXjBYhOihfSUjl9AJPPoFc2cFLn
         EJvM67A0tJz8qI+ZtGgcti79UU2bQE2KFmuZObTFA5+zgti4sBqA/S1pwf1iVZ04RJtg
         uO/mqVmAo3iTiCmOgqwm2Sg5pv1sKdaIbvgvCHyv8U8t9EYZzO+uwqPcBgo1Fbksu0Pc
         FGm7AoyFvEJIaxxSnzEPmD7tH9uc9Iccf4oeqLIh4uE+0425RAkwRWN25TBFV/LWmeik
         sZvQf/sJ1Frg1dmCMYaPLdSjY64kjsshm7s/xkZKG7gP32RKAGannabsn9lFNjLmE2nG
         m+ug==
X-Gm-Message-State: APt69E118aOe1kO+7zSgeLypnI8MP6mQSorSsZni7Yz2aG8DNIoMfXFT
        cuLKO9yRD5J98n950p4S14wHLA==
X-Google-Smtp-Source: AAOMgpeG8+9JesYsh3uEbQSS0ggC7Yrix2TkX/lm3mDonFiXduh7966jpS0HY3ZIevMELon9PUlBEA==
X-Received: by 2002:adf:f282:: with SMTP id k2-v6mr8259761wro.263.1530191456432;
        Thu, 28 Jun 2018 06:10:56 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id o17-v6sm6723397wrp.62.2018.06.28.06.10.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jun 2018 06:10:55 -0700 (PDT)
Date:   Thu, 28 Jun 2018 15:10:49 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
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
Message-ID: <20180628131049.GA14956@andrea>
References: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1530182480-13205-3-git-send-email-andrea.parri@amarulasolutions.com>
 <20180628130258.GF7646@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628130258.GF7646@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

On Thu, Jun 28, 2018 at 06:02:58AM -0700, Matthew Wilcox wrote:
> On Thu, Jun 28, 2018 at 12:41:19PM +0200, Andrea Parri wrote:
> > + * smp_mb__after_spinlock() provides a full memory barrier between po-earlier
> > + * lock acquisitions and po-later memory accesses.
> 
> What does po-earlier mean?  Partial order?

"po" was intended as an abbreviation for "program order"; I should have
kept the whole form..., thank you for the feedback.

  Andrea
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
