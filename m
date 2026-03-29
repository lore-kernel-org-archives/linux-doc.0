Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0246119CD03;
	Sun, 29 Mar 2026 02:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774751474; cv=pass; b=VR0Kxjr/qWi5GWG6fhiqxudDBQOFkrz99006B+yHlJJdwwmibCo+PD2f4C5uCnSEcrPEAUG00YKMIOdHjlwfMqiFsupYkQX/LRoyY3LvjUBrg3Z7UQ8n9zaFz+JcJ0UmGktbyT4PbxBFOnPnz/8fMpNVe+xIxPO43Z3xUHSC+KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774751474; c=relaxed/simple;
	bh=s1k2yRYaf/Ff8S7z942mGII+qoP0LKBJA8ZWmUeF+Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rn5Jk2WlS4XF/BubAAa/1iyfRdopxX1gKs9un/+/qeE7Vi6INARoM2jmyJ4H79Io8ahokF4ZVYiR/4SfYcvGcNpjToPAIYbOzj8q5XcVMEXJ2rXdnxz3tNqww9ifQhocjTQHKKqbJhyYEV10cRWeT2Lo+3eQ6pvhv302iAVOeAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=iHgZuYdO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="iHgZuYdO"
ARC-Seal: i=1; a=rsa-sha256; t=1774751467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SWpczzhxi3URXIDh9Ca9wMxbhkgtUh9K5VOaU4Jh4m13ahGMcwwP3/ZF3yd98bg6GqJNGM2vOZfl8pIQd/jKA/Y35SM3dSC5V85DNrLbL4PhNK3/hdkcgW+U+0BLmxW5Yi9mlpnpJJcU+qpWyca/w1GuA88xLYpi5GzoiewQfpw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774751467; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PRbO+lfztsyXnj32cqQ5a8hjDpu/ZblsXOk7PsvvG5c=; 
	b=NecFzJVr6mkKocwNjPDPl+qSiZZqukpt+348PvVsc5FQKx0MpE6UN3MaDjDCKeKYbUFGOx8UG9STK373ADOfqigGpCyJE5so4wGymd6YMbJn/1AX3WkTqHHRTc1GOQLrczdKhDI5It0e1Sp/4H85ZZw4Ne1I8nOqweqmeGmSWlY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774751467;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PRbO+lfztsyXnj32cqQ5a8hjDpu/ZblsXOk7PsvvG5c=;
	b=iHgZuYdOh7BBkF0R8DhxMlwqSC69xTjB0zjN1sQbTmMKNsMvKxN4M5tYDbwTbRxU
	hQ5Ulvn4akgb9DE0rOyKFPNS1uecTnWLt6fOHDngKFfkTyCE7L+V7JU2MjFeqLPRdJG
	Vw4mUpLkjTIOzK9FjRLV7EfOAPV4aG5jdaUHuN7s=
Received: by mx.zohomail.com with SMTPS id 1774751464812485.37680891896264;
	Sat, 28 Mar 2026 19:31:04 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rito@ritovision.com
Subject: [PATCH] docs: reduce unnecessary mobile page side spacing
Date: Sat, 28 Mar 2026 22:30:59 -0400
Message-ID: <20260329023059.30547-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Keep more content visible on screen and reduce vertical scrolling on
mobile by cutting excess side spacing.

On small screens, the existing padding wastes horizontal space and
forces content to wrap earlier than necessary. Remove the inner body
padding on small screens and reduce the outer body side padding from
30px to 15px, which still leaves sufficient spacing at the page
edges.

On mobile, these spacing changes cause the sidebar to span the full
page width instead of keeping left and right breathing room against the
page margins, so pull it back in with matching 15px side offsets. They
also cause the sidebar search control to expand to the full width of
its wrapper, so cap it with a max width to keep it contained, as it
already is on desktop.

