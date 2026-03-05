Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D693C6A23;
	Thu,  5 Mar 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723789; cv=none; b=QIhoKVWt+ghHB6I5chYwH3crBybfBa9O3vMqxs9N4fQl3i3LcQfoDxV/hIcn6GGLGF7m0EBUnKycSQv7IS9bYc1hcpO1VlrDbQ39KaBtR/qaWMobFhMbGm91Hp9GEM0aTwLjAG+DCRkEHD1sQTGXQ3fsbc1WbfHTKnMZAeoWAkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723789; c=relaxed/simple;
	bh=ZNZ2mFKPm+G9plRvw4WRwSksYn8HB30/8SoYLAYS4yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9NHC+/DyT8OA0F126cswSsB7DM51FmTKrUcIbi/SAen2oqjODIcPWaZenXdoDwcDSVkGT3P8G1Jr7tkuMOm09Ce6TWuZjKcZE04IwCZxtHB8dFKBuypJZwpf6rymCl026uEIZMJyVxCPHhHZRwIbQQMlQa6m0J9cJ47PbHwb5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZROBnyn8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZROBnyn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D470CC2BC87;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723788;
	bh=ZNZ2mFKPm+G9plRvw4WRwSksYn8HB30/8SoYLAYS4yM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZROBnyn8LoKoDWsT8Q590A8E2tRzecZaRoov4PaRwU92zao694dz2OzST1Ay20p3P
	 yeN73l7B3rsiwrK4TvgXwbXpY87HRX31hitS63+5zSFiIJJCnLL/PonneMIGiK5/mw
	 exhipSzx6YR4xIRRq5AOod+cT/y+30AvAeLzNZrliMHzNbmdHoAWV+Fs7UY9kCSkDP
	 y5Co/7A0H2SY6MHl4r2cT3Z3ipNa7wpwbLRE9YN/aEf2l7fVuQepmx+RY0PG1FrLFA
	 IHXvCXWi62IXUeHHmfwQnAdUYvzWJ7TtodW1hJ64aHoQQ9aXfZn282IEa86fhF1jx+
	 yfb7mP/o2Lv3w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR8-0000000HKEB-46YB;
	Thu, 05 Mar 2026 16:16:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] docs: kdoc_output: describe the class init parameters
Date: Thu,  5 Mar 2026 16:16:17 +0100
Message-ID: <b771c7d4fe0741292799ab13e5ae78d125d6c678.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As this class is part of the ABI used by both Sphinx kerneldoc
extension and docs/tools/kernel-doc, better describe what
parmeters are used to initialize ManOutput class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 29 +++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 968e1d43de47..52fc41bd17b7 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -580,7 +580,34 @@ class RestFormat(OutputFormat):
 
 
 class ManFormat(OutputFormat):
-    """Consts and functions used by man pages output."""
+    """
+    Consts and functions used by man pages output.
+
+    This class has one mandatory parameter and some optional ones, which
+    are needed to define the title header contents:
+
+    ``modulename``
+        Defines the module name to be used at the troff ``.TH`` output.
+
+        This argument is mandatory.
+
+    ``section``
+        Usually a numeric value from 0 to 9, but man pages also accept
+        some strings like "p".
+
+        Defauls to ``9``
+
+    ``manual``
+        Defaults to ``Kernel API Manual``.
+
+    The above controls the output of teh corresponding fields on troff
+    title headers, which will be filled like this::
+
+        .TH "{name}" {section} "{date}" "{modulename}" "{manual}"
+
+    where ``name``` will match the API symbol name, and ``date`` will be
+    either the date where the Kernel was compiled or the current date
+    """
 
     highlights = (
         (type_constant, r"\1"),
-- 
2.52.0

