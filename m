Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060F5366DD7;
	Tue, 18 Nov 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492982; cv=none; b=dX/mejetciepDdhcaKXD1hfSYxFzeqjEuyXlZRFH62+NTKow3s8fRH5LysmmAZwUIw1AMeoz+405UJlFyQuP5kRoy0vHYpflveaZ3+YVxcUNiFP76WjlmJ483JMZGC2w9NUvLIgZJQLi06VIUsCwG8+GCv+njb0dVThqWpI/qyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492982; c=relaxed/simple;
	bh=iZDsYxzvSNEO5QXw3QOUHk+u8bhChWxWCaLzkup4p+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osth3LgwG6rnIuNtmGj6PRKovPSyRUIuw7unNaUGbEHMxr7n4TVHqd6PgJVE0L0n3dYH2uqURW/NPGykGPM/hqrnT+swbiXa4VYeT2ck00PEdDAYwv+48uxLWIQR9zBdiwSH4ZMLu1p0jmtQVpMYM9Kziz7My/eYiDbQhbu2gZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIAusRcv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIAusRcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279C5C2BC86;
	Tue, 18 Nov 2025 19:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763492981;
	bh=iZDsYxzvSNEO5QXw3QOUHk+u8bhChWxWCaLzkup4p+M=;
	h=From:To:Cc:Subject:Date:From;
	b=RIAusRcv0YXE8Nuc7jfK+jIN0jw9vatQvG0X3rrjOY0ckDPChFnRDDCVcjsf4KzOr
	 hzfgGz0N3EvTHiBggS/8lIVXJw0/mzgZzII7lBoqT1Uqf0aKTGcoUKThrk/D1LjjCT
	 NmqkxFOiTb3Z7NzrgtXXSAL5NDRBCNCLX2ABwguQwldHWgRg2jCu76Me16S0+B9cjK
	 8i+gA8TvMrKaTpKoUyiS/Am60gWk5i4IxEmthQGHrddzDLXIGTImeLXgY8NawpFPnH
	 bUn/t0KMgk5dgUK/S31tXjU521lBSQYaW6WnpIOgYjRzoatqwxUyZijkfGAsZvzfrZ
	 Jjzel9mZZiTwQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vLR58-000000042hN-10qt;
	Tue, 18 Nov 2025 20:09:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Convert get_feat to Python
Date: Tue, 18 Nov 2025 20:09:25 +0100
Message-ID: <cover.1763492868.git.mchehab+huawei@kernel.org>
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

That's the final series to complete the migration of documentation
build: it converts get_feat from Perl to Python.

V2 is technically identical to v1: the only difference is that it
now uses tools/lib/python/feat to store the library logic.

With that, no Sphinx in-kernel extensions use fork anymore to call
ancillary scripts: everything is now importing Python methods
directly from the libraries.

As we don't have a definition yet for the location of the Python
libraries yet, I opted to place the parse features library inside
tools/docs/lib. It shouldn't be hard to move it elsewhere once we
define a better place for them.

There's nothing special on this conversion: it is a direct translation,
almost bug-compatible with the original version (*).

(*) I did solve two or three caveats on patch 1.

Most of the complexity of the script relies at the logic to produce
ReST tables. I do have here on my internal scripts a (somewhat) generic
formatter for ReST tables in Python. I was tempted to convert the logic
to use it, but, as this could cause regressions, I opted to not do it
right now, mainly because the matrix table logic is complex. Also,
I'm tempted to modify a little bit the output there, but extra tests
are required to see if PDF output would work with complex tables (I
remember I had a problem with that in the past). So, I'm postponing
such extra cleanup.

Mauro Carvalho Chehab (3):
  tools/docs/get_feat.py: convert get_feat.pl to Python
  Documentation/sphinx/kernel_feat.py: use class directly
  get_feat.pl: remove it, as it got replaced by get_feat.py

 Documentation/sphinx/kernel_feat.py     |  24 +-
 tools/docs/get_feat.pl                  | 641 ------------------------
 tools/docs/get_feat.py                  | 225 +++++++++
 tools/lib/python/feat/parse_features.py | 494 ++++++++++++++++++
 4 files changed, 732 insertions(+), 652 deletions(-)
 delete mode 100755 tools/docs/get_feat.pl
 create mode 100755 tools/docs/get_feat.py
 create mode 100755 tools/lib/python/feat/parse_features.py

-- 
2.51.1


