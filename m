Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75B4A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sat, 25 May 2019 18:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfEYSSW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 25 May 2019 14:18:22 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35956 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfEYSSV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 25 May 2019 14:18:21 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so6817139pgb.3
        for <linux-doc@vger.kernel.org>; Sat, 25 May 2019 11:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pwUwT3IH5HpGo/L8sP6//cCZtClp5/ip6vUnZdkkz+4=;
        b=kkcebdlaAxI4tg4ycJmEqrzHnyewgh+jjzD8JuWykQMD1lxIZbs14DxRaS3JzJWrkx
         D3zUk40qEzDf9b4/+3m3e4ZQvAeZltgNBFxxlJjzMPDywJcvPdcoFqhPgZYDwqU6gPKo
         ZKBP/5ISTo1G00dTfWL1Nmxp2HkYKifVw8IVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pwUwT3IH5HpGo/L8sP6//cCZtClp5/ip6vUnZdkkz+4=;
        b=qYj0Pf/LUkv6BPchU3U4w1DU0WeWqQVOxKC1KVEBUATPdvyIoivKQaa+E2MadQJZvw
         7lj2IAZe20WO34UinU8QQsUx6Qegkh4BNSVseVD3WfxFqG4d0n66gCpplxcsojFHCF7D
         4oDg4ZZRa7abhjr/W2ek2i+kWkoo/ktralXXVepxp34FCRGtB1GSUmWCjiqPAJ2IbCAL
         l2I682gP+XILjb/RKC4TJWkDsazrmeaHh7OrDpdLT5F5AnrLSjum8+e+Ldl2MH6RGHdm
         9oMA7xeP2KSgejIWPaI4NqnmmisXMmu9gW6dsnPnd0ht06S+xaEkHm1LLQqrZY220rxH
         PmFQ==
X-Gm-Message-State: APjAAAUYLGIRvk3A74JJgeslB6rd4USYGjTsCl0qxHP/Vxg04fbVJhmA
        /6ZK9Sc0ZVK2ByIkcyXGyCA6Sw==
X-Google-Smtp-Source: APXvYqx/tYCXEdllU2F4/1JetbgrhH8TFsHxXRye9Amlmvbkp4RD4ve2+88VYqD+upEJsBYYCIqDXw==
X-Received: by 2002:aa7:8554:: with SMTP id y20mr121952964pfn.258.1558808300867;
        Sat, 25 May 2019 11:18:20 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id s24sm6537148pfe.57.2019.05.25.11.18.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 May 2019 11:18:20 -0700 (PDT)
Date:   Sat, 25 May 2019 14:18:18 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kvm-ppc@vger.kernel.org,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>, rcu@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] Remove some notrace RCU APIs
Message-ID: <20190525181818.GA225569@google.com>
References: <20190524234933.5133-1-joel@joelfernandes.org>
 <20190524232458.4bcf4eb4@gandalf.local.home>
 <20190525081444.GC197789@google.com>
 <20190525070826.16f76ee7@gandalf.local.home>
 <20190525141954.GA176647@google.com>
 <20190525155035.GE28207@linux.ibm.com>
 <20190525181407.GA220326@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525181407.GA220326@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 25, 2019 at 02:14:07PM -0400, Joel Fernandes wrote:
[snip]
> > That aside, if we are going to change the name of an API that is
> > used 160 places throughout the tree, we would need to have a pretty
> > good justification.  Without such a justification, it will just look
> > like pointless churn to the various developers and maintainers on the
> > receiving end of the patches.
> 
> Actually, the API name change is not something I want to do, it is Steven
> suggestion. My suggestion is let us just delete _raw_notrace and just use the
> _raw API for tracing, since _raw doesn't do any tracing anyway. Steve pointed
> that _raw_notrace does sparse checking unlike _raw, but I think that isn't an
> issue since _raw doesn't do such checking at the moment anyway.. (if possible
> check my cover letter again for details/motivation of this series).

Come to think of it, if we/I succeed in adding lockdep checking in _raw, then
we can just keep the current APIs and not delete anything. And we can have
_raw_notrace skip the lockdep checks. The sparse check question would still
be an open one though, since _raw doesn't do sparse checks at the moment
unlike _raw_notrace as Steve pointed.

Thanks,

 - Joel

