Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9FFC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 05:26:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1647064E29
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 05:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhBOF0k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 00:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhBOF0j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 00:26:39 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52C8BC061574;
        Sun, 14 Feb 2021 21:25:59 -0800 (PST)
Received: from ip4d149f6e.dynamic.kabel-deutschland.de ([77.20.159.110] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lBWOK-0006M8-4i; Mon, 15 Feb 2021 06:25:48 +0100
Subject: Re: [PATCH] docs: reporting-issues.rst: explain how to decode stack
 traces
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Joerg Roedel <joro@8bytes.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Damian Tometzki <linux@tometzki.de>
References: <20210210054823.242262-1-linux@leemhuis.info>
 <bd9a3e43-d52f-d947-04bc-28d4cc524cb4@infradead.org>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <5092d5ef-e790-3833-87be-e067c3189d25@leemhuis.info>
Date:   Mon, 15 Feb 2021 06:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bd9a3e43-d52f-d947-04bc-28d4cc524cb4@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1613366759;1a018989;
X-HE-SMSGID: 1lBWOK-0006M8-4i
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 11.02.21 um 18:07 schrieb Randy Dunlap:
> Just a couple of small nits (or one that is repeated):

:-D

> On 2/9/21 9:48 PM, Thorsten Leemhuis wrote:
>>  
>> - * If the failure includes a stack dump, like an Oops does, consider decoding
>> -   it to find the offending line of code.
>> + * If your failure involves a 'panic', 'oops', or 'warning', consider decoding
>> +   the kernel log to find the line of code that trigger the error.
>                                                    triggered
> […] 
> or it could be "code that triggers"... (just not "trigger").

Ahh, yes, you're right of course. Went with the former, many thx for
taking a look and pointing it out!

Ciao, Thorsten
