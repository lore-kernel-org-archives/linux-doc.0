Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129D3A1E66;
	Wed, 14 Jan 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408919; cv=none; b=FeYRaasC9GbmMhac6Jv102vvwQd/jZ7wNldBaliqYB+InI1ucY57t4H1bSmCDYAq6m5ifVlhrC2emT1EiLzjIGlBbsbvXTowCzsMcyX/lYK2WJ1KPJ5VL9M1Xr/cUtavZ9apfu/Kc0PqrtslVceSX/iwBJIrDQgf1smw1GFM7fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408919; c=relaxed/simple;
	bh=imhUnp/ALvQ994gz0Gf5rg91LOPDGa1bN1QwZkycZYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+Hoj6TVbGrxzDnfPcWgiTwEUns0IDgqE/0eAU/PdNwtVLoUT9iJE78Szya8huvDtmH9occa3eT3fcwUvvqcC6kZSaSXPa7EKnGLdcP08InA7qIb5fuLql9KmFxswM+zYgQoslqYoOPr537pfpsalCJHgXUmU40LUlA7v+SvJKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=q8S8It8B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="q8S8It8B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 12AC940C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768408917; bh=Dobd2cTkMeQwri2hB7GAHlrguwkKaq6zbl+ePMugp/I=;
	h=From:To:Cc:Subject:Date:From;
	b=q8S8It8Bp6uWyBUNXiWujSJ5uJdc+dC9wLFdfk/YI8oiWIyGZ0Zmi7rQuyj4mIpd2
	 XKgGEp+JoYz0cWFCgNbIrRYdUdPxq6JVH6GbhqBl4ruJaZzz3ltlM/SCumvNjWM7Ei
	 KrzcdOmyQCsn9RUe/388FHKwsBfugf0zbQbKeTdCWWbAI2ijcOhyYyqvw2s0btQW01
	 m+Z1dbqYGMjWpDpllq/7paYWfO2+OhGXYwpp/4UTBT76nuMYQVvLhPAF/iIv3KJbEZ
	 q19R+QNrWcAzegnFdll5ZG0wdHJkNdX0kTNeYVl3fNyZ/wun1biriaEBFbXxZoQPKM
	 njYy/Oflx8hCw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:27b::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 12AC940C42;
	Wed, 14 Jan 2026 16:41:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/2] Move kernel-doc to tools/docs
Date: Wed, 14 Jan 2026 09:41:42 -0700
Message-ID: <20260114164146.532916-1-corbet@lwn.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the documentation-related tools have been gathered together in
tools/docs, with one exception: kernel-doc still lives under scripts/.
Move it to its proper home, fixing up a fair number of references along the
way.

This move was delayed because it ran afoul of one other relatively recent
change.  With the conversion of kernel-doc to Python, the Sphinx kerneldoc
extension gained the ability to import the relevant modules directly, but
it also kept the option of running kernel-doc as a separate process.  To
decide which course to take, the extension looks at the kerneldoc_bin
configuration setting; if that setting ends with "kernel-doc.py", it
chooses the import method.

Some of us found that behavior a bit obscure.  It also complicated the task
of moving scripts/kernel-doc.py to tools/docs/kernel-doc.  I tried a couple
of ways of preserving this behavior but ended up with solutions that were
just as obscure.

So I took a different approach.  In the end, the ability to run kernel-doc
as a separate process does not buy us much.  For debugging purposes, it's
easier to just run kernel-doc by hand directly.  So this series simply
removes that capability, simplifying the logic and removing a bunch of
code.  The code that creates the command line remains in case anybody
should ever want a specific invocation to run by hand.

Jonathan Corbet (2):
  docs: kdoc: remove support for an external kernel-doc from sphinx
  Move kernel-doc to tools/docs

 Documentation/conf.py                         |  2 +-
 Documentation/doc-guide/kernel-doc.rst        |  8 +--
 Documentation/kbuild/kbuild.rst               |  2 +-
 Documentation/process/coding-style.rst        |  2 +-
 Documentation/sphinx/kerneldoc.py             | 53 +++----------------
 .../it_IT/doc-guide/kernel-doc.rst            |  8 +--
 .../sp_SP/process/coding-style.rst            |  2 +-
 .../zh_CN/doc-guide/kernel-doc.rst            | 10 ++--
 .../translations/zh_CN/kbuild/kbuild.rst      |  2 +-
 .../zh_CN/process/coding-style.rst            |  2 +-
 .../zh_TW/process/coding-style.rst            |  2 +-
 MAINTAINERS                                   |  2 -
 Makefile                                      |  2 +-
 drivers/gpu/drm/i915/Makefile                 |  2 +-
 scripts/kernel-doc                            |  1 -
 tools/docs/find-unused-docs.sh                |  2 +-
 .../kernel-doc.py => tools/docs/kernel-doc    |  0
 tools/docs/sphinx-build-wrapper               |  2 +-
 18 files changed, 30 insertions(+), 74 deletions(-)
 delete mode 120000 scripts/kernel-doc
 rename scripts/kernel-doc.py => tools/docs/kernel-doc (100%)

-- 
2.52.0

