Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEB9C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36BB161006
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 04:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhDAEst (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 00:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDAEsh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:48:37 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D77C0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:48:37 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id v10so760296pgs.12
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k3XKZ3X2roLd3J9CBGVYTihNfX4riQORgLIKFItPtXQ=;
        b=FLH4kPje1BCsqiUc3BhO32k6Kl71FE/36E3Dj3H5I9XFIlmBiiOINHj/QKL+WlDVmp
         lfwoKSR44IUeAbfgEUEn4qc7zB+leFFtW6gYngCMxcwwCS7XHGTFZ+JRJcmHByWaYsdH
         XQzQVPLbOMFvJQhv0/F8Ex3jmoGhcs5apkPudNq8mHkF8dAh8w/bvMppR4bw7fhgfytG
         +i50LF6X4y3yWbgpUgyHu0JiPPlFHBSwPSE4CPeNQTkTE/JKb7izNeH1m0XaG/hRuyvF
         G3HstVMAbT64dAtzk9JXFK5TCltoRRx2N/aQIdmskBd8BfVo8HGLKA79jMLNI5XxqzVs
         rL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k3XKZ3X2roLd3J9CBGVYTihNfX4riQORgLIKFItPtXQ=;
        b=mczdG557mp461RSG9+WSDH2iX9pszoaKHZEJdrBU9LuaKaIX+QHIknvBh14/pC+oct
         xe0cdV/zDwcmAoAG/3Uhczdj0l9Nq5wJrlOg5UbeUln4iMNsR5oMXPff/UoPYZre/pZe
         Hr9GZVsuSCWCD5Ui4IyoFPjzJfJUURlkGuiTfCaL9Xoi7ejzZ4LT5yGyIYoXKLq3jUoi
         byClH5zNw1g53E4AKdSAc1kML5/jiurtBIrSGRQU/dC+2UAF3WYA53KIfV9jh2qgKCLO
         uA1ePRRejS/ecGyH/TNVj7muI/EdBWLKd6b8DsrQx1EEQ9n/9fkapLHfAxsJp1n5ANfy
         5vVA==
X-Gm-Message-State: AOAM530WaJyiCazwc7Mao6PSUu2P6GZ3n+rYnqU63ob+Ynopr6GGktXr
        LQfTveiD/Yd8++wBAW31wIo=
X-Google-Smtp-Source: ABdhPJwAQBsjkPEs/foVIYs656PFw0RRWaOqCR9zLQYOG07ltuFRW+yN03h1zmAD7ajFUwehHfTBEw==
X-Received: by 2002:a63:5a0c:: with SMTP id o12mr5978807pgb.76.1617252516918;
        Wed, 31 Mar 2021 21:48:36 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id cp22sm3790039pjb.15.2021.03.31.21.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:48:36 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst
 translation
To:     "Wu X.C." <bobwxc@email.cn>, yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
References: <20210329025144.9776-1-siyanteng@loongson.cn>
 <20210329025144.9776-4-siyanteng@loongson.cn> <20210329062342.GB8845@mipc>
 <CAEensMxBMjT1D31-dbQ2Y14Rp61=-vuxmoej2-Xyyw6w1K7Dnw@mail.gmail.com>
 <20210329131357.GA5608@mipc>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <c82683b1-3f8a-55e0-52e2-b38d8ad0ff9a@gmail.com>
Date:   Thu, 1 Apr 2021 12:48:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210329131357.GA5608@mipc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/3/29 下午9:13, Wu X.C. wrote:
> On Mon, Mar 29, 2021 at 08:19:23PM +0800, yanteng si wrote:
>> Hi~
>>
>> Do you mind if I add the following?
>>
>> +:校译:
>> +
>> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> 
> Ah, thank you very much.
> 
> I really appreciate your willingness to do so. It's really an honor, 
> but I have only done some minor work. :) Just put it on hold. 
> Many people will review your works continually. If someone modify your 
> translation later, add them.

Hi Xiangcheng,

You are so humble. :)
Compare to a honor of your sign, I'd like to see more responsibility from
the signing. So please take it if it's passed your review. And also a 
"reviewed-by:" is another kind of generous commitment. :)

Thanks
Alex
 
> 
> Sincerely,
> Wu X.C.
> 
