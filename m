Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_B,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5599C4320A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD87860EAF
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbhGWGWX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 02:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhGWGWV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 02:22:21 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384BDC061757
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 00:02:55 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id a9so883695pjw.5
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 00:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci-edu.20150623.gappssmtp.com; s=20150623;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=AdH+rx5+VPP3VWefoL3mhQLnCJH3lO4p1OcT4UPuSHw=;
        b=hqJ2SYmIYX6GXRc9Jx1OUkc2/AX3IBRoSxOuaHp8m2rF4Ftr/LF8tw/YiHrCU3osXl
         Q5hTdI+eG8cFd6SChXxLzNRFbLHVWHk9d8xlQoGSIc3dxENq9wjFjvzBlqu5kYgdp5EJ
         VSp89rgdFqcBanykXujfxHXCc89vXcoCB2lq/Xe+B+V+Y16oGgyMnBMN2FiYBgIQC6uc
         EtfJd2MrygQ3aV7e1ClCzh+Gtcjt9xPY0xEtQYd+bi3ZtvBhR7aEKPnG1AfuaUHjE4Z6
         R175syYwMni1ay3fsxtD6+2flE2/eBYlhSo0+IkC/7UTbKRkSIPhNTqztUBbqYNGRxj4
         kjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=AdH+rx5+VPP3VWefoL3mhQLnCJH3lO4p1OcT4UPuSHw=;
        b=QPWuwuuud8EmyINS64NnpKpphP4DBs/g4ToJ6BqONbmFpLz3/+nfKCutd+cKVXVx69
         llTj0TLQUre+xH3iKrNjkgHI77wO7RX/BYYJm7S7eVwiQe9Vp0UovFp3RoZuYvtVKE75
         n/BmkmTD0a4NohctuIuWzGUlEbegAm5Oi6MzoTcvw2GCArKiZy7ZBGuRsG8wSePORubu
         /S4PeSj/1OpmZtFAgGu4SNHetKZuXQaVPAIpA2teYmlYof4wgdQdTRNxfeRLatJqbjjI
         vxI8sxbOlcvIWJbsSiqsFuGAG53sM1fUDG8nbOzp9yk6v2+N8PpUzCyCPprw1dx09UiL
         KoPg==
X-Gm-Message-State: AOAM532nHpIhmxCAj5/IecFjmXZgW+yea33cMpP0gHwxDvV55sVJ6rOL
        iGTWXN7JqxVtUo3Rtv3Jg14lgA==
X-Google-Smtp-Source: ABdhPJw/fiEjM+NRZGB2+dG+Gyp/HN41VOVwQ79CbKl4rXQOQ76By2KyfQWR/6Rrc+nCRqwJhafIpA==
X-Received: by 2002:a17:903:244f:b029:12a:f0f9:19a3 with SMTP id l15-20020a170903244fb029012af0f919a3mr3129556pls.42.1627023774767;
        Fri, 23 Jul 2021 00:02:54 -0700 (PDT)
Received: from [192.168.1.3] ([183.98.43.105])
        by smtp.gmail.com with ESMTPSA id s5sm3501225pfk.114.2021.07.23.00.02.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jul 2021 00:02:54 -0700 (PDT)
From:   Dongjoo Seo <dseo3@uci.edu>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v34 00/13] Introduce Data Access MONitor (DAMON)
Message-Id: <2E16FC36-18B4-4F92-86AE-51249CCDB1A4@uci.edu>
Date:   Fri, 23 Jul 2021 16:02:44 +0900
Cc:     "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@Huawei.com>,
        acme@kernel.org, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        corbet@lwn.net, david@redhat.com, dwmw@amazon.com,
        elver@google.com, fan.du@intel.com, foersleo@amazon.de,
        greg@kroah.com, gthelen@google.com, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, joe@perches.com, linux-damon@amazon.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, mgorman@suse.de, mheyne@amazon.de,
        minchan@kernel.org, mingo@redhat.com, namhyung@kernel.org,
        peterz@infradead.org, riel@surriel.com, rientjes@google.com,
        rostedt@goodmis.org, rppt@kernel.org, shakeelb@google.com,
        shuah@kernel.org, sieberf@amazon.com, sjpark@amazon.de,
        snu@zelle79.org, vbabka@suse.cz, vdavydov.dev@gmail.com,
        zgf574564920@gmail.com
To:     SeongJae Park <sj38.park@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello, I am new user of this amazing tool.
I want to use this tool for Nvidia tx2 board with kernel version =
4.9.140.

Do you guys have any timeline or update schedule for different kernel =
version compatibility?

Best
Dongjoo Seo=
