Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC1636C9D0
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459548; cv=none; b=CNXWMD/KDyyzly9tbVUfh/Kl8c8wWYOQ+0vsPS++8Gv+/KRJGZwxiZ12LF98R3g17yiAVfj2c4v3vLPqXPHYkseYR5PSyhGg1lCi9pqsH6q+rh7OwABgXa2BOK6FCyzFzJaS2Gopz9eJ2QCj7BPREWSedShUHARjZmVhNNzHJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459548; c=relaxed/simple;
	bh=nEWI01aw8sQ2UhDWbmhb/eDRmKVCVIQdOa82//Djx6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dy/VB60hAjbvKtWYZkYbHz/HqtAy48BEL2L9slwHPNEG4xblNHw5ZRw0nKy1gMskgDzkguVjP65lAYj8gSMU1K+FEb/yklIHKNs8+CcfKqipT98rj2AHUsdK+fjWMTI65prdXA6Z+U5gU5UZZSc5LNLw96BEdKV9ZH35Iej7ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ai5HoXsw; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ai5HoXsw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772459534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3CjI6zZAWQ/pg0Nb8eCP0hEFm8Ja5hA1ON+alHZYdPQ=;
	b=ai5HoXswInkj4bu4gvvrfmO+pqH8OfUcRcyVwfiuCO7VgqauBtgsTTo4OI50P7QxGehVZm
	DCIyvC+bvD7FLLzQny7XhvAAoiZkBel+WJ4sWIgyW3CjDTEcFMZdIzL6p6UKJpzzGjKTs7
	f0EBpd5UoaGFjqTw4ADRTRUmeejdRD8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/maintainer-tip: Fix grammar
Date: Mon,  2 Mar 2026 14:51:42 +0100
Message-ID: <20260302135141.3213-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/a empty newline/an empty newline/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/process/maintainer-tip.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-tip.rst b/Documentation/process/maintainer-tip.rst
index 41d5855700cd..b2b14439be22 100644
--- a/Documentation/process/maintainer-tip.rst
+++ b/Documentation/process/maintainer-tip.rst
@@ -352,7 +352,7 @@ following tag ordering scheme:
      Changelog text starts here....
 
    so the authorship is preserved. The 'From:' line has to be followed
-   by a empty newline. If that 'From:' line is missing, then the patch
+   by an empty newline. If that 'From:' line is missing, then the patch
    would be attributed to the person who sent (transported, handled) it.
    The 'From:' line is automatically removed when the patch is applied
    and does not show up in the final git changelog. It merely affects
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

