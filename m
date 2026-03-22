Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5519337C101;
	Sun, 22 Mar 2026 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774207232; cv=pass; b=tgKYqYZXQdOnvWoiNT0gsW2Y/DZQK0SmQSqZmmIEv/Jg8vfgG7OdYUiEVIiPfHONALqbqB2tnC1wqev1U3m5WIaMuEQfnaR8A5Vis/zmhwWDI3ieVZq6275GJjTb0i0+dI2yMbcS4TGnIdpm6k3Wx5CIhMP7+QtKGWSZhHxjUek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774207232; c=relaxed/simple;
	bh=rrjbWG3JYx6oiPAeKgeIlCH+V0XT/DFbd3ED+z5Sby4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWd0fSze/4YVCE47VOhzAR5n1MLg09DmbVDlwa6S6zJWew2E9+dlJCzg/QEMMvrwwKNmvhZXwEgF9bGROBBWm/9Z8PrRRxDiDzK3sG3jfNnx0DU41EgQmUopIR4JcA5TnxeNn3VGYjdA/r/gAYZV+yX/23wKK/kTFHBQ8PiBYpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=PX3832+W; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="PX3832+W"
ARC-Seal: i=1; a=rsa-sha256; t=1774207226; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aMsK2yque1VwmcZPMhulR175qKY5fUwONR5bZpl71gRnON/sPUW51cdpLdxQh47EwFOFas59dMRqKmoT3B09sNE4iuraPN+vnU4IOAZgvNCvxsNIHTVBTM2br9TE3SIJ7XBDTTl/RTsATpH9o0iKCPdD8v92XD0ffeQZdmdc4dM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774207226; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xj4IYphNYvQiQdWlA6KwkirF5GHxEU+yIkasY8jYCtg=; 
	b=gWP9wcdbAYTv5wa86hYBDvMOwiiDOWU7zBSsQMzHL2nJqEejG8OczMB7Rr+STDBpCEnUzQRt4gdr6ycrtoNbb+4LNfzGyPT9MTFJUscwiW7LJSij1cp9nXqlf/S7n+qcdJ02hBZLiuRkmxjV265nVkQHHMGX/CY841JysKBtMyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774207226;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Xj4IYphNYvQiQdWlA6KwkirF5GHxEU+yIkasY8jYCtg=;
	b=PX3832+We48iTQZE/v8GUq3upndm66QaJf+VT+f+T0kqiFBiyBZD6mZLXR/XYIeT
	O4C/XasJxeogSaeSdKKu2RlbTR7DBlT7kiBu+sNTyXOMRzdiSRvU/pGmWpGXS+7/klo
	dWhtt3Trp0+ABNY96ny8yDZ7n853WcW/q6Os5/vU=
Received: by mx.zohomail.com with SMTPS id 1774207223339651.0082641296057;
	Sun, 22 Mar 2026 12:20:23 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 1/2] docs: allow long links to wrap per character to prevent page overflow
Date: Sun, 22 Mar 2026 15:20:19 -0400
Message-ID: <20260322192021.63859-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322192021.63859-1-rito@ritovision.com>
References: <20260321180841.10166-1-rito@ritovision.com>
 <20260322192021.63859-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation pages contain long link text without natural
break points, which can force page-wide horizontal scroll overflow
on small screens.

Use overflow-wrap: anywhere for anchor text in the docs stylesheet so
links can wrap per character as a fallback when normal word boundaries
are unavailable.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v2: add Assisted-by attribution

 Documentation/sphinx-static/custom.css | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..4ec617d40 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -149,6 +149,11 @@ div.language-selection ul li:hover {
     background: #dddddd;
 }
 
+/* Let long link text wrap instead of forcing overflow. */
+a {
+    overflow-wrap: anywhere;
+}
+
 /* Make xrefs more universally visible */
 a.reference, a.reference:hover {
     border-bottom: none;
-- 
2.51.0
