Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF3F3002A5;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=H1cVHmm09t4Akn47Rd6F+4LFBDIWnTYTwjyILjJIr2sS4zngovbEBkb1W8fEomKoi4+hpR3R0hQ5B4PEL/dyDWGV1TllJU9I6fya9i+v78aU/XmgzpvktNqj+IM5lhV07N5cbtkwxc4y3RBfqusLpXEGjIo+1kYGbb3QtjZq788=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=/AtZKw8H6zvX7PhJhNlxPX6rD2v2QCXv+OqXKiT4wpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejv2XzxKOnh+50bYvBGFe2lSMT3wtJjzJUBlEB3uyLdlufo6pDla98Wsz4DG5U+/xlXUpD0whDdaO5YTnvhaH/FPXg/5qILJ3uNWhUjMRzXjhnGTL3BeqFEDXoaywNQg/zVrfmq0S3Uy7nbECEYADOmpRxwN5bF5ItyYhE7cSQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSybT2NY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSybT2NY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694E4C2BCC7;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=/AtZKw8H6zvX7PhJhNlxPX6rD2v2QCXv+OqXKiT4wpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSybT2NYjYfZDOyq5eigM7E20efea2WnhgLwW4GtdIa6MOOjyDh5XdL8dOVITYqHP
	 puE5nrYRLsMmmsF0tMKyCRkbYMlhBDTRnDhrLVXAas7NmIn6p5j9W54nWAwYlceZjD
	 pl3RecriJrLk34LXlQ71cKaH+dMaw1avzKWYZOasZSOUSNl1Tser4POLpKcnO2v0Fc
	 yMCLwt6XV0Kt3OepsGO2EAcYs8FvujnFDT5mvkrbIwNMQDG8r9rhrDYbOf0ZTpSMTS
	 gaDaDDJEZGnbLalXYIP0jHtFM5krm4cJLMteCg2C4+IV/lzFoPWfcUtFj/ECfrOXfJ
	 kIvqod0AtRxxw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2w-30TT;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 24/25] docs: add parse_features module documentation
Date: Mon, 19 Jan 2026 17:23:27 +0100
Message-ID: <7c1e41468f765587f0962222e7f52125a039028f.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Place parse_features module documentation at Linux Kernel docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/feat.rst   | 10 ++++++++++
 Documentation/tools/python.rst |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/tools/feat.rst

diff --git a/Documentation/tools/feat.rst b/Documentation/tools/feat.rst
new file mode 100644
index 000000000000..021560eb6e6a
--- /dev/null
+++ b/Documentation/tools/feat.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+Documentation features parser module
+====================================
+
+.. automodule:: lib.python.feat.parse_features
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/python.rst b/Documentation/tools/python.rst
index b196d718e176..1444c1816735 100644
--- a/Documentation/tools/python.rst
+++ b/Documentation/tools/python.rst
@@ -8,5 +8,6 @@ Python libraries
    :maxdepth: 4
 
    jobserver
+   feat
    kdoc
    kabi
-- 
2.52.0

