Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CA9C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 05:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238796AbiDAFuJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Apr 2022 01:50:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245143AbiDAFuI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 01:50:08 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3224695
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 22:48:19 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c23so1636964plo.0
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 22:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=IoN5OW0GPMyNKhfJHxjrgrng3C1JZIFnvHz1IL9aqL0=;
        b=gzra+Gj7zny6GDST1NIVsloNkLAFDEeEq1VcvTUubL+8Jc1EgX8tT68AGrJEpf7ix0
         x8G/lpELGbRo2se7C6S/yZ8/VGXwwSyFACRa9PhDry16grS3tUUNT77rnuwnLOXl4qpp
         ffYr2UJhCWSiIVjJaSRWurm6465iMPV4HlM/417TRGlias/qZNKwSw4+QZYCElOec8zl
         atvvIxcHI4kM/4GeVhDlk9ciQfdldr5SdCqCNTtlUpC1caICGCZXN7hlKjS8xkIErFex
         KVb9+fX0JewKMWWVvTZh5yPDOIe4epYQTTmeU52UUnk9/CMy/8QfCRlTgzWyo+TD2j+y
         FZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=IoN5OW0GPMyNKhfJHxjrgrng3C1JZIFnvHz1IL9aqL0=;
        b=RpDpURcLknjLdqdP6aLZdFCOmNJ4ZbUiubMH0yIhjQE32yCuQg2TbuRB/RTsL5yss3
         addCWI0IL96JWa0Xezf7nO+VX+H54bQajzhLM0BPprdEjVhzJMguBF2psi9dKqufV2qA
         FX72H4y4KUriLXHTaUTDAndZikEwTIKH97XlddESSE6E6H42ygKPwuGx+cCyaS+9RKwO
         vtGae8u02k4ugJeeg3yp9lCVxmuFcG2TWKXWsmbX7pJoIv6+f4MUGGeGmWEcRun0+wuD
         Ri3LYMV36LoRAHIF8OUHaau1EZia0wOfoV5smDJ4dscz4k4HnkmcKnQ89G36T+tH7BZ7
         6KfA==
X-Gm-Message-State: AOAM530DYoJPe7//sY5HtDLtaK9tPySRIUZH20FnR48bQoy1+e0Vj0EV
        VrgnQIHkr6q8FdiYmw1Gk1mI8nQG7jU=
X-Google-Smtp-Source: ABdhPJxSuw2HTHPWjIvY2IsSWuG1ZqHooYY9RonWt/RyMHdFq5n/Z1JRP1aA9aQrrzKimg85VkHzvQ==
X-Received: by 2002:a17:90b:4012:b0:1c9:ba31:5364 with SMTP id ie18-20020a17090b401200b001c9ba315364mr10194466pjb.98.1648792098649;
        Thu, 31 Mar 2022 22:48:18 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id gt15-20020a17090af2cf00b001c755f3078dsm1056980pjb.50.2022.03.31.22.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 22:48:18 -0700 (PDT)
Message-ID: <ad15e1e0-96c8-3ba6-2731-112e9f92553b@gmail.com>
Date:   Fri, 1 Apr 2022 14:48:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <73d98132-1d08-ef29-edb7-9e062b9154b8@infradead.org>
Subject: Re: doc. warning question
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <73d98132-1d08-ef29-edb7-9e062b9154b8@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu, 31 Mar 2022 19:13:37 -0700,
Randy Dunlap wrote:
> Hi,
> 
> I'm seeing this warning:
> 
> linux-next-20220331/Documentation/driver-api/thermal/intel_dptf.rst:7: WARNING: Undefined substitution referenced: "copy".
> 
> which says:
> :Copyright: |copy| 2022 Intel Corporation
> 
> 
> (and have been seeing it for awhile).
> 
> I don't see what is different or peculiar about this one. There are several similar
> instances in other files in Documentation/driver-api/.
> 
> Any ideas?

I think I know the answer.
I'm preparing a fix.

        Thanks, Akira

> 
> thanks.
> -- 
> ~Randy

