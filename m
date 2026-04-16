Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699313ED5D4
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370810; cv=none; b=URLeT2Y92PB4eaAIE8LSoe5Le3nnraEb/hkhPYpEJHR4RLpT35oZkI9nOI50SFrxaAWXafG30yABUAAZMcXm1YwzJjzolG50gj+UI2afB0ZK4Id3tko5najsivbz47oWoArb0atouGRVExN3vDt4U7Tiea4WUwfPtbUxAX3amOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370810; c=relaxed/simple;
	bh=zqX6tFIGEUCVaeZF4QkxvcJ5oMEM87X0rHqUfEPpl/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jd1M52bgfQmk/A1QyjJXqzYiaUrQXj8DmcH0c+VblzWH+zNXoeFuXHR+Kxz0Fmw8Oj2TAqXL4IVZqWel+LgOL/UIudog5ICfONFJLJ0iHobCPI3GeNwlhl1FcuyIQEcS4W4h2CjBj+HCmtQtYAuGaSN78qXTyAfMxKTsVCqqkn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0a2Szwp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0a2Szwp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso1082428f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 13:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370797; x=1776975597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=;
        b=P0a2Szwpe0CY2ZBY/PbJg9rlM3HNnwwWXuEDn707qh1gjAEjqS4OmbcIKNIUZo0A0S
         0SWQmqpn0puXhUuqm3IDXlCDSzSOIxitF4CPIE3Ai9eYeQMCDB6bey3+u9sh+0BiaxWl
         TCLitHHx2HcDZb5juR7rOkXe0n95nbVfzkfu8uVX80lQp6cBIQ0U9GEoU33HID36J/HB
         yB4DTe2RYfgTdYAgkhmfgX/WkPfraCL+EVkII0Q8KuvbnOC+yPab4MppZUhScBSIiBz9
         vllyYoLlnP/uDsz/RB3sO0gPNw38Kfk22eHv+Zq9x7zVvUacMIRKgdXmzcutxkv+bMBd
         C4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370797; x=1776975597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=;
        b=dN6tCWXDib95URmwpQc0tXJ4FJwXqyuDp1FMXcE9JIBba3+kAB37G8qqOfrgwEGjF+
         oh2dp/ubkeeRrtFakj34NyqDfFvxEgVXFe7uxaBdEUIMGT42i4MArCaoPjdRdJ8igcfC
         nHFh1cwuODLhupY6ZXYGx78t0qcE0OlJ1dMIOMPLvyReO1RimIpDIc1tJ4eB3kzlQeRM
         ySTQHZ+tYq+Aj7s4HTRpeq8aiaGGNHhccomFiNYqCPDiVLcSaO6EfHPOtqTKMHKkzxAs
         EVRLIGHRGuEvk2CMib2zIg13nhTGvPtwJg0BKVDYLmdvFRryVLOzXixjt2HMzl2RIBA3
         N2sA==
X-Gm-Message-State: AOJu0YwSrlsiuTI5GJadlTV+DN969tIWaR4Qq/IjDeoXVM3fE2tMGAei
	aejSEw2T0HCUJy8wQE+GMOCx8ZCI+A35COLFWv+cjHAyw/Cpi8g58Psq
X-Gm-Gg: AeBDieu97xfz51mmoSMARlFW6e+m+mzDC04ZwMFJmdzCG6m58Epe/HVVZxqfXoyThGd
	apSD5n1CDQ5o3jKaRdGVq2+SHj5qMioylv7QG8s4pykiadPgI+pCrdX/pWhiufRN1r0jcHJK6zR
	VZiwtpcdr7U6uEWy4cFJ9mZXWuPxERgBMx6NhhWtrh6EKRcvzp3ojmC4Dk+Bhgy6m+2Cwm0cm4i
	Dsd43mDNNmw88PsMl9l1m0udoPTlelbq6wzyoHF152tVwWdC1ecC/1RSEZ7wZo6Ec3fGJFxduOK
	n7erLSKpM9qJB/FLi3yt2M4KT/NZRXEaHPXl9H9CjE+6sSZPT2B/K7y6bq2cGWeMfqQyN3ZfatZ
	K00bk87yJGZ5JuBxpv7whi13YfIe1U4/P8m8qvC2jIleh2bNzd0YyEnLdtjQPSF4XHGbPoBKuRT
	7ISV/Uc+PYcf6MbstLHD5wpYixH58CU44ZlWo6Cd461yaSjQ==
X-Received: by 2002:a05:6000:18a5:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-43fe169d563mr1185520f8f.38.1776370796893;
        Thu, 16 Apr 2026 13:19:56 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:56 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:14 +0300
Subject: [PATCH v4 6/8] ARM: zte: Bring back zx29 UART support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-6-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=zqX6tFIGEUCVaeZF4QkxvcJ5oMEM87X0rHqUfEPpl/g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLOAzH1tDsqAQM6YsZ7GEyIYJznmL2L8uIk
 nhr3jf9n4yJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKx/w/8DjeLetUi3csxyMsp3tA2IS2LYDPYepk
 nusCL8dln6bs70+ADwKi4Y4a31RnjheChLnfNcfosGcDQiO00EXr5uP5c/PRGfl/oOLslI3uOkZ
 5VY/xxMT5nuqII8In4qpDumJhiEStbYx3EUYZ7+Zwh+4UUtnxVKpqcPnhoHKucrfETgSCykXo2Q
 fUsaAnCy4JQ+S1pkPa2kE52QzqYRhV9wEFf2vsQcpfdlObUuxtjl/xhYeKy8SRNhx57Odec5vuj
 9sqRIke/0799ZtihtMrHMDSvmpZiR6Ea4u9Hl1/5LOt903k8E1iUF9a2NYnSPmnMmYJLPdQ4UPj
 n6vlHIJpXlkxFYN23/W3YU5+gEGY+hvL1dALjmwmvQclDe5HCyDmkU/ZrSi3rtVbvAr+wQ8Dxgf
 Jkh6iEbGRGRZG549PgjH+uCDgF7+hWCNTE9uJt49lFe0lXkrmgmrZMNmlq06L8vcluLTaAbnK6D
 +5xHw2T2tcuviAmrV6ovuLi4/UaECUyZbSKiMTH/0sqTUFMHATLO9iLwWt3zR5u6Pf75BYOGnjb
 dV1GlpeL86CeIaFTQ93V1GoEQIlS8tM0E9PHNxgC/O3ZarpJIRT5Mf1XyFWVRlWb5DSC51YcHw7
 Xu+XbvZWPNUuqTHq1jDa3p2c2w+UZqjTtBqmK2pyHU42ZwVkbn0c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h        |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..858a0edd3e3b 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,11 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		.id	= AMBA_LINUX_ID(0x00, 0x1, 0xffe),
+		.mask	= 0x00ffffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 9946276aff73..854c962d70f5 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -103,8 +103,14 @@ enum amba_vendor {
 	AMBA_VENDOR_ST = 0x80,
 	AMBA_VENDOR_QCOM = 0x51,
 	AMBA_VENDOR_LSI = 0xb6,
+	AMBA_VENDOR_LINUX = 0xfe,	/* This value is not official */
 };
 
+/* This is used to generate pseudo-ID for AMBA device */
+#define AMBA_LINUX_ID(conf, rev, part) \
+	(((conf) & 0xff) << 24 | ((rev) & 0xf) << 20 | \
+	AMBA_VENDOR_LINUX << 12 | ((part) & 0xfff))
+
 extern const struct bus_type amba_bustype;
 
 #define to_amba_device(d)	container_of_const(d, struct amba_device, dev)

-- 
2.52.0

