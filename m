Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0B2C43217
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 12:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiJMMvM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 08:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJMMvJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 08:51:09 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B80C97D3
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 05:51:06 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id d187so1632113vsd.6
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2cH3XkUWNLmNpwPQYLhtWACtStFj+VXNiGHkNXCbo0=;
        b=XxwCvmQ1OfqgGGbTHrcRTCqJQWsDbCAQaVv1lDeA+U/bZDTMcdIsls3Z9siap5rSd2
         hvneGkBQHEedy2YDOcb9hXvo33bTwqgMS5dmPvBRasi2lr/hp7IeptFLeUIqjRU0lFTI
         uizc1YvsBhmHDhetspqPlCknQqP4Y3kZs9h5lfpRI3voVtOcm2ljtlxXREaNF+6Hcny6
         v5tVRgHfAhPBy4SrwxfCP0wHcZ1F1lev3ymv1oSe0Q4+FAFq1GJS/oLSrrFxEDRoepS+
         3rCqFR/1Y3jQ7FGzes2cKVlq5c8J6p84PORSkId4LuLMZV3rR1Rnsagi/dMrZj/dHMcx
         UPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2cH3XkUWNLmNpwPQYLhtWACtStFj+VXNiGHkNXCbo0=;
        b=Uo97gCbMYZj5Ymcgh9TbqyF6spGZ+HVZ5e5I12qt0tJzVwjprxBMakPsWQnq+fhq0m
         iQxKOcOG81SlFSdftBJda+6i41KTQ0VAMecfsmXaUmXqAOL4FVHmLLNf96Xwzl5ZkMcj
         itvclOyVDPx0Zd2FNf1CjRJ1IK7quq2/8B76HBmeLIokvNi+2hoa3mHep70mfuShnnll
         yy2jKtwPK+wuYeUKA0B5nfLhc4/cYsjJd+pL14wNiI5EyVZdJhjRubSkVPOW3fpqOY2Q
         S6Aj/NTv/BOBzJL4yHp/yL3HgOYW45r9wCRYr2ZRhz0gt/K1dzWWifpeYjR4EELoC0mK
         EW1w==
X-Gm-Message-State: ACrzQf16Ufhnybq6zTzfGfFChBhbLEX8tTfleG2fj2QMiTmM18QA+aVn
        f9MJ0oUeIWVkKRC5ai+X1FpJ7zqKc1vKnw==
X-Google-Smtp-Source: AMsMyM5wWXDn76e8mvrqcBBxuxQMpTsIi+Sda1mv26vttJb13vgAl0Xcx57FAQYYbgMIO1+VqhQeeQ==
X-Received: by 2002:a17:902:da8a:b0:180:6f4f:beee with SMTP id j10-20020a170902da8a00b001806f4fbeeemr30972033plx.82.1665665454343;
        Thu, 13 Oct 2022 05:50:54 -0700 (PDT)
Received: from [10.68.76.92] ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id c72-20020a621c4b000000b00561c179e17dsm1934281pfc.76.2022.10.13.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 05:50:53 -0700 (PDT)
Message-ID: <db41c662-19ce-fc1a-21ba-38ecda7d09c8@bytedance.com>
Date:   Thu, 13 Oct 2022 20:50:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [External] Re: [RFC] mm: add new syscall pidfd_set_mempolicy()
To:     Michal Hocko <mhocko@suse.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, wuyun.abel@bytedance.com
References: <20221010094842.4123037-1-hezhongkun.hzk@bytedance.com>
 <Y0WEbCqJHjnqsg8n@dhcp22.suse.cz>
 <582cf257-bc0d-c96e-e72e-9164cff4fce1@bytedance.com>
 <Y0aCiYMQ4liL2azT@dhcp22.suse.cz>
 <a0421769-c2b9-d59a-0358-3cc84b2cb2bd@bytedance.com>
 <Y0avztF7QU8P/OoB@dhcp22.suse.cz>
 <e825a27a-646b-9723-f774-947501c04ec2@bytedance.com>
 <Y0f17v1c3aAszlbk@dhcp22.suse.cz>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <Y0f17v1c3aAszlbk@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> Hi Michal
>>
>> Could we try to change the MPOL_F_SHARED flag to MPOL_F_STATIC to
>> mark static mempolicy which cannot be freed, and mpol_needs_cond_ref
>> can use MPOL_F_STATIC to avoid freeing  the static mempolicy.
> 
> Wouldn't it make more sense to get rid of a different treatment and
> treat all memory policies the same way?

I found a case, not sure if it makes sense. If there is no policy
in task->mempolicy, the use of atomic_{inc,dec} can be skiped
according  to MPOL_F_STATIC. Atomic_{inc,dec} in hot path may reduces 
performance.

Thanks.
