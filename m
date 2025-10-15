Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2431931A04F
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520359; cv=none; b=nAzwmZbkyrrZn74XOR1YTZ7isGHYDxjlcx9BxqfY/VxH8LvzmrguLqslaH6fbsnGeUByE6fTyHWP3ZoE2vQ8snALeGDb5b2YhaH2WPvaxHCCPrs7KIKcqiNnLtlkasaGYi2xCtSW1fIZ2A4nJ1QjJWu38eUJzpViZhei2tckv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520359; c=relaxed/simple;
	bh=5RP+NYGBCAcP9sVodp5C4Ye+lxrfMuSA70t/0cFcM6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOIie1cwsN1z56nFfuzghZCGG5TjHuG6jG+EZYrbdjLejzMiKIHZWlUH3GoQBkQe5gY6HZjsn7GJ6AEeqEV0riSgxR32XnREJJktFJ8abTVr7VRHdQA6OK18ZTOCRJ/Iltk6ygavZTvs8sefKuLTdtctsqN++eXvTQ0gBaQj9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTuyCEAR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTuyCEAR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso1555076b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760520357; x=1761125157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y27mfP/51Mbfw358eu1yuPjNWUXysGxqMLnfgU6NaWA=;
        b=DTuyCEARO4iQJQ9fb2IWfSW5dkdngCRKm4XqHkB4PQTxsYQtbIfkER/oJJEHWF1QNq
         h+N08UwTzYDKH5Z1ff4VRpqIS9KUbJK67EKewtoHRklIho7DoRM6hzzJTe4DXg3n3AgB
         Pk9KOhWtJ03yY+ibQFlEWzNvahgMuzA6jMx4KDDmT8U/e1BaSw8A/+pChNq+aOqIwzzM
         Xbor6SV+qrT1hZKJEIsUEJWeCesvmNovglOc9oYEFrRPWL+4lPXfafRV+bBMiqBqoCHd
         xCQkLoIzSb49dI+zNphxQMwzxHdq+9LmU2N/+WulJgTOUKjCZmVD9AJ7BVUrFmTo8/3Z
         GRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520357; x=1761125157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y27mfP/51Mbfw358eu1yuPjNWUXysGxqMLnfgU6NaWA=;
        b=T9JK/0P4i8m7c9w2HHrFw0fSqem7G2KDJGXHwJoG2fxH2hWdz9cggOngp8gXZpFaIb
         u0fghoEq1CApaH09pCtGhL7kS/IerqSG2gJBon+2mbSvgz1E9gqfoNcH+7R1bpWj1NNO
         AcuBMlouHcWFiwdIjYIYPNngsuhYvp0ZWs01b96GZtdJGEmezGedpOU/jFMSQfPR3M8d
         E7KdC9DavSJuzO3FD8IucnQ/RuyrwFKr5CnKkW9YQAtyFzcuhRyp/11yFKqWPkC5TqnY
         TAeEq/SdRxTKrqzz8oCaM05/oulw3xSADoZJQgbZzS93SHjkv/eVRTTIFUcFu6x/jp+z
         U8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh3CD46KSRk/x6duaG2ntdy506g/ZEDwHAbd9wsamnzhPFm8uwmMvvyTTPIKJtq3Acq1zn4L7C9qU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6J+cVkKyLZRufzR16/SU2arjWXUgZ3jVH/xnTNOqLmCMDteQ
	SwD5h9ZUgcA/87L+qI2gzeQjvq/ES92R4fkzycu7aBo8ZZ1yoc5iBKWU7/BamGxv
