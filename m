Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F8EC4321E
	for <linux-doc@archiver.kernel.org>; Mon, 28 Nov 2022 20:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbiK1U3p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 15:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbiK1U3o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 15:29:44 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C652CE3A
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 12:29:43 -0800 (PST)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5D83E379;
        Mon, 28 Nov 2022 20:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5D83E379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669667383; bh=0A6zJEJ0dUnIOp7mNAYz9LjVV+gTCYKtC0FKTPtFkP4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=td4xQRGcuoNU8veju+zF6LHw2ex+iZeLFOOTGk4hxhhAtYwDbMdbtNXCjND88gLnt
         h/7m/18k7LV8AkxAeNqfk7/ZkNzJPf8uJYpl8NA1aPp9fhWQXQy/J5pUbOnObRPrk0
         MEbeRpj6NLs0NGsKiP7TZ9PCnBPTwMpTz5FTDNEbduHkHMJNwyTA4bac5euwP495w/
         suYCMsjhhQT9YB2s9I89hx5Gm0HaiWXZZjgg4X4YZ+OxlrShntaOKv33kjl4yGejaY
         RuYgiCkDUoEIEgIw7kF7SY0IXSWJuypCIMsMnQM6qKtI5IbR+GttdD8vfuexBEwGkJ
         8/LQTHUROy3Kg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Maxim Cournoyer <maxim.cournoyer@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] doc: specify an 'html' build sub-directory for
 the htmldocs target
In-Reply-To: <87wn7esvrr.fsf@gmail.com>
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
 <20221116190210.28407-3-maxim.cournoyer@gmail.com>
 <8735ac9evv.fsf@meer.lwn.net> <87tu2sou3d.fsf@gmail.com>
 <874juj6p3y.fsf@meer.lwn.net> <87wn7esvrr.fsf@gmail.com>
Date:   Mon, 28 Nov 2022 13:29:42 -0700
Message-ID: <87lenu6cw9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:

> Hi,
>
> Jonathan Corbet <corbet@lwn.net> writes:
>
>> Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:
>>
>>> Hi Jonathan,
>>>
>>> Jonathan Corbet <corbet@lwn.net> writes:
>>>> I think I'm going to hold off on this one.  As I said before, it would
>>>> have made sense to do things this way when we made the transition.  At
>>>> this point, though, I think the potential for trouble outweighs the
>>>> benefits that would come from moving things around in this way.
>>>
>>> OK.  The potential for troubles would lie with the scripts to deploy the
>>> doc to the web site, I'd guess?  If that's the place we'd expect
>>> problems, I'm happy to be pointed to it and can try adjusting the
>>> scripts for the change.
>>
>> The trouble lies in any number of scripts at any number of sites;
>> calling this an ABI change would be a stretch, but some of the same
>> concerns apply.
>
> Right.  I wouldn't be too concerned with sites other than the main Linux
> documentation site, though?

We can't really take that attitude; breaking users is bad.  There may
(or may not) be any number of companies generating the HTML docs for
internal use, for example; breaking them would be rude at best.

>> Getting the docs build on kernel.org updated would not be a huge
>> problem, I think, but I don't know what else might break.
>>
>> We can reconsider this, but not before the merge window.
>
> Understood.  Thanks for the follow up!  Should I resend when the next
> window opens?

Sure, you can do that.  No guarantees that the benefits of the change
will seem worth the risk at that time, though.

Thanks,

jon
