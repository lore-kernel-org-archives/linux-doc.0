Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E7245032
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 04:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754886586; cv=none; b=HiOlah3DwOQ0Deglb7IRdBL5LoT+bBQvPRjvWEMLUc52SJ7S6ujGFiANAb6foFwi72qpaA5Hb3t5udUednk3gnCOqbluaOgm/r0tjeb5MEsWVRjofAEOrOdJ23Po8vHdtkvORpA3oaKMyUYQPMeEADYOwgKzFtTWDg5Ha0qzK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754886586; c=relaxed/simple;
	bh=asAYiJd2BPVbPq0TrnmfQDeswmedlMHPQ/HIzf4WD8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDvHSrVQUAjgKldD/ygkVym5ANDhWXQd3qm78Z49PzSdzdrj8M6dF01CIHCTtkQlhM/rEpwLMwwmGRB6AtjCK33xIyBe1W3pSspz+z1cSGuVNEwWclyx/MO5B3hTP+2i0T8qD1q72NH4PWkCJeODCsChkWVwxuzPeVAIl6CpXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNwvRYyt; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNwvRYyt"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-321895391b2so1471709a91.2
        for <linux-doc@vger.kernel.org>; Sun, 10 Aug 2025 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754886584; x=1755491384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UyfTclra65yMzd5uvao1JUKR6GowJ/GfOw5QMCSske8=;
        b=PNwvRYytt5MCWqFDsxz3+vJg1iruy10Z0SG771WDgChxUKC8EQftdO/QDXUALivOzW
         DE++/mVamAAyVzuhcXUKrevl7B0nww4PL3QSt0ZX2V8wgpzYm0ZVms3Sr/HMl1ety1e2
         d4Csr3Zm8n9DN3GuLfPkFFnHRf+BRBAi3vYMpMdyIl0qjR2FPIqSgxcRtzoqZyf1Jddk
         /INlPqJ0aZ+lF61EqtC4nCmI8FNIts9sQcGG8cuLLKab8Ngk5CrUnSaDBiFSizgGDEZA
         Yu0Nl4ugeNUp+1Z+x822M3z81ZJr26zFi6VTRTHPBJYw8ANz3NkWnBNkgXsyWCG9MRmf
         Y1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754886584; x=1755491384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyfTclra65yMzd5uvao1JUKR6GowJ/GfOw5QMCSske8=;
        b=CAKWL970EYA2l+5Xajz73E9XnsRr59q/GwaNMf7MDLwKMGtvMuhc9U00l/8wREmRKw
         Zz54AyAoKhsdLflXOZ6bh3cJYKRKZ3FOf2IuXDuGTZDTfoQIxmjOEq5AgKzG0dBkxCX6
         FSFIeRj0SAwGQtpXVeMOv9hT28xfKF355R3YQO3vkaFURTgR2kyMQxptUp5Bmu6tkfUw
         vG7C+xZV5pbtOt2ZMil6iUDw65jO6kVjez0A/3uBpCj/Rw0Sz8VGyaC0CzSlv3JFLNqv
         NAoACT2+eMKdigNlNoxBYazeY/rtvb4tytCq7lZorkX2PAkkv/XSUJObYpeSp6p/q4M/
         1gUg==
X-Forwarded-Encrypted: i=1; AJvYcCWzE+xhNesFlgiofeo3wL1j8VZu08ZVQFNwD+kIOEOxrF9pJJfYsGbz8QOLLfNDHBJ8T1lGXQD5EH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDgU6AIijd/fdZBlXBHXXT3Uw2DTdDlEib1ZlTTa0eycmLsZe
	5GiKWoBDHFmFO1z7SZnnDqi99nGvn8v0cS57smqjIAZBINzKAcu63WmKy0/KNOz2HSeFk8o=
X-Gm-Gg: ASbGncsZbCpvhZpOPp6CSWHuayvxDgG2aqxLye7wRuWdbctio5Br1fJhO/HvhKS/xWj
	A5F+EkxH9R5uaq7RfQ1OA8BeZB52O/cn2yTI+OuznCJG1SBzInLFPkeHdX+M6NxX4gYQo0BgaX5
	/Yccy6N91crVxWN7WJ5BoXxfV1sQ+29OILEMVC3XVzGFIE+GrRN2TAF9gL7h3l+127pHhAjf7Me
	UZgOJofAnfzn04oX8pHOoTmFHscT2Z3/atIqjIgfJj2jSk5+TFyqwlhscbv12Brw8nPFs1yKXVm
	4YsqUjcUX9ToscsBSTLa0TgmoHAiAEoFBPr67iRwnR7CSBjwlR/E70ovubN95wuLAX8sgr4MDGG
	UnFFYlnvCGyJHQ7jMjVf+FYt3XnB+8596CplOCCQrkNoaY/iLxQ==
X-Google-Smtp-Source: AGHT+IF32WnIAqQMfkdBLhJzzL+vsh7maHs2RRXoBX/ACxt8kloDd33fVoTNUpB1P6ihoXwRx79luA==
X-Received: by 2002:a17:90b:4c8a:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-32183b4382cmr15867750a91.21.1754886583965;
        Sun, 10 Aug 2025 21:29:43 -0700 (PDT)
Received: from kerneldocs.. ([117.231.194.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611dd694sm13412186a91.1.2025.08.10.21.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:29:43 -0700 (PDT)
From: Nikil <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Nikil <snikilpaul@gmail.com>
Subject: [PATCH] docs: fix broken link in Documentation/RCU/RTFP.txt
Date: Mon, 11 Aug 2025 04:23:58 +0000
Message-ID: <20250811042357.7470-2-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The original link to the Linux Symposium 2001 abstract is no longer valid,
as the Linux Symposium website is no longer active. Replaced it with an updated
link to the read-copy document available on kernel.org

This ensures that readers can still access relevant resources without encountering
a dead link.

---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..87b1c97c3ec3 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
-- 
2.43.0
Signed-off-by: Nikil <snikilpaul@gmail.com>
