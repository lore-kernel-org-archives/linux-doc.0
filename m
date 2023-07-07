Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B26EB64D9
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 05:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjGGFdq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 01:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjGGFdq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 01:33:46 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 86EBA171D;
        Thu,  6 Jul 2023 22:33:44 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE846D75;
        Thu,  6 Jul 2023 22:34:25 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.48.50])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B8CE3F740;
        Thu,  6 Jul 2023 22:33:38 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [RFC 0/4] arm64/mm: Clean up pte_dirty() state management
Date:   Fri,  7 Jul 2023 11:03:27 +0530
Message-Id: <20230707053331.510041-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These pte_dirty() changes make things explicitly clear, while improving the
code readability. This optimizes HW dirty state transfer into SW dirty bit.
This also adds a new arm64 documentation explaining overall pte dirty state
management in detail. This series applies on the latest mainline kernel.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

Anshuman Khandual (4):
  arm64/mm: Add SW and HW dirty state helpers
  arm64/mm: Call pte_sw_mkdirty() while preserving the HW dirty state
  arm64/mm: Add pte_preserve_hw_dirty()
  docs: arm64: Add help document for pte dirty state management

 Documentation/arch/arm64/index.rst     |  1 +
 Documentation/arch/arm64/pte-dirty.rst | 95 ++++++++++++++++++++++++++
 arch/arm64/include/asm/pgtable.h       | 66 ++++++++++++++----
 3 files changed, 147 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/arch/arm64/pte-dirty.rst

-- 
2.30.2

