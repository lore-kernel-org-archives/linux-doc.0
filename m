Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C01339B1
	for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772278984; cv=none; b=GP9be3OMp3GgfA4cibpDenY3uBoAalpKzPreL6ReNWnMIWBnIUtthinf/2fsedNeuO8wS4jOrHN0MN7Xh0e6ii6KYjSzNK/UsekwFa/5n318Zq2Gmtt4EBcQCjq0U4VvBUNB7Wut2qhPDpk/3j/202E22UMM6+dSOy8MjbL4B/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772278984; c=relaxed/simple;
	bh=KvCp7CRA0MR6zfy9SIELAph+VODn3J255qIyMsXjpnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ne3QgBPFXnPHLzpmzmAa7x1ZH7ckQNbZDURm7a+LVu2jRJ5vk1FCZlk78T7QU5gDWMqYGtG6y9KDTZgk9wwukEqrUIPPS+Jpxdj2ZyzcWd/poKGyxqVhFen31Kr40YcNKI+W6Nuq47/aOf75eYvgkObkVBtQqyHEM2ZoL/z9vkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc5a4Ey5; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc5a4Ey5"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824b5f015bcso3441189b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 28 Feb 2026 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772278982; x=1772883782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YuRDc3z4IooJa8eXktkGzKAHRHu09EsPV5j4FQfe/YM=;
        b=Jc5a4Ey5p9wLzxLD8lbyD3VIqydge3iw8LdsNNkAwcud4gv1e4ckTrEXjLQCAJErBB
         SgBc7fLqIX0kyXRRpoOtWipy4mJ6v/uwCX1Sr53Qcj7QGbaDKKTikYqRZcz4nt6y2+kt
         renfLkRR4exKGzhhuC6VKaSeScSSpWrNfU6K8fS8UPwvHeaKhBYxusb12wCAWSz/4nuE
         TGF0wiDdRUCj9QDmve7tPAYFH2v0QCspQ2un0es8hIVUlfDVwSlJrdsRDTCyGagSaobN
         3itPBxRC7i8meWLTKJo+mPmmKsb+KO1+0/Swygw64RmIv1jfQNBSyHYfXj32y3K9q8kO
         7Sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772278982; x=1772883782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuRDc3z4IooJa8eXktkGzKAHRHu09EsPV5j4FQfe/YM=;
        b=LdZ8tzdagkI0gxhb8yuyI3M0iFGy17MGL873j2TSlPCmBgYJVLncACakmEmPP7NI5k
         91L7j1JRTJHPDfB50mj9Q/vQpRnYSBftuFy7tDT8VLKAewb95/8La+zzvwuoqHkU5C9c
         0SFR6BdegPwALyTe92b1mphbOsgID9CWbbNQ7YXmdQXdG9EqBEyoKRHYcbT6m//d1YkZ
         Zk7xzLw8NGPbo1mFQlGnkiP2/GuLgON+dNejnrlRT6MRgogxrxUp8j2eiunwDCcKg4dv
         rjKEv3vPq1MZt0Dw2hUL5nq7EiszfBHnCkkgVvsWDCMmMSXLwz9gj5aAHYElR8KGD1NJ
         gSDQ==
X-Gm-Message-State: AOJu0YwyruBQuXv55kb68tsJ9qZVmB7dw3Aa1BIQO7CRvU8ZN4YyHTsM
	OTWhl7Gi4vIfLBNv2+ntV4ly8eZBIypSGBk6c0Dl3lcU1QtNch8DVdYQTIQ8tJDs
X-Gm-Gg: ATEYQzzVJ2oOVh4jzWt/L1lKw5NQ64BCnWRNBPVrx5YxKLF2x2Jj2qKalqyl/1AJFuV
	z6NCuGvTm+tKZKyHnfPP74aN7ZadmDErtBGtwRetBCWClylI/pDzZ4bxgAkxEL7iFO3qXpN3+1Y
	cRKzqF9Vg5Qj7a5oy9r7UeOsY88TzuNmduB51BYP7IQliAnwvRJXLYz71BKqaXgyQJdVGX/50HO
	1AtmAQs05hcdUQNd2F86Vwg/nDsAMK6qFRNwjYc/zKDJW9CSDvX1jEWRZhzjDwfZZfWCeNbiHUt
	pCNd9xGJ/5s4I+WNN51FD4nh5jlwsE6pTr0uGtVKNXxlGFn5f94TZClgMpW/NR37uzyetiu1C9Z
	U9PgeOtIIzk0jjffcr8v+E00Xsn3WgBUAyM2vyYfpnzsMlLjlmtkJu2IvkomXKGmVMgChKeJSlI
	J1sxaKYIRk/f96wJ8/tULmitcXc/Q19m99MXf1wq4Hbw==
X-Received: by 2002:a05:6a00:3693:b0:827:2ce5:d762 with SMTP id d2e1a72fcca58-8274da49a67mr5098780b3a.50.1772278982301;
        Sat, 28 Feb 2026 03:43:02 -0800 (PST)
Received: from localhost ([103.251.247.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ba6275sm9904930b3a.0.2026.02.28.03.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 03:43:01 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] Documentation: fix type'must to be raised' -> 'must be raised' in embargoed-hardware-issues.rst
Date: Sat, 28 Feb 2026 17:42:54 +0600
Message-ID: <20260228114254.22606-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous text incorrectly said "must to be raised".
This corrects the grammar to "must be raised" for clarity.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/embargoed-hardware-issues.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index 34e00848e0da..5ba640219006 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -208,7 +208,7 @@ If not, then the disclosing party will be informed about the experts'
 participation. The experts are covered by the Memorandum of Understanding
 and the disclosing party is requested to acknowledge their participation.
 In the case where the disclosing party has a compelling reason to object,
-any objection must to be raised within five working days and resolved with
+any objection must be raised within five working days and resolved with
 the incident team immediately. If the disclosing party does not react
 within five working days this is taken as silent acknowledgment.
 
-- 
2.43.0

