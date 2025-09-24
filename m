Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C4221F06
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 02:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758679608; cv=none; b=Q62T6qfZeX+WwQAFEOA5v2sEk7qurS2WHgRkY04NvIYwxY5VIIC86io95/s1Qs+kPm0qG842weQQRvu9YKA88v0qxaYsYXGUZBoOTWXJchQA4Rrw34EpxQxs6qMy6uQHabFwffoC1pRGDlyUiK6yzEk8vfLZnS+PVwYzMttLS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758679608; c=relaxed/simple;
	bh=j06FhP+kipsBirdtsi9W5187JT9Z+wgVUcWg7BEI980=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHwSj7+gPNOdxpwN8xkSW91vItIlrFjAUQBWnJv2e+hI3Bwcs++w/ybHq65i08V1P6Qg8dkqiAwVu/Crubwg8/2iKMbj3/3ItxuoaSCo+0jMovRS9H31eRgZkTD2p2I8BNef91ZtwQqox993eT2/yRyxBheFri8l/yD7ZhCh0J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7Jazw+L; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7Jazw+L"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so5727477a12.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758679606; x=1759284406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciePfvdtL+5lomPQDb47RhbqHcSVWA9My3xn0Ig9A5Q=;
        b=R7Jazw+LXRn1WbtlLQ3N796B3IM10r4Ax4YUW46Y7XMbxPAXFV7f99BfxwbxGqQaQe
         qcNfpKr56urf18dYNl3cIVirTaVyAq7e9Looe/K8WosrYZN4Bx1PqSXSLccabWsouKpQ
         /OWbU2+cob28iHOEGt7B/yDOqDoO/hlzno06n7XieYuMrjbrm0cuMwawnEqzYLQGU7fM
         qT4StRCtVlJbsdAn9BnLn1wZHxjVasgrdn4lQG3EHPlPy+2XINh/7HyE9VFhxK1Pf1+O
         alv/iN0O2lLSRzY9ad+2y+Ga0GM1eXW14p1+Bl8wjxUQZUbVQDIBiJSZeTOBXO4ClQfC
         ynFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758679606; x=1759284406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciePfvdtL+5lomPQDb47RhbqHcSVWA9My3xn0Ig9A5Q=;
        b=ljLJfSqesyTSSgtt0zre5jyws0JlF+iymlAnhnS9WaBqidPRV9qOLqX2MUIEFb1ma4
         Jvn+tDAQv9g5Y51aSeX0hdeEG4lIr1MvdF92P6FSsFp78wgZ+qnjPZyumeSRaNoyD0hX
         b4SlDf7nvxia+s+GElz5mLkyi7TyqmIpWWNgo/Rc+wv3AKAIPt99unOgJJiHxjIcjcaE
         gGEIf3iqKDOBndMFqi96WN8aJ7cG+Ju5rA5IM72nLXqor0cSTC1M2Qx6aOiMkOSQqr/C
         gBhMb4JlPqf/c/tel6sVdHOnE5O4h/hnmBimi9zMWXyx53vvH7dVP/xDI1+bab88lsOC
         pToQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKwGZk8iVWjc3qEnBn705OdFUhF5n6UzE/zz9WPhwJVSibBfOmtqdj5XFfBi69Ri+QEZbj6BzP3jE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLJtCwvdi184EyZh4+G3sJhepnS+TthinDW9CYgZAkGc+kvHi2
	w3eZHueMy3q/q+OGLKXiwxOXeqSeE3+BFqJupWGTiFwUOVJB7Y1Fw2ar
X-Gm-Gg: ASbGncukLi/iVcTiiNblV3ZK6DHx2QE/phV4MQIdZwMcabu0uhLeVrg+J9+fsp4qtZ2
	M8iQCqFiyU7hiNdCl6aY2fe7cxoc9TZBODOnQpp9wXKyEhRMFL9+aRDbq9jF7yZYWd6/m7fiuMe
	p1PR0Uw+x0VgRpS+h95MvGwCMyBOMPmxZAlyY9/7+ll39UvOePpeF7h0CEcmsrQGJ1Ok2dSRnZs
	KXkW4LorhmO+t1I5yVzR9PBaKVMxqKX2jVvJT8P9DxrAeiszyu8IDnbH6CcBJ/CkbDrzuqZpFVc
	Q8vVkJTrkHOY/5hPs4c4lcQhgJHges23sT86KAkf1UdsvV0SQ/Yl1uKZGxcx/nCS675w2Kdn+gq
	2iycKQzOvt8pwub/mt5ipUFiP1VihCsRn
