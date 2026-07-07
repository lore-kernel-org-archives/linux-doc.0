Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC53FF1C7
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427167; cv=none; b=X1vJZSVTqAEt50uSJh7mqYSEzEgy7YUFKAoXPMjrOsRUY2gp0eQWbpXCh5g2XrIGz4rH5IDQ3MIHfz2b0MPkh8JZKorC6aRJy2oT+gyqlhQ/LuyGQwsiEwvCoMW72svy5DgSvq59p7NPkDDd44bgU8KvJ6lTk85mahuiu+vty8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427167; c=relaxed/simple;
	bh=FH8tcHR+Kf/Q4WoeEbtw1NyA3aDEhztHlh0tNOOUXJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikPfmWccpeLclO/slsRH2U+TgooNEMJJ1sBc/yeR6x8af03JLAciPRDN5hWzQVln8GY3pAfmi6Ntgcsak377fZCNqD0Ag7OX989hDjUBbHhGG+/dvGdO9ckJ1OyMLOhKOLORJ8b4K/TVqcEsejXe4prpCbbKyST/eXIKGjXwohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7FdmV2i; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7FdmV2i"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c7c61b5292so58862835ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783427165; x=1784031965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IgLtos+kVckpvEahUESh1dXWtYuNLZ70j+TeV2rQ4j8=;
        b=o7FdmV2iz1KaHdVLavYCaIRIISC/kCF8tM22letnR4qRyL4Zw7/ApG3Zz0EeTngp/0
         NfNcqYYher43e35vSpifNA5sgX8b8OHo5aWJS3VlBA594YUqE7JqlD3/M1zIc0glYzWH
         6wQLsEPgzE9Wzvzdf39Dn+VEjGhk2YlRZkTSG8gVzFyZHCAGx4erkjksjNXaZrEECOIS
         04E3gRICbwRNSzKVCs5Ukj0Azyo/IpIZf8j1Di32uma0iW4K+dsOBvEV2zhIgwk71Qqp
         fK5B5M6//dwwMqUlf1GoV/Jo3WcrOkmM7TFeaEflB6TUtKBTW09ZNpZPrES2xi/4hEmj
         inGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427165; x=1784031965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IgLtos+kVckpvEahUESh1dXWtYuNLZ70j+TeV2rQ4j8=;
        b=rpVwnmYlilLLhG4/nTR6Iccja6vsmjg9YkROHs9CYHJBXJAYhLhS66rgo7VipNDdF/
         8akg14Gnw9zb8ZyScfpDqKZZ5yYv545MKZuvvgiIXXJCul9cNwiqxMMi/6MJ0FyN/v9k
         LpqBbucM5H7W29ggeagUtuNPtgez62g3GDTcwEoYFcdbUTNIfTFfC6jtJv9F7dnV+poC
         zptEBGZsJoX5g087ctTZdQtRb08bIA0AxwiRtG/eAv026OAV1nHSnQium7qLHBK90v6s
         jcbKXQ1Xfx5+QfHTEOJdiaZSV+k3ROw2UM5Hpfa2rRrGBEYYKEFTo7p3E9d0iiETxjAe
         hdYw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2XtLH40a/LnTqmb0JnHXTLtb7gX8BNCoYZd/eHKXzeL8Ic6TM63yn7EAJ8pt4fsZshPfpemer+vE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwtXUQIvxlruV5Vr+S5TG1dYUYDj/Tq7+F3N/+mvrm0yHKRtG
	qRlQ1fE8ZD6G6FSNFDJWBUByEVsmm78lLyZwdsVD54ZyTujmzU69Y/lt
X-Gm-Gg: AfdE7cngnAreZrogmxykzlYz96gYzqQEhuRE9wiDSBG/f/VR/MzqvEQaJs6SDHtmPae
	ZWBdMFeQG7ytaSxXpfeiVab6ceKUcccP/L29NMu+AOoiQ32E6lagE+wEujuLD5MeeJpIg5uKggL
	AvM6B8g9QW29Mkbuf7ZBjc0UUAv4Hbi36r4ln+cV6Fy8ZDl+NudSEQUHhAuJRETvEBx2fxNJRyH
	sblR1sExACPZBqyhpKFDKzSZltzbt6gKAMpYbBQtFgN7kmo7SqSiP0/oUnaJQQ9i0QgQIij0alc
	h3leaIkrlyriFD8gkeXAFQgVhGZu8nhkOqkGdVxOeRvQlKVz1yOJP1qwInrYTS9v4UZEWAHqaEi
	sMYUNSIUSqFF1GRzN1BhnfiqZH2yzeWWRwXc51weO2PikSAMLnQNnGbty/9Jqz/iJjzs/LL+0+B
	5NrYZAD6hzktWlu4UGA4zwnCSWm1n1S85Re2W+8C/exbVc2trgzsek0PhXnDeoF/JXwQBzQfHMN
	Q==
X-Received: by 2002:a17:903:1c2:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2ccbf184d59mr49746515ad.39.1783427165522;
        Tue, 07 Jul 2026 05:26:05 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm11078765ad.37.2026.07.07.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:26:05 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Frank Li <Frank.Li@nxp.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Syed Arif <arif.syed@hpe.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Colin Huang <u8813345@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add adi max20912 and max20916
Date: Tue,  7 Jul 2026 20:26:37 +0800
Message-ID: <20260707122701.751878-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Analog Devices MAX20912 and MAX20916
Dual-Output Voltage Regulator.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab436..5e7fb4edb82a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -57,6 +57,10 @@ properties:
           - adi,adt7468
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
           - adi,lt7182s
+            # Analog Devices MAX20912 Dual-Output Voltage Regulator
+          - adi,max20912
+            # Analog Devices MAX20916 Dual-Output Voltage Regulator
+          - adi,max20916
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # Aosong temperature & humidity sensors with I2C interface
-- 
2.52.0

