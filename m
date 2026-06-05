Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64812436352;
	Fri,  5 Jun 2026 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642635; cv=none; b=iiZwShRUTwTyAIxFAOcMFfmKgqC2rJhiJ9HHvbKHELE8MXjwW8EDa/D2KgT6FnOGcEOz9IqXBk0PAK+KspzJlZNwl3krXqjrorZq/vc4IxwKkJ2CIb5CgGXt2yOrQ1W+0dpvEma+saAMMo/XR9tXS+jCvxbip4NX+MdazUkHH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642635; c=relaxed/simple;
	bh=+19Zsk5vOXZMyuMg7RMcM29ulngnILx4+uZ4DNkfhqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ihZNGI74Q1D4mKoB8xtPO05m/oWdODjU/WRg+sngtoOvr6CaG+yu1kl8eItCLz9x45GKJ37+iXcAZixnnb6kdNRHwkTR6j9Bbjzhr2pv6DvqYKXFYeo5TULN7aXofZurfD7moWeg9zRaZGrDcotGG0P5bWDC89d/25KHm33oC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vT2fhohF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vT2fhohF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EAE1C2BCF4;
	Fri,  5 Jun 2026 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1780642634; bh=+19Zsk5vOXZMyuMg7RMcM29ulngnILx4+uZ4DNkfhqg=;
	h=From:Date:Subject:To:Cc:From;
	b=vT2fhohFphNNPru2XOOUvCyDL1p5NKcSO42ZRUJ2m+qZVdA+pKSaKJj54t+AGYBEr
	 WHqkm78f+KzD3FQa1DKcm1u1IrLtN4Tp3gUomPpUO0BusNCx9W+owBNG1fexFLjvoe
	 +xISEKsmEEyPv9WkQMbUUF4AqsFOJ59hx6x8Xvfo=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84022CD6E6B;
	Fri,  5 Jun 2026 06:57:14 +0000 (UTC)
From: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Date: Fri, 05 Jun 2026 14:57:04 +0800
Subject: [PATCH RESEND] checkpatch: Suppress warnings when Reported-by: is
 followed by Link:
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-checkpatch-v1-1-8c68ae618513@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OOw+CMBSF/wq5szUtPhqcHGR10NEwtJerLUZK2
 kI0hP9uwdXxnHznMUIgbynAIRvB02CDdW0SYpUBGtU+iNk6ach5vudbLhgawmenIhqmC1lz1CS
 JCkiBztPdvpeyG1zKa3k+QfXzQ68bwjg3zaSxITr/WVYHsfD/BgbBBNvJWnGUivSGH/s2/YuEZ
 o3uBdU0TV89BkK0wgAAAA==
X-Change-ID: 20260401-checkpatch-b97d0cbe7ee9
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
 niecheng1@uniontech.com, kernel@uniontech.com, 
 Cryolitia PukNgae <cryolitia@uniontech.com>, Petr Vorel <pvorel@suse.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780642625; l=1814;
 i=cryolitia.pukngae@linux.dev; s=20260401; h=from:subject:message-id;
 bh=c9WOjIkf6PqQcC+UWyqhsH7Lp0mHPos984XKOAN5Tdo=;
 b=wmZomkal1ceAYLxYqsR55LBmE95VujryRzX7m4nZXkxbncAL+HlNFyns9W1vugQF9VpuvsNUC
 tdG5nZGkDf6Dw3/lubNoHtBG5fuOHAJhPQlmNOcAaM9Hs2hBtq7nwCj
X-Developer-Key: i=cryolitia.pukngae@linux.dev; a=ed25519;
 pk=kF6wBkp7j9167keuk8Q9RvPgMRPuHlJztbLy0vbJ3K0=
X-Endpoint-Received: by B4 Relay for cryolitia.pukngae@linux.dev/20260401
 with auth_id=712

From: Cryolitia PukNgae <cryolitia@uniontech.com>

> The tag should be followed by a Closes: tag pointing to the report,
> unless the report is not available on the web. The Link: tag can be
> used instead of Closes: if the patch fixes a part of the issue(s)
> being reported.

Accroding to Documentation/process/submitting-patches.rst , Link: is
also acceptable to followed a Reported-by:, if the patch fixes a part
of the issue(s) being reported.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1..bb452f5313b6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3233,10 +3233,10 @@ sub process {
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . "\n");
-				} elsif ($rawlines[$linenr] !~ /^closes:\s*/i) {
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . "\n");
+				} elsif ($rawlines[$linenr] !~ /^(closes|link):\s*/i) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
 				}
 			}
 		}

---
base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
change-id: 20260401-checkpatch-b97d0cbe7ee9

Best regards,
--  
Cryolitia PukNgae <cryolitia.pukngae@linux.dev>


