Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E83C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 16 Dec 2022 18:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiLPSSq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Dec 2022 13:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbiLPSSb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 13:18:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73430654D8;
        Fri, 16 Dec 2022 10:18:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 211E2B81DE4;
        Fri, 16 Dec 2022 18:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264FDC433EF;
        Fri, 16 Dec 2022 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1671214701;
        bh=vRbKCiLdExOTUt5BW7wyrYFNrRg54Ri2oAjQj3d/9yk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Bln6FejpwP8y1LDhKqmy+1hWW84LthPXn0iMaqmr7jjsV8vUCNoa3AbTP6gTXvcnt
         5k1MnZzSKSjSw8zGq4T3SDYvSuIrSIPn0I5ykHvHgLObdmF1BnKHrl2EV/YTJxvSLm
         jUEqZ7JjMxY2xhleRkc/9KbfpeUuDBAyINIcUquE=
Date:   Fri, 16 Dec 2022 10:18:20 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Mina Almasry <almasrymina@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Huang Ying <ying.huang@intel.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Yosry Ahmed <yosryahmed@google.com>, weixugc@google.com,
        fvdl@google.com, bagasdotme@gmail.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] Revert "mm: add nodes= arg to memory.reclaim"
Message-Id: <20221216101820.3f4a370af2c93d3c2e78ed8a@linux-foundation.org>
In-Reply-To: <Y5xASNe1x8cusiTx@dhcp22.suse.cz>
References: <20221202223533.1785418-1-almasrymina@google.com>
        <Y5bsmpCyeryu3Zz1@dhcp22.suse.cz>
        <Y5xASNe1x8cusiTx@dhcp22.suse.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 16 Dec 2022 10:54:16 +0100 Michal Hocko <mhocko@suse.com> wrote:

> I have noticed that the patch made it into Linus tree already. Can we
> please revert it because the semantic is not really clear and we should
> really not create yet another user API maintenance problem.

Well dang.  I was waiting for the discussion to converge, blissfully
unaware that the thing was sitting in mm-stable :(  I guess the

	Acked-by: Michal Hocko <mhocko@suse.com>
	Acked-by: Shakeel Butt <shakeelb@google.com>
	Acked-by: Muchun Song <songmuchun@bytedance.com>

fooled me.


I think it's a bit premature to revert at this stage.  Possibly we can
get to the desired end state by modifying the existing code.  Possibly
we can get to the desired end state by reverting this and by adding
something new.

If we can't get to the desired end state at all then yes, I'll send
Linus a revert of this patch later in this -rc cycle.

