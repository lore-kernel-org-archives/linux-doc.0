Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997338B14E;
	Fri,  5 Jun 2026 16:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675622; cv=none; b=DDfrBzzbRJ8md5P5SnHN/LcHgpnxwV8pzqDOE0WCQpcvOVr6ilNSNY0ISogn/3f7MJJzH0i3uS68iuPbhmZGbzzpLxlqvawqknaWS4CtNmqAitoT6UCIO+btxY2sMON9rExXQh2JtQPh+xPJeRzfCVcFjN8190k93R33wbr+AzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675622; c=relaxed/simple;
	bh=+f0FgVgAfVdTTVd30hmZXzYJzLBm+m4s3RfoUxdWTrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTayXNLHHQj0bvnItWIvRcLFgb9nsFqawS/15jRiIhpzzzxAs9i/dKU+QBplQ0K/cTO1358JXy0C32z8ERcqg7IMz7omNI90vZkzIZxQ/fTPbUBf6FpIoKKUUBwLZtMbg7SJCJHyAviAIdRMoJrLsxQHNZAxgij/twkTFVw84fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz9mMRVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz9mMRVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFAE1F00899;
	Fri,  5 Jun 2026 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780675616;
	bh=a3fjsrZVTPw1aYZ68MOZRhjvWhbqU4WKMYbQM6/kGaw=;
	h=From:To:Cc:Subject:Date;
	b=Kz9mMRVcZz92zZUMcK6kxzN4odPq1f1//hDJhb0psL2PVfB4ZrTpTN7o/h7/cXxb6
	 zIJos6d9BiwKXpgnTCycLVfFfmxmTTlCA0TX3xy10eYh4+RXZRgTw044U4kOORp2P3
	 sc0zQftcqpo2y7nOMN2wudqSXN4gUgM5AB9CxVZay6/f7NM+fnxDOwKeF0K2XCx6T3
	 8E235iZ7PyFotYwS/OJkPYCJAmlFXXTIPl4IMPC8vL0wB1SGd6JbzeABJV7Zf4l1yZ
	 NpbFRDV9mq4cvDDKe5MVd02GjQ9yrYP42VYq4rChYdgmoVpBGnnK8kfYMcowlkctHJ
	 oOjbrhEDcD6YA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: memfd_preservation: fix rendering of ABI documentation
Date: Fri,  5 Jun 2026 18:06:44 +0200
Message-ID: <20260605160645.3650271-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

The "memfd Live Update ABI" section in include/linux/kho/abi/memfd.h
currently does not render in the exported documentation. This is because
it should not include the "DOC:" in its reference. Drop it to ensure
correct rendering. Tested by running make htmldocs.

Fixes: 15fc11bb2cb6 ("docs: add documentation for memfd preservation via LUO")
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---

Notes:
    Mike/Pasha, I reckon this can still go in liveupdate/next. But if you
    think it is too late, we can probably take it via -rc1 fixes as well.

 Documentation/mm/memfd_preservation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/memfd_preservation.rst
index a8a5b476afd3..c908a12dffa7 100644
--- a/Documentation/mm/memfd_preservation.rst
+++ b/Documentation/mm/memfd_preservation.rst
@@ -11,7 +11,7 @@ Memfd Preservation ABI
 ======================
 
 .. kernel-doc:: include/linux/kho/abi/memfd.h
-   :doc: DOC: memfd Live Update ABI
+   :doc: memfd Live Update ABI
 
 .. kernel-doc:: include/linux/kho/abi/memfd.h
    :internal:

base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18
-- 
2.54.0.1032.g2f8565e1d1-goog