X-Google-Smtp-Source: AGHT+IGOg6vFWo5UC4mbvo1msbl/MOqcUGSOPdhiIHhmYncFpj5be1F9lexrCoDGvQar9VbrAedjdQ==
X-Received: by 2002:a17:903:1983:b0:24c:da3b:7376 with SMTP id d9443c01a7336-27cc2d8ef77mr57448685ad.26.1758679605713;
        Tue, 23 Sep 2025 19:06:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698005309bsm176147885ad.27.2025.09.23.19.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 19:06:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 946E441A2ED7; Wed, 24 Sep 2025 09:06:39 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next v2 2/3] net: dns_resolver: Move dns_query() explanation out of code block
Date: Wed, 24 Sep 2025 09:06:24 +0700
Message-ID: <20250924020626.17073-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924020626.17073-1-bagasdotme@gmail.com>
References: <20250924020626.17073-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3856; i=bagasdotme@gmail.com; h=from:subject; bh=j06FhP+kipsBirdtsi9W5187JT9Z+wgVUcWg7BEI980=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmXA9OOXTp/TVZggteMNY/Oa01e/27b9L2FPKx3uK5xf Ji/2Ey2oKOUhUGMi0FWTJFlUiJf0+ldRiIX2tc6wsxhZQIZwsDFKQAT2RDG8E+R1bZB23d92C+5 Y85HdBU2Meew+X9ZW2101S+x31FYOIPhf2D7967Exc7akpP6dJn3Fq2Qyn097cG+jsNFU4O+O6y eyQYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Documentation for dns_query() is placed in the function's literal code
block snippet instead. Move it out of there.

Fixes: 9dfe1361261b ("docs: networking: convert dns_resolver.txt to ReST")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/dns_resolver.rst | 44 +++++++++++------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/Documentation/networking/dns_resolver.rst b/Documentation/networking/dns_resolver.rst
index 5cec37bedf9950..fbbd2c4635cbd5 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -64,44 +64,42 @@ before the more general line given above as the first match is the one taken::
 Usage
 =====
 
-To make use of this facility, one of the following functions that are
-implemented in the module can be called after doing::
+To make use of this facility, first ``dns_resolver.h`` must be included::
 
 	#include <linux/dns_resolver.h>
 
-     ::
+Then queries may be made by calling::
 
 	int dns_query(const char *type, const char *name, size_t namelen,
 		     const char *options, char **_result, time_t *_expiry);
 
-     This is the basic access function.  It looks for a cached DNS query and if
-     it doesn't find it, it upcalls to userspace to make a new DNS query, which
-     may then be cached.  The key description is constructed as a string of the
-     form::
+This is the basic access function.  It looks for a cached DNS query and if
+it doesn't find it, it upcalls to userspace to make a new DNS query, which
+may then be cached.  The key description is constructed as a string of the
+form::
 
 		[<type>:]<name>
 
-     where <type> optionally specifies the particular upcall program to invoke,
-     and thus the type of query to do, and <name> specifies the string to be
-     looked up.  The default query type is a straight hostname to IP address
-     set lookup.
+where <type> optionally specifies the particular upcall program to invoke,
+and thus the type of query, and <name> specifies the string to be looked up.
+The default query type is a straight hostname to IP address set lookup.
 
-     The name parameter is not required to be a NUL-terminated string, and its
-     length should be given by the namelen argument.
+The name parameter is not required to be a NUL-terminated string, and its
+length should be given by the namelen argument.
 
-     The options parameter may be NULL or it may be a set of options
-     appropriate to the query type.
+The options parameter may be NULL or it may be a set of options
+appropriate to the query type.
 
-     The return value is a string appropriate to the query type.  For instance,
-     for the default query type it is just a list of comma-separated IPv4 and
-     IPv6 addresses.  The caller must free the result.
+The return value is a string appropriate to the query type.  For instance,
+for the default query type it is just a list of comma-separated IPv4 and
+IPv6 addresses.  The caller must free the result.
 
-     The length of the result string is returned on success, and a negative
-     error code is returned otherwise.  -EKEYREJECTED will be returned if the
-     DNS lookup failed.
+The length of the result string is returned on success, and a negative
+error code is returned otherwise.  -EKEYREJECTED will be returned if the
+DNS lookup failed.
 
-     If _expiry is non-NULL, the expiry time (TTL) of the result will be
-     returned also.
+If _expiry is non-NULL, the expiry time (TTL) of the result will be
+returned also.
 
 The kernel maintains an internal keyring in which it caches looked up keys.
 This can be cleared by any process that has the CAP_SYS_ADMIN capability by
-- 
An old man doll... just what I always wanted! - Clara

