Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6603EBF20;
	Sat, 24 Jan 2026 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769233747; cv=none; b=szGIqZULAED0Qp+0lVlcL/e77LseTsACajdSEKo33BYf0+/lux2TElBhzY8AfcgKhKFnialKzr1Eso5cDaIieo3jQrswmSIIGK075fcCImI6BW9/dne607rZvwl5WSpzqY2nY9sx7LhpEOSE1cxiv0VC4qntkToD1PN90O1N2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769233747; c=relaxed/simple;
	bh=uKaFqd9iaOY/kQ4XE1EMq4WRMG0e9Da/8HBH36KVzyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nDewV2DqUSE2YqoPJ1UG+ayGFU//dTNNTNXQLKX98lL66Tx0O/ji+O9BOtG+9AycyvoF2ih/u6jZjBTvRpoSiAiAtxbYTO4WuN14K6WaRVb0GiY/W1b45AfbGsYZMDikvotTFhjwrKj8VtM3kWk93Ic9Zft94l1XcNpyCCVqhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXS4nOW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXS4nOW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD08C116D0;
	Sat, 24 Jan 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769233747;
	bh=uKaFqd9iaOY/kQ4XE1EMq4WRMG0e9Da/8HBH36KVzyA=;
	h=From:To:Cc:Subject:Date:From;
	b=UXS4nOW6Q5Gn+EhC5Ocp+nWmdGb6MOBTY5aV+0cB3PG0Bszymt2TRdBVGA4PwU+Qt
	 wjPHGAkxqa4+O6DaOrn4xAtmIiI2NoZienmbas7R70msvvfpDVkW1ztsxXl6r1J4fr
	 XXG9nvDhEJDWm7le4RWmoKIaxRg1mnchixD9bBvProeBCG7sOtnTJxdFHPuGni+v7W
	 LkwjX26UFm6kguJhOKEf7zvPAa88FcgS5tMVZ6B39E6xFn1lQolKbBSVXxm/MIxi+3
	 BPXQ0+KkklVvinBKmWTFERQnRQMZcX9ePFRJoMQvnYssNyBAX0sFozr9/RDe4JQ152
	 B7tx9f94S0cxQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vjWW9-00000006m8H-04O8;
	Sat, 24 Jan 2026 06:49:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: kdoc: Fix pdfdocs build for tools
Date: Sat, 24 Jan 2026 06:48:41 +0100
Message-ID: <1a60aea3155a2e7c5e7bb004952739652407fb8c.1769233717.git.mchehab+huawei@kernel.org>
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

the "\1" inside a docstring requires proper scaping to not be
considered a hex character and break the build.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/linux-doc/63e99049-cc72-4156-83af-414fdde34312@gmail.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2816bd9f90f8..dae5a9136fbf 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -228,7 +228,7 @@ class NestedMatch:
             yield line[t[0]:t[2]]
 
     def sub(self, regex, sub, line, count=0):
-        """
+        r"""
         This is similar to re.sub:
 
         It matches a regex that it is followed by a delimiter,
-- 
2.52.0

