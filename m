Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94A1449B11
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337657; cv=none; b=FELeLWQfqtTOTL0eVS5xnv8UTzZh1SMj4ASdPm+yF1pklvXLskJkec5PutejD3cLsb/EOxQufd5Q4RxLhailRFFqER+f0j3F9AyYKye1RBFOhYJEEf22qWTq+dKUD9Ya67G/DZSjHFiPybFenI6/swE4O56dZBtmAEiN3B6F1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337657; c=relaxed/simple;
	bh=X+p2WGLuzTjMis8lEexxPSVhvUaX7sHLToQhbMInFec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFP+K06/8zh/CRF0bL1IQYoWDTTDh2eU4cwuKk6rhYkLEmSCTjbUF7pMd9krOI1lL+evh+GB6XqzZpYT1SwHm+iT52hnrmpYA3YOt3R4eXwmE5wciLc8JwAz8gElINF70j5YKRf1e5js+bnF37/qsd3K7WRZYmxVGGOyvIqOEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLe7uJTg; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLe7uJTg"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso266887a12.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790337652; x=1790942452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1r5bHA9CuIYsqSBm/KvT0uOgABx/8PZUnr/xHf3B3A=;
        b=NLe7uJTgDk8wwmYDTc4g+vbY35UY/MTFnD95DpDAAJIdGNrMQzC1EtNrtOycwr5eeK
         s8qXj+37YTh0e2dG7CDlJgsAFLtix/EvKXXQ8JWdbzHn35iBcT9avZXJLCoTkKCqh9PL
         tCMoNMGYP7FOfp0C1+UPWEmRNibb9EtPxaspKvcouyIjjvru1dzCekpfF8eZrho9U8Nu
         r5+JC7UeFIkTvsfiGI703SilcCKYd2FuERRMilXvJrj4Jb0e+Bv+7QaoCa2eVf6Aq0GP
         KpiZzygWrzxEG8Cx5QGjp+JZvNC6yuVL8dt/qL5GpUBS23GoeErgI4bkse5c+4fuVEh9
         TEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337652; x=1790942452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1r5bHA9CuIYsqSBm/KvT0uOgABx/8PZUnr/xHf3B3A=;
        b=GEGK9ZbLOcR4grYSq3d+63e6iieQ8/Bqo7ppKiwsgTCFsZWG+mdWGSuMg3reXZImzh
         Xc3g74Mjd9PO9lfFJgw8d0+5h0eAVx3DWc6bfbhBKSdqGQCIm1TOIZanUOJKkTa8q1uM
         bkYNWy8sW832OOU2Xbqt/3EIzI4vdXaPfGsEfct0RUWvlsBAg1eu/urUliTEeFIxvTS+
         64jUzRVI7pH3pQnDUyHetS5F8ngtZBVLQc+OH/auLAg6dwpo4K+iHfYmC8wgoMT4ogwz
         gu//ul5p5/2Gv3zxGv10W27uYSwRCgxspTXlMut1Bz0jZ7F4C/kgnanPovF/WEN09sPV
         p9Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwH9JLVd5RmD1PLGass4ub0uLpl65DdagL56H0bfOFN0DWH1FeIBjJpc6qAl8oq0WjaieBnpflSwp0=@vger.kernel.org
X-Gm-Message-State: AFuF++mI8zsGdrMtZVdCYbgKGcYgprcTHDlBJvwgh9JTsdUqNRnP/QFI
	BgRWpsZ4U6IWRswZip5dX97Rz+rudSo/GiMjamdBHYbzv4KhTN9VJsJh
X-Gm-Gg: AYBFou1JyrtQZPeVzDib6Hm9pk6/eZXtz0XMqk9GrpwClCIa56QsEZJpndRswSbGKs6
	LMLd8GcLAiXMef4LTBhuvpnjaRWnJaKIgUvvVACbxQjpjQkxs9pApqOSTcwMdR4yYrkKgWo1C4o
	OrdZqVXNBR7kyKbraEHBlOrzGdBWgrBmkJ7b+0VwsR8aVmWp44FX0xi09joorA3dY5svvpJ8JyV
	5jTTPk4l6+YjeCsbZxm/JlHF5RnNaP9T5QnFVO2NZK/uxtE1dPozE+clv3Wp2O0ELJTHRXLyD0g
	VjKYsIA+eV9dzzl86gfdVhBoP6wqWM7H9729IlITpb1aK32NuJyQBVTICHJu/+AJumUTo4cVcP7
	VeBx1c9OE15NlXZP0/Nh5Kdyo+YtJB/wpBaXgJxztYiIW+4ULFQUvS3evCDzlgSEfD26juQSpe2
	xkTmujJ2Tt67G5bNqZDIz1TuwPHG6EO0MSH4c6CfOe/TrBvvU6zehm6OkrtyZ2B45qQq3jFOM5K
	HgAq0T8LKOEuJLq2+8r95UX2qc2bRx8C2VSChmtgAQ5igCJ11TXsb5H1NY4ALSmE7QfVRo8Qfsf
	OxRn74NkFLO3pLKwFtoCwh12VpOi6GCJuJOatMd8LkH7Upl6nDbLFROukShPgPozXtI60Q==
