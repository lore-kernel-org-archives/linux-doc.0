Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D2027D91B
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Aug 2019 17:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389079AbfHGRQZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Aug 2019 13:16:25 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33843 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389052AbfHGRQY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Aug 2019 13:16:24 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so41792984plt.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2019 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xT1EUv7l9ELnBbW3Pj9GyH6zMTpmJcDHOSB5E5y40eQ=;
        b=cpS86uEmYIzhxFzCySaqqOeImVDTWodZUXCQVQcRGqqRAGGDs1sNZw0oH3tmy2iZOE
         XkIu9l2OhfxN0xt6NyH+lVLF+8mXgqz7NSPIIJ+egtHoGZEtUgQY7iySTu1NQl565je/
         qL/IqLU05tBxt6AwDFcVVWZEJCirczwMCOG/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xT1EUv7l9ELnBbW3Pj9GyH6zMTpmJcDHOSB5E5y40eQ=;
        b=mVTnv6Ci9CO4ZoFPrALFRFw/iuIbrPAgU2b9gtfVM0rh3JhwGhk5UI9V0QwRj73b9Q
         Q42SHZlFyDKGiUtZmFgauZeNjQ7X7e9KZ9wyuQzdXgTaZtzAqWxUKnyvx7SL+qWl9MC0
         MJJrca57dS7Oj/pHNcEcelTtkFmJ58j0fJm0pwAVY85O/yxANTIqF6OJtOF5gm6GJ8E+
         7g/bBaaEWBqk9Kbl2lLcjxqRmpVwmybktUXirfC/v4pbcCpAyQBPQlfdaqyMrpefhNlP
         0Cd3TVLU/vopRQXxKtEkZ/Kw/N7qIVwIeqi/mJblWEg2SFJDtXbnWlowDokJTNsH7k3H
         cszQ==
X-Gm-Message-State: APjAAAVeSmcCVdCw9+GiWFqGMant4BoYOdoiYVFDaShOsMUelflQpKTf
        dR4OMKpF6Bou8Vg4tf2APgJuGw==
X-Google-Smtp-Source: APXvYqwugi3AW6n6dfP+TB/Uc5APuLJqoUYRpEzJ6Mn8Htn03idxWxXllDnzug9Hw6aLl8p384B8Ag==
X-Received: by 2002:a17:90a:1785:: with SMTP id q5mr950338pja.106.1565198183794;
        Wed, 07 Aug 2019 10:16:23 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id a1sm62692130pgh.61.2019.08.07.10.16.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 10:16:23 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>,
        Brendan Gregg <bgregg@netflix.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Hansen <chansen3@cisco.com>, dancol@google.com,
        fmayer@google.com, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, joelaf@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@linux.ibm.com>, minchan@kernel.org,
        namhyung@google.com, paulmck@linux.ibm.com,
        Robin Murphy <robin.murphy@arm.com>,
        Roman Gushchin <guro@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, surenb@google.com,
        Thomas Gleixner <tglx@linutronix.de>, tkjos@google.com,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 5/6] page_idle: Drain all LRU pagevec before idle tracking
Date:   Wed,  7 Aug 2019 13:15:58 -0400
Message-Id: <20190807171559.182301-5-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190807171559.182301-1-joel@joelfernandes.org>
References: <20190807171559.182301-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

During idle page tracking, we see that sometimes faulted anon pages are in
pagevec but are not drained to LRU. Idle page tracking only considers pages
on LRU.

I am able to find multiple issues involving this. One issue looks like
idle tracking is completely broken. It shows up in my testing as if a
page that is marked as idle is always "accessed" -- because it was never
marked as idle (due to not draining of pagevec).

The other issue shows up as a failure during swapping (support for which
this series adds), with the following sequence:
 1. Allocate some pages
 2. Write to them
 3. Mark them as idle                                  <--- fails
 4. Introduce some memory pressure to induce swapping.
 5. Check the swap bit I introduced in this series.    <--- fails to set idle
                                                            bit in swap PTE.

To fix this, this patch drains all CPU's pagevec before starting idle tracking.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 mm/page_idle.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/page_idle.c b/mm/page_idle.c
index 2766d4ab348c..26440a497609 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -180,6 +180,13 @@ static ssize_t page_idle_bitmap_read(struct file *file, struct kobject *kobj,
 	unsigned long pfn, end_pfn;
 	int bit, ret;
 
+	/*
+	 * Idle page tracking currently works only on LRU pages, so drain
+	 * them. This can cause slowness, but in the future we could
+	 * remove this operation if we are tracking non-LRU pages too.
+	 */
+	lru_add_drain_all();
+
 	ret = page_idle_get_frames(pos, count, NULL, &pfn, &end_pfn);
 	if (ret == -ENXIO)
 		return 0;  /* Reads beyond max_pfn do nothing */
@@ -211,6 +218,13 @@ static ssize_t page_idle_bitmap_write(struct file *file, struct kobject *kobj,
 	unsigned long pfn, end_pfn;
 	int bit, ret;
 
+	/*
+	 * Idle page tracking currently works only on LRU pages, so drain
+	 * them. This can cause slowness, but in the future we could
+	 * remove this operation if we are tracking non-LRU pages too.
+	 */
+	lru_add_drain_all();
+
 	ret = page_idle_get_frames(pos, count, NULL, &pfn, &end_pfn);
 	if (ret)
 		return ret;
@@ -428,6 +442,13 @@ ssize_t page_idle_proc_generic(struct file *file, char __user *ubuff,
 	walk.private = &priv;
 	walk.mm = mm;
 
+	/*
+	 * Idle page tracking currently works only on LRU pages, so drain
+	 * them. This can cause slowness, but in the future we could
+	 * remove this operation if we are tracking non-LRU pages too.
+	 */
+	lru_add_drain_all();
+
 	down_read(&mm->mmap_sem);
 
 	/*
-- 
2.22.0.770.g0f2c4a37fd-goog

