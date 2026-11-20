Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197380;
	b=0wRFhQI5Vc8tvVoS9354Dcu+eyBd8QsN4iDkOY3LGCGPLC5E9Dg2FXmSE1NOqmJgvivC
	 lL2BLInVhz7uxlrc/If15cYlwp3TLZ5JU/QaPNAK4/TOZSyi0JWCpTKZnUxfCn+AFpnBu
	 HOjc8xKS1L3SsSfZ/00OJD7eQDOi+ugNd28dwniOYZqsyouN5Zs8cSrRjGtLB1lN7PU7U
	 bLfNcItVkj881pVuuVw6b03JkxU+87AscsWdMN/2+F8sRzzo/sYewOHrp3yuvgHA9UrBw
	 wFwzmC2NUVTeIKaWCb4kLXKIKRcdYUA/U42T3DNMso6o4CofIw2yys7Dtn6EXvfRApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197380;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=MumwmMlz/ycOY2rwiIV/TfXn6r1Kli3xnRKcL14uXZw=;
	b=z62QSmGrXPvvsvkvcbRx+7HE38Qebd2j/anGoj/F3IdFHJfpiUR3JIiVc3ZH0UOHNR+Y
	 opKVFmPTXVa3quAQFpfkV2XUkvRFVZLm0B6TlbnqOrq+QOSrjG+Z5fFeigR93S30WoTYy
	 yFtLqW+nfX5FpA1240DuNwBPuYfXL8oC9TEvTFuNjKE75FDVXEbzrsVGsTdGRSsPgtz6+
	 fhD6pRWa6Z/OMUqbbr0d1eAoTkChYOHtNeCR5CO4VNCJDFt9n9BbkjJ6FHtLwg6KGrq10
	 QmcuMymxL99gVfsAuv0EmBf1Ac2PtuvxVB9Ijs4BCJpaAHostmySe9SWQSuv0qmFEXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=csSR+LuY;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29777606A806;
	Fri, 20 Nov 2026 17:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29777606A806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=csSR+LuY
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jWNLQ6gSCz8vRp;
	Fri, 20 Nov 2026 18:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795197374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MumwmMlz/ycOY2rwiIV/TfXn6r1Kli3xnRKcL14uXZw=;
	b=csSR+LuYSK5l1G5b9hx8zrzBFhbqYELUpyuZRFDEYRfu69tadAP917oKWnPe66odFOl9Vg
	YrN8f3cz7g5XD092IbZ9FJvOV/PhZOfjBTIdiMCNSvuVt7SnSAjtH5XZekLavEhfFtXgyd
	m8DA5VqkvyIHf7lm0itS1WA/MHkuIbiIQ6C/3IJKnMBPXD/TBzZGkESiKTRnWCSLDEsSyO
	/51MvPlFF3nvOIM3CN1jmTzRfqyBUReZEzBABllwFZg1YkOBZ4tDbZvvzGR7GHWYeZfQLy
	5qDa+IZjKskDKszUNeF4Juxc7VfT2uv8lBiOeo3y8/yXz/ooWIKIK2m/t0nvSA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	linux-um@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: UML: user_mode_linux_howto_v2: Fix bracket
Date: Fri, 20 Nov 2026 18:55:09 +0100
Message-ID: <20261120175509.1369714-2-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: ea02f5196a9d0790d6d
X-MBO-RS-META: 594ua1nrxhfo8sfmwnxhfdtgipnfdeam

Add missing ')'.

CC: Renzo Davoli <renzo@cs.unibo.it>
Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v2]
 Correct position of closing bracket (Randy Dunlap)

[v1]
 https://lore.kernel.org/all/20260909140051.1365758-2-manuelebnerli@mailbox.org/
---
 Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index 9224bea5ee..e4b1cb1092 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -581,7 +581,7 @@ https://github.com/virtualsquare/sshlirp
 
 connect to a local area cloud (all the UML nodes using the same
 multicast address running on hosts in the same multicast domain (LAN)
-will be automagically connected together to a virtual LAN.
+will be automagically connected together to a virtual LAN.)
 
 ***********
 Running UML
-- 
2.56.0

