Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABABC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 17:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 928C9610D0
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 17:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhDHRUZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 13:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbhDHRUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 13:20:23 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96DCC061760
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 10:20:09 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 983DD52B9;
        Thu,  8 Apr 2021 17:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 983DD52B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617902409; bh=0q3LAtYVLyUB8ByqrHCsd9CHBxCSbdHvTj6zejD8rfs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KXiQM0yEYFMaW4hUy9EZ1NsTAfiofSCXZXPNA8n3xxGf4qjXE56CUwrKJMsHxs38B
         wEy5GH0QWIpGrz2ftZACk9xXILgJ/2KPcu6AyLwZS5TEzIIe7fwnYu+hFP0M44To2Z
         wwf+OF4Ox7DqmYBTv+KJSK7Tcara2VaJVWaEJU/I+LPCkpWBXwaEaIwiEs9GNJe5Dn
         q6J6VBhYwy+nd5oizwKJl+oA+qUYzEwOQf1q7BEA51ibitl8/9uawh0aM1U9lvsv02
         YMk2buf0Y9o8ISr3Y72rqDGmhPVvawirDYrBSBS+BHmmVfloDCkRdy67pg/CG9RyAz
         sRumgunSFW4qg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/gcov: Convert two tags to ref in dev-tools/gov.rst
In-Reply-To: <75131ef2-2c6f-3fc4-8a79-bab0d0f7b633@linux.ibm.com>
References: <20210403113752.GA32236@mipc>
 <75131ef2-2c6f-3fc4-8a79-bab0d0f7b633@linux.ibm.com>
Date:   Thu, 08 Apr 2021 11:20:08 -0600
Message-ID: <87r1jkzoaf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Peter Oberparleiter <oberpar@linux.ibm.com> writes:

> On 03.04.2021 13:37, Wu XiangCheng wrote:
>> Htmldocs does not display the chapter number, convert the two manual
>> chapter number tags to ref tags.
>> 
>> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
>
> Looks sane to me.
>
> Acked-by: Peter Oberparleiter <oberpar@linux.ibm.com>
>
> Unfortunately I don't know how documentation updates such as this one
> are typically handled...

I've applied it.

Thanks,

jon
