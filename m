Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85092311967
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777764783; cv=none; b=gX6pP94L9QsP4GbMQgP7tnS3e3nmZ5yFogwio1n5vlwKLVG8xqg+FtU23mRU12cZDP4UNiTdQDKlwBLXwpB5apnsMwjOApcNdOEXKPrEgxC0JpqoIp4+UY9ZKWQu6iKE7z/yrsyp1DXLtJlSK2E+L48JSduX8YvNJ/PHDNx3PGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777764783; c=relaxed/simple;
	bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4GR29bZqugZ0mEI6KIdf2yHHhqwQS+yeeT6+7gLIwUy7U9Cr+kdIiKuUG2DBer+wufOfedUiIiu2PBTEHyM9UMRqSMyLPqUW5asttqhAGJOd99GeQoXek3CAki12QCHZJ/nI/CFQnE2/b2ez4uD90z79VybeTmwe2ZYPzNOUFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3jE3rHt; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3jE3rHt"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dbd23bc684so1940412a34.2
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 16:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777764781; x=1778369581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=a3jE3rHt3c60r1uF7fLHC1sE0mchu5b4qfr7i2a+hI2gu/RV69j+qzMQ9iZQakcLOF
         CBBv5nC+BNK7dihM2kIgBQqwhmMZcK/S06Kpg9Es2ucl9Ww0+RHjijVfvbmB7LnxD0aI
         EUbr6OHy51NPNq6VhKr3vDtUiSY1l9b6g4t+lyKQfkfqKwFcUmsN6uHRMaxTRqHFoFvO
         azvLgdwup0kQF5eYwuVbo66j91dSyIm5/TMZKhH0CR2zrRFWZQYJMMhZhPqxh7yqYrgK
         MV1o5ESxjJXUFB2kd+1uf1f1fbwgc5mwfGz56cDUEP/akuvhDV7P6egtbPeVBgx/+osN
         N4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777764781; x=1778369581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5zD1QygmB8fWogN5M5u4F28IFz6bLgLGYRTXYqao/U=;
        b=QXfRAbVz4tTufypuzp2qyy6RdrkeHoH1cCOO3tpfZ22eYGCHQdRb8AtDLz1p6P/NC/
         omHQpe5suv35GetmC6Z4r+YvifKNQ5NTAIRx6CPKUzMaqhhQPNacJQFtYE69uDBZKQjU
         xFyt4PjfHn33YVuCFgW/CUaY7kUhnNQR6T1Hx7Xk6DtSB65i8Y3qmEVovN4NrkT2telw
         7rOaHu6SeX+4hC24ja+3FF6EsH6V9xOkS15G7y8W4y9GpgqnMWmDMmClv2AuSQgzkpU3
         Ar0o12RoMWZNOMtAPvz1DMISIlPmYM3PLmEfFGNVVCFlIKajMdvVSPQepWyEDVXGA9z5
         PdSg==
X-Gm-Message-State: AOJu0YxB5KBh5FzT2CRocIRDGa1OuPjUse5siMVg5aTmJoo3vAcpBK5D
	+IGvpVhWL1v8BSNV3pOq8CWGNkCPQOETVRVTqIhObc5H4g9Ax57ggL0Shdf9NSaL
X-Gm-Gg: AeBDiesI15vv8fr98vzEGHhc4KhhFSHLi6ywycF82NGRhhejlOBAF8HLOqz4ie0GHhu
	x4Ijk9lwhcWDUnbuySt/tT5DNWeJnHOrgCc072sLeVG4LyYzCd/BRyzFqcP5mzN/7yRfC6mWQV1
	9clHjzX0tKhY56VSX4aAsqGvW88J78FH+/KTjAZKSddydMG77I/jB++k//Bba1enxOBwkPnwSIC
	QrmG9tgLBluWlzOw8NxR9Tg3SzIdRzRlYf+T2kwVxXooglTWlu7Q2lSMT4dlJv9Xgbim9xrpAhg
	Mm1+CnFEc0iDW9vKliNNRZZHG1KCWZL1eEe2ZDlxE9/gPlvJ9s94MLFXCCp0ak42o4h+rdlAA8r
	SRLJjCS5WSgY0ZReOPTfP3t6rjjPyPn1Qz9FJaEom0NHIhSD3B260JeoaPmQVJRYO20MeoLmZIy
	8PmacQNN7oOq9mn/PX7fbEsDcWiKZYRtuZWqqb0o4c7O7GtJecLY4IQZ5WZY20LYmWs8yqF3vH
X-Received: by 2002:a05:6820:2214:b0:696:1450:ff14 with SMTP id 006d021491bc7-69697c64d5fmr2080725eaf.37.1777764781355;
        Sat, 02 May 2026 16:33:01 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-69689266bacsm3903680eaf.0.2026.05.02.16.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 16:33:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 02 May 2026 17:32:56 -0600
Subject: [PATCH 2/2] docs/dyndbg: explain flags parse 1st
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-dyndbg-doc-v1-2-67cc4a93a77e@gmail.com>
References: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
In-Reply-To: <20260502-dyndbg-doc-v1-0-67cc4a93a77e@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777764777; l=1814;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=Ybb0kJKNd2BJDDcZYbhZbCACFsLVAC7m/M+jXCdbe+s=;
 b=82PT/0qK+IxUG7xZFy2Px1H5AYKU1VZLvQW1GDekkphj5WdtgmbUWsucxlXZRUtTqfXEQxSzU
 IllXXKz/VCVCsos2p3ojZ5om0cJraaitIAKqrJ4jiBA9I/ihe1aAUnG
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
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
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |

-- 
2.54.0

