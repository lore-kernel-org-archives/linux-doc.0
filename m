Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16366C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbhKVHhv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhKVHhv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:37:51 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD01C061714
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:34:45 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id r138so5007016pgr.13
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LdaWIVV66AnYvZDioQXEttBzNC/hd0WDtpDAz2dRNNE=;
        b=KG2WHzvKQGUkR1Z9aHB2oFXjn8rJ3UJnZjjK2dV1198tlorfoosTqH5lGGvH4dyXDw
         QwdN/cniW2C9UyrDW8RStkY7M3MDNmHUODgdV7JvUz9kE7l8fUUzAIrM7k87eSXRG25S
         r4MIgKsA7VZ6lpOXq5+pvgV9oLdOCSz9dpV3HibUvmzYLNVOKapBafe3ES0eY9x198nL
         FGnLPkGyFbJTWP5wgxdZIn0XbFf7FV8XnCKGe/+2iPP448IllivFRfyBhgibE4Ci+H9N
         4IFS5wkli/gWzgEq+gA8BNxNUEqB3V60tphTmFWvUilpV9ayVm5n1i+Oj6aRrk6N2omx
         rsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LdaWIVV66AnYvZDioQXEttBzNC/hd0WDtpDAz2dRNNE=;
        b=0E9ST8stE2jOW7pzhWfQTB5HMo47lvyMf54t2SUEyxcZaaG/uOAjroMCBJn8DpDLCQ
         rfOwl30RrUXhQWqq+8K5NwdxG0Wr/6j/nqhLDBow7dnpYZn7jnDiH3HgYUO4lmyYufC2
         N9p72c6bC6j+jkoSZYbRpPOfKjc6MbuVCXKoJWjZ8t4U107GFL1fT9evtcVi04SXSNIU
         Dcm3MZkmg5tsbx0f+0elThzHq0LvfYgn2Nv4rR4ByGrxU4coRAWoZ95AlKujBqWAWQ2a
         zOejC+8bN0XEyDkL1Q4wWMD1y0Y0f/pyd3xCq0IfQ9lv1dCTrUXiZ/22c7NbxQoMGFP1
         tqCw==
X-Gm-Message-State: AOAM532DzanLvuA7UNfR9GBh2i5nF8crlDckspNYEwzmBG1SJ6Tk+o7a
        QWl6+ztck/JIyxny7Rr5JtIQJw==
X-Google-Smtp-Source: ABdhPJzG4d8nuiw8MpOKbGi5ynV93hARNi2HDnMotlUY6Rx6JOlMvw2fL9I2deYlAjhanP8kYPM4ZA==
X-Received: by 2002:a63:f749:: with SMTP id f9mr31900558pgk.330.1637566484783;
        Sun, 21 Nov 2021 23:34:44 -0800 (PST)
Received: from [10.76.43.192] ([61.120.150.76])
        by smtp.gmail.com with ESMTPSA id on6sm20781535pjb.47.2021.11.21.23.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 23:34:44 -0800 (PST)
Message-ID: <25626b34-9dd2-2e89-0c35-be40e62b6e09@bytedance.com>
Date:   Mon, 22 Nov 2021 15:34:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: Re: [PATCH v1] sched/numa: add per-process numa_balancing
Content-Language: en-US
To:     Mel Gorman <mgorman@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20211027132633.86653-1-ligang.bdlg@bytedance.com>
 <20211028153028.GP3891@suse.de>
From:   Gang Li <ligang.bdlg@bytedance.com>
In-Reply-To: <20211028153028.GP3891@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/10/28 23:30, Mel Gorman wrote:
> 
> This would also need a prctl(2) patch.
> 

Hi!

Should prctl(2) and this patch be combined into one series?
-- 
Thanks
Gang Li

