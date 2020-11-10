Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDAEC388F7
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 12:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE630206B2
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 12:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgKJMBn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 07:01:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKJMBn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 07:01:43 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EFCC0613CF;
        Tue, 10 Nov 2020 04:01:41 -0800 (PST)
Received: from ip4d145e30.dynamic.kabel-deutschland.de ([77.20.94.48] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kcSLC-0003mo-2t; Tue, 10 Nov 2020 13:01:38 +0100
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1601541165.git.linux@leemhuis.info>
 <7910cf25-4aa9-e33d-704c-33ab91ab713b@leemhuis.info>
 <20201109112136.0634a356@lwn.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [RFC PATCH v1 00/26] Make reporting-bugs easier to grasp and yet
 more detailed
Message-ID: <88e01ec7-7a29-3f17-7a76-590d9e3b5543@leemhuis.info>
Date:   Tue, 10 Nov 2020 13:01:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109112136.0634a356@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1605009702;8e0bf6c5;
X-HE-SMSGID: 1kcSLC-0003mo-2t
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 09.11.20 um 19:21 schrieb Jonathan Corbet:
> On Mon, 9 Nov 2020 12:01:56 +0100
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
>> @Jon: I'd be really appreciate to hear your thoughts on this.
> 
> Seems like it's time to post a new version with all of your feedback so
> far reflected, and we'll go from there?

Will do, just give me a day to two.

Ciao, Thorsten

P.S.: BTW, @Randy, thx for yesterdays clarification in another mail of 
this subthread!

