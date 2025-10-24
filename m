Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2FC343D93
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761326991; cv=none; b=tPbaXGSxLXXUtYgiTSqGX/UXU65GzE/u0rnFYG6EBnb7tg122xAdosZV76UOhXtP+HVj0wBlD/KlnoZvYf80egDQgIIkLsngDm+UqI5pDQ411lrVCEDWFMxC6Gb2LbPaxFjiNKnCbw1ZW8II5SEooR3/DgepfMW/PhWVXgfEg1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761326991; c=relaxed/simple;
	bh=Xl1ZEjB6ltsTv+GdIk8hnYCDz0VvFiu1/vVtb+GptPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTjugGNE99ox8lbXTPLIrEY7MIe0ztX15mLiM6m1LKKAaJOo8EUDz0J7qFJgg/E5L9Y2DnaUQ02lwryfjORV7bnu8weYaQaa6C/hG+lymeuu5DuwHHjoVBhxeu5GtOwju2Gzc18nEkc7ykBFzwH04GKatpqRG8HPkcFjCUX33jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlHMHNTK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlHMHNTK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-290a3a4c7ecso26356655ad.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761326989; x=1761931789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YGZjhDld3XGVawWdcLieeak1oetbhYlwZ5IHuvKrKU=;
        b=LlHMHNTKrafpfHNElhVjClNEHSP38WSmXhrhAgbgAHolzTQC3ECaiQ5XaULeBzTuk2
         A8lLOLyc9en+3hEZsgkuKjYx3h7RKUZ7Fc73NCCWPptBcR6t+JaSBzibFAWVbWEvlF3p
         Cy0He5rjOgmj3ZT+358EJtLsgD/2dMQauESSyaPSLEJf74HDAm2PJzbMnAVPl92tyy6z
         zkrx/ZehYjhkokc+XngOyzj3Mc8uAjfe/WYNBCZWfnRdw3VUcTuTj9oqNhvsgUJs2/+9
         2qGjfpxDymto/9lCzcOmmkJEWYmWxIyY2dyJPzWIyfxzaE4xRI6eeQ/6s25tQQ4B+/7C
         lFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761326989; x=1761931789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YGZjhDld3XGVawWdcLieeak1oetbhYlwZ5IHuvKrKU=;
        b=wTyYHPA+kNQCsR06PuLkQIUwhMqUlDv2pUxN9JZDwVblYQXbQmZFIOUcfJz6MCdGJa
         ZMObT5C175tzSpEUVqSNgHmipdfC8OwlQJZsmXhRGOWvffagy4DfXhJmFNHzLnNTty5h
         +gqPO1BDVQa2B9cEbf2Vi5ubCmXqtvBgEusfY4tTThWbAtSYyHKSzVnaqimrU3U8ad4L
         oaZVk3/3dvlMz2OhwjjfzAptBw32NWvR3UBQMtzA409dioSh+J3x0jsQS9AqghApz2kh
         nDh03wbv1OBeUGQF4+1g5rzhuB3JzfsWcy5+GXJcOchuO3+O3TsbtATJs7ow2AeoEyPG
         /QDA==
X-Forwarded-Encrypted: i=1; AJvYcCVkGvlayyoj5ePmX6Ca3duCw4wxnDNeLDPXM5HsrDXyyaSB30rSvc2NX64MH/jxjFLHcjUo/cIkIHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++Wnz9puYqFAGjeMA+9l9Ab3mCsTDoYI1isbzjpTt327nP81D
	X7IkV7NQwCB3H7OWiKdTf91pfJT8KJOJpIPw7bC/mVf6Xp8EuydUFBhokJllfsb0
