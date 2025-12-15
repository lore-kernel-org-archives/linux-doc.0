Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E684256D
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800561; cv=none; b=Jm8Q4a04jrrZ2aIXhO/lBGYK9KIOar7QIMimg0W4HAkY+HNCbu1e08HaxPc9iyU7/kDbErGDdpGw/dcfngph9DfhR08pR1fNtuujPuPs9hUrGFCjn9Ssm2IsJZ2sPfDVJg1LBxyxok3vJ4bj3TahHEQy4KBKuaakLUxCR2lhfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800561; c=relaxed/simple;
	bh=yV1pL01McaYsHF+Zj/6ww+xACjI4zeAmI/Gsix0mTzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GY3dhvhWmwm0WfgwDxJM6XCCAe2yYW9sPya4rVKT6DR7VbSC2yYbqnhRlUR5fnnYt1gMwx5lcE1Ou5/TxvvvMjTy+MAjXbeC/vXUVG/qs2s106uMXSXFrpUyUut7MUJaqTS7np7xfAfJKQcqnpHSwVHJsQqOtYjPwxeyZPGFTEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laIo0Dr4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laIo0Dr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765800560; x=1797336560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yV1pL01McaYsHF+Zj/6ww+xACjI4zeAmI/Gsix0mTzY=;
  b=laIo0Dr4ShCFbxKiiWZwbGktsETcdgy8U2HsVV/zxCamHMnHFe3R1buc
   o8kZb76Y5ZQhc7dSOhQyrC1pOISGlV3fcefORbpGAJhNvY+W2nnGWpUt0
   mVe9iehq+LfV40VS03B7/MhQinNoGnrRYFDOHCsh/viLlmMW3yH0Sl7r1
   dcflniOvhGiBLFTnp/p2oAq6TfAtFBlq1e3WVh5QT9cYcTq2AADCk+cZq
   JrzJBPM3tH5MqxV443lwI9xicnsETlgWZ8qQnKpbAY68Nicku+j0IK2jC
   cagceLt4bI88hTwamEUM9toXtPsgZjohuKP7verSpQHQdRcgwIgmqhee9
   g==;
X-CSE-ConnectionGUID: d8lCKkHzRMOQ5T1PwMzM7Q==
X-CSE-MsgGUID: IQrSreNXT2671kJ0SqghGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78815170"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78815170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 04:09:20 -0800
X-CSE-ConnectionGUID: 5z6sq6JjReyNESQyMAPmmQ==
X-CSE-MsgGUID: P2QVwFypTmKv3sMT1cdtjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="196974013"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.106])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 04:09:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org,
	jani.nikula@intel.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
Date: Mon, 15 Dec 2025 14:09:08 +0200
Message-ID: <20251215120908.3515578-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

Commit 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently
discarded") started emitting warnings for cases that were previously
silently discarded. One such case is in intel_wakeref.h:

Warning: drivers/gpu/drm/i915/intel_wakeref.h:156 expecting prototype
  for __intel_wakeref_put(). Prototype was for INTEL_WAKEREF_PUT_ASYNC()
  instead

Arguably kernel-doc should be able to handle this, as it's valid C, but
having the flags defined between the function declarator and the body is
just asking for trouble. Move the INTEL_WAKEREF_PUT_* macros away from
there, making kernel-doc's life easier.

While at it, reduce the unnecessary abstraction levels by removing the
enum, and append _MASK to INTEL_WAKEREF_PUT_DELAY for clarity.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Curiously, kernel-doc does not return non-zero exit status for these
warnings even with the -Werror parameter!
---
 drivers/gpu/drm/i915/intel_wakeref.c |  2 +-
 drivers/gpu/drm/i915/intel_wakeref.h | 14 +++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index b1883dccc22a..98e7cee4e1dc 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -80,7 +80,7 @@ void __intel_wakeref_put_last(struct intel_wakeref *wf, unsigned long flags)
 	/* Assume we are not in process context and so cannot sleep. */
 	if (flags & INTEL_WAKEREF_PUT_ASYNC || !mutex_trylock(&wf->mutex)) {
 		mod_delayed_work(wf->i915->unordered_wq, &wf->work,
-				 FIELD_GET(INTEL_WAKEREF_PUT_DELAY, flags));
+				 FIELD_GET(INTEL_WAKEREF_PUT_DELAY_MASK, flags));
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index a2894a56e18f..81308bac34ba 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -128,17 +128,16 @@ intel_wakeref_get_if_active(struct intel_wakeref *wf)
 	return atomic_inc_not_zero(&wf->count);
 }
 
-enum {
-	INTEL_WAKEREF_PUT_ASYNC_BIT = 0,
-	__INTEL_WAKEREF_PUT_LAST_BIT__
-};
-
 static inline void
 intel_wakeref_might_get(struct intel_wakeref *wf)
 {
 	might_lock(&wf->mutex);
 }
 
+/* flags for __intel_wakeref_put() and __intel_wakeref_put_last */
+#define INTEL_WAKEREF_PUT_ASYNC		BIT(0)
+#define INTEL_WAKEREF_PUT_DELAY_MASK	GENMASK(BITS_PER_LONG - 1, 1)
+
 /**
  * __intel_wakeref_put: Release the wakeref
  * @wf: the wakeref
@@ -154,9 +153,6 @@ intel_wakeref_might_get(struct intel_wakeref *wf)
  */
 static inline void
 __intel_wakeref_put(struct intel_wakeref *wf, unsigned long flags)
-#define INTEL_WAKEREF_PUT_ASYNC BIT(INTEL_WAKEREF_PUT_ASYNC_BIT)
-#define INTEL_WAKEREF_PUT_DELAY \
-	GENMASK(BITS_PER_LONG - 1, __INTEL_WAKEREF_PUT_LAST_BIT__)
 {
 	INTEL_WAKEREF_BUG_ON(atomic_read(&wf->count) <= 0);
 	if (unlikely(!atomic_add_unless(&wf->count, -1, 1)))
@@ -181,7 +177,7 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
 {
 	__intel_wakeref_put(wf,
 			    INTEL_WAKEREF_PUT_ASYNC |
-			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
+			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY_MASK, delay));
 }
 
 static inline void
-- 
2.47.3