X-Received: by 2002:a17:90b:510a:b0:3a0:9640:802e with SMTP id 98e67ed59e1d1-3a0986ec975mr4901367a91.8.1790337651867;
        Fri, 25 Sep 2026 05:00:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm10254338a91.9.2026.09.25.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:00:51 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	tytso@mit.edu,
	krzk@kernel.org,
	maz@kernel.org,
	cassel@kernel.org,
	ebiggers@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: document the branch in git T: entries
Date: Fri, 25 Sep 2026 20:00:47 +0800
Message-ID: <20260925120047.1093617-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A git T: entry can name a branch after the repository URL.  The first
to do so, commit a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem
git trees"), added two T: lines for one repository, one per branch.
Today 109 of the 846 git T: lines name a branch, and ten entries list
one repository more than once with different branches.  Commit
083bf9c56d06 ("get_maintainer: add more --self-test options") taught
get_maintainer.pl to check the branch with git ls-remote.  Neither the
MAINTAINERS preamble nor submitting-patches.rst mentions any of this.

Document the syntax only.  What a named branch is for varies: many
entries name the branch linux-next merges, others a fixes or topic
branch, and some subsystems want patches based on a mainline tag rather
than on any branch of their tree.  maintainer-entry-profile.rst already
asks a profile to say which branches go into linux-next and which one
contributors should submit against, so point there.

In submitting-patches.rst, say that fixes for the current release cycle
and new development usually start from different places, and where to
find out which.

Suggested-by: Theodore Ts'o <tytso@mit.edu>
Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2:
- Krzysztof: one patch instead of two.  The header no longer says when
  to name a branch (v1 tied that to the repository's HEAD); it
  documents the syntax only.  submitting-patches.rst names the branch
  that queues work for linux-next as the usual base for new
  development.  The cgit about page he mentions is a good place to
  describe branches, but not every tree has one, so the text does not
  point there.
- Marc: some trees are integration-only and want patches on a mainline
  tag, so what to base patches on is left to the P: profile or the
  maintainer:
  https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
- Niklas: fixes for the current release cycle are now told apart from
  new development.  memblock is not alone: ten entries list one
  repository with several branches, so the header says an entry may do
  that, without recommending it over a single line.
- Eric: his fsverity patch uses one T: line per branch, which the text
  allows:
  https://lore.kernel.org/all/20260925041654.112935-1-ebiggers@kernel.org/
  Pointing HEAD at the main branch with gitolite's symbolic-ref, as he
  suggested, is up to each maintainer and is not covered here:
  https://lore.kernel.org/all/20260924040030.GB5048@sol/
- Ted: documenting the branch at all was his suggestion (Link: above).

v1: https://lore.kernel.org/all/64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com/

 Documentation/process/submitting-patches.rst | 8 ++++++++
 MAINTAINERS                                  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b4..cfc72975a9d6 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -40,6 +40,14 @@ patches prepared against those trees.  See the **T:** entry for the subsystem
 in the MAINTAINERS file to find that tree, or simply ask the maintainer if
 the tree is not listed there.
 
+What to base a patch on also depends on what it is.  A fix that should reach
+mainline during the current release cycle, such as a regression fix, is
+usually based on the latest mainline or on the subsystem's fixes branch.  New
+development is usually based on the branch where the subsystem queues work for
+the next merge window, which linux-next merges and which the **T:** entry may
+name.  When in doubt, check the subsystem's **P:** profile, if there is one,
+or ask the maintainer.
+
 .. _describe_changes:
 
 Describe your changes
diff --git a/MAINTAINERS b/MAINTAINERS
index c52ec2d7d3c1..c3f8fc52f3ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30,6 +30,11 @@ Descriptions of section entries and preferred order
        See Documentation/maintainer/maintainer-entry-profile.rst for details.
 	T: *SCM* tree type and location.
 	   Type is one of: git, hg, quilt, stgit, topgit
+	   A git entry may name a branch after the URL, and an entry may
+	   have several T: lines, for example one per branch.  What each
+	   branch is for, and what to base patches on, differs between
+	   subsystems: see the P: profile, if there is one, or ask the
+	   maintainer.
 	F: *Files* and directories wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
 	   F:	drivers/net/	all files in and below drivers/net

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.55.0

