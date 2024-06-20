Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450EC43AAE
	for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718871270; cv=none; b=raa1NtujKrTbEc+a2C8M9zgIprBdunw75r2XJkKgtFqWa6rfAKwEA2mFEmPW4zr4iSQS8hiNZAzI94JZPVjajN0YT4oyLUqH1SJijUwK8YcGlWXtJBJQhvZvU3dZAU/d+Zdhe4g4ypbqLoUyDlmJWsuTK02VB2EbWavBFhVjnYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718871270; c=relaxed/simple;
	bh=FlscvEDDcu13eoF5Wl9PsqwF+BZQhWYbeFw1m7NAi7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RonakpNeC8/Qigxz9IJCBXZV3QVBphbev86aTytoW9EK31zwVANSkD0duimuy7iHQg8/ujszWCBOlelbKB8sVKSYvIyHeeq06F/NOvCKWjW0CuaUuAsTrKF0paCWG4mSh3f0F3GveRS/esyauqTpkL4p2vwNA9tFunOq4SogJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=wR5hHjUP; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="wR5hHjUP"
X-Envelope-To: linux@leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1718871264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F0qRyJa+zNcoSXZSbnNp2Yjcsi5txCSu3tLo/Qr5tLo=;
	b=wR5hHjUPGjevcNdcBucyES59srKKZ11IKAUU5jV9TlhQL1DEbusysYo+3XaC2Fs5dN+eeG
	9zqnY4J3NJgYnWBUJFcS0+MvoBUePRYJ6sgLqUkrrZomnPFfi7sHJgSuPaexAvlfTVBzND
	z0yaljnNjdicJ5D3pHmfTqHBkcMrd3W+0Yfd0q6efOfKpORQ9ZOobM8KauCP+Eh2hwP23e
	ruPhq+KY7pPkZ2YZFaZ8qSpV4h5zTfFGROTFHE6aNHZvhvqk7wF1QU38dQfM6wwUIfL4GS
	8zOR6vAb7/H2bUg7cEz3kL5SJCvjm1Wb8X4cnbOruKs7gn7aHTd3xSdUpAs9cg==
X-Envelope-To: corbet@lwn.net
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: didi.debian@cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] docs: verify/bisect: Fix rendered version URL
Date: Thu, 20 Jun 2024 10:13:37 +0200
Message-ID: <20240620081355.11549-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When rendering the documentation, the 'html' file extension replaces the
'rst' file extension, not add it. So remove the 'rst' part of the URL.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../admin-guide/verify-bugs-and-bisect-regressions.rst          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index c389d4fd7599..6281eae9e6bc 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -23,7 +23,7 @@ mistakes occasionally made even by experienced developers.
    up in the reference section, then jump back to where you left off.
 ..
    Find the latest rendered version of this text here:
-   https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.rst.html
+   https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html
 
 The essence of the process (aka 'TL;DR')
 ========================================
-- 
2.45.2

