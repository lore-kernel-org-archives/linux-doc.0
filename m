Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2925736403B;
	Wed,  1 Jul 2026 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874395; cv=none; b=i5oedACzuprUw4xKZPgmuFX0QvMuEphSjmgtPZpGw7VtNC0BbltlszSNyHyI2n6XHQJnRdE+XpcL7v0Qk6ZZhGysDpxwDrR8k6Q9phEX9K7OP4Jt0Oa6eZAfqkKrhwyg8dv1X0+6+197VfaeW7JvaFtVT1dc5n5L+fnDGKALvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874395; c=relaxed/simple;
	bh=3RnvYEtBjYG05s/0DzBMLXNgnxFKLlhnVbL2T3yy/7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCbjQUtf5RhCS8SeeJ7sbbnEkwJf7x5Y6k8ddLduT3TTjm/dZuskjyDnM+APQKVJ+XJVFy4pnxE1TNUydnBO+N4kNLTegDaNOWoR55rr1v64XXwI6oy245liX76XnIcGc+Bq0vgABDR8QG8BsbtbnjnWtRe73g0S3/sTNNRL3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=XhlFHzvk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dO0g/co7; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="XhlFHzvk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dO0g/co7"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.phl.internal (Postfix) with ESMTP id 4078A13803B3;
	Tue, 30 Jun 2026 22:53:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 30 Jun 2026 22:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1782874392; x=1782877992; bh=rR6+t+iWOk7mVPpVV+GyV
	4t11N+kVWdaCDWy92lLmfc=; b=XhlFHzvkioXyau3TYyE5k6ifsFuEwvjXYqp1X
	RoBjco/CVLkviJ/tu3F3VfJcWg8OsZUWLHMEQJOOXQSWklgCZpi8exPoopvZF4Fn
	qAY8uB6UpNzuCmbOgR4vBnsp0q3Cu+vD/U1cJRmzlbCCH3mKseUow5EDpST4qllY
	bPYbnyY7QayVlXR9YZwgdtsD6Vrqz9kNFpS4E7EJGgr8fOsy3R896wm/ktTHA2v/
	cg/cR9sSGvmstQnl3JBgVg8NsMXee2bdi6vdPmwXsd9oWeds86aEnstY53EHC53G
	FsyP98DXXifgMXfTrOLtZnzOpaemMDPqmBlFw9UglWaVQgHCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782874392; x=1782877992; bh=rR6+t+iWOk7mVPpVV+GyV4t11N+kVWdaCDW
	y92lLmfc=; b=dO0g/co7Skc4jCyDJxD+iZl/28Lwo64f5AIG7Z3bXOJ9gImyw2J
	WIQsRRTGxdfTLTyOxxFdNIf1RE8p867GC+rv+GVuRuOgVHUK9MiRgCMslI9C6ahh
	IzFWblh3uwHUCYDUtymclb7wwys0DtTu/WiU/oQ7A0wCr0MCULTbzz2JlYO46LH4
	U0f6+YM+iubvEfLJsTBLii1jWvUm1Dh4czCL30NNan+t2o2XI7ks5aLzs+OYcWB/
	ywXLKz4TNsl69sWbWnfxWRO8ZkHqMx/D96gsG/LO6MYcGOAOs+p3HLDn+CyCu7qV
	vTPwt8YxKhU5FOerejsE25unx208h4sr0Cw==
X-ME-Sender: <xms:FoFEah_D3_4AQar4I7gvdAU0IByY_iJuKZbtS2ymuEnCjYTilMRvZw>
    <xme:FoFEahhZWQ4U0ge3HNZUDhebu1VY9V4GqoO1qwUGJH0hjFsbpiOSxNFD7ZUa9-nD2
    Ds_FFA1nneLaGOyXLLmV_hOuwGPeW2oJi5aaR51eFmkF5TBDWg3Ow>
X-ME-Received: <xmr:FoFEaqa4hxzelgeHA1kqsFxU2YBD9Z7eY1wnn0F6Mtafs0mWpAhgbt4b>
X-ME-Proxy-Cause: dmFkZTEuWPbgG5OA3E5wK/GuEwks3AjSaOGHnjmn1Nr+lPAkrwCgUsg6PP+tENFUZaJgls
    0qniAEOqXwrci2gK23JXVDEq7bpW7aC1o9mf4YRi7TfxQt1OtVplBuO7DR6xw+zezieA45
    IIHhRGI6m5/MN2mEIrcnWKz2jS63qVhOB3RIec6aHLl89b/Ti4/SH2MViqBx13dlA53Bjn
    IafBvUfNM9bvP7/b3wMAavOciU7yQGYBgOMxnQyouO5arzLOrkeT9GRMuAdTA4WqocScWg
    lB8Q3FcyjDQGExXhePrNy8rUhbIQrT4NkkoDlXCwvQG0U85F/wnFfCrqbBJHygLGRArEp2
    Mg0I0en/fegBtXws/as8Qw4ZW+jvr/RZRixyEGteOzyVdTYvU17TPaBBk6jfTXv7iuTTn4
    V8HAPMcEkXSeBQ/K3d32CqyA0BT9fUzuCfLJ6qLFp/7FpkvgDBV11U3UxTnlRrSRg8fhXc
    HewgBvhCce9awssuTcVHc9oYcOsyKk2OwQ8eKO1nBY+/Cu3W9K7KqONhUlbKmCPSB0qR3N
    kEzlHxYi9hTIaq25v8WZARj+gD4PxhZF9l8rGHSGpWt7mPsBUrDyPvsLhYAbwcA9PmqMw4
    U4b/NhkzxfvicXmktFzm1xQr2KWE2FWbXDmhLuODICBkk0qS5v4wdpUVqfrw
X-ME-Proxy: <xmx:FoFEau__ZHXEEKS2YjTvfg-uxWhAnp17ZkrmmMzg88qTuhOWJU1VYw>
    <xmx:FoFEakNJ0DJp6xai0hbtMCrBcl03OoPvAzwAiYV2kA29_TqAitodMQ>
    <xmx:FoFEajE1RJO7x5ArC-AFvribB1MATVzK3FWp2xlf3BDBF9rY-WCBmQ>
    <xmx:FoFEaqy5mUzu9ylaoJ-RojOQGoY4N_99VPe-fXiW5s1dPlofcorO-w>
    <xmx:GIFEatEK62fslu88Luf57A4p7OilGS5bsRCVmDSkatsY1dghW98NfBIZ>
Feedback-ID: i9dce4b48:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jun 2026 22:53:08 -0400 (EDT)
From: Baran Tuna <barant@fastmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Baran Tuna <barant@fastmail.com>
Subject: [PATCH] docs: Fix typos under GPU TODO
Date: Wed,  1 Jul 2026 05:52:33 +0300
Message-ID: <20260701025233.594162-1-barant@fastmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor spelling mistakes in GPU TODO section of documentation.
No functional changes.

Signed-off-by: Baran Tuna <barant@fastmail.com>
---
 Documentation/gpu/todo.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index cdddf8db35f5..3b9999319829 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -55,7 +55,7 @@ There are still drivers that use drm_simple_display_pipe. The task here is to
 convert them to use regular atomic helpers. Search for a driver that calls
 drm_simple_display_pipe_init() and inline all helpers from drm_simple_kms_helper.c
 into the driver, such that no simple-KMS interfaces are required. Please also
-rename all inlined fucntions according to driver conventions.
+rename all inlined functions according to driver conventions.
 
 Contact: Thomas Zimmermann, respective driver maintainer
 
@@ -278,7 +278,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -303,7 +303,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -891,7 +891,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.54.0

