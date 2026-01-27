Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C01F63CD;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501022; cv=none; b=FQLLth40HPo3ftHw9Ux1rCs++eO/MI6M8FmJz5NuUJhd6a84s/JORHiXDf5jycoSfQBShJxGqj1wgvBwi6eKuzRsyb4jdWEabLxb8AYJqBCp/UR0Xyrr3TAUIc/o/swcLwehmAixyKztPz4d3rwoiB+cefixwSNUwAuQnj+XV4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501022; c=relaxed/simple;
	bh=zldLuEGU7psfosdWf0whtn/GNPYypL64u/VHjFGFbtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xqv79q2YbGeGXo5GNx2GzQFDCyPe0C/msSXSLVH/uAUfTWVOHh0hS1qduoURAIykwofrGXE1mVjknxstJgzI3/RIvRxF+Tu+J54TpnzutayW61QiCXNvLruHXkZEK0bio3pTeMag6RbWKMknc5lJBMco1y3kXXUO0f8bKzqw5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlLhP2wy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlLhP2wy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E92C16AAE;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769501022;
	bh=zldLuEGU7psfosdWf0whtn/GNPYypL64u/VHjFGFbtk=;
	h=From:To:Cc:Subject:Date:From;
	b=GlLhP2wy7Ai30N1cpA91Nft9VINM5N48XSlwX78qvNj1KM02295Y4wTR50tMnq3We
	 Ypr6AHOVPTVk5izM8nvz64Tc+vzShWLPtWAbcBTX5Vx8cx8fV3DcrVA2R6kecxQfEY
	 Xf+QE1J/RoC9XLYpTJorVYC6Jr4/q7ip8pAECaaWXrCiOolVWLrpzEiQTZ3ZddFj3E
	 l27COFq6sesNt4j511hEfWptwIUeHC8RhmYgQ/Z2ay/EJK9vlWCzDNCJ8zzc4CfhCp
	 GvYI/5nmRQFw1MU0KVbP6jfGs8oGguCAj0AaaabeCrAFpLTmjxyDOySeB2Dj55VRX5
	 d1eSL84fchEkw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vke32-0000000BNM5-24e9;
	Tue, 27 Jan 2026 09:03:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/3] Some kernel-doc fixes
Date: Tue, 27 Jan 2026 09:03:31 +0100
Message-ID: <cover.1769500383.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This small series contain 3 patches:
- patch 1 fixes PDF docs build, as reported by Akira;
  (I'm resending this one as-is from its v2)
- patch 2 addresses a complain from Jani about not being able
  of disabling "-q" flag when building docs with V=0;
- patch 3 addresses an issue indirectly reported by Jani that
  it the env vars that affects the wrapper aren't documented.

With regards to patch 2, docs build honours V=0 by adding a
"-q" flag.

When V=1 is set, there are two effects in place:

1. sphix-build will be called without "-q";
2. Sphinx extensions will increase their verbosity levels.

Sometimes, it is desired to just remove "-q" without increasing
extensions verbosity. That's what patch 2 does.

IMO, at least patch 1 should be merged during Kernel v6.21
development cycle.

Mauro Carvalho Chehab (3):
  docs: kdoc: Fix pdfdocs build for tools
  docs: sphinx-build-wrapper: allow -v override -q
  tools: sphinx-build-wrapper: improve its help message

 tools/docs/sphinx-build-wrapper  | 42 +++++++++++++++++++++++++++-----
 tools/lib/python/kdoc/kdoc_re.py | 10 +++++---
 2 files changed, 43 insertions(+), 9 deletions(-)

-- 
2.52.0

