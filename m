Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77682BDC0E;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230487; cv=none; b=imnf9oz/s0JKXDQ+cjPCW50qM9D6c9vP0vbDoNdK8D7zATKBweSvyLlhxViQbVz5F5hS8gsfEOrOsh2jwTYKGMKyyEcL7owHdfvypHc3+gma6HP7q/AiuuHwlrNAMvkJEmuVN6ivFheri/7zhjX6X7yKEDkAomdVyHgFPoYoojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230487; c=relaxed/simple;
	bh=EXwRF2VDXPPVfElmB4xfDGPakFYyZT4jWLvlso8wR68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pbU8xeFj+Exh9Ck+N2WB7qKuPj1IoTrsyMCRUrSrUNPM/Kz0c3QvtRCffL/bBf2JGRA3akql87EYXRPT+pmtmOujK0auxiEhOYzUG7ezP6lo3fZpbEWitElcu2V2hgkxORj3itFmG23JIg+2p+mgz/tkvaKP/6D8YRfumsbzw5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTmkfMah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTmkfMah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A340C16AAE;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768230487;
	bh=EXwRF2VDXPPVfElmB4xfDGPakFYyZT4jWLvlso8wR68=;
	h=From:To:Cc:Subject:Date:From;
	b=FTmkfMahe27CHNTDslvWQMh8maJKqAO3FBxsSuzNBnjOgNCDhFxsBktNYsi6W8ESC
	 nLC47JCszp3lFwujQmeiPRn4fc5nDAgt5/XUsJZxZRMR0/1HU/lhZimxE6z4Z3ip6f
	 irRv8S5eEuhDwmIi0Ayabm/kI7+tpbQtlbJkk9bfE1VtCsfkQI3/Po1MM8bCcxU0so
	 hse0TIlcG35wewuRsZuDRCuMOebVUaZrPLI1VKVPr5fPr5e2ZVCvFcavEeMNwDYla0
	 MR26gU5nw4+fhAIy2bzh+ZqZQIQUsIc+zCsHrH+BclFHIfuHBQu3doEXTE4G55Y5Lb
	 TeBS9mQzUDvOA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfJWX-00000000JWj-2i3s;
	Mon, 12 Jan 2026 16:08:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 0/4] fix -Werror issues
Date: Mon, 12 Jan 2026 16:06:49 +0100
Message-ID: <cover.1768229902.git.mchehab+huawei@kernel.org>
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

As pointed by Jani, and previously by Randy, several warnings
are currently not considered as errors. The issue is related
to changeset 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently
discarded"), which was using directly a low-level interface.

Patch 1 fix that.
Patch 2 fixes a related issue: when there are more than 255
errors, the return code with -Werror can be 0 even on errors,
because of glibc behavior: programs can only use 8 bits for
error codes.

Patches 3 and 4 are not directly related, and touches only
on comments inside python-doc.py script itself:

- patch 3 is just a coding style change to match the comment
  style we agreed;

- patch 4 fixes some English issues on comments. The issues
  were pointed by LLM, which was used as any other spelling
  tool: I picked just the relevant changes, ignoring the ones
  that were false positives. I also didn't agree with one of
  the changes, replacing it by something else.

  I wrote it more as an experiment about how to properly use
  LLM. IMO, it could be useful to use LLM to review spelling
  on docs, provided that the one using the tool will filter
  out LLM-generated trash - just like one does when using any
  other spelling tool. Yet, based on Jani feedback, extra
  care is needed with regards to LLM abuse of UTF-8 chars.

---

v2:
  - on patch 2, I changed the -Werror return code to "3". This
    way, it is easier for a script to identify what happened;
  - removed UTF-8 unbreakable whitespaces from patch 4.
    Heh, it seems that LLM-produced stuff can suffer with
    unwanted UTF-8 chars... On one of the strings it replaced
    0x20 with 0xa0...

Mauro Carvalho Chehab (4):
  scripts/kernel-doc: fix logic to handle unissued warnings
  scripts/kernel-doc: avoid error_count overflows
  scripts/kernel-doc: ensure that comments are using our coding style
  scripts/kernel-doc: some fixes to kernel-doc comments

 scripts/kernel-doc.py                | 66 ++++++++++++++++++++--------
 tools/lib/python/kdoc/kdoc_parser.py |  6 ++-
 2 files changed, 52 insertions(+), 20 deletions(-)

-- 
2.52.0

