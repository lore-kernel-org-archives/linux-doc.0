Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535091;
	b=whLd/1k0+gvmhGgXCt2s0WbNLhLO/c6N4I7sDBajgOn54SsE1nVHJswIeHP9bXVQ7Ory
	 E3PJDswiSBHsyQA9s64AsngeY94Nn65XQ0pdoWto4sMfeq+pSAO3DBYXNhz0nWoyY6mfk
	 93oaQOT+U/RQDeCgoxIRb0JQ4b9Ku4nsnzC+eIbYSIqNzxnDo95uku4Iza2fnva7SlhqE
	 WEKtJu1oqCgjwoD6d1EZPaxNSTYfJznXHbGyWTUnXacw8bn3Eko03EihL/xHuUj7NKbX6
	 /c747cgtEFWk8JizCtoEXTHmi/QA0qY/jWnTZlttensOXsaUhgZjARarPozfS4+W/RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
	b=qZbA7Ni1WI90kEQYKs8IizAXlpAvuHSS86raMmrD3wyuV2dxZeEyfOq24JIFAGLgl2+P
	 1nTbph09RetUduIBlVgW2oH0Qx05dX11YQxE4s8qW6KYwLwecieBUaUYfbAK8uy/+VP3k
	 pNWx3bL2lUfNCqMPnekgsa8pu1yDWjYGoXZuFVMCZkVpDCv19TMsaPLW12ErhJvtAr0zc
	 8D5FGu5YmT9EpGBCtRCKMCFooYzehEEW6QK4FrfQ10aiqp8GsVz+LfJrj9/+PyfYlKsuI
	 Efsd5U/cuer48urBan0OsT1SeKAcCbsIAmitRu/DQGrqiNBmiJECw4ytT1KGu1w/m/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgHWXKtt;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F4606A329
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 15:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 224F4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgHWXKtt
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so5388641c88.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 07:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535090; x=1796139890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
        b=YgHWXKttSB/vDprhk+AB///I7J13iKAgNwCrY8P7tXnOHqb1bgExM/0Y5328UZ26bO
         vNvGrA8x/nCbo0rmeV296KaMSHPcRwUEdIjIhkesIiq0lg6KHQTuNVHNZKloyATDq/+n
         3zgc9E1UVMYOSPOtlxismo057o9iLNFktuQw8o9zgUwHCxzF2a6SvnJU66POe9rSMSC5
         uns0vgSF/esNFrkAd5i18z/62CHW714LGvua/NMu3Vk3AFbCiOsgmqYR7MUVObY/3f7j
         WEfthZITTT4VbTj0WtWecXCVi89OSV1HChVqU/8o0XyzOUjVTMMbIRkzwtCEgex0LI2X
         Tyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535090; x=1796139890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSdQ5TOQ0yFmH1YFXVI+vRhBNVbXW0tI8IkIMvJt8n8=;
        b=RZC4y5F0iu1tHwfaazpwOSIebVLc1uwC583vV6MvOEvKNqDJtM51UC9S8Nbc6bQtwu
         mu+yA2d0bdqMy6FZQrTwO2yN26JLi2wVxqVerc5T+p11oZJ34kOoF7GjMEwA/vJ1Nndv
         efs3bbeikahccX2mV+4tre0VSVDOWz/ZWIDu7orlQfSeE0G7s45BzNO8nFtw4pSdgD5L
         WcOkgNqj6/KomdasNb1E5Y/6EibeSbJCmfCcY7WiaDvtojOVX7KT/JQ1RE7F8TvOCjiQ
         DloPynz95apX7x4l5tnNR7d0Rew67tQO16x0jOQavuUbXLMK4H8XLvoCyb5sAigtMs+O
         pu9Q==
X-Forwarded-Encrypted: i=1; AL+hErG4RVklwvYV76N89yZKRxp7HgDQaU0ncLngi/Zq+G7Fji31Ue27q1lwiYUMIVJ5+FJ9EqiCMFbIyb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j/JhLVYMQy9XuJBHmYySJ74NXvw3Q0htGTLE5YEidct/K9GC0
	V9g9P2SLzE1CbY17vP8OEyv7j36UqL6iRi1lldwrkStkDxkepCSfCE0o
X-Gm-Gg: AZFdTZcGdVrgyWe62DtBoM22KdLcXA4K++eJ8a8K22MxLQAE34DFgtcj4+RBqAXn2gz
	rUaITDltA0K9KXU9uM9Wgo/+431/AnIVDM6yN8EtPBBrCX0CKS+MRr13hMhWv9DAOhysbj8vkXd
	ttqsgtKnZYGOHMyVvJC04+P7bZYS8tdpqXBsJxVfY9A+qLAbRfMMVzkqM2Fi4KOsouyDm+QEj0Z
	sR3Ao40jQK5xcPHGx7ZgKMdyi1zJEcvfv5zyZrRv8d8+Twkgp3lMlTlQJ5ZxBpg8MRmZR7TDj9Y
	vcV5pQFoKA2I9ng7LTQl5blGEXHioL/8cQ+Oaqyhj54AyPqqt96tByYa+J7/Czf/6skbaL42It6
	t1886/dsl6aEQAffyv+lVXluIbe+jdiJ2UYNZ+qVl+GNsk+tDd/Rs6MSuZnNgGJGDZQ7A+pJUxp
	YqS5nIsIt6gV1a0DxLwWJ9LtCe+cVFYCc54QdQ3V63KlOUhOdj24e5iWLwFEVmqm+O5n/UmMuOg
	r4yH9wrRFIymk+RtsZZIgZn0+SlQUHuFUkwX7DQQK9kBtneivTgzZtILJd+keQmh/gQhd5BX2fZ
	0skd6QwA8xCt5Pm1TPVNZwWsyQM7tyq2EB27NUGqjQ==
X-Received: by 2002:a05:7022:f513:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5568a951cmr14140772c88.21.1795535089896;
        Tue, 24 Nov 2026 07:44:49 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm58746964c88.9.2026.11.24.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:44:49 -0800 (PST)
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
Subject: [PATCH v3 0/2] arm64: errata: Fix two Kconfig column entries
Date: Tue, 24 Nov 2026 15:44:44 +0000
Message-ID: <20261124154446.1094507-1-takano32@gmail.com>
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

Two rows in the arm64 silicon-errata table have a wrong Kconfig column:
one names a symbol that does not exist at all, the other misspells an
existing one.  Both changes are Documentation-only.

The text was written with the help of an LLM assistant (Hermes Agent);
I reviewed it and am responsible for it.

v3: the commit messages are shorter, as Zenghui Yu asked; the diff is
the same as in v2.  Zenghui's Reviewed-by is added.

v2: the change is the same as in v1; only the index and hunk line numbers
moved with the rebase.  One changelog sentence is replaced in each patch:
in 1/2 v1 called the table row the tree's only record of the erratum, but
irq-gic-v3.c records it in gic_quirks[]; in 2/2 the sentence about the
symbol is reworded to name arch/arm64/Kconfig.
https://lore.kernel.org/all/20261121083950.1957044-1-takano32@gmail.com/

v1 was posted on 6 November 2026; please ignore the duplicate submission
that went out the same night with other subjects on 1/2 and 2/2
(20261106235616.1533003).
https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/

TAKANO Mitsuhiro (2):
  arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
  arm64: errata: Fix Falkor E1041 Kconfig name

 Documentation/arch/arm64/silicon-errata.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.53.0

