Return-Path: <SRS0=2XaJ=CS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F6C433E2
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 17:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 077C421D7E
	for <linux-doc@archiver.kernel.org>; Wed,  9 Sep 2020 17:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kHsyvIyV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIIRyv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Sep 2020 13:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgIIRyu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Sep 2020 13:54:50 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22228C061573
        for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2020 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=rup3OWRR5zyDlMmHUiRlNzjG/+xtsUIvpfGdy6AhjLA=; b=kHsyvIyVoSOpxmNWUCunMbQD5Q
        qTXHDDrTldqjsqIC6lKP0ECqaq/UvFFaBDN6ANdrlUCsB1JUvUVJeSBgBZqDq2tXAtYdO6KjKOPt7
        jb9c/5tyAyMe6EPPDsQ30ad9Wz4q3AEiSGyyNevbcGR69ZnK+FYBY4aiHbj0PZbgYdQBTIcFpCI0P
        xXgT7oaieXfVwpTNC6gumvdKPMcnSyr9djwTFec6UhEVpF8TRP8u5IYSX64+TUpIJAnZxI3lOPuN7
        bvxGz7pGOTDG/9VLK5JUXUbiprNHedqUDSj6yXGEjr6uk89FBhYxk2Z7BR+xY1iH9zAS+gXslm2ty
        QohsdcQA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kG4Ix-0002sy-0g; Wed, 09 Sep 2020 17:54:47 +0000
Subject: Re: [PATCH] docs: add a new User Mode Linux HowTo
To:     Jonathan Corbet <corbet@lwn.net>, anton.ivanov@cambridgegreys.com
Cc:     linux-um@lists.infradead.org, linux-doc@vger.kernel.org,
        richard@nod.at
References: <20200904141115.15708-1-anton.ivanov@cambridgegreys.com>
 <20200909115203.7c898211@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a0ce0897-fb78-0537-ea49-190fe2cc0736@infradead.org>
Date:   Wed, 9 Sep 2020 10:54:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909115203.7c898211@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/9/20 10:52 AM, Jonathan Corbet wrote:
> On Fri,  4 Sep 2020 15:11:15 +0100
> anton.ivanov@cambridgegreys.com wrote:
> 
>> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>>
>> The new howto migrates the portions of the old howto which
>> are still relevant to a new document, updates them to linux 5.x
>> and adds documentation for vector transports and other new
>> features.
>>
>> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> 
> Thanks for improving the docs!  Some nits...
> 
>>  .../virt/uml/user_mode_linux_howto_v2.rst     | 1304 +++++++++++++++++
>>  1 file changed, 1304 insertions(+)
>>  create mode 100644 Documentation/virt/uml/user_mode_linux_howto_v2.rst
> 
> You need to add this to an index.rst file so it becomes part of the docs
> build. 

> [...]
> 
>> +If the channel specification contains two parts separated by comma, the first one
>> +is input, the second one output.
>> +
>> +1. The null channel - Discard all input or output. Example ``con=null`` will set all consoles to null by default.
> 
> Please stick to the 80-column limit, it really does affect the readability
> of the text.


BTW, Jon, there is a v2 of this patch (not saying that it addresses
any of your comments/concerns).


-- 
~Randy

