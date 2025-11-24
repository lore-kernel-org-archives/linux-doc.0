Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17982279334;
	Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978276; cv=none; b=qUDVcvk+rixlA9UTslaV3PS7MENpp7N1pfEz+tb1Jjk1cVoxBtAlAVETWEP3dzIxIdp1Ryi4UylXtOcCQdxaaVMjHRYcFCW1EBb1OAtISrinF5KSYBmBZtsJp9dFG5iDPtDug8X2qJ0sWjQ+WzvnPZ9pL1NlCFMzSrgaLJceZz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978276; c=relaxed/simple;
	bh=Uu6e3/PeHV/CgAA6dTkFm4fcayz+4I1XMNjO7Y7lCDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJ5/jycMTnviDZs9VUlK8vdPtXcfZ2dPZFMApDZp28GxdoPLF40eZRi8ukKocePxVfcRA0RfzuLmMxIPYTSJxtIl6NaV+tUnBYV7WzsHo7TeoZRDLk6H+JZ/tK7I4tAbnVnGeoR8DF5N3BqLpPPmLFsI/4bcVsboqe9pJorUM7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=El/a+1xw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="El/a+1xw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD306C16AAE;
	Mon, 24 Nov 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763978275;
	bh=Uu6e3/PeHV/CgAA6dTkFm4fcayz+4I1XMNjO7Y7lCDc=;
	h=From:To:Cc:Subject:Date:From;
	b=El/a+1xw5wcyEJWF8L/WBMAnfBtxnpL72uutNwK/MpGt9vEGKgbU9OWR7y3hE3I12
	 OVmlbXwVwlCIv3i7w7sJ6dYrCZiZbeKOywZWqGPajahIJWQsMu4mKfowHQaR/XCWon
	 GGg1XCnrILABAZ1zk2i178VFnlktPexuulC+HedSPus8XfVvSCNrU2rKtT7qOFQdGT
	 A53V37XhlJEPH4rEqLLwGtGsl+sBj15YUafNBKSgwwaFFGRO/bWVXQeqJ2f9btlHw7
	 twCHrP3HIbEOgIqHLHIArSrBntvwtuSHCSbiGrXV9UJ9T8csH3OMxuNWgMCB2BZABr
	 GPxWWuBV/KfVw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vNTKU-000000013bx-0P6B;
	Mon, 24 Nov 2025 10:57:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Randy Dunlap" <rdunlap@infradead.org>
Subject: [PATCH v5 0/5] kernel-doc: add support for documenting vars
Date: Mon, 24 Nov 2025 10:57:41 +0100
Message-ID: <cover.1763978209.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

As suggested and discussed with Randy, this small series add support
for documenting variables using kernel-doc.

- patch 1: add support for the new feature;
- patch 2: extends to support DEFINE_*;
- patch 3: document two media vars;
- patch 4: fix an issue on kernel-doc.rst markups and automarkup;
- patch 5: document it.

On this version, I'm using "c:macro" to describe variables, as it
avoids Sphinx C domain to try parse the variable. This makes it more
flexible and easier to maintain in long term.

---

v5:
- use ``foo`` for prototype and on patch 3.

v4: 
- document the new markup;
- fix an issue on kernel-doc.rst due to automarkup;
- add support for DEFINE_* macros

Mauro Carvalho Chehab (5):
  kernel-doc: add support for handling global variables
  kernel-doc: add support to handle DEFINE_ variables
  docs: media: v4l2-ioctl.h: document two global variables
  docs: kernel-doc.rst: don't let automarkup mangle with consts
  docs: kernel-doc.rst: document the new "var" kernel-doc markup

 Documentation/doc-guide/kernel-doc.rst | 48 +++++++++++------
 include/media/v4l2-ioctl.h             | 15 ++++++
 tools/lib/python/kdoc/kdoc_output.py   | 46 ++++++++++++++++
 tools/lib/python/kdoc/kdoc_parser.py   | 73 +++++++++++++++++++++++++-
 4 files changed, 166 insertions(+), 16 deletions(-)

-- 
2.51.1


