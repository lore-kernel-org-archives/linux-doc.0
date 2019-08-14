Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B2337D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Aug 2019 22:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbfHNWmI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Aug 2019 18:42:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39790 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728378AbfHNWmI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Aug 2019 18:42:08 -0400
Received: by mail-pl1-f195.google.com with SMTP id z3so258680pln.6
        for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2019 15:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hMEHK3D0DeqRXHR3V666QBC5hkX1AwG9+yo5maZ51Ws=;
        b=PzkYxpR+WsvJ0GKSPP9wt0l4YqVfxxZlRPySwxDENc0uquYDE4FH3bIiRoxfTPA1v0
         daLJqf8B4sQuDac5d61sdyojfc8b9g9yhK52TGU9vCCC2Q6Ozm2F1P/8FaMyzsrTVEb0
         3Xm3jaPn/9nJxAF4SojpaoPdnkNoRcv5nmLjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hMEHK3D0DeqRXHR3V666QBC5hkX1AwG9+yo5maZ51Ws=;
        b=LyzwrZdIccGNPiRI/y4/OSOWeFv64HZNX/wOqF09HAzhSE1DKVw8cvxXBEXOiBJ+Ge
         /vDCwZPVciua2HhdWjCIe6YLe4hQaG22zmbTIYz5TYM9r3gndSY2H0HlZMTxZ9CPClZz
         IYJ9bYfGBdX70mxeEtwL9KQxjLSoGREPdhhwCvjlgLs/JPtSAKq791FoMsiJwUDkaeCR
         dyjJ+hxaXdupk4LQLizEbFam9NN70c0zP3mZTZyChIbukld8LP+88qtH5O1eavs0YWu8
         u6ibPkL+/uNzefjyv3peeO1eaedgOWQ7SRKcPeqxgmRr8Zvuf8OSLAJqaj5HPW9DsIJU
         uqig==
X-Gm-Message-State: APjAAAU7BjnT0oBGO7L+ypZHZV2RitJASGvBW1crP2nzHwc8NZrhqVCQ
        jRHtEcbiOgARdfGC6fE7NUXShw==
X-Google-Smtp-Source: APXvYqxeCtn5YQ0RrQb6xdht/iQSMOK2IulsqUWdD2tppaE3yQNeQo12jNVOsbuEuixCZiNvYLOGgg==
X-Received: by 2002:a17:902:2f05:: with SMTP id s5mr1571241plb.170.1565822527290;
        Wed, 14 Aug 2019 15:42:07 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id v6sm31357pjn.13.2019.08.14.15.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 15:42:06 -0700 (PDT)
Date:   Wed, 14 Aug 2019 18:42:05 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Tejun Heo <tj@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/3] workqueue: Convert for_each_wq to use built-in list
 check (v2)
Message-ID: <20190814224205.GC69375@google.com>
References: <20190811221111.99401-1-joel@joelfernandes.org>
 <20190814194841.GA588936@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814194841.GA588936@devbig004.ftw2.facebook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 14, 2019 at 12:48:41PM -0700, Tejun Heo wrote:
> Hello, Joel.
> 
> On Sun, Aug 11, 2019 at 06:11:09PM -0400, Joel Fernandes (Google) wrote:
> > list_for_each_entry_rcu now has support to check for RCU reader sections
> > as well as lock. Just use the support in it, instead of explicitly
> > checking in the caller.
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

> >  #define for_each_pwq(pwq, wq)						\
> > -	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node)		\
> > -		if (({ assert_rcu_or_wq_mutex(wq); false; })) { }	\
> > -		else
> > +	list_for_each_entry_rcu((pwq), &(wq)->pwqs, pwqs_node,		\
> > +				 lock_is_held(&(wq->mutex).dep_map))
> 
> Why not lockdep_is_held() tho?

Yes, that's better.

thanks,

 - Joel

