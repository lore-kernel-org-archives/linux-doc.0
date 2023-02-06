Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A71CC636D3
	for <linux-doc@archiver.kernel.org>; Mon,  6 Feb 2023 19:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjBFTZv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 14:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjBFTZu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 14:25:50 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DE41B316
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 11:25:49 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6ABA34BF;
        Mon,  6 Feb 2023 19:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6ABA34BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675711549; bh=txR0tdfFzMkJTaQjMwTjznX1NiK/d9O4ekLzTrfW4DE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Shm+1DMtYZLuT748TtwCbdd6K2xn7B0NJm4HbaBM+UlOlEZiFdKtQCZQ/XGB4pmb7
         Gvw1rYnUtehfxWYGdzeBOPKpCVwiMFzxroYk0iaZARsOrRVgbgSoSXNPoCK9ViLn8j
         bORsu7lvQN9qsXvy3WmlJxDmD/XLsT6mN0NzIinh7fJiRbNmnCLot8kbPk9zGpGCKi
         7yJfcdCCrIi4vK+/gE6t58PC8EHSP3bgtE3E5TabaFB3y7OHQYfF2mstM2ECW1z1AQ
         +L/9w5oZTg8+JkU8sisxdWUEQq77TAMTbiLPZ2Z9cB95P7te0soBV0N9uYBTBFUyHP
         gq0ZMXCdElAZQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
In-Reply-To: <c75c8304-88ce-cb7a-3800-fa3ce83a3421@infradead.org>
References: <87bkmas5vc.fsf@meer.lwn.net>
 <c75c8304-88ce-cb7a-3800-fa3ce83a3421@infradead.org>
Date:   Mon, 06 Feb 2023 12:25:48 -0700
Message-ID: <87lelar3yb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Nit: it says that it's for kernel 6.2.0-rc2-6.2.0-rc2+.
> Is that expected?

Um ... no.  That won't be the result of my current changes, but I'll
look into it.

> Another question: if I'm deep into the menu tree, is there a way
> (link) to get back to the top level?  Other than editing the URL, that
> is.

Click on "The Linux Kernel" at the top of the sidebar.

Thanks,

jon
