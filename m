Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB58634F;
	Tue, 28 Jan 2025 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073872; cv=none; b=XZE8hM8qbK+dMGWbOXVxXJ2RvmxMJjWMyr0oqXmZouelC5FkCGT9gf3QOme1DSeTMaLJlZnu5NMWKiiNK3PHS9mZ8DtL+LxROztgauIPilO0RNQg+XlROHi3RX1gLxv3GrXWFldvzhR96cnqUhXgNkPg8KDJYkypWsgiquXHaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073872; c=relaxed/simple;
	bh=4PX9PQdb1nzJ4wP8fVMGULkAoVaXx+t09oFn5rMlBZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WAXAFyPUcF6uxhBXlhGoVFMJE+2sRM/UYSp7sVw2Yn6k/FPdHFrrnSU5f/Bhc6lnXWYxvUzxoahUvsm1zoWsEoL9sWExGJzwdsY6mufbKjy9+w50ezjeja+TOJLLElkjEUBAXOdmPqm/keG+CuzGz5PU75js90/YZQff52TaZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By0veISM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By0veISM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738073871; x=1769609871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4PX9PQdb1nzJ4wP8fVMGULkAoVaXx+t09oFn5rMlBZc=;
  b=By0veISM7X8JA09e5USvUOT9RwmU9+ATpMhRuQ8wvqoGz1jyUa1iLJAS
   v//z1ZS6cibMTTeYDatNuu4wvnw2i8I+ZbD3Z7r1swNSWq98AC3JXLisG
   2E00xG0DM7lQzQWUx5ZVzB0RJaxfFRhYjmx6BYrvxLMZLS8i1mBOEZ2nR
   mVj0a8oCH22KT9HTwdqXYZbUyqJV1v2oObYjBpIhGcaObZ80Qai7t38oT
   VnMTBbq9bFxksezfvXK1Y4vRS95Lrnu4Ozt6wQmhrEsyuwvO1DST1VN52
   VR8ixc8NTU7HtIigc/0Vy59yodppBVO4YdAp4njMqzi8ml01DCBMRv7sB
   g==;
X-CSE-ConnectionGUID: sERG9aKVSr2KRDoUhQogPA==
X-CSE-MsgGUID: 1m6r2MkFQhudhSFcWMGtSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42222401"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="42222401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 06:17:50 -0800
X-CSE-ConnectionGUID: zM0o9NmNQR2bEA2N2h+MJg==
X-CSE-MsgGUID: UphuregQRW6oLaLRoIlCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="145954406"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 06:17:45 -0800
From: subramanian.mohan@intel.com
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	greg@kroah.com,
	corbet@lwn.net,
	christopher.s.hall@intel.com,
	subramanian.mohan@intel.com,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	eddie.dong@intel.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	rdunlap@infradead.org,
	bagasdotme@gmail.com,
	giometti@enneenne.com
Subject: [PATCH v2 1/1] pps: retrieve generator specific data from framework
Date: Tue, 28 Jan 2025 19:47:43 +0530
Message-Id: <20250128141743.52031-1-subramanian.mohan@intel.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Subramanian Mohan <subramanian.mohan@intel.com>

While adapting pps generator driver(tio generator as an example)to the new
generator framework, As part of driver registration the pps_gen_device
pointer is returned from framework. Due to which there is difficulty in
getting generator driver data back in enable function. we won’t be able
to use container_of macro as it results in static assert. we might end up
in using static pointer. To avoid the same and get back the generator
driver data back we are proposing generic approach to add drv_prv_data
pointer inside the struct pps_gen_source_info.

Example TIO structure wrapped with pps_gen_device and usage.

struct pps_tio {
	/* Framework Related * /
	struct pps_gen_source_info pps_tio_source_info
	struct pps_gen_device *pps_gen;

	/* TIO Specific Data */
};

static int pps_tio_enable(struct pps_gen_device *pps_gen, bool enable) {

    /* Getting TIO data back */
    /* Note: drv_prv_data will be initialized in our init routine */
    struct pps_tio *tio = pps_gen->info.drv_prv_data;

    /* Access tio members here to set some of the parameters */

    return 0;
}

V1 -> V2:
    * Updated reviewers.

Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
---
 include/linux/pps_gen_kernel.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pps_gen_kernel.h b/include/linux/pps_gen_kernel.h
index 022ea0ac4440..8484bb2828ef 100644
--- a/include/linux/pps_gen_kernel.h
+++ b/include/linux/pps_gen_kernel.h
@@ -35,6 +35,7 @@ struct pps_gen_source_info {
 	int (*get_time)(struct pps_gen_device *pps_gen,
 					struct timespec64 *time);
 	int (*enable)(struct pps_gen_device *pps_gen, bool enable);
+	void *drv_prv_data;
 
 /* private: internal use only */
 	struct module *owner;
-- 
2.35.3

