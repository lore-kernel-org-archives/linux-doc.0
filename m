Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C472533D6
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 04:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747220; cv=none; b=MKiJlPP3iJr1WhdglOmqFtLrmhlMFtxOnh/DQHCdWePruyts59l22b4eAtGJX3FvB4WSUHEJfmzsHclGzR0w5dsb6w6LJQXtn1lQvFm0b1VWTtLcUaHEXpuor/WPFNhubWvxvQ6pkEn0SFiho543TiRVTLp3jGCbBgIwGJgQ03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747220; c=relaxed/simple;
	bh=K4xLzZ2/2eVOt8glPRV1xVtrk/KjA9eAkIyUmF4bX0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFK/Xu034S/34CMcIrWZgN8fKXD6ZJxXbkN9pL9tEYBZltMHccJlgc8OBY+C+QHifCqYUHIxlAlTkufk3DpD0hC7NrG9N5InbCkYjvdD01fHiFqVmPb0yRHLEgLNxOEfKfVsUDsgoC8yQzysRuF1CsDT3fDQd73LgA4BxUWBGqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngimD6hW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngimD6hW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1980165b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 20:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762747218; x=1763352018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSDUDAQE9sOa+voyhIFgd7gTvEsE4t/g4DOsmmFBmrM=;
        b=ngimD6hWFiCkx4X01ZqKJBqzMcrwqsS5hGT5tzS6BG9mYsfN/iELt+72SElWjsd/k7
         5e4xDde41X1J2u8CE7lf6J3WKTiNilRllNxAyZBxxxG/EKRbh0muK0WhWEokSh+OzwYe
         plCsvgRZKD2Z7nxjLim75QUfJ0etkEW4C71qPQ8PZVGuvZpPuV7LxmKDmrYJ23AKULgy
         ml5RMf2hcNkxbTVAWbt3ssmchjoQ/jaDBbyiQ11iihS0m7wywxEHy7qMVUwmD1MPRILt
         0etwEdsCb0TbtR7ssTKrbjXoWiyxFOsR8VOJJKHTy5Nj4hkhCYu8jGTzrbKHzxtw+FZS
         uuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762747218; x=1763352018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dSDUDAQE9sOa+voyhIFgd7gTvEsE4t/g4DOsmmFBmrM=;
        b=TidYQ5SGTWNan1rFUfi+a6taRNDgmk+41Bt0EBpY8yeM2JPpQuNMVbhiRFG+yCHTn1
         nhY32Y3+ATWMTdzPAs35OHc+uGWq7C63v2cSsNaJUKhX+z3OHUAI+Gm/J+8/7bF2HxuG
         J95HEn9RP0cWffcpA4ikbVjEyZQmrrvwgxJ8OYZPLdZNq+PKdGoaF/wHr9wDmjfbmTLc
         xBEYYU/yAfD9N0CyuAFIdHWRSJCZVUxTvYSj3LyPD67leDiy4HfWP5FBExuX0RD39org
         X4N2fTduo4Z0Dt9MniZ6ApN3T+vTtrocCWDqMYIMZ+KGw7IZfGBZnw2OycvTdfFxTRQN
         1WhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXN4vCFsRrvOGX4Nak5x0+k4bAV1RMzm38rW8dO4mU2DwzjR5Yg751/wmSaLP7xXXDYhNZyDXBs/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzlXcO0DOP1Ohwr3HEpmtjUaNvi4FFeyzIh8CYiIE32ZIhZGdh
	939OeqYI6hnZRXNY/jMr2pG4oRZe/1dqmQqLfOQzAJnYzjZVuVYrWn37tB3/CtleV2k=
