Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3967EC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 00:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1588922D72
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 00:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390914AbhALA0B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 19:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404188AbhAKXnS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 18:43:18 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02660C061786;
        Mon, 11 Jan 2021 15:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=nmQpwEsqnF3hFhAlOz5aGVeI2N3knb9M3qAY/ha7fg0=; b=q0JiFKG0nzMUwXbti8rsqTSBl3
        tb97qGmjGZVa74ROy1ON7I4/f6azbxWGDHgFPfyLk75rVgzbTd/BydFyXB7iTrYmTcE48+XJMf1iK
        nTv7liPCZD/9EB0MYHkbfvHZ08nAbvsV1+jrTMJBnonpmwXs7Y6nN27m4ztye1T8xeNJE8E5sQ396
        1G9n8V9Z2vVJdMS/u22GK/jRH5/1bnidCZoaVVfI7QQq6bQZJok/Vkt18zpAmcsGmA4FaN+OQqUUn
        g4DmoyBsiMIi2fmjSdIcjMW9CpueLF0YA7QcjYNrU2lXp9Pv8quxfXIFd1LknBvvYaokSMZBOZx99
        Tv93HqRA==;
Received: from [2601:1c0:6280:3f0::79df]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kz6pW-0001OB-Lt; Mon, 11 Jan 2021 23:42:35 +0000
Subject: Re: [PATCH v1 (RFC)] docs: discourage users from using
 bugzilla.kernel.org
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210110121033.130504-1-linux@leemhuis.info>
 <6ca51584-1739-e532-d40e-e4447065ea1e@infradead.org>
 <dc2b0eaa-26e9-f686-ae7b-7e777cb3d55f@leemhuis.info>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5ed98052-28ea-4701-10d4-b7fde106c1fd@infradead.org>
Date:   Mon, 11 Jan 2021 15:42:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dc2b0eaa-26e9-f686-ae7b-7e777cb3d55f@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/11/21 10:55 AM, Thorsten Leemhuis wrote:
> Am 11.01.21 um 19:14 schrieb Randy Dunlap:
>> On 1/10/21 4:10 AM, Thorsten Leemhuis wrote:
>>> * About 66 of those ~200 components will assign bugs to email addresses
>>>   that look valid, but 125 of them end with @kernel-bugs.osdl.org or
>>>   @kernel-bugs.kernel.org. Those domains do not exist anymore, mails
>>>   sent there bounce ('Unrouteable address'). It's possible that the
>>>   server might be rewriting those domain names and nevertheless
>>>   delivers new reports and comments by mails to some human; but it
>>>   seems more like they never get mailed to anyone and thus just linger
>>>   in the database; no wonder quite a few of bugs filed against such
>>>   components never get a single reply (see below).
>>
>> Those @kernel-bugs email addresses should not be a problem:
>>   https://korg.docs.kernel.org/bugzilla.html#real-assignees-vs-virtual-assignees
> 
> Ahh, interesting, many many thx. Stupid me also forgot to put Konstantin
> on the CC list (I had planned to do that, but forgot when I actually
> sent the patch :-/ ), which likely would have pointed be there as well.

Yes, since I got that from him. :)

>> AFAIK, USB bugs go to linux-usb@vger.kernel.org,
> 
> Those seem to use the approach the link above describes.
> 
>> SCSI bugs go to linux-scsi@vger.kernel.org.
> 
> That's one of the email address that are in the database for real, which
> were mentioned in my patch description as 'looking valid':
> https://bugzilla.kernel.org/describecomponents.cgi?product=IO%2FStorage
> 
>> netdev didn't want bugs sent there automatically IIRC, so a
>> human takes care of doing that if warranted.
> 
> Ahh, good to know, it's really not obvious there are some humans working
> there to that take care of this. That and all those bugs that never get
> a reply look really like things are not working well.
> 
>> Andrew Morton takes MM bugs and Cc:s them to linux-mm mailing list
>> and then asks for discussion to continue on the mailing list.
> 
> Then what use it bugzilla here? Wouldn't it be better for people to go
> straight to the list?

Might as well, yes.

>> We
> 
> Who is "we"? We as in "the kernel community"? Or is there actually a

Anyone who is up for it -- yes, mostly "community."

> smaller group of people you are referring to which is actively
> maintaining the list of products and components on bugzilla.kernel.org?

nope.

> Just trying to understand things better here, as there are other things
> that look strange to me and were mentioned in the patch description. For
> example: Why are there only 200 products and components on
> bugzilla.kernel.org (some of them for historic things like the
> ac-kernels) while the MAINTAINERS file has more than 2200 entries?

I wouldn't want a separate entry for each  SPI/GPIO/regulator/USB etc.
device. That's just IMO...

>> could/should probably see if we can add more project-specific
>> mailing lists to the automatic reporting 
> 
> Guess that would mean taking to a lot of maintainers/mailing list admins
> if they are okay with that. Who would do that?

whoever is motivated to do so.

>> -- but probably not LKML.
>> Otherwise some bug reports might never be heard about.
> 
> Yeah, agreed.
> 
> FWIW: I don't care too much about this whole thing, the whole idea for
> the approach I'm currently driving forward started when I did regression
> tracking in 2017. Back then I noticed quite a lot of bug reports on
> bugzilla.kernel.org never got a single reply, even if they were good and
> looked valid. That's why I brought this forward on the maintainers
> summit (https://lwn.net/Articles/738216/ ) and there it was discussed to
> basically go the route I'm taking currently. But I'm totally find to
> adjust that route if there are good reasons, especially as that
> discussion happened some time ago.


cheers.
-- 
~Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://www.kernel.org/doc/html/latest/process/submit-checklist.html
