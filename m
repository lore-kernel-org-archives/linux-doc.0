Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBBAC122
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdCx5rS+"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B541E8;
	Mon, 16 Oct 2023 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697520327; x=1729056327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=R2Jsg78czvuZbCB0J7ctuq7XItBBFyIcdUtpVY0Wy+4=;
  b=CdCx5rS+vsR1U94YyuI5Nd84A9pvyQHaeW86dL3IBm9kKk8rlNALP+nm
   Vq0vSgi78cne8l1VGUbQOKz+NiMTircQV6dRfv0p7icsnTxzKh09d+gNA
   p1AqxAYbPUXhDqxtvw6ryOcavdVsD9PiTibHPzx201iswcg3zl6PT6l5G
   9aMAZMtmYpuB2yY9qEklFLR+cdP8XHiHDqvRQORznl8sy6euo3Acp2T6q
   k62rsK7rHtxbGaafat3E1fHk4lruVNZPE+lwKCVTz5Vb7SsiAZAPTL7PG
   zmJ/AZ7xb6AUQB9O1QrjtUvZzxIvGMQMs9CIvilN0TiZdLkIOfSIpHQ7R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388561793"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="388561793"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 22:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087358023"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1087358023"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 22:25:22 -0700
From: lakshmi.sowjanya.d@intel.com
To: tglx@linutronix.de,
	jstultz@google.com,
	giometti@enneenne.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	mallikarjunappa.sangannavar@intel.com,
	thejesh.reddy.t.r@intel.com,
	lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1 6/6] ABI: pps: Add ABI documentation for Intel TIO
Date: Tue, 17 Oct 2023 10:54:57 +0530
Message-Id: <20231017052457.25287-7-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
References: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Document sysfs interface for Intel Timed I/O PPS driver

Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
---
 Documentation/ABI/testing/sysfs-platform-pps-tio | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-pps-tio

diff --git a/Documentation/ABI/testing/sysfs-platform-pps-tio b/Documentation/ABI/testing/sysfs-platform-pps-tio
new file mode 100644
index 000000000000..d8be3a6d5795
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-pps-tio
@@ -0,0 +1,7 @@
+What:		/sys/devices/platform/INTCxxxx/enable
+Date:		January 2024
+KernelVersion	6.8
+Contact:	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
+Description:
+		(RW) Enable or disable PPS TIO generator output, read to
+		see the status of hardware(Enabled/Disabled).
-- 
2.17.1

