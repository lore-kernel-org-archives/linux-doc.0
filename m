Received: from mail.bmwiedemann.de (mail.bmwiedemann.de [188.40.142.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC01B1991A8
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.142.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725536490; cv=none; b=FCw5zznFbn3YxJkBsQu/lUfJR0H6RmgcJ8bzia3aiMlY1u6oFOXvNOg2anANYB74ZGLe3LULV3YggdFFbLCGDgKhiofFIO2Lh+OyjdUa2fddQ5drINCvxTNRDy07haDCU9pnsUDjriQf7nrNh9GqT83FspqrHxI97dL68l5YHLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725536490; c=relaxed/simple;
	bh=azYt1SxJTamLF5rOj/Amgi2OeIeh6aaV1hObDT5TCr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7CEXLsDbnBILS1EBE7Zt4sSM8J2gqUy6ytzvrYLxZszCN9aEfCLyHPbl6QKhIj+kzE2I99PkThRhhB4DEPCjgMUCxV1gJbIQHCbudMvXMSPVojT/OJBvMsdg7ygotvv6LSu/j7Bu0OJi4lfX00d/jRG7ty5Xi/7DjLOK6Qzc0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de; spf=none smtp.mailfrom=adrian.zq1.de; dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b=o2IZF5Kw; arc=none smtp.client-ip=188.40.142.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lsmod.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrian.zq1.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsmod.de header.i=@lsmod.de header.b="o2IZF5Kw"
Received: from mail.bmwiedemann.de (localhost [127.0.0.1])
	by mail.bmwiedemann.de (Postfix) with ESMTP id 30D6C4464;
	Thu,  5 Sep 2024 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lsmod.de; s=202205;
	t=1725536134; bh=azYt1SxJTamLF5rOj/Amgi2OeIeh6aaV1hObDT5TCr4=;
	h=From:To:Cc:Subject:Date:From;
	b=o2IZF5KwJ6X/R06Bnirz4uzw4S69birXQ5vmtLsosa45WADgfVbuFi3cCfmmKA8Gk
	 AYTNQpD9YT7r7g9sUVJ+Al4jAbPPRCwhuKt5hrlrhNwVlvetqZJyAdaTr62hJKBySv
	 9vZX7z1IM0qSifqv64Ewg8v2Lo4FdANGqB8nJwLr0B907i3mc6jk7dw+66N7vkpI34
	 5Pr1rbl8nlKNQs787TUmyqL2TIqGEGcTNoYUiZtW+vLvwpvb7Ue3kIdxIX68wEylfF
	 ofVl4ELHrofhQZdNZSMGwZF4cg1Wu08CsmAt+uNbHeY6eYST43vQbvmQe+UQb15TDO
	 I3BYJPBGHo+mw==
X-Spam-Level: 
Received: from adrian.zq1.de (unknown [10.8.5.20])
	by mail.bmwiedemann.de (Postfix) with ESMTP;
	Thu,  5 Sep 2024 11:35:34 +0000 (UTC)
Received: by adrian.zq1.de (Postfix, from userid 1000)
	id E31ECE02B5; Thu, 05 Sep 2024 13:35:33 +0200 (CEST)
From: bernhard+linux-doc@lsmod.de
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: [PATCH] docs: Build kernel docs deterministically
Date: Thu,  5 Sep 2024 13:35:31 +0200
Message-ID: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>

Because we want reproducible builds
and https://github.com/sphinx-doc/sphinx/issues/6714
did not receive any love from Sphinx devs in five years,
let's disable parallel doc builds until that Sphinx issue is fixed.

This patch was done while working on reproducible builds for openSUSE,
sponsored by the NLnet NGI0 fund.

Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
---
 Documentation/sphinx/parallel-wrapper.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/sphinx/parallel-wrapper.sh b/Documentation/sphinx/parallel-wrapper.sh
index e54c44ce117d..cb93626bd86e 100644
--- a/Documentation/sphinx/parallel-wrapper.sh
+++ b/Documentation/sphinx/parallel-wrapper.sh
@@ -10,6 +10,9 @@ sphinx="$1"
 shift || true
 
 parallel="$PARALLELISM"
+# Because of issues in Sphinx(https://github.com/sphinx-doc/sphinx/issues/6714)
+# we disable parallel doc generation to get deterministic build results
+parallel=1
 if [ -z "$parallel" ] ; then
 	# If no parallelism is specified at the top-level make, then
 	# fall back to the expected "-jauto" mode that the "htmldocs"
-- 
2.46.0
