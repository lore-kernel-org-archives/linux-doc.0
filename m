Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19502E612B;
	Wed,  9 Jul 2025 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069141; cv=none; b=dPKiEt982GqLVv4g8QidcM8oGca3GZAEBOOdpL/ofLFE7FKGYTqqemAUQ9r3Z48g1lopllooNizdTcm2hn46mHafI5OXqpax4t7B/nExqUmbxbPUuvWY/lXHhmeM1/jQ4nJjDOjVfZHLLXVCePQf42A06CaO2jTiFVcuCMonDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069141; c=relaxed/simple;
	bh=Yq6EQQuaN4uyi7M6IJVol8n/5VTCTfqJHIGuz9Qu2Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q5tcPhj5fBzTXQHKqYbUIzHodEp8Ibt0FXM/7Kp7FiSaffD43akQU4ZaGW5K6lDpHbqwqwOMdtsgldQnFw5feaOtQqCBCi/8EMNE2lA/czJr7VPSsQSqGEFSNcDk227BTp3n14v5IgE8GgypLgJLIXhVoZw+/baQv4fhlQpylfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMZe2CSJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMZe2CSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09FAC4CEFE;
	Wed,  9 Jul 2025 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752069141;
	bh=Yq6EQQuaN4uyi7M6IJVol8n/5VTCTfqJHIGuz9Qu2Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bMZe2CSJp1G+a9eDrkp95HPxogcv5N0FH2aEtD9wGdQX9HMwI+GEH3WioWun/Yyvs
	 BlZ89fNZ9prand5YpoXHliZU2d8SYHnHmrRYCbg5jD6FGT0ND/LgW8hk8CAZ12HSAB
	 fwA2iRXpOdvXueDwM/IoBMJUNOjr96h/jro4Mw9Ap4prk6apzZz3wFvC+tA6k068U0
	 HZxvSQRqmAqe9OfnPttRRJM/mdG2JsYZDaT9drIknUXtYIT6ueZHDl36Fn74CAwYMU
	 JYuv4DLHLjNRmDHa7MUVbnSIXQyv2AN+0rl6slacp2y8YYexO2YYw1Xyw9E0eoQZsR
	 GsnWgwYN/FbDw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uZVDd-00000000ED4-2Jam;
	Wed, 09 Jul 2025 15:52:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/39] scripts: sphinx-pre-install: fix OpenMandriva support
Date: Wed,  9 Jul 2025 15:51:52 +0200
Message-ID: <f1e22b283e32fb4c0e578c82b10b29d8212a1e1d.1752067814.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1752067814.git.mchehab+huawei@kernel.org>
References: <cover.1752067814.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

OpenMandriva Lx 4.3 has different package names for ImageMagick
and yaml. Fix them to ensure that system setup will pass.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 94f3d2e32fd6..2f6036eadc94 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -647,6 +647,11 @@ class SphinxDependencyChecker:
             packager_cmd = "dnf install"
             noto_sans = "noto-sans-cjk-fonts"
             tex_pkgs = ["texlive-collection-fontsextra"]
+
+            # Tested on OpenMandriva Lx 4.3
+            progs["convert"] = "imagemagick"
+            progs["yaml"] = "python-pyyaml"
+
         else:
             packager_cmd = "urpmi"
             noto_sans = "google-noto-sans-cjk-ttc-fonts"
-- 
2.49.0

