Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3549F2C3248;
	Wed,  8 Apr 2026 03:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617939; cv=none; b=o/X2PAh7/VZhxLC22xtqvQiUXownDhY22S3Z8kWNmdpBtsUqDTNyH1VWjyb38lDGFuWr6iSgOBLAGLIo4iNp84seYHafko/ScFLyGyj2IuUCAdgZoVY5hPZPygVYdjWMv/b4HILsdrEhUF0+P446y9qfm6vaVNQM8AXoOjB84NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617939; c=relaxed/simple;
	bh=r1mNT6+/DeOAAipi7eOSCVCo5gjva+9QrmXn+QN9BsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=levuSWmDenrm0F/loMm6d4ZWAql7n9IFxSDevxz69lEPeNEByZsgNavLn9JRmxtp1t6p5DQawgEAM2pbpFVCGIUtjQeifZ5QvA7eZxiWUKf7DFnL2AeQOIy7Euxay7PhBEh/W6XfZP4iaRXJpxb9zkgEl8N2xlrbv5ScHOV7QV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xlflBE9P; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xlflBE9P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9+0cb5hoKs8AtjmHURSvRwHYxGn6IsRSLv87f9yCWkY=; b=xlflBE9P6haQMHpxM6bOMdZG4x
	n+VF/IrF5dpNYROKYS46ABWta0kDjWTqQEI/aF3v59/OmZncwi4qw0kAlK2P54evs+rCUeNYnj+Lk
	GBLysOhflMypKbeDvc+5tjaYoHODgasiZWzTLO6c0OqomDCecY3tLsv39dDBGIeH99Tw9NBOFjQPs
	KLEDA1kqQRqGXeA+ycL9WOqQr4G/TlrrKVyXkiglPUY9/xb0O2/tlUL/5K1+r58dRkRz3mr65QOWd
	wUNblk3SdWSDw+jw4pVJgoYKA2onSzB2vWVgeT4uoev+h4kbapukziaExFrnnMexSLEsc2KMJjkLp
	e2iYqejQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJKv-00000008BFx-3s5B;
	Wed, 08 Apr 2026 03:12:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] doc: watchdog: fix typos etc.
Date: Tue,  7 Apr 2026 20:12:12 -0700
Message-ID: <20260408031212.2510235-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct grammar, plurality, and typos in lockup-watchdogs.rst.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/admin-guide/lockup-watchdogs.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260406.orig/Documentation/admin-guide/lockup-watchdogs.rst
+++ linux-next-20260406/Documentation/admin-guide/lockup-watchdogs.rst
@@ -18,7 +18,7 @@ provided for this.
 A 'hardlockup' is defined as a bug that causes the CPU to loop in
 kernel mode for several seconds (see "Implementation" below for
 details), without letting other interrupts have a chance to run.
-Similarly to the softlockup case, the current stack trace is displayed
+Similar to the softlockup case, the current stack trace is displayed
 upon detection and the system will stay locked up unless the default
 behavior is changed, which can be done through a sysctl,
 'hardlockup_panic', a compile time knob, "BOOTPARAM_HARDLOCKUP_PANIC",
@@ -41,7 +41,7 @@ is a trade-off between fast response to
 Implementation
 ==============
 
-The soft and hard lockup detectors are built around a hrtimer.
+The soft and hard lockup detectors are built around an hrtimer.
 In addition, the softlockup detector regularly schedules a job, and
 the hard lockup detector might use Perf/NMI events on architectures
 that support it.
@@ -49,7 +49,7 @@ that support it.
 Frequency and Heartbeats
 ------------------------
 
-The core of the detectors in a hrtimer. It servers multiple purpose:
+The core of the detectors is an hrtimer. It servers multiple purposes:
 
 - schedules watchdog job for the softlockup detector
 - bumps the interrupt counter for hardlockup detectors (heartbeat)
