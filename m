Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA462F29
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB21A12D;
	Mon, 13 Nov 2023 22:35:07 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3D49DA7;
	Mon, 13 Nov 2023 22:35:52 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EDE773F7B4;
	Mon, 13 Nov 2023 22:35:04 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/mm: Drop pte_bad() descriptions from arch page table helpers
Date: Tue, 14 Nov 2023 12:04:56 +0530
Message-Id: <20231114063456.339652-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pte_bad() never existed unlike similar helpers at PMU, PUD, and PGD level.
This was added erroneously and hence should be dropped instead.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/mm/arch_pgtable_helpers.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/mm/arch_pgtable_helpers.rst b/Documentation/mm/arch_pgtable_helpers.rst
index c82e3ee20e51..2466d3363af7 100644
--- a/Documentation/mm/arch_pgtable_helpers.rst
+++ b/Documentation/mm/arch_pgtable_helpers.rst
@@ -18,8 +18,6 @@ PTE Page Table Helpers
 +---------------------------+--------------------------------------------------+
 | pte_same                  | Tests whether both PTE entries are the same      |
 +---------------------------+--------------------------------------------------+
-| pte_bad                   | Tests a non-table mapped PTE                     |
-+---------------------------+--------------------------------------------------+
 | pte_present               | Tests a valid mapped PTE                         |
 +---------------------------+--------------------------------------------------+
 | pte_young                 | Tests a young PTE                                |
-- 
2.25.1

