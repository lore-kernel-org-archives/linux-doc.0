Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ED9F47D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Oct 2018 04:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbeJJLWM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Oct 2018 07:22:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41448 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbeJJLWM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Oct 2018 07:22:12 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23-v6so1841324pgc.8
        for <linux-doc@vger.kernel.org>; Tue, 09 Oct 2018 21:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hrHS4Yon7AxP4IBtkCiagEKejf29+uW0sRxzewtyvBA=;
        b=oxCCl+aq8BWvGOCD50OVZT2Eq7yAbyPZGv3IzCQ0GPqojFlI4zrZnYtJ6xRQc+bIFy
         BMYFQvdrv4YwH6OjuzC36zaO2pkl5n21dosy2ZgIt1r1oiZJwa/b8FzNL1+5wlRTG3rJ
         eDPg8EtcmkOr/x3wuwT4/0hqB4dLKkrqx39ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hrHS4Yon7AxP4IBtkCiagEKejf29+uW0sRxzewtyvBA=;
        b=WPEw0r2Cuk/rKIUZg/YOEgEc7qMfvFNs4QNqUPqmTcvVOvlzg0X2YTqWviGlKTRe57
         Vz7M0mjV8yqzE8gUsakk0LuCOpFbLw/bx1xJQVKlmcyqfAhOkixqVqqFrvThozRnQted
         73uS9tkBLodIr5u/qnhvBPmlUl3AUC9x7tEoLvyxwFHKk6QA7Dboqw4u/YOKPQPMVVpz
         LHxlOdhwK7eTzd97rTawKhAh7D4PKVXh/SQ56uGIl4FLoVzIhyXHJJomdfb+35nk6VUl
         fkXmlPP547cNnyb3NXMw7WJaEPjpWnMzF8tp4caUA8NorBkwlppvDa6rAdQ4rXfdvCxP
         5RFA==
X-Gm-Message-State: ABuFfogYxdXdFlbFoLox/ueJd05q16KbfKAjxN29uynCDfG1QYSYkwA9
        WZ/7/UnKupB3onlVNujdKwH1Rw==
X-Google-Smtp-Source: ACcGV60Ucg1L5bHEzeJhJ5iOUn135psj1lG1O2nqoyrUOm7G7FdGq2Dlr22vMwyPzrg5rbaraFFIYQ==
X-Received: by 2002:a63:1e15:: with SMTP id e21-v6mr28368549pge.430.1539144122121;
        Tue, 09 Oct 2018 21:02:02 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id f1-v6sm36721373pgc.4.2018.10.09.21.02.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Oct 2018 21:02:00 -0700 (PDT)
Date:   Tue, 9 Oct 2018 21:01:59 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, tytso@mit.edu,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] docs: rcu: Make reader aware of rcu_dereference_protected
Message-ID: <20181010040159.GA90259@joelaf.mtv.corp.google.com>
References: <20181009013341.60111-1-joel@joelfernandes.org>
 <20181010030906.GB2674@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181010030906.GB2674@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 09, 2018 at 08:09:06PM -0700, Paul E. McKenney wrote:
> On Mon, Oct 08, 2018 at 06:33:41PM -0700, Joel Fernandes (Google) wrote:
> > whatisRCU says rcu_dereference cannot be used outside of rcu read lock
> > protected sections. Its better to mention rcu_dereference_protected when
> > it says that, so that the new reader is aware of this API and is not led
> > to believing that all RCU dereferences in all situations have to be
> > protected by a rcu_read_lock() and rcu_read_unlock().
> > 
> > Cc: tytso@mit.edu
> > Suggested-by: tytso@mit.edu
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Good stuff!  I queued and pushed this with some wordsmithing.  Could
> you please check for my having messed something up?

One small nit which the below diff should fix, but otherwise looks good to
me, thanks!

 - Joel

----8<----

diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whatisRCU.txt
index 38044c978e54..093b85ad49eb 100644
--- a/Documentation/RCU/whatisRCU.txt
+++ b/Documentation/RCU/whatisRCU.txt
@@ -297,7 +297,7 @@ rcu_dereference()
 	protected by locks acquired by the update-side code.  This variant
 	avoids the lockdep warning that would happen when using (for
 	example) rcu_dereference() without rcu_read_lock() protection.
-	Using rcu_dereference_protected() also have the advantage
+	Using rcu_dereference_protected() also has the advantage
 	of permitting compiler optimizations that rcu_dereference()
 	must prohibit.	The rcu_dereference_protected() variant takes
 	a lockdep expression to indicate which locks must be acquired
