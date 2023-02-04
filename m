Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E61C05027
	for <linux-doc@archiver.kernel.org>; Sat,  4 Feb 2023 00:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjBDACU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Feb 2023 19:02:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbjBDACU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Feb 2023 19:02:20 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04C15528E
        for <linux-doc@vger.kernel.org>; Fri,  3 Feb 2023 16:02:18 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8A815221;
        Sat,  4 Feb 2023 00:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8A815221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675468938; bh=juBWq/e4RRcX/9AZYBywiGvx0rmF+C8B8ZGXxzWbrAg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oZMcdWzcXmv2LEASsAZcK966gp56vQF8hLFhKazJAShq6SQxl3C7DdLuRbWaBLTt0
         ttNLAd7cAFLhk4Y43eoE9Ow8gMeZGV0dP4OvMgqeGGeYtNddqR2KWqrBIeIXcCOBEL
         ct75P0SYAKNYSkaDvjx5YzkJ3KKd3VMGlZ6mlwDcqGQDUbBDIVuis5id6Md9ZVxAj7
         lAVOjeEq9VU9D6dPblyeXziGfkB6pB45hZUfqMvAv3P04A5TJ1GlWYAq53W4rrDcPb
         a8IDmBGu5uGxyFpXRdL5v++EY4z0OUixCR2fLp852s/0l0jc18QwmjZiZdLX9p6UIa
         Ko+wjeEhl4F9A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
In-Reply-To: <87bkmas5vc.fsf@meer.lwn.net>
References: <87bkmas5vc.fsf@meer.lwn.net>
Date:   Fri, 03 Feb 2023 17:02:17 -0700
Message-ID: <877cwys3g6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> writes:

> As before, the results can be seen at:
>
>   https://static.lwn.net/kerneldoc/

What's there now reflects a couple of tweaks beyond the patch I sent.

Hopefully I've addressed some of the concerns...  One thing I really
don't like about the auto-positioning sidebar, though, is that it pushes
the "The Linux Kernel" heading off-screen.  For somebody following a
link into the docs from elsewhere, that could be a bit confusing.  I
know vaguely how to fix it with CSS, but getting such things right
always require a fair amount of dinking around and I can't do that now.

jon