X-Gm-Gg: ASbGncuq//uB6Or1dhlmVPyfxLx/XW0SbFODFV/KXfREInG4YJ5/tmOe1u+ztXoD6fX
	HVxE8LdVZCiCBIB4YgNI9uX0cJLEcCEoDQk8kTvh1Fz4bkl2H6PPQKXH+chr2CfHFGhlsUO3pPX
	l+hOVNr8DKZIfzq6WukJDqcJmeJi0/Pd/aEVD4AQheWZeXYeHPMeeJNa7tsG6awHhh+jW0BQpxN
	oBtnEfyBVHaSpKQ5UjOxlnu9SawKI7Lb4LZZshAnaSe1+QcHkTrx8NWk+tbSng3t9aFlAqNhljQ
	TiZ9R8F3B7DAB14UWvZwmrtqodgWSZD6fW1iOh1XMiJOrPc8U5bSOs+vx4bXwvB2AKUujkdfz1p
	HSgzNn29fLNdcHiY8westnR0pymZvqGrEOrMG6ZmTmDmQ4fOhplCoENM=
X-Google-Smtp-Source: AGHT+IFOSPYmWJ3lrYXq1lbkUMvnb1m+5qpQqFhS676gcwftEHa0HVMKsOIxqxjQgumwhzpSXoOROw==
X-Received: by 2002:a05:6a20:3c8e:b0:2ea:f131:e25e with SMTP id adf61e73a8af0-32da83e54b6mr34186934637.47.1760520357151;
        Wed, 15 Oct 2025 02:25:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb19d3csm17895109b3a.31.2025.10.15.02.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:25:56 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3B8E44209E9D; Wed, 15 Oct 2025 16:25:54 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sharath Chandra Vurukala <quic_sharathv@quicinc.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net] net: rmnet: Fix checksum offload header v5 and aggregation packet formatting
Date: Wed, 15 Oct 2025 16:25:41 +0700
Message-ID: <20251015092540.32282-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271; i=bagasdotme@gmail.com; h=from:subject; bh=5RP+NYGBCAcP9sVodp5C4Ye+lxrfMuSA70t/0cFcM6k=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnv08+7/YzS1Iov5ExLFkp6veDeYokp//6YBnbNj9pox mcWJHiuo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABN528vI8GD1puM3Hu8yXbLh Qlu7XL77e/658eXJKdnWVx47xt7TfMnI0C4a5atecnLN+9Dcv3YLd//+UHeC663FLHlV/px8ra/ reAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Packet format for checksum offload header v5 and aggregation, and header
type table for the former, are shown in normal paragraphs instead.

Use appropriate markup.

Fixes: 710b797cf61b ("docs: networking: Add documentation for MAPv5")
Fixes: ceed73a2cf4a ("drivers: net: ethernet: qualcomm: rmnet: Initial implementation")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../device_drivers/cellular/qualcomm/rmnet.rst       | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst b/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
index 289c146a829153..6877a326058206 100644
--- a/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
+++ b/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
@@ -137,16 +137,20 @@ d. Checksum offload header v5
 
 Checksum offload header fields are in big endian format.
 
+Packet format::
+
   Bit            0 - 6          7               8-15              16-31
   Function     Header Type    Next Header     Checksum Valid    Reserved
 
 Header Type is to indicate the type of header, this usually is set to CHECKSUM
 
 Header types
-= ==========================================
+
+= ===============
 0 Reserved
 1 Reserved
 2 checksum header
+= ===============
 
 Checksum Valid is to indicate whether the header checksum is valid. Value of 1
 implies that checksum is calculated on this packet and is valid, value of 0
@@ -183,9 +187,11 @@ rmnet in a single linear skb. rmnet will process the individual
 packets and either ACK the MAP command or deliver the IP packet to the
 network stack as needed
 
-MAP header|IP Packet|Optional padding|MAP header|IP Packet|Optional padding....
+Packet format::
 
-MAP header|IP Packet|Optional padding|MAP header|Command Packet|Optional pad...
+  MAP header|IP Packet|Optional padding|MAP header|IP Packet|Optional padding....
+
+  MAP header|IP Packet|Optional padding|MAP header|Command Packet|Optional pad...
 
 3. Userspace configuration
 ==========================

base-commit: 7f0fddd817ba6daebea1445ae9fab4b6d2294fa8
-- 
An old man doll... just what I always wanted! - Clara

