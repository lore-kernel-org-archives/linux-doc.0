Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89104384239
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 08:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650412; cv=none; b=jU44vRxA5k8ZBAuBWv3A3pQciaeCPXtQNrz3o3oXjfvtsY2XAgImVqZLz/eKDCwuomGUthANiT0YqW4RV4SaZ4yq73U6h2GsbKdMHYTuNuC7dxT8FJEwOUzbEVovypl59TXgyw5zUE/NKs8PNDRci2Jzy8Gu6YH+ezWklpXFhfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650412; c=relaxed/simple;
	bh=RqDoIW7WugtGdMXzE2eIsOee9DNLTBABdKsQLGxjo/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jo0oTKvmGq/V11oJ2hqLM4sRumluzZSrXv57TrKsk/J1KbDRm1D4EN9Kk5cDEp02RvZYHv7iXUcTYB/v+A0doOvsC1D3Hly8/BDy8v7tSqhTUsnVuwO5zYpugTohCEVApi6HqYlDaJZUWnQ9pFF0hKBynvoCBhYs3ppJMUayrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE9jzYeG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE9jzYeG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so766852a91.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773650408; x=1774255208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOAXNQ1o+ey9uPPxnP3jzFRrFOSx7L8yN/7up+eSyGw=;
        b=PE9jzYeGulKUydIB3wSH9fhXim+4KpvdXtAEea4zUNQuvWog7L7glTEMUi+UgmXYaJ
         knuqP2+ub/MQQ22d6a0oj66jTdoicscvj6KC88/N2Cuzq9b7i2NDclwDZJkBlI5npxTT
         55x/MBDoZHfuVbPHyyq9KJFvD8iKRsHA1mkfICDfFuTu3TNezG0bSjFovYpwSleDhder
         4iHd96BpBUwC9K1TXtZCSb4gIPurbO3oKdSC9IU//dKfEZfc9m5GC+tNVF1/Qc+sH4bB
         dJW/54rlVoUWop/xV/fVfdjLdGDSRZyBd2KgEo1EXvAtb9HrOeFAS+y8YcntjA2lUzk+
         YfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773650408; x=1774255208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOAXNQ1o+ey9uPPxnP3jzFRrFOSx7L8yN/7up+eSyGw=;
        b=lTGic9c7gcch1v1ykTOR6yXFB8mBI9rEjsFbsXjtQC0kLQ/9pI5oFSOCAOELucIRJZ
         8Unk4+kMZiygyDdT1Bo3AYEd92PuncO9RmcA4n7bwhwJMU88JyUldiK/mG3fPVmH4D+7
         0zmhyRsu39xFzdczlWps+eHZ3QrEFbovHXEc4lAy2I0M/YVB5Tu2eaR8/ZlTP4Qp6w4F
         iFJAjLlJC75D6YGUH5YkSEb1bSiPlaHahbxkmwE3qcBBiius7LzlZzAn6U3RmCNh0EG7
         JtYJwtrsyR8283C0m5boVeHWDEgmO3diGOKvzHxJiEBOEzUTuOPKCwVpjWGRHtOoLypE
         8v3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFb04B1c0/eeuMZqWBu15f7I/16Uywyp1QFjNfAVzODI2FXpRLVVwnuc06nWSXd+tBfB37fl0R0w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSOHcEZJeL8nYNXunVO52XXAuvKf4Z+j/byGLGbYvMQefTQGew
	C94EtWjjbnNOqOIZlez5vH+C9xCgxPTeZ6ixywUaHnmfb4avtpEYLDdAHraA6r1N
X-Gm-Gg: ATEYQzzUG6xhScX4D9047JvcwT1j1GO8qT+TJ0uiaWOETLLumdkjvPpU/CCIQRUs4tE
	Mm5m8S0WRVh7LCGY4NGtC/1tD9vmEME3oxlJQDE7dyVmtf+2UtHzAdunJ2vGZQZyiU0QNaPAm4b
	HSPbUKcQLEpxsZWFFOtCTKb5wqztXJ0XFmDrtSgP8cKv/tRYLEV1MbqzfRq3e5MJ4CjhpBTgFnq
	3hkGC/YT5T26d+567OBCBh+P7B6w2w8vmYi60wffctoAjiNozy+yu7UAj9FyM/ySR/2ADdcJJMu
	O5EW8NYcb0pKBUrSGciLu5vZnzemjJ4xnMIzPnC8CKQElUGQxyx2S46SAqa7CX6ySmfgPLyWYGP
	1Bv/kxXGr+SkUHXXjEFm65/ODqbkASD/Ju59hXCw8xn2V6uLhqUOLzpeCIcVX80GrBOCOHizRFd
	olPsTbQcobnb38MNASKWQ=
X-Received: by 2002:a17:90b:394f:b0:354:a332:1a61 with SMTP id 98e67ed59e1d1-35a21efb0eamr10430000a91.5.1773650407761;
        Mon, 16 Mar 2026 01:40:07 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0537b663csm45946865ad.51.2026.03.16.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:40:07 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 16 Mar 2026 16:39:33 +0800
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Delta Q54SN120A1
 and Q54SW120A7
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773650402; l=1104;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=RqDoIW7WugtGdMXzE2eIsOee9DNLTBABdKsQLGxjo/M=;
 b=Urz65Zd+H73gQS88yzQ3kRn4fLB+M4ty16QWNJyAuAqbd/RAkbZ3F5jmBxxcUPWOYaVRBNrr4
 Tg9lnLKT2OLAOhu4/M4VJZhMzGT60ktCu/X/JQN+0BPF35you6kXdYX
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add two additional Delta 1/4-brick DC/DC power modules,
Q54SN120A1 and Q54SW120A7, to the trivial-devices list.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..f430e49b9ec1 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -95,6 +95,10 @@ properties:
           - delta,dps920ab
             # 1/4 Brick DC/DC Regulated Power Module
           - delta,q54sj108a2
+            # 1300W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sn120a1
+            # 2000W 1/4 Brick DC/DC Regulated Power Module
+          - delta,q54sw120a7
             # Devantech SRF02 ultrasonic ranger in I2C mode
           - devantech,srf02
             # Devantech SRF08 ultrasonic ranger

-- 
2.34.1

