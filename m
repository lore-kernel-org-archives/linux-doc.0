Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17436C43461
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 21:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC02C221E2
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 21:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599773196;
	bh=EGGRXEBv6CclhyAie23vww9GmqDRCj/65CuSeGJxxG0=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=qTka9cnU2pasusDOjF+ztIdbR4YBl27bGZbVhJJXBaCze8iWUkVrmB8fIJWJSkc/Q
	 GHYkaa4rYsFYpoaXX+5vq9xMlXwQTAExJr+fIu+utloWX55UMIpvKo8dRf5QLFKfZ0
	 sKYm7pKX+nRUHkGFw4ZEjI5DMEpytUC9+2LS9+78=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbgIJV0g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 17:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730403AbgIJOXG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 10:23:06 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C3AC06179E
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 07:10:58 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id a19so1193288ilq.10
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZJnJs8vNdF1wP9aLBCzGabaxQxUsTtglU7hU8j+gZEY=;
        b=hvo+fr9Yln8JetuGtTjqIFv+2TLIvn6Rn/7c9U7e2qYqdviGUYuoisvGVPcaNZyZsg
         wWW+P3xsgfnkVC3hoPch9gKhLnpSiXPNmEU+rbRMtTHLYvl7z2Fs7wBIxmmOb0CAXFib
         sMFaRLjx/pNkR190V8TCooR6vii9nHQw19DWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZJnJs8vNdF1wP9aLBCzGabaxQxUsTtglU7hU8j+gZEY=;
        b=XIyJ3TbIytS6FLJ1+HUPE0G+P2+0sE328kf1QoKU00rbdKwVdVUY7zcRHYPmCKKOhw
         msY4WjBFavsU2jcNBKWHelFgH9s73r5IyjWOjbBMv6MZqv2YO55Q2TfefxLl+Gigby62
         RfVciFvy7sDE8ZLQB/5LPRrPZocJzCH2vfupLHmpKCHG6/yT+vcnPG6RcM0mY+neyjWG
         GJcMVTmon0Uhptw40+31UQkm7p56+UrEiVHCsQJbwTpT9Q6iYntJCaF7IXq2kWOBIdr1
         24vp6rRkJysrvQgvmPOjcDg0W+OQL8SwZeWaNAP8/k4r3m3jHmSooYnTujGDIGHr1746
         2wqA==
X-Gm-Message-State: AOAM532nWPvEPrJHfH1IgtXYEwvphPFMTGXoV+9+8i6Q3Opl68Ffdcde
        4OleIACwqUeJBhzbJlvlhVr3Cw==
X-Google-Smtp-Source: ABdhPJyvQbZVznJNNJizOCvgulAwN47Npavr3DbFPT7h3sHAcICA5Cp6cueyl9J0d1M9fE2qVc3r2g==
X-Received: by 2002:a92:7a0a:: with SMTP id v10mr7012115ilc.99.1599747056972;
        Thu, 10 Sep 2020 07:10:56 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w8sm3276471ilc.85.2020.09.10.07.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 07:10:56 -0700 (PDT)
Subject: Re: [RFC PATCHv2] selftests/run_kselftest.sh: make each test
 individually selectable
To:     Hangbin Liu <liuhangbin@gmail.com>, linux-kselftest@vger.kernel.org
Cc:     Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20200309101256.868-1-liuhangbin@gmail.com>
 <20200316072626.24037-1-liuhangbin@gmail.com>
 <CAPwn2JR=WzpuMjA=x+39GFAbXpTFLt16bcD37LyfH5NtU=Mqvw@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <accf2bd8-086a-1047-e751-cf79df008fc7@linuxfoundation.org>
Date:   Thu, 10 Sep 2020 08:10:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPwn2JR=WzpuMjA=x+39GFAbXpTFLt16bcD37LyfH5NtU=Mqvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/9/20 7:20 PM, Hangbin Liu wrote:
> Hi Shuah,
> 
> What do you think of this change? Any comments?
> If you are OK, I can rebase the patch and repost it.
> 
> Thanks

Looks like a good addition to me. Please rebase and send
the patch to everybody get_maintainers.pl recommends.

thanks,
-- Shuah
