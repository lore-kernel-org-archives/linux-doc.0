Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D9EC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 13:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237043AbiC2NDc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 09:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbiC2NDc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 09:03:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA03939C3
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 06:01:49 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o3-20020a17090a3d4300b001c6bc749227so2768053pjf.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hi1mRfqGHWML8heyoHRN2/3s8Jmw/ktIqDrTbmEpH7s=;
        b=By634QxnWNY/EPFS+Mz5/z4RzQ+y6WAyPWdJYq+UaCQ7bNf2E7T206naVXdcmJFCQX
         njU2H70S07pn3+Jujm9p4tvgt8z99bAf5D2h9z142YVyw5A5epRb/MAzZMa8Z1HSjICK
         ulwWfe+lQbphLpSEscItzRU+lXX0h0+U/Tduw2/3HaS3wV9FzYjybjuUoSDdAdl1Mt+l
         aFT861F8bQeB+ACNlBOLkEfVv1kUMCCh5YUhsP69ZmcxweIVHWlq0ZvRYjoWB1iZ3Akx
         7CkT5hbpvqu6oEalfAbl4bhCMZI1fOje9zUHLLLcm69PL0iOYo2MhXDXI6u4EosQbMqQ
         jKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hi1mRfqGHWML8heyoHRN2/3s8Jmw/ktIqDrTbmEpH7s=;
        b=bmMFKWeQbU60/rPVrVJ1xq3qSYOqR7HZruBV/AQ4bjtejiVZj6b7oxYSidgmJBuqVW
         LRTGxBv2sVme60qmjZSN0aOtxAi2Z0ji0Q8iP7kNNwNJxyIV+uO/rQHaXboX5PcqULUe
         ua4Q3b8RXKg3F5tH74Tk1LyG9sw1LAYZOpGGUy/igAxNfKTizl2X4UsHGAK77Djh7cP3
         o5uRNU3QoctHFBwJMSUwlnJnypD6m9euX7VCZdSlPpT/tBpRBstfqnIpGFMdYles5Mhy
         Hn3HLlHw0PoM7OZR9YnecVbKY1Ed5fahm3NfvLM3/Q1YAuJM+G9pdp7mWCvVaD0d7MtT
         jQ1w==
X-Gm-Message-State: AOAM532+xBmr3GpeOpypQvVmwtk/KmHMqhfcChBZvHDZTjBXP0z/1mf5
        5NCngvblOSxeZS8U+9cb8RQ=
X-Google-Smtp-Source: ABdhPJzOQyIYLCea0e1bDaMgCUmOzkiPeYeV5GsJjd7mT8uRdXafyWC7zlvoA6r01SLSt1xI4nwnwA==
X-Received: by 2002:a17:90a:d302:b0:1c9:9204:136a with SMTP id p2-20020a17090ad30200b001c99204136amr4335192pju.136.1648558909273;
        Tue, 29 Mar 2022 06:01:49 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-29.three.co.id. [180.214.232.29])
        by smtp.gmail.com with ESMTPSA id f19-20020a056a00229300b004fb157f136asm15899061pfe.153.2022.03.29.06.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 06:01:48 -0700 (PDT)
Message-ID: <02a00556-d885-7532-64ad-14027a4b5e33@gmail.com>
Date:   Tue, 29 Mar 2022 20:01:46 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/03/22 13.07, Akira Yokosawa wrote:
> diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
> index 9a35f50798a6..2c573541ab71 100644
> --- a/Documentation/sphinx/requirements.txt
> +++ b/Documentation/sphinx/requirements.txt
> @@ -1,2 +1,4 @@
> +# jinja2>=3.1 is not compatible with Sphinx<4.0
> +jinja2<3.1
>   sphinx_rtd_theme
>   Sphinx==2.4.4
> 

I see that we had already pinned the exact Sphinx version to 2.4.4 (or am
I read the requirements wrong?), so this only matters when people use Sphinx
from distribution packages, rather than using virtualenv as recommended.

-- 
An old man doll... just what I always wanted! - Clara
