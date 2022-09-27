Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BAEC6FA83
	for <linux-doc@archiver.kernel.org>; Tue, 27 Sep 2022 13:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbiI0NHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbiI0NHK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Sep 2022 09:07:10 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BA4177343
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 06:07:08 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so15501765pjq.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wLWYmfFySAd0GACOj4/rphI/57VoRcvb+5EekgbbspY=;
        b=vpZuuu+cF8tKQW52wVI/FmSsjrI369ARx9x3l38QFDVBOY19iVxTCIFY2z5Z/RDz3c
         /KqBkQMe4HZvIYPfm/Q4Fj2R0q1L+Y6n3yo9mpWc/7QINyfciOuJ+CEbUu90eoA8MsvO
         wLL1YBsaHOMLuSkbDqCbZ9yRM0epZd8t+yVGMB3d8hKZuPMjQJ+ZfC32vFaybi9/L+Qe
         Dkpf6LxbuzCH8EAmobz/VVimGkbsUIwtpxwKTeXhIW6f5qb14YamDSOJ9PS+hG7NAuW2
         KNnSDh8AQ2ixJUAHn2Q/qJKMWDQkFBR147zZRAozzgYpU11id1HWzvLMCBtWMRFKVnD3
         bwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wLWYmfFySAd0GACOj4/rphI/57VoRcvb+5EekgbbspY=;
        b=DgZTC3FvhqbNcgwKRK6zAMee9A0czaRwLgsED4Pk1mh3EFpbNxGbc3WPlw8WLN0/c+
         N1G8HKfso1CAj5tIVz40KIKUzgyr215ouhWXH93JqohKG2I4s4i3su84D9uBvgQwpVco
         TPuG88a6+AzyDXN84Sd/FRT/8qwFC0YDQJJajixhrO9+K0yqfM57ZDGz7zjG7vL4Vli9
         K7/HeURrUzOtUzLrsCynStv91uSBE8tgqgd3Pwe3iYYlpBS8wh8da50t8106zDwdfjsm
         IwB9cmOKHmp2MKtjAoplV9w/uH3fRANXEulsryc2kNrrCMolQYAJm3M/CgSnOlw7UK90
         mDPQ==
X-Gm-Message-State: ACrzQf25l6WGpcpDimGjQ1Au7y0dayi7Bg6sk6NnfgXOnymRB7DpX+Xu
        o4d65b34w27tgElWwkgrRZHrBA==
X-Google-Smtp-Source: AMsMyM7ruRMzAu8IGLLKYxSovEqEH/m8RWT1TTaVupSf2kDnDsYqaynyezwuWSmpP6dyNWjHeKLljA==
X-Received: by 2002:a17:902:e841:b0:177:82b6:e6f7 with SMTP id t1-20020a170902e84100b0017782b6e6f7mr27664517plg.66.1664284027853;
        Tue, 27 Sep 2022 06:07:07 -0700 (PDT)
Received: from [10.255.19.83] ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id f22-20020a63f116000000b0042a713dd68csm1515083pgi.53.2022.09.27.06.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:07:07 -0700 (PDT)
Message-ID: <9a0130ce-6528-6652-5a8e-3612c5de2d96@bytedance.com>
Date:   Tue, 27 Sep 2022 21:07:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [External] Re: [RFC] proc: Add a new isolated /proc/pid/mempolicy
 type.
Content-Language: en-US
To:     Michal Hocko <mhocko@suse.com>
Cc:     Zhongkun He <hezhongkun.hzk@bytedance.com>, corbet@lwn.net,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20220926091033.340-1-hezhongkun.hzk@bytedance.com>
 <YzF3aaLvEvFhTQa3@dhcp22.suse.cz>
 <24b20953-eca9-eef7-8e60-301080a17d2d@bytedance.com>
 <YzGya2Q3iuWS2WdM@dhcp22.suse.cz>
 <7ac9abce-4458-982b-6c04-f9569a78c0da@bytedance.com>
 <YzLVTxGHgYp3Es4t@dhcp22.suse.cz>
From:   Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <YzLVTxGHgYp3Es4t@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/27/22 6:49 PM, Michal Hocko wrote:
> On Tue 27-09-22 11:20:54, Abel Wu wrote:
> [...]
>>>> Btw.in order to add per-thread-group mempolicy, is it possible to add
>>>> mempolicy in mm_struct?
>>>
>>> I dunno. This would make the mempolicy interface even more confusing.
>>> Per mm behavior makes a lot of sense but we already do have per-thread
>>> semantic so I would stick to it rather than introducing a new semantic.
>>>
>>> Why is this really important?
>>
>> We want soft control on memory footprint of background jobs by applying
>> NUMA preferences when necessary, so the impact on different NUMA nodes
>> can be managed to some extent. These NUMA preferences are given by the
>> control panel, and it might not be suitable to overwrite the tasks with
>> specific memory policies already (or vice versa).
> 
> Maybe the answer is somehow implicit but I do not really see any
> argument for the per thread-group semantic here. In other words why a
> new interface has to cover more than the local [sg]et_mempolicy?
> I can see convenience as one potential argument. Also if there is a
> requirement to change the policy in atomic way then this would require a
> single syscall.

Convenience is not our major concern. A well-tuned workload can have
specific memory policies for different tasks/vmas in one process, and
this can be achieved by set_mempolicy()/mbind() respectively. While
other workloads are not, they don't care where the memory residents,
so the impact they brought on the co-located workloads might vary in
different NUMA nodes.

The control panel, which has a full knowledge of workload profiling,
may want to interfere the behavior of the non-mempolicied processes
by giving them NUMA preferences, to better serve the co-located jobs.

So in this scenario, a process's memory policy can be assigned by two
objects dynamically:

  a) the process itself, through set_mempolicy()/mbind()
  b) the control panel, but API is not available right now

Considering the two policies should not fight each other, it sounds
reasonable to introduce a new syscall to assign memory policy to a
process through struct mm_struct.


