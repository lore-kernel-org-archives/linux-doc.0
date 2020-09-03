Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1131EC43461
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 14:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D301C2072A
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 14:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MB4dl5UH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbgICOsw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 10:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbgICOWU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 10:22:20 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4219FC061247;
        Thu,  3 Sep 2020 07:21:53 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h12so2260767pgm.7;
        Thu, 03 Sep 2020 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pj7ZEa7B2UgPnwhBiY5PHRS6mRxiKDa+9/aWldMxXZg=;
        b=MB4dl5UHJMLEepcNb8gBmywFKXlLS5jf8KvnwztwZfd6lraxS/6PQSyjEv1M2+iDPh
         8ZZz4XNo8BzSP3NhmTR57to07WN8ELnJqaC9y41x3m0Kmwl8cZDFJIbWi3czAWrGo4Jn
         A0XK+OA36mm/kv9zsvTSMZXqNhSkSSpbE10KMOux1FTQMrlDw5HvZVXTzL6Z+ybuxwRn
         iG5tdozF8vgoE0HUjWtMMGwxYtFfItnf4ulwxZdS8oW8q4MPYYDmtjWT+KGokKFc/ojN
         JE8dLU30KURSG6gO9Az8DIAudDmA7bQ7Ny9bvKupdOqFngmjxqA5z0GrS+mx+5l8rbl7
         0M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pj7ZEa7B2UgPnwhBiY5PHRS6mRxiKDa+9/aWldMxXZg=;
        b=SKsSyhHWbiU0jIeP2j+QnF6prVFbmn4xzzPEN4UfLHFXU+bN/P2+VrmCMAh+Mdl90c
         +HSHtmEq4UWvn3SA9L50ZV9+sOoKyhEf34n5KuUpQSNuSJxMT0xgSPROtA/VWApDTHav
         SzFmX7AOWaT7mgUMzr6j4kyph+ZqjnFFG0Z2nOoeKdCZrFyr6/fMvboqexln8GsVf+nb
         29zWNQ9CnPchT6bm5UhvUE9Ff04jLuKMEmAtqvts8e40gLjdFKbGqxSFzBvg5FdVyG2N
         hTgkVnHuhJa4k7ZURkZc+r8yFAjVnxlEooTu40Pa0w3IxXtaDo5wIjE+gV3Pvzv9vpii
         92BA==
X-Gm-Message-State: AOAM532SJ1P2TWqgYxe9jqhitsUvlEQ1Kxy72Vw8tmFM3NY70k3IOlRE
        DfP1JYrh4GwmmwUtXvigS7Qwr9jtVW4=
X-Google-Smtp-Source: ABdhPJzpoqY0tpXcZF2ratDQLsgk6IQez1dwLsaWo3nPB3AsQ+AOBT4nELos8ePMxGM71f8yBx/Kkg==
X-Received: by 2002:a17:902:758d:: with SMTP id j13mr4189581pll.174.1599142912788;
        Thu, 03 Sep 2020 07:21:52 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id t33sm2980489pga.72.2020.09.03.07.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 07:21:51 -0700 (PDT)
Subject: Re: [PATCH] doc: net: dsa: Fix typo in config code sample
To:     Paul Barker <pbarker@konsulko.com>, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        "David S . Miller" <davem@davemloft.net>
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        trivial@kernel.org
References: <20200903084925.124494-1-pbarker@konsulko.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4f50fcff-a253-647b-3b81-08662a56f278@gmail.com>
Date:   Thu, 3 Sep 2020 07:21:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200903084925.124494-1-pbarker@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 9/3/2020 1:49 AM, Paul Barker wrote:
> In the "single port" example code for configuring a DSA switch without
> tagging support from userspace the command to bring up the "lan2" link
> was typo'd.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Ah yes, thanks!
-- 
Florian
