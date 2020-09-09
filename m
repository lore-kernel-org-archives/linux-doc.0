Return-Path: <SRS0=2XaJ=CS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C9AC43461
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 19:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D96C021D7A
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 19:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgIITk1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Sep 2020 15:40:27 -0400
Received: from ms.lwn.net ([45.79.88.28]:59102 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbgIITk1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 Sep 2020 15:40:27 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9A59237C;
        Wed,  9 Sep 2020 19:40:26 +0000 (UTC)
Date:   Wed, 9 Sep 2020 13:40:21 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc:     linux-um@lists.infradead.org, linux-doc@vger.kernel.org,
        richard@nod.at
Subject: Re: [PATCH] docs: add a new User Mode Linux HowTo
Message-ID: <20200909134021.290ea546@lwn.net>
In-Reply-To: <14181df1-60a4-530e-e7f2-df4e1a2972a1@cambridgegreys.com>
References: <20200904141115.15708-1-anton.ivanov@cambridgegreys.com>
        <20200909115203.7c898211@lwn.net>
        <14181df1-60a4-530e-e7f2-df4e1a2972a1@cambridgegreys.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 Sep 2020 20:37:35 +0100
Anton Ivanov <anton.ivanov@cambridgegreys.com> wrote:

> >> +Create a sparse raw disk image:
> >> +
> >> +.. code-block:: shell
> >> +
> >> +    dd if=/dev/zero of=disk_image_name bs=1 count=1 seek=16G  
> > 
> > I'd honestly do without all these code-block directives as well; they
> > clutter things considerably for little advantage.  
> 
> I can merge most of these into a couple of code snippets. I would like 
> to leave the content though. As UML does not have an official installer, 
> the only way to install it is to build images and there is not that much 
> information on this on the net. The only well written piece on the 
> subject is > 10 years old and becoming a bit out of date.

Don't misunderstand me - the code is fine and welcome.  It's the 
".. code-block::" directives that I'm taking issue with.  I'd rather see
ordinary literal blocks instead.

Thanks,

jon
