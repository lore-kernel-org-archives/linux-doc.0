Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7227A3803E9;
	Wed, 14 Jan 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395456; cv=none; b=jaFBGJnU4EokP0rLWU1If6nosNos9werk10Z5OEkJYLsbRDL4rNfZspAVStBRYTzLTzucJIzSDNWaTWS5zjhr1jfHwLmhlCQIfYQByf975bBFarTh/vW9c3SnmzmFKJ10EDlZBT7lH7Zn6l2SZMn6AH2lI/hV5/bLL9K77nk9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395456; c=relaxed/simple;
	bh=nDks388HnNY14MLdMvtYPp7AF6DwiFtLPZJ0gLotD50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Type; b=peL8CZFEGVL75fBD46mHAf2NNHZpQFe6CWmwhXnIEn0FSLvMkDcI/sP5gSAR22SKO/Qk7SCHKY7avHsjePf5pYx3+NEPyaAh01L9bP7bpLdNPHNgTYwbUyB5SmTKeNjBSiqin0dtqaVtsBVdfdTB/qX/YSvwUl78BtlCy1rIPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLnNx2Xz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLnNx2Xz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26749C16AAE;
	Wed, 14 Jan 2026 12:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768395456;
	bh=nDks388HnNY14MLdMvtYPp7AF6DwiFtLPZJ0gLotD50=;
	h=From:To:Cc:Subject:Date:From;
	b=aLnNx2XzyZBFoXS0d5D7FrIzMw02TZ11uAOBCvf9vi4xdgPSiOpclsjNdz+A9oK55
	 +BIQerNVSmV/FJ7HnAsQMtASyGwh2QHpAO4DKOk4ePEKf1iTXHzPQtvBGN65IF5jw4
	 ioIo3JKiwyusZHGJ2rU6MkXqhAotLWlaiELPHQCgz781ytK4AEcNhMlRdeASmPTb9c
	 3hmRhin23UU7/AINH0/FuKNJ9PU2TBKUQNPHA5otNlSHleSh7YmScED7MsgA395kO9
	 oSeIDWxjhTLNag/XzswWMPn71JZ0v/wsnsrQLNsKWoEd6gYWvJGK2UeA67WUFZVp0h
	 YCskwDxq7f+GQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0RK-00000002lxx-0ya9;
	Wed, 14 Jan 2026 13:57:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 0/4] fix -Werror issues
Date: Wed, 14 Jan 2026 13:57:21 +0100
Message-ID: <cover.1768395332.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v4:
  - improved description on patch 4;
  - fixed some typos and problems at patch2 comments;
  - fixed a potential sphinx.ext.autodoc issue.

v3:
  - did some cleanups at patch 1, placing the code on a new
    function;
  - removed extra blank line after comments

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

 scripts/kernel-doc.py                | 73 ++++++++++++++++++----------
 tools/lib/python/kdoc/kdoc_parser.py | 31 +++++++++---
 2 files changed, 73 insertions(+), 31 deletions(-)

-- 
2.52.0

