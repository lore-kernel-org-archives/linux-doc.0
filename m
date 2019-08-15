Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6FE9B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Aug 2019 15:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729176AbfHOPZB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Aug 2019 11:25:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39271 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbfHOPZB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Aug 2019 11:25:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so1434707pgi.6
        for <linux-doc@vger.kernel.org>; Thu, 15 Aug 2019 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/HAVtRJ1PsEuTkAUc5sMbDf7NKx2+25/4sGFjK/yLmI=;
        b=p/rcF9HUaxokqqtlBD6cRzMqVS5aMb26xsT8XFZesE6GelXE2agrxezh39Oeg+hfGB
         xAvaausfSkZJetZST//O1oxgq4aGZkjqemfeRnMo4W7+ZZ/erzX1F6adVqpbB+c90m3Q
         V99zTMJqa9vfT5ucEAHWnJZ1WQ+Mn9yRvzAIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/HAVtRJ1PsEuTkAUc5sMbDf7NKx2+25/4sGFjK/yLmI=;
        b=UdV3CGfYaUsBNURb60sUYpKhyjqsMR2Jz+Hd638fVWhulhs1SA1wwFsN07XRZY475X
         HSndzZHbTPqyjvTM9obWN3YjDSJDrW9ylWrh2N+GL+5kBEHpqtSbOyNcu8i3Ucpao1G8
         iZb/qFNf6QKkAUJ328FAu9f3P6KEZRi7HLGcLcqSxsNrvYL3r2cPJLG5BJSYREc13gi1
         CwOUN8iDWizCQGjQygXj+nV641oFMDyPYxUhCoZBkPcQP17t/o10PN4DP8dGDeP+RaAl
         6t4xZsN6S2gbHAKPpsyWggXAj1X9UxRtZYu1P8/xjPttin5t2SVWRWDE16yfiBxw6/Us
         WiWA==
X-Gm-Message-State: APjAAAX4y3zICPmPsqIJmiuaX2VmoF7Omle/dXIccpt4pUF6AFNOH22k
        8E1VqKqKTW2xNR5wYHOr/9AKlab9B8I=
X-Google-Smtp-Source: APXvYqzGZZp0X2UruoJmPDipoLHodoHbSAODCUTEnrhBXIUOdW+725CS6Bq9Bv2QKCuiId8iQb2BGw==
X-Received: by 2002:a17:90a:a489:: with SMTP id z9mr2679120pjp.24.1565882700049;
        Thu, 15 Aug 2019 08:25:00 -0700 (PDT)
Received: from localhost ([172.19.216.18])
        by smtp.gmail.com with ESMTPSA id k6sm3082851pfi.12.2019.08.15.08.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2019 08:24:59 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:24:42 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v3 -rcu] workqueue: Convert for_each_wq to use built-in
 list check
Message-ID: <20190815152442.GB12078@google.com>
References: <20190815141842.GB20599@google.com>
 <20190815145749.GA18474@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815145749.GA18474@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 15, 2019 at 07:57:49AM -0700, Matthew Wilcox wrote:
> On Thu, Aug 15, 2019 at 10:18:42AM -0400, Joel Fernandes (Google) wrote:
> > list_for_each_entry_rcu now has support to check for RCU reader sections
> > as well as lock. Just use the support in it, instead of explicitly
> > checking in the caller.
> 
> ...
> 
> >  #define assert_rcu_or_wq_mutex_or_pool_mutex(wq)			\
> >  	RCU_LOCKDEP_WARN(!rcu_read_lock_held() &&			\
> >  			 !lockdep_is_held(&wq->mutex) &&		\
> 
> Can't you also get rid of this macro?

Could be. But that should be a different patch. I am only cleaning up the RCU
list lockdep checking in this series since the series introduces that
concept).  Please feel free to send a patch for the same.

Arguably, keeping the macro around also can be beneficial in the future.

> It's used in one place:
> 
> static struct pool_workqueue *unbound_pwq_by_node(struct workqueue_struct *wq,
>                                                   int node)
> {
>         assert_rcu_or_wq_mutex_or_pool_mutex(wq);
> 
>         /*
>          * XXX: @node can be NUMA_NO_NODE if CPU goes offline while a
>          * delayed item is pending.  The plan is to keep CPU -> NODE
>          * mapping valid and stable across CPU on/offlines.  Once that
>          * happens, this workaround can be removed.
>          */
>         if (unlikely(node == NUMA_NO_NODE))
>                 return wq->dfl_pwq;
> 
>         return rcu_dereference_raw(wq->numa_pwq_tbl[node]);
> }
> 
> Shouldn't we delete that assert and use
> 
> +	return rcu_dereference_check(wq->numa_pwq_tbl[node],
> +			lockdep_is_held(&wq->mutex) ||
> +			lockdep_is_held(&wq_pool_mutex));

Makes sense. This API also does sparse checking. Also hopefully no sparse
issues show up because rcu_dereference_check() but anyone such issues should
be fixed as well.

thanks,

 - Joel

> 
