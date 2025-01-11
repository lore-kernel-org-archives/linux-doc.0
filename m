Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF282899;
	Sat, 11 Jan 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736611876; cv=none; b=nMxNo/MPNK46Iac6Brxd4C44a6LXN3ZVDYst3tk47YounMN/EOcKS1SoXjmcU1z/RXUj4xmIhqrQkg4pyCLRA4sRRwto0qZii+bRJ/B5JR+d9LWUh+PxmyGcrdulnVk1CJGJ4Vkcv0XwEf6Nfo4sWuwMKXxh4qiFhzOi+UT651E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736611876; c=relaxed/simple;
	bh=VCaVMaDJXywQsj6GMlzr7aUlMmv7pmEVlJbeNUR5OKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oXD5AytPYEt2Z9de+AQyUtWsz7bpOAxznr9xdIXuyDL3ai+SubwG8KIVIuI8Dv2yn5skfWnuVtKUFuewH1AklxuS7k8f9tqNpl2uerV7Kh9Uw7BP+KeG9hjbNtEni/oXjxSNDLmQdDsXU+tJo4G6CWJhKdwxAyhvpE0Bmdxi32U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAwb4hX9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAwb4hX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B812DC4CED2;
	Sat, 11 Jan 2025 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736611875;
	bh=VCaVMaDJXywQsj6GMlzr7aUlMmv7pmEVlJbeNUR5OKY=;
	h=From:To:Cc:Subject:Date:From;
	b=dAwb4hX9rnXZh7IUFTskMNKeaELTEdu8w/NxZvFKm6+y6dwH0nDjSRKt/XkxypgtT
	 lpza6gO8qQxGNopNopkIR0DnhsLtdeonfK+ouNqlt0AhF4yfRWrVgYTrKmtPoh8FD3
	 DCG59zsR3GahGeckcbvx46hXR//0JyhA9rxpQjoYuQU/GuAXu0f5P3Fo8msNYwkwGW
	 VnOTXMdpvLzcWNpEM1Wb8TQ1FyLV+JRdkCRaWDwSVLXSLPMdbm7aZ5A/j98TcwlZtF
	 wgWkDv285iXNQDHIW8/DFQ9y+EbDItdrqnxtjWsuXHinYbolY/u8L9r9ZS3fZygRkO
	 FOwjejKrtLfCw==
From: carlos.bilbao@kernel.org
To: corbet@lwn.net
Cc: avadhut.naik@amd.com,
	akpm@linux-foundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
Date: Sat, 11 Jan 2025 10:11:06 -0600
Message-ID: <20250111161110.862131-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>

Update .mailmap to reflect my new (and final) primary email address,
carlos.bilbao@kernel.org. This ensures consistent attribution in Git
history. Also update my contact information in file
Documentation/translations/sp_SP/index.rst to help contributors reach out
for Spanish translations.

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 .mailmap                                   | 3 +++
 Documentation/translations/sp_SP/index.rst | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5ff0e5d681e7..83837191affb 100644
--- a/.mailmap
+++ b/.mailmap
@@ -140,6 +140,9 @@ Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
 Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
 Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
+Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
+Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
+Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
 Changbin Du <changbin.du@intel.com> <changbin.du@intel.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
diff --git a/Documentation/translations/sp_SP/index.rst b/Documentation/translations/sp_SP/index.rst
index aae7018b0d1a..2b50283e1608 100644
--- a/Documentation/translations/sp_SP/index.rst
+++ b/Documentation/translations/sp_SP/index.rst
@@ -7,7 +7,7 @@ Traducción al español
 
 	\kerneldocCJKoff
 
-:maintainer: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+:maintainer: Carlos Bilbao <carlos.bilbao@kernel.org>
 
 .. _sp_disclaimer:
 
-- 
2.43.5

