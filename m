Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6CBC2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70CB62073C
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730961AbgKXJSz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 04:18:55 -0500
Received: from verein.lst.de ([213.95.11.211]:53538 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729476AbgKXJSy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Nov 2020 04:18:54 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1F1F967373; Tue, 24 Nov 2020 10:18:53 +0100 (CET)
Date:   Tue, 24 Nov 2020 10:18:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 1/3] LICENSES: Add the CC-BY-4.0 license
Message-ID: <20201124091852.GB11695@lst.de>
References: <cover.1606137108.git.linux@leemhuis.info> <c07e51e153f453c83c77a75513ad3d5ec70ef1be.1606137108.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c07e51e153f453c83c77a75513ad3d5ec70ef1be.1606137108.git.linux@leemhuis.info>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 24, 2020 at 09:00:01AM +0100, Thorsten Leemhuis wrote:
> For context: Patch 2 of this series adds a text to the Documentation/ directory
> which (for now) uses "GPL-2.0+ OR CC-BY-4.0", as I want to make it easy and
> attractive for others to base their work on it. I'm not strongly attached to
> CC-BY-4.0, but it seemed like the best choice: it's designed for such usage and
> afaics better than using MIT for text files.

And you've not Cced me on that patch 2 or patch 3, which makes Ccing
me on this pretty useless as I can't judge the context.
