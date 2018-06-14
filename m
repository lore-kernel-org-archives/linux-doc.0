Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D75737D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 11:37:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755155AbeFNLg5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 07:36:57 -0400
Received: from merlin.infradead.org ([205.233.59.134]:37136 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754810AbeFNLgy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 07:36:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=THAvWMxb2gTaCGhNNuNl20C9R+516lmeKZsXysZsCxs=; b=qVYmXa/zRS4eKDy7vCipDGRJG
        qiVy+/2h1Zznr91McZrgDTHv9I/X/LrujJAp3tvrU7afqeKy+a6Ac02CFMJYjx1U1WELxAyV+T+Xx
        nl3OAk0CdbtniowkgOp7D4Qg6t8ezZSe0HB39jXPayhMcOSpZzURqykdPhI3m1dMlKMa6zdbacOj+
        rC5iVyvqcU+3wSUHXJzmQCoVHV3QetwQ16NN/vRGInG9pMMjphSCN6xWKMXeGR+pqr4yM0ijI7jtF
        E9QJsZeD6r0Q1FufDqutFN4JGLQcznGw1dTWUgytGfFmNycsVdBBbo8rXPLHSW+G/EtNwATnSOeg/
        uS5ZOxBag==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fTQXw-0003zH-4r; Thu, 14 Jun 2018 11:36:09 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 3BC04201EA7CA; Thu, 14 Jun 2018 13:36:04 +0200 (CEST)
Date:   Thu, 14 Jun 2018 13:36:04 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Thomas Hellstrom <thellstrom@vmware.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Davidlohr Bueso <dave@stgolabs.net>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] locking: Implement an algorithm choice for
 Wound-Wait mutexes
Message-ID: <20180614113604.GZ12198@hirez.programming.kicks-ass.net>
References: <20180614072922.8114-1-thellstrom@vmware.com>
 <20180614072922.8114-2-thellstrom@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180614072922.8114-2-thellstrom@vmware.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 14, 2018 at 09:29:21AM +0200, Thomas Hellstrom wrote:

>  __ww_mutex_wakeup_for_backoff(struct mutex *lock, struct ww_acquire_ctx *ww_ctx)
>  {
>  	struct mutex_waiter *cur;
> +	unsigned int is_wait_die = ww_ctx->ww_class->is_wait_die;
>  
>  	lockdep_assert_held(&lock->wait_lock);
>  
> @@ -310,13 +348,14 @@ __ww_mutex_wakeup_for_backoff(struct mutex *lock, struct ww_acquire_ctx *ww_ctx)
>  		if (!cur->ww_ctx)
>  			continue;
>  
> -		if (cur->ww_ctx->acquired > 0 &&
> +		if (is_wait_die && cur->ww_ctx->acquired > 0 &&
>  		    __ww_ctx_stamp_after(cur->ww_ctx, ww_ctx)) {
>  			debug_mutex_wake_waiter(lock, cur);
>  			wake_up_process(cur->task);
>  		}
>  
> -		break;
> +		if (is_wait_die || __ww_mutex_wound(lock, cur->ww_ctx, ww_ctx))
> +			break;
>  	}
>  }

I ended up with:


static void __sched
__ww_mutex_check_waiters(struct mutex *lock, struct ww_acquire_ctx *ww_ctx)
{
	bool is_wait_die = ww_ctx->ww_class->is_wait_die;
	struct mutex_waiter *cur;

	lockdep_assert_held(&lock->wait_lock);

	list_for_each_entry(cur, &lock->wait_list, list) {
		if (!cur->ww_ctx)
			continue;

		if (is_wait_die) {
			/*
			 * Because __ww_mutex_add_waiter() and
			 * __ww_mutex_check_stamp() wake any but the earliest
			 * context, this can only affect the first waiter (with
			 * a context).
			 */
			if (cur->ww_ctx->acquired > 0 &&
			    __ww_ctx_stamp_after(cur->ww_ctx, ww_ctx)) {
				debug_mutex_wake_waiter(lock, cur);
				wake_up_process(cur->task);
			}

			break;
		}

		if (__ww_mutex_wound(lock, cur->ww_ctx, ww_ctx))
			break;
	}
}


Currently you don't allow mixing WD and WW contexts (which is not
immediately obvious from the above code), and the above hard relies on
that. Are there sensible use cases for mixing them? IOW will your
current restriction stand without hassle?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
