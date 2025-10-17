Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F94198A11
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 02:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667169; cv=none; b=Yt0sXMijvHUjvbgAySb9iokmkf4zj/gR5obRk+MV4QxozKuFqq+8Omqgk32pM2ENylbu2pf5qyf5dB+KHIfW1FNBp2aycgmpTpGkwsj1W+ILsKdv/tC9bRTnbAzBHrAC0oMcNVp1GkJ46HxlE3hE8LOmViGITNn/d9jK53/Yvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667169; c=relaxed/simple;
	bh=CvB/ozrXronodBtnVZwA7Ot8plxTzg+bT0cwIAORQk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NA2NIXCnPOAFUiUQL+hziPlpekEz45N3GzpGumzADKdccD5ONH+uL90zqWRqCE6/khHB2fSKLSM6pUA0vRRiIDk2HJS6x0e3UtiQRJLQOERArykqSR5BZiR5MHNYfyzsYtyoZhFNXo+Q2VhE71GR4MQqunv8xI/bjH1yoUBdqDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J36Y1G7f; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J36Y1G7f"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760667154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g9y2ZrbEQrOVND0R37NORb2lDqH3fVHhnUWgvop3Ytk=;
	b=J36Y1G7fHZKVFUdtxaxBzAek2T+47QVs7bkf1pgCi5EcS1IcVe5E9hnAT7cEA8nLylLxXN
	jpHebjfn7BWools8C0KORcC8OAlAk2Yg4TBFw0pX+pq4Lv5H1sRzjHV+jNtiVePa1E2RAc
	pwLMNTrZgGI+7D4jzV8M7E6ABc42YUM=
From: Gang Yan <gang.yan@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	David Disseldorp <ddiss@suse.de>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Gang Yan <yangang@kylinos.cn>
Subject: [PATCH, v2] kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation
Date: Fri, 17 Oct 2025 10:12:09 +0800
Message-ID: <20251017021209.6586-1-gang.yan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Gang Yan <yangang@kylinos.cn>

This patch adds an example of how to set KBUILD_BUILD_TIMESTAMP to a
specific date. Also, note that the provided timestamp is used for
initramfs mtime fields, which are 32-bit and thus limited to dates
between the Unix epoch and 2106-02-07 06:28:15 UTC. Dates outside this
range will cause errors.

Suggested-by: David Disseldorp <ddiss@suse.de>
Signed-off-by: Gang Yan <yangang@kylinos.cn>
Reviewed-by: David Disseldorp <ddiss@suse.de>
---
Changelog:
 v2:
  - Replace the invalid example with a valid one.
  - Apply David's suggestions.
---
 Documentation/kbuild/kbuild.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 3388a10f2dcc..881189ecd0ca 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -328,8 +328,14 @@ KBUILD_BUILD_TIMESTAMP
 ----------------------
 Setting this to a date string overrides the timestamp used in the
 UTS_VERSION definition (uname -v in the running kernel). The value has to
-be a string that can be passed to date -d. The default value
-is the output of the date command at one point during build.
+be a string that can be passed to date -d. E.g.::
+
+$ KBUILD_BUILD_TIMESTAMP="Mon Oct 13 00:00:00 UTC 2025" make
+
+The default value is the output of the date command at one point during
+build. If provided, this timestamp will also be used for mtime fields
+within any initramfs archive. Initramfs mtimes are 32-bit, so dates before
+the 1970 Unix epoch, or after 2106-02-07 06:28:15 UTC will fail.
 
 KBUILD_BUILD_USER, KBUILD_BUILD_HOST
 ------------------------------------
-- 
2.43.0

