Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28829C54FC9
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 19:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14E93206D5
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 19:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgDUTid (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 15:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDUTid (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Apr 2020 15:38:33 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523ECC0610D5
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 12:38:33 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 086509B2;
        Tue, 21 Apr 2020 19:38:32 +0000 (UTC)
Date:   Tue, 21 Apr 2020 13:38:31 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adrian Freund <adrian@freund.io>
Cc:     linux-doc@vger.kernel.org, peterz@infradead.org
Subject: Re: [PATCH] Documentation: scheduler: fix outdated information on
 sched groups
Message-ID: <20200421133831.4506c64c@lwn.net>
In-Reply-To: <20200407130525.76663-1-adrian@freund.io>
References: <20200407130525.76663-1-adrian@freund.io>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  7 Apr 2020 15:05:25 +0200
Adrian Freund <adrian@freund.io> wrote:

> The documentation claims that two sched groups must not overlap. This is
> no longer true, as overlapping sched groups are used on NUMA systems.
> This change has been introduced by commit e3589f6c81e47 and was
> documented by an in-code comment in commit 35a566e6e8a18.
> 
> Signed-off-by: Adrian Freund <adrian@freund.io>

In the absence of complaints from Peter, I've gone ahead and applied this.

Thanks,

jon
