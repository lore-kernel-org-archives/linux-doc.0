Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3C5C433B4
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 08:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F900613BC
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 08:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhEDIrd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 May 2021 04:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhEDIrd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 May 2021 04:47:33 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C441AC061574;
        Tue,  4 May 2021 01:46:38 -0700 (PDT)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1ldqhP-0008QM-7x; Tue, 04 May 2021 10:46:35 +0200
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <dd13f10c30e79e550215e53a8103406daec4e593.1618482489.git.linux@leemhuis.info>
 <e1d2e16a-60b8-0a55-20d4-53db11e6821c@leemhuis.info>
 <875yzzh1bm.fsf@meer.lwn.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v1] docs: reporting-issues.rst: CC subsystem and
 maintainers on regressions
Message-ID: <7f91a4bd-ca35-ff8e-cc99-4aff627e9aa8@leemhuis.info>
Date:   Tue, 4 May 2021 10:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875yzzh1bm.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1620117998;58375697;
X-HE-SMSGID: 1ldqhP-0008QM-7x
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04.05.21 00:58, Jonathan Corbet wrote:
> Thorsten Leemhuis <linux@leemhuis.info> writes:
> 
>> Hi Jonathan. Wondering if this slipped through the cracks, as I haven't
>> heart anything (or did I miss it?). Would IMHO have been nice to have in
>> 5.13 as well, but it's not crucial.
> 
> Hmm...I was sure I'd applied this one, guess not.  Sorry.  Applied now,
> I'll push it Linusward shortly.

No worries & many thx! Ciao, Thorsten
