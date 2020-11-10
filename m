Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA66C2D0A3
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 03:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAC5F2067B
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 03:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="foIMzsTE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgKJDXt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Nov 2020 22:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgKJDXs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Nov 2020 22:23:48 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973B7C0613CF;
        Mon,  9 Nov 2020 19:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=buwWJZNpFl/2hjLEi5QBJhf23r0pjdlTKDNQzjr9ykw=; b=foIMzsTE/2p6h/eMeUIpm9e2Ox
        yA3VfOLF+anaejHlyNq8aQpqeQEHVlLyHmwIrJ7ImUlCgWb7Wfi+8i0Y0wyvBWrpD9I/WaAKIpZHe
        pV0dJnJf1R9g6pv8DXE1tssmLAPE9Yb5GiUjHf31rjGc3gI2TkCxvQOYLQPGmLwVvOM/LAl7Tltik
        1JAadD7WsNBI2OzxExlrTR+PgOiRCjfh01TdHsSL3tfaFeIf1CF+cGVHvvrVbA9Zwvz/ybMP4fe7m
        9uudvjzuqEPewKuOuUi2qEElTAtbxBBNf2a6HrHCpRer/rbIDKxwVFu9kX2+yLUr9m2V9W51HQ9aX
        OHqByg5Q==;
Received: from [2601:1c0:6280:3f0::662d]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kcKG1-0005DV-Fa; Tue, 10 Nov 2020 03:23:45 +0000
Subject: Re: [RFC PATCH v1 00/26] Make reporting-bugs easier to grasp and yet
 more detailed
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1601541165.git.linux@leemhuis.info>
 <7910cf25-4aa9-e33d-704c-33ab91ab713b@leemhuis.info>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1f71cf5a-4afb-22b5-c528-aeb026fc6ce9@infradead.org>
Date:   Mon, 9 Nov 2020 19:23:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7910cf25-4aa9-e33d-704c-33ab91ab713b@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/9/20 3:01 AM, Thorsten Leemhuis wrote:
> Lo!
> 
> Am 01.10.20 um 10:39 schrieb Thorsten Leemhuis:
>> This series rewrites the "how to report bugs to the Linux kernel maintainers"
>> document to make it more straight forward and the essence easier to grasp. At
>> the same time make the text provide a lot more details about the process in form
>> of a reference section, so users that want or need to know them have them at
>> hand.
>>
>> The goal of this rewrite: improve the quality of the bug reports and reduce the
>> number of reports that get ignored. This was motivated by many reports of poor
>> quality the main author of the rewrite stumped upon when he was tracking
>> regressions.
> 
> So, now that those weeks with the merge window, the OSS & ELC Europe, and this US election thing are behind us it seems like a good time to ask:
> 
> How to move on with this?
> 
> @Jon: I'd be really appreciate to hear your thoughts on this.
> 
> @Randy: Thx again for all suggestions and pointing out many spelling mistakes, that helped a lot! You didn't reply to some of the patches, which made me wonder: did you not look at those (which is totally fine) or was there nothing to point out? And what I'd really like to know: what are you thinking about the whole thing?

Hi,

I looked at all of the patches in the series but did not have any comments
on the ones where I didn't reply.


thanks.

-- 
~Randy

