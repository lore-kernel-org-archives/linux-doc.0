Return-Path: <SRS0=WXCa=4P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E424C11D3D
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 524C824688
	for <linux-doc@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUIf5v99"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgB0POY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 10:14:24 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54914 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729685AbgB0POX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Feb 2020 10:14:23 -0500
Received: by mail-wm1-f65.google.com with SMTP id z12so3982550wmi.4
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2020 07:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qOuCrOwr9icy0lhM+HGSUbOmDx9He9WGKHL3ShagQ/g=;
        b=jUIf5v994+e1mMqOD41hRNu7xJfMj1/GQDAkOqJVsUEiO0DCh9Fh0GLTeoP/qqyjIB
         FqSd1SpWCvwjcX5PfrfdDSi4C/Uquw0hYnw2zlgn0O2hQ4jKXC9fM5tHygyInNtOPiI5
         KhRYAHBIVXEjD4OqevWKYevePEZqtRAxi3i1cUZ7ROvogd0GngDKXBMoLliSKLqa7Xg8
         FmjZ4pnbNznQ3Kw9qWHtaJGcU/iCW1+xi8LVT7TIQ+hWF+TlaLPny9KyaPuYMCKu5FWa
         Y3rHDkiq3uW+Paog1ccC3MCAtbCkMDmZUcbHos7Vgw3UpqBH9anv4rrZHx0eq5mI5SQ/
         IXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qOuCrOwr9icy0lhM+HGSUbOmDx9He9WGKHL3ShagQ/g=;
        b=Vn9VS2EKogRm6sXeLChtAw8MjDpgR5F8ZKI6e73PPQt9p33ReT0CEgMTCO6aVN5jQy
         XU1YiKshcMZceHGLuRcyrn2YxGiza9CP3fZNCRu/FeeFbVCvIeainXoCCBLCg9zKvtdh
         f+PomJHakA+zg/kSIJ8hWXhDhruNAf6r73b5VVaUMf6gNBkC9sljOoZds2fl9enYzFml
         cChrhBIJxXs6N0knIjyMWBlq3VVWhMMg6rDZ3UoPYWgyIH51ZS7wR1/jUNHpKqyag0H2
         AaT7az8FJR7gkBJHIPAHg+lZ8Z1iZrdAzu5A2shk4h0SYSAsS2DoJv7cT9BERmWMOAdn
         dfJQ==
X-Gm-Message-State: APjAAAWRqfDwCyRP4NOFIJ5TlUgaY+TDtoRMm812YtNzCOVTk8TenjWE
        Q9gZwe6RPpxx6PND7vDnDeFMBg==
X-Google-Smtp-Source: APXvYqwhU877pPDZ1WNgWTWR4BXz8ryUlRcInZw/5SRoIW9k/2nEM6T06hXmvHcN636rvDIurMWaQA==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr15581wmi.112.1582816461524;
        Thu, 27 Feb 2020 07:14:21 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6801:1801:2dc1:e60d:4b1c:70e0])
        by smtp.gmail.com with ESMTPSA id q12sm8973079wrg.71.2020.02.27.07.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 07:14:19 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 0/6] Describe CoreSight topology using sysfs links
Date:   Thu, 27 Feb 2020 15:14:10 +0000
Message-Id: <20200227151416.14271-1-mike.leach@linaro.org>
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

This patchset applies on top of the recent CTI v10 patchset [1].

Adaptation of an original patchset [2] from Suzuki, reusing 2 patches
unchanged with update to 3rd adapt to the new common code for trace
path and CTI component links & add a default connections group.

Tested on Juno r1, DB410c; kernel 5.6-rc3

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2020-February/714140.html
[2] https://lists.linaro.org/pipermail/coresight/2019-May/002803.html

Changes since v4:
1) Rebased for v10 CTI set[1].
2) Code for adding in the CTI->[other CoreSight] links revised to ensure
consistent create / release process. Warn on highly unlikely event that
link cannot be made & remove any programmatic association between the
components.

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
  coresight: Add generic sysfs link creation functions
  coresight: cti: Add in sysfs links to other coresight devices
  coresight: docs: Add information about the topology representations

Suzuki K Poulose (3):
  coresight: Pass coresight_device for coresight_release_platform_data
  coresight: add return value for fixup connections
  coresight: Expose device connections via sysfs

 .../trace/coresight/coresight-ect.rst         |   5 +-
 Documentation/trace/coresight/coresight.rst   |  85 ++++++++
 drivers/hwtracing/coresight/Makefile          |   3 +-
 drivers/hwtracing/coresight/coresight-cti.c   |  52 ++++-
 .../hwtracing/coresight/coresight-platform.c  |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
 drivers/hwtracing/coresight/coresight-sysfs.c | 204 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight.c       |  75 ++++---
 include/linux/coresight.h                     |  22 ++
 9 files changed, 428 insertions(+), 32 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-sysfs.c

-- 
2.17.1

