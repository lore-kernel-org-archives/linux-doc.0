Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635039ACA
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915949; cv=none; b=FMvVPu/tg5aDKcnNuM3AczyHqGF5Q0hU5w6GdpH4+En9FF2VI2QLgfWDri2qWOoD+V6AjjDW5MxAAu5cVuDi4khAKYlwE9E33JmOKZxVlGD38LvQ2G6nWdQAZtM5eqPa+7ZaMdAa2E8mSAK3qjRhRo7f9kFzg5Th5fSAu16aYAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915949; c=relaxed/simple;
	bh=GJFF6zDG10NckpTr2xydF8akPhD2nkQUDsvIbweY+98=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BNTqVIzKkkIK1ExodWgKIzRAPyJbX9Fh+5PV7+eHsJD0xT5B7/HqNc4XwmdiE51Mk63AQg936Y+J14y+KW5YX1RwjpFlGXJUaLD0HklwRir9YULJW9CCwOFFO3OvWv0CnKK7pXQ6C3Z3Fc9/RjpUaXLfrhtnxVf1GvDHxLz/3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hYJsxK/n; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xzskzyWc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hYJsxK/n";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xzskzyWc"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705915946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jI9DlXT7q3GaWbI6RXpbPK5d/trpQX7G53NQmpuRe4k=;
	b=hYJsxK/nFw9kM+yLF7yK13u6pBoIyyWWWM+qam2WOTmrxUbkv4p3/xi5WMrW9J7hZiecIP
	fLPahgGTtBwtCIPGxYZMIJxcKdjhq/chQksaduxg14ceXPjKUu2aJqsu2OdG75PTgrKikG
	6SrH1JvS8kVK0s3cXbPX6bK4KJ/5Uxg2te3RjJHJmwEilbsV8yBYStHZNd5gDMj8hQmRxH
	R1vUL3IYf/jWqRJxRZ+AL0nR1K9+0wd3UHj/F1lWwa8cwEnedL40WNDlHuUA3e4GtnMz+I
	HIDFQdTfwB8uqxzfVMxJyQ4Irx5Td0ZYZk2CL4ZylZ64ecCq1+Emn6ezD7OZqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705915946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jI9DlXT7q3GaWbI6RXpbPK5d/trpQX7G53NQmpuRe4k=;
	b=xzskzyWcCKHtP7hz9wnTAgvrugSHhsC7eLqGBPPNVKSETV4AxfhLA9i+QfA4Rdr3aFQKLA
	2exuJtl4KL+R8zCg==
To: linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [PATCH 0/2] kernel-doc: Do not pre-process comments
Date: Mon, 22 Jan 2024 10:31:50 +0100
Message-Id: <20240122093152.22536-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is a repost of the RFC queue
https://lkml.kernel.org/r/20240116151456.48238-1-anna-maria@linutronix.de

Jonathan Corbet is fine with this change and mentioned in an answer the
following:

  "The kernel-doc change should really go together with the DRM change.
  I'm happy to carry both with an ack from DRMland or have the kernel-doc
  patch go through the DRM tree, whichever is easiest."

But back to the patchset: Commit 654784284430 ("kernel-doc: bugfix -
multi-line macros") introduces pre-processing of backslashes at the end of
a line to not break multi-line macros. This pre-processing is done
independently if it is inside code or inside a comment.

This illustation of a hierarchy as a code block inside a kernel-doc comment
has a backslash at the end of the line:

---8<---
/**
 * DOC: hierarchy
 *
 *                    Top Level
 *                /               \
 *         Child A                 Child B
 */
---8<---

It will be displayed as:

---8<---
	     Top Level
	 /                *        Child A                 Child B
---8<---


As I asked for a solution on the linux-doc mailing list, I got some
suggestions with workarounds and also got the suggestion by Matthew Wilcox
to adapt the backslash preprocessing in kernel-doc script. I tested it and
fixed then the newly produced warnings which are covered in the first
patch. The processing of the documentation seems to work - but please don't
rely on my tests as I'm not a perl neither a kernel-doc expert.

Thanks,

	Anna-Maria



Anna-Maria Behnsen (2):
  drm/vram-helper: Fix 'multi-line' kernel-doc comments
  scripts/kernel-doc: Do not process backslash lines in comments

 drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
 include/drm/drm_gem_vram_helper.h     | 16 +++++-----
 scripts/kernel-doc                    |  2 +-
 3 files changed, 29 insertions(+), 33 deletions(-)

-- 
2.39.2

