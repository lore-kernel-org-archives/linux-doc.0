Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6EA78F59;
	Mon, 27 Jul 2026 00:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111015; cv=none; b=jz9dSbekx0DgNWsOLEsBMRM1zdQDtX/3gpyRy7Ys2wo7LtUDAcgvGMLjtjOHDy0jZCSXD7+hYM9ZT7Fog94MF64M8jvd9dTkZC6V8SomboXqRTs0za9ChcyA+21cUZS2DzFdq0sSwXagG4wxADh/DuCvQQHK2vkny9vJkfiNYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111015; c=relaxed/simple;
	bh=Y2a1ie7w0StcLNUjjcc7sEPKC9Y08m7mO2ympBQ1Sao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ar+qYQ68mw4MP0Z5sXJb3PST18AgPPFpXLQL0tAfMCYhGEdezHQTuvTI8X5OQ9JlDbFZofNHLQ/MRH7slDxM8MiRY2+mcLXl1fOLQKJi+nWnWdEuwJUcFbThO9tcMa04KS1nn0d81XQJsj9TddWy8Md7x9bfbfzgj9klLp55XrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jSlr181v; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jSlr181v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=L23i/+dize5vXpnrKQcbbBaJGTAdk8toUK7NA4PU95M=; b=jSlr181vd2uGkftBMKdChWsRWf
	SQG++ALDqnEB5x2vE2W120pZI5FkjlBrO7RU8kcVBR4DTwHkOkJKJjXy9F8X3JIOwIaum8I1hp6P2
	uQWKR+EQrGWJMFW9m+NO1U/F9NGKW2ARVmMpfjcEVtxWe+Of+36sm+JgMP7/ntg9kDS5xRggh9ttq
	aEbRDJliI7rY7VaFkNkQbzX/JrmUUZ1RMtoS7Y6llhyCBasK7KM2gY+PaOZct0frsvpwuWLRMvI4w
	/Z+w5qOMOjtU6FC22v+k50Sat3cv8nXKGamxd4NfcfqJeIWU+MVvKxwsP4OO/evF0pQEAVnT5VVLl
	YhHF64Wg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo8v2-00000001jDj-34gG;
	Mon, 27 Jul 2026 00:10:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: fix cpu-feature-registers Malformed table
Date: Sun, 26 Jul 2026 17:10:02 -0700
Message-ID: <20260727001002.3016279-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "visible" column was dropped so that last line's extra pieces
should also be dropped to prevent a docs build error:

Documentation/arch/arm64/cpu-feature-registers.rst:170: ERROR: Malformed table.
Right border not aligned or missing.

+------------------------------+---------+
| Name                         |  bits   |
+------------------------------+---------+
| RNDR                         | [63-60] |
+------------------------------+---------+
| TS                           | [55-52] |
+------------------------------+---------+
...
+------------------------------+---------+
| AES                          | [7-4]   |
+------------------------------+---------+---------+ [docutils]

Fixes: bc7f7ddc64df ("arm64: Remove hidden bitfields from cpu-feature-registers.rst")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>

 Documentation/arch/arm64/cpu-feature-registers.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260726.orig/Documentation/arch/arm64/cpu-feature-registers.rst
+++ linux-next-20260726/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -167,7 +167,7 @@ infrastructure:
      | SHA1                         | [11-8]  |
      +------------------------------+---------+
      | AES                          | [7-4]   |
-     +------------------------------+---------+---------+
+     +------------------------------+---------+
 
 
   ID_AA64ISAR1_EL1 - Instruction set attribute register 1
