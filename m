Return-Path: <SRS0=QfIF=7V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D58C433DF
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CEEB2076C
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQ/jl2WS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgFHUaM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 16:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgFHUaH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jun 2020 16:30:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A04DC08C5C2
        for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2020 13:30:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 23so8154007pfw.10
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2020 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=frQmUGiLn436u7E2znzuBBFKmobeNPn0I81YQJdqiCQ=;
        b=uQ/jl2WSBNAfVU4pzf7aHfIB7GqEmLjbCxKXPKRPFMMvCJWGoo8GiGZXMseChuU5xP
         wZPzPpKU4r4xnmwNDwGyvt6T7pqWIYOs7esiz2GT5M5FjNXZNeTVCQHtYsF1PbsY2xYH
         AcZTMdc1K2qZ2nxVw5jlgFLph6WnPXujUUU4S5nUv/syjOVxSpQe/PKBXGeg/AxgpLA2
         d6+MszXUEmOuIlQlxmoFKy8w9mkPzGhqzrU8jCdfbTa2Yt55xlk4JdHexhDiVwm5P6q4
         3oMr4yid8xlEpCc1jMscDXNTpfw44bzyA3a3ZPLgOT2Wr5WhMN99yqaKr4qKIj5HuGyS
         Ci6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=frQmUGiLn436u7E2znzuBBFKmobeNPn0I81YQJdqiCQ=;
        b=d7hePMLeBntdyfyzNVud4xN/tolYFB/Qp3/IziC7+n70hP6il59hby66KWiP8VFOTC
         NGNWNXW+BHsFVisCjFcf8MB1uParNndVUwlzqBR65BGM0kCvdAYAJ/Xu7ZVjySE1MGhA
         jZb8QiFpr48P9qx+w5XK5qX2LgMT6sylW5tgQD51R/P6TuIKt2kWByLZHgWn//8PAHi2
         Dyt5/qgSoRd3B99me19GmAd0c2SefmuVPHaOwMwGy7K/4cquI1qNalYD5hGVW4f5lEJr
         bOm7PUkKQhdphmYWbGtkoi+ZJdp1wpoo6FzixSNROAvYdYtvy4CFxQ3DqlgmTNI5efj6
         rcCQ==
X-Gm-Message-State: AOAM533Op2G5ITMgHtzcMXaMeBDyTlXQYH9j6vajeiwvOOIb4TpYd27w
        yFv0TYGDIsfo1hfTXp5DaA8UV2391Io=
X-Google-Smtp-Source: ABdhPJzFonHVNA8ETnFM99SNEBDW3QQ4twcCpr6SWadGbMUrwOH9+qv78ZBC0xzeZRLxsgkAXUA3Cw==
X-Received: by 2002:aa7:8f25:: with SMTP id y5mr22784467pfr.82.1591648205422;
        Mon, 08 Jun 2020 13:30:05 -0700 (PDT)
Received: from kir-rhat.lan (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id l25sm6629190pgn.19.2020.06.08.13.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:30:04 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 0/4] Formatting fixes for docs/scheduler
Date:   Mon,  8 Jun 2020 13:29:57 -0700
Message-Id: <20200608203001.1316755-1-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While reading through docs at [1], I noticed a few glitches in
formatting, which this patchset is trying to fix.

[1] https://www.kernel.org/doc/html/latest/scheduler/


Kir Kolyshkin (4):
  docs/scheduler/sched-bwc: formatting fix
  docs/scheduler/sched-design-CFS: formatting fix
  docs/scheduler/sched-bwc: fix note rendering
  docs/scheduler/sched-bwc: note/link cgroup v2

 Documentation/scheduler/sched-bwc.rst        | 15 ++++++++++-----
 Documentation/scheduler/sched-design-CFS.rst |  6 +++---
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.26.2

