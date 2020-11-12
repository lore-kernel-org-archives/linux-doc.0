Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8112CC388F7
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 05:39:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 407EF21534
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 05:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbgKLFjY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 00:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729346AbgKLFWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 00:22:34 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0778C0613D1;
        Wed, 11 Nov 2020 21:22:34 -0800 (PST)
Received: from ip4d145e30.dynamic.kabel-deutschland.de ([77.20.94.48] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kd544-0000QJ-Qq; Thu, 12 Nov 2020 06:22:32 +0100
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1601541165.git.linux@leemhuis.info>
 <e9166fcbb777e9b7685745e572ab7c7322596ec2.1601541165.git.linux@leemhuis.info>
 <275187e0-92b5-d0a6-0bf7-76c827e2c808@infradead.org>
 <a08d1012-78bf-5f84-26d2-4f596bc3b59d@leemhuis.info>
 <873abf9c-5651-8dc3-70ea-b14e498661a7@leemhuis.info>
 <8c3bd254-4989-ea6f-1a73-84f68d0ac75e@infradead.org>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [RFC PATCH v1 15/26] docs: reporting-bugs: make readers test
 mainline, but leave a loophole
Message-ID: <f7cd403c-2ae3-9220-2d49-9968a49b4f52@leemhuis.info>
Date:   Thu, 12 Nov 2020 06:22:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8c3bd254-4989-ea6f-1a73-84f68d0ac75e@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1605158554;5289057d;
X-HE-SMSGID: 1kd544-0000QJ-Qq
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 12.11.20 um 04:42 schrieb Randy Dunlap:
> On 11/11/20 7:36 AM, Thorsten Leemhuis wrote:
>> Am 03.10.20 um 12:11 schrieb Thorsten Leemhuis:
>>> Am 02.10.20 um 19:51 schrieb Randy Dunlap:
>>>> On 10/1/20 1:39 AM, Thorsten Leemhuis wrote:
 > […]
>> I'm preparing to send v2 and was a bit unhappy with this and
>> another section when seeing it again after weeks. In the end I
>> reshuffled and rewrote significant parts of it, see below.
>> 
> […]

>> development. Even the latest Linux 'stable' kernel is a significant
>> bit behind and thus better avoided. But sometimes it's even the right
>> choice, but in those cases you might want to wait a few days before
>> trying to reproduce an issue with the latest codebase:
> Try to remove one "But/but" in the sentence above.

Ha, yeah, good idea. Went with this:

At least most of the time, as sometimes a stable kernel can the best 
choice; but in those situations you might want to wait a few days anyway:

> LGTM. Thanks.

Great, thx again for you feedback (Consider all the obvious spelling and
grammatical mistakes you pointed out fixed, I just didn't mention them 
here to keep the reply short)!

Ciao, Thorsten

