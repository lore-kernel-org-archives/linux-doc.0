Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E232253EF
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298527; cv=none; b=F5J2/vHgx8Sa7y6+GsCDM4R4sokSMVH+W2B22DJg917wytloMG9uhOq/MLAyfo0hhjPucYWVNU3kmEXMbgl9hxwPUw0DFKi0EhHIPafjQpjbPLwTAhG2hgqeceTfLOAzeHFO3utVUcbxpJ90HLaYCHCDBTabXX8jP8bd5Nqu2/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298527; c=relaxed/simple;
	bh=jzOvnTx/W3vkHXNAXJHl105M+tP5MxGbZjwB0Go0Ag8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfZkyIGj9FcaF9GTVdXSLHIqxAwVToSGaspmRoYThDOJV7SpQEYRdmqTKRx5Zvl6n/Xuhl4KoOEhEhyB592cvmpNLJQ6LDsV86/ia8xNf507ioZCauRLf+kOHVOCpiPdBSBxO1oQtfzUd9eCW5o7yJqIi76ST7MfFj1VrfmtlxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0zQcrsZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0zQcrsZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a94450ae14so5430755ad.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298527; x=1770903327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/zGx1Gcz5LYgaI/49wFrBfxIvVXqwuQwGCglo5zagk=;
        b=Z0zQcrsZOEGbb9nIybtiHp6U7eOnD6pKrZiadncsurWJ3rbR1KFSY+y7hC1e380qcV
         Ua+OnpzT9nBh2bLsOnESD2X77gz6DBY1ySB+pyA6Ou2TWsakxgCJofZB6mHbNQQFi7Jk
         7TIVNx2801X4gfsSJD8YFvXCdQMN/vEZqcbpIyefMRIjvuXXzbgGDl1JUzhzbE63JXhn
         oQqIzW5L0HD05BIcE0EoypRUt2Q0L2RcY434AknUOQPaq3TTGcnj4pbeAWDTzkeWkRGp
         cCwJnoDDR8IPb7E9deMgDRLj5g7o9+N1JvVTOUWaHX724H5B5H0bs3UBlIIdD1B19lL0
         G8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298527; x=1770903327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/zGx1Gcz5LYgaI/49wFrBfxIvVXqwuQwGCglo5zagk=;
        b=OZNr/99XMamxSETKPIsLp9wC0gVKNBhm6OtOHs6mIcYZ9KQa4PKA5V11tYc6K8DpP5
         lq/ADT5goNB5Odv5LEMaW7IJKCr1kmf9606//SEr2EldWyszlVYnTn232KFCNHYydEcC
         9ghMliUZhUbhuRi2c+Ltyj8aSyJtxcQLTr10uiUrH6wY6ZvlEqlgf2TYytVqmQq35VKQ
         0Ru9rXr6L7+7QLfP8QhoIKCFoj8RdPQn/W1CJatQ5bt2Ykuv1VrTFG9XDmqK2ANsGq13
         cTGbeQBpIHMRKifeHOv0lGGEEhh9yygKlL7WBgIrubzQX1SkrS5dPpm4W2k0BVNbMjOE
         z9lw==
X-Forwarded-Encrypted: i=1; AJvYcCUo5lIel5ZS4GjiJ5T8iD7yXzjrCANuzGE0EFUgi3ep7JQGdPKLili3ODZZ7F//pWHDkl+4HP0b6ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVjHXj8AmoQP2Ri20gAhrCVVA2M+lFXk+i03TQKasi8wLJ28cD
	pSgNt/dTUrU1/pf1sOmf+3ARMcPAdL2z/RWTdPqq95RfKZl/6yemzowd
X-Gm-Gg: AZuq6aIr9kL7zdy17yRb7HlJWj4pGGG4cQqkgksDcFDzhJQTfexp4Zae+secpsb7JK1
	99Ihb2JdiycAojOm9AftD7D31JXpcfARR3cy3ecihpu7Ahwp4wKFEYaloeMWoKITUpzaDUjaDpr
	5WvXmyqgydc/8F6bHpGAwpGCcaBKaInG5hE0/1F1wCEKBv2LVKT0CubHQAtnrinFyJqnoKqSfQO
	Z8QJPx+Z3aSeM8TiUeuuTvjXLhZG1fCnwSSXx5M5hbzPKcjEFzNQP3oJO9kvwrUi9M7qsqJ9mNJ
	YWn/hDTLZi2UWgoZdUUv5nz6FBfwpcqc3yreBLi8USojGdvZE6+mp8ydygEyehB/69zuJkQSA5V
	5Nt25T3Qt8Oigm6iVRoMZaMxG5dsh9uKeWuQikvV2+QptDLh6NhEvNfTjT56F+QQMiKiU4KmWwQ
	LzwdH+dr4=
X-Received: by 2002:a17:902:f684:b0:2a0:acca:f3f0 with SMTP id d9443c01a7336-2a93400c9damr78505625ad.49.1770298526798;
        Thu, 05 Feb 2026 05:35:26 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:26 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 05 Feb 2026 21:34:37 +0800
Subject: [PATCH 3/3] docs: hwmon: Add Q54SN120A1 and Q54SW120A7 to index
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-3-09061ecacfc7@gmail.com>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=603;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=jzOvnTx/W3vkHXNAXJHl105M+tP5MxGbZjwB0Go0Ag8=;
 b=SQRmAR2FLHCMb2rc5Nq3fpB7zsG3L9iKsSUN6Bj2NcQ6ClR//eQEXcGw1gRqY5Phiz4QQTBev
 3rcl1hD0x0GAhH53lF2v1blOC5n0K0QbHSKxsI2YCrS8wM2TKFVoYqk
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add the Delta Q54SN120A1 and Q54SW120A7 PMBus modules to the hwmon
driver index.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/hwmon/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..62d6fc0817eb 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -216,6 +216,8 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    q54sj108a2
+   q54sn120a1
+   q54sw120a7
    qnap-mcu-hwmon
    raspberrypi-hwmon
    sa67

-- 
2.34.1

