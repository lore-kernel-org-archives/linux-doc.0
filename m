Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092541;
	b=hVGDDiGFIIIU/RNuIrJVyVwHZXnUk1syyW2T/q4wzHNtVx+lAbYUc0pDesnr0NuQ6aLg
	 J9zXZzzwa7kUmAY92um/+uwNSI+xWf1edRZzicXbEYs/KQy0Ndsb+HZGdzURZDtj7BIu6
	 nbj837QriCim4lBXgE6iHJ+tK1PpHE9vFmIinF9b5BwqKS9+mcNvZk5tIcEPfEzDh5N/I
	 QEB6iM7QjyNO5VzUWClzM+skDdpjodxFtQdeNzwrRbrVx+zCDOXp5YN481YxHdqd4SaBZ
	 v7KjZ/VKyx6xCVo3A46Hp4G1M72IT6GxzMr9lvbto9/qQgl6U2lp7+KrJbh6lzY1AFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092541;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0hFouMqOeYyeKhZ85sDPfJfrYfZA6d+gJ4WrPszogio=;
	b=1DBoDGK6bWPMUaLWfBAKkk00epa6f3T8ABqfelU3XtIr0OS2+wL4PUIkA7viTJEcrZpH
	 mMvGmBeknNPmj6uDxr2KbIf1ENK3pSOWO53NbFjc2XmTNFre0h8DBBqlE8mcJHF00wUC/
	 00OkX+c2GICDoLBhjxujG9la1Xip1WsBMpMzSg+rWluCNphYJ1nGgjXpDvFGBVUAK15zJ
	 qoqweM+qNJbm9Hz+sUc9/j+VYbzGZqPVuxy6TcZZE3rYsEV59pf1MqknXzRKMj2M08VDi
	 or62yMlHDojlYUk3u86HVmibiSQ8c5S6uNQX0+6/aceJs9B4ovYINLAysqv+KVvW5IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rLfkYRN8;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15872606A326
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 23:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15872606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rLfkYRN8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794092538; x=1794351738;
	bh=0hFouMqOeYyeKhZ85sDPfJfrYfZA6d+gJ4WrPszogio=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rLfkYRN8PyktjxiGFlQTpKqHwO5BSUsrQZwNrMsFry+BGKSNNZq8FUToNoPLEjqMh
	 EswXEKS5BWT9MtZ8Bb79XWC46EkLGsnUlQ4no6H8aaEI7YnYDUplZkrJWhY0nSi8dD
	 Q9XWEgioUkRSX2r+doOYdOGJowkDUekYjchabW8Upevz4M5zb9pyOUlgXNfgqOxDHp
	 sVZhSwZJ8uS011IT3Rww6XdEpBaa/XBJDqgr0Y33gKSwsMSsD51fDqSqyODwssdemV
	 76Dh/22qm7ICEItfLz1urR6JlBwBlE6tjoZo/iXqrZbAd8wkkYNrp7G0JsdNH2LQCP
	 wk/ADzt5tB3RQ==
Date: Sat, 07 Nov 2026 23:02:14 +0000
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
From: Mauro Codella <mauro.codella@pm.me>
Cc: joe@perches.com, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: checkpatch: Fix DEVICE_ATTR_WO macro name
Message-ID: <20261107230208.326769-1-mauro.codella@pm.me>
Feedback-ID: 135342123:user:proton
X-Pm-Message-ID: b9297a89896b6ad5ddd8eb990ad47380ae37be5e
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The DEVICE_ATTR_WO section refers to DEVICE_AATR_WO, which does not
exist. Correct the spelling to match the macro in include/linux/device.h.

Signed-off-by: Mauro Codella <mauro.codella@pm.me>
---
AI assistance: Codex identified the typo and drafted the fix and commit
message. I reviewed the change and ran checkpatch.

 Documentation/dev-tools/checkpatch.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-too=
ls/checkpatch.rst
index 6139a08c3..f8ab22c18 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -389,7 +389,7 @@ API usage
     See: https://www.kernel.org/doc/html/latest/driver-api/driver-model/de=
vice.html#attributes
=20
   **DEVICE_ATTR_WO**
-    The DEVICE_AATR_WO(name) helper macro can be used instead of
+    The DEVICE_ATTR_WO(name) helper macro can be used instead of
     DEVICE_ATTR(name, 0200, NULL, name_store);
=20
     Note that the macro automatically appends _store to the
--=20
2.56.0


