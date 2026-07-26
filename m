Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6821626F289
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785073314; cv=none; b=Vd+q8FVqBKStudPFl+u5GqxJSUrd9NQcsWAYDXbqgAOA/t20oi5WDDrnAO5uLjAydJyAqfVO/azmVT4/HNAhukAS/W3AIWKdM0BzG+eGrBdp8+DTgmaiaaFIbi9aBTOLxSqKEDpUXBPspzhnOahq+SJW0ddhG/3bu5zDlLTAgeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785073314; c=relaxed/simple;
	bh=PGAf3ZBIXSPxW73hImNZLHtPOxJz78btiU1I1DBlN5U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZwHtdGDAvlqlxQ5fnz6PPSIVzMRGrRCR5iUqQmmBgKd/lgwBLbr2s+6QKg5B3kRkexLBI7lHD3Jb/GLT116N4EAAxoj7Ca7X+rEJHzL1j4WokBa247nRqFKDqNzyURqUqueHmZ74Seiq5GLCulX7mpWy2nnn94xWDG83tjXPYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xavierclaude.be; spf=pass smtp.mailfrom=xavierclaude.be; dkim=pass (2048-bit key) header.d=xavierclaude.be header.i=@xavierclaude.be header.b=LCtqvKq1; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xavierclaude.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xavierclaude.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xavierclaude.be header.i=@xavierclaude.be header.b="LCtqvKq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xavierclaude.be;
	s=protonmail2; t=1785073292; x=1785332492;
	bh=PGAf3ZBIXSPxW73hImNZLHtPOxJz78btiU1I1DBlN5U=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LCtqvKq1C7Pyz8fRaTY3CHpSAXYhS0/6iMwf2NeJpz4z/EIUTP96xJYRIGrQLz27g
	 XEfz1mmcS/DCwar2BMHSECPWbIQbeLofGPBTtVqrkp7+9LmYJuPcMr06Cgge1LIdqe
	 ykIBrRSz0LbQGREGQtimgAO5fr51059jwTdwqxDPmB6st3IWH3ar00HmU8pu73AMU6
	 +zTLSAshMNopBoDc4JFQJF4cl79sERMRriR795Dd/e5W85iY1hmf7qPa42famA5fcl
	 +1mXVcJ2agEBU/+KFKiwM0nqRXMSOxPiSlt84L9KP+PfEgUCYAIL1YHrEbWZJTzlwf
	 L1MChBfI69LEw==
Date: Sun, 26 Jul 2026 13:41:29 +0000
To: linux-doc@vger.kernel.org
From: Xavier Claude <contact@xavierclaude.be>
Cc: Xavier Claude <contact@xavierclaude.be>
Subject: [PATCH] docs: add example for psi info
Message-ID: <20260726134037.24412-1-contact@xavierclaude.be>
Feedback-ID: 36077759:user:proton
X-Pm-Message-ID: e4c96e58fccb093635ce56243950ba72671f52a6
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Provide an non zero example with explanation of the values.

Signed-off-by: Xavier Claude <contact@xavierclaude.be>
---
 Documentation/accounting/psi.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/ps=
i.rst
index d455db3e5808..dadab65f872d 100644
--- a/Documentation/accounting/psi.rst
+++ b/Documentation/accounting/psi.rst
@@ -64,6 +64,20 @@ as well as medium and long term trends. The total absolu=
te stall time
 spikes which wouldn't necessarily make a dent in the time averages,
 or to average trends over custom time frames.
=20
+For example, the following output::
+
+=09some avg10=3D7.52 avg60=3D12.59 avg300=3D24.82 total=3D2128219913967
+=09full avg10=3D5.70 avg60=3D10.56 avg300=3D22.40 total=3D2014527537356
+
+This means that for the last 10 seconds, 5.7% of the time (so 0.5
+seconds) was lost on cpu cycles because all the running processes where
+waiting on the resource. On the same period, some tasks where not
+schedulable during 7.5% of the time (so 750ms) because they were waiting
+on the resource. But for a longer period of 300 seconds, we see that
+more than 20% of the time (so 60 seconds) is wasted due to resource
+contention. Moreover, since the total time wasted because tasks were
+waiting on the resource is 2014527.5 seconds.
+
 Monitoring for pressure thresholds
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
--=20
2.55.0


