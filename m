Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61762FFFA4;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=tbl9ulyraYUCHMIYTopPJz3/QwX2+A2mrXYfWYQrQDCnXP7uIyf5/cq+PWbK+xvmVMu/SLjtPt8X6+rKAfuV9q6I4VZ992KJOn6ym2M1k3LOXDuQYUTGiropDhnwL2zvcIuJ4ZSMS2tG5OTGohc2e2p+H4cskUh3G+PPAbicAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=nryACzQkYVGoIPhbMWi4hHgCP/eXYlXs/XEX5Hcvvo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trHIeywqcsjxx0UBK7rK1QJgpueI3bH81Cfe9IOEacUXhEIRiQGHM2273aDBRt02SKnir45JRvYyvOZhZeOh6dEj1vnqJFJWtlOzqwAPoZiaJ9ksE1UwtinBhRyjK9o7K/q6BbHSqcM3+LDnhzmmT49Ez5PG1Css1AgMK/woklw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFZjjNyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFZjjNyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6240FC4AF16;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=nryACzQkYVGoIPhbMWi4hHgCP/eXYlXs/XEX5Hcvvo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fFZjjNyNXxM2ofU6YCKansPfY7PQM2PhwxMQ3GK5sWkCZh1jXyyY4DpkOc2hHMyL2
	 U2p5oHYNV0qq2CbM3khoSMqhMlchIa+Mau6jLPFvPWGPOEYIs9dOAVDrtlU+hUZXXE
	 ZC3hddCKwXC0xOg3PCtwNNZEqH2WOq2GOCGixu1fsoLx10h4C+EfYOZ4DK3Y5S9pU8
	 ZzJa8nHHVuOPDkJZtAggxJwcc5zbvR2P9mDwbnxX12XV6E7uzAp03afsq0a1G5Pewr
	 DPo64rgVq00GvhsFcr/VyxVg1pd5xakU+2PnujcpZvgHrm8cwYOs4d5QOSU/YIYpKA
	 UMQxd7ylErfbg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2o-2muI;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 22/25] docs: add jobserver module documentation
Date: Mon, 19 Jan 2026 17:23:25 +0100
Message-ID: <688215d6a41d78bd5e37854472a5fc802d58c77a.1768838938.git.mchehab+huawei@kernel.org>
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

Place jobserver module documentation at Linux Kernel docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/jobserver.rst | 10 ++++++++++
 Documentation/tools/python.rst    |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 Documentation/tools/jobserver.rst

diff --git a/Documentation/tools/jobserver.rst b/Documentation/tools/jobserver.rst
new file mode 100644
index 000000000000..31eaf25a8481
--- /dev/null
+++ b/Documentation/tools/jobserver.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Job server module
+=================
+
+.. automodule:: lib.python.jobserver
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/python.rst b/Documentation/tools/python.rst
index 978298fba6d3..b196d718e176 100644
--- a/Documentation/tools/python.rst
+++ b/Documentation/tools/python.rst
@@ -7,5 +7,6 @@ Python libraries
 .. toctree::
    :maxdepth: 4
 
+   jobserver
    kdoc
    kabi
-- 
2.52.0

