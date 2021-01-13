Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E1CC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 01:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBD662343B
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 01:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbhAMXoH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 18:44:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729463AbhAMXmA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 18:42:00 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133AEC061388
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 15:40:47 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id 22so4721908qkf.9
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 15:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eWOJblEmC2Qz30+n062pHjcbFMkB3dcTw0EMbDyU9wY=;
        b=g7Myi4v2XKsgahixTj7abmQLC+QpYM/NxeNwy/T8Ur/tenbnt6MQs8Sid+jONGzRNm
         AI4vOuYLwnMplCgfxZdoOUxfSCGGPzTI0rBZZeDZLugknRZWcI1fBRE7t0Y26Bq1lhDn
         D2v+ZmEhMwZe5THa8LEBL/6+hwEc80GktfKyYBm9B2dFlfu8sXyyEgUNb6rVw4bNvV9F
         rjHEQn6/W+mNOc2uFt1hqrzZBmxkdb7iifCZ1CZKz5lTnPfzjqD/9qPOCswmP7TaTbe9
         SrkZUewTrJw/en30riV5ldgu6rAHbskg6Z5JXS+Yk1vFxG1U42IhrdUMlq8PkrzzN+3a
         wzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eWOJblEmC2Qz30+n062pHjcbFMkB3dcTw0EMbDyU9wY=;
        b=mO9Sc8A2VolwHGC4JqWemgsc6upwHfMviATu0jdoYvA22k3mJy4NnkeIrgQU9D6LCW
         1PZmB6WVROSpSP+3eUMFq/jngYqRFqt98Q3I0x6WMl3/ikJRgctid82Ebofh4BmP6+vf
         hy1Hnz7aSHLxONEg6k1/mYj4btzOCp8bmxw9jHr08vOewDkecIN17lhDrkw1t4s9rOnJ
         UmWAFDMvkmLoH5mCFo5MkneFpJoOm57m4gwGYNn3dKWZlVsBDzhpGgiR1OBLrwn+EPEU
         peIkds5de/9X0x0ifWq+6JyQM4GCJTUDnh7GxHKkkZOnbaoxxsoaAjLHDePldvo6a7LB
         O0DQ==
X-Gm-Message-State: AOAM530tbOaHHUFKu13zfpQk10JzkBBOfay+jVQGgt2U+/Rah+LGhTS+
        tMm1I9pWdKkhxK5rPiOwtrCjIA==
X-Google-Smtp-Source: ABdhPJy0csB1QSw/8eYTomPSY9yssASx5+uIbw+aIaQIxvw9keP0iEvsHPmZYqbPjcaIzfDKssrusA==
X-Received: by 2002:a05:620a:673:: with SMTP id a19mr4538618qkh.353.1610581246377;
        Wed, 13 Jan 2021 15:40:46 -0800 (PST)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id y13sm2147803qkb.17.2021.01.13.15.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 15:40:45 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kzpkq-000htB-US; Wed, 13 Jan 2021 19:40:44 -0400
Date:   Wed, 13 Jan 2021 19:40:44 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures,
 honor failures
Message-ID: <20210113234044.GF4605@ziepe.ca>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-9-pasha.tatashin@soleen.com>
 <20201217205048.GL5487@ziepe.ca>
 <CA+CK2bA4F+SipkReJzFjCSC-8kZdK4yrwCQZM+TvCTrqV2CGHg@mail.gmail.com>
 <20201218141927.GM5487@ziepe.ca>
 <CA+CK2bDULopw649ndBybA-ST5EoRMHULwcfQcSQVKT9r8zAtwQ@mail.gmail.com>
 <20210113195528.GD4605@ziepe.ca>
 <CA+CK2bDDUMOeCH8rQBL7fBdHCAUZBOykyXNL2N=hmxq7xi0giQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bDDUMOeCH8rQBL7fBdHCAUZBOykyXNL2N=hmxq7xi0giQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 13, 2021 at 03:05:41PM -0500, Pavel Tatashin wrote:

> Makes sense, I will remove maximum retries for isolation, and retry
> indefinitely, the same as it is done during memory hot-remove. So, we
> will fail only when migration fails.

It would be good to make this also as a stand alone pre-fix as well..

Thanks,
Jason
