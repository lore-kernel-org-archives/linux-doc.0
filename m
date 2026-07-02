Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380239A071
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783010494; cv=none; b=IiaybzT9vKKSOC4duN2xsHixumBHGVZE+8Wr4EJjdE2vwzSY2suu1fHED2orBvsnkck1+BmUlYluG0cOjeLur1tHoCfHrbjAYB5h3y9PRLdHeLSeERP0a3E7p/K8L/MEcugKH8pmy20yJJn3eAQJYeT59eC3qlqM+dU6sEiPA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783010494; c=relaxed/simple;
	bh=qZKCtfeZXgr9USX3+37WWDppizwZjEcqYLWdj0ZjKXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDGk5jl82MVN4VuTieD81XT04Gnie8HJghqd4w+HEyAAEVxq1y4O+6E2KNtS+xmMb8/KR/JEh4ejDOT4SowFIots6vQ70XO4xncNSFKmZCes0iLG5+xb81dBVFpQkyXDUCdQ5XOjKFxFwMCoG5ZPvJDq5SUwa4pQtD5EqVj99UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA3T4kgg; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA3T4kgg"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44cc65b0a7fso585171fac.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783010487; x=1783615287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qvzOPyUHO3fHuBhGDC3KudpInHlOoaoXrnpC0iw+NA=;
        b=BA3T4kggu3XkBpYCbmqYfFtPIc5EloBJw9hqIi7C9+q2U7QsGY4SqjIRkImKVsMxwR
         nxgBPf2zP4QhnkwJBZatpvOKQ9iqpVmNV3v4sucaLcfFk1PRsMABsJDd+Mz99ySKAM2D
         lB4SFGxkOAaTBNJeUPy5aBLMjNunrsMHeI75W+wOdlZJyetImdKpN5WXYvpVokum2ZI7
         mZCJ4fqjLYOfeZfPboc2Wc14XbKJGMP9TvIbg5omlE8SZc6LN+QYHrcD4HqQN618zzca
         sXlFh8WoeajNhyCRchEGUA+mre59k2OmQoVfW+kqWJRBij5IoQGeH05opGtohGa/FDqo
         YiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783010487; x=1783615287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+qvzOPyUHO3fHuBhGDC3KudpInHlOoaoXrnpC0iw+NA=;
        b=REMmgpV8WwaEee+gwLK54NJ4G5mD61nnGn04Ul1c8doZClXsQyI4SEgtqK5PSsQFxZ
         LbDIIqWn4BrVEOTG4DJwMH5KYMyDuxFh2Zz5wVjzDA+vCvvkG3Ni7j5UNZk70m4JqtYP
         tKkEgQUGqXUM1/81Stu4nErYeZmC1NoQUPCa55TJaqfBmjcr/L5A/2HaEwaVvVPJIyhS
         hJsLvyW/Os0AZyzhzCTbD3WuVdVwGmc5OEdPx8aJTiowJr0Hh8d1qAx+i3VuZvNXNpe0
         ykrC8F/+DQfN7cO0BguUsBdlBY7R3C0k+TVkIguLpvd3kdYa7f36KlT22a9cBttwlh7Z
         Cr1A==
X-Forwarded-Encrypted: i=1; AHgh+RqTOwc6BqwUEhU78AkAh3s05ySI8nAOjUfKXFgj3x/xvhj4fZGuPnNsnaZi4kV63LSKNe0D2BuiZus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwttH6zPP2Kv4hOyJ+IpkqqkjRM9A6qgQ9HOg60a3Pe9Fj47A67
	cKEB48xvRAVvnxJf07eWmd7TeKPrPehr8L+Dzj7ttn64HDfFdIFTQSwL
X-Gm-Gg: AfdE7ckAe/XODuCTE7FxuJGnkcO7Mok6y9mAE+u80A/tS2XfMRJTZ1r25CNTjCJQG0P
	77KouI35guNxxIMPgZI1vHgQLOHFtZbOvYXQu5eXnWFu4s3O/IpRvVSOtU4VdNvEbE5lmNj5mfH
	vg43DGawdSo+F5Vp2bTwVYjkZnb41GCQYy+/VKONkvpaBy4XvPhHxcbCLYbZaknCO6IBhi5HssV
	Ntxv5zwRNuJ3EF4Innsh9gr6Ye3sEy4tClbUgxtJGmEpbEvrca+jr8+Ct6YuxnLiTSg56prr/He
	4symZEdjpRccyxvw9hTh3ofJnaOinLCW3QPHoXmogFrEuNQMOtkt9L1duisRs+S7nthsf4CH8Cu
	uWj3pM1Unh1ZgL7cmV/GDYdojKGEkgchMoGKaT2tP+9FEcWWl+KA4Ovb/VzvUsGLuqUQMI+iRQj
	7hePTnpU6TmXTfhwAUs1HbD0uVh4z3MgVvtxWKWF0m/NfrkAvoT9p8RVrD7GKcwQ==
X-Received: by 2002:a05:6871:890:b0:448:558c:d8bf with SMTP id 586e51a60fabf-44cea4ec473mr416039fac.17.1783010486868;
        Thu, 02 Jul 2026 09:41:26 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-44cbec93702sm3189652fac.12.2026.07.02.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 09:41:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Thu, 02 Jul 2026 10:41:00 -0600
