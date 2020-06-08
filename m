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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02401C433E2
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1AE82078C
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0vCuj7/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgFHUaM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 16:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgFHUaJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jun 2020 16:30:09 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236D9C08C5C4
        for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2020 13:30:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s10so9306698pgm.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2020 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3aGjJb+SFCgbH1QR4qEyyNpswmebOC9dMx5KktTyRAY=;
        b=m0vCuj7/HMKj8LSAsCe28r/RdgwulMsQWvDx4GkQwHIEjphbMGrF4xuNmQn/qzV9+P
         NHM9b6uC7TQqXD7Cjv/8FNJvMYz6XM367b5d7qqa6YR4SikYK7cOlltn83+c7Dzofhq8
         QSoa28KTy0oUo5qrZ7xXEARtZUr+lf46Nw8mDHr0YK06nzRonN/nMVJ2eBgjtiReNKYq
         uLSIkJpAv0Nmyx1VrkhEP7XzpfMlordTBzxJO3qZtQpxY7mA20+oS79t70fHfA+5SOWV
         QEYSwocVp1W9GksiaIzfxBtP5d6RNT3EL1P53K0aDY1p6WVoJYNQGFVExmYiDfRACA4A
         GvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3aGjJb+SFCgbH1QR4qEyyNpswmebOC9dMx5KktTyRAY=;
        b=by3nDYJB7NI9XFfk8ggogH3mowavzA0i5nTH4qY2DID0Deo1nzFydOEW8llLsnRHxR
         VGd5r0uCQofIxe6RWCwHahh+I3Jxd/EvO8spCl3CgFN1BCzEhnXzUYTOjqyIgclIrjp1
         6ps6VgEC8+Jg2g4XbkBI1ZUHNmEGOSa6JiwQBp8TOUUICa5ndLvzK83lrlyk3shOxmNo
         Rf6glZlE/RR+t4A8ZRI4s3ixWHoCYvQtEO5dMktmGtLLiZbLj/2r8NDyA6Mu6h8Oefp/
         pJDZEpGwPp3SXMppjr1fX68yeUdINmfqC/scTHGl9ZdJTatIjG7Q36UKKoyL2FE8cSNe
         8fQA==
X-Gm-Message-State: AOAM533XD/Gui02F1C5Expi1VgwwhiEbuRLfju+CamQ2athvF6oweJq1
        AiRmzrgoTw7/wJgt8khx7Uh4lgOu85k=
X-Google-Smtp-Source: ABdhPJyflpJA9qV4KrdEOI2bocCaM44SokagbDjaVUpP1R0LmfrhdrynzigEQQh+12R/LGldzOopSg==
X-Received: by 2002:aa7:96e9:: with SMTP id i9mr23297458pfq.232.1591648207353;
        Mon, 08 Jun 2020 13:30:07 -0700 (PDT)
Received: from kir-rhat.lan (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id l25sm6629190pgn.19.2020.06.08.13.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:30:06 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 2/4] docs/scheduler/sched-design-CFS: formatting fix
Date:   Mon,  8 Jun 2020 13:29:59 -0700
Message-Id: <20200608203001.1316755-3-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608203001.1316755-1-kolyshkin@gmail.com>
References: <20200608203001.1316755-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the rendering of the paragraph. Before the fix, the first line is
rendered in bold (I'm not quite sure why) and is also separated from the
rest of the paragraph, which is rendered with an indent.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/scheduler/sched-design-CFS.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
index a96c72651877..59b2d1fb4dc4 100644
--- a/Documentation/scheduler/sched-design-CFS.rst
+++ b/Documentation/scheduler/sched-design-CFS.rst
@@ -34,9 +34,9 @@ In CFS the virtual runtime is expressed and tracked via the per-task
 p->se.vruntime (nanosec-unit) value.  This way, it's possible to accurately
 timestamp and measure the "expected CPU time" a task should have gotten.
 
-[ small detail: on "ideal" hardware, at any time all tasks would have the same
-  p->se.vruntime value --- i.e., tasks would execute simultaneously and no task
-  would ever get "out of balance" from the "ideal" share of CPU time.  ]
+   Small detail: on "ideal" hardware, at any time all tasks would have the same
+   p->se.vruntime value --- i.e., tasks would execute simultaneously and no task
+   would ever get "out of balance" from the "ideal" share of CPU time.
 
 CFS's task picking logic is based on this p->se.vruntime value and it is thus
 very simple: it always tries to run the task with the smallest p->se.vruntime
-- 
2.26.2

