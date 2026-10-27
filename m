Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139830;
	b=iuLo2DoBaW9ZKY4Dkzpz515MfvgL5uBsbml3Gy6TAg6JhRLGr6ukmD7KsYDWuxwbbIBJ
	 SbltBZWhheXp2+XyZJXUYFmh0FTFEbPSDfYmHUHj0EhYks+bX02imKBVoxsBToEPr1SCI
	 bqSVdT/f82eNS6fNFhO3nFjAIKZSHr2QaMG1oZ6257t516fSsKlNRstpyVaMKVfLz0Kjz
	 RaqUaYj8mRfk348JvvVvmk9lh6prKZVxi0zdZGipNnWwJeVPG8CGvl3n5ncuXdgu8wVBY
	 11BIE4rW/hAf2AOW3nEBlYzwSFtu6HbC4VH6UAoYI4PkqiHEVeIE3b50nVkajeut/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hYDVenZDsyYfHEujEI7uaiXAB0fJ/AVFTfTJhaMgstU=;
	b=d4bQhD9KzUZX8wz/fOa2qN5GpD33Hi07svv8zcaztudS+iwGKRyWba1WsjBoQ2FvSAcK
	 Vi+5Wp3YRlApfsIHTTkj87b8/7pILBjGYx2jyTBOSUhZt+l+qsdVCpEOKslmSwrnYRRdh
	 yEJqPXgayuRDUvHMlojEsrfi6sDOOmrVyWJxzzDN3xdaLiPc3S7N2x8Mwdv3X9qPuBss0
	 C98jtUrZtDt+Pus00Gob74b5EPuydu1Y6Ng/BJSfuFLj9qUtCszzOJS0XV9ALzbK7BmES
	 JAMMgcNRoPO1JXBx+O772RtCega3B/TfXywLcd35rLas0w0bS5y7d/J8VUusuUc5E6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EUE/qV5D";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826D606A31A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 22:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3826D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUE/qV5D
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e04773687so135954f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 15:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139828; x=1793744628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYDVenZDsyYfHEujEI7uaiXAB0fJ/AVFTfTJhaMgstU=;
        b=EUE/qV5DZRkN5V3IaBgBQhpLW44KTt6j9JeTGPYtMgtOWz+7bnzKffe6p2TS11JuOb
         ohenwRVBhxAAThYXd4L/CLj79RKW2B7nB54JKHySMeWVrOcnaAV1Y1t1tNG/3DQshJ/M
         J/Ut9fIFcbijhkcE5AG1RAL1pvKXu3oMOZp+FwGuxdWFAa6dsdfwIshpy6d0hnP2+FHO
         asE2ADtuCU3C0D/Jg6Ou8nTzEOjDqhxP63iZ2yRLNZfpmJO/FZWIVVxJ2rtyvGpxxgTN
         FLDLVi/NmZmiEQQiAeNxMBhTdhYXn8C0tESoAa4kyWA7Kygya+5fPujayPFBkA01gH9D
         eolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139828; x=1793744628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYDVenZDsyYfHEujEI7uaiXAB0fJ/AVFTfTJhaMgstU=;
        b=KcymK5PAYG8uIkJ7bYf2oCscC5CaC4HBE7AQe9PeXtvP/uaR5TKNq98sjsnYollERS
         daMKkhnoTw07nH3VTzeVAOZbi3ggeIOGgJ4AbH/yY4Rv2GxLT+OCZE9H1tCNeC3GVhnv
         dpU5hjh9FIzS6Yh22iDNf0R0uNnQ2mkoC1t/uUZlbRyLO6u6hx16Z9Z+nSndQ+zh9GJb
         ZDG+lzpDAfJ0lBLmBDsFZh83wTcrh86gT/0TNAvUjEJwiJJCl74Bot/ZnF3f/D6daoZP
         GXOYUGMWCQZPW1RJZOSPuifX2y2F7+MY18DGcvISIOkIz2PCleUVowHWOaNssTWL5eL3
         WmSQ==
