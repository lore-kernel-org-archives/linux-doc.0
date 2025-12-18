Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466535CBA9
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073483; cv=none; b=gOq3yttdQ1QY9+G/SEYS8N94ZSQ8TZ0JwdE6BfLfxeNybjrkNMr4Fon1mdRpCWaktsyQz9CK1bQaYEI7hsEHP7OjVJBD+65LiFy26Tx498ocOo0q5uuWs7FvQIr0MRhMOcfMfui+Bb331LiLHZGsQW4r8n3pbhYEQO7R1hxc9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073483; c=relaxed/simple;
	bh=aMsFRDBi6woKXA5wTe+E4vw7DDifElUEP57EAPkIp5o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LgiRWra5+nwhmqfcFqEJ0xLlO/kIgzCvfFezv8l1LnoeEOgtxGFbY7eCE/eq6COAKXKePfCioDgEYSY01fhMVIRnk/rf0caziYBHBylwQTh3Ytj5U/jVBcU+xoF3ZSVL/MvZ58hRuZNAxVqN1WbLVC2/HXaIv7JiFCsjZFcBMe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=CD137uXf; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="CD137uXf"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78c2e5745bdso7170827b3.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766073480; x=1766678280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4Z1msUY2rAxWdAtpYqttwDLBLeupKQK68y4s4x3GKw=;
        b=CD137uXf3KttblvNO7cH9oH+IQ2TYcH+2ltCi9DYVSwghyuASmupDeCqgDtyJfNygU
         qVdew55Accln0/7RwS/8mizLQWjI+8Vpr2EmBpfBvdXHUP35ILmU+SrdwXCzt4V2odFo
         Iv4Jombf6xvXC1aYWi+MzNJA2qK8dlIoXoioh2rmFQSEIQImRuKiEN+do5kvpyKf88ut
         yjNQOWR292O+CDWp3yGeg2/+5QiohX2omu+ZMZkJmJi6Uz+BX4FQoiRWJcuBNTcw0/EX
         gfuOYmcP2nC+ldXQkpdUPLtn0mM5qXqJjqHJyBdHWQoDH2Y8aL5vRCnaGZNS4sq7co4Z
         95Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073480; x=1766678280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4Z1msUY2rAxWdAtpYqttwDLBLeupKQK68y4s4x3GKw=;
        b=gKhB1PE21g/Zxpernp/xUjmHqlspUnHO3tVeo5TJtI9Mtw/69PhdPrvqMq8frAGNFM
         8d4xFuP7g7Oa5YzcTDh+Hq+z8K052HZ0+2GxcL+FglDv3K8PN/cxRx8DAluRChmjYnqn
         ekIvxwrbiCGqcGf3nrpwSSm+pxbyFr1EG/qSHad8qovnymmNOYGCLUGJDBz61+BV1EMX
         kEfg6uDmPRoDj7NnlP6GNInpT52id89rNJSHgSv8icUesClMUqBFCqoGtG8IcgZIenym
         tszuc2KZErwEUBsUP+/rbfDlE1YhM/U9+Cu+207rzGAL35kA/L8bOvJhzhE/zuPhTy++
         2czA==
X-Forwarded-Encrypted: i=1; AJvYcCUodPhDQylNCvmedNXls5/YQ33qOuE6/3OKA45dVlsso9m0aob9JCN0PxqQptQ81bEp/WXZ18r/4IU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLgqUneCC2CPPDaDZnteX4tL9iBF5qtTnn9GN+bXmbLk1LPpe
	W/XvT1t/QA28WyKpANcfKE1HYBg5+V5FFuV+rG/mulugLH5bTXKXHRsFoTzzxVBxJyQ=
