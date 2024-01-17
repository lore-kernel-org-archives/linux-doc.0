Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCB721A18
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705511153; cv=none; b=ppgDMfn4swkg8ISrvjQPUduuSvr5pcndeJ9Kac9+vKYwd4/PTqeRRAPXlzNSPggwdKXqFSeqk2eY7y3fx3XdxEGY8zHy5qDcZ/HmrqcQi84Ziblrp8lLw/nvTFy9qSA8uWRsDU9CNefV22iQe9zldBkMrzoNL+HPVHoduO4SM88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705511153; c=relaxed/simple;
	bh=onwDEt0yoqBD4h85cWoG8LPuSWu/GGek4oAZEFlkUL0=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=TWl3DZWiwzqrbmCxJv0s+fS85rBG0XpXZAcjAI7/lPSZ9SqvTeB7WA0/sc1UaC9+ybHoujvmGkQKTUlLIsCvSP5pFMs9rq3lpNkNL+5JzuNB/Zky3HNLWIsnwk6SM/1npxLIBchU6/NYjjSqbS/Ad9PA41Fttb8sl/y3C3hapkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC48811FB;
	Wed, 17 Jan 2024 09:06:36 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E70363F766;
	Wed, 17 Jan 2024 09:05:49 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] arm64: Fix silcon-errata.rst formatting
Date: Wed, 17 Jan 2024 17:05:45 +0000
Message-Id: <b6637654eda761e224f828a44a7bbc1eadf2ef88.1705511145.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the errant blank lines to make the desired empty row separators
around the Fujitsu and ASR entries in the main table, rather than them
being their own separate tables which then look odd in the HTML view.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index f47f63bcf67c..526da0d64f6d 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -225,11 +225,9 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Rockchip       | RK3588          | #3588001        | ROCKCHIP_ERRATUM_3588001    |
 +----------------+-----------------+-----------------+-----------------------------+
-
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
-
 +----------------+-----------------+-----------------+-----------------------------+
 | ASR            | ASR8601         | #8601001        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.39.2.101.g768bb238c484.dirty

