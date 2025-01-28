Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DCD3D6D;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=uG7FjfkkpmKnaSw++OCfbTIkkhh3famBUWQIl6+gQuv4rwTST9DglRRb8WON7w3FxY22QRqj5voYBot3fByVxuG495c4nIMEg8ArIeQHx2fIGaYZdNfEilKJa845GpgKjGddtPJBx4Yq60WxRV0NamLhIMqnV4FdkV096SGLTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=IFfJ6jqxdTobj9ECUn0r6qKV42rp7aK/OvTRbD8u8YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0BmMyrAUbcV9eaVTNZN06aqbkPpRU9QdnxXwTQvMgQAt0ROcEvHcAtyji4b+jsBmbXlfttiTjA15WHld7SYxK9yY9TeLQrFst4xWk+a5w7xDAEfA5RB4uYGqI98BbO18EkC/8Wdrwv7cHL5E2ZSvMttLGhc9mhmN/xmC8R1D7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZMGL8mj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZMGL8mj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D293C4CEE3;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=IFfJ6jqxdTobj9ECUn0r6qKV42rp7aK/OvTRbD8u8YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OZMGL8mj/vHrvfyGU5ZymZpRstm/e7HpJN2D4HuF9Rfk427vNBRVoO+3/X5wvgEeG
	 0a1+m1aezzyCvXJyNcrSXZiZfh9Rzq2zgz/oVu9dHRSY2IRYqOViaRLCVGCAN+gsF6
	 JtMGbZDuQgEvS8jDj47pvcBbIdkhXNEiZGXEMe9d0OUBvXtUhqgs1MAWnKB/TKTLEn
	 PZzT2QYsrA2jQLxuZvcXTwIw1igoNABRdzroNEbcISx3bPyX++09yhL2eW8lmb6BdT
	 WI/YNZYSxE07ZXuqSskFMN/DCae2rstFcBKrUumHwkXPrh4gl3GpzMjS2o5YEc2CMe
	 0JQvu0N+8qNFQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRKl-33Fx;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 06/38] docs: admin-guide: abi: add SPDX tags to ABI files
Date: Tue, 28 Jan 2025 01:05:55 +0100
Message-ID: <28d86883d0e7f1de70c9e83eadec9e135abbd0d8.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Such files are missing SPDX tags containing the licensing information.

Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst | 2 ++
 Documentation/admin-guide/abi-removed.rst  | 2 ++
 Documentation/admin-guide/abi-stable.rst   | 2 ++
 Documentation/admin-guide/abi-testing.rst  | 2 ++
 Documentation/admin-guide/abi.rst          | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index 594e697aa1b2..b655615917f1 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI obsolete symbols
 ====================
 
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index f9e000c81828..ba941c1af178 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI removed symbols
 ===================
 
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index fc3361d847b1..5d738f345333 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI stable symbols
 ==================
 
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index 19767926b344..a867e6578bf7 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI testing symbols
 ===================
 
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
index bcab3ef2597c..64e772bde943 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================
 Linux ABI description
 =====================
-- 
2.48.1

