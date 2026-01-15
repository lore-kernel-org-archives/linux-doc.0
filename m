Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6443A9624;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=JsAaHNBOyc1a74IFt1j9lYr/i+1d4jovdM0RWNbMpJLbkzu3Kt5e2CDpz6jBe5XZ5yy/Jk+gW9yFioTue48UbSqr5SwU5j3w8g3JWrXMVOlgP6wfZj5+tGTZZCda1IFOIFt1rNw3Cm6QLSBoXP7J5PB5FjVjMRR94j5JhDxfoX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=EGAJHGENaYRvIcSMvAH/GUryVRHBlOYEI6qnDLTroFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CEchdAWj9nsfvmaYjpUMkMXMRhxMJRDEqR1xc2T+hV2PkhaHGBCGvuej7x/PhP2+C3jP4Zr2jAITpxG/eJ18o2zIBU+fZoNinFJQe769ho6ayG0iU5fm1sUciOglHe1LEpFQoxs/w7KtLEQ3rjeazXnsBht66/sRD/cd51x/FGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tgmShExX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tgmShExX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17412C19423;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=EGAJHGENaYRvIcSMvAH/GUryVRHBlOYEI6qnDLTroFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tgmShExXO8jCKlxXKrrWqifOcZn5YF5RUeamya4WFeZNKGls7InOSj8YhOefCmg5h
	 ZV8noJ2qUoqH43+LKD/OYupk0rFO6Ck8aSUEzw/XLol4DeY7y0e3l6f2ZRzYdPP6nc
	 qZEtAogedyKeBz9FMZBbObEpEYrTxHKxxfFt9FN+EL/f9h4LEMGtxQ7RxPAK46kC3A
	 r870LCE1Ag7duFb6vZHdFryszX8kcZjHcLzvcdstplBMrNoFI/uOXw5MHqIYG1tQse
	 6CN+xeJl1DilrpYHkJfHgYTdjXDL04EsTiD9E+FAUZiWUtoh8faulUn1yepF35lGZw
	 YACzoQhMYZKHQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IN-0qN3;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 04/15] docs: enable Sphinx autodoc extension to allow documenting python
Date: Thu, 15 Jan 2026 16:40:25 +0100
Message-ID: <954a544ed6222bafcce2f3761dfc6b77bf9140f8.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Adding python documentation is simple with Sphinx: all we need
is to include the ext.autodoc extension and add the directories
where the Python code sits at the sys.path.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index f62982f83501..687c61e9ac7b 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -19,6 +19,10 @@ kern_doc_dir = os.path.dirname(os.path.abspath(__file__))
 # Add location of Sphinx extensions
 sys.path.insert(0, os.path.join(kern_doc_dir, "sphinx"))
 
+# Allow sphinx.ext.autodoc to document files at tools and scripts
+sys.path.append(os.path.join(kern_doc_dir, "..", "tools"))
+sys.path.append(os.path.join(kern_doc_dir, "..", "scripts"))
+
 # Minimal supported version
 needs_sphinx = "3.4.3"
 
@@ -149,6 +153,7 @@ extensions = [
     "maintainers_include",
     "parser_yaml",
     "rstFlatTable",
+    "sphinx.ext.autodoc",
     "sphinx.ext.autosectionlabel",
     "sphinx.ext.ifconfig",
     "translations",
-- 
2.52.0

