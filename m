Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009386;
	b=w1QtlDm8bMuTZIAV2UPllcmYeeUvhcxSKMemezWAZG6rswMjzSN5P1G73/bcHioXksxE
	 5O3DWXH+t55OQoVu4q0GkPtg0Xb7ebcQeRjQY1NYYlSlL/KfEq6NZoHFZlqt8PHVg2Sr6
	 UIBbcS2kzbHg8AspQ0CngnH96BrY65JIVVRLYVVu0ttwdhjcebsY2A7rF5fYiQ9c2dmMD
	 eyYK1qCKg/4yYwA9WCi1X6ol1b6fTVevm/BDU2sfokAlyByC6+ZkYnvX8/k/Svpf16+95
	 jH3u4m34ROu0di25OlXBtnaTtCCgZ5RpzZbUhFEpgZ+jVoM65rMgReV5eY/ZoxEjgKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
	b=MT5w0iA8vAz+PC0I2TqwCaFWF0YAcptUidJNpEtm+egDk10CCy4TxpErkuR48m8U/u55
	 boEJLJPgtltkY6Ra9sig9u8dntuowQ3D6bHgtzSSBRtGVHftnKEAVCihkvSZj+DFZ9dGG
	 rk2NKBuK7vCj1uFC77Y16kvvoljhUiZCFbHBdUn6D852RIoBFdA6W8BwTaKYjEgABhNlH
	 vXKVEboImBF7qCzBocqYeOVsYFCB26AWZumSnFMvfVvHxATKG1kB6pAayYdtTwhEo5bXP
	 GrYsJbXBGcuPeyWTpkWq+2wTAGSkF2mG4YyxomjbaUzjSvr3nidPJL0MZcchOaaomhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mblKDokH;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4485606A336
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4485606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mblKDokH
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e96502e447so10254285ad.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009385; x=1794614185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
        b=mblKDokHSLubiDUWUA/efr02qRXOAVSIL6WXu+Tyz03aBCkmGF0IQLkQ4zshri9ttC
         TWIJ/JkBE2NSTJNOEJLp4DmzTBN/Cdq/7M19Xkre7xHh0I4h27bYyu9hZjenLBLP7Xl1
         KNhFG0lqutu3puY08/eOgRzlS2Fkb9joLGdWJMxExERyQMdMp/fh+TRiaznv8/M+hV8t
         OoKDy9Dd3xASlc3XCBTVY8zNy8X3iCBkKTFjqCMgCyeqMzu4HCRGCM5gAX/7Xutd9IMQ
         uvporIWD3X4WIbgsCZI7OnzE19gQhIayPZQtBZSStgkXdMXpN1+8/Jzozz/I/PX1U5Vp
         o94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009385; x=1794614185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jsbkn6JtM+uViWqPojCdZmp2+VpR908oaZhMpAVLBgc=;
        b=tRide278JZeGmvlBeZF0xOs7qJrvt1Fwi4EJU7uN5KTaeE2zBXtMVbuiMQymEsvUdo
         C302QA7auuLZUfoNcjs+VN6lbROeOtBvZ6dCRqIwZVE5HUedlyPMf8YQTl9yg+E5v+sw
         VIgx0jrcd2017ctVIYkCgjqYYoP0QTvHvwssvzhh466jMIMy02RxCkOHQfX7SRRomc13
         6m9qnaewMHz0KHSdE5TERm26bpmYM6+WWUZ4h72x/c4lkNbJSdm4tmwbuPmfyVVR4KA2
         g4SwHIB6uK2i3U8xePvp1v2xerZATl43BIPpLQ8kVrmOf43Rwq1OAQLwstUQbWHcBvDf
         bMZw==
X-Forwarded-Encrypted: i=1; AL+hErEG07r8PVH9vv03NAlhzJZz7RxT9ju5ojwbCCqcfUTKH+ykXVP35EABN0CZDRApDqERPCr+I3n6G9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b6tRgqHE+XTaD32bJRSaxQuhSoeAwRJv7i4YdOE1P0d8dzhlP
	2aOKyi3nTx5ahqAxPex/RMMEI51qYaqq03pVyBK+YvlyV18EMAnHJdEv
X-Gm-Gg: AYBFou1HESVtIWRuHm4zKMqE1UNJNIDmjCMxLDpJCti0RmQ7aQ+6qfCnAyWl4JTZD+t
	0WvSLwl8ORJCbFGZT5JwjbgHWFq7l3+3fWR68KFX2tRwGtQEaP34sGuj0lUwrAnsm5Kcg9SXoOX
	aAjyAUMp3t8E7AQvbb2uhJs0GLRysv77b3GQeT4Rj6ZnR4mMLqJeUd9YYtiGhn51NYekTLqzOp9
	Lfjf8F0JVEb3d4Bh/TM8Pw40Aeef9Iqel+WbcPrKl8hsWkr+qovgGESYBvddTmWJ2ddvNc9w0oi
	K7zBkVwLl6tZS3XshhLENI24vSBjNcf479KwSqCi/ThMANm9AO0NT+HoFvtY7t497qC1UbB4NHW
	iZnrsh1hxjf+ISE8ZMZf0yY20Drtee2uMcyUGoJCoopyLyWYIn4M71SR8ITQ2j2LQvBIavZUbNx
	fOUpM3AwEKd1MablMn1ar1b1PnKBJL5RqQkj2vlWque98vS3CmbKhZpSugBtOa/oUigBs6QB3XP
	l9dUL57lAk7lC6NL6CZMIBE0o5b0FGLIp9a9sFau771Sp2elCH/WG3uxhly/0x2gKkbJWhlfZm+
	CYLANHMlIQhRMVjbyUSB
X-Received: by 2002:a17:90b:530c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3b0db6f4c26mr3934488a91.40.1794009385039;
        Fri, 06 Nov 2026 15:56:25 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057fda58sm852780a91.7.2026.11.06.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:56:24 -0800 (PST)
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
Subject: [PATCH 2/2] arm64: errata: Fix Falkor E1041 Kconfig name in silicon-errata
Date: Fri,  6 Nov 2026 23:56:16 +0000
Message-ID: <20261106235616.1533003-3-takano32@gmail.com>
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

The Falkor E1041 entry in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol defined in arch/arm64/Kconfig
and used in arch/arm64/include/asm/assembler.h is
QCOM_FALKOR_ERRATUM_E1041.  Correct the name in the table.

The E1003 and E1009 rows above name QCOM_FALKOR_ERRATUM_1003 and
QCOM_FALKOR_ERRATUM_1009, without the E, so a missing E in the E1041 row
looked right; only the E1041 symbol keeps it.

The Kconfig symbol stays as it is; only the table is wrong.

Only the text of the table changes, and no build was run.

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

