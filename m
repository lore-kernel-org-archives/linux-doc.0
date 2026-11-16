Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867986;
	b=CUXBI3BhyPlVYhGVyWINUajVYyNde+biZPk71+1KmUbzII6vFEcaSlfLCvnmTZ7tb3mG
	 U53xzTbzxFvfERHx4AuGlxiPWxO7Udrjn3USL+aYsPXpHCo91+4HrdWuF+IE4R9xLzdTJ
	 qTfDiZKXRos3ucF4gZHxOxK/HJGTmAaUXB2+IofJsxnc+94kykrIIuR0lwBK2nzKB8owo
	 tNsYuvW7Ow16BGl/BMGS1Dhkw70ss9T6QooIKnK5utCztscwjGhHBA1hpLq++bTORHaYM
	 bMmJk8rhk67EdQiPOPMjNdChZhk1FzG8cjMBRmLscdabBBczqoa+rmCrSQsbA/u8f/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867986;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
	b=l5eNwJrYl1RYgJXj3n9nrOEKNAOXCFSOIT+bxPPRJGCnECdNN2SSqNx1TB5KMThdulRL
	 gGCzhK+AvIdBtcb1firRVZvxHb2QzNKgqbpsFRypx3wxw25TJZo4iHToV+LyaM5EaJDmM
	 3caVJyeo8bnqb0/eS8eNQhahHGx/JIgQFtR7yaC3WZsTHA8vI2RoGDXVCDEuSp72I+Jhk
	 tR3XAZgRz07kCj+qhIL4oHImaxGKztb9gknOs1t5J9+vmfefjvDZvOkx4qmbBYqw8jk8S
	 thQELTtcHGLiruZL5813AckzbLi1L3EYZInmqf6niFmeWi3Oa30oFYQaqzFm//tSfFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amoT01zp;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752C606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2752C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=amoT01zp
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91ec2d42231so55578276d6.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867985; x=1795472785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=nPPSmOAXAQJ7UqFMIqBDsB+wLpsjpaDpCBsFlxh8I0mBj3q0TDiLF0fDdSxn3nBRPF
         9nTkUUhJidWFSJEuivs/namqoGs1lEx03B5aOVDqGgRaX5+WNMn7fuWfZRu8nvpkGL6q
         CjWMPlLFoIytrRNa7oggJcrFuUWL/NnFg8S+GLlj0K07euRJBAIt5vO9iDG4XCPA+DqM
         h46bkfT6vqf/GSbv8xAU+Cmu0cbBTfUSuCxQvmPynC5vWHmFJzWq46iRGgzsRKq5P7gg
         kwgdATxPqMUwYnxrD4RYP/78QSVDV0YUntQZAJTuykz7Kb0IlAYho6BD/S79+qIJjwWx
         cUNQ==
X-Forwarded-Encrypted: i=1; AL+hErGg/l8e+r5S6UoBUvKu5Zgkc4Df9G3ksE0WildCQ9xplCrpC+zuLe8Z+fpepyPCDJOzxXU306vfeqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aUQ/wMg23lWIzFNfqC0DtTqWDQOkNl32awZUrY8OfM/2ZAG0M
	E6aE8Lrf/mMMw4JO8d/a6JtaA8XYKTrc+i5UB1CFfrvvjY0cqMsKqmaWPyj5h4qe8znKDxnmwfr
	86MOzfjBY65rIvJXtDBKK3AV+DG/jTuI7CzLxvat0jdlQnF+Pqi4FE/9acEG9I9oJgFjyaM35ay
	IwA9hwZrq1yeW6l5CQKCsHuTztBk9rpn7anDfuBA9UcQKyKn3bRnu3xoIzyGmBa+sZedhBjwKef
	+IP410GL+BfulfvEPqV
X-Gm-Gg: AYBFou2HW3gxWExRwF4TS14hN65Pgd6si7WgSIu+AWNuTT9li7Gy3Wv9qsFR9wd7WNf
	PNUj38g8WjJlKzyq53xvk2f8fsElQrNNoSpWr6c8u84yLLOqkwFXSjifMPhY9lxXAgAm2Bxpa1v
	J85muH/QMGVp9InDU38+ClmO74gsIiTfUUU2I7oUsX66eMKVJY7TAeVZogC4HnG6ZE5XxNrPV8d
	ji/QxBH1ny4AyDOUsSKuvvE6VjjSWnMs6LkeWcgpO1+m0NKg56YHZ9pk+D4UyKdIbCU+yCDhdfL
	D4D3CBEhETb1YFKNvX1p+u+npMqx/JqCemAb0Ceg+IcdC7voNkje3aqh36udqkkGrRpCTjlngDL
	TfmvXzQdnmXVkPQV+f3fgFmJLnd39bOsNK+DmiJAAkskDS5/IaUxVwXh5CIFw2l+KrvL7170gJA
	I2MJ7AOvidYrqtaDvI+BqiRpajIO+vRDk6JvLJu2RT
