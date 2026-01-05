Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7482FD697;
	Mon,  5 Jan 2026 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632330; cv=none; b=gX5wjjBJGrdXWorQa8ZXdx9GmHhn8zskE2aqSYFI6JZUT0RoC/+/0Fe0U6zivEh6mhgiWIqqPSyxNX66QJI0mW3t0PI4lnqxI4lgVSPO06KW20uiirAprSfeqTbN8L1f2C6uEk9vyDPSzWmURaHNIN3Hd5/peC5sGpP/9FK8T9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632330; c=relaxed/simple;
	bh=fx5hU4O4QRxBLang5mD6EyamP0RPBzh181UvkxPwN3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efnSsWwxbwFfHmylZLkRIXhSHctbKVDJDZ3MKjqb6Xx2rgucF6n39lZ8ZKV4wu4TQBUUQtPQ9MRb5aBGhji5+mLulgHVFghVC2yMhInSzHmVZHtSHS8bzI9nwo343I4j7GsF9J2XvtSSL6KKlWtNx5lC/ogLpz8QXVXh/x1V4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svrBcNYN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svrBcNYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2367C19421;
	Mon,  5 Jan 2026 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767632329;
	bh=fx5hU4O4QRxBLang5mD6EyamP0RPBzh181UvkxPwN3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=svrBcNYNOWwFsNOsZuHPbsSLKKggkG3B9iIlMNA0mv8rsCj/DdlNBKj8SMVRsg9yo
	 jwcc/xtvtmEogZ34qkeP3/spCawq8zMu5sVFjAXs5UG25LCW7lDMpJ0oczS+ItrJY5
	 zwJETKF0vuG9yPhjn9jDmtas+9mkk/cPdRarDLjFFGLsBflYfDFpk590OWg0YgAZkG
	 NWlFQtC7p1/qa86uOxuF2wRPenf7iZ1zuq2MKxUBmISN7MbBGwnu/OaVghj9JJtJ8L
	 M1Sn1VXyGh0ANtc2LaBCUj9j6OAVykRJ1iYNQJsojsJiiV7nPRs3sr+9Oh7dOIkjkT
	 1Ba7g+REDsqpA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Graf <graf@amazon.com>,
	Jason Miu <jasonmiu@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/6] kho/abi: luo: make generated documentation more coherent
Date: Mon,  5 Jan 2026 18:58:34 +0200
Message-ID: <20260105165839.285270-2-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105165839.285270-1-rppt@kernel.org>
References: <20260105165839.285270-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

LUO ABI description starts with "This header defines" which is fine in
the header but reads weird in the generated html documentation.

Update it to make the generated documentation coherent.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/kho/abi/luo.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index bb099c92e469..beb86847b544 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -8,10 +8,10 @@
 /**
  * DOC: Live Update Orchestrator ABI
  *
- * This header defines the stable Application Binary Interface used by the
- * Live Update Orchestrator to pass state from a pre-update kernel to a
- * post-update kernel. The ABI is built upon the Kexec HandOver framework
- * and uses a Flattened Device Tree to describe the preserved data.
+ * Live Update Orchestrator uses the stable Application Binary Interface
+ * defined below to pass state from a pre-update kernel to a post-update
+ * kernel. The ABI is built upon the Kexec HandOver framework and uses a
+ * Flattened Device Tree to describe the preserved data.
  *
  * This interface is a contract. Any modification to the FDT structure, node
  * properties, compatible strings, or the layout of the `__packed` serialization
-- 
2.51.0

