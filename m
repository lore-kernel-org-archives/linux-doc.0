Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5216B7D088
	for <lwn-linux-doc@archive.lwn.net>; Sat,  6 Oct 2018 02:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbeJFJMT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 6 Oct 2018 05:12:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36648 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729063AbeJFJMS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Oct 2018 05:12:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id y11-v6so4448388plt.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Oct 2018 19:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bUNYlJGIjGCvXIhJkr6hq8hpy2plvFlAxJEvKFZicn4=;
        b=HUDKFKd2BDUlgS9EjaxcsnmhwREO1EsmWNuxQkIXvqB3jJOXSAA90ALvLLHX3QeMKZ
         O1OuXvwASl056bQNQJyhkj89F2ACOPxAwhdErSeG5+jNcxWhjjGm+AP5okpHI2r3/dvG
         fqvhIVYedDW2WWGnzSloY/kUavtdoztb3NaOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bUNYlJGIjGCvXIhJkr6hq8hpy2plvFlAxJEvKFZicn4=;
        b=Yb8rG/Io9O+mhqbcO0wKK/4nAXtBxnlD+Cxqlzn8sXg4evTtlpAgUnnQQsggNIQsC6
         m+rs5FM/c2OpVJgx8nKzRZYnFRNfqQXE9ev2SPM3IuPWFhVnWWv0nQH3CXLC1NiYTwAN
         BISkPoyvMKsQBuHthIb3Np6UfEZpqg/VV0FrZcYWUKiUIWnI77VrbyI7XSaqOlt3YwPM
         AIHuE8x9Yb29uG9hONVyXhOwbDpibA8JpjYOXfPyyIbyh6wTdQTEOqurVC+seW4bjxYl
         Yc+aFCzbYlFDfWAjYMmlPFj3q8PVooWt9G5irRUQv0bGmo5lkf/sBzGMyRC0ZlCKkv1i
         yZMQ==
X-Gm-Message-State: ABuFfogmxwjLZCB27m6+g9NfwFZZVJXJHpJyLtg06KJwz5mAzhUGa1b/
        aVuv8Jcy/rVTRZwp1qHYIrnYEQ==
X-Google-Smtp-Source: ACcGV60+h+dEZWUbI4bCflzMtoOsCG9AnaE0IYRTVx2+O9S9dEygMo2MTTwj38Awz/lvY3T0skPtEA==
X-Received: by 2002:a17:902:5c4:: with SMTP id f62-v6mr1195640plf.18.1538791852337;
        Fri, 05 Oct 2018 19:10:52 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id l2-v6sm9146111pgp.20.2018.10.05.19.10.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Oct 2018 19:10:51 -0700 (PDT)
Date:   Fri, 5 Oct 2018 19:10:50 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>, pantin@google.com
Subject: Re: [PATCH RFC 0/5] rcu doc updates for whatisRCU and checklist
Message-ID: <20181006021050.GC204532@joelaf.mtv.corp.google.com>
References: <20181005231815.170433-1-joel@joelfernandes.org>
 <20181006001326.GL2674@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181006001326.GL2674@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 05, 2018 at 05:13:26PM -0700, Paul E. McKenney wrote:
> On Fri, Oct 05, 2018 at 04:18:09PM -0700, Joel Fernandes (Google) wrote:
> > Hi Paul,
> > 
> > Here are this week's rcu doc updates based on combing through whatisRCU and
> > checklists. Hopefully you agree with them. I left several old _bh and _sched
> > API references as is, since I don't think its a good idea to remove them till
> > the APIs themselves are removed, however I did remove several of them as well
> > (like in the first patch in this series) since I feel its better to "encourage"
> > new users not to use the old API.
> > 
> > Also do you think it makes sense for us to write coccinelle patches to check if
> > folks use them on new patches? Btw, I am new to coccinelle but I'd love to give
> > it a try, it looks exciting. I remember you saying you wanted to do that, so
> > that's something else you could potentially offload to me as you see fit ;-)
> > 
> > Thank you very much!
> 
> Good catches, applied and pushed, thank you!
> 
> I updated the commit log and a couple of the patches a bit, so could
> you please double-check them?

Yes I checked and it looks good, thanks!

 - Joel

