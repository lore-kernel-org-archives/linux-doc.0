Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C4431AF07
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507376; cv=none; b=U1S1Fy/dn4YsxBzibEVxsIu/43BXUMSRqH2/BmQUvmtjgqgEEDXpWzfRxmSA1SjjJrMuAiUiVihyu04bvNjd4/pv3Obxe3vZWmsMoA6EmZTqAYUtE81w0DACGZj+43fLQWFM5SJGyv7RIswT4ejwyqt/tiodm9I+e8XpP8SzTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507376; c=relaxed/simple;
	bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGT+ZdTBoQmCuwaLKi18yWVNxcQ+Lx4Wr4avLNqvmtnrWlTDpwNrl7VLug516jX3JcpDVhb1VQ83BGtfT0pdjKwo86qA4dcyYlAHLeUl6N1LOr+kgDBjGKnvf+b0AH1B/r0SHv7zdnUeCfBqvlaahX0eRZSU+Og02SKyFCspUbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Mppaamx1; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Mppaamx1"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so2536087eec.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791507368; x=1792112168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=Mppaamx1MF1+rCGnnt0y03i85TmVgqZew6U1RC7kwN4yqalSPlVzHVk4BoTqZ6HLg8
         M4oaYapYQNAglozi37t65tZtUUiLmP39Jc2e3ho99KxVw9TabzOK8LClF8Oow9Cy14nr
         tWUEPSiOPa6UaDQnMz9+Jm2Qhk38+h/2hAIWFDv/9sYgxq0uwOMLk2QQ8RUjBD1rC/8p
         xbVsTp6fLwIHF2s7Rdg2FRyFfVSt1ieK78z0BPid0qcIaPWlQwwbvAC33JCyz+30O8RP
         wQsy8PWEbD+2x/HS20squP0EMEXzzlOsALUhrgMsOyZXUwC5QucSg/Rv7QecWL/gGIJL
         zhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791507368; x=1792112168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8PlKZWA7ABkYR4Ifs3ujznF9xvsTKqdGNGAzO86F2w=;
        b=pjWUKk7Oiu7Lij8+Cov1zqoOI0nVP+HyiypsXZBdfOjFEZKFIC3FbamjserKhEC+59
         mtXiZTPFaIvNKJO3DyfnaMaD/3EoNTnqGevUja/oQG03O8hheUD4lVCUBhn8UHuMiYxM
         hDbI49nC8i6e/rhxzhh3XP6gCK9AtbbiyxDpKDDE5uj4YIA0ByUOGGd1kQgtI3A/qCFE
         lsHaYFjeiqOVljpvnvKTCMvyNuvFnGLYAhkWafeUNIuHVUsncY/YOpPcXqugxgVbEGiX
         aIyVSGrE/0kWWOSxhqQe+UCvvVodiI13VJNChkSE41ha9v1/O9NEmVkKL0LZgY5Uhy+y
         6o7A==
X-Forwarded-Encrypted: i=1; AKwUvBxGgfWFvxUXoktGj8zzrsLizlnbtZMFy7IlPrRs54+81pjqAIZUU394A2B20EQMX5XzUTBbtbnnQk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQiMPHo1BVzsEpUsATNSv6VeiQoKsySxCG6f3KM9rKV6M43b9q
	ZrWEOlg12Yhs9zrr5aQF7YJq/tA59b/vFabghwT8wDTwOomMMsWsMsYtU+E0A6dqx1o=
X-Gm-Gg: AYBFou0yIapn41P50zU6+sGQnGkWow+Z96/Eez6W7VUxxfJEliuEi9qA/zJgIWDOonp
	ePItQnPzE6JzdZVCs368N77udcjihgQnx4cLwhlO/1h9fyQRBX0ktzjb4doVw3gSRnmeGYRE6pC
	K6uq/RPXbsXMZANNHfbmTbDMzIIi+rwD4sMlNrb9o7vwoVDTBHKoOvjG66Hmik6Z+MvxX642LYO
	ObeJh5STUPcWZzAJoBQfvT02xQot38hDxKqN6CSyNEAXms6/6bbujMyLPX0uNhq5D2F6VG/rpve
	sgIzH8sRSPk6+nIlJFiQ9N2fW+/sw9HwjNnx94R7lg9rWumTr7cbv6/N5MC+SOs0IovXM4Ybd/v
	xyXtnl3EFcTVZO0xHECXPWbAZyWlP7AHo0MwSOX2QcdOEl9ilq5pQkbCj7zsBI8D5X604x4JfH3
	IsG4QjD7C/SI4fbDntP39Fe9XY81UF714xSZA0c8Vfe5SLdN7LewZhF8WAPfrCGL4JJ8lRSwUko
	A==
X-Received: by 2002:a05:7300:b905:b0:353:7e33:665a with SMTP id 5a478bee46e88-3537e3368b8mr878553eec.37.1791507368107;
        Thu, 08 Oct 2026 17:56:08 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm1760205eec.21.2026.10.08.17.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 17:56:07 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 08 Oct 2026 17:56:03 -0700
Subject: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS1412
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791507365; l=987;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=3dS5bZTVOT7DSHDRVN8MKXXtvwU8qyib2hA3utIdjME=;
 b=vzUnvSUv3IoTSrnibtT+Ynn8TjePYTpUjU6Onw2MLiS5CNXbQqXQmR8VDQfcG+iwtB0heUIfO
 3b3ce8E/f3qD0eboKIKiUVS81szS0bkKWWglyR5jP7cfLrdVc5JSccw
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The TDK FS1412 is a 12A uPOL regulator with a PMBus interface. It needs
only a reg property, so document it as a trivial device.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..d2dfde1344e5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -469,6 +469,8 @@ properties:
           - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
+            # TDK FS1412 12A uPOL regulator with PMBus
+          - tdk,fs1412
             # Digital PWM System Controller PMBus
           - ti,cd9200
             # Digital PWM System Controller PMBus

-- 
2.54.0

