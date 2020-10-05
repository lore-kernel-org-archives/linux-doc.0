Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D67C47095
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 408BE20796
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgJEIoR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 04:44:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58530 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgJEIoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 04:44:17 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1kPM6R-0003GE-1A
        for linux-doc@vger.kernel.org; Mon, 05 Oct 2020 08:44:15 +0000
Received: by mail-wr1-f72.google.com with SMTP id g6so3737646wrv.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 01:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dZFx1GeJTo2ZK4IcFjyCCesPDlIGbBOPYfFpSWVIbpo=;
        b=e8WpzpeWo38b4GjPMxihCJcV/MBzwKEXCaCrHQIJQwtmWEvDKIkZaUO4U6wJHOWl8x
         flWC+oFXtsIjV4RxjVlbCevw4QUuTmz0xpMoUxwoEaszP7IocTfqCkk+p3VDLD7pHEAB
         FbsrfgU7j2hxLgSIh+YBgtKivVlIm0toLMZhlxBmMpPvqJrGC3lWVbumQTRZOzVKkKik
         BGTFfnRZYeWezzvX6VJYZM4YZkKD2s6QxnFYhSqV6KlO2KuZGkrQrrcXcKPZ7IKBmKTk
         /Qv0ajNYIl3R/f3JSCBNRBN3te/TdNmOAi5V6NxoqYvxMUA+Fc7OGvXX893/llCUVxlh
         N/mQ==
X-Gm-Message-State: AOAM532PWx3trnvrBrZVzW/pHjtcL+Qt5TYVb00lRgJWBQhbOav9+gnQ
        qqF190ChrJDuTNseHdymc0+2eWaN7Dn6IdozK4ySZCdc7Hwnd1cA1WEgYUUJHv0qIJYroL9ZM4e
        6ynwTI3/KEBEzKzFH05x8Czkl90bNe7ssKEcHjQ==
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr15260336wmh.1.1601887454688;
        Mon, 05 Oct 2020 01:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGutvomMW+ZkXDkOPcBrLdaEr1nkvazEGt7P+cRzR/ommpl2rxO5gLvSjXflb6uzW3HKjHwA==
X-Received: by 2002:a7b:cc02:: with SMTP id f2mr15260308wmh.1.1601887454379;
        Mon, 05 Oct 2020 01:44:14 -0700 (PDT)
Received: from localhost (host-79-36-133-218.retail.telecomitalia.it. [79.36.133.218])
        by smtp.gmail.com with ESMTPSA id 63sm12440058wrh.71.2020.10.05.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 01:44:13 -0700 (PDT)
Date:   Mon, 5 Oct 2020 10:44:12 +0200
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Vladimir Davydov <vdavydov.dev@gmail.com>,
        Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luigi Semenzato <semenzato@google.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, cgroups@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2] Opportunistic memory reclaim
Message-ID: <20201005084412.GA735812@xps-13-7390>
References: <20201005081313.732745-1-andrea.righi@canonical.com>
 <20201005083516.GR4555@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005083516.GR4555@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 05, 2020 at 10:35:16AM +0200, Michal Hocko wrote:
> A similar thing has been proposed recently by Shakeel
> http://lkml.kernel.org/r/20200909215752.1725525-1-shakeelb@google.com
> Please have a look at the follow up discussion.

Thanks for pointing this out, I wasn't aware of that patch and yes, it's
definitely similar. I'll follow up on that.

-Andrea
