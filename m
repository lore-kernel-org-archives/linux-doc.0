Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6423002AD
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764775744; cv=none; b=aqR2g3pfMTsqI65jDThRIMJIeXkRuCoZ6Yyl9TS3kZSugZDX5VAuGp2BL5CTikwG9YVuaTbiOQyFoEkxHcpcxb2L0enAmd4Hp2ivGObyJpVhXud5CgqYvdC342GFUICxpcO0Qqs0V/cVWVKRNZ/EsFhyTrctTuoLKBb3ChOk+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764775744; c=relaxed/simple;
	bh=ZP+a/lYHROshZoFv304670YZenCoDJjMnXixZoDRcgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OeOnOFEV/Z3KmQdVpIDo1eWuIqNokJDy+hIv3RyA8xDweKseoNoCKbhKwzvQIprqXYQlvE9T1TlzdN3RW3rnKtUC+WlOoPN7FBF84b40hxj30xsDHqMlOqdU080/jgpslbnfSHYxwcnmaBR54LMhlHaS1QSjUBFWWxB4PLvr3xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xviz1rHb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xviz1rHb"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7394703b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764775738; x=1765380538; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUOVPTJ4/dC2kl4p1iy88YkrusyzdxkNbRXdJXMfw68=;
        b=Xviz1rHbGcfdYpeIXa5gf/WA9MybYBa1huMRugdC6ykOw5nZHD55WSMYDfkyjX3X9t
         3la18H483WdyE3HbJ7YT/D3BWWbCbC1+71NlR6yM9RxVlRvKUSSzMfabABA9/dC0ZPay
         ddWDzoXVwUudqZH8nOhsqIwL6er0TQCWIgiTFnUU2sU3BC9taNRMe8J91eoQzSCIyREB
         tkdAlhVbQeV4TTB5nPqvP28JBhltgCadvchqwajt4N3otylEI8/m6jB5uKmLSzXY348k
         QntQzlvpotDIYKlo56ECX3GA2GLQuErACEC/RL2cehIvG2+Egq+tQoMHcOH9nLXWFWIL
         /KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764775738; x=1765380538;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUOVPTJ4/dC2kl4p1iy88YkrusyzdxkNbRXdJXMfw68=;
        b=ZpTBKo9YvISVPYRe1ixAbvjkhNcKkcxrYo7UiNIik7NWRglVZ5CncrPiK0tTcwIJte
         eELRnE3uS9snb0pt92d5kKcG6Mk4RL3aP09BtCPY9HMb4/V59gWDqZ6Rvg1/WbHrG+6H
         a7/HZR42+f1GfntOjqlmHEXryIsX8M4fu9CoILHqgesuCXxNxOfu7kGLFMFq3JyJz4/6
         9yhqKIyeU9L463MrNz4IQs3fVixddx2giZGrYOUuRgZp75qsvHxIdKRAqxUJYD+xBTWj
         2reVmhzRy0q8EPhYZK8JRdw/qmKuRzbWZzD+nqLnqssGURQEpJboR5pl3FQWIl54t2wO
         bbFg==
X-Forwarded-Encrypted: i=1; AJvYcCVFEo8ZkqT2EMIG5lDnBiw+1gZ7MYZ/zThnDocF7N0no9zoeb3RvzQraj2SbsS5KRpZ356Tr6+pgq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDtqEU16fu/hctnj9KF8EXPzFrSd3iWeCRWuT0l2htPtZ4zpHG
	ZwawsuWqVwMrGlLxAnsccbpaB+4MSXS4XJmueiU+8GO86KRw5ItjayXp
X-Gm-Gg: ASbGncs5EXPlspqLnfQCUDhdhW5vqb2E69aWCkm68A3JK8DfzlA4xMIdJ+GauW3kiT7
	fjyR44nLhHyc+LjJl2WoWnpFFV2oNzZ91oo5xQUp3fOXzi42QrogKVwvdJ4jBqkK99sCcPZo+2O
	196mLsUfQhOqD2Z1uHo9uGrXM494xxQazFfSAnAgWJRHmYDGRIbu/V/aagW2Q7y+Q3lNSRg2Ayt
	O/rcZq9dgNnUlbg8E4BMgvS5Xtod9zpSkixlOdandR9IYBQN7p4oLt/eDxreaKEYyU9GS3b0jQp
	94hDy/d1cvbZsXBvwN7Jj80Py8oli1L44JeZ56oN4t/6qlYNJxYPOiD7TtJN+GrQYRPIAb1qnJ0
	q66FfJSxiIOdMySrhXLCfLh5Rq1Ea8TqqcAK1ZLVHcDHEXAfnDz4Omz525iAV96LWnY28Z+sECp
	7VXfsbViea
X-Google-Smtp-Source: AGHT+IEOsz1PzZbs/DYjU/JrirTTGiHXDESPnE5swa/vQS97QPodviOkxWFtzWwuhqltw1FaWZbskg==
X-Received: by 2002:a05:6a20:7346:b0:35d:7f7:4aac with SMTP id adf61e73a8af0-363f5e7a28emr3846587637.47.1764775737421;
        Wed, 03 Dec 2025 07:28:57 -0800 (PST)
