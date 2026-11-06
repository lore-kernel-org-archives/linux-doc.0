Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009383;
	b=MHSVf4AYlOME+IMiVjH3dey5P1mAN3o336dpGDWdSCC/Fk36OuPfCxps3phiKBb76NBV
	 l55c3Ir55z9PBr7PScFslNqSANKp1QY1b9vd1oyi+nDG0Wthsx4ZeHXqiDx9KqJf+LG59
	 5GkWBUFS2kRxW9I/AFWzkNaYWlbG9LgHj/tkRfz+wgDRCNUUXlTYPgwbMKHiuNFV8mrAk
	 yEqQaBGhD27Gy9KY+1s7cMH2ihQF1+Pf0amoCbVNoYoyV9vcm+bNe8kQSElZbGw6AEfqQ
	 lNmN3kBYkeIke/wtBeuJEV/9X0G2PfRb4Mcf3o6kXvGlojgudo2hOAnkiqBHNYi472Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
	b=lX8NFZQnKUP5nXXRUF3ZbygVnaTkmGLVkN8Be5xXqmaBsrTEYOKKZn7wM2R+vlk/5Q8Q
	 vZrxmI9uq7tXKX088NJljBAE/WeJjbFOjlvBi9Vwn5QZqMi5ytOeSRGxWOqRSxDRG+6+w
	 KwsGR3RrkmnbP1QikdVB3OTYrLoS/m8mCYoVtCWmH/UyXzECOxT+t9VVU2/ZNCfLKfS1+
	 gaRIHUVq7e/JKBRkfo4xTyBMPhI+chPCJ6nP/aEHjN3jifQeN2Ej2Hsyosg1H+m3A5dsF
	 MOcf5A8uTwi9dFuKylW0rXyqftmK/9dK3tZPpD8KRpSvDqbbuqHxiiD9REj3g/A03iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQORgJoM;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5F606A330
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B5F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQORgJoM
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0fd031198so239586a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009382; x=1794614182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
        b=fQORgJoMvYMnMUgWrF7PSo4bl3GM8XuDObpV/T9gO3XE0G0E7RHrm81nbJAeNKtxQm
         HuE6sX+5mpPyMXwdj0Xjq6VWx3u5H3x1uLtno/M2ctX1LvDU1oT7v/Xb+lAvRIVUZtwF
         KRsuOEZAG3ri45muOX+n7fESXmjexh0a92gD/4UfIeBVGgDzWsyKqtDuPjET1nVG8mOP
         2vMwSOyrvTtqjjUXHopqj7ZICooVderjc/kbrWckppCYgIGtGquf7IhSzW6TS2/diP5b
         XdlhLnJIyAiv/TWrpB0SCUEr7Yime1SeCu31F7sgw88yRKuKHUfqogXrZbcl1ZRdEL/4
         34Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009382; x=1794614182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqCmNfYKlNwsn1idkjaXW7TotQKUbQb2rBHLGM5f6tk=;
        b=ewdEjwf6iv5/l9IiZKuaTa95Vxc7eXo4GBb2HJsUS54UCPSHNjitH86tKgqw/KbEOc
         4Pa1zdqm2QaiuCVbtxbuNCq0ZSOjeMnzLDGHOWsMcbkwEqJBA8VHoeCqpA9brq+8bpp+
         VAbJY7GQytmmkUhfAbJ2dt2+Ph03yFFg3MlahSOzxWzxxiqSHS46PbQwiG+PA/uDJK8I
         j0k9Nnk0QwviZIXXXgsOTblPRazoXuuxXaf/jZYMbQyRmuR5xQ576NEUb2L4WFGj/LSQ
         /soCdyywkMI3qstK2oGkEbtrLKXRErjkEMpCJa6HjUmVc+/mNdXMdGBrJeoH9ZbkYJCE
         FTWQ==
X-Forwarded-Encrypted: i=1; AL+hErFwz8vOvUyPWN3J+K+4NVimTf+yPjb2DMzKRRTS9HkR2737+3C/rw4mBx1Dlah9fRrAqRrT+K6wTzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wYzBgps95YN032h1b4uipXagWeigV2K3W2M92NDvBs4wPwuYZ
	v3cBiRsN4pSq7HUzDgRYlxwjOmAgGrOWHvRzAlZGjLc3QxwroUCkEy5cS9XWdQ==
X-Gm-Gg: AYBFou1w3QNgJCKFWg3JDdfefMWz/32beVYy49HUb5y/8m7fN+cve3OtcC9Z1feYc2J
	1qEemj7La9T/sMG5OfYP8tgAA179xKATT/4Cyemp1cquXxCdgfRTMEVlb8pJW7UkUCdNtbcVZX8
	ADVkmOUtaN6JO4OEo2/VUZzlK635gqultix/9dD6w4ItTbCAnTrncSxa6a0qErUcSpjij8PnGcC
	z9Q6UKI129jYLXui/w7btoLZhZ5otRQfVdVv/cdEJlXL/lI4t7/VDeCARa3oNVBWnLe/P03j5UU
	E1R70inGxWcj6vAQwoWuOxoX1O6Qx962Gnd5mdEsLE489E9AMMkR2p5M8FbZj23zRzWCdC08JK0
	3fymtnqKreG9oWackHsLL0wCTXkPjrB20ykrPgSyH/Xep7SA9qoJUXjLQPqikjaqFUGsfjFxGfn
	vqgvigLpW0b45EmMw3nnMKodMYAkQemupubYNsjeBvpjFJKc3ikCOWckF/MjDY2+EtiuWoUKN0T
	r+SFvdEoAWi9YYXW26F9j0rkLDO/fgGPYBa0A4/ONL4I98KNfewSqB8BFqGMIvdgpE04h/KRuWF
	ldYynVAeQH0BUeaj+KAg
X-Received: by 2002:a17:90b:1a85:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3b0db6f8318mr3721226a91.29.1794009382537;
        Fri, 06 Nov 2026 15:56:22 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:21 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 1/2] arm64: errata: Mark GIC-700 #2941627 N/A in silicon-errata
Date: Fri,  6 Nov 2026 23:56:15 +0000
Message-ID: <20261106235616.1533003-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it, so a reader who follows the name
finds nothing at the other end.

The workaround has no Kconfig option: irq-gic-v3.c passes the GICD_IIDR
value to gic_enable_quirks(), which matches it against gic_quirks[], and
gic_enable_quirk_arm64_2941627() enables a static branch.  The table
already records workarounds of that kind as "N/A", for example NVIDIA
T241-FABRIC-4, a GIC workaround like this one.

Set the Kconfig column to "N/A", as the table does for workarounds
that have no option.  The row stays because this file acts as the
registry of software workarounds in the kernel: deleting it would drop
the table's only pointer to gic_enable_quirk_arm64_2941627().

Only the text of the table changes, and no build was run.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afe109afe692..afea5e57ab95 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -279,7 +279,7 @@ stable kernels.
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

