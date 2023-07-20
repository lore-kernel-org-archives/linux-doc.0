Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06B9EB64DD
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 23:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjGTXXz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 19:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGTXXy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 19:23:54 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6FE812709;
        Thu, 20 Jul 2023 16:23:53 -0700 (PDT)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
        by linux.microsoft.com (Postfix) with ESMTPSA id AB9B6236EBE2;
        Thu, 20 Jul 2023 16:23:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AB9B6236EBE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1689895432;
        bh=SA9Rg3cMgQ7b1lFGvwN/QhJbcx0qd36JOXDv4dAQXxY=;
        h=From:To:Cc:Subject:Date:From;
        b=cVupQpfkOgBO/eAATTcmC1NeKzfe8T3WsdUXDeZPP7LR4RW3+9TH2nGRt3emkuyYJ
         Q38NW7QQpLKa1Sn/BKofbm4IIths4zBfi1zkNRXn4/MHO/c26lOcnBj2SGHgnTsxCP
         rnzqimOFAkzmLzcF671NKwvUXJTiOUFl9SwVTU+U=
From:   Easwar Hariharan <eahariha@linux.microsoft.com>
To:     stable@vger.kernel.org
Cc:     easwar.hariharan@microsoft.com, catalin.marinas@arm.com,
        will@kernel.org, corbet@lwn.net, robin.murphy@arm.com,
        joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Subject: [PATCH 5.15 0/4] ARM64 errata for stable kernel 5.15 and above
Date:   Thu, 20 Jul 2023 16:23:30 -0700
Message-Id: <1689895414-17425-1-git-send-email-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Easwar Hariharan <easwar.hariharan@microsoft.com>

This series works around a few ARM64 errata. Please pick these up for
v6.1 and v6.4 as well.

Cc: Catalin Marinas <catalin.marinas@arm.com> 
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
Robin Murphy (1):
  iommu/arm-smmu-v3: Document MMU-700 erratum 2812531

Suzuki K Poulose (3):
  arm64: errata: Add detection for TRBE overwrite in FILL mode
  arm64: errata: Add workaround for TSB flush failures
  arm64: errata: Add detection for TRBE write to out-of-range

 Documentation/arm64/silicon-errata.rst      |  16 +++
 arch/arm64/Kconfig                          | 115 ++++++++++++++++++++
 arch/arm64/include/asm/barrier.h            |  16 ++-
 arch/arm64/kernel/cpu_errata.c              |  65 +++++++++++
 arch/arm64/tools/cpucaps                    |   3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  41 +++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |   1 +
 7 files changed, 256 insertions(+), 1 deletion(-)

-- 
2.25.1

