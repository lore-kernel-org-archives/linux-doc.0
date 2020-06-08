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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E02C433E1
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7C5320774
	for <linux-doc@archiver.kernel.org>; Mon,  8 Jun 2020 20:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbTPTWhS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgFHUaM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Jun 2020 16:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgFHUaI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jun 2020 16:30:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3280DC08C5C3
        for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2020 13:30:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t7so9280846pgt.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2020 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3XfAK5pnFFhGWurVUDDniB49rggC6BOIPpbTDY2TCXo=;
        b=sbTPTWhSRUWO+2MYIyFl2HSJxA4Wef4hHoI8hh1eHZ/qQmKO2aGb2KEeVT10Tbukmh
         WFzY0fJE1ey+nZ+bSpIgPCftEnBVJ+fN3j4l7E8uRoVMnDEuw6Rh5jWilhfFhT8IQ3Zp
         nPVABoYIeGqd1pKxi0+DjVZEVIMK/MpK7Sjn6zdl5lnGGTdmntFrGDR7Ude7y6KYiqQt
         HLzbnISSssBnjlgrTwP2CNeDVt793XysJWhberVku7u8QgbjUDqN/k/gyzWC167v6J8j
         /MKYUnNy4xG2AFbchfbQ3BbpIWkm+iSzKwUTF5yabgn6sMtUJv5Hqu4G3IUNh0cQXugH
         LXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3XfAK5pnFFhGWurVUDDniB49rggC6BOIPpbTDY2TCXo=;
        b=lK27Fi2nsBLeabkDCU0zBqi3NSmeODU9Nw8NzQlS01PO+mSMhIZKs4WycMCXssFWN8
         qxCextYAz2kq9HD6Zk3uhfej4qSlutMyednHX49TpmhO2CfEUBtZ5TYmKrVqCnXOtjNv
         0aVQ+XMwEn96CzvgfvCdIA4GoDLUw+1pBbcBHmzkQKzzJaKhqt+HmGLm0pKrkK7QR0eD
         FU+0jFBpwPrDioMA423JFAQ91lo3pUdi6/iG8KR9hYEKlXrLZLzl51V2JcanSJIz0zCh
         JvvRZ3OHzkmfnVFWiF/bZdLFUDTXnDC5VEVclg+09NYsA12pSkM3rgVkPNzlcawau7P/
         SgJQ==
X-Gm-Message-State: AOAM532aPZrrwy2Eyjy5iqp0mV87HwqRg9Nl/cVkG4O6nqHU8t7AhB9q
        Fe/CUVMaZ3zKzlycUZxCwGmPAsiQOLE=
X-Google-Smtp-Source: ABdhPJztw+Qy7WcGQUllb6Ls6U/oHfI3tFpTWXKJKBtDSWQVp64R/SKXbRyFziDP1hdTJMtdOH0ngA==
X-Received: by 2002:aa7:868b:: with SMTP id d11mr21729399pfo.52.1591648206439;
        Mon, 08 Jun 2020 13:30:06 -0700 (PDT)
Received: from kir-rhat.lan (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id l25sm6629190pgn.19.2020.06.08.13.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 13:30:05 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 1/4] docs/scheduler/sched-bwc: formatting fix
Date:   Mon,  8 Jun 2020 13:29:58 -0700
Message-Id: <20200608203001.1316755-2-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608203001.1316755-1-kolyshkin@gmail.com>
References: <20200608203001.1316755-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit d6a3b247627a3 these three lines are merged into one by the
RST processor, making it hard to read. Use bullet points to separate
the entries, like it's done in other similar places.

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/scheduler/sched-bwc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
index 9801d6b284b1..437a332f5b80 100644
--- a/Documentation/scheduler/sched-bwc.rst
+++ b/Documentation/scheduler/sched-bwc.rst
@@ -25,9 +25,9 @@ Management
 ----------
 Quota and period are managed within the cpu subsystem via cgroupfs.
 
-cpu.cfs_quota_us: the total available run-time within a period (in microseconds)
-cpu.cfs_period_us: the length of a period (in microseconds)
-cpu.stat: exports throttling statistics [explained further below]
+- cpu.cfs_quota_us: the total available run-time within a period (in microseconds)
+- cpu.cfs_period_us: the length of a period (in microseconds)
+- cpu.stat: exports throttling statistics [explained further below]
 
 The default values are::
 
-- 
2.26.2

