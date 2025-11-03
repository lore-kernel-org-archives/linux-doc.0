Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61382F851
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762138818; cv=none; b=KQL8XIfR6cbk+UE/0/qJO8S6mjYyO/CtW9f9bM62ZG5rxIrKUVR6vSE848KhXfPCsO0MWUIQxCl07R3Tg6cWHoTvEbwzgrTW9HpZcRsqtnRbmvB6/2MdNA9SvNu0hPkAn1fir89xdKEQ+U6IxRlRY3BhnGkCUhAewQDDuNIRO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762138818; c=relaxed/simple;
	bh=2bSH6wJGMCkCLcVdvYI602cwgiyzgPLruCtTX7O+gBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxlvUYuNHbpZbX7L/aotwA75l38vzmDOFSf8BDlZJI7z8LpjxhpsJccgKffq3OexO5GXnuNlCdwMWtfK2a7VHg7A6/wq4/1weGXRLQc8MfiIL4SgcgUGFQVPkzU8JM1DiBVkua8IuZp1/IMYiZM3GFQ7oGCIQUJvOanHW+5U+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiQS4k4j; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiQS4k4j"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8801f4e308dso37338976d6.0
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 19:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762138816; x=1762743616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5ZbiMx3qqtfcVjWwdialQet83TR7IyJeUH1x2oAlJ8=;
        b=OiQS4k4jB0qCF9E9ZcdDisTxfVF6d+HrONMYzH8ti8fAyJ2qUjcaKXRwh+mecqn0EI
         VQGs2mFDaXRvUrf/DgO5caP674fRrOPR4jFwSnOvhjp1pojs2+Xc+mBFiMt7ydByxDan
         rI9UGk5n7dDZCFlbJl6G8h3YEf2Wi6lfWgjGUkFyHdzkS9ZJtIoPtRhAcFsBKICo+AGj
         Af7vS0ZMilw6Vw85KimWAf0R1gevdB1Li6l5A7n9NCMd9WgsbOlniTGZGgr2fq7qqn/3
         pHKv9kKCZ7mm7wK1P4N94B9vwCO/Kr2gKFVpDDgH97ifelLeQ5wbKYvW90hzzGkqyUw9
         Y+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762138816; x=1762743616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5ZbiMx3qqtfcVjWwdialQet83TR7IyJeUH1x2oAlJ8=;
        b=Tm0B7CwjzwddnZ2YynJsr0gQgGuuFCuktl8on/1UtxV8pAt+yIvKvgQ7jVrb5BswTA
         mFCz9uaO4hR/xHAhkDiA0g4r6kzG4QmkXepfZezekv0x9g6Kw6JNAf5aXbXJYdM2YQqm
         e2yUfNOqO2STkzJ3LU3YuO50/Qxwb06dEg9uu64CwRC4PmcxLbwvtQSC6MmwjS3FT5tq
         Xqw60YithPXYgBvUPBgpYRNc5Xau4M2ipQ9xc+9TPWx9REbc9/vXmhqhGjZ3oC9jDrYk
         ErWO+M5Q9Fo2G9FNTTGxiavc4FkY5dhuiNrkhp6qtA8YTF0H5qNF7vhpOOCH6dv27iDq
         VUjA==
X-Forwarded-Encrypted: i=1; AJvYcCW2xUkK82vKxt1duwz45uV7e2hE2x1JkoTUVqaLeseq+aVS257cRgn0TbQaIwn7JuW+G4CyuCPc6PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCF45b7WUsS9Gn/Ra+IQSXZzCL6sD/7qP6qfDL1RPCjzhkuXA3
	v/hFLiqh2NiQ/AuuL2ysTMiPXGmnCi4Ujv5Oi5q8pVVyiaCWvfcFAgvb
X-Gm-Gg: ASbGncsOE1rtf2ytNO/OJm0GkIiSEXPwl+2PITJ9XWHQcfmb87gQXUFS49ZneVgmFx7
	hdZzXYWQ/9sYqafsawl5Meh0wtmTUByLss38KforvupmvfbhFGefS6KQGC94OIMCYHbY45WqHCf
	QG/KPc9jkV8fVrqStR7aEuiSJVzWXMLYyZpInaTxQTjWOHIg/NTCwShAA+QSkp+ycuxZp95StU6
	BYfDR0OEtp8sgVCnNJrbD7ppryz6YpD7CGw0jq/yJZFBmRYhBHaW+RiXdl00julctf1TV3Rh+Dj
	s4a1JmuYktab90JMg1KgBGvEQLIhc/LZUQC1M5eJ1O4IX+7xlp1vkl4+F3jrtk6mRFj3OQkKOxk
	Nst7pZy1FfPBnpoFy66+LMPXLyDTp2QpC68lgEC1T/UqcNMstVqY5n09fxUg523tj69suyGIngb
	GZ8t4wp9hU7yI=
X-Google-Smtp-Source: AGHT+IE9q6q36jFoYush26+7zuM0CA2YJRuXZnQbAUDeAEDIKmfEKoJBQdpgFxpRDvqs6HCo/ISz3w==
X-Received: by 2002:ad4:5d45:0:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8804eac9381mr63546746d6.57.1762138815676;
        Sun, 02 Nov 2025 19:00:15 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88051e1a353sm21830446d6.1.2025.11.02.19.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:00:15 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4730E41C0600; Mon, 03 Nov 2025 10:00:01 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Accelerators <linux-accelerators@lists.ozlabs.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: uacce: Add explicit title
Date: Mon,  3 Nov 2025 09:59:50 +0700
Message-ID: <20251103025950.23159-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=bagasdotme@gmail.com; h=from:subject; bh=2bSH6wJGMCkCLcVdvYI602cwgiyzgPLruCtTX7O+gBQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkcUs7iu01euO0/rStaM0/LYUqHj7ZBOpfjyX9vk4Qk7 hVZN5R3lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCL3HzL8YuIov8ddLWEwYdvv Do16oW+nbXVXOMzu7Pj+8daJl5KNcQy/Wc8dPGA9gcN/0c/HJgfMz4vZM097krj/w4GPGTvrWd0 nswEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Uacce docs' sections are listed in misc-devices toctree instead due to
lack of explicit docs title. Add it to clean up the toctree.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/misc-devices/uacce.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/misc-devices/uacce.rst b/Documentation/misc-devices/uacce.rst
index 1db412e9b1a380..2ca539b7d6c799 100644
--- a/Documentation/misc-devices/uacce.rst
+++ b/Documentation/misc-devices/uacce.rst
@@ -1,7 +1,10 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-Introduction of Uacce
----------------------
+Uacce (Unified/User-space-acess-intended Accelerator Framework)
+===============================================================
+
+Introduction
+------------
 
 Uacce (Unified/User-space-access-intended Accelerator Framework) targets to
 provide Shared Virtual Addressing (SVA) between accelerators and processes.

base-commit: e5e7ca66a7fc6b8073c30a048e1157b88d427980
-- 
An old man doll... just what I always wanted! - Clara

