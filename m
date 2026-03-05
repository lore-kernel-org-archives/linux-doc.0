Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47561FF5E3;
	Thu,  5 Mar 2026 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743842; cv=none; b=k9xyZff+TNUcNwJpO8ZqqJlsF9nWHjJ7T/zdQifVVJIoiu1kZsn5S2Tl+mcv2PWJ5aCpnXT5PAUWKrxRx89j67qwBUfYmrPUInsDem7aBoRnDL00sjFEpUB4TSElf7gtZfA1fluY3f94OY4I7J0py8Wv9dLTxUdOYxz1fTKTSuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743842; c=relaxed/simple;
	bh=zinYTU2KOr5IVvEf3xD6BkbwMYVVEzdPlYhNvT0zc7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1qWRNPiwVlDLKDq3HOBuSUDUtJ3sQbI8YUvxCx3E98vy0gmilhzMV8dx2hPeD1uGbLq+ktYayKd4WeOG7CXiVHOTyr6PI1FrLnbYa1G96XmxRwh0DcXMJKd+s6Tn0f1No6ifj/Fm+YmkuZhsOyN/A8m98+EIaJ2R9zEkmmYDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N6bAW3Mq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cZGaI4j4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N6bAW3Mq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cZGaI4j4"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772743839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bd7LQiFFvde3tVJe4H43EnNJYZV/0gXw0u20mEtmaD8=;
	b=N6bAW3MqbFyh+VSvsY44aI4RDu9PKF/vRNMvBRKX27sBJ3q10VVcRAE+SA4BZ/VnOH14oS
	8Cb/bIJG9zAuvywPFfc0NJlP6bs2SalwrjtmH8czWum+TXSJxCphEIvI46f0ApVoetKxZV
	5Me0mgoTYie++TywJZxLQ89/dDlBOHiuLtfzOEihhb1TTC+tA4Xr0X+yIEAlqho5j4Ccfy
	TwJLS2EqHDqGnagux8eCDIQOLwWpWTAC0qPIigYa0HW4vH7q8gfGyzq+bfUoNdolIzNQhn
	/c5qxEYsaIln3tpbsCier+oJE9NKG+3Gsz+PCO54mNn+H3GyOz0dcN118Y27og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772743839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bd7LQiFFvde3tVJe4H43EnNJYZV/0gXw0u20mEtmaD8=;
	b=cZGaI4j4HPlgpOjcUlz67VnO/XqTaxBWR1jQDsrM4ZEYmkXUas4B6R98cbbmZRE3VEEGQi
	QDZRGODS/+Xh82DA==
To: Jonathan Corbet <corbet@lwn.net>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 0/1] Documentation: Add real-time kernel configuration guide
Date: Thu,  5 Mar 2026 21:50:11 +0100
Message-ID: <20260305205023.361530-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

There is a no "one size fits all" solution for configuring a PREEMPT_RT
kernel.  Intorduce a PREEMPT_RT kernel configuration guide to better help
system developers and integrators.

Thanks,

8<-----

Ahmed S. Darwish (1):
  Documentation: real-time: Add kernel configuration guide

 Documentation/core-api/real-time/index.rst    |   1 +
 .../real-time/kernel-configuration.rst        | 297 ++++++++++++++++++
 2 files changed, 298 insertions(+)
 create mode 100644 Documentation/core-api/real-time/kernel-configuration.rst

base-commit: 87fde737174a006166a9a3a197e124917eee0c55
-- 
2.53.0

