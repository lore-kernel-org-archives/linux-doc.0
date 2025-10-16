Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A32FF669
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760606770; cv=none; b=EPCdhAkCmDes6f4tGj+Rj9laaC6wV4U/0BFX61S0F4AO+p2UyUzLETb98kozotltSpNB3PIe2EWtm7e57HOgWkLX4+9mFA2ty4nTX7k43rq4UDxC5K5NXSuLSDU+ENafFYHBSwoW4gKG9jDBS6igcQx2kN8nZq/qt0eMYxsBX90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760606770; c=relaxed/simple;
	bh=iBze3ddOIKfLFzK1PdZekaZ25CQzX4/eyJkqv/S9OE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLq3Vw3CyUA/JBE0BzfGbtqIIPeF0qxAXrOqOiVtJwFd3dlteTSJRU7MDNCatYCOZxogDzPSHd88QTMjfkYUQDOVlGsLxvYQ+3lGncqCiPd1vcG/zMtItGPXub8mOFODmUDIwtiQEIQqikgRzCc+1H8ZkmV4tuYz/lJ07w3ee+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7sFHNFp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7sFHNFp"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-79af647cef2so500423b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760606767; x=1761211567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Qk2LA4WjclYE0CKmbUH1V37mhz7MI29tST0rKIcgrs=;
        b=c7sFHNFpNu3v0X4f8ofeTAqwCvknT8qwOus8U1fcSkrAQg/uRWnP3ZgteZlCVUfULX
         i1T/NmU7qDf1tE2MS8Uuap8Cy40p2EdhhyRrL2UUQMnwQyzLOl03bIo9bMiOc2Ebi5nD
         ZeelpYRHMf7B4SGCtC7CJkq+kJ6kiQf/V3Npmh1+jF8nd5ghPGLYwVXaeBRKhHUOWJ5r
         t035Y9AK+eQ5QXGDTdxjRSjhSIcNWvjhlxbQjF3GYWHZ97SMPt4fRbz0Et4KXkQyDgc4
         A5xmwwTfVCayW1ZRXbagqpMNa3p6YMKzkLGhwckTDBh77x+hpMWrOiPax5JrBORwNUqy
         ZVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606767; x=1761211567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Qk2LA4WjclYE0CKmbUH1V37mhz7MI29tST0rKIcgrs=;
        b=pdJYoOSlhFIH1KqpQRh6H3aXKC25L5NRyAmsCJkqwpcWN1q66MI3bDbKiw4DCpS3zc
         EDLVkn+4nunB4EDDO2wf9TMtFhhjz6ycETLl/1YleINXiheELpPrk8ZP1ZyU8caceyg2
         T+FeJQ+GrUuqDy4eITIq+yBaBuJ380ObioltK7RfIilxy8p5ukp+JC+nQJ/svuwQJ2Oa
         bjdRMeJ/dKJSIHaFVTH6CbOB3zFz7QWcQtMRACV/1VOv5FuY4YM00dFKS6SHoAfejwVF
         Vw3F4+SWlDNbCEW3M5U3Z1DzkB4t9XVM9By3Z2ZZbbV459x/fklPdeTNSwFlW52XJssm
         h0Aw==
X-Forwarded-Encrypted: i=1; AJvYcCU/yLdigYNaXzc5I8sElKX/xv2e/Xd8ZqjV5gZk9woaivAV2q3H84hmUFPc9IwoZnUcao4SjR8o8lE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7IwxuWe72IwYAQk4d1LhvckVufEXiO6qkQ/GcnP/8tfPkPSvf
	A5GlkTFhwxkY/7MUjKOEd5tJwJ/2Qy0ZI3FugAly+Ac7LVlRkSlcOMn/
X-Gm-Gg: ASbGncvC2U+2ydALt2OZ2wud/Dx8p4ztGbo0RPZhKG9TEGmHi0KSo0Q+yrII3nlcuD6
	uwdfBbQtbWq4stnvHxJCvfXfZNPXQNDAFDu44pGHP/TwcTLcC+eRygdSBJvSnbOZk7tA8zKRgPW
	S7aSeEXR7k8x5HP3gM9UAoy53jyeMfUJgDf9r7n7fDKgJU0CY+/Y7Ug5oL5s/NSr+QARdtbuKYM
	2Sy+RLGqMMz/UznVhryqAca22NDsOL2gyku8dElgYCaErb9ScW3Pdz1xJWKpSLbf4GU6UMa5Dxl
	Np5t5H/EPVGjpewhzsKBTeHkQN5YLCX3ATvtvL+NCP7vdHHOK7oFwYBM7RweSTWYuR8NEbtR27T
	DKoIjt5gjzT4b0N3bWCwNKhCygif8NMrmfbS/KdPN5E7cfrfrLJDUJdWbgvPjLid9d6IK9bOzUa
	su8+am12VT+CKzog==
