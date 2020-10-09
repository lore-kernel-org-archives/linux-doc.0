Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A13C433DF
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 07:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C576C22277
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 07:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732184AbgJIHiY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 03:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731977AbgJIHiY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 03:38:24 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB16C0613D2;
        Fri,  9 Oct 2020 00:38:23 -0700 (PDT)
Received: from ip4d14bc8c.dynamic.kabel-deutschland.de ([77.20.188.140] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kQmyl-0003AF-55; Fri, 09 Oct 2020 09:38:15 +0200
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1601541165.git.linux@leemhuis.info>
 <89c5aa12cdb55568b3e33afbe8c5afddf54dddf6.1601541165.git.linux@leemhuis.info>
 <05897f9c-8039-51f1-27b2-97c65a3913db@infradead.org>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [RFC PATCH v1 21/26] docs: reporting-bugs: details on writing and
 sending the report
Message-ID: <b1c84287-867b-5884-8cb5-f9f433014622@leemhuis.info>
Date:   Fri, 9 Oct 2020 09:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <05897f9c-8039-51f1-27b2-97c65a3913db@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1602229104;c8eb8e30;
X-HE-SMSGID: 1kQmyl-0003AF-55
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Many thx for you comments. Consider all the obvious spelling and


grammatical mistakes you pointed out fixed, I won't mention all of them


in this reply to keep things easier to follow.

Am 09.10.20 um 04:45 schrieb Randy Dunlap:
> On 10/1/20 1:39 AM, Thorsten Leemhuis wrote:

>> +   In both cases make sure to inform those that the MAINTAINERS file lists in
>> +   the section 'security contact'. Ideally CCing them on the mail with the
>> +   report. If you filed it in a bug tracker forward the reports text, but on top
> 
> parse error in first 2 sentences above...

Now reads:

In both cases make sure to mail your report to the addresses the 
MAINTAINERS file lists in the section 'security contact'. Ideally 
directly CC them when sending the report by mail.

Ciao, Thorsten
