Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2924FC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00C0A61176
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346593AbhDMVOc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 17:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244727AbhDMVOb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 17:14:31 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F65C061574;
        Tue, 13 Apr 2021 14:14:09 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6DD16823;
        Tue, 13 Apr 2021 21:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6DD16823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618348449; bh=cbxgiJrQ2b9oc9syb6B2f9t54ujBxqIOHgmmIdOQGpU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EKKnyyb3PdmTd6ciKe9LSK0lS/yblimxX3fktD/IQNgNiDokKn7LZL6G0IhX4P7CD
         1Z9jo4OSWA7SOvyGEn+VK8SzOBwAd4+SMpwVKPMRzkKqKEURwsIhQ/91/tgEVjQngd
         pDOzQyXUCUpFbNl7+eXVr7y8tIUlBf3Ozz2VsSYf/94+FXDcSCMkqKt+Z9xs+yxoEl
         WQMOcYle7xgYo4y1KXaTTA5X2XwAzXNU+GWM3TtfB97ihuGZwlvl7KxMbNjiCM0Enw
         llSNlgNDkujf9cFMH+6XWnnuT2vG/KPWyaKaalSz0VtT36CZSvbKJHZ9sTKitxgs1u
         pCToviJY+GCug==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Mention regression mailing list in
 reporting-bugs and MAINTAINERS
In-Reply-To: <cover.1617967127.git.linux@leemhuis.info>
References: <cover.1617967127.git.linux@leemhuis.info>
Date:   Tue, 13 Apr 2021 15:14:08 -0600
Message-ID: <874kg9sx9b.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Hi! A mailing list for regressions was finally created as
> regressions@lists.linux.dev (we dropped the linux- prefix as the term is already
> in the domain name). Hence, add it to MAINTAINERS, as that where people will
> look it up. I was a bit unsure how to actually do that, see the note in the
> first patch of the series for details.
>
> The second patch makes reporting-issues.rst mention the new list, so people CC
> it.
>
> @Jonathan: this hopefully is the last round of patches for reporting-issues.rst
> for this cycle. Please let me known if you think the addition to the MAINTAINERS
> file should better go through a different maintainer.

Naw...we all stick our fingers into MAINTAINERS at will...:)  I've
applied both, thanks.

jon
