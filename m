Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2593126A8
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302386; cv=none; b=OnPgZ78G7GCNzFrsViZ6/WEnEMdMoC2HdOGPxzaX/AEOSrzqcCW3Qx6UuRjWi7jvtph6aet9H2oxvssfhX6VRPxdvOliZ06dViR2a2WL30gvQxFRM33uka6d1n/NFA0pHx/B7IW0Tau69zDsCq620Wwthv1kHPXMO1I9HKfTYwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302386; c=relaxed/simple;
	bh=1nfGRu+cQpdVI1u/u8x180bJnux/Aad+7XEoPErLSSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8XK6tkvuxmx/0GkhMNTMegz18agxLts+qEsGMBgZVk76SwCVXAGeTLG7JRE73JXj7BdDEI9Zk3iaOD25kl6n1SAXFh5vBktZlwidppVYnoexQGEh7JBY1II3Dbs3mojwZcSUWwNmcva4Jvi9tts6k7yhBJVImdBbJqNSMa0zQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgcxY7St; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgcxY7St"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a2738daea2so1667884b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761302384; x=1761907184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWxMkV9WkPnFS2UeBbKIDfqnrrcA5FBPCACezmc2M+g=;
        b=PgcxY7StUt51s63WVQdehNhrOfL9B0i2DztlDlDJQ+4r1b5ghB7R7GhCWZpXZJ6UF0
         HfRUtrJwbKFKAmy59Jmkiz1Jr7uMHzvJzQEezaGEzf5fs1mtL4wyurHaLVtATuKct1wb
         s1CTISWIt094EvZcoHm57qLuzPpiUbkouSghne3Pm3lPNR5fB8agcHxks9H0tSoDhIIC
         PfUScCqm5x/wKX2or0uV3IjoXrLSSJdWWLQ9BUP4UVS8temLEF9lkzB+JHWTRF7STB6G
         W7dOEG95kja30Bui78foFfBMf56FxsFJ6eZ4COEHHLMYrZ1COfYKTt1Aboypbii9vmgU
         Je5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302384; x=1761907184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWxMkV9WkPnFS2UeBbKIDfqnrrcA5FBPCACezmc2M+g=;
        b=TlJb5M/s3Syc6FXm7UY1lMSgXIkH6UAPiZIVEfxjqaC64m8edbyqD/x1Kkwb2LfkX1
         nPTeMVR5h1xoHIVhb/jQ3BxLiw1z10lNezcL2RtoiVVgoArslQFyW7Y17LDxjnTmmJPi
         fa2kXsQITMJvS7kwdCnefEW/WM1/oFmX5OjZVhvk8sp7q2p00JLUVhI92Q9/MsNfDcUA
         bddXEJ/vjEhzz+PiKrPAF1lPOTJgEvBKCIPOjh+NszWZnPAXzwkRYS/Ad6akok955//5
         7xsZ+9VlTTDs/x5geBe/4epVpbSGpbhJzRH6T7EPimoGJF1EZtiV8LzlUtu9Rth4Z7tT
         oYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNlFxDjbZVi0+hkC/zUWpfDVk+mHM8aYY7/ZKCZCxuGXc7dIPpAvnu/fHG02CYGIty78H0lKlB/aY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh29TiqMU3lJ5rKQTGIA0+btUMnnAhSbY/bVuhj5Ym7P8R3SGQ
	l678Lf4IY8ygP6MF4Ee7xV86tVi/tk8iV+EfkwHk04omHRy+BZFA5A4d
X-Gm-Gg: ASbGncvektjIpe2nIdSD2ugBS/GjHs0lQANMBkqYnZbytI+wUHs3FtJO96n8DU0DQ4i
	yv9+YRZfQgJCz27QxUUodHDW2rYwNWzjnkM4Yf0lg+NuWU+iRMxmDQxwt+WQHqtmGcBa9PUUr5m
	GAWuLg0eFFgGRFmwFFR9uTSRZQyxtFMrUfvViKCSIuHDULH2fJMmvkXgzEM7na21fhQDISWhbAK
	vxEfVi5hkONezguQaZZx9jrGrRDABAfZ9/ANlQtFqEJKke2LhO/M8esXAAZvEW4mAFe3HfRnMVE
	caWk0N1b9y4SRxmQDVXD8732dg/5+fJ/uZ3CkfXZLeEExR4N5ZKE3PiGAlPRIY3qBIzzqd0hHQz
	X7PMPQrQu0VlZgw2ozYnf3z+X4DfejAlOR9BuxKmrvOBBFt589gDrGBJatfN+rxQ0oKqzsns8Yf
	QRkOqwvUhPYsg=
X-Google-Smtp-Source: AGHT+IHEpl3TWDi9ZPhQso4ALduIvZe4iZeYs/TaKEmgdcaL9V+ffUdhwOZmNlpvsTLhO8POUDfQVw==
X-Received: by 2002:a17:902:c942:b0:26a:8171:daf7 with SMTP id d9443c01a7336-290c9cbc096mr4811285ad.16.1761302384008;
        Fri, 24 Oct 2025 03:39:44 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfc1cb8sm51175635ad.53.2025.10.24.03.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:39:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A81AE4209E4A; Fri, 24 Oct 2025 17:39:36 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Masaki Ota <masaki.ota@jp.alps.com>,
	George Anthony Vernon <contact@gvernon.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 1/2] Documentation: hid-alps: Fix packet format section headings
Date: Fri, 24 Oct 2025 17:39:33 +0700
Message-ID: <20251024103934.20019-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024103934.20019-1-bagasdotme@gmail.com>
References: <20251024103934.20019-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=bagasdotme@gmail.com; h=from:subject; bh=1nfGRu+cQpdVI1u/u8x180bJnux/Aad+7XEoPErLSSQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm/w0665IjY3ynzumWjmFlU9WajRq/nxTturx8uSVz+5 VahSdfVjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEwk6DHD//TLjxf7ybqqsfzR sJX32i/WLXVh1XyRC2GV6gH2zgvm2DEy7N2VLVElw9ql2TLXOE6DM1Xm67zIj2YWa1fuuTiB72I IJwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

In "Packet Format" section, only "StickPointer data byte" subsection
heading is shown as such in htmldocs output; "Touchpad data byte" one
is in normal paragraph on the other hand.

Properly format the headings to be consistent.

Fixes: 2562756dde55 ("HID: add Alps I2C HID Touchpad-Stick support")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/hid/hid-alps.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-alps.rst b/Documentation/hid/hid-alps.rst
index 94382bb0ada4d8..3a22254e43464f 100644
--- a/Documentation/hid/hid-alps.rst
+++ b/Documentation/hid/hid-alps.rst
@@ -104,8 +104,10 @@ Read value is stored in Value Byte.
 
 
 Packet Format
+-------------
+
 Touchpad data byte
-------------------
+~~~~~~~~~~~~~~~~~~
 
 
 ======= ======= ======= ======= ======= ======= ======= ======= =====
@@ -156,7 +158,7 @@ Zsn_6-0(7bit):
 
 
 StickPointer data byte
-----------------------
+~~~~~~~~~~~~~~~~~~~~~~
 
 ======= ======= ======= ======= ======= ======= ======= ======= =====
 -	b7	b6	b5	b4	b3	b2	b1	b0
-- 
An old man doll... just what I always wanted! - Clara

