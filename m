Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B072C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 11:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69033610CB
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 11:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239508AbhHTLm7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 07:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239788AbhHTLm6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Aug 2021 07:42:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE81C061757
        for <linux-doc@vger.kernel.org>; Fri, 20 Aug 2021 04:42:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id n7so16914597ljq.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Aug 2021 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwSYnZ0fXeyF3ucmVYtCymM5MkqPY89pcO9lgHDkScc=;
        b=RQV3qkbRPB4wYn5rj55IDWMO5Wywf4L6wyjACr5IMbV/zKC36Ab6BeVA76WHo2bs4j
         nyrb7DMkVIXnh0n7r4Pk+OInxYOfLVae9K0ZAQMO+QgJXveyqceQ8lzHCCXFR/9ArfE4
         ZBWCImoPry5Ydl+fvYVRdPdNvVPDC6LXtVpU4uIGo0VjrDaZsYylBJLnI5aSZO3IWar0
         N+IXPS8HSukU8TtqsNWym+9YmCdj9Ed6Luk46mBRNxBJWMaInC8usKVRyomOt5I8HpnZ
         kdez1wm7WCrnD4B9891D85TmVqzs6WU7Ex+eeEozWvPTowdFcxszIdbxiplestG2EdjQ
         zDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwSYnZ0fXeyF3ucmVYtCymM5MkqPY89pcO9lgHDkScc=;
        b=IVbK/t6nX+YiF5iWMAsot3yQ9JcNRd63XyZ151NmANKENuh/LWu4HbSS4YHm6levdV
         ucUvX0Ex2XphyeqqJeuyKsGIFOW/szYSw0jEc03R/xqbg0PHgnYNEY8JWC8Mb50IhU13
         jf6VdyWjoTNJw9qjJGXD5aw5If05yDAQjblXcqhTBIkFxsjgsDuxUKsO6ZlNgFaCoplV
         pXYYZ+jCZq7iteahiwh4LJ7DBIj2qSqf/upaaXG42zhueODNR1Z07gUONkTgTvuLKRfI
         lQeuT07g7ljnK2PnZGl9VXt6swLUdzXOs3zedFfSiVCNv8m1AHCpBSb9i4DcvBWZKzyW
         t9kg==
X-Gm-Message-State: AOAM532ujRdJB2JYJ/LWdb12Ns5zv2D/Is4Z/go6LtCzlHkXWqlVLFLc
        XXrqaHyvsr/TI3OI3RbWzq83aV1MFyu7W7w3s8Va9w==
X-Google-Smtp-Source: ABdhPJzdXSMf7HClGrUsh7vy9ZlHbcJeSNEIBy+APf+XJPeJIP1M8RavCEv4mkMq21DlHjqlbmlf4vOcBxrETaa+aTY=
X-Received: by 2002:a05:651c:1248:: with SMTP id h8mr13374370ljh.160.1629459738919;
 Fri, 20 Aug 2021 04:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <1629417219-74853-1-git-send-email-wang.yong12@zte.com.cn>
In-Reply-To: <1629417219-74853-1-git-send-email-wang.yong12@zte.com.cn>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Fri, 20 Aug 2021 04:42:07 -0700
Message-ID: <CALvZod5usW9OEsJSbeGYBnSGVDNLLKqMoGAx-JQrX6s62r-XiA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Add configuration to control whether vmpressure
 notifier is enabled
To:     yongw.pur@gmail.com
Cc:     Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Roman Gushchin <guro@fb.com>, alexs@kernel.org,
        Wei Yang <richard.weiyang@gmail.com>, Hui Su <sh_def@163.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        wang.yong12@zte.com.cn, Cgroups <cgroups@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, yang.yang29@zte.com.cn,
        wangyong <wang.yong@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 19, 2021 at 4:54 PM <yongw.pur@gmail.com> wrote:
>
> From: wangyong <wang.yong@zte.com.cn>
>
> Inspired by PSI features, vmpressure inotifier function should
> also be configured to decide whether it is used, because it is an
> independent feature which notifies the user of memory pressure.
>

It is also used by the networking stack to check memory pressure. See
mem_cgroup_under_socket_pressure().
