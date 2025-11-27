Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4A3370ED;
	Thu, 27 Nov 2025 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258232; cv=none; b=V26Z6z4nmUeUH63mgB5swep9DypvLrKO3mBbGky2DUk1GhSLIFz1ZMBCoUtbHenI9DdvmcNu8EjqLVYXxNeZrw8ifj0KuQ3/gvzzSmpreoDLngH4jJHI9YPdPuKf/JZ2QU29KBDPWjfW+6FisrDVJtekpYTrVDtkUdO9coHz6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258232; c=relaxed/simple;
	bh=Z3xt4pxWhiGdDKM5sFaOM6EyW5z4g5s6JsCrkgXsFcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qSYubwfaKkCcT8QgM/p67FvUC4ZCxaPzRRgWdEuCkoQFPsaLTh8/iNjiEvqXXbEX+Goa5RDpiaiE98HeqRL7ipPqP8utXL6UAocKSXSP4wsLdpAc5/91KGUuUhkUOZ/4zQEX1ePptGumrxZvNEtPG43nY6bd1YYKiABABI8mO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=34Qo+CUS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=okwMDuxC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="34Qo+CUS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="okwMDuxC"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764258225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TEBjjZgz3wcBsiPytvc9Jcnj5155hhuewVMQHUXyGLA=;
	b=34Qo+CUSA+CMtgUYISw5E21lo8Y3P2k9gAG5UzhdjUeeXPzgFitNDf4vnV8VPwlC+fusSX
	ZkSlQhF0jp7ER5KRO3nr/VikoiKjUfrsK+zrvtvwFjPJanb164XPslCuvh/GwqeOmFB0qL
	5N+xN/LezewWyrVdc6Kw0SzoEooQYAqJF81m+sYHviukcG3DaeRdzz1QJ1NUUAhsdgeEn3
	Ws+MemKZPZ1BgL5U6lGm0rXhfOIhlGk3olhk/vdpnf2BFztdXI93nkdhcIWArp0gZR5ZHt
	+75VgVawgfSdiLOXG7fqdt3PzuInoTJ/isUO+476jYdzILx1cGdgMj01FDvWbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764258225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TEBjjZgz3wcBsiPytvc9Jcnj5155hhuewVMQHUXyGLA=;
	b=okwMDuxCNV/CfHlrcFJogEE08L/Yv5xyE531RWt31DKaLcQ8guYkb+uWsJWeLLovaEHQV+
	0/G8CZMLDAA0YpAQ==
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Cc: Clark Williams <clrkwllms@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 0/3] Documentation: Update the real-time documentation
Date: Thu, 27 Nov 2025 16:43:40 +0100
Message-ID: <20251127154343.292156-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series adds an overview over hardware. It does not explain every
tiny bit but explains for instance why power management or USB might be
a bad thing.

I also collected Lukas' patches which rename a referenced Kconfig symbol
and a maintainers entry for the docs.

v1=E2=80=A6v2: https://lore.kernel.org/all/20251120113708.83671-1-bigeasy@l=
inutronix.de/
- picked up tags
- s/busses/buses/ as per Randy Dunlap

Lukas Bulwahn (2):
  Documentation: update config name in real-time architecture support
  MAINTAINERS: Add doc files on real-time support to Real-time Linux

Sebastian Andrzej Siewior (1):
  Documentation: Add some hardware hints for real-time

 .../real-time/architecture-porting.rst        |   3 +-
 Documentation/core-api/real-time/hardware.rst | 132 ++++++++++++++++++
 Documentation/core-api/real-time/index.rst    |   1 +
 MAINTAINERS                                   |   1 +
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/core-api/real-time/hardware.rst

--=20
2.51.0

