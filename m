Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F3EC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 09:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84DAD61A45
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 09:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhCZJlb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 05:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCZJl3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Mar 2021 05:41:29 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A530AC0613AA;
        Fri, 26 Mar 2021 02:41:29 -0700 (PDT)
Received: from ip4d142c50.dynamic.kabel-deutschland.de ([77.20.44.80] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lPiy4-0005nm-Df; Fri, 26 Mar 2021 10:41:24 +0100
Subject: Re: [Ksummit-discuss] [1/5] reporting-issues: header and TLDR
To:     Guenter Roeck <linux@roeck-us.net>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
References: <c396c91f-27c2-de36-7b05-099e03c213f4@leemhuis.info>
 <6a220d2c-568e-2e41-53a4-0800e206d0a6@leemhuis.info>
 <fef9abce-3b5b-ee40-6a28-13d3cab15b3f@roeck-us.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <8b4bf3d1-2fd9-e55f-c26f-a8f654a67a67@leemhuis.info>
Date:   Fri, 26 Mar 2021 10:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fef9abce-3b5b-ee40-6a28-13d3cab15b3f@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1616751689;9d7fb317;
X-HE-SMSGID: 1lPiy4-0005nm-Df
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26.03.21 07:23, Guenter Roeck wrote:
> On 3/25/21 11:15 PM, Thorsten Leemhuis wrote:
>> On 26.03.21 07:13, Thorsten Leemhuis wrote:
>
>> mention if backporting is planed or considered too complex. If backporting was
> planned

ha, of course, thx for pointing it out! Ciao, Thorsten


