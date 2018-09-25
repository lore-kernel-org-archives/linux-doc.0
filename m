Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6D76B7D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 18:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbeIZA6Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 20:58:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43531 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbeIZA6Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 20:58:16 -0400
Received: by mail-lj1-f194.google.com with SMTP id m84-v6so22730357lje.10
        for <linux-doc@vger.kernel.org>; Tue, 25 Sep 2018 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+CK6/JK9NoS9LCQtCqUtUy7XYEtjbTk8RCaxRN4oyE=;
        b=Ee+vdNz0oRrepr40QayxH2KChXVIFdcF6XiZl+e/TK7GjXt6OxWzAIyNrthXMbDaOc
         qLELqUzObikPoB2HebvldN8vGnU5R/tnlvHetYWkB1cNET3y9S7hVxmgLpzZTP1gQd8k
         uvhtyrp4PHXMiMbv6bp0mHCjyljA3nQ3X2mXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+CK6/JK9NoS9LCQtCqUtUy7XYEtjbTk8RCaxRN4oyE=;
        b=amMQoJPo42ckM6ZoxxKN6cKOvXT21tyBCNSs0XyCgdWd/WbgBBBmMPQlhvAvE1Xn9u
         EHNWytnqFJs/3ls65rY5kp+t4IpaHFjUWE32fDE7n40y991FF9WLfLuhOly+djpYgqkO
         3WVBKcP1LbpZeCJ6K7Bi5UEVBGMOMPYV7PkC54KiEjWLcL4hlJQcHkZx2ObUD+1eWnMc
         0twQvvMKwZEh0yWQNETd7Idxk0I99IXX680S92NtXj5/Cf8t7rDun5Ro0RprOtpt8du9
         DC4SqSBjrs/2kxh/anTP4EUSaEVRgal6wLXDRbb5VRuXLkzfPlBstFZYjLbQeDQtYN45
         aKxA==
X-Gm-Message-State: ABuFfoiFhtbvdWlDs7gSmr03XVpkTH387HSoOnzS3T5y2UzZpxFhr/sm
        EI2Z/tDg08IVYovRI45IM4rsTdoehnbc9Mho3fSBgA==
X-Google-Smtp-Source: ACcGV63u/3+NqecsKqbo2XqsCwlLXzTvnL8lUC7oeiKehBIHnj7RWJWbh7/p5GpjbrgN2K1HafMo4A5xaxFtbpaXnjg=
X-Received: by 2002:a2e:900a:: with SMTP id h10-v6mr1775226ljg.121.1537901361707;
 Tue, 25 Sep 2018 11:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180925182601.37421-1-joel@joelfernandes.org>
In-Reply-To: <20180925182601.37421-1-joel@joelfernandes.org>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Tue, 25 Sep 2018 11:49:10 -0700
Message-ID: <CAEXW_YTjjfZhH6rpOArSVub_XhC4mvbKn6Rf0DSiy=rAHQGzPw@mail.gmail.com>
Subject: Re: [0/5] rcu doc updates
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 25, 2018 at 11:26 AM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> Hi Paul,
> These patches are documentation updates for the rcu_dynticks rolling into
> rcu_data and also the updates to the fact that there's a single rcu_state now.
> Its based on your rcu/dev branch.
>
> Next I'm thinking of tackling 'RCU Callback Handling' and further digging into
> the dyntick handling and then dig into other documents outside of
> Data-Structure that need updates. But let me know any suggestions.
> Thanks!

Apologies that my scripts missed the 'PATCH' prefix. Hopefully that's
Ok for this time, but let me know if you'd like me to resend them!
Thanks!

 - Joel
