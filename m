Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E098B3E47B;
	Thu,  9 Jul 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589377; cv=none; b=AFnSGUGoqfIgoWn0Y7JJ3cZTBiMqi2O1IYAtmD5wWb6vdO/hRt3Xrzgdym0RkhGr0LyoNzHgosVsKD26cJcbWzBv2efhs2ohkclFnC8teeDY7dDZN/UgJ343I88olPscgLnnx4PYIoafHvDzfIYhoLSksEa6RCzWfEHOiuH6k/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589377; c=relaxed/simple;
	bh=OW1FFR7/d3swW000cxuVwZz1pzLHLwgeDEXJUYZvR40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAWprMLLof3XRgNlJxGbM6a/mAFGxfiV7SwyFNZj2IyJOn302nQ+UUeZde6Lj2S+FVXjxveboGLv3UMsfiQAoYBctREFQaYpskug8Dqa+HeCHVQo466019AXxkUVhr2zB92v5ykfGO7XtoUkddEbddkP8E9k22L8QLaNd7zATJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m4EL8QNL; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nCuhx+IQ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m4EL8QNL";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nCuhx+IQ"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gwqRX3YC2zKnDQ;
	Thu, 09 Jul 2026 11:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783589368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MPqKsE3vrjg5Cni2ih7Mz6hed+EmMzR60oeIPkrTaTk=;
	b=m4EL8QNLD4GKW4D3wgbbhcKTVdir9Vtmn2Q+Qbpks0AKVyZs6uuETXcK8DtIyUZ94o4AQr
	AMBAGBYFNigmKI3DnMI68xEnhX7Qc9QHwduXxA7ib8Q4RJiYtoybXQcXtXaQmZw8jeZOot
	RDNyZNh8CtWVdbAe/u+96tyPfBi045RHmYl0blUPs6dFee0ocxYhZnDOeuT0N3blag3ILt
	u1seIbqYXfXqznjLJMCU9nG4Bjw8surw3bMgykvsDRNtVzc1fmUj9aZmVeMJ5w4acLPC99
	qu4RqavMik2nbwdlC2Q/ptLe/v7tT125Nh5pBdAjXCjYmTJe/8/OguvcwVJ0XA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783589366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MPqKsE3vrjg5Cni2ih7Mz6hed+EmMzR60oeIPkrTaTk=;
	b=nCuhx+IQOrS9P7hKRk/8bwnnqsAzFc5KMKHcG/MTGPou+X89LZf1xiTSIQs63t1smVX+bX
	Jd+FjXDZdA4llsajLo0vdNBTV00F/wdGQDFxKUwNr5neYGnwXRO1o0ELy4ZZbcopcu/jVN
	aiwIAxKSEPgEeSOnyKybY0NUzd3ObgyU2aK83PWgAyglx3HjO3EHbsOqfGtesDF2/C7Psi
	OlqfCNVl7j9abPaod6wWx41rgUc8WcxtIJONiMVsPdgW7txFw4H8XpNyPmaZSMPeedVn4u
	WKM2dIP9c+y8sc++jBca0pd6jDLASlctnYz4/17Kc9uN/cRS6JCXTxLXc4K+6g==
To: Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] errseq: add missing bracket
Date: Thu,  9 Jul 2026 11:28:59 +0200
Message-ID: <20260709092900.380694-1-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5493skuyzbui4hobtbo3sujmc8ch4tou
X-MBO-RS-ID: ad95e304c2e767a33e5

Add missing ')' to nested functions of code block.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/errseq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/errseq.rst b/Documentation/core-api/errseq.rst
index ff332e272405..d298d4cd2f60 100644
--- a/Documentation/core-api/errseq.rst
+++ b/Documentation/core-api/errseq.rst
@@ -143,7 +143,7 @@ Because of this, it's often advantageous to first do an errseq_check to
 see if anything has changed, and only later do an
 errseq_check_and_advance after taking the lock. e.g.::
 
-        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err)) {
+        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err))) {
                 /* su.s_wd_err is protected by s_wd_err_lock */
                 spin_lock(&su.s_wd_err_lock);
                 err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);
-- 
2.54.0

