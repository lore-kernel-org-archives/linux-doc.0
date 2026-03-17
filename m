Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E0E3E95A7
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760353; cv=none; b=YO0tA31xhK4enel06xGjJv5vwImp7yW8k3EOGVgb9hZ6LmfcYnxSKsBaPXYRzSvp35WXAQ77hFWwulCDp31AgUoBt/k6wsreNRA5BGHX72F2es2hXX+Z3Zv2OktG+ARSd8kMxkbwfOifymabQDl9CinSttHJzfg7WZSh5tyL2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760353; c=relaxed/simple;
	bh=ElmNSzj36ahoXwShZ7ULHU6+01vzlQ4NHHLLRiYgGxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eb8m4HotzV+8zq+4hrsjXX13m7C8mDwSTCLtnURJM776lmN+y43LI7BuXry4uablhfMEIZ5P4c+tTFrdjSlzCk8y3ZDv6NlACgWWe7PkPcKn96biMSDVwUmXKZ0yvHmdrDxx2yxAz58100ejlQpHooc24bABlkjGOkZfRk/A12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXl7RI9L; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXl7RI9L"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so9786306a12.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773760349; x=1774365149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VoX0sLLhblCiEStIbiYJ15WT9ZZm3Qh1HEveUrVMolU=;
        b=gXl7RI9LbF78N95CqGOM2TXN6jazS1z8B5nh8JpDCHm2hlXoKv0hMmCoJHglbd9qD9
         Qcn+MxmZqt2MVkNJfcuYIz2DjLWAy7U7TmojrSrvZDgkIMRPDQz2mBymNt3eWmllgqAb
         YiIWitQ7FCQbybkb1blmjGMPIDhyMnBDqOKB4uLoS3uKTMr7pwjqzfE7y3F75V8JBY+N
         p+Lz0d9VGeUzeCDS0ffKkEmB3k98G4WX5VD80cju0s5TdiMbfXDoaU8skGm8+DhGuiLB
         CtQKU3RsbQnrFalL9ZHm4TD0CEC0mwIFqpTit7TpO0tBOSeKWRHMznsZ+5LcUIY9LKEp
         SWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760349; x=1774365149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoX0sLLhblCiEStIbiYJ15WT9ZZm3Qh1HEveUrVMolU=;
        b=W9xFOKbN/Y0vebJfvZCmagg8II4n1vbgbp8TBuwb4ZDm3aqJTzv1neP1V5dAZc6tb3
         EvasiQ8Y7GAv8mcDX6KHEEVD2ejJN6C7cp8oG/G1gjy8XOZnjEKYRIP82W7CKigSPqVV
         VDHOCLYyDsHWC/WTssxL8tsDRy6bSObwEUKaKjcU8zkAomZkjsMTqmASqdAJElOKsBHf
         QzAwXNa5sRAaBfuZqd2/V3+qMBdUK5yOHi0BpsNFuls0c7PToRFCwo7Yh3BnxOnJYiT5
         NEUUPUmDOvXBEiSnoO9ohLAuXTqr1tbFbHqM06ZmLAn1WHuJA+GWNUFbZMnQ/oRvyRQ1
         tu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYY0i9+V5kmZsWPONApi/xSUBkDLSdzyI7Wczjf6PW4gNt6QpFIrRVAb+ONfuFwwhhR5a6Tq82dpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2U5eI2zQ2wTLiLWPf7Mg0nMZ9uMdEwKSbh1ZkLseY9Lbug/Hv
	cnz6rnuiJI+DxLj7qSXSOKe2C7tTYLfh54UIh5cJnY/H/+AcuAx1zL9h
X-Gm-Gg: ATEYQzz9fDQ/SDJSp5URX9X4gYIYJ20aIXM8XasnJh6U8Npb0xBj5xpuMlXgTJccUbL
	s4ngEiAVdwcgCmmWj7IVUDhPCRz218BraBjF4QkfBWt+555qvTr71WamA6tj5eZTsDqaS/A91sF
	OHdPpLOg8l1YL1VaD7OuMI15jAwQME+uTVmPxchsUGyMJATelPSxnsUrmgMVw3WwCCt69CRQ+vn
	qI14o85lreLP8tYz21TPp+8hXvQglAJb+MCAoG82U+DDAgtvF+2ShmobiF11EqJyvibSvzvpHmL
	5nwwKCfnMpEo4gaKU5cl2jLdXtW019mCCFly3uW6MqGa95uKxlT9tcNvGoCXRLWDx06QWS2VLAZ
	+HiRibqkQVDpBT5AJ2RxEqWjrb3EKF2GARYzoC5F3laSXmBLzC+S24mqPqXd5MNXqrzMCvetbBe
	ZZVAvMZuuq+7KHVDZBUjM7pK6oV0gjI0lIScwYKJaSkBwh
X-Received: by 2002:a17:907:7fa2:b0:b97:ad82:973f with SMTP id a640c23a62f3a-b97ad829ee0mr546189866b.13.1773760349135;
        Tue, 17 Mar 2026 08:12:29 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1460749sm3876966b.26.2026.03.17.08.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:12:28 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH] docs: fix Sphinx C parser crash on __cond_acquires macro
Date: Tue, 17 Mar 2026 11:11:56 -0400
Message-Id: <20260317151156.1106-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the kernel-docs, the Sphinx C parser threw two errors:

1. /home/code/linux/Documentation/core-api/kref:328:
   ./include/linux/kref.h:72: WARNING: Invalid C declaration: Expected
   end of definition. [error at 96]
   int kref_put_mutex (
                struct kref *kref,
                void (*release) (struct kref *kref),
                struct mutex *mutex)
                __cond_acquires(true# mutex)

2. /home/code/linux/Documentation/core-api/kref:328:
   ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected
   end of definition. [error at 92]
   int kref_put_lock (
                struct kref *kref,
                void (*release)(struct kref *kref),
                spinlock_t *lock)
                __cond_acquires(true# lock)

The root cause of these errors is due to the parser's inability to
understand sparse __cond_acquires() parameterized macro attached to the
function. The parser expects a ';' or a '{' to verify a valid function
signature ending.
As of Sphinx 3.0, the parser is equipped to handle such cases via the
c_paren_attributes list however that functionality was not adopted.

Out of all sparse/compiler-based context analysis parameterized macros
inside the kernel, only __cond_acquires appears in the context of a
kernel-docs comment and function, which is why it is the only macro that
threw an error.

This bug may be attributed to the kernel's recent shift from sparse to
compiler-based context analysis, increased strictness of Sphinx C
parser, or some other change which transcended domains.

Add c_paren_attributes to enable Sphinx parser to handle parameterized
function macros like __cond_acquires.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 Documentation/conf.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503a25..f2efe7fd107e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -227,6 +227,13 @@ c_id_attributes = [
     "__bpf_kfunc",
 ]
 
+# Since Sphinx 3.0, parameterized macros must be escaped using
+# c_paren_attributes to prevent C domain parser crashes.
+c_paren_attributes = [
+    #include/linux/compiler-context-analysis.h
+    "__cond_acquires",
+]
+
 # Ensure that autosectionlabel will produce unique names
 autosectionlabel_prefix_document = True
 autosectionlabel_maxdepth = 2
-- 
2.39.5