X-Received: by 2002:a05:6214:6290:20b0:91e:92b0:5828 with SMTP id 6a1803df08f44-91f24194abamr144278536d6.20.1794867985064;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91f23b5ff98sm1554086d6.0.2026.11.16.14.26.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36ecd5db581so4942729eec.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867984; x=1795472784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SslE8qgO26XXBHOVGhvKn10x5qVEd0Ps4LIMSMCbA4=;
        b=amoT01zpW1QiyWV7iomzHY4VI3soQ9GJqEyg0fwZrUGc+2SAmFe7WWlkbH2pUYrzJV
         S23qsAOVfZRSxhqClj8gXxMtFBxcClMDWLGRSEevbZyVVCXzHgv+YHrk+cifXiBbpOij
         Jmm5hZM5UwAnBukIUdjljQrf5Gsy2oa9e9fcg=
X-Forwarded-Encrypted: i=1; AL+hErHPVSyLOMlEcnFcs5lFtCJCZx5LLZdohF1uciWH0lAFeIF7qEb+DnwaDhYyY8lg1cag7YskH1tg/bM=@vger.kernel.org
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977682eec.41.1794867983554;
        Mon, 16 Nov 2026 14:26:23 -0800 (PST)
X-Received: by 2002:a05:7300:f797:b0:378:d42c:5064 with SMTP id 5a478bee46e88-379676f55ecmr11977651eec.41.1794867982905;
        Mon, 16 Nov 2026 14:26:22 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:21 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 0/9] net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
Date: Mon, 16 Nov 2026 14:25:10 -0800
Message-ID: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for the Broadcom Northstar IPv4 TCP/UDP
NAT flowtable hardware called Flow Accelerator (FA). There is a second
generation called FA+/FA2 which will be added on top later on since it
builds upon the custom Broadcom tag.

Florian Fainelli (9):
  net: ethernet: bgmac: validate RX length against the DMA packet
    capacity
  netfilter: flowtable: reject non-host IPv4 packets before lookup
  netfilter: flowtable: retain offload ownership until deletion
    completes
  dt-bindings: net: describe the Northstar flow accelerator
  net: dsa: add Broadcom FA metadata and IPv4 exception paths
  net: flow_offload: allow drivers to validate and invalidate cached
    paths
  net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload
  net: add KUnit coverage for FA and flowtable path validation
  docs: net: document Northstar FA setup and NAT qualification

 .../bindings/net/brcm,bcm4708-fa.yaml         |   45 +
 .../bindings/net/brcm,bcm5301x-gmac.yaml      |   27 +
 .../ethernet/broadcom/bcm-ns-fa.rst           |  507 +++++
 .../device_drivers/ethernet/index.rst         |    1 +
 Documentation/networking/nf_flowtable.rst     |   13 +
 MAINTAINERS                                   |    8 +
 drivers/net/dsa/b53/Kconfig                   |   12 +
 drivers/net/dsa/b53/b53_common.c              |  427 +++-
 drivers/net/dsa/b53/b53_fa_test.c             |  102 +
 drivers/net/dsa/b53/b53_priv.h                |    6 +
 drivers/net/dsa/b53/b53_regs.h                |   39 +
 drivers/net/ethernet/broadcom/.kunitconfig    |   21 +
 drivers/net/ethernet/broadcom/Kconfig         |   35 +
 drivers/net/ethernet/broadcom/Makefile        |    1 +
 .../net/ethernet/broadcom/bcm-ns-fa-test.c    |  661 ++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.c     | 1901 +++++++++++++++++
 drivers/net/ethernet/broadcom/bcm-ns-fa.h     |   30 +
 drivers/net/ethernet/broadcom/bgmac-bcma.c    |    5 +
 drivers/net/ethernet/broadcom/bgmac.c         |   41 +-
 drivers/net/ethernet/broadcom/bgmac.h         |    2 +
 include/linux/dsa/brcm.h                      |   19 +
 include/net/dsa.h                             |    2 +
 include/net/flow_offload.h                    |   12 +
 include/net/netfilter/nf_flow_table.h         |    8 +-
 net/dsa/Kconfig                               |   20 +
 net/dsa/tag_brcm.c                            |  120 +-
 net/dsa/tag_brcm_test.c                       |  199 ++
 net/netfilter/Kconfig                         |   10 +
 net/netfilter/nf_flow_table_core.c            |   21 +-
 net/netfilter/nf_flow_table_core_test.c       |  171 ++
 net/netfilter/nf_flow_table_ip.c              |    4 +
 net/netfilter/nf_flow_table_offload.c         |   62 +
 net/netfilter/nf_flow_table_offload_test.c    |  129 ++
 net/netfilter/nft_flow_offload.c              |    6 +-
 .../kunit/configs/nf_flow_table.config        |    9 +
 35 files changed, 4651 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm4708-fa.yaml
 create mode 100644 Documentation/devicetree/bindings/net/brcm,bcm5301x-gmac.yaml
 create mode 100644 Documentation/networking/device_drivers/ethernet/broadcom/bcm-ns-fa.rst
 create mode 100644 drivers/net/dsa/b53/b53_fa_test.c
 create mode 100644 drivers/net/ethernet/broadcom/.kunitconfig
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa-test.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.c
 create mode 100644 drivers/net/ethernet/broadcom/bcm-ns-fa.h
 create mode 100644 net/dsa/tag_brcm_test.c
 create mode 100644 net/netfilter/nf_flow_table_core_test.c
 create mode 100644 net/netfilter/nf_flow_table_offload_test.c
 create mode 100644 tools/testing/kunit/configs/nf_flow_table.config

-- 
2.53.0

