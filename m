Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE674A68A8
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560371; cv=none; b=K/NxA+6SkblxYnYJit+ySjZPZIHPoqK9X0psxcJMA/kmaXOazxATwyrMscvkkbcVAKAG9+3cG+DHS0yiGgDeVDymA+Plp1pPyiMeE4jYYZ6Nd7/4unoAPpxfFKcpDd1S4Pz+Y7Occ4EP1ToltpLf+/2VY+hyXTMrFQ6gndc5eqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560371; c=relaxed/simple;
	bh=+Rw07kfriWEyCGpVzJxK6mSgxAao1ypqtfUdivitgpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQzenJEKmUrB2rBq07vh3SXo5Qqel/nrEp1I1PuY0LG0EtAmM61ol9WKnX2Deg/86nAJ0+ShUjc8S7La6/cBNYoTn0Mn897uSxasAmEqp1VoslZ9SbTqn3W112b4Yg3EhvnF86amfMC77FfHL5/UVMdYlB0W4oPZmpMd1Q9qnK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZPJFDXB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZPJFDXB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e623eda81cso17877615ad.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560368; x=1792165168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkPwa+ResHmZ7LdsIwsHxXNe9JhyIG2QiRNQ9+4WsYI=;
        b=YZPJFDXBJhN9r7Gztqxrun5SPp3gutm/XTwS4a6fqz2Hvw8mfZc1msshKuE7TcfxMr
         Pa6tjSLYvKouIWUn4WTHt0Efjmtsp8lpvXAHl/KvFACdaKswrKM5nDYxciQA4ni2ykue
         5Gb2/1W/8k6LiuW6Sg/AmJvwzwrjzzRazja97aY06/h9JOTKvSyLUJJTkIM8Qixj6TqL
         ZqMCQfocCth6rRq6kuezcc05NR7Zapyhjwk0crenHOFvTvX7IiOsI1yQqSqUXE+je10a
         BUnkyDN/4QrETulYIALYgGPJUZA9GLBd94cZdQb1kT4CJIyGgzMLdeWcK6ZvFIBl3Z1J
         RLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560368; x=1792165168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkPwa+ResHmZ7LdsIwsHxXNe9JhyIG2QiRNQ9+4WsYI=;
        b=WSYyNm+fCvrgDU8rapeb9cPeYWfaAPDmmF5Imxwt+tF6aO7S51UgcU72o39lUgOpvW
         TKK4ZoHI8TNuinUxMIN6ogTKjnmBWdD0zP9GcmfBGtRejk3b89N0qCnZb+eMad1kwuxO
         wgcU2Mxa9H5GtH7FnWyMU8cp4I1BK6cDAmal4wP5xWBXx0nfsOs4iA23BB3ItXamvdri
         bskaaIxTByh/7CGU8/4/ZCJxC6ssZhqdSVdVP0xPQpmzGR46fijCHs40126hRF1wn4VQ
         jFkxXbHgtuAJs5mR9BfxGJ6yeBZCk/XayJ6N8+34VQ9R/Qy2CFFIY4uxE4tcvganIYSQ
         l9tA==
X-Forwarded-Encrypted: i=1; AKwUvByRQqXyEYs6B76sFMUL3SAf1rVQGSJqTy7DfX+S3Fz0Z4eBQQpaxoXS/MB3qRMDfaHF4ouJOWKJ7f4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/6Ug30ssIChutvGHUh/zFfHrapLE5Ds3vJUC0pbk8dwBI4i4m
	hnNPfX+2t306coL1cqcuq022hCXbL9HLDLOawkj2gcT8nqkOAlIWzXMG
X-Gm-Gg: AYBFou3VxhWUdxbD4wpJj4TZcR9U509ODaCoJ0T2mWakB8aZIEOiZ7DEGu/3R+8S1OI
	Y3b4lCY0ckyxkmu70KOAYeIV6Zevgo0EmiysKwbLcp4aZgdnZJETZwwPm8wMIlmx2c9r23AqycJ
	7zEeafFLHIAZz/qOCsHnGjQigt+Csn+kuXQM8HnyvOY7ti/8QRzmxv2UYy6grnX9eD394AQgsBj
	Mu5BH5FI4aliDkr+ReusBKZqTLt21j4gtFRzT9zYux1ruHKwwm+aKTSgs2f/GblzCR6Gus46a65
	ILj38QXqb3r3Pk1//JQi1UvRrmKbUxwtQekw8DPJ8OujVxYPvhwmqe5+ITWOAC8llFcTbqwHVzM
	+TawmBx3kxxdvjuguj8F8hI72bOes7wFnu3NXf2sphulZhCdVJxzpn+LGjqkceT/0NtDDR5tPwd
	+2Y2GkR1qt5R3fbdU2ai9cExMAhuW8Wn3UOsEZuL8xyDUwF+YG7ouPNnWJwupNvoyBp6FsrA==
X-Received: by 2002:a17:903:41c1:b0:2dd:c053:82f3 with SMTP id d9443c01a7336-2e842ce20a2mr18707215ad.42.1791560367626;
        Fri, 09 Oct 2026 08:39:27 -0700 (PDT)
Received: from mincom1 ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421ae999sm11847705ad.31.2026.10.09.08.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:39:27 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] hwmon: Reject truncated attribute names
Date: Sat, 10 Oct 2026 00:38:43 +0900
Message-ID: <c9a2e5f5a8bf08545a999c6ab70aa058eae947dc.1791559095.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791531025.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Large channel numbers can produce truncated or conflicting attribute
names. Return -EOVERFLOW if a generated name does not fit its buffer.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/hwmon/hwmon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index bed16cfd4f1c..288f356980e4 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -553,8 +553,12 @@ static const struct attribute *hwmon_genattr(const void *drvdata,
 	if (type == hwmon_chip) {
 		name = template;
 	} else {
-		scnprintf(hattr->name, sizeof(hattr->name), template,
-			  index + hwmon_attr_base(type));
+		if (snprintf(hattr->name, sizeof(hattr->name), template,
+			     index + hwmon_attr_base(type)) >=
+		    sizeof(hattr->name)) {
+			kfree(hattr);
+			return ERR_PTR(-EOVERFLOW);
+		}
 		name = hattr->name;
 	}
 