X-Forwarded-Encrypted: i=1; AKwUvByWVjKoIKncYQQb6AoeWHOSc2NW6JKXsIj5LrdQJW1bKBQnaywLFIOjraNqhppb4nN5lwdwSlfyfO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFhqE7wI4bD6HFVqScCjtuKaxrSHpIRwqoX1Ro+xMVSNVmhCbD
	jm5y43ghiGFh6ea7Sno5AawrrdsChJTSVcgdeNUtrDwu0PcHT+FILDK3
X-Gm-Gg: AYBFou0DFn0SaXn3aFe9Tt2/FfkMxAWoSordxoWZeOCdPW7q0gBSlmq9mZy0k26UR0Q
	aKysWwvyyZXxglYT2WkYFuy5kWBD4+CcW4wij6ek/7UmYFBvFxjpFofGSyg3NWXIrSJGHxOYkr4
	gWMQWf/5qA+fdGwxTeTJMm5xUt/Z+bq9Al2Wjxa4JEDAN0zwqi6jE2UEMA+N11p5BvwNHwfwHTe
	6ibwrl6EmplYM0wdQ+ltuVus6FPisoiGQUKMy6P5MRy+EjAwsPipTmR9ajP7sQqPEKHFXnWVGW+
	9nYt1XoJwDNXqqaLYeSNsYpV4JwDTjscMsCPl5AQFX8cGgwHUL0WHu/CJ9CSRwoNeo2HseNnuoh
	uBPYssfV3HyNSr5IYvTqWTn8GpQWh/9ufuokkOC6z20J1K9doVcRfw2B5SYasLDtibUukarBKAt
	IKnAD+gjSe0Fw75E8yXWfgf79kaOw+YjM+QleG5myf4zlSvwLJ0OjyJw8mXfy9AbFTIhPwGWCOg
	OSdn0cEQRZmeXegInIsXbr1WfCEg4sYROKQF5S4ShboIlnKtO5E5FU91eLW+1k1w29RVlEqftNI
	1H5NDDeSpoSUTbF4jGB5C8f3iBx7IVuXucx+fJT0W2zi5/ZViwrjzpccgMP6GOw6RoKhaVZE8Gd
	EL9oXKNEvYe28PMY0oqOxdLA9g4ADTXFo9G1RmcY5c+I/xZBaNA==
X-Received: by 2002:a05:600c:83c5:b0:4a8:c6a0:c08f with SMTP id 5b1f17b1804b1-4a967e8c05emr7022645e9.35.1793139828471;
        Tue, 27 Oct 2026 15:23:48 -0700 (PDT)
Received: from cachyos (252.pool90-68-203.dynamic.orange.es. [90.68.203.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9792269b2sm2292105e9.13.2026.10.27.15.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:23:47 -0700 (PDT)
From: f1rul4yx <vargasgomezderequenadiego@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	f1rul4yx <vargasgomezderequenadiego@gmail.com>
Subject: [PATCH v2 0/1] Documentation: make admin guide version-neutral
Date: Tue, 27 Oct 2026 23:22:15 +0100
Message-ID: <20261027222216.71715-1-vargasgomezderequenadiego@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <924f3b3c-a5e4-4686-abf8-0d4e23183a2e@infradead.org>
References: <924f3b3c-a5e4-4686-abf8-0d4e23183a2e@infradead.org>
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

Update version references in the admin guide so its release instructions
remain applicable across kernel releases.

Randy Dunlap reviewed v1 and noted that the title underline was too short.
Use the suggested release-notes title and extend its underline.

The htmldocs build completed successfully on a separate test machine.
checkpatch.pl and git diff --check pass.

Changes since v1:
- Use the suggested title and fix its underline.

f1rul4yx (1):
  Documentation: make admin guide version-neutral

 Documentation/admin-guide/README.rst | 41 ++++++++++++++--------------
 1 file changed, 20 insertions(+), 21 deletions(-)


base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.56.0

