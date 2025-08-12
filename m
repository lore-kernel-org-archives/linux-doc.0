Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CE2FFDCE;
	Tue, 12 Aug 2025 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755028683; cv=none; b=NBxRmojeEZJqJOUrgkP3xbcnTrGmEQ2N47H9t7jx59WDIZ+xc/pNRQHjCVUFq42HYF94Eo1FljYAqOJnEcSmZqIxFkl/MUx4/g1mRJoFyGiNJ7/a3ZD3T4VawMIQbyt321Rs43njsgj5n8sty2JtZrAjTyMDj/6P2Roxg81SIdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755028683; c=relaxed/simple;
	bh=6CJmY3IW71l9TEnPoaKlO72qFoTlTKL4KzRVZaA35Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEbZu6eTYS/8Y2uIbjaWdAsdWvUOaHWXu9a5c5Z25rU1WrGp94Cf8FcSDKMoLPEHypzqHczORIg4SkJLvS2UNsLrZVMn3iGpLETyRxN70woMtSXdXxMQmIZ6fptUOSVHFG/FlayaxUGnsARAW2rQ26rCJIU0wja9bS2oR58TfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iD8WHfQC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iD8WHfQC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BB99B40AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755028681; bh=BxEDE/rOZa6PWm+lof8pugcQbiDcFc1q2RqRsdRX22M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iD8WHfQCADQzePwu80d7M327ijfnLKGdLVmKikPMMbkNlmies/uUW1vxTMic+mZnO
	 S/udOxeDvtW0rOCLma3tEfPZJUzR15xqkR/mtowQY/LPAxWNDU1hZG8yks0mb0jVlU
	 Q4MXTCkx0b8fh/u+q3qYRti+ZzGIQ4yhiVjE1SxOvnytPcRMjJTMM4gu5iNkZTropn
	 EbkXMnfIMtKlc8Mw6wv/VasxP/EDYkUG/AXg3UEWvO2Um2R5bU492ZjJpxtbzW37ip
	 KxH4Jw5jUZ7VcNYmFNgfFaoWraJAbXpVA0SyhCyDmb4CRHttjJicyzoWHfR1VgaANT
	 0WJXVBQU22HQw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id BB99B40AF2;
	Tue, 12 Aug 2025 19:58:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 7/7] docs: kdoc: remove redundant comment stripping
Date: Tue, 12 Aug 2025 13:57:48 -0600
Message-ID: <20250812195748.124402-8-corbet@lwn.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812195748.124402-1-corbet@lwn.net>
References: <20250812195748.124402-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By the time stuff gets to create_parameter_list(), comments have long since
been stripped out, so we do not need to do it again here.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index ceb38b59fb4c..900c028687cc 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -493,9 +493,6 @@ class KernelDoc:
             args = arg_expr.sub(r"\1#", args)
 
         for arg in args.split(splitter):
-            # Strip comments
-            arg = KernRe(r'/\*.*\*/').sub('', arg)
-
             # Ignore argument attributes
             arg = KernRe(r'\sPOS0?\s').sub(' ', arg)
 
-- 
2.50.1

