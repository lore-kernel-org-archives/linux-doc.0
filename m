Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750C7EB64DA
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 13:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbjGNN3O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbjGNN3O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 09:29:14 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BB02691;
        Fri, 14 Jul 2023 06:29:12 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 563BD2DC;
        Fri, 14 Jul 2023 13:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 563BD2DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689341351; bh=H9tz5ldsMO8c9+uUJZhkOeHUmpPUNR2Ib1G3wp49Bhc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Am+uUs2BwqV9EprXa3PcWPC88FAiB/JW4muHNqUgE1Bb2D1ucDfL3OUhaitAOxBV9
         5ub7+WpXxnZj+b48CHRMgCArIuz7MDzjyxV5vr2Ts/MsKQZqo5puhALartHPwMC7y6
         3a2e/xSi9HFmOGylEJhy8MnJGsSdILHyYbjElZfoOMOl5ip1BSvgozGQTkdzvLiONq
         gOYz8kbDW3efmAB3qMCnK81IWXYbGPq8CAqRukJwl9tZwmizIMVSFisi3VO0WilPBH
         hOPjhXuG0KSwxsNJ91RQbgXiKtRr2gIDDFiZS21pmoOpnU3rk6lKFkq6XbaA9VqVLr
         RTdoyIVbHO/rg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, arkadiusz.kubalewski@intel.com,
        netdev@vger.kernel.org
Subject: Re: [PATCH docs] scripts: kernel-doc: support private / public
 marking for enums
In-Reply-To: <d5727371-e580-a956-7846-b529f17048ca@infradead.org>
References: <20230621223525.2722703-1-kuba@kernel.org>
 <399c98c8-fbf5-8b90-d343-e25697b2e6fa@infradead.org>
 <d5727371-e580-a956-7846-b529f17048ca@infradead.org>
Date:   Fri, 14 Jul 2023 07:29:10 -0600
Message-ID: <875y6m39ll.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi Jon,
>
> On 6/21/23 20:10, Randy Dunlap wrote:
>> 
>> 
>> On 6/21/23 15:35, Jakub Kicinski wrote:
>>> Enums benefit from private markings, too. For netlink attribute
>>> name enums always end with a pair of __$n_MAX and $n_MAX members.
>>> Documenting them feels a bit tedious.
>>>
>>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> 
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>> 
>> Thanks.
>
> I have a need for this patch. Are you planning to merge it?

It's commit e27cb89a22ad in 6.5-rc1 ...

Thanks,

jon
