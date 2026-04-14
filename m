Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF3344DA2
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157793; cv=none; b=QVY17gzFLDe/jY7YxnmIcSRI73Lk8DnJmvXEapZn/JBRJqPmI5huoNEdoHLKvdsCQmr94coZugGjGIC1oUh53W22Kkk4haYnfjp6ZVCHDpSl5mZoHXKeN08F89h7t930nOnV5TEi+jZkWUTdv/IZR0FOSRa3DTjNoNvIHfLEUxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157793; c=relaxed/simple;
	bh=tEVPkLhbKIoeFnOevsNcP5Td+XWjCEbY03C1CwoAuC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qctg40U5+iKIzOgWhAWzSGJ/Oas4+p84dMuvtPge1U5ZrV95YLrSvuxZuPA/foiQ1iMvdiQQb6QMGq5Z4bhbZDkvOyXVF7uAvhbfiUANFtko8m1ud0gPE0LHDKm37aq96jhkBSrh5O2llMSMc41XD8rRbhK2ctLU4mV+WLOaSUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZOppB2k; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZOppB2k"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82418b0178cso2709147b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776157791; x=1776762591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPInmNm8OBBtK5Tkz40c4Yvvsbp15gM7Gb8M846cMAQ=;
        b=MZOppB2k4nW3xPGAfrtmAjfI+5pn5VSVNSNC7BY+5ePn3wpsoUuxJyweL/biSRqMz5
         fmp3tXGM+F4sK5ebhof4FcLVFvhYDCMNiKzmd2rR9LFME9rSpYh/Kr56ttlLtvVJRxbG
         /nuPXq7lXxbqejg8+PDl0yS4a9KTVrIEYUHo381wgaIUYQfgtrfF5gnljljn1yws9HFc
         psao5q4xd/PAtTVrkvLGKzuI3/SD8bgQOY/6T2Zy52txjDO5x9ydnpEwzGe1+NKvAZY5
         cAPTzp5h+zcn5eaTe6vV+Hdg7d4Zc6nYLyOhOFvygUEyM8Jan/kTGegQo1VqZYlnjCnc
         y1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157791; x=1776762591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPInmNm8OBBtK5Tkz40c4Yvvsbp15gM7Gb8M846cMAQ=;
        b=RWZ4ftnRT1BAHRVo6/YCDNsXz4gA5Ml50GbueKzNVhzaHKCqW4iXqayhjK2D8UTaKy
         HF4n+I2ChahS9YuqZB4OwKKtRn3s8ZKHWPqB2jFPOXyYk3QrpVzP+7tbDexoFsi0cte5
         xBRGRG2loZcnYSGo4Bu7/t0z/QnGFNjvALDaZ7E1B//lrzgyTF6nz67ebQa98bsiHCOt
         2HcKvkp6RpJUeLmqWzSfBr7YsP8mNN++GaKHhWKNTmlpsY9u3PWmi1Ntqk9PIskueEoQ
         sby1GqQg5TcP5j5XwixUl8GJojNwNc7ecxVJ7FM5Td4fQ9f6tMZzEs6Rin5z29qY391K
         qlHw==
X-Gm-Message-State: AOJu0YydwJenN79sDTZe7+ddgKUWnktb2y7hez28m2JIrurFNuT/yyfN
	vuENfsqH4OqzCLqmFPeZMDXN/lLw3K+SZwE7IWeR4Q+oRjtQrBckIjUhDon+LA==
X-Gm-Gg: AeBDievL5d+SYKN5pYB/gpLT8o7+pD24TBPSUl6FCbzH9ULnhjaoPNxIVpcmF6EzBSA
	Bo392OyKqaBcOJmDwbydpP2SSp53Sk8DtjZoKBJ5VfyptMBG+dwAhDPBsBk/9FF8OcJIiL6WJiv
	0CKh8u1Cm0nnehATedBN553NqDw69BcJNwlPCpBMUpNNklefIPsai1xXy8UOlt3S41vZLHB4uN7
	oTbhhAlq/c/HFxO8zC/5KCc37383VTFlPvg5EeBGi1DW9EHSK8TgVTdsNyRYRgGZWunoLr0FbNd
	reZ6yTpDI6rtnNy5tzDSAiDHoIBxe/NyhYFx3bRk8o0Nw1Fg+9ljcVN9llx13+zkvOettpkiwbd
	lgHEXGE/z0JKmx/NM92hy5RURk3kzcn+TE9vd3QWp9TGDdVRDdTxJ8I6PguXZ4KaqKcMswdUXeg
	ORh0tYz5BR0+IJMjbu/37wha4oafo1fPW4lX4=
X-Received: by 2002:a05:6a00:300c:b0:82a:ea3:c16f with SMTP id d2e1a72fcca58-82f0c27af2cmr15936847b3a.53.1776157791423;
        Tue, 14 Apr 2026 02:09:51 -0700 (PDT)
Received: from localhost ([220.247.131.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30e5f1sm14584252b3a.11.2026.04.14.02.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:09:51 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] docs: rust: fix grammar in testing documentation
Date: Tue, 14 Apr 2026 15:07:54 +0600
Message-ID: <20260414090943.1896-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "how to test" with "on how to test" for clarity

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/rust/testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index f43cb77bcc69..edce2cb6c54e 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -3,7 +3,7 @@
 Testing
 =======
 
-This document contains useful information how to test the Rust code in the
+This document contains useful information on how to test the Rust code in the
 kernel.
 
 There are three sorts of tests:
-- 
2.43.0

