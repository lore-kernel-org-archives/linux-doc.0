Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EA8C7EE25
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 07:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFIHzi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jun 2023 03:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239717AbjFIHzJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jun 2023 03:55:09 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D28735B0;
        Fri,  9 Jun 2023 00:54:47 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0D55D4A2;
        Fri,  9 Jun 2023 07:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0D55D4A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1686297191; bh=9D0R5T6cmhBfx5S7xPGN5oChCgWg2uNoNNcTmG2sYEc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bj67Wu2MLD5+LqIXRXeq6EGEUGSYhgTEleur7PHs4IQbJ5xePlBArWhb1sW0OQsP/
         QYTIC22gchpn64WRHult7VGG3FUMZxSLH9uC3hO4n9aflBqXwLotvQP1midMYVLB+e
         ry1hICpjAnyw37AMEPbO+VlLSUJcjJI/IELlOtgFxEPKSySJWXNHwOf3FlymUxSmBB
         NE0WLxEZegDBCveMTsTH6nbQ+Mn1ZiHikL4RGRrJ6OQAPA27PuUzu7dYmDECNzlvaW
         Nwl/0LB/J7vdbyHPZy+g/B8hY3XDfRr2xaGgoAKKnwzHTF3GvYwcXpfQgGtJbdUsrc
         6NdSWK/vY+OsA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH v1] docs: handling-regressions: rework section about
 fixing procedures
In-Reply-To: <6971680941a5b7b9cb0c2839c75b5cc4ddb2d162.1684139586.git.linux@leemhuis.info>
References: <6971680941a5b7b9cb0c2839c75b5cc4ddb2d162.1684139586.git.linux@leemhuis.info>
Date:   Fri, 09 Jun 2023 01:53:07 -0600
Message-ID: <87pm65oyvw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thorsten Leemhuis <linux@leemhuis.info> writes:

> This basically rewrites the 'Prioritize work on fixing regressions'
> section of Documentation/process/handling-regressions.rst for various
> reasons. Among them: some things were too demanding, some didn't align
> well with the usual workflows, and some apparently were not clear enough
> -- and of course a few things were missing that would be good to have in
> there.

Applied, thanks.

jon
