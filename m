Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A27C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 16:41:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECE4561154
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 16:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352771AbhDNQmG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 12:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhDNQmD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Apr 2021 12:42:03 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A8DC06138D
        for <linux-doc@vger.kernel.org>; Wed, 14 Apr 2021 09:41:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 977A22C8;
        Wed, 14 Apr 2021 16:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 977A22C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618418501; bh=WbNGsCo018sS1S6mY1oAF/E6ngpJa1MxbZdYKxGk3yU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JBsaWCjIf56q+RVm1nwr8nO5wRtwuBQWupI1vwzKIPr/TKTqkGfHeb7lL2cXVSdnY
         IOgUh92iPZl7b7pUZvbXUKQ4jkajnZwZP2nO+AED4xPPWm8IQCvuod9ek+3vAea3JW
         dC7l7hD0FlvxaXXQsDz8kbHHMT9ifOFgVCujXJ85YQ1wHX/5voFXFJDqCqxk2zXsC5
         puRw0JKR0cTwy+tEbG28jjFwfywyjUCmBuB/FMaBfCsENF2JYcwoJAvWm9NjkzxNiy
         Muy1deYk2FWsrfCt6kbhtZzJEz6ypx6TPP2h7FiItqqeI+SOq6U5LBHBdxRkehif3t
         AStLRy2dP79vg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/kernel-doc.rst
In-Reply-To: <20210414023814.GA23966@bobwxc.top>
References: <cover.1618295149.git.bobwxc@email.cn>
 <783d134b1dd18f580f2c0511c2330382a86e79b5.1618295149.git.bobwxc@email.cn>
 <87lf9lrgp3.fsf@meer.lwn.net> <20210414023814.GA23966@bobwxc.top>
Date:   Wed, 14 Apr 2021 10:41:41 -0600
Message-ID: <87v98oq0my.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Wu X.C." <bobwxc@email.cn> writes:

>> Note that this reference adds a warning to the docs-next build - this
>> translation is evidently against linux-next instead.  The warning will
>> eventually go away, but it would be better not to do this if possible.
>
> Yeah, seems rust doc do not merge into docs-next yet. It's quite new.

That won't happen until after the merge window, once the Rust changes
hit the mainline.

> BTW, I'd like to ask does "git.lwn.net" has a web access like git-web or
> cgit... ?

No, I've never really felt enough of a need to set that up to actually
get around to it...

Thanks,

jon
