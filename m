Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FEDC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 19:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243113AbiDYTYU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiDYTYQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 15:24:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C261102A3
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:21:11 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id a11so4491207pff.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=EFTgBEagFmmR6U52RrsmJyFD9yVowcStiIMc2bUDapY=;
        b=s6195XWETsb6HUd7XIYfd+aHSTXLySbeqIstQZ7ENlOt0PPlWQyDgbZ9COFCiAyAKc
         Q151crBFWVCD43gsDQDwAUFRwSreTwwCC10Z+KVQufEFhNcJCLx1dzi19yeK6JlbA099
         FSZXM4DmqpyY5IWjLmZwPAAWufIZsB9qKLxyLLCknVBSjHREAjIzjw67XLWULUs8TEAu
         eEHvwUfUHV/isVdOZmaVCsr48fzvEWkCvu2MO02pyT6ED6PbZ4EqCz/TDMUjSRW+a0oU
         XE9npOj+CyL5GbXgQ1rnJKE53PedmKLmk15elLhmajNbzqfsuukD806Y+AihCB4hq/M2
         /FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=EFTgBEagFmmR6U52RrsmJyFD9yVowcStiIMc2bUDapY=;
        b=WGoCQMIyFVgO8pKEVL/fnlioTB3datRgtp19MOLFZJDm5w2ON+Aq95l5th2IAr0Ac7
         wg3ZJ5lWWSeHntMULkbOKa3pk35O4FwUIa8IY75lSQVnOp4GEpSPiqu81bZPK0LKzQTe
         kXCf2rbZ6uioauIZhE4XNUzncq4h51rdhRO+fhHQBtZqRX91ZwUIk+J5zTlGkuyWYRl5
         KMUUdRLje8rUqaqWyNC0UZfujwwMfygvua3xuXxy0QDaPkdgh52FgTfis6OQ7YnQiQI0
         jzdYbK6G/3EvoEGQIQBIbqj7iYg2CrBFtjbWV1VoVi28ySqFQvXbnQUeGqd6KvvR/9uV
         kIbg==
X-Gm-Message-State: AOAM531IMOLm/WCK75M7JO9Q+xfo6215dj9j+ZiBwhKiEWLwqLy7dOff
        8WQkp7YM00UyjnzlaNgppT85TA==
X-Google-Smtp-Source: ABdhPJy/nP2vmcqU+4mCsp+zxrEEpTTuLTZEPc4nt8yUYWG8kkVKy7tWntoPERABjCyjJlt27TlgYA==
X-Received: by 2002:a63:8a41:0:b0:3ab:358a:e70 with SMTP id y62-20020a638a41000000b003ab358a0e70mr6065999pgd.559.1650914470908;
        Mon, 25 Apr 2022 12:21:10 -0700 (PDT)
Received: from [2620:15c:29:204:185b:8dcc:84d4:fb71] ([2620:15c:29:204:185b:8dcc:84d4:fb71])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm10440939pgp.3.2022.04.25.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 12:21:10 -0700 (PDT)
Date:   Mon, 25 Apr 2022 12:21:09 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Yosry Ahmed <yosryahmed@google.com>
cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 4/4] selftests: cgroup: add a selftest for
 memory.reclaim
In-Reply-To: <20220425190040.2475377-5-yosryahmed@google.com>
Message-ID: <935cf8de-c089-a212-f419-fd8434936b5@google.com>
References: <20220425190040.2475377-1-yosryahmed@google.com> <20220425190040.2475377-5-yosryahmed@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Apr 2022, Yosry Ahmed wrote:

> Add a new test for memory.reclaim that verifies that the interface
> correctly reclaims memory as intended, from both anon and file pages.
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: David Rientjes <rientjes@google.com>
