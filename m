Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C732C4321E
	for <linux-doc@archiver.kernel.org>; Tue, 22 Nov 2022 08:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiKVIdS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Nov 2022 03:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiKVIdP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Nov 2022 03:33:15 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0AF2AC49
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 00:33:14 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so16619526pjs.4
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 00:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICq6wKj+fTCmm2GjCUS1L0jcKrWJpIWh5rHEbpke/Aw=;
        b=F97DvddPsXnZFYx+QA0dfxA6f30QqDBS69xRYssBkziviud34e1LSnX9q7xF/57AuE
         dP0StyJf+OaVouXPLVZ/Ce+C/uKXJ3gYoZLnAf3E2UnKyLAaykL9jHZe/J0qxWLvcb/3
         g33c/xMTGng9r4Aucbbcy2yDCaxrt1nzY+QrQn+7LJY5gScK/lNJ81AxkYA6Mkxa0BX6
         QNcoi8zGYqUflEtd5A7aOuBkTkGgviLK1RaQ5ICYAt2/4eupEedkUzUNheoKnfMJYl/X
         LaEncu+bZgFb7Dv0ZAnsZdMJJ7eXn3+HMe/TtL6Im+9ZI7GtgiKzgFhM8R9Oej5E7otX
         0UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICq6wKj+fTCmm2GjCUS1L0jcKrWJpIWh5rHEbpke/Aw=;
        b=0HYOeHzkaM0HFFIx8NCDwatIkyu7BAo8aIRDY94YWqx3HKN4cPdo5iKi0Lottp3K0B
         vqcispo6jCfjn56W+hTViCzoImZz6bBXup0HF/b6c7b/zw5ud23fEtYgJcqgGY7JsFIS
         bhC7+FaH3fGgsWVedTI2x/JRrdrB7K2VK9RtE6ETSmNe5nolqUZjYhwSbHL6hAG6RD4D
         yrbfB6seTiYBOIXFqaP/RX3sG2Rhg/I5vgQBeUCRiftXlBOLrY023Y/GSYfb0AD8c+Cf
         YHQbftG+7t0N2gXEVbSEhPMUG9EO2Ofp2W2lLyrgxf0Tm57qLZJeX1JOHdCW1+D/VM9U
         Iptw==
X-Gm-Message-State: ANoB5plrR66ZUYGcwko1XsYw5gKtvku1SxKyZf98U0iSEvLctE9P7w/f
        8nURvbrxS8AR3qJCNBcRIy3gXZdJQcAFRfVe
X-Google-Smtp-Source: AA0mqf4vL/diUtsIX5LpP10tBGJx/S2/Ws+e7zKi3MOsrP9d2mD1bwtgXW5DaRmMpVUpuJIekszqkg==
X-Received: by 2002:a17:90a:d38a:b0:218:a7e6:60df with SMTP id q10-20020a17090ad38a00b00218a7e660dfmr11210368pju.38.1669105993608;
        Tue, 22 Nov 2022 00:33:13 -0800 (PST)
Received: from [10.254.109.138] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b0016c5306917fsm11448352plh.53.2022.11.22.00.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 00:33:13 -0800 (PST)
Message-ID: <ff3e9255-028a-7174-3608-2d9c362bdaf7@bytedance.com>
Date:   Tue, 22 Nov 2022 16:33:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [External] Re: [PATCH v2] mm: add new syscall
 pidfd_set_mempolicy().
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221111084051.2121029-1-hezhongkun.hzk@bytedance.com>
 <20221111112732.30e1696bcd0d5b711c188a9a@linux-foundation.org>
 <a44f794e-fe60-e261-3631-9107822d5c36@bytedance.com>
 <Y3IqLzvduM6HqPJV@dhcp22.suse.cz>
 <3a3b4f5b-14d1-27d8-7727-cf23da90988f@bytedance.com>
 <Y3KFFfMFE55lVdNZ@dhcp22.suse.cz>
 <82c9c89c-aee2-08a3-e562-359631bb0137@bytedance.com>
 <0bd0b744-3d97-b4c3-a4fb-6040f8f8024a@bytedance.com>
 <Y3T6SqZvAmSG5I6W@dhcp22.suse.cz>
 <6433156f-34a8-400f-e282-91268b242279@bytedance.com>
 <Y3uNWbPmwHtytKzY@dhcp22.suse.cz>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <Y3uNWbPmwHtytKzY@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Michal, thanks for your replay and suggestions.

> 
> Yes the memory consumption is going to increase but the question is
> whether this is something that is a real problem. Is it really common to
> have many vmas with a dedicated policy?

Yes, it does not a realy problem.

> 
> What I am arguing here is that there are essentially 2 ways forward.
> Either we continue to build up on top of the existing and arguably very
> fragile code and make it even more subtle or follow a general pattern of
> a proper reference counting (with usual tricks to reduce cache line
> bouncing and similar issues). I do not really see why memory policies
> should be any different and require very special treatment.
> 

I got it. It is rather subtle and easy to get wrong if we push forward
with the existing way and it is a good opportunity to get from the
existing subtle model. I will try that on next version.

__
Best Regards,
Zhongkun