Subject: [PATCH v5 08/18] lib/parser: add match_wildcard_hyphen() for
 agnostic matching
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-dd-maint-2-v5-8-24f22b052bf2@gmail.com>
References: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
In-Reply-To: <20260702-dd-maint-2-v5-0-24f22b052bf2@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783010473; l=4222;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=qZKCtfeZXgr9USX3+37WWDppizwZjEcqYLWdj0ZjKXQ=;
 b=HDabVOht9/LjgxGn9EUPsGTjVLA6SABPlrw+n+vplGk0ZZsVg/BaAE17NvzN4FDBlciWIe69k
 oC0z4UynkjQDC8xxlVvCE64H0VdKQuGpVqPudup+cHHcIckvCztnQby
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

This commit introduces match_wildcard_hyphen() as a variant of the
existing match_wildcard() function. It treats hyphens and underscores
as identical characters during the matching process.

This is necessary for subsystems like dynamic_debug that need to match
module names provided by users (who often use underscores) against
names stored in the kernel (which may use hyphens, especially when
using KBUILD_MODFILE for built-ins).

To avoid code duplication, the core logic is refactored into a private
__match_wildcard() function marked as __always_inline. This allows the
compiler to generate optimized versions for both the strict and agnostic
callsites with zero runtime overhead.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5: move ahead of array-slice patch to silence sashiko complaint about it
v4: initial version
---
 include/linux/parser.h |  1 +
 lib/parser.c           | 58 +++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/include/linux/parser.h b/include/linux/parser.h
index dd79f45a37b8..a3cc7bc5fb93 100644
--- a/include/linux/parser.h
+++ b/include/linux/parser.h
@@ -34,6 +34,7 @@ int match_u64(substring_t *, u64 *result);
 int match_octal(substring_t *, int *result);
 int match_hex(substring_t *, int *result);
 bool match_wildcard(const char *pattern, const char *str);
+bool match_wildcard_hyphen(const char *pattern, const char *str);
 size_t match_strlcpy(char *, const substring_t *, size_t);
 char *match_strdup(const substring_t *);
 
diff --git a/lib/parser.c b/lib/parser.c
index 62da0ac0d438..d5be01fa9adf 100644
--- a/lib/parser.c
+++ b/lib/parser.c
@@ -268,20 +268,13 @@ int match_hex(substring_t *s, int *result)
 }
 EXPORT_SYMBOL(match_hex);
 
-/**
- * match_wildcard - parse if a string matches given wildcard pattern
- * @pattern: wildcard pattern
- * @str: the string to be parsed
- *
- * Description: Parse the string @str to check if matches wildcard
- * pattern @pattern. The pattern may contain two types of wildcards:
- *
- * * '*' - matches zero or more characters
- * * '?' - matches one character
- *
- * Return: If the @str matches the @pattern, return true, else return false.
- */
-bool match_wildcard(const char *pattern, const char *str)
+static inline char dash2underscore(char c)
+{
+	return (c == '-') ? '_' : c;
+}
+
+static __always_inline bool __match_wildcard(const char *pattern, const char *str,
+					     bool hyphen_agnostic)
 {
 	const char *s = str;
 	const char *p = pattern;
@@ -301,7 +294,9 @@ bool match_wildcard(const char *pattern, const char *str)
 			pattern = p;
 			break;
 		default:
-			if (*s == *p) {
+			if (hyphen_agnostic ?
+			    (dash2underscore(*s) == dash2underscore(*p)) :
+			    (*s == *p)) {
 				s++;
 				p++;
 			} else {
@@ -319,8 +314,41 @@ bool match_wildcard(const char *pattern, const char *str)
 		++p;
 	return !*p;
 }
+
+/**
+ * match_wildcard - parse if a string matches given wildcard pattern
+ * @pattern: wildcard pattern
+ * @str: the string to be parsed
+ *
+ * Description: Parse the string @str to check if matches wildcard
+ * pattern @pattern. The pattern may contain two types of wildcards:
+ *
+ * * '*' - matches zero or more characters
+ * * '?' - matches one character
+ *
+ * Return: If the @str matches the @pattern, return true, else return false.
+ */
+bool match_wildcard(const char *pattern, const char *str)
+{
+	return __match_wildcard(pattern, str, false);
+}
 EXPORT_SYMBOL(match_wildcard);
 
+/**
+ * match_wildcard_hyphen - parse if a string matches given wildcard pattern
+ * @pattern: wildcard pattern
+ * @str: the string to be parsed
+ *
+ * Description: Same as match_wildcard, but treats '-' and '_' as identical.
+ *
+ * Return: If the @str matches the @pattern, return true, else return false.
+ */
+bool match_wildcard_hyphen(const char *pattern, const char *str)
+{
+	return __match_wildcard(pattern, str, true);
+}
+EXPORT_SYMBOL(match_wildcard_hyphen);
+
 /**
  * match_strlcpy - Copy the characters from a substring_t to a sized buffer
  * @dest: where to copy to

-- 
2.54.0

