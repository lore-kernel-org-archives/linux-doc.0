Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3081C43457
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 03:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4334322255
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 03:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IOO8H0dW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgJODhR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Oct 2020 23:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387412AbgJODhQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 23:37:16 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A4FC061755
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 20:37:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d6so814692plo.13
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 20:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jsm32m5dqMZ9IiRke0HVSKp+LJR7Zhu1oKQCmbEY7PY=;
        b=IOO8H0dWn3N0RbwRjQeTPWULpmZsYMrAismeJ5mH3OIt63p1U2lVGjxYmRLmMP5NfM
         tAjyUj4Rf2dDJbKAZfDVfzlR+h90Ty8QSbdPN1PTkMwi+qQa36geDK7sbfpGiRau26gQ
         wCtjFU5m8bUXpmG20GId8iynohBSJPr50lXmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jsm32m5dqMZ9IiRke0HVSKp+LJR7Zhu1oKQCmbEY7PY=;
        b=HfxkfTgFnTDGFe+rtc5lIgM80Q+kRbW8b8vTgbtWwW+OIeG5rF84C5sQfER94zgMWF
         eKTxkpZLHYxAZOlrOtiF8ILshEheBvD8WuH4GN3y9+mnd70hlS4GlajcbmSqywB94YzI
         zxn6LWd9IqOJRbdD4R/DtQRFyuejM8w4/3AOq6EGQOF54vLo70LNnkWFoioLA7GZ/BUY
         UFgSB+q0oqvD1bC1o5E5enbqOurbHnHGhuQ1dHI33eKnMZeowJAt0HcAn2XJ3oimg/37
         8AJVN7N23g1unljnfP4hz2sDKV2CqX0wOHHMXdnYjbGWktMWIxXyaI++UgRNnnVZ9HfJ
         oDlA==
X-Gm-Message-State: AOAM531Bg4C4o8wsljSBIcm+G4ts2mVQRN6a9AswPYC1bP850ws6VQ5c
        C9j4oL1V0aDhBRuuha1tlIjpXg==
X-Google-Smtp-Source: ABdhPJx1504xJWTWPoVAFTEpicwDTBJJ7j3HEOcF90ph658Opd7eFK0JH7ITgILQct6plxjGXI0JWQ==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr2307849pjn.127.1602733036268;
        Wed, 14 Oct 2020 20:37:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q21sm1139267pgg.45.2020.10.14.20.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 20:37:14 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Christoph Lameter <cl@linux.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>,
        Marco Elver <elver@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v3 0/3] Actually fix freelist pointer vs redzoning
Date:   Wed, 14 Oct 2020 20:37:09 -0700
Message-Id: <20201015033712.1491731-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:
- fix commit messages to properly reflect the direction of the overwrite
- justify the less-than-word-size patch better
- add Acks
- move some Fixes up into the commit log as just references
v2: https://lore.kernel.org/lkml/20201009195411.4018141-1-keescook@chromium.org
v1: https://lore.kernel.org/lkml/20201008233443.3335464-1-keescook@chromium.org

This fixes redzoning vs the freelist pointer (both for middle-position
and very small caches). Both are "theoretical" fixes, in that I see no
evidence of such small-sized caches actually be used in the kernel, but
that's no reason to let the bugs continue to exist. :)

Note on patch 2: Christopher NAKed it, but I actually think this is a
reasonable thing to add -- the "too small" check is only made when built
with CONFIG_DEBUG_VM, so it *is* actually possible for someone to trip
over this directly, even if it would never make it into a released
kernel. I see no reason to just leave this foot-gun in place, though, so
we might as well just fix it too. (Which seems to be what Longman was
similarly supporting, IIUC.)

Anyway, if patch 2 stays NAKed, that's fine. It's entirely separable,
and the other 2 can land. :)

Thanks!

-Kees


Kees Cook (3):
  mm/slub: Clarify verification reporting
  mm/slub: Fix redzoning for small allocations
  mm/slub: Actually fix freelist pointer vs redzoning

 Documentation/vm/slub.rst | 10 +++++-----
 mm/slub.c                 | 36 +++++++++++++++---------------------
 2 files changed, 20 insertions(+), 26 deletions(-)

-- 
2.25.1

