Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA2304975
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762498624; cv=none; b=IB7T1hDAxNPDAPGdIn7N8mSaSaqGsyaZq2bRwwDrOGv+wDYWrA725Z8rdBqIzuuCuNOk6lrLJzSgHPId6TlYE8+ax1BtbkwJ0sN8T1yUF2/ALKh5kD98q8GcHkdimRr0QHBgSNMsVLJOM5EDP5Yn/tKRv0/ZgBc5NBbd6mW0cKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762498624; c=relaxed/simple;
	bh=dEoAQlDjula7pctyUbkZHKZiXPu7HyyKFoKr49RAOyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FkLjJyCKIbjJ35O42DmM/fJy7Jl7/AqIJw8N/DI0YmKO3tLK5+FrURCnbejZNoPYkyQhK017RHMlsXnJFWkBgnmvU+J4pbPib38jw5BMXyJ7CQJJqERIhKPKrMCROP7bSN69ta2MDANlLF2mqbRT/HZp62oUir5Wv4p8KmBQwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aADOaDyN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aADOaDyN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-294fb21b160so2888035ad.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762498622; x=1763103422; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4L78wFFbd2D6WinvL84qOqWu0QhYhf7xLaDeR8oHR7U=;
        b=aADOaDyNyHUmUWIIAXd+ZejDKtSN7/bUIgjqqYCUmqoOaIIL5xe09lbI2xPm/ONWBj
         hXQqYKOfqVN2E8e9TAbnVadzv7v4R3Wf9twfhZtvQkV26QXKEXJe6sIvdTiJTeBaY9k0
         CTvbfe/j1QbPKMtgrgKdrUkVPoRPXkLtjVeT0Fj+E4jnGFXld4iM9mNtApQ/yk5ULZ30
         iDkt5ThcYtxmgQwvCac/BAre6HHjqyHK9PsuGR1lrTalK9qcWshzQaY2g+PdNgevgiae
         9ECKKP7l1c/OY/rf58Uf0+gnP/JOBNSq4mem6goS62ZRqg1TLLIkA580BXBQoVUxgNZ6
         r9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762498622; x=1763103422;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L78wFFbd2D6WinvL84qOqWu0QhYhf7xLaDeR8oHR7U=;
        b=XXuemE2uKYNBJGC9xT8Sh/qutG5qpkooxi+8tx5rJFWPk5KWmwYMAjFR055jQ5tpsj
         yUkhh4a63fDCGXD8hQunspng68IYnoGbvf7tyOvr8B7Z7G1e0qOf+6Rt/gu/p5SVSjWP
         W2EnrhoKx5jEh7AdS/Z7+3sDG2OBxeYUd9OLFwWiLPhc0C2wPzVmTiLC881QofpAnLL5
         ickCCzcYM/i2Qn//wL6Y83H0au/0LXslVYDynBXf3YyFBQHAV8xXxfdAfZ6Mdk1evnWG
         A8QT7zk/3Hw0Gi1qtmagqnuPKdqVnv8WwW3K6UAv33d8dvRrjs5nYor4aVCxH6jr94AN
         PifQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjEtrp6MA6cU+EMT4xaa+S3O7Qo6eP5KS0McVDef+d5lcy0A3BvFzVXkWyk6k9IKTx39rLqnlqiAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztekrS8KdNJWXIQDV7I6AEl9P5TDKUSHzPi80XWCkCpEOuPB2+
	hHxIB5QDTgJinfyLciobZe/6FfWMG1ENoFseijAOzxNT1jIqORNvHXfc
X-Gm-Gg: ASbGncv80DzSq9Q1d9sL5aACMm9PL1G2/WbnxR7lRrm2o3iu6cxL/iERBmyM75kN1TU
	bRIAR5sWDARNb4yaqCM669mEWp1utPDyUfssyGhHl7NIxRcuS15drJos5HQQ+zG5hO0Kzt+YMfp
	Vwfo+ihlXMvOfWAlMET3j91K82fCeP/DumWkxXicNMp73OOiVbTJhxT+ha2qxEEClTRcrx3k7cz
	6TAVoscd+PgTus5QpBrhh+RSZ+iXglskC6rjlIyoYo6e5IklgDkxMvKmDkDvCDM2gG2vXaOZOFL
	PBuElzdIhyVUSoU6yOUbyqWW6nmL1mUUCISpk1XcMUo6KCvTWs3LfrWGfa6vgT4gdMFVwd+PEIp
	ZTDjl78jgRk41QqZVpG19pMR4Zne76cNqsCuxHhnAtF/CRrBYKlktigN4i8jd9Cz9RUR8OcZnlS
	5aZklivhcSKMM=
X-Google-Smtp-Source: AGHT+IF3Vy6KcOxR78JOQeAXsqh7rCiGlPIsju3yWhPo6T8QkF3gVWgD6pBhu60RMpEiu4wUNrpw5A==
X-Received: by 2002:a17:903:1a85:b0:295:ac70:10c4 with SMTP id d9443c01a7336-297c04575a6mr29799855ad.47.1762498622121;
        Thu, 06 Nov 2025 22:57:02 -0800 (PST)
Received: from aheev.home ([2401:4900:88f4:f6c4:d67f:d090:f2ee:1569])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c740a9sm49443185ad.53.2025.11.06.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 22:57:01 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Fri, 07 Nov 2025 12:26:50 +0530
Subject: [PATCH v4] checkpatch: add uninitialized pointer with __free
 attribute check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-aheev-checkpatch-uninitialized-free-v4-1-4822a6ac728f@gmail.com>
X-B4-Tracking: v=1; b=H4sIADGYDWkC/5XOMW7DMAwF0KsEmsuClGM76dR7FBlomoqIJnYgu
 0LawHevksnolILT/8P7vLlJk+nk3jY3lzTbZONQwvZl4yTycFSwvmTn0deEnoCjagaJKp8XniX
 C12CDzcYn+9EeQlKFWqp9aGslZHJFuiQNdn2sfBxKjjbNY/p+jGa6t//zM0G5XeiQOmm45ffjm
 e30KuPZ3f3s1+b2OdMDAjWCe0TdUYV/zWpt1s+ZVfmTmza0viPxXb82l2X5BTiaaf9+AQAA
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3284; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=dEoAQlDjula7pctyUbkZHKZiXPu7HyyKFoKr49RAOyU=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDJ5Z5gzhKXfa3JNDbHhfH1Arb5uw5+X5+zORjruyLNm4
 5j6T02ho5SFQYyLQVZMkYVRVMpPb5PUhLjDSd9g5rAygQ3h4hSAiTiUMPwVOFNa+KumpyHzvPam
 7EPLFJ6VH7Dr8moUY0lsCXNaX/iZkWHG6sIshWmNPv8Cc/TNgvSTHrexHmMRVbjEMd9u/TKHNj4 A
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

uninitialized pointers with __free attribute can cause undefined
behavior as the memory randomly assigned to the pointer is freed
automatically when the pointer goes out of scope.
add check in checkpatch to detect such issues.

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
 Documentation/dev-tools/checkpatch.rst | 5 +++++
 scripts/checkpatch.pl                  | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d5c47e560324fb2399a5b1bc99c891ed1de10535..c61a3892a60c13f7c5ba89e969e39a93a3dcd5bc 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1009,6 +1009,11 @@ Functions and Variables
 
       return bar;
 
+  **UNINITIALIZED_PTR_WITH_FREE**
+    Pointers with __free attribute should be initialized. Not doing so
+    may lead to undefined behavior as the memory assigned (garbage,
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

