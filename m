Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC66C25B0E
	for <linux-doc@archiver.kernel.org>; Tue, 16 Aug 2022 14:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235483AbiHPOBo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Aug 2022 10:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbiHPOBn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Aug 2022 10:01:43 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D895A6C11A
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 07:01:41 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id t3so1426418ply.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=erk4QjfKLI1wqXEF6e5iSvx1UiCDlKAdjqB4/lN4Erk=;
        b=Y0g/2vtkm1HDsEQno8ZsLNKBwZANZXHmx08W3wcN28MC03rqN8MuI64iRs+rHEj/xM
         Mhgh3CWWqwIHvp1zbpwHD9c7qXg8eE0IRMI8lE/Bs7Oc8V/33m9VXiuhskmTBfgxD9NZ
         Mq62JekBPMAcUxs3Ilcqg2rqG1qAlFVad2zD270PHvYGPCENWlJsVUgAAgaml9ycj8+R
         a3jNEi3vDV1kpIpykK09HTqW8zI8WIjy7FGbgBfUo8YJAns9J0U7Fg6u4PI2mpVSLveW
         3onWPrEs8plVxEpuEm8C8LSAqbQuxfh0aI9mUsW5fx9yeIMqQ/EHbVhAWxDUX3eJSAq/
         eMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=erk4QjfKLI1wqXEF6e5iSvx1UiCDlKAdjqB4/lN4Erk=;
        b=quH+ms/i6d9/1RtSFD/Thib8sF849AnL6DxFj0P4VijJ1f2aiaLkksXFHZuMPCNgfv
         +atecZ/UqiXk1Anq+qupcBbmMtyYDCJp71hotAIihThx4B0sa/zCmxKrNmMaQ8bGTQNJ
         IlPMOSLMkdFgog94qYmtmMje7E4tyzyz29cXzNtB/pWlLZtJXcB4BXdiBK47VLsxOXBw
         0YDW0Ji4Q8Xf5F8QmKCzdwzO4bf9Ubn5aMl2NGghyripb1Zg5eX0xnj84ji77p5qqjTq
         cWl2ZZYSDV3q1xK4jhWmBY7QuH2mxbBGSC+LFHrQj/MiU+6NECGL8XcAHYUhJpgWFy+E
         xypA==
X-Gm-Message-State: ACgBeo02apuKGxILcXZQwn9ls9oTZ7ErrkYljvc7ULqiCdZvfcC1IjVH
        l7siuDaR1UgnmlyGxOrbh4Ug1Q==
X-Google-Smtp-Source: AA6agR5Vh5FoZEV/vDsCM3Tgms3lMElLgMMSYRP2EDYbKRNWdE3cxEILRzOEG90g4VS6xpelMOT0Tw==
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id b17-20020a170903229100b0016ecf555c72mr22182498plh.121.1660658501401;
        Tue, 16 Aug 2022 07:01:41 -0700 (PDT)
Received: from [10.4.196.37] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id r35-20020a17090a43a600b001f522180d46sm6396363pjg.8.2022.08.16.07.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 07:01:41 -0700 (PDT)
Message-ID: <08ec9c4f-80b2-f731-aa8b-fb4e852ece25@bytedance.com>
Date:   Tue, 16 Aug 2022 22:01:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 00/10] sched/psi: some optimization and extension
Content-Language: en-US
To:     =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
Cc:     hannes@cmpxchg.org, tj@kernel.org, corbet@lwn.net,
        surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com
References: <20220808110341.15799-1-zhouchengming@bytedance.com>
 <20220815132514.GB22640@blackbody.suse.cz>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <20220815132514.GB22640@blackbody.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/8/15 21:25, Michal Koutný wrote:
> On Mon, Aug 08, 2022 at 07:03:31PM +0800, Chengming Zhou <zhouchengming@bytedance.com> wrote:
>> This patch series are some optimization and extension for PSI,
> 
> BTW do you have some numbers/example how much these modifications save
> when aggregated together?
> 

I lost my test data last time, I will use mmtests/config-scheduler-perfpipe
to get some performance numbers right now.

Thanks.
