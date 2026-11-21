Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250395;
	b=fQeQKijVA19Ib+kTOcnsb7ps8Fufa+yPfo0FzvfmOtIQatQHyg6Xwp2ncRzc7bHBFfwA
	 VDSvKXOQFXb+9ZJRiD+PK9YFMxYI6uYT3Ze19D//lsHLMnB1BzmSqUZrIpgkLvTOfr5Mf
	 B9Uc9H4N6a+J5R7++ggBVvndcF5MFgAX/giWkJxIK0YS+MdpxAS5TAefSOvExz6txBA0B
	 K1Vxlb3tD9FVavhYDQq5Q+1SXBGR36xadMceAzljBL03qxqdJOg5Tg04irfcja0jX7ZAj
	 HVrnRkRw9lMMl9Il8Ox0zK8BkNtjTisSfboTNjU4G+gK0MLfifvNnQkvn6sTl38hDkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
	b=QXSNeo5p0YxQQMDs+pDni1P38vj93xkOdfs7leXud5S9gOv9zdH49rPv1KbzNw3DK7AQ
	 4I+4VPFP1PO0KGpxwkeBh06lLQKKBSPsRn4riU9vdDCLCcM7ArSD4Kfl3X2FMVG11LB4+
	 W7tLg7hNjGq4QsJrCXPqApVi3nH88lCVj4BqCbz16muMBdZDXBO/OsuiVOWmXM6GVHVDn
	 dFgkWhmg6gPpyFNFP6HYq5R+NWgYdtPDvTbtnU2uzDTnC/YaScJ+EiMXC+4Co5nky2r7h
	 TIFTIomHQLu6ER4mYTLS8S/FCc32jrqWAU5Q/H1TvoZpFqJbzqXC1F7zCS61oMkm4nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kniaV7DV;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C7D606A325
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 08:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kniaV7DV
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380c28f9e35so2609806eec.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 00:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250394; x=1795855194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
        b=kniaV7DVBnnPzOID5eDXiZeFp6Ebsh9Zmw30igykxMbZXXtJyjUIRMNWc2Peab73Yz
         +rX9Bj1pYvJXWojcbGba+dQ9LCzGg01E2EAqpEsC1k7IpnqHO54c6+o26VcRmTw0CqAl
         g6QNIO1b+ZWrg8akS94c85q3kHfOItEEiuKKsNNmmfx58FYKYUjfMYOXx8iQ+orRkNtN
         uzf4WQu1Z5H/C88aU26XjQdJX7Ul9rUV9zOoP3Kr4LvuGK/b8bkcCTQlhk2hQ3wASd5K
         Rn51iUCLvyzvQmd/HRcV2n6TpX8xKpJR54zsPqe+OHUwCH8WG2I4A+W8R3D3RkWF4oNF
         dMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250394; x=1795855194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3BVFC/95yek/PxTfrbxBSCvXUZXc+IwV23Y70sOBqs=;
        b=0lYhJYHV5MQso7LEIwMQ4WYqGdRzyAxowH0CTQTFSrXV+JEFjLLamZcesclS99LKH0
         /dfp9njbnvbmi+1YOtCAfClPltGvxyIuKTh5H7fPc+K536tvpnxX2Wsh7GedOjaOKklE
         GBBfeC7PzI5hB7TcrunXxbrxgbd6SPB1UiI5H7KWR6Us/WHph4TTPYuiJFR/rnjYF6qB
         YjE/or+bGFZ0ka/SL/4GO9G+sNVEyZ/uBnJTxsJdXf6Rz4sH3UzOSjScJamKMDG1OLNt
         3VL2i9suMJyOX5Tc5jF+29US63UhgVrPbt79Ek/fhyCt16WUohWbXAu0WWeQ3eZjYWpL
         xtsg==
