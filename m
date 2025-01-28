Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31276199FC9;
	Tue, 28 Jan 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738072969; cv=none; b=LSZmGXHhH+AmbjDE6PD5OX+HXgwAU/ObZTRKRARA49Kkos2VsJdSnKSTWQ1wph2kRaxgB9xfT4jkc0rIYZ19tGqobkFA02vfUd9yy81YqJOY9J/5EpqDEkgXt3TB3AFfcbi/QMMJz6eKWpIcAHX9OhtXGVXHPKWmxmfJO0wybWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738072969; c=relaxed/simple;
	bh=zB3hbFRBL0Fqnxl7072cz+BJInO72ViP1SFwsXuH6Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=slqk0WaCTLIWOlNUljhK+Us6YRys39gIpN+FmdQaNEbJpRaVoa6MvzQu5sL6iK0sGZY51bHhMKBcI6gJ+IswS0fPHq/SV15lvMviRolEbQnhIcCFTSwKRtJk0Pow5YpNMYlerSsIQeOUgyiSnqV65lksuI/bQ43dms+a+3X5/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+6miLp8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+6miLp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738072967; x=1769608967;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zB3hbFRBL0Fqnxl7072cz+BJInO72ViP1SFwsXuH6Gk=;
  b=H+6miLp8Q2MUmxvclwn54C22+ybel6Ti/29QOV8ZnlgFDPF6YOqG7Sth
   ScNKF2OquWnHz0q8M1WwUKMlOzHuPCvOnfBng4GXHduUyis/PR4V7xaov
   JBJQPQunAaH78eP8ywER6cN11kW4Mn0fMldz85nNINb8HWYJik1FjC5zG
   bZx/kCah3l0U8Ulpm6htQgEqyDN3l1ARUKTYfRwB9GoByP8wZbFSWbMdZ
   IIBvS0TJrnbmZvtsfemlai8WtA3432pMfy/XWHGzxidPXfsZ485T5L71+
   xUW5X1KCNfiTSdXTEAMol11bTiXEQ3GI7vf9QpZivvpATVFCdu6Ge3xKa
   w==;
X-CSE-ConnectionGUID: hVSRR4tHSq2TugE4v8yy8g==
X-CSE-MsgGUID: 1z4XOho4T5iiehdRn6A3/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42314104"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="42314104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 06:02:46 -0800
X-CSE-ConnectionGUID: b761waYtQL2o8Sb/LcVX0Q==
X-CSE-MsgGUID: zVLzBiQjQP+LEzv19B7UuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132035776"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jan 2025 06:02:43 -0800
From: subramanian.mohan@intel.com
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: giometti@enneenne.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	rdunlap@infradead.org,
	bagasdotme@gmail.com,
	subramanian.mohan@intel.com
Subject: [PATCH 1/1] pps: retrieve generator specific data from framework
Date: Tue, 28 Jan 2025 19:32:41 +0530
Message-Id: <20250128140241.46489-1-subramanian.mohan@intel.com>
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

