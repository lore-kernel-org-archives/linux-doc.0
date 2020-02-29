Return-Path: <SRS0=c74n=4R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED3EC3F2CD
	for <linux-doc@archiver.kernel.org>; Sat, 29 Feb 2020 00:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6BA72469D
	for <linux-doc@archiver.kernel.org>; Sat, 29 Feb 2020 00:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YEZrilU5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgB2Avk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Feb 2020 19:51:40 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54903 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgB2Avi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Feb 2020 19:51:38 -0500
Received: by mail-pj1-f65.google.com with SMTP id dw13so1951551pjb.4
        for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2020 16:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M4tgEyFArklK0C2NkHJ4Ev1DbekboBTuLVXflJ8Bdmg=;
        b=YEZrilU5Emz9Z8Ec+wHK4LiI7fQQzdfCcue2M/IsGBDlntu9mx1MWRLDNRF2DkbyzK
         R2lwOWZhgB6mzNpT1Pu/aYGOixkKd67bWXduwxC7akBPX2iYuMwBeOQ5JBnJ3PoP/sm+
         fwHlgE5NWc/QcaNpgQ1v36FCjFUNaQ0QzZjXLhJBB7HSyakmk/gogoPqwcbqcHALKGWF
         LEwHUDu3Vt5k84kgM8atzhoarq3m2Hp+ubtvEsIOjJSEjTqa8HV47MN06DuHfs+WThz5
         AS+PNvVOGiAiXvalk95ELB6qY6CzHUNlqNZ8cCZ8Kyzz7tO0GspqtRYJOBiBc4omlRU0
         Jamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M4tgEyFArklK0C2NkHJ4Ev1DbekboBTuLVXflJ8Bdmg=;
        b=tVK4Ja69uyZ+D+1WwUEv9VUXSyhBNDpw6NgFkfR13PI0FT9pRKquvtDw11wRLFR0Zj
         kK9hlf/OJB/I9KSdMlMbIqvTu0wNXpvYEVT1k31WWfcJ6UoZjAUckGsO0itcH/x/gqTA
         z7tQolZwH/uCuN2J2P4BlNqgy3pGXwCksfEzlf/NUpB3V7aCeFTT/YjeDf6tm80ypgEt
         +6JEmWJDBzPa8QJDYGoBTO821UPMHySluaGk3hPqflTDDeVPb54wnZlPoSJsbtOT2MB+
         7jjVKniOhq+3RqfmvcyK+hMyUuvMr01GLzMDdaI4YUmTOFnwtToYfj4VJdq4aRwLzEi/
         M+pQ==
X-Gm-Message-State: APjAAAXdi+e/YLALRDbkC11xX773jww7Fyt7JqXGcBK2knRUiGaFY5eq
        yIpou5I11d2Thc94A3VOfGDLQA==
X-Google-Smtp-Source: APXvYqy82naI/lVAZlOJvZdl3C/jjyr3KkWwvalv9/HybDbYSHFf9yfSUJEYY3U/VEuNZhjYcVENGg==
X-Received: by 2002:a17:90a:8a8d:: with SMTP id x13mr7344279pjn.97.1582937496771;
        Fri, 28 Feb 2020 16:51:36 -0800 (PST)
Received: from google.com ([2620:15c:211:202:ae26:61fb:e2f3:92e7])
        by smtp.gmail.com with ESMTPSA id y16sm12339385pfn.177.2020.02.28.16.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 16:51:36 -0800 (PST)
Date:   Fri, 28 Feb 2020 16:51:31 -0800
From:   Marco Ballesio <balejs@google.com>
To:     tj@kernel.org, guro@fb.com, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, lizefan@huawei.com,
        hannes@cmpxchg.org, corbet@lwn.net, rjw@rjwysocki.net,
        pavel@ucw.cz, len.brown@intel.com, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, minchan@google.com, surenb@google.com,
        dancol@google.com
Subject: Re: [PATCH] cgroup-v1: freezer: optionally killable freezer
Message-ID: <20200229005131.GB9813@google.com>
References: <20200219183231.50985-1-balejs@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219183231.50985-1-balejs@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

did anyone have time to look into my proposal and, in case, are there
any suggestions, ideas or comments about it?

Marco