X-Forwarded-Encrypted: i=1; AL+hErEURdQbnQfe/7ga4Uj4bkI4MxC7EleyQ+uFMw13waEq3QnwqhfpDzUaVCR1DFYbxGITjqxkUzo764E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fmMAB3sqzG7D5OOGKCXXzo5sGz/s8nXynOghZ6eIawUC1hSRs
	FJ22rVWCMdRTqg1v5pZIzwHfE8CXHByuhw6MeaLgnA8mVlM5WuuDkal0
X-Gm-Gg: AZFdTZda6ZF+h37XL1KtgcYiXyFZ7AvYxQKN/OVJWiJjSQ4py4zkj2ZpDVH8qO+QsFt
	lTZyNUJ2o5tjVNgRsmAnsONzrxnG5HaYwbBh3y0I6Xkrj9mtFW12g+4WFFlJn4fS+aKmpGoDuXa
	SlHWu9uQ46YP+Jq9BA0hGUvQQrtKr+E7kssrZaROF5MrMoLQI1t7g9TQ1QLG0uZG6yu6+9gE/QI
	vd1EXZRwTbdpNTgQwWBT/GWIpKBNMy5E2tSny7HPI3eKd4bYiyg3D54LZy02j7UBJ+zgeVDhxtI
	6xPazkO01p4yUXP4hMzItL7O3oNMfbufMzCQMlNvmHFLpY8HfmkdM6hPZHlbkhsgss0mRwwcKyP
	gvE/zyVTgVKfkmAMxTMLhmA7Dbgg7z3yue0PDF0fZamCxXOsF2CVe88nwbNIhYZMbAOvL/1DBTj
	o6eUNWtl8UgiWqLCPiI8zdVtq/CDZJXSXKvrFX5yTtnmcq34vxiFy2FYd0Vtm2ipFD9RMC4vX3B
	pyptOvt0rY+cGpH/TWP3RYLxQnwBKYMuFR1e1hBjtUb7oFiC4Map4aM7GghJXePsfSKEodlz+we
	NnsHPEbMtS5KFhD6P3p2
X-Received: by 2002:a05:7300:d589:b0:386:9ff1:7f7d with SMTP id 5a478bee46e88-3869ff18213mr549553eec.4.1795250394091;
        Sat, 21 Nov 2026 00:39:54 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:53 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 0/2] arm64: errata: Fix two Kconfig column entries
Date: Sat, 21 Nov 2026 08:39:48 +0000
Message-ID: <20261121083950.1957044-1-takano32@gmail.com>
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

Documentation/arch/arm64/silicon-errata.rst names two Kconfig symbols that
no Kconfig file defines.  I checked every Kconfig name in the table: these
are the only two.

The GIC-700 #2941627 entry names ARM64_ERRATUM_2941627; that workaround is
a GIC driver quirk, matched at runtime against the GIC's IIDR and enabled
through a static branch, so there is no symbol to name.  The Falkor E1041
entry names QCOM_FALKOR_ERRATUM_1041; the symbol defined in the tree is
QCOM_FALKOR_ERRATUM_E1041.

The two rows come from different commits, so they are kept separate and
each carries its own Fixes: tag.  Both are documentation-only changes: the
table keeps its column widths and no build was run.  I did not add a Cc:
stable tag, as nothing outside Documentation changes.

v2: the change is the same as in v1; only the index and hunk line numbers
moved with the rebase.  One changelog sentence is replaced in each patch:
in 1/2 v1 called the table row the tree's only record of the erratum, but
irq-gic-v3.c records it in gic_quirks[]; in 2/2 the sentence about the
symbol is reworded to name arch/arm64/Kconfig.  Both changelogs now say
that no build was run.

v1 was posted on 6 November 2026:
https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects on
1/2 and 2/2 (20261106235616.1533003); please ignore it.

The changes and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and the reasoning, and I am
responsible for the submission.

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: d0f871bfb831705d9f55479f5b2b40f636ea7b16
-- 
2.53.0

