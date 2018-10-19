Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0846E7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Oct 2018 01:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbeJSJbj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 05:31:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42844 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbeJSJbj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Oct 2018 05:31:39 -0400
Received: by mail-pg1-f196.google.com with SMTP id i4-v6so15010916pgq.9
        for <linux-doc@vger.kernel.org>; Thu, 18 Oct 2018 18:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KKFhgH3/F8G99ClT0GhiKaoexzY9BTl1bxJm2dsagMU=;
        b=xckwqF9GVGjx2A8lLsM/Xa02KOoGvNUPlkbTBzoWhsGEw2Ylzq51k8fC4qnsrpJEuS
         XfwZBX1FwBvColB8DvAbbxSzTIh7OBso+q9AxwEpjmz1iLCg4JTQmNwD6X6n18WdTeyj
         Tto1A8h2gHAUxBa/YS+IuEceEA1ZAsj0pnxjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KKFhgH3/F8G99ClT0GhiKaoexzY9BTl1bxJm2dsagMU=;
        b=k+Fn/GqcnEAHfE5QZhNMliEtz+lvmPvQKsAUaJIYvDR+pxtXyGGSyZ+KowSqb7Db8u
         kRcELRV1Wa6G+taFN6RIJZKOY8Ts+STxsT63316lzKkgvihuGq77PERX4HswQNP4Yfso
         MzwzI8+Xbw+qeVnN0YTxdmDAwsHYU/EXZfK4e1Wfe6GJN722E61IaKFIRKtowKYyUJv2
         ZSJCSplFEF5QPSV00THHf5pbhsYCRqX1AJyJtYy1VE9tUsInYqO3FzN3NBs1c1jNGgmP
         fqt3qRdPozt0/zIxFozmlRnQdrLbnUVsu2gRZYr1IPs0tj2ypatGaMj7646qTYBvF9Sm
         +7Hg==
X-Gm-Message-State: ABuFfog2AMl8CoJtF/R4Dx6WzuWdApS4Oniysj5SalIYtzT7+9rRlRIZ
        GtUiJKSYCooCmvsbrYVkau94Lw==
X-Google-Smtp-Source: ACcGV6196JmE96Ph3cjoEUxg7JuUXMYuCXvaCR9EFcXQ135DpfIHBBIp/fm/rOqoxkhGTU6Mj4+H7w==
X-Received: by 2002:a63:2f42:: with SMTP id v63-v6mr16433344pgv.202.1539912472547;
        Thu, 18 Oct 2018 18:27:52 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id h6-v6sm29618671pgn.84.2018.10.18.18.27.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Oct 2018 18:27:51 -0700 (PDT)
Date:   Thu, 18 Oct 2018 18:27:50 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Nikolay Borisov <nborisov@suse.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about
 disabling preemption
Message-ID: <20181019012750.GD89903@joelaf.mtv.corp.google.com>
References: <20181016112611.GA27405@linux.ibm.com>
 <20181016204122.GA8176@joelaf.mtv.corp.google.com>
 <20181017161100.GP2674@linux.ibm.com>
 <20181017181505.GC107185@joelaf.mtv.corp.google.com>
 <20181017203324.GS2674@linux.ibm.com>
 <20181018020751.GB99677@joelaf.mtv.corp.google.com>
 <20181018144637.GD2674@linux.ibm.com>
 <20181019000350.GB89903@joelaf.mtv.corp.google.com>
 <20181019001932.GR2674@linux.ibm.com>
 <20181018211245.10baf496@vmware.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181018211245.10baf496@vmware.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 18, 2018 at 09:12:45PM -0400, Steven Rostedt wrote:
> On Thu, 18 Oct 2018 17:19:32 -0700
> "Paul E. McKenney" <paulmck@linux.ibm.com> wrote:
> 
> > I figured that whoever calls preempt_enable_no_resched() is taking the
> > responsibility for permitting preemption in the near future, and if they
> > fail to do so, they will get called on it.  Hard to hide from the latency
> > tracer, after all.  ;-)
> 
> Correct, and doing a search of preempt_enable_no_resched() I see
> there's one in the ftrace ring buffer code, that was added a long time
> ago (2008) to fix a recursion bug that no longer exists, and this now
> can leak a preemption point.
> 
> I'll have to go fix that :-(

Cool! Glad you found this issue in the code while we are discussing it ;)

thanks,

- Joel

