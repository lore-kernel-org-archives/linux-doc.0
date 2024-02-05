Received: from davidv.dev (mail.davidv.dev [78.46.233.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51832C8C
	for <linux-doc@vger.kernel.org>; Mon,  5 Feb 2024 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.233.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707148735; cv=none; b=A6ja4K0uVgKniSPbzyHGvtUxS9GU4x6WGppH+Rb7JGa28hiT9rYjBQUJUpNk+/ogtNfWJdn1RoWU1Az0LN8fe+KsHqIuJRrDjU/T9RVEED4nux1AF8F8eFD6JzUktb0s+8ldx1jg7XJOygwA8a5O6jazdRLuVsqhJ7lUfG4gTDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707148735; c=relaxed/simple;
	bh=Pppg7VSwpwIuek6Wg6dxlq5yApM3fhfhfp70mFwuCPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XhzsV3W1rQDE0bjz7M4bnGmVa5Zm6XmPO1R+Fd976idB9VaZhGEYcQ4zjWyOqvGgOy0+U7iZ6xUatsLoTer1fdvfsLQUVWfq48hVt0v/Mg+JumtvL/hw47JElYeV/O6i0YmciTxj2KZnZABn7IttSUeZ+qNSGSqqu9LrOwFmBxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidv.dev; spf=pass smtp.mailfrom=davidv.dev; arc=none smtp.client-ip=78.46.233.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidv.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidv.dev
Received: from framework.labs
	by mail.davidv.dev (chasquid) with ESMTPSA
	tls TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
	(over submission+TLS, TLS-1.2, envelope from "david@davidv.dev")
	; Mon, 05 Feb 2024 16:58:51 +0100
From: David Ventura <david@davidv.dev>
To: david@davidv.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Xiongwei Song <xiongwei.song@windriver.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] net: Change default delay on IP autoconfig to 0ms
Date: Mon,  5 Feb 2024 16:55:43 +0100
Message-Id: <20240205155717.484198-1-david@davidv.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <580001e3-17ef-4f24-8fd8-bc14110e874e@lunn.ch>
References: <580001e3-17ef-4f24-8fd8-bc14110e874e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As suggested, I'm updating the default to 0ms. 

This patch depends on 1f0aa0c947eeb4edb60add141a5bc2309f2dc8dd ("
net: make driver settling time configurable").

Signed-off-by: David Ventura <david@davidv.dev>
---
 Documentation/admin-guide/nfs/nfsroot.rst | 2 +-
 net/ipv4/ipconfig.c                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/nfs/nfsroot.rst b/Documentation/admin-guide/nfs/nfsroot.rst
index f26f7a342af6..fce610a4ec54 100644
--- a/Documentation/admin-guide/nfs/nfsroot.rst
+++ b/Documentation/admin-guide/nfs/nfsroot.rst
@@ -225,7 +225,7 @@ ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns
 
 ip.dev_wait_ms=<value>
   Set the number of milliseconds to delay after opening the network device
-  which will be autoconfigured. Defaults to 10 milliseconds.
+  which will be autoconfigured. Defaults to 0 milliseconds.
 
 nfsrootdebug
   This parameter enables debugging messages to appear in the kernel
diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index cbf35163b973..8b7d08649b09 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -99,7 +99,7 @@
 
 /* Wait for carrier timeout default in seconds */
 static unsigned int carrier_timeout = 120;
-static unsigned int dev_wait_ms = 10;
+static unsigned int dev_wait_ms = 0;
 
 /*
  * Public IP configuration
-- 
2.39.2

