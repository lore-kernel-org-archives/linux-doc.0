Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393AEC433E6
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 12:31:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0978364F53
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 12:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhCSMa4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Mar 2021 08:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCSMau (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Mar 2021 08:30:50 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A504C06174A
        for <linux-doc@vger.kernel.org>; Fri, 19 Mar 2021 05:30:50 -0700 (PDT)
Received: from ip4d142c50.dynamic.kabel-deutschland.de ([77.20.44.80] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lNEH6-0005nJ-TX; Fri, 19 Mar 2021 13:30:44 +0100
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org
References: <20210310072858.231776-1-linux@leemhuis.info>
 <20210319102824.GA31225@mipc>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v1, RFC] docs: reporting-issues.rst: tone down 'test
 vanilla mainline' a little
Message-ID: <1a181e21-0e84-7a69-b544-91082ec10682@leemhuis.info>
Date:   Fri, 19 Mar 2021 13:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319102824.GA31225@mipc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1616157050;23208092;
X-HE-SMSGID: 1lNEH6-0005nJ-TX
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.03.21 11:28, Wu X.C. wrote:
> 
> Would you like to fix a typo by the way :-)
> reporting-issues.rst > line 1295:
> consider asking in other places for advice. For example ask a fried or post
> seem need s/fried/friend/

Ahh, many thx for pointing that out. I committed it locally to a
'various fixes' branch. Will send it separately to not mix fixed up with
these enhancements to keep the patch cleaner.

Ciao, Thorsten
