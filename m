Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008746;
	b=D0TghJHtwkSMGFZXe2+cRYRaq2IV1fpUQRhMG/bOvfXNqfVCxrd70i0gnEq4+NiQZphF
	 NznZY4z5/PrHcIKQIEVcUhQoJJARw7qbe1C7ptayf7aB1IHKIZkbDtPQCnquI1xV1JyHH
	 K4JOW0veUU5h2l44eBhX0yu726SCtWs1ETsFNUZk3dpEZ7BO85bpfdiUM0x9clIuD1Ss6
	 YkCoxU+CxkFk8/LgJCK86dZBNQUjQVQ6jcsQ1PjmEKF7In8CtEunXYioiyeHi2zwXMGeO
	 3H4npHUYj6kgkH2H4sQlU3YzSpNTY5z9vGbEIOOyS6NG1hYUog9tmNmgHWQ/ftoxqBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
	b=JyC9jQ3k7oLQgkCzaprfsgQL44cA9rcV6swcLkTGAvwgjYuaSkrq4dbEuXUkDrwoVVAM
	 LT0zmtyPx31cEV1maNk43NyhULcW8e8NJWRA8Yszb3hIoNHL92Z1Zt4NIEkzNxnCkvwC0
	 RmvmbooI18a9g2H8WK09mbyC7ZRtb/feFABmF04ee3LGvdQsYWbeI2UFecDOUDVBXrH5z
	 cvq/lfaX9mzYXMnNd1WnKuCWJ9YJLHHPMmY6uaDNUM4XVqd1hhrNZdCh11NgYFOg5nas9
	 jAPAAzXxmC2j5WJ/c6NbyM/N5onAPqF9letbry1oCORc4aypTCloDGl2ZTVxbD7kwCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvKpTxkZ;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA96606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 23:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA96606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvKpTxkZ
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so945758a91.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 15:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794008746; x=1794613546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
        b=AvKpTxkZfLrKF6dsI+Te3PU0pd+p5S8Y8HIwO/1LC7kP3um+p85fybyChDQHUgYOsN
         /MDMEZTmqcw7Kcr/5Xtxqc8xVj+3CSzVs2XR8QdaxKxzrnM27+lHgkZi4ivXRpXp8jFE
         KVby/y7PL9v7fmM1XMYTNCkKjIsUBiYsfqC1j4dwnxYCPWR3+6QKCRm1QE7YPY9Nw5T7
         KGzzYvwdQCXGw/ibq3xXWfGuHoFqruyiCANHKfxPo/Npx77zxBkubd1ocdp9hHdyKp5b
         wTLsazLyvYi93bt+Lsmubq1thcyAldZmupsA1IYyPYPc/ptGGRW60t5VxniZu92XgrMU
         XE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008746; x=1794613546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ES7sOpIZ4DVyyrB+2ovpkLfMunhrzIs7GAeyAnBt/3w=;
        b=rINs/wAfU7/kgEmK1JpC95mDuqN3nz2lfVipgEf7QNlEJgc42JbEatHPMdjE7XQL3C
         Pk7G9BuTUamaYtthvj4afuhsY592wxvty3dFT9UH4CcC67y9IawFFWIzxXzsG/b8Riis
         I3JJmIoKHO9lPtn2QSAoLQooMabVPg5Z8vMBwbfDUM4o+NNjBLb87TLKSOGXGk6J+Djt
         CUt5F8631S6gzdJKRAwJ0X3jFQxWwIRhesYeNd/O1oYVJH9/u3hAE7BQEnJ3euVUQssT
         zfn0ozyiqwUUtXWjwCg7Fd0B6E5ATNkgRxiDyHb18vOaqPZYaXWLFzR4ntLwgJ0l+f4w
         /p9A==
X-Forwarded-Encrypted: i=1; AL+hErFZeOdLfW5YHfBTD44p37oyJQOUtQI/MTOgS/M/RHQz0V5Q0KVIJ0OX4meRU5+SpyyVtUrmw/7j3/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z83ndMPVeK5x3dj6Zr4KE2Jb1eiRhW3nHia0hvip8vOGY7zpPvy
	P1N/BYlToIj8s+BhKK43aF72m0xK+n0A+me8wgkYD/B68NLd8XCovQFi
X-Gm-Gg: AYBFou0ywM576IVFHK31lRCJtkLkZ6a8Sa2K6H9o6Qm3XKV7KhMkbksu1njDPOscas9
	Pz7T893+WeindXaX7zLZYDqNe/VWsnq43zdAUAbd2vKNa90osTxy4sh+DaQ7XMijwtWfj1kFN7b
	DWZ5TBfdLZMYap3Pnaru3a9v99PTUa0uNhLA1vEj5kA6JOz3PHEnB3xqUlHWJmENHv1ngBFv1Kl
	GxAXS0jcqkXlq7XV8sdTiHDXyJbq9KKhxA35oM82hwSXFefk+72NIykUw7vGEYfNIBflHZI3dqC
	jImimgdmmjeRxUUlxVtGE19rKC6rEyTKbPvFFUfbdy9GX5N04dIu3U0zEKqo1wXTGb74XYYDgBU
	Ff+1zx1B+fR3wbW3Uh/oyDHu0L33K4qrcbQmGNzGbRPvHcugX9Jl/Tf9zivUyTAgQBwFd+1a4yl
	/ej0h9/vu+IRssaxb4djswnMBaUqlsYbULv3zlK3dV7lteCTk2s0x4JJy2PT3FKP3pfi1Txg+Ee
	1XG/790YAFtbGA3OALzRchJWPRQF0uEPsh8c/YUpTI47tn84A3vvrA3rgl7G19vFxIFwZRRfMnD
	YmY2CgI6Q8VhlxFYTDZl
X-Received: by 2002:a17:90b:4b04:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b0db6d2668mr3884714a91.36.1794008745732;
        Fri, 06 Nov 2026 15:45:45 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058d3310sm715972a91.15.2026.11.06.15.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:45:44 -0800 (PST)
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
Subject: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
Date: Fri,  6 Nov 2026 23:45:39 +0000
Message-ID: <20261106234541.1474324-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Documentation/arch/arm64/silicon-errata.rst names two Kconfig symbols
that no Kconfig file defines.  I checked every Kconfig name in the
table: these are the only two.

The GIC-700 #2941627 entry names ARM64_ERRATUM_2941627; that workaround
is a GIC driver quirk, matched at runtime against the GIC's IIDR, so
there is no symbol to name.  The Falkor E1041 entry names
QCOM_FALKOR_ERRATUM_1041; the symbol defined in the tree is
QCOM_FALKOR_ERRATUM_E1041.

The two rows come from different commits, so they are kept separate and
each carries its own Fixes: tag.  Both are documentation-only changes:
the table keeps its column widths and no build was run.  I did not add
a Cc: stable tag, as nothing outside Documentation changes.

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the
tree and the git history.  I reviewed the diff and the reasoning, and I
am responsible for the submission.

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.53.0

