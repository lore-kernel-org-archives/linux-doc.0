Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482227;
	b=q7zHLCKUOH6oDyPFTm4VUpdCAvLQB/T0QqYSb8VQlpxXe05yHVYQYdN8CYg7xkYUN1Xr
	 i5/OJvG4VyQ/jJCnSvTfTf3iKteSkJKtNTZMezN5/6GZhWf6QYPomueAdGfsD5/bQxIRV
	 J3HNWXrnFVFYvnieitPqffefMAO47zodLl0OisR/fi3DMQLvDyXaP+DPDRkTP90IswiiY
	 jkkr3/7vomREosoiSZ2snAV5h74I4EcXENrk7ZUGBriOxGRX+e4mxevPsgItUr9zgTf8S
	 MmNgrxLr1dCqY2zdaTIKMYkkHNMC4rjlEXml7zKB69KCkEOZhy7MuAd+jwstQj7lCaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
	b=eaWcLdVXlz6qYO7wxrZ7bk8Q2JCfrX79fkzVaiD58KfhR4AvBuKAwpC0aPPDPQtQrjhz
	 kUxd55LCxD6IGDb4HVxryGTiMGjDSsciLZLPdgCdC0U7E6CpcKNjLDXl4rqniP0bAp+at
	 Q/TWmmpv2Jz4jssstFPAN4KF0C30tLLbh4fVq1WqzR6d7x31IJB1IKLD2oZhA+nimes7V
	 Wz9+l6Y5OcLotggA90ttNid62HRlIFWT4SDNOHWHPMl70x7b4ll1AiRRMVe3YPxhRZwuO
	 ZDxa6zEDJ+1vQcLQqmxLOGGr5I1XgDnLMFrmKyIgTwQ7dWx78rXxaH9gTW62OI24itA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61363606A322
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 07:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61363606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GDn9T631
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so387567eec.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482224; x=1793087024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=GDn9T631t40lyH1UVbWyfrqO2wY53BDnmdzrehZQ2IJwW6Log2x1p1Bcxo13teXjZe
         S2wsXRftK/azjVLiiVcWlX+aqXAo/U/7DvDfEBj5nLg1jsOxzLmuVHGiWLAglDgo5Nvn
         dl4CbxxzT5t4SxM4WB514iz4fde1by60lK0x7F4gmG0uYoz0aZHQz7eeWP2AOIDM972z
         J/++zzNo8p6AwQRgg6xkmfbAEgf/nkyand6KmdTmPY9H/ONy5pii/tir0nWGz/B64xiG
         7lCFPR1Kcx3KzO1angnGq2Bu/rD2zCxW9qeQOeLXCJwkP8vwuyXK6MjlBNdsx9i+FUGk
         mS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482224; x=1793087024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC+gZPV4aotNwixKHOtH5yvTfu3V/PuIgqyMW818p0A=;
        b=vkivfnDZ6oiOqqHva8DOSQAI5nHm6LlNjK40szEbIH2Q5d6FZ6rQdDR5+7l4f9WqjU
         cBZG4z7Ku7c/IVB5Q8OoS89aK5U0+LnKeCapCsTYzjsTl6uBLE/FnQdxG7ticoUVwTFC
         R4ERrq9kudX+4qGBXh6sPGX5Wax76YG3CX41O2aNpWMpSWhqW8IGE8vIHBkyb5pz/TUC
         QWbcESt/4fEBY5MfZ4q/fGAruoRZ0hEi1L2cNrKKAlyL9xEUz5EWWrtHyoh4HaRdZq+V
         cYxr09N+jmb8MjBWb7kom3lBAJaUmitFiL4dfqY7mg6DVwe+MoQc2U/InbeQ1m/q8YP0
         dhOg==
X-Forwarded-Encrypted: i=1; AKwUvBz1lSqcIyMcoyeqhUePJezvY8L4tM3Pui3WiUFNldQ162OHC+Zz1tcpUb8PSI46lJZvCxgscKgGjBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1VEygmwZbQv7VhzR+Pqz/OoHllKyRGBHmlZUnJQ8ZjTIKBdp+
	2B4+S/JmWnsXyHd5M2hsXiH1AM8kJmh9dFevLDDNcsxD20A/1UEwAKfwfzTU753v8ik=
X-Gm-Gg: AYBFou1ljCCaSKETClL6BIxNSUH8V4O5yu1ArhlfpHIcxKSacOAxeLNRvIt4IwiQ2K3
	yRSf13U/4XZDOh0hL1qx/60iqVl5p7X2Ph5CJnexfgXskL4AH6lkIhM3xGNXfarNRCPuwVY7f5S
	pNlaVNf7xJ/G0P152Q2ocZh5EZyFDCY0htSVij81XsFM6Jh1XAgv75OhzW5Jitqvg4cqQmIguCc
	knhf1r1V42bJ+CGhofQyWEPOKyYpfV8/cZBPZM+x2Noh8ajJMZVlgCYazFy1cYZ5P3kh8LinN6i
	QHAs5n2ZeP1bf1YQKyBm9M7k4sZYIEt6qbvLTbXTxj2sIt7VAIDGPtu8O7JjCihAn0hvnlXwqMP
	IczE1IH7g5KBBtpVbXS8vd/Tr2zYAFCLchIqXU2emjHtLxgCtkejjzsWPw0zgNBr6zX6mCpcXYL
	zyB8eLy5PJWc0zPFGQx/0MXvyJh/gXguf1qMdoL/iw4qfqjWC0DFcwfiDa+ZydzV5MYAoqB/3KQ
	g==
X-Received: by 2002:a05:7301:fd82:b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-361a302ab1dmr13910871eec.40.1792482223591;
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:43 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:38 -0700
Subject: [PATCH v2 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-2-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=1094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=TihSnAyU+oM6Z6xKPg8XulncCvOA3Lsm7O7YZANDhAs=;
 b=mp7sRHtCF878AE0rEF4+2BUgFCTEPTTF+jqzbW5O5Fcke5i00ovvP/Y7ZA7M9N0i9MNyG4mPk
 xxLm7V6x2itAYD2v5b+PsbOVOFtGTCznbSP8qYSxGqZRZoJ/NEX7OLK
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
interface. They need only a reg property, so document them as trivial
devices.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..996e1eab52bb 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,10 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
+            # TDK FS1525 25A uPOL regulator with PMBus
+          - tdk,fs1525
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

