Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7D2586EC
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055544; cv=none; b=tB9wKugv/Av7ppzZSbkXchrztq66OIbIKFb64XyZBBXBHJfUHQ31PuwMwFrsTxzrptINSWLzEzv9UcyFvTSRlDKtE3uvqqHj3nYbWfKnfR0dX7slUetrFcZl80bLX3QFfJ+m3PcFYYARY34yNMY1a2Cb6uwBz27Bb3KVicCXBAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055544; c=relaxed/simple;
	bh=/VXUzjQZU271lD1bjiet9y9j60QvC8ChG40pczFVtfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAlC8YvwOWC2gbG/HoJSFh6FM/zDXZqaBaduqeGE30MgOxk0BiMs3kdfUiiJYmHnj3XUBvzWXNs/MHLCvnZdt2f8mJv20ulUo7RMjy/1cVgGXitgP7RRs1HSry48RftFop1qfV2QMLQvDj4T24EQeKIOIS8OUSiki6tNL7ZBl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=195.121.94.186
Authentication-Results:smtp.subspace.kernel.org; dkim=permerror (bad message/signature format)
X-KPN-MessageId: d11f2886-13e9-11f0-a9b5-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id d11f2886-13e9-11f0-a9b5-00505699b430;
	Mon, 07 Apr 2025 21:52:20 +0200 (CEST)
X-KPN-MID: 33|bQTBsH6APbTwLSXScHlw30lAcGu6k7HPsiACix1+J/NYdJANtsq8Pf24NDqPO3d
 4xWwWORzpVV/kD12wM3LMwoabWFFnZRHID5hTsOisfBc=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|zNWMzEywHNTsbhj1rg2JFyulm7flejspUf0zlgpnXyJIaOoFkfKECNgEi1iizHu
 aNBtm/naUd7D1b9F/MXPBIA==
Received: from localhost.localdomain (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id d1306542-13e9-11f0-97d0-00505699d6e5;
	Mon, 07 Apr 2025 21:52:20 +0200 (CEST)
From: Jelle van der Waa
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	James Addison <jay@jp-hosting.net>
Subject: [PATCH v3 1/1] docs: Disambiguate a pair of rST labels
Date: Mon,  7 Apr 2025 21:51:20 +0200
Message-ID: <20250407195120.331103-2-jvanderwaa@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407195120.331103-1-jvanderwaa@redhat.com>
References: <20250407195120.331103-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James Addison <jay@jp-hosting.net>

According to the reStructuredText documentation, internal hyperlink
targets[1] are intended to resolve within the current document.

Sphinx has a bug that causes internal hyperlinks declared with
duplicate names to resolve nondeterministically, producing incorrect
documentation. Sphinx does not yet emit a warning when these
duplicate target names are declared.

To improve the reproducibility and correctness of the HTML
documentation, disambiguate two labels both previously titled
"submit_improvements".

[1] - https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-targets

Link: https://github.com/sphinx-doc/sphinx/issues/13383
Signed-off-by: James Addison <jay@jp-hosting.net>
---
 Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
 .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index 07cfd8863b46..4a5ffb0996a3 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -347,7 +347,7 @@ again.
 
    [:ref:`details<uninstall>`]
 
-.. _submit_improvements:
+.. _submit_improvements_qbtl:
 
 Did you run into trouble following any of the above steps that is not cleared up
 by the reference section below? Or do you have ideas how to improve the text?
@@ -1070,7 +1070,7 @@ complicated, and harder to follow.
 
 That being said: this of course is a balancing act. Hence, if you think an
 additional use-case is worth describing, suggest it to the maintainers of this
-document, as :ref:`described above <submit_improvements>`.
+document, as :ref:`described above <submit_improvements_qbtl>`.
 
 
 ..
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 03c55151346c..d8946b084b1e 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -267,7 +267,7 @@ culprit might be known already. For further details on what actually qualifies
 as a regression check out Documentation/admin-guide/reporting-regressions.rst.
 
 If you run into any problems while following this guide or have ideas how to
-improve it, :ref:`please let the kernel developers know <submit_improvements>`.
+improve it, :ref:`please let the kernel developers know <submit_improvements_vbbr>`.
 
 .. _introprep_bissbs:
 
@@ -1055,7 +1055,7 @@ follow these instructions.
 
 [:ref:`details <introoptional_bisref>`]
 
-.. _submit_improvements:
+.. _submit_improvements_vbbr:
 
 Conclusion
 ----------
-- 
2.49.0

