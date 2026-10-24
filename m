Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803114;
	b=W2QBT1M/kr1XreiBDhxZxbGjlBlecae4ZR0a6qa52EU4dCSParPUbFvfrs2wbEzR+cEA
	 TWdkhbAKAa/mGWWJ5gNWUp8i5OMkRS0tKAegw8e4t3mJmaDQ1AqfUrX/vl6O/aHoW13vn
	 Db9vQjNPfn9EIcd3xvpqDnLp0pRJGyTC/v9fD122UHwkI+qzi9blMNDiP1YR6rlWlu3TJ
	 kdVTmocr5eLEfPckOmgYtMQoZfMOYbiXygrpOdPooHw+VpOwYyOdTUgSvpPRT9hVaPvEg
	 0BXNK5r/LrYICFUEMLzODMDwVAPGW3CMMMPca2//cOBPdabzoGwEhOop27jUSE98hVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GjJvgQskeA2INOh9xphriRJk4nj64aXRXGnAbm8qNwo=;
	b=32Qx7D07xTuHY1gmUuvF0eBdHJrvisCNkxYbBZphcWgTDFeUhfx6TNZbIIO+9yQK8MCr
	 TAwHvGvsTruQ7HW1K3VcPMpYxOqUrl1vs8xDTUNyWxrYjHs+MDRKcw0XcOpwdY6+uWFCH
	 fKS3NmlJnjVmZU30kUaTvG7Hyk5zNu2XxK44SPCVlfYxIzD9HdtAbNV3qgIVwVCRWnjaE
	 zsz7bHbGUkL80S2emSretsjNCf6Wo21Kyc59L7X9CQT157shJ9imo2u+BES1oWta3spsN
	 0k6+BfX+i4orWHLpStOMFEd9Kdzca3JkfZD4064ENAxCDYq4e8tzmyhomvI2KRrAP1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F71mQzNN;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF69606A334
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 00:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF69606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F71mQzNN
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e977109392so7745265ad.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803113; x=1793407913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjJvgQskeA2INOh9xphriRJk4nj64aXRXGnAbm8qNwo=;
        b=F71mQzNN9Df6I/It3i/2orNrHXqbcP1PQC4xWxfUZUv03/GeKMX0+yP6pW/QSoi4Ii
         ptvSZ1Z31lTqIvQT+c2UUZ4XLuqeRYPIgHONPoesz2XCjoScHRojFWbuVAMtryozroII
         lptbybUDhb+BfNrIIQ8CLpLhFa5OgZPmiEOrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803113; x=1793407913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjJvgQskeA2INOh9xphriRJk4nj64aXRXGnAbm8qNwo=;
        b=e6hRoyW/TGNnFbFmIe2bd6WFxJEjDBhyW3tZh9ReC2HjnkpIGoOGTpKODXyGFEcNgn
         1n9J1wS4dHeeUKxP7cXmhUlgZ4gNaeoDyBRPvqO9lsesvZCmJy9JYoFfULJhrnSVlTf+
         nZ3rfYMorqYQzMDwfMYwFQvkR3yqU4y1P4pNN5F7BzvnSbbpSi5xj3R+wWnNHNhZ1C11
         LNj5avx19PtLaYnhwwLC9LqhCjiJ85n5lu11rzX7SMm2Z8YAR/1kp92tHf50J9mgURdf
         8HA6ZdV7vGf6k06yhhx0st2j+Ootk4sIqTFVCxO+jCjxWvdeDjzXH8z+d5NInz5m2f7J
         m7UQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8vqco5sS/bWs8F38aTsQCDNFlhqPlI90XwekCNpBuY9GLeXTnsYEE4/MgZmr7MOMLkNwRQTTXErk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqpvkyCvyRz4hhcv5eyUSjM/K1a6c5m58EcR9PF+ykABhryTUm
	hwCX2hQNcDMepigQWlNuQtpj53FczvkJNc6EFsqlXL3kWdrBdP0grcSqk/e2j1rOXdmfbWx2fny
	ilC0=
X-Gm-Gg: AYBFou3i9kG8PZHBESvIvLeCljr7mkmah2mgKt4iF5C2YZsXcvrlzhnQ4TqPB8fi8az
	ZibdL+kN+/D6DL+jk90DmWOg/MRme7cneFgSML5acVQ7mkfM0GEIF7joZ+omCCaS40z/2HB0iAT
	DXPUiWfce5/QVczr4JBPiFQtT8TrXd/HSBaJJwVcDMIpzF4/4cXmB5LFW7I8Lrth2XkUihSfRzN
	XVG2LDlm1tj49I3TCpNggWK05dOmgP9kkjmdyDsxkREgY1gG8B0fKklOd9ZjhC1Bz3QK9QaEhO7
	lpGzy57Qy2DyFY4ht3vi4VUjJ91nF2gl5e/LeyURK/YAQURqLgDmMkdpekuZOasQdLUJkps0PXA
	xLoa5Wf7/IzFG5cnnQBsIVEQtG50VwkFwsmkQ4tHrIZfSlZ/e/4dQlphGwTFLz+ZmV+0gIGVbj/
	3ML1oBWhlB/waFYFHQzutuE7KJ4Z4dPfBCPWrDe31Y6JQPnfSB1boMhVZ0bPrtugV/ukCGMt8l1
	MFpj4ZRwo9AZTtFOkJdbUlbGUSKgrdZiLwo/Pb4AQykCbfx2BZ+V23/KL5kyKMJlYuR3ouM5oKo
	1xmYp/e7eb4FE0e6Y68GNPJPc08SVLk9zSrDH9BNTCpDIu9fyi7INKIAonxhNHiBvhyhac+u/aN
	ZGxfKPQ9d
X-Received: by 2002:a17:90b:3b45:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3ade9b2cff5mr812341a91.1.1792803113127;
        Fri, 23 Oct 2026 17:51:53 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:52 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:36 +0000
Subject: [PATCH v7 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
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
Message-Id: <20261024-send-upstream-v7-2-abad13174b43@chromium.org>
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=1445;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=yw607yxfhlGqzMQvUei0spNkHE3rjdhJJTsFkZ74pk4=;
 b=KYERMVr2ZOi6iWqsiLz616NCWFhyAhngzW+obBzlRREHTXw7r+si9gzT5hauuQa2QoLoisRF4
 r+kaho6ZY6bB466JTmNpULLdgLk/5/3ojuz9VXHF+5kjPJhrFfcp5yo
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
2.56.0.257.gf7497c7d27-goog

