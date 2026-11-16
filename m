Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846887;
	b=1ecx5/giX1dSdj5p/YB+X/Sri+8dN1OLq015qhGS9qEPurjMLbuqFUyFpaBiyZ6C9Hqk
	 4btFVQ976pQnlabdGanj2JdZsM0vt1YF3NoSes3xa/9CT6d6od/siiIFgZgtSdEUi8vOu
	 i1b/Cb1aTPsD1TOUWzFPvmz3YoCAdMxZAMLGn+CPY6eLRPvo2wVLxBu/yHxpOeBQ+8zgb
	 arPXMizCDQVF1juhXOHujrD1uZqZM7cKJtRKf6bDQrtG/s+ehMuEECZYxC6GdrPC+w/Xc
	 aN480Pqt+dJ6lWaCf6VJuNkDqyJ7OeX7rNdDNRRBV3bV0n1PqgEYB3tIdQWI8tYZ2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=T2VWs4Njm6W22zXq6NbLLXK4gBbsf6FjI3p2bwgCjPuF0rPHPMMHPhDVGWt4K4YO8PtU
	 AUMzF2IcZa5p1iWMyvVqevIXsTSC4c+viUBz584EuKLal+1qhqv/CINPM9ugOnepXJfmJ
	 of8ZffHS/O8POQfwkWh+DNwglmcbJxB4LxXMZ+shtBbGgqF1XIoOJ2yMp8NxpKNBo3sIl
	 6E2RByG4HrV/69fuWvFGa8CujpgEztMs6ttu7ysLT8Q/zYu74QSI2iP0dD4003cm1qHO1
	 zvL4zDWKWkTAXBA0BHi9L9XfJ56rpi2Db3Dc2rfGCtfNZb1sWpy/jkmMViVQh5HkeTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B8C60A3815
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B8C60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SBGFb2rs
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2022536f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=SBGFb2rsyAC9jD3tKgIN4fbPBUpUflk3N+UsFIOl6hllQuxDBI974ZDeG4zfiA4m3D
         i+1u24Eixxy0zg4L3Ip6vxy3euaXCMj4p/hu0ibsgE7wNq4A9B2t38HnaCjuWBjublSo
         AgZZm7Ko3xEkofFiMYmKJ7W1wTaFPx3cJ3Hde6N8Q1lHwf0QF4YmjoTJx2qh7PcV3sFj
         j1iGRovqL9Q893jbcc2XadWmXvnWiaQbQfFljwjSBqieZ/Pm80eWAcoQIySi5pv+/g0Z
         PVJ6Kyq6k2aV5LLCGvYmP/czJeatXy13/S/cIQKYftUaX4GpEStdHCfNLIGYjObx6tOj
         +t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=WJC7BsuRvNBzEJ67qu0INyIS3URzRYC+MYeU8t8V4olA9gq51IvXioTFG+kxNsP+wQ
         Prxf3OPXsvCIoknxHNkM80E1pkOPS/mCRxmDk1id1oaCuXANZDZJcdn43OFDKByq1nzG
         RXOoShf8v0mqM9Uf1hD8CL2Qg/+ClK6tzy1z1HdyiPZnE1SvtMCKlIwy1BUP4iEUUBZn
         uTq6MdU4WTMpouYB5hA+QS/gVnGJ7Dp/GA7jGH8/e1S2qIPk74X1YPVoE3gIvi6G691P
         UgUxEEF1yZeGjKUaGHcsoeTGEzpjFlDY7BE1dxA8a8uY/ZFKP1WAQoEQEklr96cFu61N
         n6WA==
X-Forwarded-Encrypted: i=1; AL+hErGNSQd6vKAZRYqt4rHyQ93nX6BspvktYDFdtdfg1ndenTEwZNTkFscMqP2G30xV4upmQmiBP+nQ6n8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XLqUB1Ja9z+p1iCOqd+NHynGkayeAFsaM1W6m0H4Fs9UKTMeJ
	wB9ZNfShh+damCAw3PIs4hiwJxQ08mDmk8NDwxa7mUfqO48uJqz373/S
X-Gm-Gg: AZFdTZdajGxx92nVaB8keW8Aie+kwcgyY01MPHtR1NijkQIcNPLJ/ZSemCbU24hgvid
	nBwtaufS+w7nbEtBbx/yx2CK2MrrlAojKwhYR+CAynBdUSvXmPTDmT0/LeIQo9NrK+0WAO00CJZ
	OUA5daTTj6LUfjF+LMs6C3ILiZq5NdLKJRg3Tt7Oc3jyLDwfExbgEYx30uOJlYZ3CU0HYIqbrqz
	7NIItku89lycAlOs+DTkR8KMCqkgeTSaN2kG/weZ+HXgF/U9JlPHfz35i/M/mjV3weViVYnWq+k
	Ahv7ghdXf+eb5+iAuorJMqqfny2jj4qsimOl7o18H0YppyjG64zmp6BaTW6Ij1783VHDB8cMf5f
	XSUVWe4MgHUIkhMzWmdFhXRqLbSqPiu5Z3THy/SI0l3jfr5t4lRzIGuKHNrouEZwifQN1H9h6H/
	sSHWHf0+RQOaRrwH4BNRIVcXDP1tJOcSML+LN02J6Z0FFeZHoqvjUZ1QeG+foNYyrHzi6GYGiCa
	CtlOUs0rI1+s8H1WYSRSWVcTwTpZvqpemjEsmkwW1fJFtMRfLI/WTKvpmOez4ZlgRv6UmKvES9I
	z6uYIs5/KkEY0GXHrl34aqpYMtwQhkeAxRPYzAzsNMoDqjzeAiAiraq8Qx33jMAYub4Vl0aPq9w
	/77Ut66ZjMDWkn2g+wQ6owszBm6rPgeLe0Q==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

