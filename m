Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB5CB7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Aug 2019 21:43:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfH1VnX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Aug 2019 17:43:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35718 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbfH1VnX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Aug 2019 17:43:23 -0400
Received: by mail-pf1-f193.google.com with SMTP id d85so629645pfd.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Aug 2019 14:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RKU7RohOsxj+UeuRYGzxu1eVk2KwAL8JofUsXANZvgs=;
        b=GvhKCTyM7rCs+C3FlV0YHDhiydpck0aVyWoZoTh8XZFVftltXo/3m2XDAlmmbndBdj
         0i6xc2C/aKhgb3V29HPhEyfu/qChj380lW+HHT2833a2xvlog+sCSImEOrz86Tfij5+G
         mcBfuETczxEjNZ+rVt+NVnvJzIY9hk+8OlUo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RKU7RohOsxj+UeuRYGzxu1eVk2KwAL8JofUsXANZvgs=;
        b=T3gWWYTJ2vZWaoK+QudMz+zj5HnVW4p4yVdknO1JR/4pxLYrx+XLAsCxnKEBBuzhP5
         QthHplz+MYLe8WfIYB3AOa4FkJUOY8UeSCD++U2ITqHzs9CghA19dPNxUgbVnUr5tFGM
         lddu92iNrZ2HHrBIE8gCPyGdAm89G7qlo2AiuIBroN4KSWQNIFHhTkicIwMzcaOu0hXB
         9tLAhfcHgXJa0nadwtlTCX7JBGrECBnqO0GNNeqH7GvXVfuEErseTrloXttGd+uvyAhc
         EnUJ9bJ6OFd366/vKPOubNorulewG00C+2oz6uxUOntJCxq8MkFNxMDvZcBLnLPvNiyq
         gNsA==
X-Gm-Message-State: APjAAAU1kA5OWKk4CJlgwxGgzpq5PV8pRXfEnX5xVeQzKw2PhE0OdPvI
        g4x6FFqurC0XCI+eLuTKQ5louw==
X-Google-Smtp-Source: APXvYqyQJ8hU7BxGeoANDn5yV4OoWFaTZeQU7j7N2P6E7SfgqcDNJUvNKcDZG6XX0kYevyW+yypGvw==
X-Received: by 2002:a63:df06:: with SMTP id u6mr5111636pgg.96.1567028602563;
        Wed, 28 Aug 2019 14:43:22 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id 4sm319542pfn.118.2019.08.28.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 14:43:21 -0700 (PDT)
Date:   Wed, 28 Aug 2019 17:43:20 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, byungchul.park@lge.com,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        kernel-team@android.com
Subject: Re: [PATCH 3/5] rcu/tree: Add support for debug_objects debugging
 for kfree_rcu()
Message-ID: <20190828214320.GE75931@google.com>
References: <5d657e37.1c69fb81.54250.01df@mx.google.com>
 <20190828213119.GY26530@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828213119.GY26530@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 28, 2019 at 02:31:19PM -0700, Paul E. McKenney wrote:
> On Tue, Aug 27, 2019 at 03:01:57PM -0400, Joel Fernandes (Google) wrote:
> > Make use of RCU's debug_objects debugging support
> > (CONFIG_DEBUG_OBJECTS_RCU_HEAD) similar to call_rcu() and other flavors.
> 
> Other flavors?  Ah, call_srcu(), rcu_barrier(), and srcu_barrier(),
> right?

Yes.

> > We queue the object during the kfree_rcu() call and dequeue it during
> > reclaim.
> > 
> > Tested that enabling CONFIG_DEBUG_OBJECTS_RCU_HEAD successfully detects
> > double kfree_rcu() calls.
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> The code looks good!

thanks, does that mean you'll ack/apply it? :-P

 - Joel

> 
> 							Thanx, Paul
> 
> > ---
> >  kernel/rcu/tree.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index 9b9ae4db1c2d..64568f12641d 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -2757,6 +2757,7 @@ static void kfree_rcu_work(struct work_struct *work)
> >  	for (; head; head = next) {
> >  		next = head->next;
> >  		/* Could be possible to optimize with kfree_bulk in future */
> > +		debug_rcu_head_unqueue(head);
> >  		__rcu_reclaim(rcu_state.name, head);
> >  		cond_resched_tasks_rcu_qs();
> >  	}
> > @@ -2868,6 +2869,13 @@ void kfree_call_rcu(struct rcu_head *head, rcu_callback_t func)
> >  	if (rcu_scheduler_active != RCU_SCHEDULER_RUNNING)
> >  		return kfree_call_rcu_nobatch(head, func);
> >  
> > +	if (debug_rcu_head_queue(head)) {
> > +		/* Probable double kfree_rcu() */
> > +		WARN_ONCE(1, "kfree_call_rcu(): Double-freed call. rcu_head %p\n",
> > +			  head);
> > +		return;
> > +	}
> > +
> >  	head->func = func;
> >  
> >  	local_irq_save(flags);	/* For safely calling this_cpu_ptr(). */
> > -- 
> > 2.23.0.187.g17f5b7556c-goog
> > 
