Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9582755FD
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 20:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740602171; cv=none; b=pFStz9VlrLh+MwTfh56/HP8aAYReJdVXKy5862s0yIFdi2fEgXXQdwfBUkBuiYE7NZgSPd1Jg/cVtR+E1Ti29gjMcc4aIF0kB2oz7t89mmk6DroU+Dfs6UL1qJvy4CdBuA+0OkLKMMtNXPHMkGLDQOjM9mUoQbuljFdS9x2TWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740602171; c=relaxed/simple;
	bh=pdLhe7h+LXVW6YEhHRHrt/Av6GcIqN229szbDpsLGrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQlQ7qv76MtPe5AhR7Q0xNYjkRlTaJjWD9bEDlSrL8RbD/1yt7S7/sR9C4YxIDNKMQQuak0yzp3mPAi6OaHoFNEQcMU+XqXVQejavi8BCZAWjkvDo+cC4KxMQD+Ue3dbBif3N1KlGLl7nXunfWCtOlw7cJOWJjiQPfkEvvCpbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lx72pIyP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lx72pIyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740602168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/xWF8kI05yoYMbk3zbfEuOY2UMzlxkaKm36vvvwwEA=;
	b=Lx72pIyPLxyUSk/bvKWU6sCQvttk3rooo+6j6+2OaOCG0gSeLiAniAQ3PO9Q0XSePmMp7v
	whdDkFyPCbhs5I/9vKFuHKkTLLq2VHaiGIlxv3weZ7ULhuA6euGTP/28zEiZ9OFW3e/5vh
	nQB3od7braDon9uH4yJlydp+ucCy6YM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-XJSqQ94hOLejvs5PcRpe1g-1; Wed,
 26 Feb 2025 15:36:06 -0500
X-MC-Unique: XJSqQ94hOLejvs5PcRpe1g-1
X-Mimecast-MFC-AGG-ID: XJSqQ94hOLejvs5PcRpe1g_1740602165
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A43E19560AF;
	Wed, 26 Feb 2025 20:36:05 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.49])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5C1EE1800947;
	Wed, 26 Feb 2025 20:36:03 +0000 (UTC)
From: Jelle van der Waa <jvanderw@redhat.com>
To: linux-doc@vger.kernel.org
Cc: James Addison <jay@jp-hosting.net>
Subject: [v2 1/1] docs: Disambiguate a pair of rST labels
Date: Wed, 26 Feb 2025 21:34:51 +0100
Message-ID: <20250226203516.334067-2-jvanderw@redhat.com>
In-Reply-To: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
References: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
V1 -> V2: re-send using different email client
---
 Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
 .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index 07cfd8863b46..2d1b6f7504c1 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -347,7 +347,7 @@ again.
 
    [:ref:`details<uninstall>`]
 
-.. _submit_improvements:
+.. _submit_trimmed_build_improvements:
 
 Did you run into trouble following any of the above steps that is not cleared up
 by the reference section below? Or do you have ideas how to improve the text?
@@ -1070,7 +1070,7 @@ complicated, and harder to follow.
 
 That being said: this of course is a balancing act. Hence, if you think an
 additional use-case is worth describing, suggest it to the maintainers of this
-document, as :ref:`described above <submit_improvements>`.
+document, as :ref:`described above <submit_trimmed_build_improvements>`.
 
 
 ..
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index 03c55151346c..1b246d8a8afb 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -267,7 +267,7 @@ culprit might be known already. For further details on what actually qualifies
 as a regression check out Documentation/admin-guide/reporting-regressions.rst.
 
 If you run into any problems while following this guide or have ideas how to
-improve it, :ref:`please let the kernel developers know <submit_improvements>`.
+improve it, :ref:`please let the kernel developers know <submit_regression_tracing_improvements>`.
 
 .. _introprep_bissbs:
 
@@ -1055,7 +1055,7 @@ follow these instructions.
 
 [:ref:`details <introoptional_bisref>`]
 
-.. _submit_improvements:
+.. _submit_regression_tracing_improvements:
 
 Conclusion
 ----------
-- 
2.48.1

