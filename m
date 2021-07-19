Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B354C12002
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:53:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 113E161186
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbhGSJMj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbhGSJMi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 05:12:38 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86526C061762
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 01:56:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o3-20020a17090a6783b0290173ce472b8aso13817788pjj.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=E2tZE1Ed0aZpkrCfB99XZNU8SFfnSKYacY6RqWfb6v0=;
        b=WH2Ykao0CL8ffEEwvky53xOjUsbsh37gLm2+9Pd7OtE5goUtTklLM51bZXpzgkuglw
         hPZjP70D8RR/PKC9cvktg8Aoyvs0VvKOO/Wz8hIbtTzILSHgKhGZ22LPzl7IxkoJMqQd
         jsQk6Fs84EJs369DPBiQy/dFMNwZdSwaCsLdsc0kKaQ34Yufukf4SxiqJFUxFH4JivZQ
         +u99HXf8QYRYF/8ddNtDTSVEhWr3/X0+sLLIRWOfLAqInXwODZOfFGX7d9/RzxBU2qrI
         CeUPJWM3uDmbEegsZhDGe0rpDr3KRnC0LHNnVd7P4H6rvOM1wr7yWyLZwcqxkGq5n4s8
         ITZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=E2tZE1Ed0aZpkrCfB99XZNU8SFfnSKYacY6RqWfb6v0=;
        b=tcrrKjjquDimjiP4S7+lXe2Bfa033N2zY4e8gklkn99eaVhH88Norap3g7T1opAMLJ
         UbE3TcsM7kGpnhatA11k+0bj8D8cfuUZiKC23jVRuTmsPrd2UQhG8sxmOdhczBuMstRH
         d6ssmM5qNhF9l1kANtHHeXp3LNro9+72+NPo97Pvk56T3RDsKbUuhN5M7pYtFXmSUrFO
         na7BH7ik/wBjRM/NL5UgK5tXWVpwnmWcerR2u+T5MmO1n4ZOPSmzX4sJVKL4cQpj4I25
         R4QOQ0KXnysaehC4DLeWQfgEZ8PUvcoNGLvxQVVDEAw78JaHK2fKyVf2R7IS819/sRjj
         o33A==
X-Gm-Message-State: AOAM531t2kQYtsNb5u6FPkkusSKhckk7s/rwDKcyDviMuIrLschHNwwT
        WHg35ARbwGZIFpkOMPynlpDj3w==
X-Google-Smtp-Source: ABdhPJzE4kEpR1F76PMihUwTBGQTjf87c9UpFZlcNlaP9p/GUb1Ez01h+tYgDZRGl7H1xCbSbOJBiQ==
X-Received: by 2002:a17:902:e14c:b029:129:d117:fa3d with SMTP id d12-20020a170902e14cb0290129d117fa3dmr19054634pla.53.1626688397949;
        Mon, 19 Jul 2021 02:53:17 -0700 (PDT)
Received: from [10.200.196.235] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id c14sm21099059pgv.86.2021.07.19.02.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 02:53:17 -0700 (PDT)
Subject: Re: [PATCH 1/7] mm: fix the deadlock in finish_fault()
To:     "Kirill A. Shutemov" <kirill@shutemov.name>
Cc:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com
References: <20210718043034.76431-1-zhengqi.arch@bytedance.com>
 <20210718043034.76431-2-zhengqi.arch@bytedance.com>
 <20210718212814.suvziikndiyezi6m@box.shutemov.name>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <9e97cedc-9fd7-4290-9f44-04b96acea15d@bytedance.com>
Date:   Mon, 19 Jul 2021 17:53:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210718212814.suvziikndiyezi6m@box.shutemov.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 7/19/21 5:28 AM, Kirill A. Shutemov wrote:
> On Sun, Jul 18, 2021 at 12:30:27PM +0800, Qi Zheng wrote:
>> The commit 63f3655f9501(mm, memcg: fix reclaim deadlock with writeback)
>> fix a deadlock bug by pre-allocating the pte page table outside of the
>> page lock, the commit f9ce0be71d1f(mm: Cleanup faultaround and
>> finish_fault() codepaths) rework the relevant code but ignore this race,
>> fix it.
>>
>> Fixes: f9ce0be71d1f(mm: Cleanup faultaround and finish_fault() codepaths)
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 
> and add stable@, please.
> 

OK, I will add these in the patch v2, thanks.
