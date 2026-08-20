Received: from gw.d.sender-sib.com (gw.d.sender-sib.com [77.32.148.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365D1361974
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215082; cv=none; b=nh09ngEXbyKEU4tGLoluPrwfUW5qQlU9Z0SOIdTpxe3lcl15LnhVJM4UMtsgLjkr1SaMip+EByggAU1bkZvuDbTOYjtyZv4xJ8nEluXwn0+sJZ4luV6nXO5ykvPI91VVy5ASCQxUP0IU0z3OxpFY2V23sIM3LCdwS9o/1BUJTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215082; c=relaxed/simple;
	bh=WkWCfdofhBa/xyWGidhvVSgREVFol2bfvzmw4/hCVKY=;
	h=Message-Id:Subject:From:To:Date:Cc:Mime-Version; b=c3RbeCxw0XLN282i194yY9NJbVGe+ceaH1AmAj5k79PzUX2BycQoIz/lldXEJnW5nuNDUq/9+Pxta3dxOayAG2A8tvSFHGbiWr9UoKCSu9Lqa5gbwDCSk9WDDBUPEMx1CGGulqeuTSQnOn8dyzhNMsiGw2Z3/uWPqYDJc45FPcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=gw.d.sender-sib.com; dkim=pass (1024-bit key) header.d=brevosend.com header.i=@brevosend.com header.b=ktOIy3PP; arc=none smtp.client-ip=77.32.148.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gw.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brevosend.com header.i=@brevosend.com header.b="ktOIy3PP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brevosend.com;
 q=dns/txt; s=mail; bh=kn7srHoXkaZsxngVEFiL/AUftNzcyOW4mWabfcraxfs=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=ktOIy3PPJpDJZEngJwCRm96sBzDOPUDknj1dHjiMOxdqAz9M56J5/C2TlVEnnrqUiGFMPCP2CGuR
        ukNZDHXde3r1BERrNw6GtE9ebHzpfrN2K6MKK2wpkF+Lso9U8EJ91fW0j8iDV3KQkdDYlh/QoXec
        Lajup69mraIJ6T7EGJk=
Message-Id: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Origin-messageId: <20260820083646.11383-1-nicholas.johnson-opensource@outlook.com.au>
Feedback-ID: 77.32.148.23:11519862_-1:11519862:Sendinblue
X-Mailin-EID: NDgxMTkzNjAyfmxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYwODIwMDgzNjQ2LjExMzgzLTEtbmljaG9sYXMuam9obnNvbi1vcGVuc291cmNlQG91dGxvb2suY29tLmF1Pn5ndy5kLnNlbmRlci1zaWIuY29t
Subject: [RFC PATCH 0/1] ALSA: add PreSonus Quantum PCI driver
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "Nicholas Johnson" <nicholas.johnson-opensource@outlook.com.au>
X-CSA-Complaints: csa-complaints@eco.de
To: "Jaroslav Kysela" <perex@perex.cz>,"Takashi Iwai" <tiwai@suse.com>
Date: Thu, 20 Aug 2026 16:36:45 +0800
X-sib-id: HpfoOkg4-GhoysC595l1UUolnoGE1WGaoCOLehz6jyJgK2ATT_b3e-5OPH2EaCPwPs4TLnv7SfBIujAiCMY1iWo5heiLxcaTRyaMtKor-3ZkwP_a-44F-YsDUQAjJWiPyhr0AmIXDmOKRLASdZ30st-MN5l18K2rP4AhP4yzgMS19n34t5vazQ
Cc: "Jonathan Corbet" <corbet@lwn.net>,  "Shuah Khan" <skhan@linuxfoundation.org>,  <linux-sound@vger.kernel.org>,  <linux-doc@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "Nicholas Johnson" <nicholas.johnson-opensource@outlook.com.au>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi all,

This RFC series adds an ALSA PCI driver for PreSonus Quantum PCIe/Thunderbo=
lt
audio interfaces.

This project is independent and is not affiliated with PreSonus or Fender.

The driver provides playback, capture, raw MIDI, sample-rate control,
clock-source control, XRUN reporting, and surprise-removal handling. It
targets the Quantum PCI family and currently has verified support for the
Quantum 2626.

The implementation keeps the hardware path direct and multichannel, with
the aim of being small, reviewable, and suitable for eventual upstreaming.

I want to thank my best friend, Ju Ern, for lending me the machine used to
develop the driver, and the Asahi Linux project for m1n1 and the tooling
that made the hardware tracing and analysis possible.

Only the verified 2626 device ID is matched by the driver at present.

I am sending this as RFC to gather review and testing before asking for
merge. I would especially appreciate feedback on ALSA integration, device
enumeration, runtime PM/latency handling, and upstream expectations for the
driver.

Thanks,
Nicholas Johnson

Nicholas Johnson (1):
  ALSA: pci: add PreSonus Quantum PCI driver

 Documentation/sound/cards/index.rst           |    1 +
 .../sound/cards/presonus-quantum.rst          |  120 ++
 MAINTAINERS                                   |    6 +
 sound/pci/Kconfig                             |    2 +
 sound/pci/Makefile                            |    1 +
 sound/pci/quantum/Kconfig                     |   19 +
 sound/pci/quantum/Makefile                    |    6 +
 sound/pci/quantum/quantum.h                   |  394 ++++++
 sound/pci/quantum/quantum_dma.c               |  853 ++++++++++++
 sound/pci/quantum/quantum_main.c              | 1148 +++++++++++++++++
 sound/pci/quantum/quantum_midi.c              |  180 +++
 sound/pci/quantum/quantum_mixer.c             |  214 +++
 sound/pci/quantum/quantum_pcm.c               |  609 +++++++++
 sound/pci/quantum/quantum_regs.h              |   52 +
 sound/pci/quantum/quantum_tci.c               |  486 +++++++
 15 files changed, 4091 insertions(+)
 create mode 100644 Documentation/sound/cards/presonus-quantum.rst
 create mode 100644 sound/pci/quantum/Kconfig
 create mode 100644 sound/pci/quantum/Makefile
 create mode 100644 sound/pci/quantum/quantum.h
 create mode 100644 sound/pci/quantum/quantum_dma.c
 create mode 100644 sound/pci/quantum/quantum_main.c
 create mode 100644 sound/pci/quantum/quantum_midi.c
 create mode 100644 sound/pci/quantum/quantum_mixer.c
 create mode 100644 sound/pci/quantum/quantum_pcm.c
 create mode 100644 sound/pci/quantum/quantum_regs.h
 create mode 100644 sound/pci/quantum/quantum_tci.c

--=20
2.50.1 (Apple Git-155)


