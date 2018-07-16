Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A38B7D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Jul 2018 21:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbeGPVna (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Jul 2018 17:43:30 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:48179 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729595AbeGPVna (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jul 2018 17:43:30 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id w6GLE07Q009901;
        Tue, 17 Jul 2018 06:14:00 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Tue, 17 Jul 2018 06:14:00 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from [192.168.1.8] (softbank126074194044.bbtec.net [126.74.194.44])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id w6GLDrUb009866
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 17 Jul 2018 06:14:00 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v13 0/7] cgroup-aware OOM killer
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     David Rientjes <rientjes@google.com>,
        Michal Hocko <mhocko@kernel.org>, Roman Gushchin <guro@fb.com>,
        linux-mm@vger.kernel.org,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Tejun Heo <tj@kernel.org>, kernel-team@fb.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20171130152824.1591-1-guro@fb.com>
 <20180605114729.GB19202@dhcp22.suse.cz>
 <alpine.DEB.2.21.1807131438380.194789@chino.kir.corp.google.com>
 <0a86d2a7-b78e-7e69-f628-aa2c75d91ff0@i-love.sakura.ne.jp>
Message-ID: <0d018c7e-a3de-a23a-3996-bed8b28b1e4a@i-love.sakura.ne.jp>
Date:   Tue, 17 Jul 2018 06:13:47 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0a86d2a7-b78e-7e69-f628-aa2c75d91ff0@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

No response from Roman and David...

Andrew, will you once drop Roman's cgroup-aware OOM killer and David's patches?
Roman's series has a bug which I mentioned and which can be avoided by my patch.
David's patch is using MMF_UNSTABLE incorrectly such that it might start selecting
next OOM victim without trying to reclaim any memory.

Since they are not responding to my mail, I suggest once dropping from linux-next.

https://www.spinics.net/lists/linux-mm/msg153212.html
https://lore.kernel.org/lkml/201807130620.w6D6KiAJ093010@www262.sakura.ne.jp/T/#u

On 2018/07/14 10:55, Tetsuo Handa wrote:
> On 2018/07/14 6:59, David Rientjes wrote:
>> I'm not trying to preclude the cgroup-aware oom killer from being merged,
>> I'm the only person actively trying to get it merged.
> 
> Before merging the cgroup-aware oom killer, can we merge OOM lockup fixes
> and my cleanup? The gap between linux.git and linux-next.git keeps us unable
> to use agreed baseline.
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
