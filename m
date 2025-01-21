Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FC918AE2;
	Tue, 21 Jan 2025 22:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737499987; cv=none; b=qkMqP59YkdE6TYL9KWfjgjxPVG1nv0TOdU+DQrUc+UCi2xjQIH+IVGs26oT/9OsZm5fB0DUlGCEENVlaGjWUSMBiwhnZe6aUceFv5/HSITBwvutj5w9o53nfrquPZ/ZRVtWs/+mbctBXkfBdoWI+hleQ93SDNJw8mzujQBLQ3Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737499987; c=relaxed/simple;
	bh=hHTSotaKXn6mqlfsuZRFL7mUlXbYedRwitXa3n7zsZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LaHgQBqqriONNriuNI2mgHIX9rMrnw37Wb75rG7tVUUL/KyQXiufsWRKlgM+HL1PlkV1vqpLKgXptgMkXQwatdNHm9un+BjtLYtqeVDERqePVfj9VEY9f/vCcWYyVwBsvmgnqrMwHzuo3wr96pA0BcI8PQ/3qJe2dRjvsrLfvik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv2sfTRc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv2sfTRc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43675b1155bso71600105e9.2;
        Tue, 21 Jan 2025 14:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737499984; x=1738104784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNk8vcXhWS2lnex0vmdV4Bh3p7QN4YitPegQzBHEFfU=;
        b=Kv2sfTRcVzmSP7IcbEay9lTRJey50NellXa/0nGej/6k50M36jR8UpvyTb+ZMAvul7
         nS2jcaLadtwQPCNTf/Mwn4eGv9pGGlqouHmctbNpUGSv17nAWcg2nxPPn+gXqGTiTNHn
         YKsMB6cejGw9DkAYT/c5chxv8J3+nMvlbHE9quMFRHvT/VZ1SaDMdQUR/wNR7qzTkCrp
         m9rNx4F+5tKWwWCu8bTjv/rjUK+pYvZhshLRT2ui0/8J6wSgjaCPA6eOoR5LtjABbwrs
         y6djq7VRksfFDVRA+W0FOh4tWQRMTL1gixSPuQ0MUMWGwpjyUdk5IOzljWw5wTGtv+Zs
         ojPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737499984; x=1738104784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNk8vcXhWS2lnex0vmdV4Bh3p7QN4YitPegQzBHEFfU=;
        b=A72rsrz46nbikPXNE8sy4R7rcngwroDXpBoRyL+m5oBlzbny9ZyE0Y3gphtAOFvw5V
         W3XpO0Rh6TTXrwM7ABPKgG9T75gMCXCdg91Llc0wXgWNq6XGfKjwm4ZXO+L+iIL89Uzz
         Opll9LKVaqvfXZ6/SR+Lt7VP5SepYJAlXh3IY5inwjokTG+PEKtR/BaVd3DZYDUa8RJC
         upCQcT7j8Uyq99AhSdS8+jDoPGQHt6ONtlYy4hWWhM5KCUEeG8PE5EGN+ue+S16B8LJj
         NR3SE31B+kWA0dI5O+lEumxtrOR/njUx5FHDgexUkpNuFnyTFaX0mZNLm9Yk4TP8Zb3V
         4VPg==
X-Gm-Message-State: AOJu0YzqZJW90gmsW4paM+pPCkmpsqA0+T8bOOOZh90PpQMOCvxxTBBm
	JAgY9HqxzhLPAemnVbCw19GSR+RmIKCtDUPaSxsIUTEiGzkpIk/Wyympi1wV
X-Gm-Gg: ASbGnctMs/Ya8xXX9ks1e/oK+IEo5w869LiyqPqOmNUkZ9amuiFtDZ3uEuTlM5iBepZ
	noHXG6N4untViXcIeRWMqSMVfV2LDxzH2XKeDwfz+BNrYElQ6Ig7oEroDzgylCXturxFuW9XQr9
	ISM2wTX+ssmu14XTDnjSG6Vf8gtNCCmR3wEkUsFWKdQgzm82f8Mtbn6WuNVCIpIRMhBnPI9dufQ
	FD7jh/nWRB58Jc1BM56X1ZowJkatRO5a8M96EFV0XfW7+uj2Kg5+Pczkw==
X-Google-Smtp-Source: AGHT+IEY8DIQbwiFo4VQR5e9CRt9d31hc3DZZQvW9UATT72hbNjiJrtE+hrWHse4G+i6fxNqg+roaw==
X-Received: by 2002:a05:600c:4743:b0:434:a802:43d with SMTP id 5b1f17b1804b1-438914315afmr158633335e9.27.1737499983733;
        Tue, 21 Jan 2025 14:53:03 -0800 (PST)
Received: from ffc.. ([5.224.37.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df412sm874425e9.36.2025.01.21.14.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 14:53:02 -0800 (PST)
From: Reyders Morales <reyders1@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	valla.francesco@gmail.com,
	corbet@lwn.net,
	Reyders Morales <reyders1@gmail.com>
Subject: [PATCH] Documentation/networking: Fix basic node example document ISO 15765-2
Date: Tue, 21 Jan 2025 23:52:41 +0100
Message-ID: <20250121225241.128810-1-reyders1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current struct sockaddr_can tp is member of can_addr.
tp is not member of struct sockaddr_can.

Signed-off-by: Reyders Morales <reyders1@gmail.com>
---
 Documentation/networking/iso15765-2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/iso15765-2.rst b/Documentation/networking/iso15765-2.rst
index 0e9d96074178..37ebb2c417cb 100644
--- a/Documentation/networking/iso15765-2.rst
+++ b/Documentation/networking/iso15765-2.rst
@@ -369,8 +369,8 @@ to their default.
 
   addr.can_family = AF_CAN;
   addr.can_ifindex = if_nametoindex("can0");
-  addr.tp.tx_id = 0x18DA42F1 | CAN_EFF_FLAG;
-  addr.tp.rx_id = 0x18DAF142 | CAN_EFF_FLAG;
+  addr.can_addr.tp.tx_id = 0x18DA42F1 | CAN_EFF_FLAG;
+  addr.can_addr.tp.rx_id = 0x18DAF142 | CAN_EFF_FLAG;
 
   ret = bind(s, (struct sockaddr *)&addr, sizeof(addr));
   if (ret < 0)
-- 
2.43.0

