Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C2430B51E
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 00:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507372; cv=none; b=TgGZ31Gifsnm9XLiV/DyvILy+1aCB7sLO8CFcSONQmP7bp2+wrkgyKElsCBd6hFbwOIoiYcaivW/2C55O8+PAJnMSniKgR1tU5unn6dvP6L30F98syEKG6ppsRDERefXyCQgQL4GQRtySWcl9HjexHy9psXf2wx9WZtBR0kGk6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507372; c=relaxed/simple;
	bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUGAB/wwguToEFl749A14aTnDTWX0DMsUmgbgsMXW4QjMbKjkPowIMGYzK8p0/Yxs9Le8ApyFnL8mCx5FMdpsd/vt3FIVelUpMFmq+KwYMDJyynB7Q3ibkZ7ERdW6osJ+4JQwLUKZ41gFsktJJT3b/eNbby0knm7cYVniTHBduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AgpMKZLH; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AgpMKZLH"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3518cbe59b0so849424eec.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507367; x=1792112167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=AgpMKZLHm46SBcoVPlb13Et14TDyyKEgdg8vxDk+wuIx4g8HguzhTOyLmyZc7MDl5I
         SR2H4BpW6E15ARyb6adCQIWppNLOpgB4J8WqLtfhaDPGL/ddJwkmwCYOYi9ov+K28W85
         VgJO774iW1x3dj9NpFYIriRW370U3NzFKMN1PTR7JXbNan6sGtRFFkq17WqH/j+mduBD
         NFRppLByNscAcXiiF9ES8cFmUuxMzfzHK5u8Uo6p/GPnhYf42KoNWYDI0E9rgw0zikxF
         gXX5nvQ36ZL3Km19S1KEzFfdtNUnAuegWHfrPF8sd05Et0TOt55JKevFflUeFLOUsVcG
         6jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507367; x=1792112167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ski0uA9iXMK3c01MK9RAwSltkfrOdMZ7bYUX7Oaxv3Q=;
        b=jiUiqKxD6iCjxNmUchVIEmYCNr8RZq0VHBwvwdOWZ3dHjXXYciHSphBKlNnrXaHB9r
         JnsjwXKfziimr4rRMpOnmjxFHJn+4ltNNiXZc9WrjCCAcHGkR/xIk6+xXEdXErhbt2yO
         YL6wMI05Vbei5oFKA9fpiMAkVOiIVhdG03xPj+W+tNIJ8Sk6l++4JMDBsgIEDo5gYMFw
         TaNkMcz5BOdw7oIkM26uCrmXLRyLdNZLvMlv6hQLbQ1FD89Dc/Mlw90MlwgVnuOXFXSz
         yjcUV4HqjIEO+JWQ9n3j4JM4TbcaDcCOpJIg3ObDlgV/u7WuFARm7+xmbUQ/qOia/52B
         x1YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDur9x+tJb4fgLMy67cKbExX7MdKVJ3jnFjm5xYGRHCs3oVngg53InOlFSbrZNb1UN2pw598DZ6KQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYbXjktej5hmnfFIUpjtouRolsvV+r9jpsm0WwPrbqbMT/CdvY
	rWYhJbiImlA4zoD8HbhgWL/I2s++s3cGlHIWHjlZ7ZeevQKCCTCLjfR2SEPXTOrBo+w=
X-Gm-Gg: AYBFou1RyVnVbvEiT68AB+zlzRyLomcLmnbJrZ0eJh9Tg8TNwXzoMvORJvpCmi3jPCL
	0SSg4+shB+z07nf2FFYhganTvn63+TcARSrnyoGonGMiSayaNG/ThDLonBi492tUSDqHBWPeajC
	jjiV/moqhh7bc3Tib6rYwF4vTaCV4wfjrDYqiDfdLUqy8gHvIZsymKppeXOFjZa+66VftqEW8H4
	AJ015o2/XS2narrZb5rE+R6ehVgDtpA4C1UnAtmokzqjQG5zy6VDoVo8OWauLX+IfyWS1n9p/f3
	CrJE1ya5iJFiXGgfRXVTLJ1IsgfZ4f03Fa6xR9Tt5UPySi7mfSNdKXSQlLVE/MPYD3Tc99CGAdb
	FToBKNqDMoF3XbHTmFntFe8jNnxuvx3MpXQ8tXxfzjiPyWkBixH5wlqbpeXPyAiiH0/dZ+MEqMe
	hEM7mdqtx1ntFn5vsJMEp48yzP1ECz72QMRKqvQ5XSPIhjBkFzv9n/j2EadtkoHwpSVLLW9qCZA
	A==
X-Received: by 2002:a05:7300:601e:b0:339:851c:4c1 with SMTP id 5a478bee46e88-3536c593e70mr1308972eec.18.1791507367192;
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:06 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:02 -0700
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK Corporation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=899;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yy63d1ySOFQGedeCRXdnVMp+NykFLNzr65iketikEgg=;
 b=CWMjSE8OHUG5p6XT1QboxHkd/VxQbJxvEmdWkIGcaaJNDehDcs3fHs2t8zbEQi/i4aFsI7j1Y
 UDZ7edbIvDqBH/d0wIB32JHBhUCNiOPPI2zgI8zVgcWuC594gZIMm20
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

