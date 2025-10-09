Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7626F28B
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760043429; cv=none; b=fIHafESiTxSTfGMYatYpqRZKbdrdwOucC/eU/+nGsBe9oAm8EFslyCLkq6IZ2AnGRzEf0sSIQDeegblqqeNF6rv+MIWPA8ir8NikKleQVo8d0wxPC1Dzv855RvK6usID8ItvpqfHNJgwhB7MkPuUhkgTPLp9NS93IHzm8n73NAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760043429; c=relaxed/simple;
	bh=ObtF3qvZv5wx0HantbNW95jKmTegeqMeLEJQ423Ulbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKmZ76V4zL5ZKWOtDSaQ08yj72NiYd8WAWizjuSY8BGoZnocqDVLabh77Ztvwv00Ipzn1lqyPnKuJsydUdmUn2g+iT8PtncywDbnxvy84xzvaNB2g3t4WhAhoc6j/MLgfwZTPOCT//QJ9snugakZAk6kTY2lxLAvXWAYAjzCb6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCugkbGa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCugkbGa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781206cce18so1558137b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760043428; x=1760648228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0U17ptGvtCie7i1raH5xF1gZt/QiHby33L+InxvW2qI=;
        b=UCugkbGau7AVU/IP8FKcMgKqTaRUp3jZwEfKeJeQNe7Tuhd7gJHpSc+Z76/NKfT/8Y
         o6nkVFWhae9wOsCmF/sViSp8ijGurADyMes3TzQGkS2O+lDa57pW4LlmF2PZ4IbU2bov
         z2U4aRI9vn9FaG2DAkIAhwrcHtcYPRsPY+127Wz3mSxjVCCgslcdY3BfhQRD0GgExH+n
         JspoSRwL6GG5AXNRalBfz08OPc1jRBFusO680aruu/d5Hvt6eLc0pWAMOLAevDfW32Yx
         aUJFEz0mkBRpuLbhgNfo24t5MWevaZ9rYrchdBA3MpNBbOvttt72lmPN0B3Ui1psUgaT
         TPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760043428; x=1760648228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0U17ptGvtCie7i1raH5xF1gZt/QiHby33L+InxvW2qI=;
        b=omz1GPXiHrl70wJbfdo3kBtV2Z3aSYWWUXFCKUp+OUywO/KUSq1NFajBVL72aWB/Iu
         gZiMbzHwpsdZciWWyt+QIz7yLU/BImFtlNIpNa6qjv3/oUpr6Fqb+HQYqR2PGEBYpW5U
         WN3uSDuONnn6pZVK+JH32ZRPNWqPy7auVk0G1+X5PN13KuZetDw58x8WgYFEMJFwBHIu
         tXHiFTAmrIAh/CMu5mK8v/P/JmB0gMp70jE/ie1uT0HKL2fj0ayYP5qHZDOJ3jloeBno
         cMteaR6GL9QxrckfuLfRy7i0fDBuRzmUJaTxnT/2WUCLQdejjMhGepzSKthxiD8jz7k3
         uscg==
X-Forwarded-Encrypted: i=1; AJvYcCXgA4GOBlSFnmeB/cTN51H6dHcrhPVxIA+aBI66J2UHVAUYxSfADoSkhw83PaqrmLOc9O7wqoo/rsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1kuw46/aCmpDYItz8wM+zWj+SVCmuW2W0J7tArFVGct32ee0R
	aHSvC7AmnYapMTAc2sUXYdmUFBJcVcH/CtBKZfSNluXQFrlry5rqBGyv
X-Gm-Gg: ASbGncswsY/MxXguC80wveP7lVp6DQnFE364dqVfcvpWF+B8SOSTEUGnjoxunkgd08k
	vsfQ6/TjIAwslQw2fYW4ehODQCLRPPVVNT/sf/LXAxlHaJ944j/QDaL+GpWuyOg4f0dEERypzgx
	LCbIFwhMwD+zSOyyRv31kOnLTE5YSXvWl3hxID5rL7MJ9wZHALFurFqzql04RHmQX2Sl8vlKmAa
	oGn3N+48t25WeJUA1Bohw+Q9c6Q9d41zLf2niHOP4W55ZldwNsn2JSDRf9GqUNUez9fqm+mSWwG
	sCu/yX7aXncHtmKfvBkUV4bfSieKp/U0T19tUaKH4+CHY8ydnpJNjVQyfAG8M+2TcszDjcxEzvp
	q8biSKoZVgjilKpumMnQbvE+vMC8FVaNensawi5qbHTrJFUrjAmCBJmIEf17ysOVlmLeUScsn+s
	4LE6p7efRQ0At7JT1A8zvyD1zrP5GJgyTJos3XYSfmQk7CJIn/osFIybDA/w==
X-Google-Smtp-Source: AGHT+IEQ3CQYxnXD0r7zcZD/W4QYBcUzXDWpnIYyhdFQwzlX1UxVe1+oMTH1I901zaf2ZfVIMH+03Q==
X-Received: by 2002:a05:6a21:50f:b0:2c6:2c4c:fafa with SMTP id adf61e73a8af0-32da901461bmr11185277637.28.1760043427345;
        Thu, 09 Oct 2025 13:57:07 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac8d7fsm787678a91.21.2025.10.09.13.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 13:57:06 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: add mps,mp9945
Date: Fri, 10 Oct 2025 04:54:57 +0800
Message-ID: <20251009205458.396368-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for MPS mp9945 controller.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
v2:
  - add Conor's Acked-by

 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 58ff948d93c9..08e2ca1b573e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -317,6 +317,8 @@ properties:
           - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
+            # Monolithic Power Systems Inc. digital step-down converter mp9945
+          - mps,mp9945
             # Temperature sensor with integrated fan control
           - national,lm63
             # Temperature sensor with integrated fan control
-- 
2.43.0

