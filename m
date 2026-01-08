Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EDF39FCE
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 01:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767836424; cv=none; b=ZapFoTCdXfmo0Y0iNe72EfEfrU5BvRONIyQ97cFXGoIP7SzrqONUrk/3dynnbm82y6mbusfu77r2V5PA493KZdL1fnutLceLeer5u0OyvPif2T5MVLwugP3oqMQO2PxahHc8+UtIVADQO4j9oSzc2wtkGtf8W9CMIxfSAi9RypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767836424; c=relaxed/simple;
	bh=8XZb8+FCV0CLht6+XWW+dP+aITDhaFT0okOzd6JUXkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/WK22kOotZKQ7tLPsqiE7Incg2ICNNc2EQQYct+pr0BAda+6rQVJ1C/lhdgPhyY241UC//k5vGf8tV9yluhI3InkDgtUaPUmf1MAwKsu5vjtPtygJ2uAZflWTuF2AdpRfV0521AorX/gsFfBz+COfh66NtyXGuHvy+VRFwZ3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m49QRmgn; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m49QRmgn"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-34c868b197eso2522235a91.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 17:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767836421; x=1768441221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b9aAof999ugndOjzkeZa155skCNKc6c2TFi3UeFMM8=;
        b=m49QRmgno3zSKf/vOzQLumFIdlR38AayVjGrFhFC6CqWMLihBP7TR0F6p3xozjTnVI
         ITL+BZjHo6zGn5MxyCKFIJlqWBW5mEa1SZZvdKiwnGUwL852jRmPAn3L3eqWJ9d8Ws8z
         60uOMQutB9QkgRNVPyqhiMEqG9RBJCa0+jFlD8lq0uxbbCVyARxMowuQIMX/hX9r/EKO
         nFD6ml2PAT307+SuKKq/FkDHaBUSW+DDF4vjjFOR593SXEum41Pf+/TpTxUuMMwWBCzU
         TXclCfNPdWnlbRtWg3gTmI5q1xdZZimAKdcG1eWCidPXqTBObHUKBHgnuXDixOot1XDE
         NXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767836421; x=1768441221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8b9aAof999ugndOjzkeZa155skCNKc6c2TFi3UeFMM8=;
        b=lu+uJeikw9A08RqShjY49yd1a5L3GL6AuhRupMeDlSgnkoeZpvqCFl8cDh5XB8bRvg
         YBhFrxtiEoRLJhTQCVNC7TqajF1E3cxNjPpJL7O+vnRrJKIXFYWh+Y0Z8WiliV0VhH2Z
         YO80bZKi2/fvmn773dE+ogcEEQOyz8LiNoxAcyjYL4sBB8FjzbTT2h1rO/m0P2mZXX/T
         +BwZ8ythTRfZ2IZjy/ds5rpC9umhy24kES+V4+VWs8mkFuZ/dyWKW2wZCQq+2+CmYXYp
         MKgZ9RgG0g2lsqddl0NOq0Gi/jXKcuxgs+Hd2KwKFpsLtJ3cu5VOGN6GmIC3rRr+dAAO
         hesw==
X-Forwarded-Encrypted: i=1; AJvYcCV7fAT3DHyUiKy/9LSCC8Tw2AwV+0wRmgfKQRyi//71fvcaQH3aAUMPM5+5XFZpRcGrbzR2kHKLeBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjM/I/2jPURRPOG8JvZjM9+gS1ISneA6sW+77jXZ9TAaxN/P7
	phUwbuy5+supjCYk76958J3Cdncmzfp5XEQLtDURniR3WHjqdzGGroPO
X-Gm-Gg: AY/fxX69qA9JdggcfrHQ0bMGx8H+n0C9+LhI2UASHNEBk/dnwwpSSXGGn5TFpP0fCGa
	Z/tlrudZudkbKjyiq+nsONyvfcWLjWw1Ve45ezAenFZOCku5HivbmcYF1+KlsUueNtZh0bzaCL9
	mV9TureJeLSyQ+TWpNtPrfwQQSt9CN5Q9q2D0G0fXJw/NXs682F+3Rlmwb/cXZ3P0PRUqT7+rOI
	skvUQwCo5RgZ130k7vcPNM161y30NyFtZH3O+mtPpDwB0cKX/TF9qNpIbAQ7/6O8PEeBR7i3aMx
	rdxT9MqYoMnO7q5hD3b8SqMY/RLQM3SVpoAXoJouflwwNMHZEYzn/XqZ97kP5OrQ+Fh3ChWRhJ7
	RAlnNHDT9HIogLUuzF+a9y+UVrtKAWKfZPdTF98HUee/uQrovX4tlTrxj5alotxrk7YAjhL2TDs
	Rt0KXDIAJ0kBs=
X-Google-Smtp-Source: AGHT+IHYmhgeDUl9GrF+3dcPYhxi46eYlH7ZXTMLgsZsmxbCTqH6jCsme74eIUdlyp+06gCdljSWoQ==
X-Received: by 2002:a17:90b:3905:b0:340:776d:f4ca with SMTP id 98e67ed59e1d1-34f68c621c8mr4482242a91.26.1767836421034;
        Wed, 07 Jan 2026 17:40:21 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6af4e14asm1398806a91.1.2026.01.07.17.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 17:40:13 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id BAC8642DC3C2; Thu, 08 Jan 2026 08:40:08 +0700 (WIB)
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
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 1/2] Documentation: tracing: Add toctree entry for PCI tracepoint
Date: Thu,  8 Jan 2026 08:39:55 +0700
Message-ID: <20260108013956.14351-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108013956.14351-1-bagasdotme@gmail.com>
References: <20260108013956.14351-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=8XZb8+FCV0CLht6+XWW+dP+aITDhaFT0okOzd6JUXkY=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJnxnHvNgozu7irRi9x3l9NaXJTZluP3AfOHEZq3OYPEw w8Wf1DuKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwESqvzAyPHaN0J53pqm9WilD 0GeVuW+3UsyGb7KBBkEGxdGRZa+WM/xT01gfWrO1NKH1emmBy5L8flbxL+fFF9yr/9m40aK2qoU RAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Sphinx reports missing toctree entry htmldocs warning:

Documentation/trace/events-pci.rst: WARNING: document isn't included in any toctree [toc.not_included]

Fix it by adding the entry for PCI tracepoint documentation.

Fixes: d0eb853678a21b ("Documentation: tracing: Add PCI tracepoint documentation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20260105160000.0368ec8d@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index b4a429dc4f7ad6..0a40bfabcf19bf 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -54,6 +54,7 @@ applications.
    events-power
    events-nmi
    events-msr
+   events-pci
    boottime-trace
    histogram
    histogram-design
-- 
An old man doll... just what I always wanted! - Clara

