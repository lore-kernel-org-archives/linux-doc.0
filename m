Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443EF288C26
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761378986; cv=none; b=NNTO7QXxcN5QCRM61kQYvp+LYyWzJcJ0b46AvqscpS9gmlvtyROGLsSR+MKhvraz2ofXUAQu0WWenpsq1tGrrNyu9d3yYaYLVaSbWKZsSX+ymQS2nq2eKwyDodE38BV0ym58t8DtmBsld6RWCwgzPCmriyJeuSCn7D3CjkT1kNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761378986; c=relaxed/simple;
	bh=8gVKaVr7mQmOCkjXIqbeVzWh9yXzYrSkI1/lFkAQbAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rU9YQksTKrGlCsP6IdMhjUdzvov/1jPhoUDcToGIhSB+tnY59onxzoQoRuoGUKBmYtX4kK1EOFy9sHYIDhM/FhbDaTBK3ovZOtDhuHU9FLsXgmhMciUgZTaSuJvVhmf7eIwZBKs4yfO2gJblv7bNuXk0Q5Vxbj9rEj7l9N25Ae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJRNee8n; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJRNee8n"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b62e7221351so2551569a12.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761378984; x=1761983784; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVHEeVvTfnJjIr7f3Y35GS9oBs/K0+nn/6SC3ws73x4=;
        b=YJRNee8n9DdtETcheWWK9DAAMmmpVXlSKbKke9bNZZ8RBXadnfNIzrNkJLjN8m5Su0
         M67cLAndjhFvsHhevq2kCF9aC/+IqxsBHjPZINIcS++u5SVRMgihEP3ftVOwP5zmbSPS
         e0rAU9hRV6q0TxK7U7LAkljCrK5OtalWSSnu5N/NmL0tkWd4Id988balyoatENTdSQZt
         umNw5Xf1jFEkrsYgQN4uTdXQqcsMEMKoAVirCPYJ7Kdu2N2SKJoPvCxoPf3Wdj58Qd83
         jP2YP9WULeVc5X6H5TMFtMyCDKVmezHf4uXX+YS+kpNHsrQ/YBRVSaBmtAOVnk8JNHrW
         mT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761378984; x=1761983784;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVHEeVvTfnJjIr7f3Y35GS9oBs/K0+nn/6SC3ws73x4=;
        b=InRkOwIRJtUQTTElXiFfoq5CtlwEGyh2zr/STkhWl3SUWsYyabQJ6cu407ZPeOBw72
         ZREDCaTi01T1QT63ZZx7ynuyLA8PYgML4+UDKcqQVECmZsDMa4GtHUDyBqf0Q0j8/zAy
         o8o7Y1kyE8cv/PiV/05FRogk6X4RSN5bRM8TvXeWrjJcpyD4BQ3R8pK37JdQJZt6p7j1
         qF6ziw7UUzOKnuit5SMrUqJ84oZFc8AO8F4JZYIkNN3/ZFmusiEpSpdcjfcmoRxXsOGR
         riDOD4wPM6+c9cBerlZTH2eeI114+BBoPFoH6i5QAygDkrsRXqbsztObUBw3IJ0wdxYd
         KdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfzS7jh4J9zmsaULnU8kE0bNZWoifmJ+ezh0+5VUozww3B27u5Du4FqdgSR7N9++nv51Jjy0fAS14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqspeHoKVlpE48z18xrd9kFszXAgLTkiqNlOjDB3QhYwsC06Dg
	KpT8KUNf78h7ofJ4D47bLVuv46ik5TzjGOzrXn7Zzvt5SVBPwTrzX5S4kjTRmwix
