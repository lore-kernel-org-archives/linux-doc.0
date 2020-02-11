Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695C2C352A3
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E96E20842
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cx1fFHVy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgBKK6S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 05:58:18 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55548 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbgBKK6R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Feb 2020 05:58:17 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so2874273wmj.5
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2020 02:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iEzg9BEEGNGWOvSlwBHFmI6M0qcjXSJtDCpjQK6W6Sg=;
        b=cx1fFHVyHFRomjgKw39VKbvL1ogvaAEB1bQwnLJyOFhCy7TNrsx6qPCMtaUZcrOA0p
         xrGtwWEDrFrlqZV1/zS10lbGxCw+qHQUXmpSc4fD5L9VE1XIcsc9NkQE0+/jhgvghR22
         iX7qAYLd6PUKZsYPuWzDicXBofxVV/8EWMjAAgV34j/fFRN96WsmZp9Dl12dSoHw2Drv
         aOemJsF7/nRsEvt5/Urk58ic8BtOgnRoEWi83bL3obfD1klhwhoOxpHa+sI1tGNnbPPF
         PnZKilUj8XuHg3+QuFv07XLsQ2TohqLBgPOLCda2CvLrIhTCqGnaSk/jpJ95UVDNgS0X
         v4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iEzg9BEEGNGWOvSlwBHFmI6M0qcjXSJtDCpjQK6W6Sg=;
        b=CfISdBz0Z78JQ9jWBlMZ7o1FPnLTdyMSWOnvuZW2dM4+dpuJ838cwBl0KpXQYQDgs3
         iFSF0aC9G6htb/nFoScu3tzsT7pWpsDnAxTxCgjZSKjFs/RA54+X0+9xni8fHnafE56U
         9mpZPQNDJXttkp/zmwK9eZQwkodZedewcHf4saFLcRrpDVzbk+ooz8E5cRSnLHvWhIFz
         iLC421eAvkDxPqkfSpWS16SJqIoycanKVbBNL7lRmnudJ82hmeRlyojTfbD/VB2I9alG
         HdyWoVwVtOpAWLwsx/omXe0/0fH6HJVLAiwYLxT6gDLNcrEqb3grVQSSmhI2m4g1swwk
         2N5g==
X-Gm-Message-State: APjAAAU/o6hIhFr46F2icq+1eU85v7YRFNKgI+GHelcQwxJPzTX6BW8i
        oxu3tftkMN1cJXD2Xmov9zSa5Q==
X-Google-Smtp-Source: APXvYqzi9ytc7tkCd57rjQAPshy2dZOQR2inPwqc4U8hc63ppgXzcVR1EfEUOa5WNS8ZnJV5CWM9/Q==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr5065765wmf.110.1581418695902;
        Tue, 11 Feb 2020 02:58:15 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g21sm3171291wmh.17.2020.02.11.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:15 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 0/6] Describe CoreSight topology using sysfs links.
Date:   Tue, 11 Feb 2020 10:58:02 +0000
Message-Id: <20200211105808.27884-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The connections between CoreSight sources, links and sinks is not obvious
without documentation or access to the device tree / ACPI definitions for
the platform.

This patchset provides sysfs links to enable the user to follow the trace
patch from source to sink.

Components in the trace path are updated to have a connections sysfs
group, which collates all the links for that component.

The CTI components which exist aside from the main trace patch, also
have an added connections directory showing connections to other
CoreSight devices.

This patchset applies on top of the recent CTI v9 patchset [1].

Adaptation of an original patchset [2] from Suzuki, reusing 2 patches
unchanged with update to 3rd adapt to the new common code for trace
path and CTI component links & add a default connections group.

Tested on Juno r1, DB410c; kernel 5.6-rc1

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2020-February/709923.html
[2] https://lists.linaro.org/pipermail/coresight/2019-May/002803.html

Changes since v3:
1) Rebased onto 5.6-rc1 kernel with CTI set[1].

Changes since v2:
1) Fixed issues with signature ordering noted by Suzuki.
2) Alterations to main CTI set[1] to overcome issue noted by Matthieu.

Changes since v1:
1) Code from original v4 CTI set moved here so that all connections related
code in this set.
2) Connections directory mandatory for all CoreSight components and
generated as part of the registration process.

Mike Leach (3):
  coresight: Add generic sysfs link creation functions.
  coresight: cti: Add in sysfs links to other coresight devices.
  coresight: docs: Add information about the topology representations.

Suzuki K Poulose (3):
  coresight: Pass coresight_device for coresight_release_platform_data
  coresight: add return value for fixup connections
  coresight: Expose device connections via sysfs

 .../trace/coresight/coresight-ect.rst         |   5 +-
 Documentation/trace/coresight/coresight.rst   |  85 ++++++++
 drivers/hwtracing/coresight/Makefile          |   3 +-
 drivers/hwtracing/coresight/coresight-cti.c   |  41 +++-
 .../hwtracing/coresight/coresight-platform.c  |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
 drivers/hwtracing/coresight/coresight-sysfs.c | 204 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight.c       |  75 ++++---
 include/linux/coresight.h                     |  22 ++
 9 files changed, 420 insertions(+), 29 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-sysfs.c

-- 
2.17.1

