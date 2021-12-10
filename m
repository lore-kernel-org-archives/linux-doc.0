Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE79C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 21:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbhLJVbs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 16:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhLJVbs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 16:31:48 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E7DC061746
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 13:28:12 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A68572CC;
        Fri, 10 Dec 2021 21:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A68572CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639171692; bh=D3rxAvM2lpCM9x6AXzPElDM8I+xzJC1BFwPU22pfeVg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dDlaOisdmbQcnSyGL6540KVKClm6/XbDnq3+NINT73PqAgD9SwD5m0kWRce66QDgC
         zl0cmyQ57+MrZx52qgGuBdsgPvBOkWJfnR4JKRRdYGJ7TCPIfsvZfTCapH7lKO+LPg
         po/dJhRtMLsEIotuBKY0E9QIdPUi+xUzF9x+g0mrmrQhwXohd470hB++4xLbzRuhjQ
         shcTQvqZVyaNXAYU6bahJORmx2GZO7fEeYyDDIBsF9RIA6fyeh9TY9b9zFQZ0+ZrLv
         qgQo1LS2BTao7vqC74tjeDMopDRzftBVdwmhmwAc213Sx3CACVVCftTWs3B38YdC7f
         8dhbbR+SiEa+g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        linux-doc@vger.kernel.org
Cc:     linux-snps-arc@lists.infradead.org,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] docs: ARC: Improve readability
In-Reply-To: <20211202215747.19923-1-abrodkin@synopsys.com>
References: <20211202215747.19923-1-abrodkin@synopsys.com>
Date:   Fri, 10 Dec 2021 14:28:12 -0700
Message-ID: <87ee6kqheb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

> There were some things which made rendered document
> look not very elegant. That was because:
>
> 1. Numbered lists were formatted in more of Markdown way
>    rather than true reStructuredText and so were displayed
>    as a plain text with leading numbers.
>
>    Well, moreover numbered lists were not needed as in all cases
>    we were just listing a couple of options w/o any intention to
>    follow any particular order, so a simpler unordered list fits
>    better and looks cleaner.
>
> 2. URL's of external resources were added as they are
>    (which is OK in a plain text, but make not much sense in
>    a HTML where we may use more human-friendly link names
>    with URL's hidden.
>
> 3. Some URL's had trailing slashes which were not really needed
>
> Fix all items from above!
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vineet Gupta <vgupta@kernel.org>
> ---
>  Documentation/arc/arc.rst | 62 +++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 29 deletions(-)

Applied, thanks.

jon
