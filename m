Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AAB38D3E4;
	Thu,  9 Jul 2026 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598715; cv=none; b=uM8YN34X88oC2LEmBmXDuLUwfyggbVaNOWbXIXpbRKOgoZD+gdpIlGlczkY+n/AWNT0qNdtMajBe0OvBkMa7j9TSpRS10UENR6wBOy19TrfzWRh09czC4MVBRp5D1iVnpkHB4Yx6nA522edNMgzG8Tquaj3IJ31FBVK5hpEQ4Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598715; c=relaxed/simple;
	bh=muZkmDikvnD9dBLD7iXjnnAvZ7WQlo56r4OrDZaFUT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vq17D3gSOvbY1wftGskKkgh4KMfZDR4r3YNj9ivZO7jicBPxDvUBUA7IHJaF1H7Mdw3cDKrWLZEJKidCETCCx7TY3gDMTa6gPjyJwtZJGqhegE2Gh7wQBr4989WRwC97TFPJfVLJFPeRYkFBpVk1VxCd8NG+QX2hKXUhexLgnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IlKXJ8O8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ol0AYiuF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IlKXJ8O8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ol0AYiuF"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gwtv513Q4zMlJQ;
	Thu, 09 Jul 2026 14:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783598705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AcY8QgweKLiBVDOnw6F+6hZqsXJXttqIYxLZLP5NrqI=;
	b=IlKXJ8O8TZs2GSwTHvqbZUC8TVP5ivAx82yo7DCcvHIBRnzEQiCUiqxNc4mOCBBwtdUhPV
	ID6R7R3X2i/8hT7H1pCTEJfPWexqXttahShT9TE9xZ7LtLius7OJ/sdHWw6UP5sggrJFym
	m4KWWM66wQ3TAAMKvMWtlx1ucZjMuDeRAZhHx0wp4G8AxzhEBISfZjNfEC8kCvHqaJr7b8
	koGnDd4Hkw9M6nelL2L9AvR/ki1abFrFW/bOgNlAyWjkFsIwiN+W7Rs0c9hXSdy/dQO79x
	2B2aPKU55tRpR7SsGM6ukGqrtKYx5bT/PN30RQx7+BRNDnUjzqnz8pEUKzO6gw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783598703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AcY8QgweKLiBVDOnw6F+6hZqsXJXttqIYxLZLP5NrqI=;
	b=ol0AYiuF3RQ4xacAWb7XHO4YCNSqu1LyBYHuGP43eYqn/FJ6wbmvp4/A36SLvKO2aQeqis
	wg8HA+rQka+0AxgxDlcE+zY4Q/4ZR+noZiCVugQB627UuaRqqHkVRMG0/isBrV4mIcUeSv
	Jsz7kST0iXRWE4AkU/6dBPx42XSE6OCwlXIN8vouaWr0A3GQMDdFLNzhSI2WEifJa8UCVb
	+qT9y8qvxVHvVuLiJcWdpbzWcR7T2IFTq2N7E3bzH7I/BYFtduDU/USSvMt2hT2Cpc2hNq
	G/xniTVhYUcsJrquUiMaTKhLT0K7Me+Qpu4EA6K1UvpWQZF4GHMziCBv3yBDIw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Docs: list: Fix bracket
Date: Thu,  9 Jul 2026 13:50:09 +0200
Message-ID: <20260709115008.387869-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c4f902cae9bff6754f3
X-MBO-RS-META: emxc3zgq88q84w4y5sdsqmc4dhzmesgf

Add missing ')' to sentence.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/list.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 479aa91cc395..df8b078bb366 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -458,7 +458,7 @@ The list_move() and list_move_tail() functions can be used to move an entry
 from one list to another, to either the start or end respectively.
 
 In the following example, we'll assume we start with two lists ("clowns" and
-"sidewalk" in the following initial state "State 0"::
+"sidewalk") in the following initial state "State 0"::
 
          .----------------------------------------------------------------.
          v                                                                |
-- 
2.54.0

