Return-Path: <SRS0=pILf=IF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E76C43381
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 03:42:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC0F664E98
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 03:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhCGDlf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Mar 2021 22:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCGDlZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Mar 2021 22:41:25 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA49DC06174A
        for <linux-doc@vger.kernel.org>; Sat,  6 Mar 2021 19:41:14 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g4so4138838pgj.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Mar 2021 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j+GZzqGgIYZ9yKqNheOI33xjFEyGpTiyMfaxR/myKz4=;
        b=gO1G4fH2IRR0vhI88sYsvwxcnZ0MYmU8+aTFfy9M8F4E6lIO6s6qI1IxrubnZJUked
         vREwPzwkyK9fdkIS7JCjHMxKAtd4UmuX38nNG+zNLYgrzfIYJCsMZpbXiCXUDxYvqyNq
         cOxic3ynJ7iuhmzWZE5hYcim3QFAJ0afxpWgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j+GZzqGgIYZ9yKqNheOI33xjFEyGpTiyMfaxR/myKz4=;
        b=sVNYo0ZJi3K32AuMuyR7ReyM4HzOwe17P8DX7jbSRBmnyhJXWATbLsFy/bX60WX35X
         9I3ZXjgVf/Qmqwbnz1Tctt5kS8Vh7zkQEGjjDL4Cd4eo705RPUxvIWIt/zHzIi1+tw7H
         Up51yxz3Dm2xN3eEuJan8P0Vzj+6d2/o1QCBbTRe2eFIXmnzHEVDmii3Z1ItPWKXBUmP
         dk1rMNdSFUUu4jGfDfHbhQllatEStnx3L2VEJnPRUR5e3sVZx3nYSh3EAK1+xGFCoyi7
         /0GPDHAcOPz6iuv3tJvcePE4oD4uxEBTxPie4v8Y+eRiRtO4HYBwmX4ryVGPHWfOMiHI
         RZ5g==
X-Gm-Message-State: AOAM5314Q7S7qHka6XXBsRWWHruJ1GTNkGlHdj5DMXU7NSNvZgjXPY+Q
        OsvN/H4mCUp3pww98q5D48NdOhcqt3qYIcKM
X-Google-Smtp-Source: ABdhPJwaIf4qp1MB2is+pt4D5Zfq1E80gsxO7mJ3Ur34fLVqd07rmtr2Ue4yvaeRnIEtrmgjc5DYFw==
X-Received: by 2002:aa7:92cb:0:b029:1f1:542f:2b2b with SMTP id k11-20020aa792cb0000b02901f1542f2b2bmr9787278pfa.31.1615088474021;
        Sat, 06 Mar 2021 19:41:14 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id i1sm6386749pfo.160.2021.03.06.19.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 19:41:13 -0800 (PST)
Subject: Re: [PATCH v2] Expose the bus kernel docs to the build docs.
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210307014445.GT2723601@casper.infradead.org>
 <20210307031219.53800-1-wt@penguintechs.org>
 <20210307031611.GU2723601@casper.infradead.org>
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <de97ad62-d7bc-13e2-3816-441e98dbbc8d@penguintechs.org>
Date:   Sat, 6 Mar 2021 19:41:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307031611.GU2723601@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/6/21 7:16 PM, Matthew Wilcox wrote:
> On Sat, Mar 06, 2021 at 07:12:19PM -0800, Wren Turkal wrote:
>> +Fucntions and Structures
> 
> Typo, but hold off on a v3 until someone weighs in with an opinion on
> the rest of the patch.
> 

Okay, I fixed the misspelling locally. Looking forward to addtional 
feedback.

Thanks,
wt
