Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45502C56202
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E84702076B
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731110AbgKXJhC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 04:37:02 -0500
Received: from verein.lst.de ([213.95.11.211]:53607 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731438AbgKXJhB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Nov 2020 04:37:01 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id DB23F67373; Tue, 24 Nov 2020 10:36:58 +0100 (CET)
Date:   Tue, 24 Nov 2020 10:36:58 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 1/3] LICENSES: Add the CC-BY-4.0 license
Message-ID: <20201124093658.GA13174@lst.de>
References: <cover.1606137108.git.linux@leemhuis.info> <c07e51e153f453c83c77a75513ad3d5ec70ef1be.1606137108.git.linux@leemhuis.info> <20201124091852.GB11695@lst.de> <04eae024-811d-d11e-b8bd-52f0dd0e225f@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04eae024-811d-d11e-b8bd-52f0dd0e225f@leemhuis.info>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 24, 2020 at 10:31:33AM +0100, Thorsten Leemhuis wrote:
> Am 24.11.20 um 10:18 schrieb Christoph Hellwig:
>> On Tue, Nov 24, 2020 at 09:00:01AM +0100, Thorsten Leemhuis wrote:
>>> For context: Patch 2 of this series adds a text to the Documentation/ directory
>>> which (for now) uses "GPL-2.0+ OR CC-BY-4.0", as I want to make it easy and
>>> attractive for others to base their work on it. I'm not strongly attached to
>>> CC-BY-4.0, but it seemed like the best choice: it's designed for such usage and
>>> afaics better than using MIT for text files.
>>
>> And you've not Cced me on that patch 2 or patch 3, which makes Ccing
>> me on this pretty useless as I can't judge the context.
>
> Argh, sorry, slipped through. You can find it here:
>
> https://lore.kernel.org/linux-doc/2f314e58cb14c1579f843f8c72bdb4bbb83ac20a.1606137108.git.linux@leemhuis.info/
>
> FWIW, here it is for easy access (just sent with thunderbird instead of
> git send-mail, hopefully should be enough for this):

So what is so special with this documentation that it needs a
(for the kernel tree) unusual license?  How to we make sure people
don't accidentally end up including things they can't?
