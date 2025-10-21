Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372643161A1
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046257; cv=none; b=n6ZQFRVi6+3YBm7xBvwpRDjr53zrwzpw3od8ze7wqTSRgyIX19IH8KxM0nzFnZcTlLkzWtofGiswGJeZvrkXC0xQ/M6V2nMd9OCnDXVm4ceO9HcVL9jayVG3bZeuVky7xUm/XF+fgtQWPPLMyMibTi682v5UyZDLOMwU1BaSU/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046257; c=relaxed/simple;
	bh=Qqm6U43PdFmW9mwf9Z5RG2Er7n238UN+kS2H6VmO340=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gyMiKzlZSXZArR14ljyn5ddKVRf4F0H5HAAxzWzZ06Q+e1W2LRweV8pTHeA/jyKpgyWJMqz4Yw0o1Kwug1pSBas77t4t0MYUWL4nR+vdY4vL7UAgiieY4LHCB27HKBPmznKPQurQk/epVR5vRkpnxn5LdMw8WbDSC375Opxy+pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1Jvyzj7; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1Jvyzj7"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33d7589774fso3008827a91.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761046255; x=1761651055; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O80w6uBNepx97qYpZjIrk9wRlGMkcThPDiRTm+gTRIE=;
        b=Q1Jvyzj7uEXRVtnx27qBHNGBMLpaoLzQtW78EVC7/KyPniiH8Cax+lwj8QtkSBSeTb
         TUB/5XjmP9sVtdfCjkcOtz1/LqejY1z/a3oXuvqplIYr/X0APFKJG5wLKnvKZAiWMaic
         eNsI8DuBTAPFXhcxVr/8kDTvNzV2tOaQTb4UXRv2wWGyDfz0ISzE568+nCGR3D8IzVYR
         HESKBnF/xd4IO+9XssY9eBn4KH3IGSi82eUXknnAuzSNW48qRKh5Dl8CSWkV6xX2xl8b
         K7sSGnqYDr3Nv0H1MdinE87RpnKX3OZXaeWkcYnsCNvsPnMXPjPqXpb/02zUFiWLVueq
         uGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761046255; x=1761651055;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O80w6uBNepx97qYpZjIrk9wRlGMkcThPDiRTm+gTRIE=;
        b=hJxgalyuVxVRUq8dhdAAnYHkc5o4qwQYHOwotOzRXDDmBpGJIru/++s7Qyih7BHBxS
         8c8XIjVBYMRg0yoiM14XO47auziDygbfumO+khWhaq40sUAlARqqa6VcN+aGeKt0vZ8u
         qAPa57P03XsGIlIkkf4o3YqtaWOZkTWu5ym4DPZAnjWkeDkDDUxeQzULY/HfM94HJW1m
         odreTTjAMhhJaa2bxN3uvjsZmfYBiNE69DwtwgvgU7pva3o5wxxY+5hs5ecuV/4Im4cI
         MVarWHDzucwG//YVp3opemhWBN1qKP3jPLYRHm/J8blIblEvDAf1rD30CDg2RGdtQGbM
         +kNw==
X-Forwarded-Encrypted: i=1; AJvYcCXgNfAyourOhGUFPXQwBzVKRONSSHw7ax9bDvYfN4uxQDnss5KXwWKBWhWWYqsCcctH9mjhzEAuWJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoiyB7G4R3txNmgMITl1BzlaecpJ665yEgCsMxwraj0xn6SgdU
	YCQtxdxrDQz2bSSOTlNSImF1lg8Yo+5kpM+igK80zC0ie97pDcswcppW
X-Gm-Gg: ASbGncuuXAdbWE8H3ENs4acvpVenKTcd4xoLQzfF1+WLmemBVa11CA3esP0tdmJKIuR
	7M8fxuU7Grd4hcEZ9fpJjBBSSETVUaudaF7e+SqLVrwZzIfqv5FKXm9cyhEc+tr7QRJLfBVADDE
	toiDnTgb6LdyFPiWPzxCnNgRbSRZj5sXyzdVF3Qks0oyrf3kxHq2KgEvU8I9n9rqr6urIs4ngjF
	i9X+wLmPsEu5uECrH9fvGjjtorf3D+IjQSiN38/Z/LqRdjNbv02BbAARGPEPi23UMO9ZVnc9edM
	4WTcBz0TlhSvXlpinKhDS1FC2tCGOya/gzZG/kIdVyzKafUAH6heUGWRCAuZ8y/OELY8cja+nsB
	aLCMS+K3CpqWbwLLFOLSVv2FoQcWWDn3htV7BBwmL7yw7LHkcofnLBEO5tYXihO/w33Nf4LqkvM
	jGjJPVo4Dl
X-Google-Smtp-Source: AGHT+IFJmCSxAjrMISKkiBnZ4DKViFivlnMjzatYMYNY1Wsgm3nb2nGDtUzXGh+lfz7ieyS6UDWOrg==
X-Received: by 2002:a17:90b:2495:b0:33d:a0fd:2572 with SMTP id 98e67ed59e1d1-33da0fd25eemr7531901a91.22.1761046255417;
        Tue, 21 Oct 2025 04:30:55 -0700 (PDT)
Received: from aheev.home ([2401:4900:88f7:8f:303b:1c9a:7aad:191c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010d818sm11098221b3a.53.2025.10.21.04.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 04:30:54 -0700 (PDT)
From: Ally Heev <allyheev@gmail.com>
Date: Tue, 21 Oct 2025 17:00:48 +0530
Subject: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOdu92gC/x3NQQrCMBBG4auUWTuQiYSiVxEXYfrHDJVYklrE0
 rsbXH6b93ZqqIZG12Gnis2avUqHnAbSHMsDbFM3eeeDOC8cM7CxZui8xFUzv4sVWy0+7YuJUwU
 46PmSxgBxUaiXlopkn//ldj+OH3+pWJl1AAAA
X-Change-ID: 20251021-aheev-checkpatch-uninitialized-free-5c39f75e10a1
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 David Hunter <david.hunter.linux@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=Qqm6U43PdFmW9mwf9Z5RG2Er7n238UN+kS2H6VmO340=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDK+573alT31YHcnU+ttnaxVBr7F6z6EX/im4fU1tuywv
 MqMNatqO0pZGMS4GGTFFFkYRaX89DZJTYg7nPQNZg4rE8gQBi5OAZjI9BmMDGsmhFhEdApPnZNY
 cyRt1rspk6Z3zs78xGt7eHHm6rkHnS8w/NMtva77btdep39pvz2Ud/LzhLgue7nnk029FM+Kdzt
 PXOMCAA==
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

uninitialized pointers with __free attribute can cause undefined
behaviour as the memory allocated to the pointer is freed
automatically when the pointer goes out of scope.
add check in checkpatch to detect such issues

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@suswa.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Test:
ran checkpatch.pl before and after the change on 
crypto/asymmetric_keys/x509_public_key.c, which has
both initialized and uninitialized pointers
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
index 92669904eecc7a8d2afd3f2625528e02b6d17cd6..33cb09843431bebef72a4f5daab3a5d321bcb911 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7721,6 +7721,12 @@ sub process {
 				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
 			}
 		}
+
+# check for uninitialized pointers with __free attribute
+		if ($line =~ /\s*$Type\s*($Ident)\s+__free\s*\(\s*$Ident\s*\)\s*;/) {
+			WARN("UNINITIALIZED_PTR_WITH_FREE",
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