Received: from aheev.home ([106.215.171.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be509f4ee3fsm18234837a12.34.2025.12.03.07.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 07:28:57 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Wed, 03 Dec 2025 20:58:49 +0530
Subject: [PATCH v7] checkpatch: add uninitialized pointer with __free
 attribute check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-aheev-checkpatch-uninitialized-free-v7-1-841e3b31d8f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIADBXMGkC/5XQO27DMAwG4KsEmquCpKxHMvUeRQdapmKhiR3Yr
 tE28N2rZKmRLi44/Rw+Pq5qlCHLqA67qxpkzmPuuxL8007Flruj6NyUrAjIIhBqbkVmHVuJ7xe
 eYqs/utzlKfMpf0uj0yCibTT75K0gMKoiXQZJ+fM+5fWt5DaPUz983YfOeOv+z59RlwqpBqyjY
 88vxzPn03Psz+rmz7Q2q20madDoIuwBJKCBR9OsTbvNNGVPdj55qjFS3Tya1a+J4LeZVTGrQMS
 Oo6eQHk27MrfebosJ0ZKpkU2yf/7p1ubG210xKRnGxofkfFiby7L8AB9DT/p6AgAA
X-Change-ID: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 David Hunter <david.hunter.linux@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 James Bottomley <James.Bottomley@hansenpartnership.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4542; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=ZP+a/lYHROshZoFv304670YZenCoDJjMnXixZoDRcgE=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDINwo0bpqxoOe038Uu9NjN3jfKUyjfq81Y4MkxhtPu35
 hqfv8iljlIWBjEuBlkxRRZGUSk/vU1SE+IOJ32DmcPKBDKEgYtTACZicZKR4ejxkwtn+4UkB5rV
 hN+NfvVD8f2DVPX17Nqp77iv6d6LWMDwT9OJkWea+xYlRXb22Iab1wWttdelcfyZ8ahn7byo6m1
 NLAA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

uninitialized pointers with __free attribute can cause undefined
behavior as the memory randomly assigned to the pointer is freed
automatically when the pointer goes out of scope.
add check in checkpatch to detect such issues.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@suswa.mountain/
Link: https://lore.kernel.org/all/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/
Acked-by: Dan Williams <dan.j.williams@intel.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Testing:
ran checkpatch.pl before and after the change on 
crypto/asymmetric_keys/x509_public_key.c, which has
both initialized with NULL and uninitialized pointers
---
Changes in v7:
- RESEND. Also, added Reviewed-by trailer
- Link to v6: https://lore.kernel.org/r/20251125-aheev-checkpatch-uninitialized-free-v6-1-2f3a1d78f678@gmail.com

Changes in v6:
- added declaration at the place of use suggestion
- Link to v5: https://lore.kernel.org/r/20251124-aheev-checkpatch-uninitialized-free-v5-1-0c523b1a3f5a@gmail.com

Changes in v5:
- fixed checkpatch doc
- Link to v4: https://lore.kernel.org/r/20251107-aheev-checkpatch-uninitialized-free-v4-1-4822a6ac728f@gmail.com

Changes in v4:
- fixed UNINITIALIZED_PTR_WITH_FREE description 
- Link to v3: https://lore.kernel.org/r/20251025-aheev-checkpatch-uninitialized-free-v3-1-a67f72b1c2bd@gmail.com

Changes in v3:
- remove $FreeAttribute
- Link to v2: https://lore.kernel.org/r/20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com

Changes in v2:
- change cover letter and title to reflect new changes
- fix regex to handle multiple declarations in a single line case
- convert WARN to ERROR for uninitialized pointers
- add a new WARN for pointers initialized with NULL 
- NOTE: tried handling multiple declarations on a single line by splitting
        them and matching the parts with regex, but, it turned out to be 
	complex and overkill. Moreover, multi-line declarations pose a threat
- Link to v1: https://lore.kernel.org/r/20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com
---
 Documentation/dev-tools/checkpatch.rst | 23 +++++++++++++++++++++++
 scripts/checkpatch.pl                  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324fb2399a5b1bc99c891ed1de10535..b6e02fb91e85710fecfc0a5e5c83a8e7f32d1d3c 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1009,6 +1009,29 @@ Functions and Variables
 
       return bar;
 
+  **UNINITIALIZED_PTR_WITH_FREE**
+    Pointers with __free attribute should be declared at the place of use
+    and initialized (see include/linux/cleanup.h). In this case
+    declarations at the top of the function rule can be relaxed. Not doing
+    so may lead to undefined behavior as the memory assigned (garbage,
+    in case not initialized) to the pointer is freed automatically when
+    the pointer goes out of scope.
+
+    Also see: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/
+
+    Example::
+
+      type var __free(free_func);
+      ... // var not used, but, in future someone might add a return here
+      var = malloc(var_size);
+      ...
+
+    should be initialized as::
+
+      ...
+      type var __free(free_func) = malloc(var_size);
+      ...
+
 
 Permissions
 -----------
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92669904eecc7a8d2afd3f2625528e02b6d17cd6..e697d81d71c0b3628f7b59807e8bc40d582621bb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7721,6 +7721,12 @@ sub process {
 				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
 			}
 		}
+
+# check for uninitialized pointers with __free attribute
+		while ($line =~ /\*\s*($Ident)\s+__free\s*\(\s*$Ident\s*\)\s*[,;]/g) {
+			ERROR("UNINITIALIZED_PTR_WITH_FREE",
+			      "pointer '$1' with __free attribute should be initialized\n" . $herecurr);
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on

---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1

Best regards,
-- 
Ally Heev <allyheev@gmail.com>

