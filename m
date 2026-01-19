Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFC2FBE0A;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=EVz/UXJXUO77Jw+Oe7a9fJmsRwlv045yHSdFS0Y/bYM1DYrWkqzIHunijrjuY7X0FhYjo/t4+0ergrop0ORhBMBO3v/C8YnNow6M8DttAWicIAeROllZiB/fWqa2aKc4nOU4uMRjVlo81xjdvYRBdRU9gp6NIPPH0tMTMRtt/7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=6uS4eQG9ngB34Mkx8eLKHA6/k7ERydcb0HVTVQ6Jz0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6jgaZivQtmSuHfbzRqKbiNzxi6aSuwzBkvpg0SzHSMyCFGf4ALoPxyHMN9JrNPtYjc23DJMNCokc3Mx/BNTzo+Qx7U5GRwDp2PoxcoW7UfavO0L3w5UMf7RxdkFLhkcDqI8a2vH2jpkvQOiOZkkxzQVrZR0LOZQmCXLdFDIrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZG3re5R9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZG3re5R9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52950C32781;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=6uS4eQG9ngB34Mkx8eLKHA6/k7ERydcb0HVTVQ6Jz0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZG3re5R95+lkt/qNBGewr4f9dnG2u+CFq1LXLJWWiQ/UU/d9iygGnyZA68b/SoDZ/
	 v/N+LuKNo+iJUVHKpqlXiPuoFU6r2H22rnXIY4J2Diw6xKlDGR4I0ulOU2xCUvkz0f
	 zMQ64pUYkj6fYP5k0bT+Z3J7vpHmtzkbo1SmZOBERPypt9WFs+XAGTzuK4XYes1G2Q
	 Ah/6q2GPQRqYOaWE6iv4fZG8rV/E4wA/pu2v5hfUzXx0fdAWE5qbGkdfv13BVTHEEW
	 wID5eBU3fdM/qp2UbJBtzrLxqYHWtK3RH+mZpni/Y/GEzgpdo1uVcguMfU885yvmZK
	 yPPZFedrvkDvQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2e-2ZI9;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 20/25] docs: kabi: helpers: add helper for debug bits 7 and 8
Date: Mon, 19 Jan 2026 17:23:23 +0100
Message-ID: <60e99b9060396eac8621954d6b8a73af45df90fb.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The kabi logic supports 8 debug bits, but only 6 are currently
documented. Document the remaining ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/abi/helpers.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/lib/python/abi/helpers.py b/tools/lib/python/abi/helpers.py
index 639b23e4ca33..b8c8dfb1272e 100644
--- a/tools/lib/python/abi/helpers.py
+++ b/tools/lib/python/abi/helpers.py
@@ -35,4 +35,6 @@ DEBUG_HELP = """
 16 - enable debug for what to regex conversion
 32 - enable debug for symbol regex subgroups
 64 - enable debug for sysfs graph tree variable
+128 - enable debug of search groups
+256 - enable displaying refrence tree graphs for undefined symbols.
 """
-- 
2.52.0

