Return-Path: <SRS0=Ruk+=AP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD48C433E0
	for <linux-doc@archiver.kernel.org>; Sat,  4 Jul 2020 16:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A654E20724
	for <linux-doc@archiver.kernel.org>; Sat,  4 Jul 2020 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593881190;
	bh=WOTPUhgigaVxsG01t0xC1CIrIq8QUKPHxFKAdPjlaec=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:List-ID:
	 From;
	b=uwn4F5UtbG+a1IF0bFyymedHx/hZrrloYq/zJ8EvVFVAj5PRhCzNZNqTJ85gUjKrV
	 l2TEo9SOOJoUK+58BUOAHYw54WBDkJ0H7JCtf9JUsBw/hMELVrXicLNLsPbj7S2MOg
	 bAlrQ6IM2WwTMX5dtbpliTlSzGNp5W4Y4Atmib58=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgGDQqa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Jul 2020 12:46:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:60206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgGDQq3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 4 Jul 2020 12:46:29 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-111-31.bvtn.or.frontiernet.net [50.39.111.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68AB020723;
        Sat,  4 Jul 2020 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593881189;
        bh=WOTPUhgigaVxsG01t0xC1CIrIq8QUKPHxFKAdPjlaec=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KoYzj6LkQmKlryRGsKpQ2ukmB4zI9EhP10bTKju0tFXsjcXWwDJ2y/z0j8m13ns+V
         zKsToqvberHfU2dC1x1UFfR0epYYO9t1hCj29ece8Jn1e+PUJ3WYCY5/UhmL3le4D9
         BAY/unae81DMq1f94KoFWD+IizkmpsVrdFwH4+m4=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 4F66F352265B; Sat,  4 Jul 2020 09:46:29 -0700 (PDT)
Date:   Sat, 4 Jul 2020 09:46:29 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation: RCU: eliminate duplicated words
Message-ID: <20200704164629.GP9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200703213342.30842-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703213342.30842-1-rdunlap@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 03, 2020 at 02:33:40PM -0700, Randy Dunlap wrote:
> Drop all doubled words from RCU documentation.
> 
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Lai Jiangshan <jiangshanlai@gmail.com>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: rcu@vger.kernel.org

Good good catch catch!  Queued queued and and pushed pushed,
thank thank you you very very much much! ;-) ;-)

							Thanx, Paul

>  Documentation/RCU/Design/Data-Structures/Data-Structures.rst |    2 +-
>  Documentation/RCU/Design/Requirements/Requirements.rst       |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
