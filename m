Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA176303C9F;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=RyXYQ/04DTcgCtzk4hvoSk8Vxl6PMONhCC53CyTTOPwnGX/fR3wY/j5VUmSu81DN++Bha/OGIPZDTP/DfkX9OPVIeRp9zNCYkJmQKqaQLSz7Dwbob0p0E/GoaJpdWTteDBjQNiDATGqoafU0ksblGc5oAZNO7KMc5J+26z8T/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=mOGPpjFInnJF5ficZgf3c7TZFdWiehGB3ZFVn3w7fEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAuP4zk7osbDT57elMwYEijpg1GDxYLi/5n+qWG6QvrxDYRy5U1/fkuBeaLNlAExNW6CcIiaQda0Keubkb15J56w+WqDG/OoUNaQTEz1V7R/++KpJN3LhvG0QDugg5GYOdlej73juZiLcJ9MaYaj2nGZSQIAZgkMODGtpg5hP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCgRYetp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCgRYetp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D3CC4CEFC;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=mOGPpjFInnJF5ficZgf3c7TZFdWiehGB3ZFVn3w7fEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCgRYetpxQj5ircu7SffS0RZu478L9Xl2HMnqnncjBLuvUJP0o70y8UTz91AT8B/h
	 cJwxPoDhFx0KielP/ZfAK43Xm+JcjmM03kg1Wp0y1wlY1dXDhCLsbIZtULXX1OLelf
	 tcbphH353m6dAyO1CIPgZTZRhU8i5YNCG8EYOvA3plwjyhb5nGoNpkPy2I+AnFfAos
	 PTMhuej/Qa5ufiIhKR+3UMirHtb0NNO1uVTUADLYJ4ZB9Mqe4sMOZQ8PFrr9Mi4uhv
	 rzdetRo0hoECqYTk6HINBn0MzVC6VFIl7tV4z/CnW+qLJkDU5B6jIV7n5yPWhbShPR
	 dLWyAZpNFCuig==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000CrsT-0dGB;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 14/24] docs: Makefile: document FONTS_CONF_DENY_VF= parameter
Date: Thu, 18 Sep 2025 13:54:48 +0200
Message-ID: <a84680c8f6f34e57c51829242ebc98a609af94c1.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This parameter is there for some time, but it doesn't have anything
documenting it at make help.

Add some documentation, pointing to the place where one can find
more details.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index a52b311cdadc..05397b9d844d 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -126,4 +126,7 @@ dochelp:
 	@echo
 	@echo  '  make PAPER={a4|letter} Specifies the paper size used for LaTeX/PDF output.'
 	@echo
+	@echo  '  make FONTS_CONF_DENY_VF={path} sets a deny list to block variable Noto CJK fonts'
+	@echo  '  for PDF build. See tools/docs/lib/latex_fonts.py for more details'
+	@echo
 	@echo  '  Default location for the generated documents is Documentation/output'
-- 
2.51.0

