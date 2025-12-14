Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB513261B98;
	Sun, 14 Dec 2025 01:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765674440; cv=none; b=qzD+jV1F01UMK4k1jxFDDb7bIxcLWjwb9aw1Z5vZleOvtfU8hJDLpFcUnTiLBZFfW34m9XA6DD1eIvIM37LGKKsLgXO3NIUzY+zhv+CGJ+E9yk7b4D7TlLyvL0Bq3FBx+SZNL4abaIr1rv7S/89+ZNmcEtykos4PcFK3x9Gwegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765674440; c=relaxed/simple;
	bh=g/KWu2Lynb5qelgrtC5KNZaqiIE8UbUg6nPZGkgE5T4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hELeREJQVfjz15qRfN9BNWKRkvMTOhnVvZkNV3TWUtvDy7A22DPy55n8Imlg+0u4vYQRYc+y7sac0H3hRDlJLIbJSe4a47Uls6KCYyEGoc0RVmyfXzzOf8Vhkn/50cd41khmmtoRvb0X2NhWzgsDl+bOp3OhizMfJgeeOof87qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amRdYqxV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amRdYqxV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8F5C4CEF7;
	Sun, 14 Dec 2025 01:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765674439;
	bh=g/KWu2Lynb5qelgrtC5KNZaqiIE8UbUg6nPZGkgE5T4=;
	h=From:To:Cc:Subject:Date:From;
	b=amRdYqxVKi7gz07yDfPKmXeWjKtT5lcGoM791lLt5u32BBRYDO8shIv77F9QAr9AW
	 xuoZeTD5ivjMa6nNjXC4eKC9xJAKz73xviHSjR8+IVbD157cflrDVZlCE8Ai0bcz0+
	 wqssLURNu9pAVe1+LI9+Ih0dCgwPBVajC1fF4AZ6kV5ITsfZoaXfkHwhc+1WgZ8LqX
	 yhRHukVnywvFDKynFi+JAJpyDlCtroIAT+F7cYYq7iot0Ckqh969QQ1nPWydjNGHo9
	 gPqp1XwQQrIrpXDSTENhq4ojO/fZneIv0ZQn0p0fkmk3gqAxetnWehC2uR9hGaCgyy
	 0GvS/95SHHRDw==
From: Sasha Levin <sashal@kernel.org>
To: corbet@lwn.net
Cc: joe@perches.com,
	kees@kernel.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] README: add AI Coding Assistants section
Date: Sat, 13 Dec 2025 20:07:11 -0500
Message-ID: <20251214010711.370328-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add guidance for AI assistants and developers using AI tools for kernel
contributions, per the consensus reached at the 2025 Maintainers Summit.

This will allow coding assistants to easily parse these instructions and comply
with guidelines set by the community.

Link: https://lwn.net/Articles/1049830/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 README | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/README b/README
index a9fc263ccd711..f6016e553ba4c 100644
--- a/README
+++ b/README
@@ -38,6 +38,7 @@ Find your role below:
 * Maintainer - Leading subsystems and reviewing patches
 * Hardware Vendor - Writing drivers for new hardware
 * Distribution Maintainer - Packaging kernels for distros
+* AI Coding Assistants - AI tools and developers using AI for contributions
 
 
 For Specific Users
@@ -144,6 +145,38 @@ Package and distribute the kernel:
 * Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
 * Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
 
+AI Coding Assistants
+--------------------
+
+AI assistants and developers using AI tools for kernel contributions must follow
+the standard kernel development processes:
+
+* Development Process: Documentation/process/development-process.rst
+* Coding Style: Documentation/process/coding-style.rst
+* Submitting Patches: Documentation/process/submitting-patches.rst
+* Programming Language: Documentation/process/programming-language.rst
+
+Important requirements:
+
+* License Compliance: All contributions must comply with GPL-2.0-only licensing.
+  See Documentation/process/license-rules.rst for SPDX identifier requirements.
+
+* Signed-off-by: AI agents MUST NOT add Signed-off-by tags. Only humans can
+  legally certify the Developer Certificate of Origin (Documentation/process/
+  submitting-patches.rst). The human submitting AI-assisted code is responsible
+  for the Signed-off-by certification.
+
+* Attribution: Contributions involving AI assistance should include an Assisted-by
+  tag in the following format:
+
+    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2] ...
+
+  Where AGENT_NAME is the AI tool/assistant name, MODEL_VERSION is the specific
+  model or version used, and optional tool names indicate specialized analysis
+  tools used during development.
+
+  List specialized tools (coccinelle, sparse, smatch, cppcheck, clang-tidy,
+  custom scripts) but omit basic tools (git, gcc, make, editors).
 
 
 Communication and Support
-- 
2.51.0