X-Gm-Gg: ASbGncvm5vg8v3iqn2APABKPBOsJJU1GxdKLT0tgYJINvZErY8BMju4/dZLiTaGJpkW
	k/N/50nQxGPZ/rBEta8qDUXUvoOw/6l86gfoCGP1I4LwtFlUUDxfpiI4XjlAJuhsCeog+odG1lR
	Z9uWgvxlo1gKRVE61x8uEEw9kUNAx9HfS/0sHH+6/6KvQGPBMAgFKf83VJXSKs93NZzRpOnBppU
	zELezsdu21APf2OC3xyQtLL7WOHL+jF6UJ6koHOMpJvenmHuAnA/GSvkEP5+rCnOb4O0lFJ70QA
	V2JV+CPKaYPzU4j5sz9aNoqwcMxwaMQL/mdnq3o++Q950WvjILHlIBCu1Khpivs41NEKbhn3Qpm
	Tgz12urKRMQSZOVuFU4NJ6IWSQtPFjD313cZIiWAtXwUwaRutAkfqqAeNzO8mruFP/SJI7QKtIa
	Rx
X-Google-Smtp-Source: AGHT+IESDcVDuxfGXnbyvbRCs31L9wp486DOb6hfCBx0l2nolH3Esz13I69INyPLAs5QB4NXfObnWw==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr9564540637.28.1762747217272;
        Sun, 09 Nov 2025 20:00:17 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed1e73sm11606997a12.12.2025.11.09.20.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2B840418F1BE; Mon, 10 Nov 2025 11:00:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
	Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/2] accel/qaic: Format DBC states table in sysfs ABI documentation
Date: Mon, 10 Nov 2025 10:59:53 +0700
Message-ID: <20251110035952.25778-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702; i=bagasdotme@gmail.com; h=from:subject; bh=K4xLzZ2/2eVOt8glPRV1xVtrk/KjA9eAkIyUmF4bX0U=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmCSVl5q2wOvw+ydS5S105U0nDbe3GZIs/m+4+NfjvMW mGfU7uso5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABNZa8TIcHCC6e93D7QUnRZu 2cgXvvRsa2q55vO2/j0vvVdkb/q/Uonhn83+jwvtWgS6F5r0X998xLM6+fqrf89rmppW5cS9iZ+ wjA8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:

Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation. [docutils]
Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

These are caused by DMA Bridge channel (DBC) states list in sysfs ABI
docs. Format it as a table to fix them.

Fixes: f286066ed9df38 ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-qaic b/Documentation/ABI/stable/sysfs-driver-qaic
index e5876935e62b34..c767a93342b3c9 100644
--- a/Documentation/ABI/stable/sysfs-driver-qaic
+++ b/Documentation/ABI/stable/sysfs-driver-qaic
@@ -3,14 +3,17 @@ Date:		October 2025
 KernelVersion:	6.19
 Contact:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
 Description:	Represents the current state of DMA Bridge channel (DBC). Below are the possible
-		states,
-		IDLE (0) -		DBC is free and can be activated
-		ASSIGNED (1) -		DBC is activated and a workload is running on device
-		BEFORE_SHUTDOWN (2) -	Sub-system associated with this workload has crashed and
+		states:
+
+		===================	==========================================================
+		IDLE (0)		DBC is free and can be activated
+		ASSIGNED (1)		DBC is activated and a workload is running on device
+		BEFORE_SHUTDOWN (2)	Sub-system associated with this workload has crashed and
 					it will shutdown soon
-		AFTER_SHUTDOWN (3) -	Sub-system associated with this workload has crashed and
+		AFTER_SHUTDOWN (3)	Sub-system associated with this workload has crashed and
 					it has shutdown
-		BEFORE_POWER_UP (4) -	Sub-system associated with this workload is shutdown and
+		BEFORE_POWER_UP (4)	Sub-system associated with this workload is shutdown and
 					it will be powered up soon
-		AFTER_POWER_UP (5) -	Sub-system associated with this workload is now powered up
+		AFTER_POWER_UP (5)	Sub-system associated with this workload is now powered up
+		===================	==========================================================
 Users:		Any userspace application or clients interested in DBC state.
-- 
An old man doll... just what I always wanted! - Clara

