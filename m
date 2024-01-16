Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B81C282
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1RiMxnjJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="48CYpeUL"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705418108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSSZhWNo8uGfD/dxK4hfGhRRqDZCVVwEoayqmi+IK+U=;
	b=1RiMxnjJ2PsXp6/DCiYWYq5jNs/zICj3VRUJC/zp3iTmJ4EWFKPQEjXgO2bOR7zkaWlEL2
	CVOo+HW1L2R1DI1r43zPfsiYg6XoFfSAoznd0RI5BPjn2vWbJWBWA15l0X0+E+6eojf6mx
	vz7bq5HF7vaK2qD4MzjaTDOUT5fez+A9owPVOnf2sNrGzaf/EovZ0FfNpPe7eoYTGYIuSa
	4J94kL5fwcqvVO0mCt56MZL9p+Zhpj4HFKHhApx6VrLapX+YSkA/7qev4xnOBMclXHwqTM
	68QTnCso+P8cC1oCu/iz7rfBnglTPobPFag53Ln9MGbUcFIEuGsiNcYY2VrnyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705418108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSSZhWNo8uGfD/dxK4hfGhRRqDZCVVwEoayqmi+IK+U=;
	b=48CYpeUL3RDp46Dte5KUd6EWpMczRKvQ98ikh8F858Jq36NZwNHob9DEHEwBTfbjtF6Yuw
	iy1SfwAoUptm9lBg==
To: linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [RFC PATCH 2/2] scripts/kernel-doc: Do not process backslash lines in comments
Date: Tue, 16 Jan 2024 16:14:56 +0100
Message-Id: <20240116151456.48238-3-anna-maria@linutronix.de>
In-Reply-To: <20240116151456.48238-1-anna-maria@linutronix.de>
References: <20240116151456.48238-1-anna-maria@linutronix.de>
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

