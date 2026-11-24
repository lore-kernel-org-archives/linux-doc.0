Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535093;
	b=rtq5x15Ju+jyUFFnfboXNasNJC53jwDVc7FplnVVPTpCv6NQ0+O7ZeEPmh1RHTngYIQi
	 Chtg2PzJ+ATdURj/y+TxIW6nSV1dsqUzpYLVDWNU6owKHNIC5KklefnoFq7CRRMNhlMn2
	 n0nJYjI5krKr9TVQjJvd0WKnWrbt6HEu4MV8LfNiw6J63Xlm6iPbgp0JS/n73E70KN0Gv
	 M3CPEMmL2ZyKb6sIH1GRJauVgF2rCn0xe5vj2uqTtu1V7kR7CGFJCSkgsuvWqmuHQzgnD
	 0AQ3JJZiv9JcTVXB/warWP027V3Pp9zAz1LiX4jw9BshYkn7UIBYETVqQeXf0LjBpfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
	b=iu2obGDG/Ya/JMIGcsiG0E94UCUtN0Be1F8b6N+ZpiltiDOzVlV8CbNzI43O/H6xgYY7
	 YNRfOErHYEFm2bfoZ5Wc9jFcCurbPgk/ouz1QU0uPfpBI0GhknH2/xkTl4ilMKoj+3SiL
	 9yqvUdVt4jx7O4TN7vWCnn9mJ4xaEvcUAqyiLf+lT1w1U1FmVwhgbz/BSsHSBmALhUG58
	 M8+P0KO62ZH66UfOW0rCw+m/l6GXy6iijm2myyH77qhw9f8bglsSeToYFLmHmzwl0cogW
	 RdUwEOvrNdtwbi9sz02mXSHxs9Zgk8R4dZ5/+XNc2SwFM/kMmw0CLl0DPZ6B9D1s4AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM06T9FU;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396C7606A334
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 15:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396C7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM06T9FU
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so6782473c88.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 07:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535092; x=1796139892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
        b=yM06T9FUoT+HauG+ah7ZlDtJE0jPh5ciWEgMIRQ+vqEic2A9PRgWPR1ZJpzFTLR/cu
         nO8CIq2Yyzr9afpjdHgu+R5hGufllaMuhwKbbPisWnTxH6l5smZ92CeQny/SPyiAq0Dg
         ypK1AgE08YrsRNdRvd697RDKE4HHSr30RCoIk1Z6+ud/0iEkbqty/zl+nggb3cfIucjj
         tKO0/EUGsxbuHGaPVQjlgzi2TQma2j+doQQzHWwdJUIL3PRs0ZLkIXKqLXzjFtkztAkS
         LC32xHBOTywJCYEaw/G2wSHD+PhB7sG2fWK+8GyZ+j8Rsp8xEIMcEY1tRVI+/4m9q9Nc
         rasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535092; x=1796139892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xKm7gyCn60q+UftQgSFNSdwil5EY1yDb3KfSYz6nH8=;
        b=VhKehbRX2DA/0z9ch1AtslJBW1SMLQq1rxIqVs9UDugQ+P+/FCBVvzO3hK7P5bc+zN
         zZFMgaN2Jb4JDXRbnp9o7fQ3JDfZ23mk/oyADenIovofStk0uMpWiBvGMW37zxSPJlSa
         HMDnfMg61geeoSrTpHiUCMJndMkGI8nFiu5+65QOFz9RBLEooV2vpl8UIm1dpZKl+QKF
         gCN+VTyBQzcEMHZOLpQMm5sN6/rWBCkndLbE4lAUlyN9lb65D08bUk5IzPriO7UCntZ2
         kiJwTm2vP/AOXTWFLkQOD+M0pt5o8mNE3RI8TuZqyrdB9zmZbkxwNFY3EqUA+TYuUy+n
         ptBA==
X-Forwarded-Encrypted: i=1; AL+hErH9pcNJh0y5aYpf3m7QJkwa+gVAkPllPO76xfEl0qVnxqOGaLeGzNkGhxluAuKbq4DNVTJkBX6ODAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QaE9tQn3QRqbBas7Lx/I66QSPTlB0ZwUoWM1IRhhG9Zutbr1R
	M5+JZBkMtfzwmms6dXV6o8j6gaK40t/z7lLzGslG3Wj4xWtRPg7Hz/x8FpLuEOJI
X-Gm-Gg: AZFdTZd60tWm7RTX+f+gYD5tmmvxdD3IW3hNl6Zayl62Uy+pnnqdIXoGG5fzCXQluLa
	9cP+Vg5EQny6dxfVgVtu+PaXCyjUFcN9l0IS8HOLjdPRH6WOQ3l7D3JGZtQ465zPmu+2QwtaYew
	8kIgfVZy1baJB0b45fMrDI5iYY0lK4gqnvJ/yoJ4WLBcoiNdOMqKwbN6esmd9y7xgb13jqXz3dU
	118S9p7/f56R1NZUIkurUj/uLnMMu6vY3c/Dt2tBxdy/iiT7auLolvKXAHxZm+I2nz0ETdoHHZE
	W37AwRyTn2vSV4HXwpmoxyAkBMhujkx2rc9Z+M+c9P1/3YmuQjrIeBEaMwurQY59ov4rdYufZ7M
	fMjaUf5DRrdSzdy8wE7kI8YejDxyngtR1TwKpdMYnItud/r18l5jtCWvkC5VfZelcvKGD6DUrN1
	fy1lfSKsuYTWb/Yw6vPEzienPVqWisH/5d7QLGGWAUtLro0czYprZXt0ArOTDaQU+aLD2YNsc8f
	cxLnOWAwXdpp1dvLsxxBKvD11C2dQxx16XS7FjY1XWxvoLzjbMDJEts8VI+EKu3kcF0snjpFLGg
	rxwAXUcxRDrdn2ec66nw
X-Received: by 2002:a05:7022:7f12:b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b55692891bmr13960347c88.36.1795535092071;
        Tue, 24 Nov 2026 07:44:52 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Tue, 24 Nov 2026 15:44:45 +0000
Message-ID: <20261124154446.1094507-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124154446.1094507-1-takano32@gmail.com>
References: <20261124154446.1094507-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GIC-700 #2941627 row in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig symbol of
that name exists: the workaround is enabled by
gic_enable_quirk_arm64_2941627() in drivers/irqchip/irq-gic-v3.c,
reached through gic_quirks[].  Other GIC-driver workarounds without a
Kconfig symbol are recorded as "N/A", as in the NVIDIA T241-FABRIC-4
row.

Set the column to "N/A".  Only the column is wrong; the row records the
erratum and stays.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index dc4144ac895b..5dce49a57864 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -291,7 +291,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

