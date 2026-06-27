Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B645B40D56D;
	Sat, 27 Jun 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782552366; cv=none; b=NAWZ0Ehw1kh8496DgDSaomoKkWSnJxz2+xeqhWd6FsfUyqsmaUoR1ASwglnQ3wiUvu7P7RMyE20X5F92rzSVyai5hX7u4+TwkJOtxzd+8IRe6/8zjmaZK7YYkA4ErSofUeo6n73cRGTlEgAIvxUfva8Y5l53mNxhJj/c0uIUXD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782552366; c=relaxed/simple;
	bh=6d9/KnAgtOymLHBTppYgYT09cVyfgqNKHLpjBOcktEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRC4gF70N10J3kpSdHjyPzlS75U7DeyZ23llHbF5GHtVMxAExSkpnwjIoXnDriymXRtdt3Ub0h27C4v8aKqBuN/miA1VYHXf2DkF+JS5UrKjTa1kC5OAx3BqHhaABT5yRBbab85dWUSrUekLw5G4r9iGK/+nDBDJ33iDx0otbVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uJRjJ6qT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ofa3rOgh; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uJRjJ6qT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ofa3rOgh"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gnRx104Wfz9sbf;
	Sat, 27 Jun 2026 11:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=huwj658y+0lST56S2QLTZEs/tSbFD/6igDv+cH5caLA=;
	b=uJRjJ6qTA5eUDeLqZgB5ThOXa6/QdRhKpKZHja/TSlBwbZAQ+59dOpmzDHvnQnPHL+3qUP
	nAfUH1CN/unsdG3Wq0u1KZZcCai9riaAhshBVWkL4ecf+iChpr46v9tjTk+XXO1g4qux9D
	AV6btM8uOLZ4uOkaJeFGLm+Acp9VW4+ZVv3JxsnutMMcOTFiGDqXqGUYilOvLtXE6z++7H
	8WC8c1VfQgG/ZSdypaZkPJAFXfiqAinK5xKc+brT+xdQq3asuBXjVDDSMikcpBkSubqvHi
	63NgQQxpSMad/ZKldGp2Fs7i5Io+3PqGhJKgQB77RA6GsiY8PkQRnAbCaO/btg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=huwj658y+0lST56S2QLTZEs/tSbFD/6igDv+cH5caLA=;
	b=Ofa3rOghLUuylScM1yHMFeuo0obYmru4CVN4ES61/jFPDuq7ooDvZYenAmYiaJ2eHGEWc4
	T7I+yUhxCZfuoknas667akxLpazHLC/iVsNoi4Grq2MgFdTIiHw2yim54RFQXRW4jKGTeg
	oFmBOnqqhtbo0qt0czBKdAAngxnFYEWd20G1vn9stB8sN+EIn8AJ03zVFUKg31dfZHUXKP
	s2Y9wMP9wOJAOLbLqUWsdxGmuCdQj39KS1Eb31AG014rEmTLxn3MeqZqfFhGfIbnaaoLBH
	f0xWO3KSUvobWoPNHM2SQhp7IZWOuS1csl59MpRHVj66/sYCiY9B0zI+/UnMew==
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andreas Faerber <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: parport-lowlevel: Fix curly bracket
Date: Sat, 27 Jun 2026 11:24:00 +0200
Message-ID: <20260627092359.30044-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bct8kj3xjoo5igabb6dnd88oxgzxazz9
X-MBO-RS-ID: 9082b7b8b23da4b51a9

Remove needless '}'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/driver-api/parport-lowlevel.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
index a907e279f509..af73741289c9 100644
--- a/Documentation/driver-api/parport-lowlevel.rst
+++ b/Documentation/driver-api/parport-lowlevel.rst
@@ -341,7 +341,6 @@ EXAMPLE
 			/* Try to detect a device on the port... */
 			...
 		}
-		}
 
 		...
 	}
-- 
2.54.0

