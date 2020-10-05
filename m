Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D03BC4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:35:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAA1E20795
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="S4gB3z/m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgJEIfT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 04:35:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:46786 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbgJEIfT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Oct 2020 04:35:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1601886918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M/qp0fLfgx7dAgjinAVpQgpni2765Ce4IvEm/FFiEZc=;
        b=S4gB3z/m1iDjvIhYuT/Oo9vTHKPrQfJbETOKd/f0q+M1Gq8paxKVZyhiEMZ+d3AvilmJuh
        EjOy5bC2Yw8QLsGNk6ALURk/VXqScBH3RkkZNVfmsh8DAkfUFn+IjMfS8nbx4hKnHXI+8Z
        OFuU3MK8JEqA8XRoDkvwdjcDxq9ZDxM=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E393AAF7F;
        Mon,  5 Oct 2020 08:35:17 +0000 (UTC)
Date:   Mon, 5 Oct 2020 10:35:16 +0200
From:   Michal Hocko <mhocko@suse.com>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Vladimir Davydov <vdavydov.dev@gmail.com>,
        Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luigi Semenzato <semenzato@google.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, cgroups@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2] Opportunistic memory reclaim
Message-ID: <20201005083516.GR4555@dhcp22.suse.cz>
References: <20201005081313.732745-1-andrea.righi@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005081313.732745-1-andrea.righi@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A similar thing has been proposed recently by Shakeel
http://lkml.kernel.org/r/20200909215752.1725525-1-shakeelb@google.com
Please have a look at the follow up discussion.
-- 
Michal Hocko
SUSE Labs
