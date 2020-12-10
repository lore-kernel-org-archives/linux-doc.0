Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14A5C1B0D9
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 13:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80F6123380
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 13:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733083AbgLJNcG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 08:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389243AbgLJNbp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 08:31:45 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456CAC0613D6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 05:31:05 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id r5so5476008eda.12
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 05:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xdKWFx7As5WQhB6lXNSMIunmMuyBYwJNfs7rR8dLvGc=;
        b=CHXSw/h9GW5LHuu9SfKgklpZ47nXCUiBE2ktkMnTHMF2VL3Q3rXDZwgVVNRNfjwyd+
         GWVeqfms+jPJ9aVpNQnQF6hvtMBIxcf7F/a1GRdb2dfovLrJW6ZurFvL7yaLYDiwRuxv
         9T4Sz30S7jC/mG5UUflI1dVSlzquj0Up8LC8niS0bv9moNu79Vf/bQ9e5AsUpBxwf9ma
         jf1oRWPUKnNN+GohB14v3b5foGVVTTI0n3SqRilkfipqfSqesDandjF1aRvDbx63QAG7
         yzLJdsFBuUGqt40LfDqnTCKhYALGRpAStiAikcbuOCUT3gqhCmM26xWUBlZM/8ucwSjz
         NOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xdKWFx7As5WQhB6lXNSMIunmMuyBYwJNfs7rR8dLvGc=;
        b=E0hgyrsbuPiyoYyfKT0DXGTj+HMvzJ/YXztR1Hh9lTJHjmK5j9Hyf6BSa2kHfV8254
         6jknWSuQ6Dq3YgpnCJJ/z4HCHlQjk0uom0o38R1CF5eZR6X96OS0MuUhfNVBne0wmzQb
         m8XdFRWSQjvWVBp77DT/Rnu5Kb/LfXStVUCFhHwIbKk8h8NV+0D5W9irxoVWd//Are7S
         RtWXbJt92XTLdhrDZTMBBSX6VFQbFHlytrX/ui720t6YN114qav1Rq0RglkV55kt1Ji+
         nFd1O/sMfR2XRE5ARY5XtDsBkIuCCdn22HMM+QxwbyWLGCv6shypOAcVzoIKcAjpZVg/
         ZjRw==
X-Gm-Message-State: AOAM533hQCCYBuEC5Q5kyjaNtKt8BuYucxuWsJtdEHXzWgQijTx7R83X
        i2YCElMRE942dAo4Z0PHKitH2c/YPGV5JUXJL6ZsjQ==
X-Google-Smtp-Source: ABdhPJzjiwcU5gpiJXFnUPKVjP5LrNBBrTK80UKsop7IXkpvDRJXmeaAY+K2LZPUJbdCmPVj8SzF69LNTT9YzS8U3UA=
X-Received: by 2002:a50:e00f:: with SMTP id e15mr7080744edl.210.1607607064065;
 Thu, 10 Dec 2020 05:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
 <20201210004335.64634-2-pasha.tatashin@soleen.com> <CAM9Jb+g2B+uXH+Vj_FSMAh18j3DAKn4zKyAZNB_t8hSQ90a=mg@mail.gmail.com>
In-Reply-To: <CAM9Jb+g2B+uXH+Vj_FSMAh18j3DAKn4zKyAZNB_t8hSQ90a=mg@mail.gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 10 Dec 2020 08:30:28 -0500
Message-ID: <CA+CK2bDorS54XA7i2yNCD4X5vjDCpwtm41P6aNOc-AbYknGo5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] mm/gup: perform check_dax_vmas only when FS_DAX is enabled
To:     Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
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
        "Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, Johannes Thumshirn
        <jthumshirn@suse.de>, Logan Gunthorpe" <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

Thank you.
