Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AD27F73A
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 23:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749164853; cv=none; b=cWoh7JehmgEKYeCtQm7rtcpOQU1xiXmrSuBKe5FUlyqE0lbiZKZ6Nio2et+b4jjlJjGhMFwJfH8Nk17+AwQR3O1Th/IpKJS1lzZ7uwCt7ADUSgeeBf+ypAUnLIUUAaF+VVwbh82B8hr9PqZOtnTNzhUtfHkoaxP6uij9zMnjXZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749164853; c=relaxed/simple;
	bh=I9QfnjJpp1IHLl4r9WsdAMzzwXNE41MW2uuYdb9xsww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHNyCbqEKGFr/z/zBiZij/fQZrRplvIvS53a9OVrhy5x2wnIFGjOJ5pFFXODZpBKAySt/BDA3TAvqAS5t70g6WsYIeHLl5C9aDC+M8n8VAfo35PGiPa/VS0BooMa0dy4lXaCC2RuuwJ4Mh6OXpnJxvh4K5j3I/XLDi4WUfvmI+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kstn2Ix8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kstn2Ix8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45024721cbdso12882975e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749164850; x=1749769650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjnxTpZiZMmemhu9+gN3x+mfAc+4/4gkspcZdPB3RU8=;
        b=Kstn2Ix8SEGBiYFLexSR1E1bGZ16wAEI43Cc47HaGOIBK3v3ZEkvjFvcjWZ+70EWUG
         vr66Su6uLF2tul3/gZ7HBPB1Xg8iPyExZVfIP+R0E0Skso/irOnmuxPY+ax8Ciwym5xT
         528MI85zTapLmUOzUV+sGPPNEYMqwsF5bMuauXCF07Td1h3JvoS2L5hDBOdp+GE2nOge
         WlpD6MtXwfwZF5/flU+eB0KqdXeiqfNSmjcoLzfA3R+4sY69vzy0hISRRUm9fgAtai6k
         J4dit2yDqAYDPyMFogqSQtp+iWIbPXowu7KYwo0WB2Jg7NuVMeKdB6a49y7qBZdQeUSQ
         exyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749164850; x=1749769650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjnxTpZiZMmemhu9+gN3x+mfAc+4/4gkspcZdPB3RU8=;
        b=CI2L5fROYLznBDiIhbhhK1N+BqLTm6s4UfsuMqfx59LBaRKDD3+REFr4q86bTB7sha
         cMpi46Wf28fbF6MCqXni/cN2YW7+CxC0n0n4ir5tCZPnmAOz+aHgmf04/MmF7UFSIFBM
         CcgufzTvNlTOadIX5yHyoW6wPltuu4ApLAjTHmZwJad+J2qWI99rBGmVcSQFcLjW2htN
         yPLut3tKuT1TYrWHeEfAPm9/Gk1b6DqLxpp2ScgELiQW40d8fsuzpme5lttfEyTEtM0s
         Fm4yRNZbw3mDJbrD+zJtHr7fQFthTtD4mRlxTUtpJRr0tgne/1reuphJ6vDPkk6GigXx
         z0gw==
X-Forwarded-Encrypted: i=1; AJvYcCXh4h6g6BDCQ0TW+rasi+CvTS8cavehW+i33br6sTvSYwk/cJG+wyU7/oqWaBN+v0xPKAcFfq+yxxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXlOfNSdyESNxBa+rLun/GR2nn7psErwDJhC065gAp7pUfwT5T
	3vI78vnKqWVou4osZH1LJKuLMoDEHsysUuaJU5P3z38MHUi3tFUf+6B6
X-Gm-Gg: ASbGncu2o2MEBX4EJzLkjOcgyhHtQgnLWGDaQDElXkhsm49QAVAcgQteMOgfLmRlq1h
	sBH4EdweH++6GzyL5rbF+n4Tmu9KPqevwdF97b3zVRou/XNtAdAy2cgCZD/AtlrGwkqz1adEFZt
	P0O4vd3cw+9N/MQhz7C/RQalHiVN77G3q8RgXqX1iVCTBwwLaBTuWFZks8asTS4BcfuB+KTc+8B
	rmZ9r9H5MQc1FSInq7NuHjfZ7+HunwTJ1vl3UpObymY6b4PDzXHGdxGVCHodx7lFEdiLTPn8E4c
	XHHKxIUFgclO31M0ihJcTy+x77nfA0ct1F+xB57d+/smgG13TG6MzJvtMxlXmVzT1Nzo/EkoqcI
	nRkxPbMmL0phOSIFxg3oLIwfY0OIHropF+qrkiw==
X-Google-Smtp-Source: AGHT+IGP2fxKsq7fNttAwmHsPs2hy1ntxHLXq5lkymYJYEMTQMxw4Jo1wB3lOWOKEria3h+GGqDTMw==
X-Received: by 2002:a05:600c:4f16:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-45201368d14mr13018985e9.4.1749164850127;
        Thu, 05 Jun 2025 16:07:30 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([41.232.132.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1f34sm6492355e9.14.2025.06.05.16.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 16:07:29 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: void@manifault.com,
	ast@kernel.org
Cc: Eslam Khafagy <eslam.medhat1993@gmail.com>,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH] Documentation: Fix spelling mistake.
Date: Fri,  6 Jun 2025 02:07:25 +0300
Message-ID: <20250605230726.181272-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo "desination => destination"
in file
Documentation/bpf/standardization/instruction-set.rst

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 Documentation/bpf/standardization/instruction-set.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/bpf/standardization/instruction-set.rst b/Documentation/bpf/standardization/instruction-set.rst
index fbe975585236..ac950a5bb6ad 100644
--- a/Documentation/bpf/standardization/instruction-set.rst
+++ b/Documentation/bpf/standardization/instruction-set.rst
@@ -350,9 +350,9 @@ Underflow and overflow are allowed during arithmetic operations, meaning
 the 64-bit or 32-bit value will wrap. If BPF program execution would
 result in division by zero, the destination register is instead set to zero.
 Otherwise, for ``ALU64``, if execution would result in ``LLONG_MIN``
-dividing -1, the desination register is instead set to ``LLONG_MIN``. For
+dividing -1, the destination register is instead set to ``LLONG_MIN``. For
 ``ALU``, if execution would result in ``INT_MIN`` dividing -1, the
-desination register is instead set to ``INT_MIN``.
+destination register is instead set to ``INT_MIN``.
 
 If execution would result in modulo by zero, for ``ALU64`` the value of
 the destination register is unchanged whereas for ``ALU`` the upper
-- 
2.43.0