X-Google-Smtp-Source: AGHT+IG1PdmRmxoRDMSi5DK2MpnEmPqGVIP2q7n1nkEAGkLjqVGAPOgqQssfSdw9ZAOJvcdpLJzgcg==
X-Received: by 2002:a05:6a00:13a6:b0:78f:6b8c:132 with SMTP id d2e1a72fcca58-79387c18f0amr39958615b3a.29.1760606766779;
        Thu, 16 Oct 2025 02:26:06 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060a38sm21903407b3a.5.2025.10.16.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:26:06 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 761B640C0938; Thu, 16 Oct 2025 16:26:02 +0700 (WIB)
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
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next] net: rmnet: Use section heading for packet format subsections
Date: Thu, 16 Oct 2025 16:25:52 +0700
Message-ID: <20251016092552.27053-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856; i=bagasdotme@gmail.com; h=from:subject; bh=iBze3ddOIKfLFzK1PdZekaZ25CQzX4/eyJkqv/S9OE8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkfdp4z4zP/tXdvtJUyw70JEnz/uQySsze9La/wfti74 g9H0oK2jlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzkNwPDPzML4VeKWoEz70nO eHasyOLtJ82FE1y8245+yzv0qrr060mG/17LJ6TLhfvMj5rMJpKa38DaOOdChJ31ZzPZ6ouC5ao nmQE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Format subsections of "Packet format" section as reST subsections.

Link: https://lore.kernel.org/linux-doc/aO_MefPIlQQrCU3j@horms.kernel.org/
Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../cellular/qualcomm/rmnet.rst               | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst b/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
index 289c146a829153..1115606496b67d 100644
--- a/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
+++ b/Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
@@ -27,7 +27,8 @@ these MAP frames and send them to appropriate PDN's.
 2. Packet format
 ================
 
-a. MAP packet v1 (data / control)
+A. MAP packet v1 (data / control)
+---------------------------------
 
 MAP header fields are in big endian format.
 
@@ -53,7 +54,8 @@ Multiplexer ID is to indicate the PDN on which data has to be sent.
 Payload length includes the padding length but does not include MAP header
 length.
 
-b. Map packet v4 (data / control)
+B. MAP packet v4 (data / control)
+---------------------------------
 
 MAP header fields are in big endian format.
 
@@ -106,7 +108,8 @@ over which checksum is computed.
 
 Checksum value, indicates the checksum computed.
 
-c. MAP packet v5 (data / control)
+C. MAP packet v5 (data / control)
+---------------------------------
 
 MAP header fields are in big endian format.
 
@@ -133,7 +136,8 @@ Multiplexer ID is to indicate the PDN on which data has to be sent.
 Payload length includes the padding length but does not include MAP header
 length.
 
-d. Checksum offload header v5
+D. Checksum offload header v5
+-----------------------------
 
 Checksum offload header fields are in big endian format.
 
@@ -154,7 +158,10 @@ indicates that the calculated packet checksum is invalid.
 
 Reserved bits must be zero when sent and ignored when received.
 
-e. MAP packet v1/v5 (command specific)::
+E. MAP packet v1/v5 (command specific)
+--------------------------------------
+
+Packet format::
 
     Bit             0             1         2-7      8 - 15           16 - 31
     Function   Command         Reserved     Pad   Multiplexer ID    Payload length
@@ -176,7 +183,8 @@ Command types
 3 is for error during processing of commands
 = ==========================================
 
-f. Aggregation
+F. Aggregation
+--------------
 
 Aggregation is multiple MAP packets (can be data or command) delivered to
 rmnet in a single linear skb. rmnet will process the individual

base-commit: cb85ca4c0a349e246cd35161088aa3689ae5c580
-- 
An old man doll... just what I always wanted! - Clara

