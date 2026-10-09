Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CDB3D669D
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584802; cv=none; b=VK7wck2L2NpjH2n/HCbZgGGKNh9kVQlkXskdY1kk32BLGEz6IiccKqsaMh5N4GebUidx/T+jCW45Pae2anQ32daX4pAfn5Y9BhFjMy5DOJB2GKcDA5AV2/BEFH2rWElpwCZ2iV0GR26L9Ba5WFQdAjkW4mcczACJdxl9rMYpK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584802; c=relaxed/simple;
	bh=KuiQ3IKUB2w9nXq1YX3MmqHIvFA2tKtv5n9Cp1iq7qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mIWpbtI6jeq5t9E+GyUTO8qNrtkIX9/evpotzAZYNl7B2wXKrZkQV8qt34IWIWDKTNmJFkrVrWYUdvAwE/sfxuWD1GPti3oK0rTW3P8DLcJr//Ef5UpafYGv47t+41A0dr288eHXvjeYsMcV9rGvAdhu3TV65LqOfNLLQn51m4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H1/cKE/2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H1/cKE/2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2df8c28a0b1so941175ad.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584799; x=1792189599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5eNaZ9lIvV3v/dwCQY0Acm5f+QB1YMzWWisiwjAWsk=;
        b=H1/cKE/2FGv/Bv8WHfilld0NlAKTUL095Vr6Y3cWSGhph1i5ZT9b20vqmABEF5M5bR
         OcJjWgxNUPmDQyhfiADI9ws6xEhUr+GXFDG9HwCgzUgNNIhqqScYH14LXI9RWqSFINQR
         gXUARLZMgkUWyBdluml5zL1S0EIejjvAMiEfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584799; x=1792189599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5eNaZ9lIvV3v/dwCQY0Acm5f+QB1YMzWWisiwjAWsk=;
        b=yAzCsQzOlA5uNFETzdTEPOPVg6vOfpZt/+UOUr++3tcFUKJeQnF7CC7CdTzj7OC2Ew
         rGJ45W259ILP3xDPK/JBthtU/Wp/MkbIpKS9KiZCeNg+RGNYlgWqbTpUBT/pjvgjL+bx
         eAzv4TXKvpbmBDsKP7sUhoaYpOrogjxO8gIdjUf8dIy8W5HGxMEt/ay/9g1GP4kcWD46
         oq9pcRV8ZOw32BmKtdpVwxvs0jNoJwa//lsGv9V1cJ6t6pT1gsrF/QaDMFY/GQqrw/FE
         S3HIhuQufrwdbW9gzNsAOAKBg8OdmeitBRrmUNOgjZafdDDReJFfIQcGTT4Py2rOYJK5
         rodQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR+8FnMGp5eWnyIGz1QJAgeNzF/UDLAT/suVwUI3U+7TcXCtvFry7KLhv5kTGf9SD2K6cSmVlWlJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1USj17RgUkrIktDBVK3mCLWiSozPU/Ch8WYRrZ+Re8G073Nrk
	X+DqvuCW0KPHU2APFCEg7trHWOUejZyrdyWMRam6uBziU6eoGdouEoILRRjHmCtHVg==
X-Gm-Gg: AYBFou1HPz5ngW1GMx+z0E1RfaWeU0Vu4gHf7a9XeW+0duHMG2iiJbqiCKGi/xWzHHh
	dqumfXPeDVD5ImEybV2EA/JhSZfoC8kO/Mw133E+3XHM6+AE/5S5d7SGNJEnl6wEAKg9Hgjdo4T
	8J760RVDKiZCUxsxNDBxL3cllsjFTxM2R+EIQ+sPU7ciqhmYW17jPtwkEigGDI5CQqM1p3AMnbw
	+S4zTKeP/ptYtunZVzPOIb+wKu+J03Gzlq1kX9vnMVJ2vJJ95SN67wBHxai2lgVIg4fgH7pJnjY
	xYqJVg9cwl6lzWeUcSSjkG1hPHpdRszpKM9KxpkvUsTXQNGiMDxWeLGW3KPgHhhqGMQjUsIPxW1
	dm4Q4WuxpVd1C0gacVof00R/k5wJaWibgwOvTbn/7gaRYhFOqczskeZpVxAMgbSOU0+kQ+bVInr
	V+uYBgYB/y+L61f5gaor35HBUOUI4IS6XJemwpqBxsBsXfEGw5lAWs6RwQgd09BbzFS3bbiYmHC
	lmXw3Uqyd3wHvGxSBeCrmpds2JHijhRAvjWo9QjDEpH7tRK+NMT2eH3DTdhbMPXkqyt0szfbvzH
	KA==
X-Received: by 2002:a17:903:11cf:b0:2df:8aea:7d99 with SMTP id d9443c01a7336-2e842bc8073mr26181935ad.59.1791584799610;
        Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 09 Oct 2026 22:25:27 +0000
Subject: [PATCH v5 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-send-upstream-v5-2-384af01da3ee@chromium.org>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
In-Reply-To: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=K9qWpa5CElybzpEomRWCeuxEJVuPby2HN/39jIN2wOY=;
 b=DAEBq1NSgXCcSRGDgv7mTSvfFXvZQUxWlGT7XyleRhM2NYQY9lknT//0P6rdifesIsq82ZxJy
 juVP+wOX5jeBzOvl9RenjkrrlGZi02gGUzA4gQiUAcSPO6BQhaniy5p
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/hid-core.c | 3 +++
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cd..1b9dbb7515ad 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2373,6 +2373,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_SDW:
 		bus = "SOUNDWIRE";
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8d17b741638c..45f713fe9982 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -821,6 +821,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)

-- 
2.56.0.385.gd3acb90ef8-goog

