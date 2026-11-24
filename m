Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535095;
	b=j1CaVOnK05wdADW9OE9nl6kgLouOhUsTMjzcZE5cIjgjFSwMabSwRTbscPdEeImplAvJ
	 +RIZDmyL37ukzpwNpHmKssPquZei0CRXc0VsPXjoxp3yBdpnBJQ4lRdJkONa3842NJQwu
	 aNtNp/Fr5cacjahjg2YUWOKxwOEi1UwmuN4SiWDWnatYG0nVEJ/wA7qQuZyVymktV7sNt
	 RKn5N7U6x37piUhMHnK94Nx5wAtzMy+VIWT31LJy+XYOj7T4XsnV+fd24zD1OTHpA7lxb
	 xg5wHGp92au4FAk3bLAifpi8iNuBM1SQQaYBCL7iaO84c3QINwVYLMXcwEzHwgtC0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
	b=1tIraFJx985CQyEK+P5i+hoptfWxVxikebeJOdQJDDeNhaCinjdgsrQ3nA6Rwfs08MWf
	 d8CfXksskYphNGvDpcsialSssMaoGinMn8yCJwI1b7hd/wuVO0OMTcgPNHkr8Doxea+DN
	 Hl4btm7Ofg6w0WzaG/NEj3lWVlUOGvebHiS4yULVJ0TvyeV/qCO8LmgGo9+jmkeu6Hnl7
	 mE9ZIJw1eMw7AQ4rDFNo/uM1hqx+sM9hEr92pHTeG1BWKm7HBMlZXkjhgTZh1Ny9uQgLT
	 agCN8mg2bDVhHDZCl7pndtl0fnFl1f+AdDNQGPRnXQllyqrpHBA9OoMy2P4cO58gN2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erRhFTRI;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42029606A32C
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 15:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42029606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erRhFTRI
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2136800c88.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535094; x=1796139894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
        b=erRhFTRIESVHa4MVmmAwtnkzTILgN2kxIwMcta4WCneblnsNHnLpA+4lHENubl+1EB
         NeX7cdDVjZ0UsVlhceHkgtde8Smzh/lFTINcZNjicqTzQC0yerbIUe0jbdWnTJMDcUVP
         jzroSfv4NFogn3XA4MAJLpoZtnKPtXO3IlboXK5Y1phBgw6owPga9y9eVetx1ifpAdxy
         kCSN/aiIyJT54cx76N1KyoPEOD59pOsSyHR6hz0KiuUjUN3jnSZSyFtVa2ULnEPIl+Ah
         Fq766EE64Um8UDL345C7mmI+RfopdE30K1Ish9N3Hckj3nOWVQuj1MKXh3Ela0DlkMeK
         P9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535094; x=1796139894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mjyaWQC6SVnzKDMu2HOf5eLMdckGl8sK2GwpVxh/TY=;
        b=PGRIJtRV7jaW4poG+ZKM3aLmqtJ3d9KbEb9BSB9t8Wyxa8T8nj8My9cjOS6N02e6Gb
         YqRM6GdooWhGHE1385BSjySPvzNNjttif2nnU53JGTtkZNhgt6/M2+pfC6Zxc3aA7hJV
         zK7PgIKRgkqekMVekyorS9zKTt2eeIEEKSf/4IwX+br2pF2oxPi/dHUT67/t4jxSjO3+
         zYP2+x7V32XqVIsNN7qjvGd93tvWKsVgqLGTfHYkOb3q/MnptPJ0wQUgW4k109zQ7Dzi
         Fyze8lGC2cwfftzMN2eTqLIv5KflWFSayg4j3H8SY/2uh7HVUIA0y8ulifyc4Wkn5hF6
         xVVg==
X-Forwarded-Encrypted: i=1; AL+hErHF1Av6/uTbCTvNVTohnsI68KGEmyoW7xJadGlszBnFzwfNtLNublqo7jgXkDb4Yc3A6OW7gyIe5YA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s8EI7mxxAfgkrPjSRnwhy5gasLn6foi0wzkPp1OkUjNyU10VN
	AZQMrojjZd4TOkdnf3rLnSy4zlXnKYH3p6DI3RzCefb29mvZ4Ef/Wxj0ktWrhA7c
X-Gm-Gg: AZFdTZeTDPT/9z5P9bGKowFpYnQNUCAf1HAGrTEdRdA6P9ocIZAvNpLOW/B4vg9sxLu
	1IJceXJ77mc7bBSj2nhueDh7JAfFC/ZkJ4c6CQbQdj3eky+FpCtpt/WRUHSpuCXY1YaaTVb6nAG
	JZmfMX+9YEQQIDHQy1qQxBmWAmidFpMi/yfnn01OEP+ETJZga07PqcZwJGxbqK0sSd0RJDAb41n
	jcQsd5k5/RXiu7LRv6ulnIS3EzdAcl4nRCbd3uPBYMliuU6o2zYK0vXbgZ7cvWIZON6i6pAUxSA
	a5QVkHnwDZLitjkWOePFgclJvskV7NbMD2L8g8yIcxyfSxij3pI1ph/Sp0BEd3XTgKW4Xpng4pY
	sSewN/OSCNJndVZArvXlwTtyLK1/lkin7039c5oSGahFInzP8JMi2kmB1GU+mUA63oUOb+Y8paz
	+Z6oqWAP+12vhPCN2mx7N64tPMRsq4A7QA3fRL8Bgd7CwnbulEUCTOc+GS/Vveuo+h7RW9D4T+/
	Gm/RAAbNUYa1LCWSsJAw3GzcrEBSsYNiLQdBEVWPEu92SYykJN68bsQueTDQZY+SPrQUeWupAaP
	wH84Z4/SLP4YqRl2rpTp9HvCSmqMOoAG7dObP6meog==
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr14794229c88.1.1795535094310;
        Tue, 24 Nov 2026 07:44:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:54 -0800 (PST)
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
Subject: [PATCH v3 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
Date: Tue, 24 Nov 2026 15:44:46 +0000
Message-ID: <20261124154446.1094507-3-takano32@gmail.com>
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

The Falkor E1041 row in the arm64 silicon-errata table names
QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041,
defined in arch/arm64/Kconfig and used in
arch/arm64/include/asm/assembler.h.  The E-less spelling matched the
E1003 and E1009 rows and looked consistent; QCOM_FALKOR_ERRATUM_E1041 is
the only Falkor symbol that carries the E.

Only the Kconfig column is wrong.

No functional change.  The change and this changelog were written with
the help of an LLM assistant (Hermes Agent); I reviewed both and am
responsible for them.

Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 5dce49a57864..6e2d94a8d3c0 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -372,7 +372,7 @@ stable kernels.
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

