Return-Path: <SRS0=dZE6=2D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCF9C35254
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CC3624796
	for <linux-doc@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMXNLsI0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbfLMOyn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Dec 2019 09:54:43 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34211 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbfLMOyn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Dec 2019 09:54:43 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so6978503wrr.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2019 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Uo6+XZGMNTkft0H6aZfy4bG5kDxQR0Iolx1l0XRUcio=;
        b=GMXNLsI0WWja/RR+HGlhdm3ZA3pmxghfYWYqBVMdP7AiaL+MXIf+YZQmltb7doRgFV
         EDsLpRgqRbOJtUZJHLlXGvGdvYQji91fTSN/Nhcw6vzc+i1BfcOdD6mDf+C9bnc1Be8O
         36LWJu5d/s+jH9jWBZVinuJ0mpuz/CkJ/w/OhenH9i2ezoAxyuGGQjhpOpPgKWovJekv
         YLDFX01/dNXB5P3jQo4VnJFE4PNYIPckEFZMkl6Htm5mhdoJg2+pRRu044fFPFgKvM7+
         2JpRL5tJJdTw8+Uwk27fQXEvOi2aPy6aGp7wvJG/VCvKR0MwB/PpSvLTFF45VlbBtPPC
         L42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Uo6+XZGMNTkft0H6aZfy4bG5kDxQR0Iolx1l0XRUcio=;
        b=WEOtdtg1g4z0D3CxowQJPp7vWqQsjh15V2LHJdwbszhUlFYWZCDUwaazhEfqsiZo/N
         1g2fDimP3G7JG5dE6xYCFYBgzEGIjl2Lgb78Cg/es1NSjulS6h1q6mxoWWgluGamPNQt
         A2csHRA7SJCxz4KSQ0DHkO61PZXpfc3+GOBLPEpClK28E1JB8vgqE31MSMrfRHIP7G6J
         OF8mZ73atXlrIy5D0mma2H5rZsNaYbfrOvHYconNahnOpYLx7fosDznKBKAgdyT8ScZ2
         HnCKhtegbwjQX3aLM3LG+4QQuHzOnzdAC+NOTLTMKXFybf2khnzdjC8if6jLIslCZtRK
         jpDg==
X-Gm-Message-State: APjAAAWCVWI7pmXm8ChJ0QLOEPaPTGMh3CN4zjaqE5AfUelvhwFsw3Rs
        EQCXFx1BINj1i7S9Q2U7paMo3A==
X-Google-Smtp-Source: APXvYqynfeDaiazOqnf+uPa0CaJht8vTImScZqHs/rULucW5sFyMc6N54mDM1cJXTFkrzsZ0H6bLjg==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr13026144wrp.292.1576248881480;
        Fri, 13 Dec 2019 06:54:41 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:54:d457:4f7b:f42c])
        by smtp.gmail.com with ESMTPSA id n189sm10002979wme.33.2019.12.13.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 06:54:40 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v3 0/6] Describe CoreSight topology using sysfs links.
Date:   Fri, 13 Dec 2019 14:54:25 +0000
Message-Id: <20191213145431.24067-1-mike.leach@linaro.org>
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

This patchset applies on top of the recent CTI patchset [1].

Adaptation of an original patchset [2] from Suzuki, reusing 2 patches
unchanged with update to 3rd adapt to the new common code for trace
path and CTI component links & add a default connections group.

Tested on Juno r1, DB410c; kernel 5.5-rc1

[1] https://lists.linaro.org/pipermail/coresight/2019-December/003504.html
[2] https://lists.linaro.org/pipermail/coresight/2019-May/002803.html

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

