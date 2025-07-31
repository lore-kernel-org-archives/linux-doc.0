Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8921A433
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 21:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997869; cv=none; b=KblRPUqEPsWB+5R3VNFX2LozBOe0JHnhUdvKJDeMjrCd7MLeDZonfP4WG1VmTfJ/qJoAlnWNszOSznEUWDSG0BV10Sx8CiWIdDL/wQ1BXN+ByDvmCFeFYuPr0j3hOjUrQ7/b64fT/b0eDT9Ab6OQdnrieXx5f7nSaSmLocVvsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997869; c=relaxed/simple;
	bh=qwSDFAjQHW/7wU1Icp8alV4PMk1kI3X0i/CQrdqYV4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilPaZfqKunPUtiRodEncK3HYq2swXecS3DVIV8i5SKw6JdYQ/C3/0pmz/iGVpwAqma8qjQAE1Fvy4USp9n4Wdn9lDvBElOUCkRdhGK1qi7ijR5i80AYMBIuQT7Y8+VN46tLf5EyRLZZgHk7JdhrOIQ6NZGiRv1cSlyll4RITC6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j36RtVAh; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j36RtVAh"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e3ee9c7815so5514465ab.3
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 14:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753997866; x=1754602666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
        b=j36RtVAhYB4KGury1UcP+Ehcl5atLaMnOq2L5xR/5Mn/nLa0sANy8AcNHS7wtrwaIM
         Q4u82UYb0XRsg+D2gC08x1qytRGx3zJILFcngCKy/pH44xb8YXZTw1SQdWHRJ3SZyH+L
         2kGNm2OOxEMz8CrhbOWr1LWQcVo8y3MfO5HpT971h6roy3aQm7CRZktRKw9xENNdARPh
         iDbaHrwkagpBT3tBqkcG5TtX5ol/XqKA9Wq4wgrPByllZ1/927Mlup6Pao3zSrIgKRhh
         YVcNQ7rIyEarbuvGNddHRuuaQ2EomkIM6RO7CFYLcGNdcYJ2zT9cncS3FWhp4qOZkvm5
         d8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753997866; x=1754602666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfwMXVBLo5LDCQiepRGuFL3bGQZQgq3Btw/uQ5I/5wQ=;
        b=RCj4gZm2waZg2o8C6fvX8iqdwunBn/gu3sCa1R3X8r6NCBM06iS2ufqLva1o9XqelJ
         g9ny+ElxPHeLtMEFHOyHTwUiDMOvm+aUVHUGCVU6orVns4gFNJQTYy3B4P5SYnFUnU02
         A9C+sBODlW3BhdEpE0MPrM4VSG5sWBMkFKNtuP5A2dMdP7gFmNLPxy2HiaiYLnCipvIp
         zcs92XtnqlYcPC0Edu2Rxqt9sihZS05Fqhi/WMzypGYl9ITMiGuAa+W2EJPzQewjjkEi
         SMH7F/jG1XelKxGo4OarXnvEBN66sDyfCiRPaNb1teHmIyk0InZaorMYgrJGu6YCu5gx
         zMfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhTkAhnv6AjhxZN/CDWW8cn60zh0B32nCUDSJlyUxKYz3Eh5dJjgfwVdsASdWWkrk1jN8UGZJps+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hZ5hyq2JuWYms3cHqJRVvWsG+ZRay5xVbE+ELUvbT6JEJ1h0
	9C2AsDAdasb11fcHNGk/b2O0QTioSiu7dEXt0SjVCjk/JRQ/aWWuH9S7
X-Gm-Gg: ASbGncs3R5QYhhA7AEEjd7cLYLtADqptEdkojZlZwkXlCFr8CnSi0WzGi7GtdWzx2X7
	ksPzB1DnjdVdHYyANMQm6LhyXs11SOT3qsVIY0LbvEg7sq2W+CK2xk0NL/PaUMhkW+6nZobxQR0
	v1rtTh+XDdWdyfj7Cashg1/2gr5DcuZrcFI60EiCDW1dR4HmKOyI1XA7vLFAk33+nx5B97aJ5Wz
	2QTg3SBA307HO9n5hYeQK3aycst7nbu+JMO3xcPRoZBAjgcrxtNS7zTNWMjSdWP2YmHCqra7+Si
	E8gA5J+m6Hj76wSOnBgIfI1sTaHMIhEudINvaqRSgCbUTNoBHl5l+Xo49am2N2yiJ5vSNr0ayei
	sEiCQlkLl1fausc1gvySCceNF9HJDjICRJwI99HqZ+jb9NOiAtS3h+QUu94mhYLwa4Cd72hbliQ
	wv6A==
X-Google-Smtp-Source: AGHT+IF9K7VyCm7R4uc7FauYfwS6HoXoF+9LYjzoaFPK+sHtUqm6Qj/ibip9HTjynErEW1aM3p94cA==
X-Received: by 2002:a05:6e02:2388:b0:3e3:cc46:939c with SMTP id e9e14a558f8ab-3e3f60c6c4emr165565035ab.2.1753997866109;
        Thu, 31 Jul 2025 14:37:46 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3e402b148f3sm9904835ab.50.2025.07.31.14.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 14:37:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: 
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v4 02/56] docs/dyndbg: explain flags parse 1st
Date: Thu, 31 Jul 2025 15:36:27 -0600
Message-ID: <20250731213721.26548-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731213721.26548-1-jim.cromie@gmail.com>
References: <20250731213721.26548-1-jim.cromie@gmail.com>
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
index 4ac18c0a1d953..63a511f2337bc 100644
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
2.50.1

