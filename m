Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A84C3DA66
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 13:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbjHYNiO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 09:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbjHYNh6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 09:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01936213B
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692970583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=adBV5QdoIxMd11EUvCs5qDeDIAAmKS8CbHIBdJKT2cc=;
        b=GgzhEudvwkwUISR+ZdSFn6DaeL5nf6d4URfY3mdof6YCrmtPs3tUkV8z/LYlOB4snLVv/S
        k4T5sLgnHFB4YjgYEvKFZY0bCvqI41hN+MZ4HaEPjBe7vuIPhfcDS1TU2uPLI9fwTvYPAS
        gYX+7Hsibqv5koaN30oN+OURwed0i+k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-3aOaglZRObqjTREfWm_vgA-1; Fri, 25 Aug 2023 09:36:21 -0400
X-MC-Unique: 3aOaglZRObqjTREfWm_vgA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31aecb86dacso657177f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 06:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692970580; x=1693575380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adBV5QdoIxMd11EUvCs5qDeDIAAmKS8CbHIBdJKT2cc=;
        b=FdgjpHz1B8QUsN3MSbD/xBzGmRmYfZ1T/m9TnprulHA277GuhtTAwnct7zKJlWKQ+c
         GsLeEEh69TtoKHN527AGkrtTv32gqYj9rjccwTxupGDIxt7W6kqoAVgVM4vwka7RVFrQ
         OxCwHnS52FOxjsP7cq+mGL1Pl0+Pp5KLm0H9HLb2XC4sKpYMCGj5hff90Bi8JUk/a/Lw
         1JE6VMotXbJRyO+GehufCVU5Ga2H9SiARsu34bk4S5MIIwa3n191dJtfLDJydnRX3rTe
         K0Dj/z2z9j8qpcAJfm3QHWIqAK8XtDN8KZaqIT9YdkVTrqc/EXLUlo7Hv/7Y48NZL4P2
         g+8Q==
X-Gm-Message-State: AOJu0YyViBBrL+kl6zLuW5G3B8oKXSuAu4hMkyRqBN7VrqY5UhyJCVpc
        PwU7jqdqf9Lm4otpV+87MXdtAYptg35EbEjUVO4zDwN597wnbLD8bahVi3R2CcZzKNWl9piDkMy
        9gzyjKO8gP4k+0ZfoBls=
X-Received: by 2002:a5d:4211:0:b0:31c:769d:287c with SMTP id n17-20020a5d4211000000b0031c769d287cmr3990217wrq.50.1692970580506;
        Fri, 25 Aug 2023 06:36:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESApNQupeVzOoGH4xg/snp9WaQNwtnffnKK9WmFU7GZsNrMOGWLSfcHEOPViwtO0QwkRmx6A==
X-Received: by 2002:a5d:4211:0:b0:31c:769d:287c with SMTP id n17-20020a5d4211000000b0031c769d287cmr3990199wrq.50.1692970580113;
        Fri, 25 Aug 2023 06:36:20 -0700 (PDT)
Received: from klayman.redhat.com (net-2-34-31-124.cust.vodafonedsl.it. [2.34.31.124])
        by smtp.gmail.com with ESMTPSA id e11-20020adffd0b000000b0031b2c01f342sm2253915wrr.87.2023.08.25.06.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:36:19 -0700 (PDT)
From:   Marco Pagani <marpagan@redhat.com>
To:     Jerome Glisse <jglisse@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Marco Pagani <marpagan@redhat.com>,
        Mika Penttila <mpenttil@redhat.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs/mm: remove references to hmm_mirror ops and clean typos
Date:   Fri, 25 Aug 2023 15:35:46 +0200
Message-ID: <20230825133546.249683-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clean typos and remove the reference to the sync_cpu_device_pagetables()
callback since all hmm_mirror ops have been removed.

Fixes: a22dd506400d ("mm/hmm: remove hmm_mirror and related")
Signed-off-by: Marco Pagani <marpagan@redhat.com>
Reviewed-by: Mika Penttilä <mpenttil@redhat.com>
---
 Documentation/mm/hmm.rst | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 9aa512c3a12c..1e0f2b2f58fb 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -163,16 +163,7 @@ use::
 
 It will trigger a page fault on missing or read-only entries if write access is
 requested (see below). Page faults use the generic mm page fault code path just
-like a CPU page fault.
-
-Both functions copy CPU page table entries into their pfns array argument. Each
-entry in that array corresponds to an address in the virtual range. HMM
-provides a set of flags to help the driver identify special CPU page table
-entries.
-
-Locking within the sync_cpu_device_pagetables() callback is the most important
-aspect the driver must respect in order to keep things properly synchronized.
-The usage pattern is::
+like a CPU page fault. The usage pattern is::
 
  int driver_populate_range(...)
  {
-- 
2.41.0

