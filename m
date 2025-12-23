Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781C33E36F;
	Tue, 23 Dec 2025 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492474; cv=none; b=QyIwUH/kVYkCWZV+OFpiNJZWJvGrDXJAbbs59HYrU+jU1ms7rGdjnxqyR9cdbUd8trZOIyoWfAGxQWzF7TuNW+UoIKlV3rgYwStjXbTq9JF2zsV064bQMYtlKUi4u0Trj47f5rHdwFELTUdiLzVq0anPckeTXurCzSxnSWoRG+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492474; c=relaxed/simple;
	bh=JlGNBsLe9161u8rdg112J63eiklxCZvOaFs17LzTyRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBhI8KtCvtpwG7Y4FeG4pIHB/XQXL49jhHcUGLZLknF8c6xTOxPtMahCd8JFEM0Jicm/lhdMyDfCC3R7lUUfcEGgl8McalrPSrwVEA6NTQw22n5u4qiTFJTHdt2Jnd3RUmc6VBuvIOhz9JqFEYIqZtAl6/NS8UXytnKn42WjO6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzAcQwW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzAcQwW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAB6C113D0;
	Tue, 23 Dec 2025 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766492474;
	bh=JlGNBsLe9161u8rdg112J63eiklxCZvOaFs17LzTyRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzAcQwW4KFV3fXJoMQS8cUt0acK8+ZSFyx2IHGJvizWcZ4FkuEkPU13OaynnE0Z53
	 PvNJkw1ETwLCOLM/mV9/jtoPknSNRqTQt38gnhGWouZfmxJp0skQRWa6v7rokv30NN
	 zPR9vi9VHM63MA/b07pczIi4hyJFJKgTtHkeMRozsJEfwDW6cc2YpctMX/xmfOVE6M
	 Iavpvh6xJayo31VfPcAJP8cVrz0Wa05bHIIocv64ug8nw3nMh61RzcEAn1L1BYPipx
	 MZJPMvsWXvc3J0/OgDDx23Xl4cykBGPMzKQn/INJtRctcnFT5v6mowRqv4hjQ9Z7KX
	 /nVIvRFoMxzGA==
From: Sasha Levin <sashal@kernel.org>
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2] docs: add AI Coding Assistants documentation
Date: Tue, 23 Dec 2025 07:21:10 -0500
Message-ID: <20251223122110.2496946-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <877bue18ch.fsf@trenco.lwn.net>
References: <877bue18ch.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add guidance for AI assistants and developers using AI tools for kernel
contributions, per the consensus reached at the 2025 Maintainers Summit.

Create Documentation/process/coding-assistants.rst with detailed guidance
on licensing, Signed-off-by requirements, and attribution format. The
README points AI tools to this documentation.

This will allow coding assistants to easily parse these instructions and
comply with guidelines set by the community.

Link: https://lwn.net/Articles/1049830/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
v2: Move guidance to Documentation/process/coding-assistants.rst (Jon)

 Documentation/process/coding-assistants.rst | 59 +++++++++++++++++++++
 Documentation/process/index.rst             |  1 +
 README                                      | 12 +++++
 3 files changed, 72 insertions(+)
 create mode 100644 Documentation/process/coding-assistants.rst

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
new file mode 100644
index 000000000000..899f4459c52d
--- /dev/null
+++ b/Documentation/process/coding-assistants.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _coding_assistants:
+
+AI Coding Assistants
+++++++++++++++++++++
+
+This document provides guidance for AI tools and developers using AI
+assistance when contributing to the Linux kernel.
+
+AI tools helping with Linux kernel development should follow the standard
+kernel development process:
+
+* Documentation/process/development-process.rst
+* Documentation/process/coding-style.rst
+* Documentation/process/submitting-patches.rst
+
+Licensing and Legal Requirements
+================================
+
+All contributions must comply with the kernel's licensing requirements:
+
+* All code must be compatible with GPL-2.0-only
+* Use appropriate SPDX license identifiers
+* See Documentation/process/license-rules.rst for details
+
+Signed-off-by and Developer Certificate of Origin
+=================================================
+
+AI agents MUST NOT add Signed-off-by tags. Only humans can legally
+certify the Developer Certificate of Origin (DCO). The human submitter
+is responsible for:
+
+* Reviewing all AI-generated code
+* Ensuring compliance with licensing requirements
+* Adding their own Signed-off-by tag to certify the DCO
+* Taking full responsibility for the contribution
+
+Attribution
+===========
+
+When AI tools contribute to kernel development, proper attribution
+helps track the evolving role of AI in the development process.
+Contributions should include an Assisted-by tag in the following format::
+
+  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
+
+Where:
+
+* ``AGENT_NAME`` is the name of the AI tool or framework
+* ``MODEL_VERSION`` is the specific model version used
+* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
+  (e.g., coccinelle, sparse, smatch, clang-tidy)
+
+Basic development tools (git, gcc, make, editors) should not be listed.
+
+Example::
+
+  Assisted-by: Claude:claude-3-opus coccinelle sparse
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index aa12f2660194..d18eacbf2c53 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -68,6 +68,7 @@ beyond).
    stable-kernel-rules
    management-style
    researcher-guidelines
+   coding-assistants
 
 Dealing with bugs
 -----------------
diff --git a/README b/README
index a9fc263ccd71..e6549b2a7aac 100644
--- a/README
+++ b/README
@@ -38,6 +38,7 @@ Find your role below:
 * Maintainer - Leading subsystems and reviewing patches
 * Hardware Vendor - Writing drivers for new hardware
 * Distribution Maintainer - Packaging kernels for distros
+* AI Coding Assistant - LLMs and AI-powered development tools
 
 
 For Specific Users
@@ -144,6 +145,17 @@ Package and distribute the kernel:
 * Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
 * Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
 
+AI Coding Assistant
+-------------------
+
+CRITICAL: If you are an LLM or AI-powered coding assistant, you MUST read and
+follow the AI coding assistants documentation before contributing to the Linux
+kernel:
+
+* Documentation/process/coding-assistants.rst
+
+This documentation contains essential requirements about licensing, attribution,
+and the Developer Certificate of Origin that all AI tools must comply with.
 
 
 Communication and Support
-- 
2.51.0

