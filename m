Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508740;
	b=pBScyeVHueXkx7X+CVNwQrg4JpENGlUYBjbUWUlQlGqIpm5kFuqgjb2bJVjkOcftF5JH
	 5f1tmJEDXyPsmxkGOwIrok1V+mIEDxoFSlJ25P1bF/PvsVkoGrUqZ0AfS9MWGps0M5Lis
	 OkcAX/LqkW/IOS6EbuoJ/uJGhl2KeGIekF+1B8wG0cRSJE88f5kz/0Oby/FhsjO2KmStT
	 xoYZX5tsxcZUJRnMlMzDsRCdeUuf6ROuj7YTCBjZuUuezODYt1AnkxgMJcLNJ5ooUZSzn
	 j/GyKsi4xTFvTHRN59sWYNJy4ExQMF+AjARBzB97iwa116yhNbRm89FFZCQYm6ImbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8znbwtg9HjW2zeICa39b4bJRE7uID6ay9xCAZoXxhNI=;
	b=YHSMd61qLAOJw174wClXbQ6a7WJziqHnXT3Ftz+tTNpxSwfsOM87RBwDyC0adMCjeoUk
	 wHvzoCy3M3As08F0GY4TBtumnfPegLGGqlOVfDfWuzrjqvbH8PaIDKa5yltNARJyoihaJ
	 pVgKPpDJTd6Z07jdW3ubNReY/S4yTr+JKEpMz7vGI83fugCT4RIMyDH0qmFg81K/VP3ZP
	 TSf0D4Ke5m5gq7cWN2VCeMSLKy1VLSuvI5V5mwk3Kk5kWGlV4WC/OHEkcHMDh3JvjQi3I
	 5w7bymu2bh8tetaeONi3QykwPVmkM7fTW7Z6gFHr7d8YYnhXuQhnluOsqcvVLbRPrTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0rwEhzA;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B5606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D1B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F0rwEhzA
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3584f70a5aaso446466eec.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792508739; x=1793113539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8znbwtg9HjW2zeICa39b4bJRE7uID6ay9xCAZoXxhNI=;
        b=F0rwEhzA8aaJT/L5J9TVeIChhedlGZyVGRUxPWOtTZKd4lerIsu6xZFdCYEXp3vcfJ
         71aYU3NO3KcUG5fuA1nX5k1U0rDxgZ8/eS3ASPjhoGGn/Sy2F9mYctdCqsxlFC//o4gl
         OGacQePBxY0fD3MLoV2hoBptUGc8tlfKu2MjIlg34UQKdYSmuq+cY0i+VmJUBU4BlOYs
         qUSdZg825gzy9gmr8vYCWBrAP7ZPAVPdpNaZgwUtptntX6Ku8rtWx7IikTqyIeM+fvkO
         J0shZHiiuLEgDQPXOD5creDbO/ub3dPdnOmMpmnvxOonzBGRbyiKNhrmCEUGF0ZnHgde
         rL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508739; x=1793113539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8znbwtg9HjW2zeICa39b4bJRE7uID6ay9xCAZoXxhNI=;
        b=RswB5x+jMHJJpp0zBywFXfYIGj+xaci0x4b++H769thDsQBNKfS35LjsjulD7JcPhM
         JavOsVRynfFb54nHh7XehwjkPDUkBitfTKv+1UmAcW8ubk47WBJQQUkBmLShJ/71qLY2
         Of0G5556rktrQZFsjXWOIVJvs4shhQJLhNwOMYzu8qzYLkGisYyq1nqeIRYdnpK7X4AH
         43K9LirIn7QAzoEE21eacj9rccJEnWIlenQG3hnPi/KPNOBhwa4V6SUw2G2RdpVuVvbY
         wflExhaBMkacDlkgeYlRwfNeT3L62zQbTgyJVGewUX+mDq8fbsFVmiIhsfJ2xKW3jVXw
         oDzw==
X-Forwarded-Encrypted: i=1; AKwUvBy4319wzp4JoswCbh25MEX/26Gu4KEQ/7skvCpUHU2e7MgytC16p+A5smclrA/eWrtbz6lnRDAT160=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7jP0+nHXwKGoIDWQIaNLQnJqL5/ur+sXGrqHoaSuDS8LGMe3h
	xhJuAzfT5AdzqUeQt6Hu3o4VXcrpvSMwBBXMkOGkXtoNehJCc8MHj2SS
X-Gm-Gg: AYBFou0vFJIdgxfbqi3wsFzlZ6MvLinNx6j3boly4teUEFDwmvC1r0E7gQ9nSdGYhas
	3Pu0sYklOF9tAfBfKuuGY/ztlYKLxkZ9hU+McIvw1egNj1qTJNAPwtthwKaGNfR2gN7KW/f55TR
	ym3yq69BCJkRyXbUCEb4LkgMCom2VJ+0EFo0OUZo3JoD/Vmsg50Tm3iDX5RuawW3bJPsTaEHbrb
	s/wX1/grNvQgyZPZl8HbHrbR9mEaUQ9kDvaZvHi+EboC/4ivsmuNrjaxwXhYqw/RDMKUNn3RTXX
	0Ac8KumEQYjNORa8Z8VVhjHLxddVIHQwuh8SdNiK2RfE/Yy6H0QNHdi0WP85fSw2N2v6x5pGOAS
	QJu60Bh+SPkWVUu1Dn97usTfv5i74hL/l7MGImiBsIHOXcs/xJV2QmVNgUxfYesXoOBokU3/Vm4
	nMtpSRGPdHjCHePUnZ243H0Cws+xgxu89JG8zW4WCGLSt6GiVuBtamqbwuWD+W6NWKJ68WTsu/u
	Vdd2CRHzjY=
X-Received: by 2002:a05:7301:da84:b0:351:7e15:9c59 with SMTP id 5a478bee46e88-3619b30919emr24107862eec.0.1792508739165;
        Tue, 20 Oct 2026 08:05:39 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm42494269eec.4.2026.10.20.08.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:05:38 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] docs: admin-guide: Fix typo in kernel-parameters.txt
Date: Tue, 20 Oct 2026 20:35:30 +0530
Message-ID: <20261020150530.15291-1-sarkarsubhadip604@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in the rcutorture.stall_only parameter
description by changing to "applications".

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e..f5263eaf8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6249,7 +6249,7 @@ Kernel parameters
 	rcutorture.stall_only= [KNL]
 			Shut off all rcutorture kthreads other than the
 			RCU CPU stall-warning test kthreads.  The purpose
-			of this is to test production applictions'
+			of this is to test production applications'
 			reactions to CPU stalls, and with minimal
 			additional overhead.  Or you can omit the
 			stall-warning tests as well and get a heavy
-- 
2.43.0

