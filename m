Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE012248B9
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298525; cv=none; b=puGVrJqhQk8tui1ZN5JtPoYrU0zpWFhIUijiw+Ngyel2Tkwb7Eqcdg/MxUj3wgw6/En8zuE1QAPZLdAWIA1OwlWPLu0To2DXmhgNS4u4bYqL+P0GGAxd6qIsAr4IRqvCTCOuABEI11aiE6o98M0dWoKKpI1d65AB7rnSJ15JPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298525; c=relaxed/simple;
	bh=V3ZGNJ0LedluqimvtgZA6qyCxj5uWwOAnO+i36Sv8MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOBy7Qb/ZBimVfRL6QK9aeaXksBj2/94Vfq3SYznUIAAmezFOEfBHB07q6eTW41JTdZVrXFGOZZQPBQfXChvvWLpO9wB/DBVS1PB5X5InWXoA9PH6CKCWPtwmVVpWiR3vxqu+ZVcSy5kpSj/3QOxs/GIt/Q46we9YZ15mt+oGbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuv5uRqU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuv5uRqU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7d98c1879so5865495ad.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298524; x=1770903324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8vYVSxf/f2z49Q0aR+EfpZkckZVO18lUKU02stUhpQ=;
        b=fuv5uRqUAtsk0b7zYyrJ2eZY+w6eOQs6QEf5P7mLQdBTEfQTb0aA2OxC+ewq/E/0DZ
         aBaM6BZj0bcEuA8Nf7wxs0mrzyZ0sp+m2iVDTtAvCJWwhdxSQAJnZNjEJM/+/CjFXpHP
         VlFd6r8rqwGz/PWaZk8mqjBX8fpOHj8VvCkH/JvecOmEoZMMEopjuLhp1RO2cHah2eJt
         T5coWEpYZ4T5f6nXNVSgkClah5p1azk8tHQapweV8oeywLMHgKYYpGyQGi0A7smE7py3
         898DV2828LvtCLIVEDQ+acte3zrhyxGhV6+V1p+1Snyu6SzbPDoTJsMsmzf4XXDG513q
         rNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298524; x=1770903324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A8vYVSxf/f2z49Q0aR+EfpZkckZVO18lUKU02stUhpQ=;
        b=VSEgfjXTZdW01/GMQZzCSHcD3kW1g9hJ4h2jKjdgQCOMUBK/SwYNB2+A2tpbzXtvMw
         pCJRDtOCyQGWcQQZnJIhDw3SUirby4VQteNDuVcq5kaIsMTLULEk1qjuXRKGX2v1LOKl
         y/+x39gyrAiZ8ke3gaFM0Ns41nFRbV+ppvGreBxQk2IgT8qSUymqlioKl37ndFYBcKhR
         hkrEhEsCGA50++x2kxa0P9ek5qFMJypY43/+qmLzg2aZ171qQwp+6gUWWY+TaDA90X0j
         5UuST5Xu1TaO3QlRWERUkYr8EwyZdTHPH4Ny3kr0FYiF7/0sd00KsnZ09mc5KXICQEx1
         ytuw==
X-Forwarded-Encrypted: i=1; AJvYcCWEyOLrQOi7Q2VIkL+m0aQYPgh95vD96Qg3KB+Ls4/d+9XiGkuu5TYyJrYxRTtK9Jlk2rndxNkKdbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPO9FEvrpbQEYP/ij+koIoJW8vgp89ffD+TBD4/6euf9q2M/k
	qLLXTPqBCB5fdpQPrVUOCtNmwJnsDKbWB70Idjw7AtqiES+bu+W7h6cx
X-Gm-Gg: AZuq6aJr3FYRV5sOblkdG7IO7J0wKaEGklyrrbMh17xIaLoZEFpdXifAr1s80whLkM/
	AzVZFTE2391GLbD0XXI3RFIAX+VWon+KUMG3GxPsymo29xf6VhdCQF6T1qzVxVPiFGLAgFLnZJB
	09xQF7Tl8+3Ii7ySMFMfwUUuJh7p93UDr1nzRFPanxqAepCRZuvMEKbmnYkQcdK/1nmqUGmz6ww
	W7ubpFSErz4XjNTWzJYwT8fA1W2Kaz84Qqw2wgCQC+2AHx017swxoHLXvAZZO1KTqcu2PRz5IrJ
	riLRVgBf5a/sgONkOXrjzQlhUn4RmO+RviYxJUFQIqCq1Q8bE0LQp9mEXgdi/TlO8YlA7qLMYUL
	K+wIfZ4y6YCQzH5IhKdW6nFPCzsauBDsrx80ElG3zmllREVmVheHXqkpeP7OOu10a1tFbUFnNjI
	JZ6iABmkUNly7LBe7eoA==
X-Received: by 2002:a17:902:f710:b0:2a9:4bd9:bb8a with SMTP id d9443c01a7336-2a94bd9bd92mr5539275ad.25.1770298524251;
        Thu, 05 Feb 2026 05:35:24 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:23 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 05 Feb 2026 21:34:36 +0800
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add Delta Q54SN120A1 and
 Q54SW120A7
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=1051;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=V3ZGNJ0LedluqimvtgZA6qyCxj5uWwOAnO+i36Sv8MM=;
 b=t+XN7WVJhMHTiJpg3h4ud773FQ+U6lnwk83FN5iNuK6ZbEUGL0j2a7xxYrbDKKPVQWILQW3mn
 0uh8qHG82LgAYxyGzmRcV2IpoS4IH5R6b28Xi93A0HNjT3wRyNq2QHH
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

Add two additional Delta 1/4-brick DC/DC power modules,
Q54SN120A1 and Q54SW120A7, to the trivial-devices list.

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

