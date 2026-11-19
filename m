Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094083;
	b=eCIbLIPYTLQMpbtdYvNrFIP7ACohQrj4t9Iv4pbq4pCFdsWG99p0PIk9zxc7OWk8yg76
	 S8vjDhMGz/zg5KpPLHwa01gnMObY76CVJtVXZlBSzoeozy5L/djnCqEWX4Gb56A732wHl
	 6l8/Gq/VaNwC0WCv4PGjbUmK2CtKOKDJVOblIPaAA0Azn1vylD9EhrAUBZar8/XsRTLo/
	 3CjY11efVTbbBCa4WqyZZZHHJRNkL5JMC550ywsElDFv5MZQ0FhO686Nv6Eb939v38k5e
	 FfdWmhlwAs/1yNT1PYB80uWLJrwiUjAQQrpPs/tHQYm5iaYOm/oGZH4UzuZ4T90u/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094083;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n5XDCvZ4am8idKVeXJ01mIo7TxQTgRMTGoE+i7wroNk=;
	b=wxcMxNWUEp56NB4ukz7K3rOOoKvLZemSAV26H0dvwoFmdkXicC6OFzbA9x54YFnKIGDg
	 MGqIqUcHWYOs7EAi0+axTW84jNpiSMnAOYfleacfbN1b2JRJHE+HD7vU05CXMoFzW4OUu
	 xPky0wVIojvdzOa0Scj2iFfIrbuAyme1k0CFQUbNICLKWhqQp7aDMN4cwiMLvaifcuX/A
	 k3OZvsIC8HDkN7c8e4nl7tVmrhj8kH2OgwLfKjGMlrT+MI65VjgPZ/sREq1OFBhcNjXbi
	 dcWEffBmecVV/mUyfLlIcPjZOLFTa+Np3DUQ+L66EwZBSTbbNrU/uFkh1nQvtCb1A4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D2D606A320;
	Thu, 19 Nov 2026 13:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006D21F000C4;
	Thu, 19 Nov 2026 13:14:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Zijlstra <peterz@infradead.org>,
	Dan Carpenter <error27@gmail.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] cleanup: Suggest using IS_ERR_OR_NULL() in cleanup functions
Date: Thu, 19 Nov 2026 14:14:29 +0100
Message-ID: <d5054be790f6980107cca32cf1e71f1df08d2a24.1795093760.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Commit cd7eb8f83fcf258f ("mm/slab: make __free(kfree) accept error
pointers") already hardened the cleanup functions for kfree() and
kvfree().

Update the recommendation and example in the documentation, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/cleanup.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 1fb8058b897d4a84..9795fa1dbd35e87f 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -157,8 +157,8 @@
  * DEFINE_FREE(name, type, free):
  *	simple helper macro that defines the required wrapper for a __free()
  *	based cleanup function. @free is an expression using '_T' to access the
- *	variable. @free should typically include a NULL test before calling a
- *	function, see the example below.
+ *	variable. @free should typically include a NULL or IS_ERR_OR_NULL()
+ *      test before calling a function, see the example below.
  *
  * __free(name):
  *	variable attribute to add a scoped based cleanup to the variable.
@@ -175,7 +175,7 @@
  *
  * Ex.
  *
- * DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
+ * DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T))
  *
  * void *alloc_obj(...)
  * {
-- 
2.43.0