That same containment work also fixes two pre-existing mobile issues in
the same area: the sidebar spacing is now symmetrical instead of
leaving noticeably more whitespace on the right, and the search submit
button no longer grows awkwardly with the viewport while the rest of
the search control stays roughly fixed-width.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
This change has a broad impact, so I want to be clear about scope
and regression risk.

The primary goal is to recover horizontal space for general body
content on small screens, where the current side spacing causes
earlier wrapping than necessary and makes inefficient use of the
viewport height by forcing extra scrolling to read the same
amount of content.

I did not make changes to the desktop layout. The existing
desktop layout would not benefit from this spacing fix; I think
it is fine as is in keeping the main content from sitting too
close to the sidebar. This patch is for the small-screen/mobile
layout only, where the sidebar is effectively a menu header
instead of an actual sidebar column.

Because the body padding changes directly caused regressions in
the mobile sidebar, I had to include a stabilizing fix there.
That part is not a separate redesign goal. It is bundled here
because the sidebar is part of the same global page structure,
so keeping it stable is in scope with the primary body-spacing
change.

That stabilizing work also incidentally fixes a few pre-existing
sidebar peculiarities on mobile, but those are not the purpose
of the patch.

I perused a variety of page types to smoke test for regressions
and did not see any. Though the change is global, I do not think
it has a high regression risk given the element hierarchy here.
Desktop already gives the content more room to fill naturally,
and this change mostly nudges small screens in that same
direction rather than introducing something new to build around.

I also put up a demo site with only this patch applied, with no
other changes mixed in, so the behavior can be checked directly.

Demo site:
https://kernel-docs-1.ritovision.com

Before/after screenshots

Issue collecting the before/after screenshots:
https://github.com/ritovision/linux-kernel-docs/issues/3

Images were taken on an Android chrome browser about 400px
viewport width.

If it is more convenient for discussion, anyone is welcome to
add an image in that GitHub issue for hosting then use it here
in the mailing list.

Homepage text

This pair is meant to show the main effect of the patch. On a
small screen, the reduced side spacing lets the body text wrap
later, so materially more content is visible before scrolling.
In practice it recovers roughly a fifth of the vertical screen
area that was previously being spent on premature wrapping in
areas with significant text content, as seen below on the homepage.

Homepage text - before:
https://github.com/user-attachments/assets/0f220b1f-2a44-4caf-b38e-6dd30714a345

Homepage text - after:
https://github.com/user-attachments/assets/e810de63-0473-426c-a94a-ca0c48b03bda

Mobile Sidebar

This pair is mainly meant to show the corrected symmetry in the
mobile sidebar after the stabilizing fix that was needed to
support the body spacing change.

Mobile Sidebar - before:
https://github.com/user-attachments/assets/e57560db-9bd0-4c39-8ac5-90bfb0ac696b

Mobile Sidebar - after:
https://github.com/user-attachments/assets/830f6385-64f2-4846-922d-2b20e7042819

Separately from the screenshot pair, the sidebar stabilization
also keeps the search control from behaving inconsistently
across viewport widths. Without this patch, the submit button
width expands while the search field stays roughly fixed-width.
With this patch, the button remains stable. That is incidental to
the stabilization work, not the primary intent of the patch.

Documentation/sphinx-static/custom.css | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..04987b0e3 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -24,6 +24,30 @@ div.document {
     width: auto;
 }
 
+/* Reduce excess mobile side spacing and rebalance the sidebar offset
+ * to match.
+ */
+@media screen and (max-width: 65em) {
+    body {
+        padding: 20px 15px;
+    }
+
+    div.body {
+        padding: 0;
+    }
+
+    div.sphinxsidebar {
+        margin: -20px -15px 20px -15px;
+    }
+
+    /* Keep the sidebar search control from stretching wider than intended
+     * and prevent the submit button from scaling unnecessarily.
+     */
+    div.sphinxsidebar #searchbox {
+        max-width: 300px;
+    }
+}
+
 /* Size the logo appropriately */
 img.logo {
     width: 104px;
-- 
2.51.0
