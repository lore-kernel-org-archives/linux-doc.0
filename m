Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 16B237D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Jun 2019 19:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfF0Ttj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Jun 2019 15:49:39 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35321 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfF0Ttj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 15:49:39 -0400
Received: by mail-oi1-f180.google.com with SMTP id a127so2503694oii.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=indeed.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AesOW3EmeuBjZTWgdRCKfU4DW0QAsRu61r3/LGTQTg8=;
        b=NCZODYSjpvpfxj59czkgru2M6MbuOf355ojoS6qv35oesf0ZPEKewPbzf8Q6hUTwNZ
         63GC9qzntLhV3BXxzsA1wfMonAydRnckvGu7+Ty6+pC2zHJpo0wDteG4b3WNGiac6WEN
         get4j9BzPfJbNVLnEdYRJcAD/bpv4qOuVvgK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AesOW3EmeuBjZTWgdRCKfU4DW0QAsRu61r3/LGTQTg8=;
        b=kSIK5Hzvucijifw1a3ZGQQSacQIh0M9194PY1hg/eV8YkyD83fGGKvS9X7FGLZJG2G
         KMnuDurMLwW519NyYWhTuc9WxwsAFGYw8GzjSfi7eZBvI8EISGda1WCtBV1EJACfUMkB
         n1AUmSxtNMaPdr24i+gOe05dBEOTNH28+06utBNVrDZ7cJmD4Xv2vru5WA0pjoSkjfNI
         OehWKLsivs6q2ENddnwD5TRIhwAz1bDnb1XxHCaeP4lkk/cI96cIeLfXQJV6egSh5RSY
         y5l70BTDWurRzsotXGWhYYMCA3hQA8Q6DHPFlRNKZnwk18S5+DEInPYh1CtzrDbAymOy
         Qq0w==
X-Gm-Message-State: APjAAAUvJY0QmIHK6O8U7JlJBnYXHeIHqjwLmF/58mFnNmxXbYXaJ+qC
        oqgnT/j0qCrp57ne6OiYa/kowA==
X-Google-Smtp-Source: APXvYqyVAP6KFgB2RBp3IQGLzuIHqYp8k5AhEcsIAc1tToG/shUzilO1cd2B6XGEl8mHP2WOzj0kvQ==
X-Received: by 2002:aca:cfd0:: with SMTP id f199mr3076083oig.50.1561664978390;
        Thu, 27 Jun 2019 12:49:38 -0700 (PDT)
Received: from cando.ausoff.indeed.net ([97.105.47.162])
        by smtp.gmail.com with ESMTPSA id d200sm1148032oih.26.2019.06.27.12.49.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 12:49:37 -0700 (PDT)
From:   Dave Chiluk <chiluk+linux@indeed.com>
To:     Ben Segall <bsegall@google.com>, Pqhil Auld <pauld@redhat.com>,
        Peter Oskolkov <posk@posk.io>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v5 0/1] sched/fair: Fix low cpu usage with high throttling by removing expiration of cpu-local slices
Date:   Thu, 27 Jun 2019 14:49:29 -0500
Message-Id: <1561664970-1555-1-git-send-email-chiluk+linux@indeed.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog v5
- Based on this comment from Ben Segall's comment on v4
> If the cost of taking this global lock across all cpus without a
> ratelimit was somehow not a problem, I'd much prefer to just set
> min_cfs_rq_runtime = 0. (Assuming it is, I definitely prefer the "lie
> and sorta have 2x period 2x runtime" solution of removing expiration)
I'm resubmitting my v3 patchset, with the requested changes.
- Updated Commit log given review comments
- Update sched-bwc.txt give my new understanding of the slack timer.

Changelog v4
- Rewrote patchset around the concept of returning all of runtime_remaining
when cfs_b nears the end of available quota.

Changelog v3
- Reworked documentation to better describe behavior of slice expiration per
feedback from Peter Oskolkov

Changelog v2
- Fixed some checkpatch errors in the commit message.
