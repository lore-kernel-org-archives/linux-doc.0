Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC856C433E9
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 20:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 959796523B
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 20:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhCIUPm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 15:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbhCIUP2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 15:15:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5E0C06174A
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 12:15:28 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id lr10-20020a17090b4b8ab02900dd61b95c5eso3362390pjb.4
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=gOeIe3TgDjIaHHmPAZjm+dCUv5aptDn0wQlbRWoodls=;
        b=VoWl8zARrt2sRSvOzpA+nV/2A4iiB3oy1xx2idWrgNq1dweb2slj6EacyyQebRjK1t
         s70IL39TtbSZeRxxZrJvcicJO+TBI0As3o/XN4rJqjqcj/mXNwo8cE5B400cS0o9206R
         3nuNuyNE/iZOw7tYGx+6OYuz8p57FB+98Y6gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gOeIe3TgDjIaHHmPAZjm+dCUv5aptDn0wQlbRWoodls=;
        b=fPOqTYXqEUqUaEsabm9Dk5+RqthrsxW4YqhTXdYCb5bkubkqd4n7EInr9PltgX5gWB
         BvLzW9CdkoG0f45l47hmeKl0JKJnEcrvbv3tvw63ydiK8YlQa4p2VdX9mPerC8Qy27WG
         F5nScyBKfwCwO1wCnHPNScEB/29KtHdQ0wIf4Lp2iilBYoWf7VFQAXEM9Gq/aUv/YN+r
         32bsDmspyCTZcaF6rlXUDlOZlZV1fow3oM4ftHYy11UHgxwMpkzJo8vPCkm1/aCs5cKG
         Jne+RE9kYPctQ5Ye4p9g9Gf1H9D6+eMsCmV8wSjm80utqVsfkTmy8NU2cwOKtZiy52xj
         LM6Q==
X-Gm-Message-State: AOAM532mHOMTa62sA0j+8eVrzjKxhxZXd+RPMWAK6T2ZRibrk4k4lhTR
        pKrbQMcXs8u3werJgdjk9QH3usFfN2Hmkg==
X-Google-Smtp-Source: ABdhPJxeBq1VrxlJFzHRE6iXKDhZjXL/E6YbG4bh36Wka0alhMnMW322XiHBsNIUoND7EgeiU0wz8w==
X-Received: by 2002:a17:90b:e08:: with SMTP id ge8mr6285905pjb.130.1615320927417;
        Tue, 09 Mar 2021 12:15:27 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id h19sm940616pfc.172.2021.03.09.12.15.26
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 12:15:26 -0800 (PST)
Subject: Re: [PATCH v3] Expose the bus kernel docs to the build docs.
Cc:     linux-doc@vger.kernel.org
References: <20210307031611.GU2723601@casper.infradead.org>
 <20210308191417.4750-1-wt@penguintechs.org>
From:   Wren Turkal <wt@penguintechs.org>
Message-ID: <db8e8ee0-e07b-8303-0150-b6ac78fd84c1@penguintechs.org>
Date:   Tue, 9 Mar 2021 12:15:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308191417.4750-1-wt@penguintechs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I have a really dumb question. Should I see this patch somewhere in 
patchwork? I can't find it on there.

Thanks,
wt
-- 
You're more amazing than you think! ymatyt.com
