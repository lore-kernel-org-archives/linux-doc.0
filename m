Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851363CF697;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=UqgYwe4tQ1HfTZBd7PZyKwwNETkgGRASADAAokveyEpbG1KFiedfqwb/2FZqNWvWGKpFTAkKThBdoslOpd0wjllqcYTsjgDWmQIZ4dnGd7bc856A0HpeR7IiZFNn44lMg8kYW457jGmzUSUF32w1fhimUnpZZgHANNbApBQ+b3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=J9mk5CgIixf/IVw/YsnhxrUuwYrtPC7QGEk3ABcDVNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a4q16dyEFSKvNceWS81uT10f5V1i/MkwpIyBTBUjN+OT4Cslu34ilQIqgJ9IcgfOHAgRthcD1EiYmbaZsKO5ginaQMHI9bd6JCbhOnWvW5by58TymA/FwcF2PuujHo8GaMNZ/pYBqY7ZCkDwyqiMcWWK+P/URqdqLYJV+goSk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv6riwQS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv6riwQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A49C2BC87;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=J9mk5CgIixf/IVw/YsnhxrUuwYrtPC7QGEk3ABcDVNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kv6riwQSEHWeHT8qvWQoAsAJThiVQKHjCxl/FQ6fVi2S70trKWdv74fMz4pNxc8f2
	 1EvHEAtopY9YZckEB0gwi7VzvwUEZosRWNPSrnmjqPea/N4Y3Nr1gcUUAMoL/sdkMD
	 tCvZfjHeeMCAdLDTPDyEVe/xdTgB2UGuef4kBfWqa1khK9U+utG2UZ6kdFlsLbDPA0
	 s1Yynlkz7w3GhsQi95r9IPvsB37PJMByP/8rXsthaoRZyiE3RhvE+RkUZRn1ICOT7D
	 gv28mEVQTWgGO8YoLyDkhnRTXFoeZ9zISfm0/pxo1fV35sh6tYNjfKpmc5EERfCh3X
	 +6L0/LV44oy0A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqj-00000004HZh-2lbS;
	Wed, 18 Mar 2026 15:26:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] MAINTAINERS: update documentation scripts to add unittests
Date: Wed, 18 Mar 2026 15:26:07 +0100
Message-ID: <34ebaf62cf147034064fb55e5869d4d2661284d1.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Ensure that we'll receive e-mails for attempts to touch
tools/unittests.

While here, place entries alphabetically sorted.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c05a72245049..f0b106a4dd96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7679,8 +7679,9 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/sphinx/
-F:	tools/lib/python/*
 F:	tools/docs/
+F:	tools/lib/python/*
+F:	tools/unittests/*
 
 DOCUMENTATION/ITALIAN
 M:	Federico Vaga <federico.vaga@vaga.pv.it>
-- 
2.52.0

