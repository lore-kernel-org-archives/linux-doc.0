Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B50ECAAD8
	for <linux-doc@archiver.kernel.org>; Thu, 22 Sep 2022 02:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiIVCNR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 22:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiIVCNQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 22:13:16 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062419AF86
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 19:13:15 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id jm5so6458106plb.13
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 19:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5JuEdZib93/mRGmpoSVPHNyLaJxdh8tRUlgzrtp9wVc=;
        b=cVOfxQTOxFRzzqtXS5x+p0l1YYT70GWE5aTURbU48eFqUMnq2JVJuU9tPEi9BAlq3R
         tEdKBKSo8gc5/xJsRtlUy2AJLqn6nK84zSmmaQhgaFPw2nMFyL+MCwnsRR6xHf/nvhMk
         wz2hIl5HwSDRZOIpNW469kTVdOT7VGqfPc1a2ZGhCUQz1IYVLH0TpRva4JNRvOqJcwix
         Z4pq1lf9HvL34xodo0WGeKHk9Ps2c3+N4+DrIO92uPDgSXgiwgDtMpZnBMxye8AR5tSr
         RerrxhWUgrhYhr6epdrSeqIJDhnHKfdU4mCmSg0rMeaXEakG+Cfpq1xLUEZmGgKkXBdI
         uRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5JuEdZib93/mRGmpoSVPHNyLaJxdh8tRUlgzrtp9wVc=;
        b=Y2IXZHIbIc1ZkUgDTJPFOFHWa3RoteZTLrkkypfAL5zjaaQGm/KxPELkef0FmBk29p
         pHaMvIPIAC1hqY1K9skV9YXEl0GxTXU2XZ+OIJPnqI2jiBEezjiJ5Pb7IxoH18i/opbE
         2eHCNd9dxm1Gcl1lBHfE4TnFNMgeYJhszkqFFtEtiGUoNt5h6YhIVXMeRHQR020MrDhQ
         OtFm7TDyFqZbzrwWIMz8c1LVwBgG/C07qr4GMCPOSPUflRW684UimhGdgD79Ru3W3R4B
         NqSEKa92rB8GfhddvHA+/QlHSz/o46xxqiU6d8XoGXVg2NyYmHX08fIV4nmDt8TAlAai
         8f5w==
X-Gm-Message-State: ACrzQf1uqRpJ1LySfyYKW4VkpuklKOfkqPPugIz1nBx7uC5Qb/DhdlzD
        srd2cOtt1ZnL/+zclScurysH1u2LLJU=
X-Google-Smtp-Source: AMsMyM7q56jRcwvN33ZgC5FPtyQEKIvF/lQ3+p3FBthXnmlvmYohqiIc9J+ZCQx7TQUflplrvClmGg==
X-Received: by 2002:a17:902:720b:b0:178:83e9:11ec with SMTP id ba11-20020a170902720b00b0017883e911ecmr1016436plb.34.1663812794540;
        Wed, 21 Sep 2022 19:13:14 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id bg18-20020a056a02011200b00434feb1841dsm2490646pgb.66.2022.09.21.19.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 19:13:13 -0700 (PDT)
Message-ID: <81cae8f1-67e9-37ba-4bfd-566c877944ca@gmail.com>
Date:   Thu, 22 Sep 2022 09:13:08 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND] Documentation: kprobetrace: Improve readability
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>,
        Yoann Congal <yoann.congal@smile.fr>, linux-doc@vger.kernel.org
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>
References: <20220915153358.813993-1-yoann.congal@smile.fr>
 <87r104tr6o.fsf@meer.lwn.net>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87r104tr6o.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/22/22 03:20, Jonathan Corbet wrote:
> Yoann Congal <yoann.congal@smile.fr> writes:
> 
>> Improve readability of kprobetrace documentation by adding markup
>> (mainly code snippets), fixing some typos and splitting some paragraphs.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  Documentation/trace/kprobetrace.rst | 128 ++++++++++++++--------------
>>  1 file changed, 66 insertions(+), 62 deletions(-)
> 
> A couple of comments here.
> 
> - There's enough in this patch that I think one of the relevant
>   maintainers should have a look.  MAINTAINERS is silent on who is
>   responsible for this file, so I've CC'd a couple of likely suspects.
> 

Hi jon,

I think this is Andrew Morton is also likely candidate for reviewing this
(maintainer of last resort). CC'ing him and linux-mm people.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
