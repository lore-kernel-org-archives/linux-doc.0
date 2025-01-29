Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62A01DFDA3;
	Wed, 29 Jan 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738172365; cv=none; b=CN6SFYTZaXFzDnJaLfoNoZkHbsp9eBxX0LUGqXl8jD8R1gBw32Ia7TGqBA/nD/MTMn66Nd7iriNnziSPk9t4+pOWcJF6K1gC6X2J0fv3h4cPfvH/93dOMFVq1YX5SXsJgACHiVIvLzoBM7QUIDfyWZVzTULwOayTp8gRiyu7dWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738172365; c=relaxed/simple;
	bh=31QWdnjJ3Q7WNte0pNALik3EiaOkqFc9f2Wf++QpPF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0UMmpCLZUpV7CUWALr2r+uHp72vEaMGasL2H6AqVPQoLU1vWFvWQ+QDxHDoLCRoGDTTjogzv+MAGVqa8I1A/OJEmOinfgCAIcEGvFiiZ3WPtXq8ylVpE+rH0GR1KRk/8rLqJOmprq9GoYa/DhW3kyOhLaNOxdnIEoeri1ysE1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5I/RBUz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5I/RBUz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C97C4AF0B;
	Wed, 29 Jan 2025 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738172365;
	bh=31QWdnjJ3Q7WNte0pNALik3EiaOkqFc9f2Wf++QpPF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5I/RBUzZvzV2a2WIjI99Dk+jyzytrxf+XjNe9ohVA0mtutjqaGE42WKPdybmUzYz
	 IDwAyEr+ZXm7ze4xoj/zR67UXkwMCqoxcar2a//ug76tCae/KQg/MUf3qj1qVkwo1L
	 7jCl0BleMjJBXFqpLpv+6LgNBtZNMN5NvQSbCw8+UBZgy4Zv/MeJl2xzps18axDGRm
	 pCG7xjPOY5KN9UzIKUxw7O3pi9cC3I7hEHQylGYZfNSuBOxPBXrr0GuHOOEQjeH6Dw
	 sa1UI+N1sepiG0n9QuTEEXtb6TsXFqPtWffdXg2vPbop2B3TwuC+vQEJjon3omcb4z
	 EE2JeaACmj1bQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdC26-00000004SdE-3Ad8;
	Wed, 29 Jan 2025 18:39:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] docs: trace: decode_msr.py: make it compatible with python 3
Date: Wed, 29 Jan 2025 18:39:03 +0100
Message-ID: <334beb900aa4db48f82289f2fed0c858079499f9.1738171937.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738171937.git.mchehab+huawei@kernel.org>
References: <cover.1738171937.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This script uses print <foo> instead of print(foo), which is
incompatible with Python 3.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/trace/postprocess/decode_msr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/postprocess/decode_msr.py b/Documentation/trace/postprocess/decode_msr.py
index aa9cc7abd5c2..f5609b16f589 100644
--- a/Documentation/trace/postprocess/decode_msr.py
+++ b/Documentation/trace/postprocess/decode_msr.py
@@ -32,6 +32,6 @@ for j in sys.stdin:
 					break
 		if r:
 			j = j.replace(" " + m.group(2), " " + r + "(" + m.group(2) + ")")
-	print j,
+	print(j)
 
 
-- 
2.48.1

