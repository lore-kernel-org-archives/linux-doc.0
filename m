Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D62DEA7B
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626732; cv=none; b=YLiwtq9ruN/R1VQ/hGU5dEiyyUsAcg5KNY5G3NrTcqHMehWzEWf0AzOyScUfdojfzftLPoLDQ4Z8Pbn0DdKLq1YxATDrLzWs+VQ9bsGlXYNSnD/LhE1x4nc9Of6pgJx/nqP8qx16OyjS++89uFl+OFYxr1GiDxw5c1U9y0sUGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626732; c=relaxed/simple;
	bh=sPUfeSm5BrFc1JGDfQfBW2rqApZnuuum7JmLHXwQcOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQeMRZUAgGUu2kyhjPqIyu6eZE5XJi4/Jtvq9E9n6Rm3FqmTssk+UR+6jjr8V/AqqiuBZ1JsFSJlERUays0zbgQCfuJ4uRNcEhynpLLBdXoN7Fwio1t3sHzPsLHrK42OXfux18s8hXtE2myD+EdfA7ATyskrtcCUWLBYJx907Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXDYUqkZ; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXDYUqkZ"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8877677dbaeso29815639f.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757626729; x=1758231529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upmZ+84nb0PGLfZ0odEvQVtU0YnnK5GejiW4j5Z157Q=;
        b=jXDYUqkZIfafaaj564KOcErXS5ZpLDxorFCOtZp67qqNG1qB9tr76exfynfa7cZy4y
         UKcbgXoqrH9VlBhEsYwZMo4fwHBPam09gXnbLuHuUg23T8W3aJBQWzfTIgwZNKplLX4d
         dXLv42xlGN0n2MVxy2BCE6G2xgwRlru6Erq4IdPQvCgc3Um06Xglbq0/q7M5f1KmZPNV
         4m1rsfO3j0p36bP1iD344l7ZaEaycXGKn9G4zo3ArAcFwFkyzRiMJKCwGw4r1ggOrF6R
         2C9X1wz6GINhyBZq7xFucFWrDxxqv5ryzAMftciDTHSC6Y+tI9sfli6OJmbSmOmDLRZb
         0q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757626729; x=1758231529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upmZ+84nb0PGLfZ0odEvQVtU0YnnK5GejiW4j5Z157Q=;
        b=W0VvfSbvOLJHCyEpzdHGAAaXGlNoKbENPP2Q0g1nLVm22Eett/XSa9+85/ITYiCF1i
         /jO7t9bXqotnzzgDl2vwVyR8XDecsvXyXsapRMdoip7t4eB75Q8sVxBH/+XqZxSuq08j
         LMy9zQF9chxHJoRo9v5so9ahLPeEc7h6aScSa1GpCwosyx4hO1G9pqvucMJxwnaaIwA2
         v3WqaP+RGS93DdZd6VRu3z1kmLRZn+PjsswnL+eKeWnegf7AngFEMqP8vfjhrPxLfhyy
         QUonx5iP18ON41tUKDTGahoo935o6kPfv/GRuWJ3HgdzDsHnV5Xm9bsEknQdo6bpOGvW
         sKNA==
X-Forwarded-Encrypted: i=1; AJvYcCXclal394g9+44eeMk7mQeHqSinYBifiqWvsjI6iVS+mI2vlQtebzJOoPTJnt65tFXvD0g3VNJgnfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDgXJmS+dVymGA2C3JolAzfT27f0lF1rLGCSGxWTRqqRufLaQ
	1TKdfcKvIpN4NqnhRbZO/N7+z5WSm6JsTJ2qr+33NS6mcNonVJMG/rYJ
X-Gm-Gg: ASbGnct2pVKiXaJjoe6hQtO2WXDTAwEdbxcetdn6/ZsJnRuEcXFmw2gw4ND13YWDoXC
	tO5+y0mE66csPZihko2oWsDvNZWVUzXo8TcZSq30a8OSHfu6Ay2VEd0GxrOcHconfxYUA2MT0nk
	9AK+j9gmyRchcIMYNtvzEkEx+iF9h++urNUsge7IsFj45RGJ6LUdkbXzz4RZyegeJWttg/uDsCf
	7Gu3ApWminOMgaoF+j9zA25RZZWM8USoTCd/NU3v7z+/8VbttFICCJlREZo6MipdcGCRC6vDpUM
	oadxphHX9jXxFAHTc5ELreC6c74ZYpImz+cDqwSByV0BLwKgNVJsqCdnhnv2VAcCSIQsSl995mp
	aEXx4mYeSBZbEZy6nHJYTu35TidXwlGboMK+okjsG1DlkXGpFY2YB6zQs+Ce7NffF6cqRSpJvB7
	2hTng=
X-Google-Smtp-Source: AGHT+IFu8y/WUPR1ooMKGsVlSMKShA3ec98P60+uCdhE86rchCRKo5RimU6XdoYh0nHTIMRHf5T/Aw==
X-Received: by 2002:a05:6602:6408:b0:887:6330:d5a4 with SMTP id ca18e2360f4ac-89032dde9d3mr121777439f.5.1757626729147;
        Thu, 11 Sep 2025 14:38:49 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net (c-73-14-87-86.hsd1.co.comcast.net. [73.14.87.86])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-88f2d0bfdcfsm104024139f.3.2025.09.11.14.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:38:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 02/30] docs/dyndbg: explain flags parse 1st
Date: Thu, 11 Sep 2025 15:37:55 -0600
Message-ID: <20250911213823.374806-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911213823.374806-1-jim.cromie@gmail.com>
References: <20250911213823.374806-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..63a511f2337b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.51.0

