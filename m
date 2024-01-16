Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E221C280
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bcmdIaav";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kW2qXd8/"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705418107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Bovh2hJv4EzHbmVrXaCi9d/K1EtK8asG+WMLN3h+Xg=;
	b=bcmdIaavVdWEf1jIO+g9jHhWD9mxIkN3A/8tcv0q98QXFBsGz8zdeZBUsbTR6SHikGTrRz
	FsE+8DgCPdNzxKKxFgcgslkSIf8xrnTuh0wLo2+AGH34/Na2t09MR7lSQY0YVXryGJK5/z
	Mns2jWQFkqj/jGM7QqSIg+LkGjgQ96+D09MYybYJE3NSTPq1BREn6u5zxSPHNbyk0LSpoh
	DKKxvI6A2dP6o8cvJ1uhW4NTGcB+RBQ8oxrELQiMPON1s9AkMFrGbun/DdahBXeax6wBPH
	/p18dW9GvnbZ2nmZfx+e04WhMe4godSEVNx5X8X+R60K63xoC4hZEpjl5hVbhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705418107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Bovh2hJv4EzHbmVrXaCi9d/K1EtK8asG+WMLN3h+Xg=;
	b=kW2qXd8/UVXGs5kKu6utxpQyC3Zp/YOEP0ltxFvDo7xA/jDPYv7Pz2aUmtmgmiwbXuw6s4
	rc6h/ecM0ZDJOaCA==
To: linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [RFC PATCH 0/2] kernel-doc: Do not pre-process comments
Date: Tue, 16 Jan 2024 16:14:54 +0100
Message-Id: <20240116151456.48238-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is a RFC as I'm not quite sure if this change has some subtle side
effect.

Commit 654784284430 ("kernel-doc: bugfix - multi-line macros") introduces
pre-processing of backslashes at the end of a line to not break multi-line
macros. This pre-processing is done independently if it is inside code or
inside a comment.

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
rely only on my tests as I'm not a perl neither a kernel-doc expert.

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

