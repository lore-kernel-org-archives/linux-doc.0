Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FD8E94104
	for <linux-doc@archiver.kernel.org>; Fri,  6 Oct 2023 19:45:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbjJFTpA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 15:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjJFTo7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 15:44:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EE383
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 12:44:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276A5C433C8;
        Fri,  6 Oct 2023 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696621498;
        bh=39zT5U5C6ML4UJu86kiMMCT+A/btFJCDbmSNpW+/ufA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EaDT7pOKoSDEC6eeiApq95BQB7uUBMrmtS9NN52siiSD5klu95fOIt5hHdqvzB8xN
         ACA7ABu4I75Z6XvWeuF3BWGPHl7fC+BP8/KmB/QbHW/Cq+y12Nfr9MoYFa7tCvISRF
         Vn6pcu/CAg6SO6ugkKdCEUhQHciLolzna9HI5K5C/CDNQPWv85iFDXK9sin4rSAbMe
         inCa1/UwHBNCAvvZV+WDnj7St1yTNqY/7vBLETN7p3axqv3QXJ42rU/OF2DwI0NPuN
         3jAH8YxZ07ux9L8IXYWMR5rxVritya4oEgIhQeRkbRTTtGDeP2l/HeWfgyRT/gug4E
         +AUAHiJm4LReg==
Date:   Fri, 6 Oct 2023 12:44:57 -0700
From:   Kuba Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
        davem@davemloft.net, pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, linux-doc@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v3 2/5] dpll: spec: add support for pin-dpll
 signal phase offset/adjust
Message-ID: <20231006124457.26417f37@kernel.org>
In-Reply-To: <ZSA7cEEc5nKl07/z@nanopsycho>
References: <20231006114101.1608796-1-arkadiusz.kubalewski@intel.com>
        <20231006114101.1608796-3-arkadiusz.kubalewski@intel.com>
        <ZR/9yCVakCrDbBww@nanopsycho>
        <20231006075536.3b21582e@kernel.org>
        <ZSA7cEEc5nKl07/z@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 6 Oct 2023 18:53:04 +0200 Jiri Pirko wrote:
> Fri, Oct 06, 2023 at 04:55:36PM CEST, kuba@kernel.org wrote:
> >> I'm confused. Didn't you say you'll remove this? If not, my question
> >> from v1 still stands.  
> >
> >Perhaps we should dis-allow setting version in non-genetlink-legacy
> >specs? I thought it may be a useful thing to someone, at some point,
> >but so far the scoreboard is: legit uses: 0, confused uses: 1 :S
> >
> >Thoughts?  
> 
> I don't know what the meaning of version is. I just never saw that being
> touched. Is there any semantics documented for it?
> 
> Kuba, any opinion?

/me switches the first name in From :P

I think it basically predates the op / policy introspection,
and allows people to break backward compat.

drop_monitor bumped to 2 in 2009:

  683703a26e46 ("drop_monitor: Update netlink protocol to include
netlink attribute header in alert message")

which breaks backward compat.

genetlink ctrl went to 2 in 2006:

  334c29a64507 ("[GENETLINK]: Move command capabilities to flags.")

which moves some info around in attrs, also breaks backward compat
if someone depended on the old placement.

ovs did it in 2013:

  44da5ae5fbea ("openvswitch: Drop user features if old user space
attempted to create datapath")

again, breaks backwards compat.


I guess it may still make one day to bump the version for some proto
which has very tight control over the user space. But it hasn't
happened for 10 years.
