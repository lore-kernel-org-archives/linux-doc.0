Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC1EC32771
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 14:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbiIZOfj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbiIZOer (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 10:34:47 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51CF788A0F
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 05:53:25 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 129so5029114pgc.5
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=JfI/MQ3cqMqiBUWply4+srFdGKgWiHs9QbzXGnedrjw=;
        b=py/jOoP+LNdmJsrwUiecLbM+RTy9qdwEEAUALnxViUcmpv12jPLZ1j8G3Pfx7DLDqV
         K99WGoTIFAGynejfWry3s0e5BHXkn0fc2ohyqEpW0Evq54sfrnUjTnwSrmsvgRz+BRqo
         k/Lzkdml0LQ6B0ieqaNEV73WkMwrBW4yi/P9OYlCbEW6X3FUNcd3N4VpE2fdgeEXPM70
         JpCnbC5hJuxY73hbCc6CnKtUyCoyoBco8sXVwsObAYGR/2GGLe4ZcYGdFRSYrxpyLa35
         z32e9L5Ukv6DsMO6XpMMJErLNKv9h9nndfxOliXE3TUOnAE9XbqHiG2IoRhKG0sJfqOF
         zYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=JfI/MQ3cqMqiBUWply4+srFdGKgWiHs9QbzXGnedrjw=;
        b=qrjLuhyz6fGDsMQ+s23VBYqIYiEXGy43LfoYauc96gQsna1doKhI3jkKfCfH8LpuGz
         CZ1apIvsORxUO3skAlwCP1pwxVs5biBPOs3SMssr0T4qwozzrqYyb1m426OCx3Rrgx6i
         551pa0jGZNLwbPqn0MKVJ4ijUSL82I8qJM1facSluyxFg86vKTcseziSKFdx3BkuY2SW
         01bcaxdDntjrQ8dOHI11pbEG/bqmx/6Vbn02qFOk4B8bYWG5MOxl0ddYG5WkEwDarhAI
         A0JvbLPZJAzpm6/T/gQp6T224tF6FY9hUXeyiB3jN+i2+mctngB2nhAe27Zw7LU7seAD
         fy5Q==
X-Gm-Message-State: ACrzQf1c/25BIXZ7Ckse4/kr3m6f/9wRSbxtEW37ZtbbllavEWVPO7DM
        1xLh+a901jcIjE50sOaqGhnrhQ==
X-Google-Smtp-Source: AMsMyM4pRwA8C32gEkFcBudu2gl4n1YxKWuI7PaQvRSdl0XKQx52Sa6xuC252+HH/8g8/i7QCjy3LA==
X-Received: by 2002:a62:6085:0:b0:53e:7874:5067 with SMTP id u127-20020a626085000000b0053e78745067mr23937829pfb.4.1664196804856;
        Mon, 26 Sep 2022 05:53:24 -0700 (PDT)
Received: from [10.68.76.92] ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id q20-20020aa78434000000b0053fcb800ec0sm12107196pfn.9.2022.09.26.05.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 05:53:24 -0700 (PDT)
Message-ID: <24b20953-eca9-eef7-8e60-301080a17d2d@bytedance.com>
Date:   Mon, 26 Sep 2022 20:53:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [External] Re: [RFC] proc: Add a new isolated /proc/pid/mempolicy
 type.
To:     Michal Hocko <mhocko@suse.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        wuyun.abel@bytedance.com
References: <20220926091033.340-1-hezhongkun.hzk@bytedance.com>
 <YzF3aaLvEvFhTQa3@dhcp22.suse.cz>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <YzF3aaLvEvFhTQa3@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> [Cc linux-api - please do so for any patches making/updating
> kernel<->user interfaces]
> 
> 
> On Mon 26-09-22 17:10:33, hezhongkun wrote:
>> From: Zhongkun He <hezhongkun.hzk@bytedance.com>
>>
>> /proc/pid/mempolicy can be used to check and adjust the userspace task's
>> mempolicy dynamically.In many case, the application and the control plane
>> are two separate systems. When the application is created, it doesn't know
>> how to use memory, and it doesn't care. The control plane will decide the
>> memory usage policy based on different reasons.In that case, we can
>> dynamically adjust the mempolicy using /proc/pid/mempolicy interface.
> 
> Is there any reason to make it procfs interface rather than pidfd one?

Hi michal,  thanks for your reply.

I just think that it is easy to display and adjust the mempolicy using 
procfs. But it may not be suitable, I will send a pidfd_set_mempolicy 
patch later.

Btw.in order to add per-thread-group mempolicy, is it possible to add 
mempolicy in mm_struct?


