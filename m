Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916570;
	b=VST6SkL+TWH7CeQvPN0GgYcM4rXnEen9BFlv0gEJgWYL6kIISt2UsXcRNx7rFDuSJc/5
	 EB4RhcFhRMs3/xalEXCH8vr23BwUewruJeHK3femlXcC4YDV5pWB4dyv9EishRJ0QqeJm
	 oFcU3bmqm/HZLg0uMNrfwBeCWgKSls524KfYT6y+xgc02Y0bSLsKB/RL7v7262lTty3dH
	 JpF4JW0PEo2UkxVO/QqfViTUEDmVCpWnAsmMM5aj5h0l4104k3CXNx3taYEZXJiuBgB/r
	 4A9lHZZF7V569XTLdxtcYfFsFBIaUGz/znznUMC7FFQDaGRsuHq+lY6naGutypx3WjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916570;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=k6abX047nWBRSLEufEEWfrvLsciS/oB23bTWhNF+5ZU=;
	b=KQXkEmCNpAYd3Neag11hEfhDFHeuR+RpiNqHpIdtW6KhceYOm7o02CWjKo3nuqepJvaI
	 5JeyuYC8lGFP3vK2DDX4DcJetrRJHdRwPZZz4bS63M/BqfYRRAWcsTOH1tMxWCqBqaK68
	 wm3FFG+VXE0FhyuKTyTx4QXWAN80NuqpM+oXjXF6TvfzaorYioaFBQINFwOKw9Xpz2NPV
	 qfTyFodzT85bXZQIfgDwjfxCXQpXyLoPV5V0h+GPYiWJQ8CoC1lV5S1jbKIGhcZocpDnk
	 gm//bmh36sTpYNyhLYgbS4t1dYCushmndB8qym+pu8kgL4ZeuZpgUExFb4BYZIzYFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VM4ehGYl;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D9606A323
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VM4ehGYl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=k6
	abX047nWBRSLEufEEWfrvLsciS/oB23bTWhNF+5ZU=; b=VM4ehGYljQu+faXbSV
	JMSYxRdSbcY+wg2eognTAzJEJyOlhw+FzKUL4hkYGF2IlPRku0138cAje61TWUcT
	fgxnbkAO/C4q4ksz24gyBomlbzOGmKTWxTs8gu2jtDYNS+NDX2h7dzqSW2gKBf+K
	NIBamJbkkW5nC6W2mVJtsG1VY=
Received: from peter-desktop.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnj9KxQPxqdB4NDQ--.49363S2;
	Tue, 17 Nov 2026 19:55:30 +0800 (CST)
From: YikunWei <YikunWei@126.com>
To: alexs@kernel.org
Cc: si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yikun Wei <YikunWei@126.com>
Subject: [PATCH v2 0/4] docs/zh_CN: Add four process translations
Date: Tue, 17 Nov 2026 19:55:21 +0800
Message-ID: <20261117115527.27937-1-YikunWei@126.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:_____wDnj9KxQPxqdB4NDQ--.49363S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4ktF4DWw4DCFyfGw1Utrb_yoW8Wr45pF
	W8KF93Xa1kC3Wak3yxGay8JF1fA3W8Ga98tr1aqw1fJrs5J3WftrW3Kryvka4fGr10vas8
	Xr4FkrWUWw1xAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuyI8UUUUU=
X-CM-SenderInfo: p1ln30xzhlqiyswou0bp/xtbBqBIWGGr8QLLiSAAA36

From: Yikun Wei <YikunWei@126.com>

Changes in v2:
- Reformat contribution-maturity-model.rst to align line lengths with the
  English source and restore the link to the 2021 Maintainers' Summit
  discussion, as pointed out by Dongliang Mu.
- Send all four translations as a single patchset instead of separate
  patches, since they share dependent changes to the process index.rst.

This series adds Chinese translations for four documents under
Documentation/process/: the contribution maturity model, deprecated
interfaces, backporting, and ioctl pitfalls. Index entries are updated
accordingly.

Yikun Wei (4):
  docs/zh_CN: Add contribution maturity model translation
  docs/zh_CN: Add deprecated translation
  docs/zh_CN: Add backporting translation
  docs/zh_CN: Add botching-up-ioctls translation

 .../zh_CN/process/backporting.rst             | 464 ++++++++++++++++++
 .../zh_CN/process/botching-up-ioctls.rst      | 186 +++++++
 .../process/contribution-maturity-model.rst   |  83 ++++
 .../translations/zh_CN/process/deprecated.rst | 361 ++++++++++++++
 .../translations/zh_CN/process/index.rst      |   8 +-
 5 files changed, 1098 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/backporting.rst
 create mode 100644 Documentation/translations/zh_CN/process/botching-up-ioctls.rst
 create mode 100644 Documentation/translations/zh_CN/process/contribution-maturity-model.rst
 create mode 100644 Documentation/translations/zh_CN/process/deprecated.rst

-- 
2.43.0

