Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 807A57D087
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Oct 2018 19:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbeJKCdT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Oct 2018 22:33:19 -0400
Received: from imap.thunk.org ([74.207.234.97]:42962 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbeJKCdS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Oct 2018 22:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=fRWVMAqAEEThnjYzwz9rFJPbidGagUpLN/pVG9RQw24=; b=MqcbE4I4DiIJUEA6UpCU4oOUH2
        FHuMWaQUYhYnZ+7fFNN+WBqVuDweVh7Gf5djF1mAHqATfZWVZcMgfaS+VU9TK49cgXJQg6gbn3+ud
        ZLBWx4rGEOvR2Q2KyY86xrnTfhg1iH05TvkQT2R7c85PEJK47avxjpXSTuwIObwxaLfo=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1gAJrY-0002m3-Ol; Wed, 10 Oct 2018 19:09:40 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id F07927A7902; Wed, 10 Oct 2018 15:09:39 -0400 (EDT)
Date:   Wed, 10 Oct 2018 15:09:39 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Joel Fernandes <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] docs: rcu: Make reader aware of rcu_dereference_protected
Message-ID: <20181010190939.GA25315@thunk.org>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>, linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20181009013341.60111-1-joel@joelfernandes.org>
 <20181010030906.GB2674@linux.ibm.com>
 <20181010040159.GA90259@joelaf.mtv.corp.google.com>
 <20181010154414.GC2674@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181010154414.GC2674@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks, the update to the documentation looks great!!

I think lockdep_is_held() should be better documented, but that should
be done in the lockdep docs, not the RCU documentation.

	    	      	  		- Ted
