Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A544CC00144
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 02:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240067AbiG0CUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiG0CUd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 22:20:33 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB32663E4
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:20:29 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id bf13so14704603pgb.11
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2dI0w5TkEFKgnirYxhvSnjBRfynV9y7DH7W3YbcaTk0=;
        b=ODilX5fC2JGXnwqoqAdLGM1ZSJB0BhWFkIBkpoS7fbqJcvqhmajEkeLgk4q4ELOjuc
         u3EjUhABAZRVniO+9/sHYNSBWj3r6KJ/HQLqgEtvv9S55cPjaw2MS55Kkm5c4EMfEhOk
         djFMMlyRhr2z4xF4zQUxVuvdgLVG/GqG71ool/99zCGGu3pE9q2zuipPyw+r+PDWvK5h
         R8RTU8S3k2O0G9KS4UQqRfwptddLy3+c5oD6M0GM6SSWIBol4aNMdFS7lmStXQa7vHsD
         ryQb1f56YHIKpmmrBNlhLQeziGcpxfUDNry5vTbSaUv7X3mZoBdSXK1SJHqybSzdfyTp
         HSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2dI0w5TkEFKgnirYxhvSnjBRfynV9y7DH7W3YbcaTk0=;
        b=cdBY+FQK7rssW86dwGq2/n+seqtEJG2lxeCKd0L6IePXqVnruxRWsNhCkYf/DLkHe4
         TNhAH79WqVb/K7SsljI5Oxz2fXsC2xRbbOOchQthJnuL9/gc9TB+gMKUP4SGdjhdV3tH
         SORZnKVC1MHK6UP7aA7qBEvHGCO7T7lQgSLfqOJrQopsYRAgeAnIornsS0ALSXi4OxOy
         bcDJ1D1V29/11iONQD7hraS3ezDE7CD6x2uRqLnx+sbG9ewDuB+MyjdoWugTpNjMJ9lC
         mypQ426zgWGISDvcAsymApWxPqY2yegP3GXO0roHyB8Lmv472YYaN3hJZ+ZxclKeQtjy
         wrRg==
X-Gm-Message-State: AJIora+z62Rw1dLT1EMQV7sKCKGwePNgtRph6+BXBb9lN6kBL4Q8Pg6U
        eh2spbneZQ84zHp1EebB4Uc=
X-Google-Smtp-Source: AGRyM1stByDIAKfCCnCsUkafHVVcXT4D2scl65oZenoQYf20JUSn6urKtVJei5aJLHqAr38IEzTM1g==
X-Received: by 2002:a05:6a02:302:b0:415:fa99:e0aa with SMTP id bn2-20020a056a02030200b00415fa99e0aamr16687459pgb.516.1658888429229;
        Tue, 26 Jul 2022 19:20:29 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id f34-20020a17090a702500b001f254ec83aesm89356pjk.38.2022.07.26.19.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 19:20:27 -0700 (PDT)
Message-ID: <e9f57c4e-90ba-f419-4d30-46386a898143@gmail.com>
Date:   Wed, 27 Jul 2022 10:20:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 8/8] Docs/zh_CN: Update the translation of sched-stats to
 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <d46c5dfb2b6a138ba418b04f41f5bd73ebd7248d.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <d46c5dfb2b6a138ba418b04f41f5bd73ebd7248d.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/25/22 17:24, Yanteng Si wrote:
> Update to commit 6c757e9f55f0 ("docs/scheduler:
> fix unit error")
>
> ddb21d27a6a5 ("docs/scheduler: Change unit of
> cpu_time and rq_time to nanoseconds")
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/scheduler/sched-stats.rst          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-stats.rst b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> index 1c68c3d1c283..c5e0be663837 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> @@ -57,8 +57,8 @@ cpu<N> 1 2 3 4 5 6 7 8 9
>  
>  接下来的三个统计数据描述了调度延迟：
>  
> -     7) 本处理器运行任务的总时间，单位是jiffies
> -     8) 本处理器任务等待运行的时间，单位是jiffies
> +     7) 本处理器运行任务的总时间，单位是纳秒
> +     8) 本处理器任务等待运行的时间，单位是纳秒
>       9) 本CPU运行了#个时间片
>  
>  域统计数据
> @@ -146,8 +146,8 @@ domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
>  schedstats还添加了一个新的/proc/<pid>/schedstat文件，来提供一些进程级的
>  相同信息。这个文件中，有三个字段与该进程相关：
>  
> -     1) 在CPU上运行花费的时间
> -     2) 在运行队列上等待的时间
> +     1) 在CPU上运行花费的时间(单位是纳秒)
> +     2) 在运行队列上等待的时间(单位是纳秒)
>       3) 在CPU上运行了#个时间片
>  
>  可以很容易地编写一个程序，利用这些额外的字段来报告一个特定的进程或一组进程在
