Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8A2D6E54
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001345; cv=none; b=lQrSgKfZlDpsdHOAeIHpguot0HMIdDE9NGg4nk/5P+xOWynL618QFvlghc3S6rba822iXoo0Ix758tOsZangd5mHNqXjVRFB92nSZW0pxPf++MWCfTWgnrCcYVZ9wBoruy3sFxzi+EhD2+bnQyoVp3p0MVfwudhdlASygjt15kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001345; c=relaxed/simple;
	bh=IM0I2qOotzNuT503Elh5AFKW881D8AA0LxYsvx+eLpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rua7n1OYnP7/+UCQQA9fitZZtTe/Z2b4vHzc7N6mcvTPihhYvEk4VgLv4JtDujJXfpcEsFQiAFtxsqfBN7SwEh4U+iVIUX6N7mx+8W4+sKCzXYzF9DUdFG/RGGUbAgnDJl5Dgfvg08MllAT+r+WX5tkKvnbHsWodaNmCoM3GJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsAoY9//; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsAoY9//"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b54abd46747so3525549a12.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 22:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001343; x=1758606143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DPf9GY80lnpMXx7381cdrBChaqI4wIuCjM7QR2i8T8=;
        b=WsAoY9//wbPwPNHGeS1FGPPUsNOsm01pp7uBWqFx3DIyxzZMoXWLsKZMHnpor4buPO
         3HntoLR6D0XKI2PBAaYojE0kx9mQfDWEFLoi1cT4CSo8fmlw3tYVOK2LK93bngblZWQS
         puVBY89WVT3EBa4ZsImZAlqswCatN+B4aSpijA8MMYiQhOgzitqB6HeRFmphztkYRttq
         cB3LxU38wq91G7dx3InvbXV/swPCMe1+oIogRA76YObxyc30FOwhv7vMrC5ZhR4hZ0lb
         caH/qoHRWncV3rjhYWE2e7qkg2wji3oibap54Vi8FeJ3DzNxbRfwqyaa3aR1M3SChQqp
         qKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001343; x=1758606143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DPf9GY80lnpMXx7381cdrBChaqI4wIuCjM7QR2i8T8=;
        b=BVbpmZ7xFQNaaZZKy5Y8M6y3BuoKI1u6xxhhvQe12Yjhdr+E5rcfYjXQfg7elBm95z
         QNmekG6e5I7424Pe74TlwaBjVt8t9YDLmZwm78JDglqaZ5ZvuWl0iodjXpIPNLLdvBFN
         33V/zFT4w00ynhv4bkZsY8akUgzmWOkLWfohNXw9MtQGwiOFFYr2YPNsmbEpNyYqzs0g
         fDGXwH9CWjpYhoTWoXV+es8b8Wsf8SRzSZMxrv0UnX9QKNfBIglbxlg5dtpHjRDCTml5
         f9qqtYZ++610PIYaTEfCWL+saTTdSe71WyCNA0DIDgwPbalOEriPOgUleOUo4GRxC18Z
         NgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDU81/O/mvsBqaa6zjWWSjkHgQLZz5DoYWTmGPT2mxEz/tp2qn7Z0ehFLm0d0sjPFEc8Esp0/s2rE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyppqa58vCEQsgk2Svi3rMEtWtHrusB3sG95N/evMA2WmebjeCs
	FYCLrTWkbG+nwMgje8o3kclvKkFkG8NUDB9XS+2ubFTtBRftbAf9i/gM
X-Gm-Gg: ASbGncvofNfppyX0MSG3QFe09w4eRDXSRECApc+qskKsEUxvKHptHH74gOc/Qp7cQ9C
	DEjiYQ3P+Yo39G47d3z4TaORUS138i1ylMsZb6yWWwDKf2dR8nQEUvkjEF8GV3ovxfvQwxReKPh
	ulMYX5szFOq5ZdnlibxGGfKsV0Q9FA3kP+QpjYgnu/nIFLhFPYiAghbml24sGE6ihG/z9hLFUeK
	pj8beYOJ2XBJ+avN/6vv4fWYmD+fo5TTpZ8wzinyLGWKTRLR5juluaedCoNjeAdaGk9joopaij7
	60TXWnTsLNL8euS5QJjq244k6Enx6imK7ZoelW3n42yTaPajztQXbgG56R6TdKEpg6nlyPCg5zN
	mST1fxfX72CHxhSOFb7rkL/vKyA==
X-Google-Smtp-Source: AGHT+IGjod8lqjLaEANJx/f3tL+YzsyYDJl9LPFcu3JZwKlmcwWUqkWf82sUbluRqo8+bR8l8AKKKw==
X-Received: by 2002:a17:902:e5d2:b0:24b:62ef:9d38 with SMTP id d9443c01a7336-25d24bb34c6mr224282945ad.19.1758001343029;
        Mon, 15 Sep 2025 22:42:23 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267d4d45427sm5867495ad.147.2025.09.15.22.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:42:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 741414227235; Tue, 16 Sep 2025 12:42:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tom Zanussi <zanussi@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 3/5] Documentation: trace: historgram-design: Separate sched_waking histogram section heading and the following diagram
Date: Tue, 16 Sep 2025 12:42:01 +0700
Message-ID: <20250916054202.582074-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916054202.582074-2-bagasdotme@gmail.com>
References: <20250916054202.582074-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=bagasdotme@gmail.com; h=from:subject; bh=IM0I2qOotzNuT503Elh5AFKW881D8AA0LxYsvx+eLpo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBknfphxGN/7ULjEouzlt4szEw/k37Flv/6dZ63ARYX5Y ot85Ho3dpSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiUWKMDJs52NIrfC1VFE8w xNt+yFR7KRVl6JGkdfB9y2+2HQrvYhgZJi62L+duSouZsfq5xTLb6Xo7QtkrNi5drHSFcaebxdT 3LAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Section heading for sched_waking histogram is shown as normal paragraph
instead due to codeblock marker for the following diagram being in the
same line as the section underline. Separate them.

Fixes: daceabf1b494 ("tracing/doc: Fix ascii-art in histogram-design.rst")
Reviewed-by: Tom Zanussi <zanussi@kernel.org>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/histogram-design.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index 231a12bd7d461c..4faff1669b77bd 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -380,7 +380,9 @@ entry, ts0, corresponding to the ts0 variable in the sched_waking
 trigger above.
 
 sched_waking histogram
-----------------------::
+----------------------
+
+.. code-block::
 
   +------------------+
   | hist_data        |<-------------------------------------------------------+
-- 
An old man doll... just what I always wanted! - Clara

