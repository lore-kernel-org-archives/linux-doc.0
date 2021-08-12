Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245ABC4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 13:08:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9FDE610A3
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 13:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbhHLNJT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 09:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbhHLNJT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Aug 2021 09:09:19 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2717C0613D3
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 06:08:53 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d2so5079066qto.6
        for <linux-doc@vger.kernel.org>; Thu, 12 Aug 2021 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xs8EmBt7Wwwk0rDo3WH++ioTrTW94g/xJg4dS2VTU70=;
        b=B5u5MqvyKhZf+vJdh29wKQ5uSD8KVQ0z4A9dz5siLPjFNEs9Fu1QKsbl48q8OWNNvx
         X4ln3uTu9KiU3bN7egPX0wn4rWzwnfWkD4P/g0gFBxGIu9O1Sf6TYSlH8mdfIAz8mErj
         6/PWaHr3fn5iEEtxLtwNcIJeYC4V2tN09GGiDZBWut3fVYh8EYt2ccqvTrlQ5K+ifegP
         zuYsHO0Nxi7bVcC2bq4BgAnOB6jAhAvKK9q6TdUr1otRZFE0dUqedOfPUNXl6r1YTguv
         vzFlBzPdQoSt6hcHDg2ohSM7NHejJkya7sFheFmnpVXUhaFzy2qGyo66NHt9MGVM9GaM
         Q/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xs8EmBt7Wwwk0rDo3WH++ioTrTW94g/xJg4dS2VTU70=;
        b=IufGk0fjbwFnZ6NoLBWDav8H2iFAvhXBr4MuAUJpTGr/yDqz9a5elZRFOQl8hhfCkE
         H/T4Rt7GkoynzfzSnTvcSAS9G2FAEVDkaOxLGFWzhvwtg9K5gBxWDwjqhE1c55ggjKwC
         Mjj58Bo+IjgfsedPscW4IxhVJ7xkf3a6h/H/Y+IqhJ/vMxHytoeA6nWiwrToKGKiR6kZ
         M7OLy/YRug0YNRdKGZnu1v7tK4un+ygaGuAye2kErYPtQCTbMBlhMDu64eDc9xMOtAHB
         7tbOpyvbIKCpwQj4gKgoT2Tsi4AtSYIklKy98SrR9DYZFPq8IbdBZbQG1DIUdNRc11Gi
         64ew==
X-Gm-Message-State: AOAM533Y/MkShlVNP6wavq3H368Gf9NyXB3B7ATmENijvHB47EzVBMIM
        jsZBO57DduPg8TPrECy1kZBJzw==
X-Google-Smtp-Source: ABdhPJyD1sQnwutEBQEi934zsMk0rmVovkjcAHalsbe125JSWOsOzFGplbTIi19IH9KQ5jnc9Xrcvg==
X-Received: by 2002:ac8:6b19:: with SMTP id w25mr3752598qts.222.1628773733005;
        Thu, 12 Aug 2021 06:08:53 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:d9fa])
        by smtp.gmail.com with ESMTPSA id d16sm1036744qte.3.2021.08.12.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 06:08:51 -0700 (PDT)
Date:   Thu, 12 Aug 2021 09:08:49 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] cgroup/cpuset: Enable memory migration for cpuset v2
Message-ID: <YRUdYQzxj8rswNyz@cmpxchg.org>
References: <20210811195707.30851-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811195707.30851-1-longman@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 11, 2021 at 03:57:07PM -0400, Waiman Long wrote:
> When a user changes cpuset.cpus, each task in a v2 cpuset will be moved
> to one of the new cpus if it is not there already. For memory, however,
> they won't be migrated to the new nodes when cpuset.mems changes. This is
> an inconsistency in behavior.
> 
> In cpuset v1, there is a memory_migrate control file to enable such
> behavior by setting the CS_MEMORY_MIGRATE flag. Make it the default
> for cpuset v2 so that we have a consistent set of behavior for both
> cpus and memory.
> 
> There is certainly a cost to make memory migration the default, but it
> is a one time cost that shouldn't really matter as long as cpuset.mems
> isn't changed frequenty.  Update the cgroup-v2.rst file to document the
> new behavior and recommend against changing cpuset.mems frequently.
> 
> Since there won't be any concurrent access to the newly allocated cpuset
> structure in cpuset_css_alloc(), we can use the cheaper non-atomic
> __set_bit() instead of the more expensive atomic set_bit().
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

LGTM.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
