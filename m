Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 147FD7DE6E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 17:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934205AbeGCRIH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 13:08:07 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:38865 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934125AbeGCRIF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 13:08:05 -0400
Received: by mail-wm0-f66.google.com with SMTP id 69-v6so3057250wmf.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Jul 2018 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Btgj+Fp1aw0ecYcMPqSZF3pvPjc45wcKuIDXd1bMbeM=;
        b=gt6JTKOGf25CL8ltr40Y5lfXADBTy2C5fQ8SzwcdsmKfTBqAifJjsu9ddbqomrCfMu
         M9dBqMvyZhZ5G1+6yqkoK1d0nF9p++fLcqAoB5iz+l+CwCty0grOJNdeM1Qlc0uiUqMt
         lzYQWdJ/JIhXGkF9uqtNm9Q+054vhQyvDMRCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Btgj+Fp1aw0ecYcMPqSZF3pvPjc45wcKuIDXd1bMbeM=;
        b=OQR/Sa5Fg880ri6S43Cwc6RMifHCW7ux239W4oL0h0H80gatxwY3h8rLiSDdVnjUPA
         ZY2N7+qmDbDtHBaZyYlNXklkVpyLjPyk5ou8ORUHwLFlhsJ3IUy0DVs6DybhtKLvRO9l
         HP4GQxh3f7jYsHrV++h+k1l0ttrzoKp9PjvGUJF1hoOR/Dn60BE4ebHIudhc54IkWDEI
         8OKbcu1aMJlTSZ7pT5/pmUcB+fZHOD3X+EgcMSlFxyqJxWfvD2zrhZVEinlXMsfflb3U
         MgazkfI/LlW8drnijqlYXhOq1ZAJp4btG00ImRLIaCDoukkO+B0CocDeGYodjcX8M/wx
         ganw==
X-Gm-Message-State: APt69E1yJbEoh7H6NsLsMlFRRQhdpXjWAxv2u5XIJxh3AOYxRhXUu0/i
        J801vFriawO0RsVNwuy8+DMBzw==
X-Google-Smtp-Source: AAOMgpeOCdA3M4P3Bo8F7CGf/+QnU/gNOueBqwUNuKnfYaHQuzSZeFVegI2smnSqOx4zjjJp3HR3qw==
X-Received: by 2002:a1c:3743:: with SMTP id e64-v6mr8239720wma.63.1530637684471;
        Tue, 03 Jul 2018 10:08:04 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id o42-v6sm4283818wrc.50.2018.07.03.10.08.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Jul 2018 10:08:03 -0700 (PDT)
Date:   Tue, 3 Jul 2018 19:07:57 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
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
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 2/3] locking: Clarify requirements for
 smp_mb__after_spinlock()
Message-ID: <20180703170757.GA3251@andrea>
References: <1530544315-14614-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1530629639-27767-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180703153910.GZ3593@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703153910.GZ3593@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 03, 2018 at 08:39:10AM -0700, Paul E. McKenney wrote:

[...]

> > + * smp_mb__after_spinlock() provides the equivalent of a full memory barrier
> > + * between program-order earlier lock acquisitions and program-order later
> 
> Not just the earlier lock acquisition, but also all program-order earlier
> memory accesses, correct?

I understand: "but also all program-order earlier memory accesses program-order
before that lock acquisition(s) ...".  Yes, but:

  - I considered this as implied by the above (L ->mb M2 and M1 ->po L implies
    M1 ->mb M2, where M1, M2 are memory accesses and L is a lock acquisition);

  - my prose abilities are limited ;-), and I was/am unable to come up with an
    (to me) acceptable or readable enough way to make it explicit; some ideas?


> > + *	  WRITE_ONCE(X, 1);		WRITE_ONCE(Y, 1);
> > + *	  spin_lock(S);			smp_mb();
> > + *	  smp_mb__after_spinlock();	r1 = READ_ONCE(X);
> > + *	  r0 = READ_ONCE(Y);
> > + *	  spin_unlock(S);
> 
> Should we say that this is an instance of the SB pattern?  (Am OK either
> way, just asking the question.)

I don't think we *should* ;-),  but I'm also OK either way.

  Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
