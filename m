Received: from mail.larkspur.one (mail.larkspur.one [45.132.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AA19D076;
	Tue, 27 Aug 2024 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.132.244.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766007; cv=none; b=XZpmP9Og6EBiR4xpMapLJ8T1yLdhIfQJ30t9IPRd0J12buH15XutmPqoFT/xVV9MO7Ywvjc2OCjnOTzWZ5qADtdICOljecXwpXBiOMSV1VOmM6qTbMVde7ohP5AYlfOGCzxbF74ulplw2A+xiZosvitf8l2cYRT0K9/EzeOAJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766007; c=relaxed/simple;
	bh=+C1+fgbMw/euXjSrNWrrXTv/5xMsGTkbdtcYL89zMfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcCbvosO9izRzFjsuP6P4/1bZ0Q0boUoO8BqW4QYUAtQfANm9qWzY85vSgi2nDMi7tB1I3XXMmnPUsBBqSO0nhGKIF5b65MR2a+pddX4egD0OKV/r62+s1iJJSkqbrnWbWTMADYr2ririx0f2imksbiUibblNRjGa+4CplGcq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=muxel.dev; spf=pass smtp.mailfrom=muxel.dev; dkim=pass (2048-bit key) header.d=muxel.dev header.i=@muxel.dev header.b=Gear0AYt; arc=none smtp.client-ip=45.132.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=muxel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muxel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muxel.dev header.i=@muxel.dev header.b="Gear0AYt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6FAE29256;
	Tue, 27 Aug 2024 15:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=muxel.dev; s=dkim;
	t=1724765603; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8lFMmSd3p/v694tPfIzHSO9zh7Sd8dCwn2X3I4gCA04=;
	b=Gear0AYtVrr9EGpr7TCJGcaSN2aZJYMzN0Gb0pATHJ72f6azewUhN0e5YkFhpMR6nwob2k
	dqIYG29JsavZNINjhfkydHNU6MnC8OC0CbJjEcv52rqyZgq0N8mL0sokA52QQ95xoRVIfV
	ENqObpVHWAvW05bF+rQSeukgCeUUwCKkVeiuBjiv4dlwvfPoFbs/Fs/foEm6/R/ETIadlT
	hmpPI+lchJgy5kmokhgKQ/A2CW+59cFaaFYOH2LmPBE9ZZqPYEM8U0zjVAt/MlLB16EeiO
	lgrnYUAxthYq9pl2q8G9azKx8xKarKGVWIH7WkofGXUpf4sSNVI+iEvuy9L7OA==
From: Sebastian Muxel <sebastian@muxel.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Muxel <sebastian@muxel.dev>
Subject: [PATCH] scripts: sphinx-pre-install: remove unnecessary double check for $cur_version
Date: Tue, 27 Aug 2024 15:32:24 +0200
Message-ID: <20240827133224.160776-1-sebastian@muxel.dev>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

$cur_version is currently being tested twice with the first test
resulting in an unhelpful "$sphinx returned an error", not continuing to
the more helpful "$sphinx didn't return its version".

This patch removes the first test to return the more useful message.

Fixes: a8b380c379ef ("scripts: sphinx-pre-install: only ask to activate valid venvs")
Signed-off-by: Sebastian Muxel <sebastian@muxel.dev>
---
 scripts/sphinx-pre-install | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index c1121f098542..ad9945ccb0cf 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -300,8 +300,6 @@ sub check_sphinx()
 	}
 
 	$cur_version = get_sphinx_version($sphinx);
-	die ("$sphinx returned an error") if (!$cur_version);
-
 	die "$sphinx didn't return its version" if (!$cur_version);
 
 	if ($cur_version lt $min_version) {
-- 
2.46.0

