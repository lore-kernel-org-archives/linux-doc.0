Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E412E86342
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 18:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746471265; cv=none; b=GWSpW/DgBnzi4WpQO2B/mGrgXnoi1Ibly1zc3k4y4dI10lknW/D+cQvCucTkGGhXMmIxq7Ykb0xMTX9V+pVHJusONgwMmgTpWMXXAuctlzAX/o1OlE6QfCHmE5moVehDNGwB4P8+OP3mnZb07ddoul01vAS15BMcW+BsCElPS20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746471265; c=relaxed/simple;
	bh=FvQMuhjzacr7SShl8o8TZDo6dX2WouuSeqzJChYTePU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oHgGqjvX3fmQX125anj71NL43KmWpgw7I4Pu0/X4LWi4j1WfSxg2Z3fpUghRfWj3DSYwOEBzEDsNDxOjJPP5oih8WeiMTyqqJnX/Kqe6Q7q4JsUFU6CFx56m0PP1iuQfh5pvupWgmcLJeWilHah9/w6+HSSb7y4NapuuqlPEAFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWIZjt1D; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWIZjt1D"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e15aea506so40283595ad.1
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 11:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746471263; x=1747076063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3S2dYMZ0l+xL65Sj39FMucW3V09fs23H7lhU2APzH4=;
        b=VWIZjt1D13+G9115G57KRlRsRRQM72bhhTLOA4zRSVRNdCLdmJDDtqN9jGTmUhMIDF
         Jg6nBbF/Kz//a50YRhi876NHgFRwDnf+Ifp6MG+LIUk9NZFc8btUGzyHuPhiScZ4FXo1
         96rQfPoHtFzt9kP+BC+ebFA3BFy3IdF8j9k/ZyVQ8BvgmDsZXDXZgHy0bfU3Wnkt6uz8
         y/XxD5y4tzFGNs3xT6kp3qmBBguQ+hphCemCPvNJEuA2Q2UmcVoyyzFJJwr7C/XyFqeE
         /G8bQiURSqrE7q3zfHULgF0KO9trsP18oDFfm+ER/ESkWWXsDTq9u2nk6WGNUJSQMvso
         qRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471263; x=1747076063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3S2dYMZ0l+xL65Sj39FMucW3V09fs23H7lhU2APzH4=;
        b=TwrjYtSHpL5NFmlVD+zP1Vn9hnwDiT9M6VFZNAFnb95sXfrXbFQN2e1Tgp7Khh2w+A
         gs1lbqL92TbsMFyXe1OR2G7JojvXLbb4OiRa9gjnxnyvWYR4mvGg1K87V5IbEOHg8cdE
         dF6y7brwhfvvHFJYj6KX09hVUOt700p+yUEXt9G7b04oHnkPp7IqlKSHVPt7MF6hfjxV
         3ZrrnuRhrw7RazQ7WiYhl4u+T3TFLU8nlEHV6JFee1LammnS3rDSrsVB6P4t6fm1ET9E
         //s0rtBm+tUbfv4qT0V9XZMiUBI53nr38lxydM89+eJ6y44JoXqxXZDpL3QGQKULFj94
         ANpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJDDS84p6vU5hHlaoQ8I/L5B8nGDpiiAjq/bUs5ZASDPLRNwnJStrYHbhZwZ5J/SGMx1zO6Ep2Kjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8A8cPIt8mkN77DygjsIqCZhkQgzL41bD3LRzeWl1fJNhFRTh7
	TTaPygnq9XNYn2CftNw/7BlLoV1yj/86jfXx9o+qJpUsxKR5UC1E
X-Gm-Gg: ASbGnctZPAtZMj63AgAdpQ1nQcIkVjoyCTsim4cgGnJwb6D/PrtGSLO/Y1OfU5RAIf8
	uPOI99hmN0PtE+arE2w82UdskVgxd0LpS0afs3qs9V/vSDwenjvgoW3lliJAxkFhTb2TThi1Jcn
	mWP1E/pEUQKCZBuPgC0VtGaxdufoec8fyC5fdREAYjtBV5vAXkI+67CdpOITZe5joBKROcVHMA6
	247TY92lUMm8Gp4m4yHUBVlR0JLufV9eJN4PsJuhdDJJZU+Y+srVrDt0pCSdfrYrD9LmxeQIt6f
	zh4b6mGp74t7cHmN0uVSaNgSWZ7b1EG3Q4adVcVAOcw4HpFNvQ==
X-Google-Smtp-Source: AGHT+IGvplLpA/LKq3kGjH3PIjCdiIRIdsSSgAvfr/H5YDVvYNRTxHcfaj2l8/epTjC0qR5f8vQl5Q==
X-Received: by 2002:a17:902:d2d1:b0:224:194c:6942 with SMTP id d9443c01a7336-22e1eaabf6amr127150255ad.34.1746471263029;
        Mon, 05 May 2025 11:54:23 -0700 (PDT)
Received: from Thushi.. ([171.76.81.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9f39sm58784145ad.84.2025.05.05.11.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:54:22 -0700 (PDT)
From: "Thushara.M.S" <thusharms@gmail.com>
To: corbet@lwn.net,
	sj@kernel.org
Cc: "Thushara.M.S" <thusharms@gmail.com>,
	linux-doc@vger.kernel.org,
	damon@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: [PATCH] docs/mm/damon/design: Fix spelling mistake
Date: Mon,  5 May 2025 18:53:46 +0000
Message-ID: <20250505185350.10171-1-thusharms@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The word accuracy was misspelled as "accruracy".

Signed-off-by: Thushara.M.S <thusharms@gmail.com>
---
 Documentation/mm/damon/design.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index f12d33749329..700847a7ac9e 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -54,7 +54,7 @@ monitoring are address-space dependent.
 DAMON consolidates these implementations in a layer called DAMON Operations
 Set, and defines the interface between it and the upper layer.  The upper layer
 is dedicated for DAMON's core logics including the mechanism for control of the
-monitoring accruracy and the overhead.
+monitoring accuracy and the overhead.
 
 Hence, DAMON can easily be extended for any address space and/or available
 hardware features by configuring the core logic to use the appropriate
-- 
2.43.0

