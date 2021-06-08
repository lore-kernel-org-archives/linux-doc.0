Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583A6C49EBB
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 18:44:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45D39616E8
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 18:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbhFHSp6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 14:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbhFHSmn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 14:42:43 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0469FC061574
        for <linux-doc@vger.kernel.org>; Tue,  8 Jun 2021 11:39:59 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t9so17244067pgn.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 11:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggAVsZg/cXVvUqOkLCWYOUQSB2LS7JfS85VC4f/i35Q=;
        b=A+zfVz8+HcNRW0Fu44E5Rx1laJBsnN/evN5OVcSQxI6o5VY7aMp/wkbk7YZEddRyqf
         j6V+36FDLYuzRKK0DZJdGdBLB1Y5CRMIUggAtmTOBJhRrwD5l/9iHbx4GyRMeC21ZXxf
         5f54CDraX2aeQzPczl3kziJJa3SLjW7q/K6iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggAVsZg/cXVvUqOkLCWYOUQSB2LS7JfS85VC4f/i35Q=;
        b=oOkIoyp3W5xttZyh2W6iA8ZQ8NYL/0/p3YnLaoLg5x/Mau78W0rgmUbW38LG/C8oBb
         Vo2g9ZrMu05boSdW5hBMaBwluLGK8mJS3JJSqstDqVG+u+Hl+2izfqrqFgsqS+41TRVZ
         y+jzOixfEwkkJOp93B9eNeaVcnmvYBbtSogG7eU7922BrEak0bMDPQbELDoY5IwEcJhq
         xlMblithC9u5mPsgiBCEmpD8Ilj7wu6Z4Y9stl5e9LlBdQNxGRXmY9RYJrGmhM8X5E/5
         sttFtt48SOlQ/E9NCR2YYMRaAN92WDI6EeX5SPZi9IWqc5uZc4Qyn2yx1TI5CdQIMIQq
         chCQ==
X-Gm-Message-State: AOAM532QBw0Cl+QHRJT/uoiqhczPYwQ/Hr6xX4TcR7zIF6NDd0pTYo5R
        jvbHBisaqj0u867zVU4tBCZhDQ==
X-Google-Smtp-Source: ABdhPJxQcETaq1CxSn2r98DdBqfCgzxobh8dnkqILoMHMZd+vnkG8uyC7KrRE3gaJyWFsbkQFdmt4g==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr15958908pgi.323.1623177598571;
        Tue, 08 Jun 2021 11:39:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f6sm11613587pfb.28.2021.06.08.11.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:39:57 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Marco Elver <elver@google.com>,
        Christoph Lameter <cl@linux.com>,
        "Lin, Zhenpeng" <zplin@psu.edu>, Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <guro@fb.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v4 0/3] Actually fix freelist pointer vs redzoning
Date:   Tue,  8 Jun 2021 11:39:52 -0700
Message-Id: <20210608183955.280836-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:
- remove redundant size check
v3: https://lore.kernel.org/lkml/20201015033712.1491731-1-keescook@chromium.org
v2: https://lore.kernel.org/lkml/20201009195411.4018141-1-keescook@chromium.org
v1: https://lore.kernel.org/lkml/20201008233443.3335464-1-keescook@chromium.org

This fixes redzoning vs the freelist pointer (both for middle-position
and very small caches). Both are "theoretical" fixes, in that I see no
evidence of such small-sized caches actually be used in the kernel, but
that's no reason to let the bugs continue to exist, especially since
people doing local development keep tripping over it. :)

Thanks!

-Kees


Kees Cook (3):
  mm/slub: Clarify verification reporting
  mm/slub: Fix redzoning for small allocations
  mm/slub: Actually fix freelist pointer vs redzoning

 Documentation/vm/slub.rst | 10 +++++-----
 mm/slab_common.c          |  3 +--
 mm/slub.c                 | 36 +++++++++++++++---------------------
 3 files changed, 21 insertions(+), 28 deletions(-)

-- 
2.25.1

