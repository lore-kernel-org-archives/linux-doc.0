Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE57EC6FD19
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 03:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCMDor (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Mar 2023 23:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCMDoq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Mar 2023 23:44:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27E334C3D
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 20:44:45 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y10so6803272pfi.8
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678679085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MIC5oWKxd6B7kSxP9s/Wbn8PZ7Vf896STwz3iAppWA0=;
        b=QWcvh7j67xmeUNK/E7Wjpf/ufFUn3JXma2ufOrWQSF4Lk/P/A0Y6jsJ/qOS5b4xaQf
         ID5+wWC1H/nCEU8PfIvSVjVdt0eyQqxR7gKLJk+I8Xms160sDoKqgAVbfPbMqRr5zBmc
         q9XINeBjOq7NF5GnEku19isDfqPWrGwslj5M5e7r5ze7d3m1RfWgdwrwojb3E4S2biw2
         8KZcDACWoitdB6cT86b2k09IhHhe8+a68rAhyVVU5sN8j9eKtzepP9HnwgJ96O6YFnhT
         4RJ/gVwuQ22iq+gCq3K7OIPSeDo6UifYaQN1lVH2CPsFtGBJP552yWy057vpfrysBhhL
         4Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678679085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIC5oWKxd6B7kSxP9s/Wbn8PZ7Vf896STwz3iAppWA0=;
        b=xzWiiQBxZtrToN7BAyQLhqZMMWLFReIpTxiR2Nv+9dPjn3egVFmjQixIV6V3tP+7g1
         HJwVV7B2rVu5uBJiGFbwvGpFRpd13VZQnRbpYDmU5TVZ3HxU/lRf1I+hmqY3JuwG17HM
         0HaX+GZQ0XJHjs9B9TDkBhQvOUY46z54yDVGqnAw5VIc7Wvj28szgZAhKbOBjUHep6Iy
         3S5OrmGwe9vtSD1EWBzdcXzTv6+xHE5a/2MPxcm6NkGDlific/G7n55T25RZeMy1/rF7
         AkdOA2ZP162lp4lsYBxroaCDsOpgKSoq7Ah1SCyLxg11fHfIzkafkV1fhicm1YJ7yPR1
         WTng==
X-Gm-Message-State: AO0yUKWp1+AIUuiuYIiCCj5UW0Ghw2hfo72AYY6j5UsXuplziNCcH3YL
        JkIHSbc8ts3yh5hZYRpICns=
X-Google-Smtp-Source: AK7set/OnBv8ZLuJv/do6DbN92yvBlTY8vdtbAXP781MQI6SFoXT/BZIy2SxDPCsiwnoavaD5T9ucA==
X-Received: by 2002:aa7:941d:0:b0:5ce:ef1b:a86 with SMTP id x29-20020aa7941d000000b005ceef1b0a86mr30637512pfo.2.1678679085280;
        Sun, 12 Mar 2023 20:44:45 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-80.three.co.id. [180.214.233.80])
        by smtp.gmail.com with ESMTPSA id x26-20020aa7919a000000b005a8cc32b23csm3313201pfa.20.2023.03.12.20.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 20:44:44 -0700 (PDT)
Message-ID: <b4674fec-9763-ef16-9b6b-c2292df2f469@gmail.com>
Date:   Mon, 13 Mar 2023 10:44:39 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dns_resolver: correct documentation error in dns resolver
To:     Bharath SM <bharathsm.hsk@gmail.com>,
        David Howells <dhowells@redhat.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org,
        "pabeni@redhat.com" <pabeni@redhat.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Bharath S M <bharathsm@microsoft.com>
References: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/13/23 02:42, Bharath SM wrote:
> Fix error in dns_resolver documentation
> 

I can't tell what the error you fix is unless I see the diff below.
At a first glance, I though that you fix Sphinx warnings.

Also, is this patch [PATCH net]?

> diff --git a/Documentation/networking/dns_resolver.rst
> b/Documentation/networking/dns_resolver.rst
> index add4d59a99a5..99bf72a6ed45 100644
> --- a/Documentation/networking/dns_resolver.rst
> +++ b/Documentation/networking/dns_resolver.rst
> @@ -152,4 +152,4 @@ Debugging
>  Debugging messages can be turned on dynamically by writing a 1 into the
>  following file::
> 
> -       /sys/module/dnsresolver/parameters/debug
> +       /sys/module/dns_resolver/parameters/debug

Fixing incorrect sysfs path, right?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

