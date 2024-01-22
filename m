Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E539ACE
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915950; cv=none; b=sl/zM0ikn5QPeSkXjZsh2X9TVJXhjjz+no9wGczG4RuI6MAdL/sKygVi+Y3smP/REUohENFpVqOS9Gn3jCDqTwPOs1UxMJSjN1I2XCPOcJjklTf51tk0hJnFeb+c84nNPaRqboCVX6dOcSfJt0no90j8wXicY0svUkcWcv4sdAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915950; c=relaxed/simple;
	bh=T3HfQcnx4oCGT6waTrbsgo+J9kdbv79WKdOxfnC0/44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kQnBmGrdw/KnEZa0Wj6G+3TuxAV9ApyeZiYBDyMyJoJ6p5AhC3VUVbWdbufUTB6bJiP7fpBMBlazkPFyCzBSQUmXseBgtXip+CKrUC4Shy9gZmm2i1TLweb8OIk9MLb0S2qm3PQo9uM6mdOWapg48s8BKTuiY8gNxhdz7TO4KNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TitGlBlW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UG+r3xx5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TitGlBlW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UG+r3xx5"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705915947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSSZhWNo8uGfD/dxK4hfGhRRqDZCVVwEoayqmi+IK+U=;
	b=TitGlBlWW2gGFsl2fJObF6qCcX3Ddbg6gjGRYElmCaVOPydsJeW2TyHCQ6jfQ6vpsIksrl
	NuaSLEQ+JoIdq8gySR0ivth2hGgrbAUXnsqnQbVkKj82BaTTNjBxiOL01L4Bp0XBHVZE9T
	xz0IysGx6uBjNrg2QRVrwARtjKFoFwx+0fbXsqmGDfoF4PsBndLQM3eez+6uRBzRarRflQ
	Mi+E7JHBLCYnBfivcutj7Zpz6DPM/nir5S3nZ2HzP8CqqpKH+V85SODiuIUhezSVIv71xo
	0wpWWu2MW01GBaDhsvbwM1DBDpffNLIQXtY9j5iHUmXiYwGfpaZN7VHq9tXfFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705915947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSSZhWNo8uGfD/dxK4hfGhRRqDZCVVwEoayqmi+IK+U=;
	b=UG+r3xx5MmTGX8r3eyTdTfD8rWJnpDAE+0ga1WHSB3hPZKkZ/MC7dlm1D/3ZA/yEB1m7c2
	b8ydaJpMaC5G74Cg==
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
Subject: [PATCH 2/2] scripts/kernel-doc: Do not process backslash lines in comments
Date: Mon, 22 Jan 2024 10:31:52 +0100
Message-Id: <20240122093152.22536-3-anna-maria@linutronix.de>
In-Reply-To: <20240122093152.22536-1-anna-maria@linutronix.de>
References: <20240122093152.22536-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

To prevent this, do the pre-processing only for lines which are no
comments, e.g. do not start with ' *'.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8aefd258a29..4277af79de86 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2331,7 +2331,7 @@ sub process_file($) {
 
     $section_counter = 0;
     while (<IN_FILE>) {
-	while (s/\\\s*$//) {
+	while (!/^ \*/ && s/\\\s*$//) {
 	    $_ .= <IN_FILE>;
 	}
 	# Replace tabs by spaces
-- 
2.39.2