X-Gm-Gg: ASbGncvFJIHHqi6L65bAlYSI2mmgE3DVyXemUKW5zgFQGi5ogmYW+CKqXZZiyQiRNVb
	+34OVoNHdEWxZtEl0LSmg93bn3i0xape+WEWUQBm6bLAYXFkT3fxtDo8Vbk1sDlyeOaU7jBraFn
	7w+Et07VRfQmly8dvKEiKRW5bTESpJIFGezcVXgT8yE4w318lG8l8Le9Mkg9TjUnhc/3Gg9JdYm
	nF56BKWsLgfLb3vZfIdjNxngvZUuVe7duy4xPGxRBCD1rBAFbuF3SNWhevlPvMXvooh/cyy+RRK
	yd4dcz1TovEd96ybNabs/9BckcQLqnDPwGg8x4CkytQR6EqVx/YoAWfBmGfDzEh1ZzmKt4USmB9
	MdlWnwFw4bp4FGnh7bCDr+YjSom0UsJg4Zxr9xW7RC0xZ/7CQ+XOdqziCiVRAvMcdRUhpQqjsi3
	oZR90JyBkVAg==
X-Google-Smtp-Source: AGHT+IHE0gPsph7LiBH8wgoEMRerWEq6wtBoH2k0IpyoAj24E2cHMZ/NGysGmuXYuYid0ecv9CML6Q==
X-Received: by 2002:a17:902:d510:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-290ca216346mr354011385ad.33.1761326988612;
        Fri, 24 Oct 2025 10:29:48 -0700 (PDT)
Received: from aheev.home ([2401:4900:88f6:d7b0:8f5e:ff90:677:7d74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda85e7sm61719615ad.11.2025.10.24.10.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:29:48 -0700 (PDT)
From: Ally Heev <allyheev@gmail.com>
Date: Fri, 24 Oct 2025 22:59:16 +0530
Subject: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
References: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
In-Reply-To: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=Xl1ZEjB6ltsTv+GdIk8hnYCDz0VvFiu1/vVtb+GptPU=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDJ+b68xNKwQFG997/XXQdTxPc8Zo5PSrfsznq83iYrYs
 CXz73/djlIWBjEuBlkxRRZGUSk/vU1SE+IOJ32DmcPKBDKEgYtTACaSE8Hwv56B58GrkLmy/z2N
 XucVS1sIWBZnWpz1PWVW67Naw79fgZFh3w0nwbMLJf8aukYsnrzMJDpWpFOVP2dlZsGhudLnbh/
 iBQA=
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C

pointers with __free attribute initialized to NULL
pose potential cleanup issues [1] when a function uses
interdependent variables with cleanup attributes

Link: https://docs.kernel.org/core-api/cleanup.html [1]
Link: https://lore.kernel.org/all/68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch/
Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 6 ++++++
 scripts/checkpatch.pl                  | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 1a304bf38bcd27e50bbb7cd4383b07ac54d20b0a..c39213b814f487290d2b0e5d320a4313ada9bbad 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -1015,6 +1015,12 @@ Functions and Variables
     in case not initialized) to the pointer is freed automatically
     when the pointer goes out of scope.
 
+  **NULL_INITIALIZED_PTR_WITH_FREE**
+    Pointers with __free attribute should not be initialized to NULL.
+    Always define and assign such pointers in one statement.
+
+    See: https://docs.kernel.org/core-api/cleanup.html
+
 Permissions
 -----------
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 1009a4a065e910143dabeee6640b3b3a4bd3fe06..cf186dafc191f1c39d01b3660f19101f6cc61a82 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7728,6 +7728,12 @@ sub process {
 			ERROR("UNINITIALIZED_PTR_WITH_FREE",
 			      "pointer '$1' with __free attribute should be initialized\n" . $herecurr);
 		}
+
+# check for pointers with __free attribute initialized to NULL
+		while ($line =~ /\*\s*($Ident)\s+$FreeAttribute\s*=\s*NULL\b/g) {
+			WARN("NULL_INITIALIZED_PTR_WITH_FREE",
+			      "pointer '$1' with __free attribute should be initialized to a non-NULL address\n" . $herecurr);
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on

-- 
2.47.3

