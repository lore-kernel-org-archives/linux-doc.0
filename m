Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C94EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 19:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236564AbjGNTr2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236023AbjGNTr2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 15:47:28 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C6830C4;
        Fri, 14 Jul 2023 12:47:27 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 137EC5BF;
        Fri, 14 Jul 2023 19:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 137EC5BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689364047; bh=fcxKLrTPkPPkHHCEgZFToadOZ/X7kwZd0OaqJLbDcS4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=R9T8pEwunRRqvjH45vfoAQfbQf399f346HtJfL7TTC7RGJNfhtJtZBpy9zDARVo1U
         gvoQh8IwiR7vmQ2SzzhBehzda2Mt9PDrpri2YWw98kRQdT5QCjdDWHmp5yg6weMj4w
         mi5hJ5Mrez5WbrS9DdToVmnondinLstzlH7HpYH4vQkkwGx8YR6RtxQ04dUrsfMhkJ
         C6EhxnsZdE8LM0jqxI0VcwyFb3yRDncJm3jdMs1+OTFHNXyBnGZ/uzGXR92+17eVOw
         eUnb92gO4/NI47hRTRGhutRY43H2Nj1irvmPzSLpYtbMfTHw6yqXFhYieR/dBlRK55
         +BnlE1exQk9wQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] docs: time: make separate section for time and timers
In-Reply-To: <20230704052405.5089-1-rdunlap@infradead.org>
References: <20230704052405.5089-1-rdunlap@infradead.org>
Date:   Fri, 14 Jul 2023 13:47:26 -0600
Message-ID: <87mszyxokx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Give time & timer APIs their own section and begin adding
> entries to that section. Move hrtimers immediately after
> this new section so that they are all together.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/driver-api/basics.rst |   27 +++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)

Series applied, thanks.

jon
