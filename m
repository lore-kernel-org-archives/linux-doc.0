Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5C2C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 19:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244900AbiDYTUr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244851AbiDYTUq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 15:20:46 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C741002D0
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:17:41 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c12so28075455plr.6
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=dBJVxT2oQQKuTmNqO746HArxprk0i5OOxyDSI22NCDM=;
        b=S5hCr2r8dSdLX7LojMvfZCiuELMGIzpE16tCfuLV+niqkLCNloOVHl8rfWXGxMz/RX
         /uJQeo3CdHZHmOYvDrf9U5VYZnpMd7Se8qzctwcUB8msXmPxwTbqS17Yzb+bEAQGjEui
         nhFVrlENVGbWGTP0Uo26WNZiuKvHpMPJ+Z/wI0KMOLtzXP16rklqjH5mGGPu19luqczc
         QadckueHU9DRU+yH4VNbE8IMBAogntAzhSJXQJPtEJbL8SFmZ9ypBs99Rebm9dPjIFBY
         7Q/4tAe0VsPh34z+ZAK0xYHwGSJjNzVpvc3PF3dKhIZLj+0Rpv858GdIDBAb/kNvM/wK
         nUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=dBJVxT2oQQKuTmNqO746HArxprk0i5OOxyDSI22NCDM=;
        b=45wgF2HGer3f/yBIBqUGPeqOX8vokzd74XbQUPPPpqdfsDYCEsQyPf/yp92Tp7r3j3
         XPB0JYg9tzZnWxtLCB80Z/RPPI9mV7qbwRyzbjF1Q1olXcFoy8m7rd5PIu/K73woU2Uc
         43C5YsHMD8eaMoY0iH4mIHIO0d1oKfbEtO1B23WLXV3ugKSp0JPMQ+PfA4noc8LZfGrA
         lsBLVR0wL/DmfA5IancEdfHFTCGzvmrqi5sOyZndWBqaMgdFO/29ickDSMuonqwV2+m+
         gAsxNkTke+LbxCF3bTz6G2z+fiXq8/VdtSMPx4aCcHV8NMKdYtNfsD97ME0HQ6siz2TM
         VHQg==
X-Gm-Message-State: AOAM533oSLa9R7kfXxI2u6TO+TolFHNFMYa+WoueJqcNuCniwXSNP/1F
        KAqbXdrhMJyo+8mA2JrEGYUDrg==
X-Google-Smtp-Source: ABdhPJwegg1ZVtvJWdZISaAZfuEHL2yovHoZcVRerWAaWqJBC8aaKMs8ZIcNrjgGbuQO8/Cx9M0MIQ==
X-Received: by 2002:a17:902:d545:b0:15d:4a7:d3c1 with SMTP id z5-20020a170902d54500b0015d04a7d3c1mr8631515plf.52.1650914260912;
        Mon, 25 Apr 2022 12:17:40 -0700 (PDT)
Received: from [2620:15c:29:204:185b:8dcc:84d4:fb71] ([2620:15c:29:204:185b:8dcc:84d4:fb71])
        by smtp.gmail.com with ESMTPSA id 130-20020a621488000000b00505e6092973sm11814391pfu.68.2022.04.25.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 12:17:40 -0700 (PDT)
Date:   Mon, 25 Apr 2022 12:17:39 -0700 (PDT)
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
Subject: Re: [PATCH v5 2/4] selftests: cgroup: return -errno from
 cg_read()/cg_write() on failure
In-Reply-To: <20220425190040.2475377-3-yosryahmed@google.com>
Message-ID: <f089fcc2-68d6-2b5a-6d29-f492d6414cf@google.com>
References: <20220425190040.2475377-1-yosryahmed@google.com> <20220425190040.2475377-3-yosryahmed@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Apr 2022, Yosry Ahmed wrote:

> Currently, cg_read()/cg_write() returns 0 on success and -1 on failure.
> Modify them to return the -errno on failure.
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Shakeel Butt <shakeelb@google.com>

Acked-by: David Rientjes <rientjes@google.com>
