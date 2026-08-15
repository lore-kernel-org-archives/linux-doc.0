Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007CB259C9C
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786757592; cv=none; b=GasX2d1MWIGfFbkfgwOMewg/AEN6YOZQgrLU2voK3dGFdm+08EpsWHAP3JPMQk/m2XZghOm5aASCweO0mdFQG3B1WxIPjf45OIeh6UYZHy9ApKWPz+uPVMvuXYEYEYnotBoVogBcFBLweWvM4/8yjcxwlznaRZD1+T/jHNn+WEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786757592; c=relaxed/simple;
	bh=jyYxlbBrAQnAZZN04ajlnh1MSAFrHtyTd0FqLUs6XWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MC73xqdfcMEDS0ES27WKP8xrs+vzJxz5ecS76c6J+Kop3Wie5mKmaVHm1+sMOK9EyYCv372ZMCmX0rKlEr4S9cUaLuD9fBoQsQt+64p/BgGAP0IC3aPJmUL8aHd7XUVJxctljFrN2P5RXwIXfdLDtddfy8Pk8foysyqdz/DhwEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve38/Vv6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve38/Vv6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so14839575e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786757589; x=1787362389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6hUXHl/XBMGrttNYvWX7RrvTYp0xlm1Orl1JfPmVXo=;
        b=Ve38/Vv6z0vdVwFjMw4XZ/ku43aAffw/dwkJlQ/JuVcQeJAc7WY0nfMrk5kZmwS94c
         RFcIQd+iQ7nEh4Um9bAsdvHe+7S1sznMjb1RbB0sMBWRgwV5WMlsAFWppkNUVrHF28ku
         6QkSsBCHTh7VuHPtrHDgTiioNM8de+tOalesxRMPz/YyAeGwJHK3oTfazftR2pB4h9RI
         EMNcU+t2GC8qNO9jCrHO6r91ICWsrBEsrXjOi1s/IVINZNMVAll1cejSJgB+mAC8QSbC
         cmdwM+aIXIfQlh5EpfvKMELcHR1W7Dni9UYBqFRJhuhbXMteH67wKEGTJehI7Y0sby6a
         LShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786757589; x=1787362389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P6hUXHl/XBMGrttNYvWX7RrvTYp0xlm1Orl1JfPmVXo=;
        b=Zfp1nO+2u3QBllddrnVcWKYhFrwtF7nxdr/vCwNCzRZ0UYcNmEmwai1DcgWj2I4qG5
         GRQw69FC9xi1XywEYIzcKCx3O3nPJTYSTrCKJgj06Ct12bGFbxaU+9kWBlEXsyXoCk+V
         nx3ovVTlBo+wRhbZzBsCR3tNlvuW3abs9mlUxoaWoJiwyfeivrJn2p1jZKoM9/QRwZO3
         cRpyYsCBEwmhNHKjnsFoq4/UrEMwyeUmhAMkpAwAwH/4A0CmSABxXrwkrJ7xqUByIEEa
         AXW7IOq/XMtrXJLt+tI+519rrLC7uTYEGt/FOyywv0fxfXbVjpoP/GXZVMokCAZydOTw
         O+YQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0eUtRBOnmBGB62Hu5NWycUt5X3h+k8seZgvRJSVYEwzzxkG+k3Rg+trxZXn/k8hSxPl7XfP8uGaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNy/2B0pU3xPKe/a5oKHMuKdFglynmzGNdgQIfvtuWMzfrWW2
	pLC4kE9bqAp/xhfTcl9O1cvK2rlOzc5Ux0Wfs8yZIku7X7v52nIWJM8r
X-Gm-Gg: AR+sD1372Fh6RjxPj5XX4lBgCYMTnJ3kFSzggrUdMToQ7xidO76d280PyFkVMWKJe/c
	Goe2KRiavvscKSF3jUWkZP8eVjwGUhyJsvDjjg8cKHZu+lNPdnmeOjtJ5/S34+DT4rKA3zGqAb6
	6khN03PBvZ5TtOdHUvzwu24I/0SJT8S3yDdZmN7o1etpLrIl868UnvHk7/bzvIQFdrbDUmoNY+A
	wKhxR5BX3ZMAGpodXV+6QzBILuvDpXOy3RMGg5RcfRXSblk0SaH6eNzuoW3F19IT94O4EcoNgMJ
	oXzVIFHp+Ol16eJMWB4xC48uKcy7ZyCSrgr4zMcRjGW4PwMy9PsfdpP/iktOhO3PIX2EXqMqVah
	nYh4ypw3DQK8NCS2QW5y0fStsmc+rzZhSeFoIC25plf6Ps7cEHThDcqLFHvJqZaHj7CL1mxHwrF
	d7+wlcF3sDADnxGXNkmmJknaRWXiYodj4Zx1o0yH+f3m4mPCDNxhpdc1Pw9FWnYAcrbSYNphcbo
	cOjwdwBBoAzvdG1Klj2kzQlQ5v6S55MStgfPsgH/xQUIPLMFDASWCpKx5UWMO7breNXD2vWyl7H
	l3FsMinPs9xjlsGz1LDQllVEud8nxMuyEBhEri77hEuGHFRz6ZGdJQ9IOpkNeLAxtCRH0VyhFJx
	KGsHe
X-Received: by 2002:a7b:c013:0:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-49987941a3fmr93722545e9.3.1786757588989;
        Fri, 14 Aug 2026 18:33:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d7d-f301-9495-44ec-73e6-1be7.310.pool.telefonica.de. [2a02:3100:9d7d:f301:9495:44ec:73e6:1be7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b1a31esm110672885e9.2.2026.08.14.18.33.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 18:33:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/2] docs: kerneldoc.py: preserve headings in kernel-doc output
Date: Sat, 15 Aug 2026 03:32:29 +0200
Message-Id: <335fec1cd5a3449687f8b1ee8cd46a0f3e455aa5.1786751700.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1786751700.git.kmehltretter@gmail.com>
References: <cover.1786751700.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kerneldoc.py parses extracted ReST into a detached section node while
retaining the surrounding title hierarchy. Docutils 0.21.2 silently drops
affected sections; 0.22.4 reports:

  Documentation/networking/kapi:107:
  ../include/net/net_shaper.h:75:
  ERROR: A level 3 section cannot be used here.

The same issue drops three Xe DRM RAS headings already in mainline.

Use nested_parse_with_titles() to give kernel-doc output an independent
title hierarchy.

Fixes: 2404dad1f67f ("doc: Cope with the deprecation of AutoReporter")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/sphinx/kerneldoc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index c1cadb4eb0997..9986df33e37ea 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -38,6 +38,7 @@ from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 import sphinx
 from sphinx.util.docutils import switch_source_input
+from sphinx.util.nodes import nested_parse_with_titles
 from sphinx.util import logging
 from pprint import pformat
 
@@ -252,7 +253,7 @@ class KernelDocDirective(Directive):
 
     def do_parse(self, result, node):
         with switch_source_input(self.state, result):
-            self.state.nested_parse(result, 0, node, match_titles=1)
+            nested_parse_with_titles(self.state, result, node)
 
 def setup_kfiles(app):
     global kfiles
-- 
2.53.0
