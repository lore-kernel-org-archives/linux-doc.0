Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537B01DDC37
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767836427; cv=none; b=SagVqwpTZbXy2liJUCnFPksAw7uF/nqJ5g/zf4Kvi8I3mLspzg1bzlxFzFDs06H7PhybBsU+Q4r7Nx4NRTTGyuauaKp4O+HszIyHKXrx3hPm4k6ggQpTAJF6GZPMrzll1oKxStZsWxBZfw9pciYr9xZJWfk5h+Tv8O8CKYH5wcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767836427; c=relaxed/simple;
	bh=vuu8rpEp3S06Oc8G0sBhUEsm2mtpfc3cgNKFFNrgqa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=irnTsGBzOS0fx0s4p9i3PdOs+/a09IbpWxP6NZ1g/jFWpBLXEgXfiNAUZGefk2fiB0HhrPImLi/ZnvAiimPCE3HlI0NVn06tLx2FDdGfvrPJJ8Qgg8p3Wu7YN6Zxi9G0myXpjvnyEIn/HfWZTm/HGqO0dkA9U6CFVNUOuN351DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYfSB+bQ; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYfSB+bQ"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso1656262a12.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 17:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767836425; x=1768441225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5mcvgrMOXwrLkHuTPd2Da7/Tt+HGO4BUi5SFbBwRTY=;
        b=HYfSB+bQ8OlUXivwWU4aIVk5GX4luIVrG+cVkH1jmKPigORcnIHZSl7WdEcPtd5+KG
         djEVP3z6pLGxcL9ZDPzXfgak6+oTfVe9w8wDdcaU7dAwM1s5JEBgxAn872J9Eyvzy9qa
         y/8sZQdhVvlnA/K0veWxIHnY0liYNFbFcdH/Bm+y13c2mSjK/JuX/woBgoK/jpnMafP9
         Y0EqcpASuiWlamfvO4JtGJM0j1HIc98jCeloa38DqssGlYSrikV8E7OAZJGFVyhbgK6g
         yVCWP7JNRUDHTKTyRS8iDNNkMJyRbf3D3LVUf3X0y5Fc94WgFW/uEP50QKrjjFlQqq+V
         K1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767836425; x=1768441225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5mcvgrMOXwrLkHuTPd2Da7/Tt+HGO4BUi5SFbBwRTY=;
        b=hNwzCoS9QZaMXNZpHpFpJgZWJpdajSyRxhda+ogIpwipNac5Rbfmc5k5XEKlIZnj69
         7pfgvyBkfnCU/UqZo6n2rAcatcih+A0WMtEBRFGQxRrCEHbZKvOCLQ31xm04s5ZpX5sX
         Elm188JubaaeIKGJqo/77yeGg3NO3t/0+PnJD6DgTimBMYaOh9YHQF2zjh6Ps+JIGS8A
         9B+rv7p3zecHLkrNCSCmmf/KW24B986TDkhOxCvO23x0aRVKD5mz53cX2HBLnbvXYx+O
         s6cRtqm2knKzmfmY90eKTJNauDkWFAPcO7KHDdmdmdBFNS0AeCameDs47gRXosEFLFYx
         pO3w==
X-Forwarded-Encrypted: i=1; AJvYcCXZe0l21CsxrhMkSGHyWi90iobBLbSnZ+2YQVgrmoE8nc79LTFJjolI6/hgvn0fkZe4yki0ui2Wfk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1Kd9JTiPUQJY7f4xMhSgOwYHocrL9y63iK2OIuKwViKacntk
	BrI0Cdbe8YNLmV+PwE1WQpyP2RuM1di7zrubIJ/y1NU5U+gYKXmsji+G
X-Gm-Gg: AY/fxX4yI0BC+PGNAzkXPTPS8EqgYtm5oHcWw8TbgFJA0vZcefOJLvGAYxJWj24UUSM
	IXL/sPz4Ag/uxVqsvukA6Wu7JWjDgVxtuHkcysQqLYSmPlPL6Bo0oNJBJS7sV5l5SCEtqXBcq+X
	VVvktRnQ8MQS/pdGCusS5dUqIv0uqMOatAM5hbwuxwyCicd0w3ekgb4rTHosqPTSdEHCfoZhlLF
	fPF+rkIYhO9v9COpy8fKriL7ALLhAMTowuAxxMbPn3prxTyQz0aXHSX02ykQ3ah7Ha/f91+BX+a
	RKYYxSqXE5Ota5sKHRgRc9clVEbYBNsWVQLAQYVd7PITM6JFGh8CCyAF/tmrFY16qusWIaWbXjD
	Zpp3LDjzfUAZNrIXKw6XGYaQP/nudkUXdRw1TgvBCN4sysgysu16mhVn6wt6L9vSmmKYeL6SLhB
	H1jFc58D391b0=
X-Google-Smtp-Source: AGHT+IHaTaN3lZQ3gqStmgI90rwkf+/u4N8abTIKk8/rXVaIjJMWuLcUysfTvfTFgqwmviThGfHaVg==
X-Received: by 2002:a17:903:2ed0:b0:2a3:bf9d:9399 with SMTP id d9443c01a7336-2a3ee48ada7mr38032545ad.35.1767836425529;
        Wed, 07 Jan 2026 17:40:25 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm5970522a91.3.2026.01.07.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 17:40:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 890EF42805C9; Thu, 08 Jan 2026 08:40:08 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] PCI tracepoint documentation fixes
Date: Thu,  8 Jan 2026 08:39:54 +0700
Message-ID: <20260108013956.14351-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=649; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=vuu8rpEp3S06Oc8G0sBhUEsm2mtpfc3cgNKFFNrgqa8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJnxnDssn7T6t/GnLni365aM/W725UJe9TUvyzea6Cxc9 rBp7UbXjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzEJJThf5pY0vn/s/5nXklV Uf9dLDDnWPPpWf9idjktihNPTFDd68zwT+th7CEzjy039pzeMWe3nk/9keRQE+GSrHVsMivzNvS zcQIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are two fixes for htmldocs warnings on PCI tracepoint docs as reported in
linux-next [1]. The shortlog below should be self-explanatory.

Enjoy!

[1]: https://lore.kernel.org/linux-next/20260105160000.0368ec8d@canb.auug.org.au/

Bagas Sanjaya (2):
  Documentation: tracing: Add toctree entry for PCI tracepoint
  Documentation: tracing: Wrap PCI tracepoint examples

 Documentation/trace/events-pci.rst | 4 ++--
 Documentation/trace/index.rst      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 29a77b4897f1a0f40209bee929129d4c3f9c7a4b
-- 
An old man doll... just what I always wanted! - Clara

