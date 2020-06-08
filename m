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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764F0C433E4
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5157720760
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARfoW1ao"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgFHUaN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 16:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgFHUaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jun 2020 16:30:10 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B60C08C5C6
        for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2020 13:30:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q24so337540pjd.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2020 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EBPtUj8afxKuQMaZSBGqisdK1m9kQZRts0a7iDTKvME=;
        b=ARfoW1aoA5GBquZyTE35hnWbvFGSGUdCkbKJYup37dQmA63rcQv3+ypbfinjPC+FWT
         AMxT8YFxEXtJA1qTIcPdCey37JPqL4fZuraDgbtH5qh5sq4wtMY21XNmVzKqWT/zgNoK
         sfcxzhI/DwBhctzzNznSTX9Uys8hl/11TRnnja+Qjb+o2AhzjfyP66a4v8l+RHsEdio7
         zOxOslwNjLxSJ2ZrfsiqDkr77uhUg9bP/FrbZInz5SzWXG5lpyiW7ouVaTpohysEccYY
         xyYHiJJIOMNTSwNQpqAK+IXaC+qGSzj05E0cxmGRC+7QAyQ+DrMszY9IiQD8uYFKkGwq
         ioHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EBPtUj8afxKuQMaZSBGqisdK1m9kQZRts0a7iDTKvME=;
        b=icjdwv8at2S98Uw1epSeqXLdZJsBKTGUH/Chqam0sjV/TlGMX2R59avxgS5rgzDvNs
         YqZnEAot3xWS8N3lZXQyBoB7dsJnfMNG/iYT3cW55DpeIMQPif3NSxMjA0DhfAs1pLmO
         b4+vSpxj/7CstEIsSPHRKDT343eJAupDzRzxsMW0tSNFt2LAWUPcsDQFpyr7oYyIm9nx
         GkoEzHEnh6UubmUw+IRzZK4Pg3uoVgRjhESYmJmB/qVTUzvNpE8xHkOKs7iaJNn8Gg5b
         93hE6fR+WzWxTt11xQ5Ka9Yzajfg076mr4fea2iPe7W+m6G88WARTM8uaGlE2/o4AX7A
         1yAg==
X-Gm-Message-State: AOAM5334BZn9vCfaenl/Uk789wv2hWssIbB5WfEUXD+5GvrSewO6/7LK
        lUXauIk9BKHFpDzFQJ2Y7wQMrPr5xoc=
X-Google-Smtp-Source: ABdhPJzzt+NQcim7hKFgUU1i83aHUP2zeoUMcduJJpzRpTSomL2FRjTRRGKfB7UFR0BGRY7T+BBcVg==
X-Received: by 2002:a17:90a:ae04:: with SMTP id t4mr1005970pjq.75.1591648209536;
        Mon, 08 Jun 2020 13:30:09 -0700 (PDT)
Received: from kir-rhat.lan (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id l25sm6629190pgn.19.2020.06.08.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:30:08 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 4/4] docs/scheduler/sched-bwc: note/link cgroup v2
Date:   Mon,  8 Jun 2020 13:30:01 -0700
Message-Id: <20200608203001.1316755-5-kolyshkin@gmail.com>
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
 Documentation/scheduler/sched-bwc.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
index 3037c363b3fd..9003998b2843 100644
--- a/Documentation/scheduler/sched-bwc.rst
+++ b/Documentation/scheduler/sched-bwc.rst
@@ -26,6 +26,10 @@ Management
 ----------
 Quota and period are managed within the cpu subsystem via cgroupfs.
 
+.. note::
+   The cgroupfs files described below are only applicable to cgroup v1. For
+   cgroup v2 API, see :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2>`.
+
 - cpu.cfs_quota_us: the total available run-time within a period (in microseconds)
 - cpu.cfs_period_us: the length of a period (in microseconds)
 - cpu.stat: exports throttling statistics [explained further below]
-- 
2.26.2

