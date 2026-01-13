Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE392F0C63;
	Tue, 13 Jan 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324802; cv=none; b=YlmaEM/XaAy20AWjLNdxIh7YMl3Hnf1Mxdbwg/D2pfS1n3JN71zUqgBIfIT9vlPnECk2AjV/KdMDJ0pTf29DL4q7bKxqPUH+GW8a1nNNSHSgJm2sLE2AKiNTv+OkOnBb1rOiD+FpzHc0b81DDCeQa7vTEPpPoiVqoAHXaDJkU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324802; c=relaxed/simple;
	bh=AHZE9RWj4flonDGqZuRpz7n7skHd+q0+lZDRvhWX/YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cPHRrlK3aHpJ52XGGbDlzZa7krNtdDXbMS0R3JjxejrJGGeew2tPlHEufsdlp63MDqZujVEIrHvE60bXQ9QHNm06JTPxFTnpMGXY04WxtCKIlyOOkxelAuSSHHLGWpJF5JMBV9Wd3yMvSp3sVexTh45K1apSBPRVqr3ocd70AUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G0c3ShRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G0c3ShRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55FFC4AF09;
	Tue, 13 Jan 2026 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768324801;
	bh=AHZE9RWj4flonDGqZuRpz7n7skHd+q0+lZDRvhWX/YE=;
	h=From:To:Cc:Subject:Date:From;
	b=G0c3ShRCHFPzYSMFjqL6Aq336uEd67GS+IidrMX7wN/7/b0fseAn0Os2UtUOKFPQc
	 FTkshohAngKxxbMWXyPAyyxezjIXv9s3luYmg/J/MI742odeOeGK9xsTAATcObQt4q
	 lxMibjdKNghSCaHiJcuT+cMpOYlTaeedz9E/iWoGjHolOWG6JawxROi2caxUPgOGE1
	 +BwVHiyqVIa/7CspItUmfnB2W/6opric9cYB/1EFwGJeDZ84QPYI6BwybX3mym/van
	 zP5QpHV2pSXGPwvXRqNcoaDHNUS9C2QtURyT9AlNIXDT7ml9BCdAMCsC1wAU6Vchbi
	 AtjI1WG3+IGIQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfi3j-00000000ze5-3AsJ;
	Tue, 13 Jan 2026 18:19:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 0/4] fix -Werror issues
Date: Tue, 13 Jan 2026 18:19:52 +0100
Message-ID: <cover.1768324572.git.mchehab+huawei@kernel.org>
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

 scripts/kernel-doc.py                | 72 ++++++++++++++++++----------
 tools/lib/python/kdoc/kdoc_parser.py | 31 +++++++++---
 2 files changed, 73 insertions(+), 30 deletions(-)

-- 
2.52.0

