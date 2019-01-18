Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 414E47D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 Jan 2019 12:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbfARMeP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 Jan 2019 07:34:15 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41135 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfARMeP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jan 2019 07:34:15 -0500
Received: by mail-wr1-f65.google.com with SMTP id x10so14824305wrs.8
        for <linux-doc@vger.kernel.org>; Fri, 18 Jan 2019 04:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HeZNwP9EcZ9AAVB8WD/3SS0wP0RYFQh5uPHojKsFw98=;
        b=GwFLfQfVmDIhj5JT8lIyFznhGohS2cN16lzP++ViJfsLJ0zatTIql8WYoTBu+Vf6GJ
         lCDD0UvCZA7XJMJBIlx/Qph1vfna5rIpNY+MSrwafJOsveIsUTCiW/tsiPnh+jrYiAQa
         aQODVaML/EpsI91u7inPBSHnBTqkOqq3ex1vqrcox9N6QORJu13uSWs9yudzdiqCgtQN
         9VX02Cio4XlYIn9j/YzGEtsga4q3LPboHOC7O4yFICqICdv3hoO8tf+eZgx4XxNHRDyj
         IRwSYCddJiy2k3hrivnA/tDwn5KC1TgMXjQ5N6kfD9EFGYqFvnwPClEiyQZhqcbfjTXH
         iRAw==
X-Gm-Message-State: AJcUukf1Gg9O43wCNx/a78LqffUirznnrbpMEvDpm3p4ct1zqjQvvttn
        CFheFee2OBLAKTNSegp4yaEyUw==
X-Google-Smtp-Source: ALg8bN486whx+wp2qH2IHDAWlpvY7s8udW2vHDvSbGwqXExR7dRQFCUPskcHLJoxHGNTHfUEH733jQ==
X-Received: by 2002:adf:f691:: with SMTP id v17mr15766940wrp.114.1547814852799;
        Fri, 18 Jan 2019 04:34:12 -0800 (PST)
Received: from localhost.localdomain ([151.15.254.62])
        by smtp.gmail.com with ESMTPSA id q14sm69149697wrw.39.2019.01.18.04.34.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jan 2019 04:34:12 -0800 (PST)
Date:   Fri, 18 Jan 2019 13:34:09 +0100
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Quentin Perret <quentin.perret@arm.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Ingo Molnar <mingo@redhat.com>,
        Morten Rasmussen <morten.rasmussen@arm.com>,
        qais.yousef@arm.com, Patrick Bellasi <patrick.bellasi@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] sched: Document Energy Aware Scheduling
Message-ID: <20190118123409.GI14385@localhost.localdomain>
References: <20190110110546.8101-1-quentin.perret@arm.com>
 <20190110110546.8101-3-quentin.perret@arm.com>
 <20190117155117.GG14385@localhost.localdomain>
 <20190118091652.xn6iw52tccwh6vap@queper01-lin>
 <CAJZ5v0jw0BgmkwrtjuiC7YKO6A+k2eFfFDGtGsSWymW8PSTscA@mail.gmail.com>
 <20190118103359.jqctbopx25h3zvqs@queper01-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118103359.jqctbopx25h3zvqs@queper01-lin>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 18/01/19 10:34, Quentin Perret wrote:
> Hi Rafael,
> 
> On Friday 18 Jan 2019 at 10:57:08 (+0100), Rafael J. Wysocki wrote:
> > On Fri, Jan 18, 2019 at 10:16 AM Quentin Perret <quentin.perret@arm.com> wrote:
> > >
> > > Hi Juri,
> > >
> > > On Thursday 17 Jan 2019 at 16:51:17 (+0100), Juri Lelli wrote:
> > > > On 10/01/19 11:05, Quentin Perret wrote:
> > > [...]
> > > > > +The idea behind introducing an EM is to allow the scheduler to evaluate the
> > > > > +implications of its decisions rather than blindly applying energy-saving
> > > > > +techniques that may have positive effects only on some platforms. At the same
> > > > > +time, the EM must be as simple as possible to minimize the scheduler latency
> > > > > +impact.
> > > > > +
> > > > > +In short, EAS changes the way CFS tasks are assigned to CPUs. When it is time
> > > >
> > > > Not sure if we want to remark the fact that EAS is looking at CFS tasks
> > > > only ATM.
> > >
> > > Oh, what's wrong about mentioning it ? I mean, it is a fact ATM ...
> > 
> > But it won't hurt to mention that it may cover other scheduling
> > classes in the future.  IOW, the scope limit is not fundamental.
> 
> Agreed, I can do that.

Oh, sorry, bad phrasing from my side. I meant that we should probably
state clearly somewhere that EAS deals with CFS only ATM, but extending
it to other classes (DEADLINE in particular) makes certainly sense and
people are welcome to experiment with that.

So, yeah, I agree with both of you. :-)
