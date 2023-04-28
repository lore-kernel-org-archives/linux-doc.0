Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5785C77B60
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 07:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345826AbjD1HsQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Apr 2023 03:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345525AbjD1Hr7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Apr 2023 03:47:59 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9122D6197
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 00:46:23 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a66888cb89so73247345ad.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1682667925; x=1685259925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xoe5HpGF9vZnqLd03J3yds9FnNAjqjJWeyLDyyNqms4=;
        b=gy5+wiMc32xSHzrr0S2/8xoO/E0Nq2p8Kd9U8o1eaNVb2oeiLMK99wCeuoEirqa12w
         J8sD50eYLyVgX3jMKuJe9EkXUCP4m33HE2q+QCZ4C7jXAg8PGT59JJsRthLKRTUandO9
         1fE8JTl5Xkrkys6V94qGl6dspIzpWi3cpqVx29YhfmkC/WHUuGUvFj2tKY8WVhyYZ5HE
         69FZ7jR75TGeLS0Sm/TZgeyJ/7Gus1EW3wIjjRNe7nLBuhFY/GSGBlZwxOlkVFxa4bSI
         MG24ZylaDijVesM/+ON79Lgz7N4sNz7uO1Ch2vjrv9hTJ89+VpZyE/r7TJHWPdhtOsnX
         V7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682667925; x=1685259925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xoe5HpGF9vZnqLd03J3yds9FnNAjqjJWeyLDyyNqms4=;
        b=I3WzagR70YQboKZcrcylGgkmv7Ew+GyAomqtNXUtgTVkaBPIEBMpyVeG/IpgdAlWvQ
         H5zOSJ9TDUGBSi3kexSaExz/53oGPjEupQgGDn2N7qe7v8D5OKP+GoZ59f9cA355n31S
         WRUPOac45942hj5hX3qXLwQz2nN7KLhXxp9XmzJz37gG9VXlDeJKRuxIVyLLUI54ZZ5c
         4rVxcqmoUQkdOfChgD1WpgNNyoXXYp78hs/CusRiCNd7XvR+pCf/U/qsvhlLOzxpB33k
         FhrkNFJxa0RDQCrR/OBTRTAZsC9ngnAKKoLsQamnSIvvV0V7+rMtoUemiPILBd9/iseI
         cAVw==
X-Gm-Message-State: AC+VfDxbsFkGVkoM4ktBjH+upNrcuzaX/rz2ZDmqHRP6gi81NmPJmmeU
        zAOTc9H395ToetrW/3PivPw1DQ==
X-Google-Smtp-Source: ACHHUZ6ZESvfhR8LIslq4fdn2ZOXMRlLNtFud+KKn77WEJxdYrYtyMuMDIFr0dPVM+ApZg6vGhOUIw==
X-Received: by 2002:a17:903:2348:b0:1a6:7ed0:147e with SMTP id c8-20020a170903234800b001a67ed0147emr5026755plh.33.1682667925031;
        Fri, 28 Apr 2023 00:45:25 -0700 (PDT)
Received: from [10.2.117.253] ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902dad000b00194caf3e975sm12693998plx.208.2023.04.28.00.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 00:45:24 -0700 (PDT)
Message-ID: <9befca58-2425-5b4f-2dab-98b3ed4037ac@bytedance.com>
Date:   Fri, 28 Apr 2023 15:45:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: Re: [PATCH v6 0/2] sched/numa: add per-process numa_balancing
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>
References: <20230412140701.58337-1-ligang.bdlg@bytedance.com>
 <9ba3577b-0098-86da-ff2e-636cb5a8ae1a@bytedance.com>
 <76534699-e270-b450-c18e-f7c35c325bcf@gmail.com>
From:   Gang Li <ligang.bdlg@bytedance.com>
In-Reply-To: <76534699-e270-b450-c18e-f7c35c325bcf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you.

I'll keep an eye on the progress.

On 2023/4/28 15:40, Bagas Sanjaya wrote:
> On 4/27/23 12:17, Gang Li wrote:
>> Hi,
>>
>> Looks like there are no objections or comments. Do you have any ideas?
>>
>> Can we merge this patch in the next merge window.
>>
> 
> We're at 6.4 merge window, so the maintainer focus is to send PR updates
> to Linus. And this series didn't get applied before this merge window.
> Wait until 6.4-rc1 is out and reroll.
> 
> Thanks.
> 
