Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3D38759A;
	Mon, 30 Mar 2026 05:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848137; cv=pass; b=hR0W1y+dHDC54r+gkYJA/wMihiAQGnyHAFAudCemyknIfQhVgefTBmKPXhLIDOUsBCkkkP83Ar+HroBxNA/wMShR6JLXfAWRDMBGOqcsTwOfw+H3IQmkYLX9QRm1OgYx0hczi578351LzBUBr0RzKjwatFH31Xzey5NWs6wA0GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848137; c=relaxed/simple;
	bh=qv/h6BkjEkS8LSjHZIlXWTe1RqBQiCU+jemI+e5h6yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A75cy0Q57WBsLravbOR6+2zIGoRxcmrnJAhVO793S3CP0dXh2Ub/vB8VTc7gd1lk2Vq3xplhJC8+0Jkz17ao3jZEbZjY8TRb/arIkTnDeInZi2OyR5MQLWbhDFF0Gki8ygI3kzph/g2NXOW/3CslSakcRY62OcBqCTdodn49uRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=R9352t8P; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="R9352t8P"
ARC-Seal: i=1; a=rsa-sha256; t=1774848129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=je+g0CO7fJucm+a4bomn1G8Hr0TCcF7eS9bTKk5Gcjd5iihSHDk47bdEWUWDbbYGgrNoN5fWcCtE1VRxzbA8tJQ63YkrE/KmDjQBxTlnEgGIMjhRW11XtGwD0kNhYlMk9tH4rcdJcVa0r5UR6M2ppGMPUy+0SGevrjJmq5+xQBU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774848129; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IsGGV6Y6qUsfJ1J/sfb+hww7iY4xpd4ClL+EasS5CdI=; 
	b=L9c6vSH7uIyov8JALwBLQc61zi/6drS8lkRo7iSeS4xbYbRZGGXkDZt5kfxjzyJnKlTYoq+OhiBUqU/rFXAMFt8m+/DGZflvQYajlTmuNQPM9++kzJOJEhAcIhBU5n6Aq/Lhs9IJOfVyQTN55e2D9iKKch2OqWc+rvAiUopv4uM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774848129;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IsGGV6Y6qUsfJ1J/sfb+hww7iY4xpd4ClL+EasS5CdI=;
	b=R9352t8PQGrQ+aS/9narS8DnZXyfae0gHMOS5akayFYlO9i7yMVnOYRmY8KFMP+I
	ueqVLR78/RLHnNT2o2m5yBotI9LRQ7qzqekk/ZWn8bjEVOPdtrolZd943oNMthLXvyY
	nriVOgYnDOIEr9wlOhYoik833eykQ1jI5mGdsMko=
Received: by mx.zohomail.com with SMTPS id 177484812683487.57920307925338;
	Sun, 29 Mar 2026 22:22:06 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/3] docs: add left padding to TOC lists
Date: Mon, 30 Mar 2026 01:21:57 -0400
Message-ID: <20260330052159.11284-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260330052159.11284-1-rito@ritovision.com>
References: <20260330052159.11284-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a small amount of left padding to the kernel TOC lists.

This improves readability because the TOC lists and their
container use different background colors, and when the first
character sits too close to that contrasting edge it is harder to
read.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
 Documentation/sphinx-static/custom.css | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..6ba3e48bf 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -64,6 +64,7 @@ div.kerneltoc li.toctree-l2,li.toctree-l3 { font-size: small;
 		margin-left: 1em;
 		list-style-type: none;
 	      }
+div.kerneltoc ul { padding-left: 10px; }
 div.kerneltoc li.current ul { margin-left: 0; }
 div.kerneltoc { background-color: #eeeeee; }
 div.kerneltoc li.current ul { background-color: white; }
-- 
2.51.0

