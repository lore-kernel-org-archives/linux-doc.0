Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627444;
	b=QVEeJyF8JIdmdaAcYtR3KZKu5LV7mP3R5SdcQly2XA1qGBDVRXgPrCfvIRFEIs4jClq7
	 XpWGa+ElPU8t/saVaChYZxZbS5rguq4xQI0vkqUGHkKDdIA6G9O3CILtIHxZuB2Ry2Oyc
	 m3FPlMw/5NAFKFMr3I8qvqCQrX/F7bGiA1TH4tPyfU7NwwAKNMTkGPaKJyV8lVzUjn8bR
	 tdf9fakTo8D8sdweQdN9lK9pL7SPfuwEgZBtUFAT2UmdTuKNMIJ00DNT+BbQUP+VS8qBE
	 MGgyYZOSkkN9BtYCMz4VYFJw6VdmeDt2JxnA9COI/u/UL3edqN5l+yOG+6Xbvnl8UHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627444;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=jieMa2fraTcOYDYDLgO9cBb4xo36Ny1alLUi6/g1gVY=;
	b=hfK6+9tg1zOPrH+85l4moiitMFeYwaSqe/wk9rzixF84Wml35fK35vdtbxbkEjKcca57
	 I0UpvnD2gEmr4ZXEt4Z1PCx6SBsEXoyjidOjYOTYTAhkq3yqnFMZfEhuWFCU/f9BA7bDX
	 ayEjJxjTd3ayggF5WtoQ2K2BB7TCqf5OIxayh1R63utoD8C81fvQg/TlA5FlC1K9cSO6P
	 L7nG5y1/KsvOqaQB2G5z9eYxweDbZpC5aH9i90wcSDgoOtqTkkULUKxB7txlwT+bpZHRH
	 2ZajRA1KqEb+WG+H+0zQToBza/433Z7z5E5UyarLxZXvilGMQ1WkEqQTd8qIbbMhA/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=xYwuhHYz;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C8606A333;
	Wed, 25 Nov 2026 17:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=xYwuhHYz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jZRNp0yFszKm4N;
	Wed, 25 Nov 2026 18:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795627434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jieMa2fraTcOYDYDLgO9cBb4xo36Ny1alLUi6/g1gVY=;
	b=xYwuhHYz5rupXpTUhbROiKXFAtBaoSZUIdKG5wLWNDU8dHzBjaJPXq9Bqt4y4zmHkcnGTp
	k38OE3yyacByahpsS2G0vA1ShHBl7fpqArmrF2qjDq0A+NxakthHdXdcLWT/ahSBZOeq4R
	jc9fdO9Mv0fp45A81VsALhpQy/o8ltvKc+o7IoM58Sn54Ian+ZBAv5xq5wTzVBHN89cGy4
	e6izpdimZT9vr4xiQTiKUris5nHmjCZ3FYyurj7l1VmlRKRIAzmV6tlv/h57xAIpbrEfKz
	CF86SENSrXtaGUWfizzrn8MRc5ucjqkmhxUcN2Kg5IaI/weleec2SPaoHXLigQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] docs: doc-guide: add hint to review patch
Date: Wed, 25 Nov 2026 18:23:44 +0100
Message-ID: <20261125172345.1617191-1-manuelebnerli@mailbox.org>
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
X-MBO-RS-ID: d1db9e0225236a95841
X-MBO-RS-META: h1c7d34dd6rubnhpaw47a45k75ee1t6m

For the case of a duplicate patch, review the other patch instead of
sending own patch.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
[v3]
 I accidentally built [v2] on top of [v1]. Merge both into [v3]
 shorten sentence (Jonathan Corbet)

[v2]
 https://lore.kernel.org/all/20261119055403.1294471-2-manuelebnerli@mailbox.org/
 'send review' -> 'review and send reviewed tag' (Jonathan Corbet)
 'applied ' +'to next'

[v1]
 https://lore.kernel.org/all/20261116082209.1100175-2-manuelebnerli@mailbox.org/
---
 Documentation/doc-guide/contributing.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
index f8047e6331..55bec0dc2d 100644
--- a/Documentation/doc-guide/contributing.rst
+++ b/Documentation/doc-guide/contributing.rst
@@ -128,7 +128,9 @@ looked like this::
 The entire process only took a few minutes.  Of course, I then found that
 somebody else had fixed it in a separate tree, highlighting another lesson:
 always check linux-next to see if a problem has been fixed before you dig
-into it.
+into it.  If the other patch hasn't been applied to linux-next yet it's good
+to review it.  This helps getting the patch applied, so your effort is not
+in vain after all.
 
 Other fixes will take longer, especially those relating to structure
 members or function parameters that lack documentation.  In such cases, it
-- 
2.56.0

