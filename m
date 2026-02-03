Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B33EBF36;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=jyj0dMi3DzTvzLTV7kty9YeZGdCyI4zCZ/VFH6tqmre2Me86rf6JYtGbO3Uk7Kk2YBTLFZsOCnG9DxLozLkl9gfA4BfwOjhVFK9BqkJrHr7rOTw+RiZG4CEUFbXC8SBxHY6Ri/9foxmgFN6sSO9nzGaC/PXhrC49sU3nSGJIW14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=6TUEdCCxf08mni1+KzD0z773NWtkiX5r/4OgHtBbpcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EVtFaDeRcT9N0o/ywQ++iRIYd2JMEHdC8JRuKUfYoWFPgOF6No0so4RAbxU+7dl61HMcw+yOKtAvyS3hQDtoEsHy3TEXHBkrkLiVmt6rwUdMO9h2gaL4SSP7WV9VxEzEFt6Grr6K/GnQoWG1mwa+Gi6ao4iwGk4qGaKFnrTLMdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/bQSeNP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/bQSeNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5F0C19425;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=6TUEdCCxf08mni1+KzD0z773NWtkiX5r/4OgHtBbpcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f/bQSeNPKVBnGLOf+itkb2gDEcFCKRHYs+aiw6PiKdgLt4o71F3N5tr76bcNpMNPN
	 3vEZBdVFIiC6PHGZcagl86QcjVryyX2m7oRKDzOdGu4IQGVRtiOVRJ4kGIkE4tj38i
	 uERQ7br/KO6UvRtiQF/ENIbwhf3JuFSxAiYF9V4+XdhXpggJKNy1TQ6iMN/CCnzJyp
	 z9iAaF3+G55eaCwhBxjMtagO585LYHdTr/VVOir1IqdnboQCw61cFSbWdARZodtZxv
	 OakLzPCrEByihX5r/4YtYMMvI66sM55GXqM6qiwZT8QK/FMD+LkS0TWJl61Gi1jRsa
	 pLajFLtzStm2g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027UC-3Vdm;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 02/15] unittests: rename kdoc_xforms.py
Date: Tue,  3 Feb 2026 15:55:30 +0100
Message-ID: <3ebef224a92a4661e187130763b8bd4096054056.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Let's start all tests with "tests_", as this makes easer to have
an unique runner for all tests.
So:

	tools/unittests/kdoc_xforms.py -> tools/unittests/test_kdoc_xforms.py

No changes at the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/{kdoc_xforms.py => test_kdoc_xforms.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tools/unittests/{kdoc_xforms.py => test_kdoc_xforms.py} (100%)

diff --git a/tools/unittests/kdoc_xforms.py b/tools/unittests/test_kdoc_xforms.py
similarity index 100%
rename from tools/unittests/kdoc_xforms.py
rename to tools/unittests/test_kdoc_xforms.py
-- 
2.52.0

