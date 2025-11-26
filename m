Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0C233D6C3
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183455; cv=none; b=Stl5rTSSdPDUaC7d6MQNdjq0oJxox9yYr8zDHggL3wDy4Z5YywbQLF1H2yox5TTHqsMMFnn8iyk1ehiMR2jVMWyVZFxHBk08AeabtXhfAh5s/dRboteTOou4QCbQpI2foF7ZQyohc6mQ5ipwTij4vlDG14KsQlRBXzt5cR2VrUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183455; c=relaxed/simple;
	bh=fbBtS9Y1mVSWtFYG8bC2W6XeZU0LP5uWZoGlle1YCdE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjEBpoXvZN/junpkiJN8fMBZy898VqKiGlbbnzQ7wIzleDK1OO5tCgajxPbF7dMoX2tTQz+icJ5ogo8oAkdHSW91l7huiKoL3KtKS/cjlrDqzEXPIcS8RWL25AE3kjE7KNFEXVAMBf/P9haAAKaGCf+p6b3dNPIEmvJPvoFos6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=JhlnHQOZ; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="JhlnHQOZ"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64107188baeso87184d50.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764183453; x=1764788253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1oylsZzHxgSZmbIVeALsxMTslnUgs+7hP6L3oGrSRE4=;
        b=JhlnHQOZturhy5G/GJ0fhe9qMittRwsPeWh6j5Q93uqDTmREGR+ypzagN2Q8/LKWXW
         hwcmDzL62lyAAfiYnfiQU5w2C/eEbfa8PQFzH9UquzQq2wXMBQDa2mGLA8f65NAkLjqv
         CYXclpApm/kAd45RqgoZVv+01mf2Wr/8jDhmbjW5isVqxjeJtFScTF6tDDrADrbtkSUz
         vpD5q/1CDhH6pi6u0mHVnSsLqPbDzXCzWFOSsoZWhSPdxLcbayIeNS9XXGD5vAczihiR
         gZuo/oF+4koYg1R7YRL/9gaGSz2qr80nk7h9HEylexqaNjNy3MfN0Q91jvUNrfd96sHN
         LG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183453; x=1764788253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oylsZzHxgSZmbIVeALsxMTslnUgs+7hP6L3oGrSRE4=;
        b=Rpz/zLoO3TzGQ6ltIPzHsMrzsPXJUyRtvRA+ykkCo5TOsp14wfsmF3jA6AmWm+pgc2
         U8i6V0x/EtKFuQG2E+5GkLow7feMaiWm3jkRTmG1o44YLlOE0rqn5frJjWX2IEVypzsx
         m0BnNMX+D6zo4RmV8YxVQpxdfrJtf+8ZIgjm/3bYTc4Ntkcc16+zyKEiJKJIEAcAXBI7
         OHVZQuo+YP1CDrX3Go6o5rGXTMyKNoz3ONvZZhBVQcaunTjRYQ3DOSVyDCNjCZOS2EAJ
         rDFRPhxWLR1Ffkuq/LKci4zNs3nvFHQESCzzEyCrT/8rjSTIFHFEh1AtXuxh6zUC8YkY
         EyeA==
X-Forwarded-Encrypted: i=1; AJvYcCWRwnBwAVIH2FvBJoVz4SnO98wKkndCSdEbbEHtyFjEdysDHK25JvD/FTmUVfYpRffrHm8uJZMAxxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEtrnRbyEJ4i3VwPOIQm6yYLeeLT3XYJ3dE6m4TieAG9PEfxna
	NdhrabJMIyUbnN9DX12lwoVmj/ziNQG3pa4zcDbhT6ec7C3JuNtABiXcRC795Blq7xU=
X-Gm-Gg: ASbGnctBu1A1k+B5i6O1FvrEYeCDPoXt1kCqGqY4xZuwITZh6oJJ0oBniyhMWyyiFYB
	zUUD4Y7WmoXR25uussc+06EfHUh/jFjej2nU5vCJhRww2N78yp/ImOnci8sGOYc4VINJCQaaw3B
	Dvz2SfCw5eZ4b8SEtXIqUqR5FtWhxmWPTyU+h7zBDgQ3Fg/LH+1/lBzZ1a80eVoh3QNwjzOC1oR
	HwVha5IV0KtpqjhLsq2vA6k5pKez8Y+gUHQCWPLXyNBnmfyxtvH/NR2nDj9yRyiipb61Ieul6G6
	WxvRAAu8Bg2sSQ2xOAFg5yLaGTdyVbdJ6D7pU2OABtvZWwdpUnHhG5YxvYFNQzZWpgW5IVEiBlZ
	cRDQw1L/uFUgcdNTeDtuk66XPDQIpKv/ShEQcYKh7Ibtd29YE73QUBc+Ux/fysnWlU+ECu/pCZ+
	8zrP3TGa1NNFP/clBO8d9qeieTw+xth5zw0wTuvt9xfrC/Q2r9ozAeKCpBUJ5NaBQFDYkLYlmMB
	aYQiO4=
X-Google-Smtp-Source: AGHT+IGh8g5413JLIZ5YQT+ZmThIIEoq9as1A69vg1Sj/F5GWrIm6uWyotiHcJrmkWo4Rj0KSPIvqA==
X-Received: by 2002:a53:d84e:0:b0:640:db91:33d4 with SMTP id 956f58d0204a3-64302aafecfmr11761450d50.26.1764183453023;
        Wed, 26 Nov 2025 10:57:33 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-643259fd696sm2960753d50.7.2025.11.26.10.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:57:32 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: corbet@lwn.net,
	pasha.tatashin@soleen.com,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	tamird@gmail.com,
	raemoar63@gmail.com,
	ebiggers@kernel.org,
	diego.daniel.professional@gmail.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	dmatlack@google.com,
	rientjes@google.com
Subject: [PATCH v1 3/3] liveupdate: luo_file: Use private list
Date: Wed, 26 Nov 2025 13:57:25 -0500
Message-ID: <20251126185725.4164769-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.487.g5c8c507ade-goog
In-Reply-To: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
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
index ddff87917b21..c3af22fc2fd8 100644
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
@@ -757,7 +758,7 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 		bool handler_found = false;
 		struct luo_file *luo_file;
 
-		luo_list_for_each_private(fh, &luo_file_handler_list, list) {
+		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
 			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
 				handler_found = true;
 				break;
@@ -832,7 +833,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
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
2.52.0.487.g5c8c507ade-goog

