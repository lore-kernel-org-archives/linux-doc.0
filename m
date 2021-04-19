Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BB4C43461
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1A6961166
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237832AbhDSHiV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhDSHiU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:20 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9AFC061761
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:50 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z5so2937857edr.11
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kipd4FaBQ5PXB3dpojcZn5niu7bqNibIYxBeruWL79Q=;
        b=HgY0j0ha4IQEbIMeD9Jl48Vj45hJ4hoD/OU1s1L/4qjVu40ZRRM+j/PhoOkDT72RGh
         nipew/w97g5MPmGHjZiCi0WqU893BLWIXQIv2wi8yfScayy8jYkf54Pr5rvKYbTu1H6a
         P+1X3W5hiXxKlCiLRsN1CG0vrQfaaNaMGiYd3RwK0yx0+y8i8DS5onooeNmV+aIEGnTr
         d6Yb0iUBCD1E7seTllm2S4LdrHnfP4Q5nMRQREO3tRUNEiyaV14wnYVScgFd+0tUMMLz
         ZVSccZMvl3008dKEpojweGcCdWfRCOibARopscS/p+W1CgCLMuAWYpU66O18WW4Lf6Yw
         FODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kipd4FaBQ5PXB3dpojcZn5niu7bqNibIYxBeruWL79Q=;
        b=Ti91IyCMw7ECHd1NvdeD5Mw5Iqy7uQzOWB0Oxsegz/2dzRuuBRdzqS+ghajDVFPT0w
         6+/vOm35uDDNVT7rktTE65EUvvX3P6Owa/T2X5wS18y/+CZsNBL/hCLD6BtVydobtFiC
         Mx96IPaL1e5eOVAeXRvHYxL6/2k5I4iJqb/eZc0FHQroo2tTxx+yP5paM8es0qC9OBm6
         S6hyalDaGJJLlTbZnS3sqVgYmLdfYLlWXpbJoLC7sCZPQZzvT0Auvj0YWn0y4MppdqYQ
         BTt1lgvhbIHajS2LXdeppofKeDAll9rY2kmJytGRuDGDI/LTCxu6he64lazHqoGX/cEU
         cJ6Q==
X-Gm-Message-State: AOAM5309J6MVjE8IhVzmdj7tKuYFE66OtmSwken9Xi7DrQ0ThJC018hV
        /FhId3g9YVTiTnqosi8Mhv/UEA==
X-Google-Smtp-Source: ABdhPJwio9uJB3Uc4HMRjvrjpbjH/azmfAkxVmWp1DsH7TlNNfhzbFcIKbUImJGSbhTYOUnhUi0ldQ==
X-Received: by 2002:a05:6402:440d:: with SMTP id y13mr24222456eda.316.1618817869619;
        Mon, 19 Apr 2021 00:37:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:37:49 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCHv5 for-next 02/19] Documentation/sysfs-block-rnbd: Add descriptions for remap_device and resize
Date:   Mon, 19 Apr 2021 09:37:05 +0200
Message-Id: <20210419073722.15351-3-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gioh Kim <gi-oh.kim@cloud.ionos.com>

Two sysfs entries, remap_device and resize, are missing.

Signed-off-by: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 Documentation/ABI/testing/sysfs-block-rnbd | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-block-rnbd b/Documentation/ABI/testing/sysfs-block-rnbd
index 14a6fe9422b3..ec716e1c31a8 100644
--- a/Documentation/ABI/testing/sysfs-block-rnbd
+++ b/Documentation/ABI/testing/sysfs-block-rnbd
@@ -44,3 +44,15 @@ Date:		Feb 2020
 KernelVersion:	5.7
 Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
 Description:	Contains the device access mode: ro, rw or migration.
+
+What:		/sys/block/rnbd<N>/rnbd/resize
+Date:		Feb 2020
+KernelVersion:	5.7
+Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
+Description:	Write the number of sectors to change the size of the disk.
+
+What:		/sys/block/rnbd<N>/rnbd/remap_device
+Date:		Feb 2020
+KernelVersion:	5.7
+Contact:	Jack Wang <jinpu.wang@cloud.ionos.com> Danil Kipnis <danil.kipnis@cloud.ionos.com>
+Description:	Remap the disconnected device if the session is not destroyed yet.
-- 
2.25.1

