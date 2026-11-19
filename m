Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068379;
	b=2wH5usxp+ZAgTi9GkhzpcYUBFdSLca9ldfz9G9c2AcNCe11j5r8OqqC6hyTUh0yxCfLR
	 A8LFES7bXQcRpsBkJRjfxRHwo2BVOKADoADzZO30Y7nF947uVnWhYF8blaJ1ZRDI4oJOU
	 Fsb7v537zzKyle0a6RZTL63tadsKkck2/oEB+uoH/Lt8Eqo40OGfFX+NkA19Xo4LXPFAf
	 ealFFhOcWxbozeo8rRt0hNlf9ZgK4Y3PLFkQrFolLCNCjeSGofw0Lv19H6fmStpbl6h9F
	 Gep8zcoFYaSekKSILXRRDsOrKdruH2cyBMSFt/wfFeQl+HAgz/y6hFvZQU3r/kSyCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068379;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=dW+VUg9v/e5geYFGw2JxdiEx+wEvGmgCJzKLLn8Gwys=;
	b=rVli0PjPXtdOXAWwVIolysIHV5wcnpW3qAcfaMsSXlhBZpqE3Z4LrZl7HcuESNNtPV6r
	 3z3doCF19mmijAt5MOrlikgVQa7cB0FI59jcWFTfXADvdrGlunEO3KuZ0agKP4FWDe7OJ
	 YbwMPCLeAKYL9qzhzHMAcYyS/gRmzhsg8QVFL7tll6QMLQNZPh1r1tYSQ50wMeLXMF14u
	 9am2HjDR2HIuOU+z8QZRX60AdBkxbCNJfrIRAOMEZ4OFxWHPDOMAKRrPGpsKCCQPYIBb6
	 zfPJUgEdrP2B7EhBLr95hk0wJ/qBYhJTjqsxM/AU0OcTHnWMFZZYS/R8zqoCy4ftInw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Hav5w7Mu;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C729606A320;
	Thu, 19 Nov 2026 06:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C729606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Hav5w7Mu
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jVSdf2F3jzKp2p;
	Thu, 19 Nov 2026 07:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795068374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dW+VUg9v/e5geYFGw2JxdiEx+wEvGmgCJzKLLn8Gwys=;
	b=Hav5w7Mu+HNRUIet3v6svKrVTDBZFt8i7a9Sl5z9EAJYvwhFshazS3ayp3/s8uqdpNSjnJ
	YengwcJxTk2WZTX8CbX5msY7kmE+se6wiYu9AeBzhSPwHR2iyE/1A2fs+Llzmrp6keblC9
	bYQeDOyWs9miAZu9C2ezNKpUbjPp7im+N7byCLUp9qgkO3RzyC1CN5F1QJ92jt2tUSpTo8
	h6uwhvyqQuQPrQCTu7mQpBgyuCcDn0vEhJ/6JcRo4YgSBPdrA8Z+iNEqm/wpupVZvuBn6F
	BLytbzHKo0Ay0I0U6TuBH2QVi6eEhBS1Icdju6fK0eRl5LPxhQS6xbxci1NuVg==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: doc-guide: add hint to review patch
Date: Thu, 19 Nov 2026 06:54:03 +0100
Message-ID: <20261119055403.1294471-2-manuelebnerli@mailbox.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 64kajandain6ekyc8iqxk58rioa8qirn
X-MBO-RS-ID: e2ad8fd8cc69de20cae

For the case of a duplicate patch, review the other patch instead of
sending own patch.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
I was considering
>If the other patch hasn't been applied to _mainline_ yet it's good
>to review it and state that by replying with the 'Reviewed-by:' tag.
which is better?

[v2]
 'send review' -> 'review and send reviewed tag' (Jonathan Corbet)
 'applied ' +'to next'

[v1]
 https://lore.kernel.org/all/20261116082209.1100175-2-manuelebnerli@mailbox.org/
---
 Documentation/doc-guide/contributing.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
index ee2f896a21..3657408a5e 100644
--- a/Documentation/doc-guide/contributing.rst
+++ b/Documentation/doc-guide/contributing.rst
@@ -129,9 +129,9 @@ looked like this::
 The entire process only took a few minutes.  Of course, I then found that
 somebody else had fixed it in a separate tree, highlighting another lesson:
 always check linux-next to see if a problem has been fixed before you dig
-into it.  If the other patch isn't applied yet it's good to give it a
-'Reviewed-by:' tag to help it get applied.  This way your effort is not in
-vain.
+into it.  If the other patch hasn't been applied to linux-next yet it's good
+to review it and state that by replying with the 'Reviewed-by:' tag.  This
+helps getting the patch applied, so your effort is not in vain after all.
 
 Other fixes will take longer, especially those relating to structure
 members or function parameters that lack documentation.  In such cases, it
-- 
2.56.0

