Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A5AC00140
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 02:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbiHKCJk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Aug 2022 22:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiHKCJj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 22:09:39 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9301844DE
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 19:09:37 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ha11so16469619pjb.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 19:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=oSA+Jof75BuedTVbt4lBoiMeV523r3pp7Ny1EC5oo3o=;
        b=w0LbbLx22MfQERbKFdETrb3ybAIxu4PakWhNX0JhVR2NfpBhq7Yqripn1YP+hcGg1G
         NHY8+4Rr6yTKcDEvaGbHrUCApwsNJdhMdkRsTVYxZXLCqcgx+obRDTd/0VoA/KsyYkgM
         xH9Y6GqYr8VN+x4u/U0KUA9lBlMnHdXIWFeh5HvCHJAjtbs/dhQ9C3BiKrDuXjx9U1nb
         Bk0ohofkrChxG8d7tGGKbx2K0azQCe1H0MYPxRZTEfFLG2WGP0lilMgvtFYTnjho35Mo
         +AEvUT3AQhyadp5mfRNM58gAtRcMxqcI1P2jRVMQ96L2Kmxs15ulMY1H9dapgPZoyLZk
         pAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=oSA+Jof75BuedTVbt4lBoiMeV523r3pp7Ny1EC5oo3o=;
        b=EuFbnAg8kGS6c91k3hxzVyf93+3Hg6nWKmy7r0GoFLqqDF14FOgR/bl7Gf5eVdoGeC
         b422NVVWt3D43CJvTV2co7S8Ia2BHYa+oXdr/VxlDeoNGr/9luRolHZFJ1nJapuUIxaM
         LSFJDZPij4J+71FZlwjEkbmhxBXDPDOogWCUM+NTmRRzJ0qLyQgR/lwRXB3FDRAyxa3u
         o03nt9loA+jm69JhDYuPGHEw0La31BiPxAHOixhfRvf6AfA1RgocA78zK66yLbiT5TGD
         RxowHqzUibmb2g+yAJrBOeU3Ut748kNArxjWZMByxETYdwfkzo07kjGwxeFzEB5CCOKa
         OJ6Q==
X-Gm-Message-State: ACgBeo1MzHHyW95HjVc3/kbO9F2yLCORPIGQpPSU90hAQdBy3xVn51d+
        pr0kPLXHCJYGWqVcdLzop7iC7A==
X-Google-Smtp-Source: AA6agR7pEvJYGfeI5QBU3XEAHO0I7vZXYDuMiae/XSEL7US94LL05wzxU5jq93JPbtgmd163xcYB4A==
X-Received: by 2002:a17:903:230b:b0:16f:2276:1fc4 with SMTP id d11-20020a170903230b00b0016f22761fc4mr29113456plh.172.1660183777109;
        Wed, 10 Aug 2022 19:09:37 -0700 (PDT)
Received: from [10.70.253.98] ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id y27-20020aa79e1b000000b0052df34124b4sm2741760pfq.84.2022.08.10.19.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 19:09:36 -0700 (PDT)
Message-ID: <cd4983dd-8432-7f79-1066-61b6f02e99c3@bytedance.com>
Date:   Thu, 11 Aug 2022 10:09:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2 09/10] sched/psi: per-cgroup PSI stats
 disable/re-enable interface
Content-Language: en-US
To:     Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc:     corbet@lwn.net, surenb@google.com, mingo@redhat.com,
        peterz@infradead.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com
References: <20220808110341.15799-1-zhouchengming@bytedance.com>
 <20220808110341.15799-10-zhouchengming@bytedance.com>
 <YvKd6dezPM6UxfD/@slm.duckdns.org>
 <fcd0bd39-3049-a279-23e6-a6c02b4680a7@bytedance.com>
 <b89155d3-9315-fefc-408b-4cf538360a1c@bytedance.com>
 <YvPN07UlaPFAdlet@cmpxchg.org> <YvPqcJh5Ffv4Yga9@slm.duckdns.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <YvPqcJh5Ffv4Yga9@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/8/11 01:27, Tejun Heo wrote:
> Hello,
> 
> On Wed, Aug 10, 2022 at 11:25:07AM -0400, Johannes Weiner wrote:
>> How about just cgroup.pressure? Too ambiguous?
>>
>> cgroup.pressure.enable sounds good to me too. Or, because it's
>> default-enabled and that likely won't change, cgroup.pressure.disable.
> 
> .disable sounds more logical but I like .enable better for some reason. As
> for just cgroup.pressure, yeah, maybe? The conundrum is that the prettiness
> order is the exact reverse of the logical order. So, I'm okay with any of
> the three.

Ok, so I would like to pick the prettiest "cgroup.pressure", it also looks more
consistent with {cpu|memory|io}.pressure.

Thanks!

