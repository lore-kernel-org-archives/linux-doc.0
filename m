Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99806C4361B
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 05:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49E1A23B28
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 05:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgLIFZz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 00:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgLIFZz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 00:25:55 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CB2C0613D6;
        Tue,  8 Dec 2020 21:25:15 -0800 (PST)
Received: from ip4d149f6e.dynamic.kabel-deutschland.de ([77.20.159.110] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kmryS-00025T-Qr; Wed, 09 Dec 2020 06:25:12 +0100
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1607063223.git.linux@leemhuis.info>
 <20201208104445.0f82ae78@lwn.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v4 0/3] New documentation text describing how to report
 issues (aka "reporting-bugs rewritten")
Message-ID: <578165ed-a62d-17df-32ba-188248639d12@leemhuis.info>
Date:   Wed, 9 Dec 2020 06:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208104445.0f82ae78@lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1607491515;bbc4c3aa;
X-HE-SMSGID: 1kmryS-00025T-Qr
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 08.12.20 um 18:44 schrieb Jonathan Corbet:
> On Fri,  4 Dec 2020 07:43:47 +0100
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
>> This series adds a new and mostly finished document describing how to report
>> issues with the Linux kernel to its developers.
> OK, I have applied this series.

Great, many thx! When I sent the first rfc I had expected it would take 
a lot longer to reach this point. But well, there is still a lot to do, 
just that it will happen in-tree now. Will keep an eye on things and 
work towards getting the remaining issues resolved.

Side note: Just sent the first (brown paper bag) patch for the text[1], 
as I messed up in one of the last few changes I did -- and obviously I 
only noticed this stupid mistake after you merged it. :-/ Sorry for the 
trouble.

Ciao, Thorsten

https://lore.kernel.org/linux-doc/d3894ba4a302beed661304cbcdc062c6dcfe3e58.1607489877.git.linux@leemhuis.info/
