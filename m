Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008751;
	b=cjxrTZT7cFNeoyVkHYUNfgHMamYHjzIfKAhWyNHq/kTjKFWiemcVtxb/NiU3r7OgSgLj
	 PQbmBJ7gPsynNsfwkErGPXdOUnthpg26JJKPHkwO6HtiTC4TE+SJSlwRTxu9bjxvC5ooc
	 h87WYnocByUet4uV2CQDzJZxS1fr7tHTPYCL1ne4o4xfAx5lNa4mpr33F70+2Ed7C9tHQ
	 xLX/JCdV0fJyEmDng71yMNjgafXkMsLMskJhQSdqC5WD+gWT9W6TNNnGp4tx5F0HbhbeJ
	 P3jVmxuDxXno/qhofLTmS/r9Tx7S0cUkowg8eX4yN5vGZNvTMJm/ZWAnTYaZvW0orkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
	b=u0uzTqyvxFxJi73ReMKj8F41NDTnpvfEoDeIeJ7G+5+TREf5w6lJOuL8JphGnWVwZA6e
	 9hE63i4lZto6sX8EcBDbDxjKD+PxNfGra+rHVnAzPNLFPQ9k5gYqQrY/SgcupSgRqPXJa
	 mpoLDjuC334P2Nccp2TxEsMSYWYVKRrT2dRct4oepOYViNNFqyIwq/Y3PEyWiLANMyPT5
	 oUf//Yb6IGfNUsanCaR7CZSjJEiiaUajoSm73MnZYnVObb4VRGnSPLfvY7UfiMUXEbUaT
	 YGbNzBPNzrSTcE+M1qbAcftBdtUb8EEj5dYIK5aLTFuw47JKmBb5EH9oEETsyEjWFJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viendsg5;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F9606A32E
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F3F9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=viendsg5
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so103751a91.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008751; x=1794613551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
        b=viendsg5RXb/88nl+LLv/gEVDv1+c/Gx1H+X72dv0mCQteKScyaClGWtcYx0/ePyPG
         GJ5sRLUDyxov2hL3TtI2Q5zJ6894MYAwHwu3K8H73X6MZaxlm0sNqhF5QHRhrqMTdEgt
         S4EMLgY/WtV6Hgd7OPWcXd/IDZy0eoGgfAB1lzQr6OiKf2DuMNDf/0JYd9aW/gK1VrGk
         ZFTyCVdNsphFv3tN7FRhngbFR0OKZXLQg+o0Fx3HfQ5U4Nc7m4Ozi/sebiernxS3IH5L
         Jc/bgv7vZ0ySsd1R+34wBMIlgNQETsHAIh5ikODOAD8Yt/Om0wvvZzv44R54nnHdQ1LK
         kVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008751; x=1794613551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoJVINX8BcnNTAIBKSuno+iiYgSzX4Li9L975jdSWfw=;
        b=hS7yO9sTucFjWTlelB7Rw8YSjqjGWmnBXe3K2SnEs453C28TRCDRh3zGeTWCGPC4xt
         wcqUi3LINPaejnEQkm+l6iIc522xLnSIoX8yMOnBH2fFyza9ggoYafAluXMecsCEsx7/
         ZXBoViNWyybz36cf7ez3pkG4klSCr0qHmLmT6wja3WLzFAbaIsCm6i1blxXyqrIBf0Pi
         tWukqajA2AKYA2x8a6dUgSexAw0bhjN7L5/iu4NnqlgmY08qPY9kTThOAPZaJDeCHKTu
         5CtVW6EvBVCRR0gtSq0tK8oBY5LzVwBQbOWT2xS/gyBOsNV/POHlU1Sxc6+DWcsKBMq0
         M0jQ==
X-Forwarded-Encrypted: i=1; AL+hErHGzWHhAxKm61oCOYXuTNnS/dqFkosRKjHjuxHC0snpzHoitLP07K5mU6AIafL5W3KnY8o99rHVlOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1wKFxW95ueIFBtO6NV4W19z4L4CQTBBMwkLlHosI+CJxEBao7
	uEd2ShS6gGKWXDHVau/Vlb/X4QCkcg/ett9TDiusk47Oy9+gKPFRl/29
X-Gm-Gg: AYBFou0uCWxJnKYPFKCBEw662kspMPuC+828vstUoZEXRBIsptZXRggPxSmH0u8XKBD
	Dz1MvCHrDf55vl+5y4QxvAM5DW1pF4XD7kBWTWRGKSXqUhvxv99qCzDBvwPIETFDilh1MXCOIGz
	F9ac/YZ76I5gZJhgFoNbKYC1fpnywDPjE6c0eFuAfBOUfA8/hyujZk5YQlF+Nm4alUnskSerufr
	kbqYb+zYhhkE2j4G+wmRoRI3zyQFCQVy9PaWNFL5RRrMEDeMC8X4gWkrdI/+pCUwDoQ8I71LDMf
	6JRGdsSinNDTS/r7OIeH5Acy3gZtEbT6FXhfb7mDIJtbDfXisXZ8b5FHdmRJK2xBIMuc/6DKxaz
	5kS1SttmJOmFsc8OrJwKk5X0Wr6m9v0V5JRq710LjxFSqrLGGc50euOxMhUJ/8PwXnn/cwQmfhq
	ChQvDorCUPkpIB/wj+destuhmmlyaYaonx39zBF+a0GAxmigAPS7YFuO9lEWNytrx14X6HT5lUw
	HU2txh+hu4zyq+syafCtr4T8adaWzonYK5E0BHjWRTeGWM42dS7234S2neFMUwnWO7z+EoILm0u
	67yRAqooTZATZBz+yzX0
X-Received: by 2002:a17:90b:524c:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b10608181dmr328100a91.8.1794008750759;
        Fri, 06 Nov 2026 15:45:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:49 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Fri,  6 Nov 2026 23:45:41 +0000
Message-ID: <20261106234541.1474324-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106234541.1474324-1-takano32@gmail.com>
References: <20261106234541.1474324-1-takano32@gmail.com>
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

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
is defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  Correct the name in the table.

The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
symbol name, so an E-less name in the E1041 row looked consistent.
QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.

The Kconfig symbol is correct; only the table entry is wrong.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index afea5e57ab95..f554fa04662c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -360,7 +360,7 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
 +----------------+-----------------+-----------------+-----------------------------+
-| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
+| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

