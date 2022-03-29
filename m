Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F3AC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 12:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236216AbiC2MRO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 08:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiC2MRN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 08:17:13 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD59235870
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 05:15:30 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id j13so17436082plj.8
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 05:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YfApOhHTVAmeFLGlimnHex3IRdXH9OlxhzDzom5I7C4=;
        b=dLFm5bP9wSrdo9/5ECEkDGf+79JIqBue3V7fVrC8Vr3hC7WUgJ4syCn52Kx8QolON8
         SKMr54lqVm2R20N6rpCn5XVFLf1NpbjALZtd+KKsIUcGqhgvEPwSKHMHHhVSsEUzuGGC
         Vn6LnvUrEjqryc+aJikcMYXal+yzM1tpMidKyQzjznLLa26mcGPsJRircQXmGMNyz0+7
         3cKaGjvU6em0fk9A93kQNQIxvyTxnTpAXbGQ5/wockXy+dZ6bRiKx/8b/b/MP+PIgvfO
         E/FoQf7b/xdHNB7Gk7/l+3c1IKYxCfsUP9ylqWsyKY7GfgAZHKzcdDzy7vaYSbmbSKHh
         8xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YfApOhHTVAmeFLGlimnHex3IRdXH9OlxhzDzom5I7C4=;
        b=2SCdEnQnOPY9TNW3X04WaJbBbRZmwpSyJNRnuKnWgVzDgQE/CCz9voq1q/VotA7YNo
         +u1ZVpsm0hUMqAmQj2Fi/1q5GEeQVaKgvwuvTnn2Xd6qxQiuiMUlxlBKo3zqp0FYpqrU
         AXU3JfOgvciuyB1TGzOrxaZd06N8Q2wzRkirSDl++Lsw0fBRqjaYx4cX6sGV+D1uWtM5
         i+MdwSVh+JZ/qqC6TfZ8+dr6SW4OkDG+feKIyUKDNzHdxWKbimdCuYOh6xx3pe6ZK/Jm
         pqgQ8PJZn6tNlxhtXIyxce0n7lMLaM24Q4OFfmq6euaUVLtOwukvWhzO9mYFCrZjSbv0
         dR/w==
X-Gm-Message-State: AOAM532fV3pweAakFAmh+DK2TZV+4GSl6qKBPGw1sqGzbIEPeHKaTfmz
        LCBaamjIwDKz9m+vEw3+PB4=
X-Google-Smtp-Source: ABdhPJxWvougn4Pj5xyQuzdpKyoHw8N2JvQOJvanHhMwBUqj27J5hN2IfODF0Kf9k2OU8vFe6Lzfrw==
X-Received: by 2002:a17:90b:3a82:b0:1c7:bc91:a87e with SMTP id om2-20020a17090b3a8200b001c7bc91a87emr4266303pjb.7.1648556130203;
        Tue, 29 Mar 2022 05:15:30 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-29.three.co.id. [180.214.232.29])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090a890c00b001b8efcf8e48sm2741886pjn.14.2022.03.29.05.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 05:15:29 -0700 (PDT)
Message-ID: <f960c2d6-e3c5-f452-488f-bba3dada57ec@gmail.com>
Date:   Tue, 29 Mar 2022 19:15:26 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] Documentation: kernel-doc: Promote two chapter
 headings to page title
Content-Language: en-US
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
References: <20220328065030.24936-1-bagasdotme@gmail.com>
 <20220328065030.24936-2-bagasdotme@gmail.com>
 <6a5ce717-cc0a-9b7c-ba08-88e3b9f760bb@gmail.com>
 <b92e00a1-04e4-c1e2-42a8-16d87d3d0183@gmail.com>
 <d3db3281-6cf2-51a9-c3ca-9fdae309de34@gmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <d3db3281-6cf2-51a9-c3ca-9fdae309de34@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/03/22 15.25, Akira Yokosawa wrote:
> [Dropped irrelevant CCs]
> 
> Hi Bagas,
> 
> First of all, can I ask you to refrain from submitting new versions
> everyday?  It is one of the most frowned-upon behavior in the kernel
> community.
> 
> See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#don-t-get-discouraged-or-impatient
> 
> I'm intentionally ignoring v4.
> 

Thanks, dropping it.

-- 
An old man doll... just what I always wanted! - Clara
