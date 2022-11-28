Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BB7C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 28 Nov 2022 16:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232317AbiK1QGB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 11:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbiK1QFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 11:05:54 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF271F2E2
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 08:05:54 -0800 (PST)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 18ECD2A0;
        Mon, 28 Nov 2022 16:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18ECD2A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669651554; bh=Cu7+xWUyFiaBv0efzYqDQL+VF1jvW2T/p9iI2nJNmUc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=i7J81QuTZ/CcOH84wGoksEl3i27rQfUCAu0wiqaqe3kvg0AgzetaDcy3AhiU+L5f4
         PIKx+xKofKhH0nQIZHecU8QTUdd9IN+TiM/6NEenl51w3qxt1ZLoNdEOr/tXolp14S
         ZNxwVCT0o1BjuWeJxUzNflealgQh5u+iAPtdO0vlfew/WFulfD7Md3hrwOuStPUoKX
         A+CDDqBq214VAGekUiDpnUdWQBDEM2k20gMLY2qTSBhj7piMgIMkJL4YRKt3nfi3z3
         DWOekbeKGVSKcc9quve4DEUb01M2JcLOCS6ni2DeWDEh8osKH/v0N2VNYa79qDJmsE
         JOGAMmNVzymEg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Maxim Cournoyer <maxim.cournoyer@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] doc: specify an 'html' build sub-directory for
 the htmldocs target
In-Reply-To: <87tu2sou3d.fsf@gmail.com>
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
 <20221116190210.28407-3-maxim.cournoyer@gmail.com>
 <8735ac9evv.fsf@meer.lwn.net> <87tu2sou3d.fsf@gmail.com>
Date:   Mon, 28 Nov 2022 09:05:53 -0700
Message-ID: <874juj6p3y.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:

> Hi Jonathan,
>
> Jonathan Corbet <corbet@lwn.net> writes:
>> I think I'm going to hold off on this one.  As I said before, it would
>> have made sense to do things this way when we made the transition.  At
>> this point, though, I think the potential for trouble outweighs the
>> benefits that would come from moving things around in this way.
>
> OK.  The potential for troubles would lie with the scripts to deploy the
> doc to the web site, I'd guess?  If that's the place we'd expect
> problems, I'm happy to be pointed to it and can try adjusting the
> scripts for the change.

The trouble lies in any number of scripts at any number of sites;
calling this an ABI change would be a stretch, but some of the same
concerns apply.

Getting the docs build on kernel.org updated would not be a huge
problem, I think, but I don't know what else might break.

We can reconsider this, but not before the merge window.

Thanks,

jon