X-Gm-Gg: ASbGncvwvcIliuyEpBzUI8ehFVhcW14mq9AfjWc4rqrrUuvXXLAnKbE9PWb6GRE8G07
	oHethZfhpOi+n4WmqDmMOAgdRkvqeqdFa5FKu/sQYroCXQXe0FAcubCvaKQFoDUqx+Rpo41rdBh
	0PY0fdTQ9WG+GNY6NpBhvvwf9WKNFsBoSF6YXa+q1NUaMfiI/aANDx509GpVyfNkf/LZqd+MJ0p
	xupDt72juC8WLDwRMqRxZDxH1nM2QCXCbSG2/RHXFEX7bdKz0Pxd7u7iZir1Jh9NoOoMd2MvG3X
	9YEYwm/a3YpNM8usbgkgwvVqfUhfJAu4Lx6AXnfChTQ8K2I/ZX0XKdBArTAS76g9G/kKZThHV9k
	oqLbwkc1dwoI1GxvGD0PD4nXGgBlVFZSvKts5zi41gpmguc159Q23NreYoJ3tKEHwX7rkX2Ae04
	o=
X-Google-Smtp-Source: AGHT+IGwvkVJVftLc7N152A3XNiMYQcFGtvvfqDROQl6klMasXSEkx7383k2P/ZS1iFavUlMTbLlyA==
X-Received: by 2002:a17:902:c943:b0:26d:d860:3dae with SMTP id d9443c01a7336-290c9c93ac6mr393490305ad.3.1761378984475;
        Sat, 25 Oct 2025 00:56:24 -0700 (PDT)
Received: from aheev.home ([2401:4900:88f6:d7b0:443:a828:b6ba:688d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2333fsm14806285ad.50.2025.10.25.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 00:56:23 -0700 (PDT)
From: Ally Heev <allyheev@gmail.com>
Date: Sat, 25 Oct 2025 13:26:16 +0530
Subject: [PATCH v3] checkpatch: add uninitialized pointer with __free
 attribute check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-aheev-checkpatch-uninitialized-free-v3-1-a67f72b1c2bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ+C/GgC/5XNPQ7CMAyG4augzBjZKeVv4h6IIQ0OsShplZYIq
 Hp30k6MIE+vh+cbVMdRuFOHxaAiJ+mkCTmK5UJZb8KVQS65lUZdEmoC45kTWM/21preengECdK
 LqeXNF3CRGUpb7N22ZEJDKkttZCfPeeV0zu2l65v4mkcTTd///ESQb+cqpMpuzNYcr3cj9co2d
 zX5SX+b699MDQi0sbhH5B0V+G2O4/gBfu11rSoBAAA=
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
 Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3095; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=8gVKaVr7mQmOCkjXIqbeVzWh9yXzYrSkI1/lFkAQbAQ=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDL+NC26H2nLc7Uj8V6vE+M+NhPOxze5JdqevlmxofwPT
 5PvHr/FHaUsDGJcDLJiiiyMolJ+epukJsQdTvoGM4eVCWQIAxenAEwkYSYjw5q9EzSu7MjpOla/
 ck3tB+cC/3M/vSJ6bZLKq1Kcb6wPiGVkaNr5ZdWWds/3zE+dY3+2Sk+80qK7IPban6u7znnW+f+
 8xwAA
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

uninitialized pointers with __free attribute can cause undefined
behaviour as the memory allocated to the pointer is freed
automatically when the pointer goes out of scope.
add check in checkpatch to detect such issues

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@suswa.mountain/
Acked-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Testing:
ran checkpatch.pl before and after the change on 
crypto/asymmetric_keys/x509_public_key.c, which has
both initialized with NULL and uninitialized pointers
---
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
 Documentation/dev-tools/checkpatch.rst | 5 +++++
 scripts/checkpatch.pl                  | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324fb2399a5b1bc99c891ed1de10535..1a304bf38bcd27e50bbb7cd4383b07ac54d20b0a 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1009,6 +1009,11 @@ Functions and Variables
 
       return bar;
 
+  **UNINITIALIZED_PTR_WITH_FREE**
+    Pointers with __free attribute should be initialized. Not doing so
+    may lead to undefined behavior as the memory allocated (garbage,
+    in case not initialized) to the pointer is freed automatically
+    when the pointer goes out of scope.
 
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