X-Gm-Gg: AY/fxX5uuNiSd1fk8hI7PTqcv4Ua75IE+YME2Hgy9YgDkPVNOyl+YPlIwBXAphg3nqH
	jOQjvcK9w/ZyJL2GJkCqRGCozxB/fz8IfmHoxu0TbOVFiL7U3IYV8quG/E+qwWa/sOQZejjKMgV
	cKCMHN4o1GRw35v+8UFU+CJxyOIzSqvNprOmtcoI6IF1fOiI0cEkzvBkZfERCNnsliON2LLpEMG
	0lgwglmlLj/taXxiwcEpvSPKOrnhKc7fKwnWfVN/X12TqFOWz8eqTF6Jai97unCgKkvosTalxXd
	rTRN1Wtug+A+Tw9LjrcChr3pj9uRIVg+5vR+oe6F8iDJurghjeaHNUCm/gccmd5ZzUwYcUKDgZz
	bOgCT/49uVun3eau5q5b5Z5HLiutDpWIgM/JzqSrTAZnLed5MV29b8zNsjvC/7EYp5yJ3+gs5v2
	i8QvK9e3ehW/iSBXo7OM5l3UfuU3fdS0mcxnAj43IVyovvqPl9V2YKYF/PkUs3RPF925y7v0CYN
	vlzg/dhXhUERMj4492Z4bqDxLaMuGBxCQg9qA==
X-Google-Smtp-Source: AGHT+IFWhdACNbagBIHkwDyaADUMWOMF328GmPZhKrlu7OopueUq4wR0Bm9AacSAzm29ZXOrWmckMQ==
X-Received: by 2002:a05:690c:6505:b0:781:32c:b359 with SMTP id 00721157ae682-78e66dc90e4mr367785787b3.36.1766073480552;
        Thu, 18 Dec 2025 07:58:00 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa6f52bb2sm9348467b3.16.2025.12.18.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:58:00 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	skhawaja@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	tamird@gmail.com,
	raemoar63@gmail.com,
	graf@amazon.com
Subject: [PATCH v2 3/5] liveupdate: luo_file: Use private list
Date: Thu, 18 Dec 2025 10:57:50 -0500
Message-ID: <20251218155752.3045808-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.313.g674ac2bdf7-goog
In-Reply-To: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch LUO to use the private list iterators.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c     | 7 ++++---
 kernel/liveupdate/luo_internal.h | 7 -------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a32a777f6df8..1a8a1bb73a58 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -104,6 +104,7 @@
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
 #include <linux/kho/abi/luo.h>
+#include <linux/list_private.h>
 #include <linux/liveupdate.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
@@ -273,7 +274,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 		goto  err_fput;
 
 	err = -ENOENT;
-	luo_list_for_each_private(fh, &luo_file_handler_list, list) {
+	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
 		if (fh->ops->can_preserve(fh, file)) {
 			err = 0;
 			break;
@@ -760,7 +761,7 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 		bool handler_found = false;
 		struct luo_file *luo_file;
 
-		luo_list_for_each_private(fh, &luo_file_handler_list, list) {
+		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
 			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
 				handler_found = true;
 				break;
@@ -835,7 +836,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 		return -EBUSY;
 
 	/* Check for duplicate compatible strings */
-	luo_list_for_each_private(fh_iter, &luo_file_handler_list, list) {
+	list_private_for_each_entry(fh_iter, &luo_file_handler_list, list) {
 		if (!strcmp(fh_iter->compatible, fh->compatible)) {
 			pr_err("File handler registration failed: Compatible string '%s' already registered.\n",
 			       fh->compatible);
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index c8973b543d1d..3f1e0c94637e 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -40,13 +40,6 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
  */
 #define luo_restore_fail(__fmt, ...) panic(__fmt, ##__VA_ARGS__)
 
-/* Mimics list_for_each_entry() but for private list head entries */
-#define luo_list_for_each_private(pos, head, member)				\
-	for (struct list_head *__iter = (head)->next;				\
-	     __iter != (head) &&						\
-	     ({ pos = container_of(__iter, typeof(*(pos)), member); 1; });	\
-	     __iter = __iter->next)
-
 /**
  * struct luo_file_set - A set of files that belong to the same sessions.
  * @files_list: An ordered list of files associated with this session, it is
-- 
2.52.0.313.g674ac2bdf7-goog

