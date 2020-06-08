Return-Path: <SRS0=QfIF=7V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A431C433E0
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2855620760
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St43IBko"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgFHUaM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 16:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgFHUaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jun 2020 16:30:10 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1ADC08C5C5
        for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2020 13:30:09 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x207so9053819pfc.5
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2020 13:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Fj33uQOGHCmvR69cSAVqplFFi460/8NtL6Y8SbnBjo=;
        b=St43IBkoho787vQETbbkzGYywaqGyT+fjuFOLOp3j0evGOaNTseRdnb0f59TQBi4CK
         sdi9+knn8iHjWdy2yoy7gCddYa+9yKbTXH2jk0G6QJw2OKR1eWtXbqKodHotxQfyMmV8
         QKPg2XlEjRzbpj+12k6vTI+hZlnvhCX7SPWtBd7MMj5OzqISlwGDx5Nfry7EKRPABEqP
         990YAE/x0gq/e3wNjl0TYLTWRGvIYpS3CuaTaXnczoEfMZuppVtZI+wBTym9jh9ZrXs5
         hxLeyP2uZERhpawgLTPFJkDAneuI8Z2mvfc6TRqw7XCb736UXxLyqyhMXe3AZZhzHWGs
         RwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Fj33uQOGHCmvR69cSAVqplFFi460/8NtL6Y8SbnBjo=;
        b=Rw6ynXDoT6qZTbTvCgR4oDUn/eu+cN0RMK12zIkCR8ZpzNU9hmXj7DaaR2LHn6JieW
         Z4YJwfh0KuFdFZlWJVdBP2truIyPWA35C+pXvAE3ayablYNZ6PYHTjOq65EZy8wZonPJ
         GyWOhLjo4cjlzvT3CqtW/4MQrYfVKptH5f5dEt939TpXDkpbf1dubBkZawF0cJdF6pU8
         AGGmxP+NR5X/ggYxcUy3oVsNBOvSiB2nzsNEVKNk3yOpA4Ru90BYwsR+AM2+aeGCRaQK
         ZT0xSDFUiuzrEBMpmFP3GySWe1V39P+NWGSJzklkbSeV7AXMHXImSbezJ4o1JBh4Hhln
         0ifw==
X-Gm-Message-State: AOAM5317zoQGA9JzGYXI+Bvwgy2z0gN/bfT9hRYah2+BM1/0LlGD9vpZ
        5JjzzdL9VlsoraEFtHIPf02HFOnJ3YE=
X-Google-Smtp-Source: ABdhPJwmUL89Fbky89qNn1eEco0D+2Y+LCuN5DFe6HIPgxg9iDMivL257lWYXvbb0jRKHVhGg/myWw==
X-Received: by 2002:a05:6a00:1511:: with SMTP id q17mr23004441pfu.16.1591648208540;
        Mon, 08 Jun 2020 13:30:08 -0700 (PDT)
Received: from kir-rhat.lan (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id l25sm6629190pgn.19.2020.06.08.13.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:30:08 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 3/4] docs/scheduler/sched-bwc: fix note rendering
Date:   Mon,  8 Jun 2020 13:30:00 -0700
Message-Id: <20200608203001.1316755-4-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608203001.1316755-1-kolyshkin@gmail.com>
References: <20200608203001.1316755-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/scheduler/sched-bwc.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
index 437a332f5b80..3037c363b3fd 100644
--- a/Documentation/scheduler/sched-bwc.rst
+++ b/Documentation/scheduler/sched-bwc.rst
@@ -2,8 +2,9 @@
 CFS Bandwidth Control
 =====================
 
-[ This document only discusses CPU bandwidth control for SCHED_NORMAL.
-  The SCHED_RT case is covered in Documentation/scheduler/sched-rt-group.rst ]
+.. note::
+   This document only discusses CPU bandwidth control for SCHED_NORMAL.
+   The SCHED_RT case is covered in Documentation/scheduler/sched-rt-group.rst
 
 CFS bandwidth control is a CONFIG_FAIR_GROUP_SCHED extension which allows the
 specification of the maximum CPU bandwidth available to a group or hierarchy.
-- 
2.26.2

