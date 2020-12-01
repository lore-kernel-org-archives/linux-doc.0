Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F88C83017
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 19:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 121712168B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 19:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404321AbgLAT37 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 14:29:59 -0500
Received: from ms.lwn.net ([45.79.88.28]:33710 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgLAT36 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Dec 2020 14:29:58 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7B2D7750;
        Tue,  1 Dec 2020 19:29:17 +0000 (UTC)
Date:   Tue, 1 Dec 2020 12:29:16 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Szabolcs Nagy <szabolcs.nagy@arm.com>, adobriyan@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: document /proc api for arm64 MTE vm
 flags
Message-ID: <20201201122916.0c4ac9bf@lwn.net>
In-Reply-To: <20201201190406.GC2502@gaia>
References: <20201106101940.5777-1-szabolcs.nagy@arm.com>
        <20201120144408.GE24344@gaia>
        <20201120110003.5bba61d5@lwn.net>
        <20201120222413.GA28722@gaia>
        <20201201190406.GC2502@gaia>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 1 Dec 2020 19:04:06 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> > > > Are you ok with picking up this patch (it can be left for 5.11) or
> > > > should I queue it in the arm64 tree?  
> > > 
> > > It wasn't sent to me, so it wasn't on my radar.  Up to you, I'm happy to
> > > grab it if you'd prefer.  
> > 
> > Please do grab it. Thanks.  
> 
> In case it slipped through the cracks (I haven't seen it in -next).
> Otherwise I'll queue it sometime later this week for 5.11.

Um ... yes ... I was just going to apply it right now, honest ...

Applied, thanks for the reminder.

jon
