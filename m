Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13D256C9E
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786096; cv=none; b=Yics6kU0aIr/mH6UTimNbW6ek+WflfhrHOOX8mmVUWx7h3rReQ7WLnGjlcCim/iwZ+5k2RiV9HhS206Y9lmkVLsc+4/5HZFVvDLr6WcToLJd3zguHQdapyXR8d41/yFAVXSc0gtScYWmGlWtveZbrVJLY6qBBycWoKygBmZU3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786096; c=relaxed/simple;
	bh=XJ1xcMRdMwOsGfdAXpF2A69QXd/Mrs7f+S0GwB+Q0zA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o5tllb3q7ZF481sra95exiHDGBB3PLaCGcrev4UcQp8XnQzGRvMnyccLBDUNyTZmIySUy4Y1lPGRrkhubtQq1wRO7IK1GW7tqBUuKwfGnMkbsI6Wxq9PcztpEUjWQycjENx6lSZ8+3CStSPxsu+IyzQxdmwPSv09whGJ6xe39PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGEoa3l1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGEoa3l1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2984dfae043so869865ad.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764786094; x=1765390894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TA5KgmV06QkZagHSOWVDNWdYVxZvmkjGyikqKY+khMg=;
        b=bGEoa3l15XeNrqgVSqbyhcNFcjaWfnk6S8HcntXUOpilrzRT09CIYQMPowdKxH7EWp
         3PIsiL9StQcKR6VQycyCSmWIgmJq1NEjEEy0ZY8JRu2mjBEhMSP9z8ruiHEgsyluAmzj
         dBbAcdEzyBoYa8YMIMMOkdbgrm5HJ4XSI1EDAAICNS/n2q3Dr35eyojoBgrq1fUxJTkr
         gm5djhHFq/gXbBx+i0OYTgPunOZ04ynqsOTXK2ugsDyqCmobbk1MOUC4PKnwvWUkkTfK
         u2TyGgZYjSSD/+q5CLBTMUl133fXaxboTgvso7fIe6TpdRY5Sh88nab/Nmpsk+PDPoLc
         eJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764786094; x=1765390894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA5KgmV06QkZagHSOWVDNWdYVxZvmkjGyikqKY+khMg=;
        b=o+n0cLdIH4/zN97pU6WyyExyQW9xsGRIBA0cxN83FguSFd4hLfi5ZBms0M56yn879M
         ezM8NE/fmBNYUGFcmZZ+wqJceOlR4pNyBEojIOJvw/YKwOCCl57d0LxWFnH5YJZiLJBY
         60DuI7jy8KkjArdxmBWb/g09rKiUU6tB96IzfYyDKftiF53XKxT0sgTmLNhPTVDEwx1z
         D7IW1KD4airrF/roiDg2KDJxUVmD3L4TTTlogLKnkxUT2+JoLeEwhNxVuhJb3GmCL+0X
         ib4D4cbahso8g9lz/3hrcMmGJrp4FZvnR8c9zCUiGsm/AwJICeeaqmKQxnJ6mrsU/tZx
         fOLw==
X-Forwarded-Encrypted: i=1; AJvYcCV9StpGB3dBOE4VH7kQrh3t0YkDbTfrJPMqjbXpM1bcPj15+jK8vAqNiS7JSgqiqgkQqdoeGy5PXO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTGB+lR8PiarQLKWOwqXWjUQpY10MR16+KHDQr17rVu4dYT7wW
	k0WbyMLFZamlao67PEDCo88crG/QeuBPOQignfj1p29pSRnJm2dLakp7
X-Gm-Gg: ASbGncv2mnka/dN3sUTaSMlScamYfuQTXdVlHAG9O9s6XhNZWluCmchWG7VykZ77182
	b5Pggbv0QkUOwQZGVy//5yL0u32kJioRVKKmgg4p3GpbMvQRH/rwV9BbAfIal7r9udraAoE53aI
	2iM5hinh2timsIpssereEin0cx1TsSiu6UjJAg5xfKM995nt7WPwhtaYiPCi/RCJw3jS4o3dMmm
	8nN0s5hP1UweSnW5W1z72t9Gfk4Ujwdh2sdcV5pnMT1+0YJQVXGhLI76nu6rsbonVWK32gsOnbK
	uokdfjic5oH47iJS8sA2QnVtyNk3jAGPkBItZ4Ccvb9q016Tfw2vSHvbgrwIGBGcDzEVqsFil/o
	MY/cRXxp7di1N/FG2kqN+DeS7eiMg+z0ljj18P01KXZZg7zBFZcT5Y7URayNNsmz3LvSCGitoEK
	FQQTaGNah/ICZ5iNSkYSc=
X-Google-Smtp-Source: AGHT+IEJzmJssgbrkH8WJ4QU3sLFJzLPnML2qy4GAU7o/LHkI5r0URBsuV/jtiXbw3XNi9hrDB5Ahw==
X-Received: by 2002:a17:903:90c:b0:27d:c542:fe25 with SMTP id d9443c01a7336-29d683afcafmr41970015ad.41.1764786094501;
        Wed, 03 Dec 2025 10:21:34 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb5c6c9sm194659425ad.97.2025.12.03.10.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:21:34 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation/rv: Fix dead link to monitor_synthesis.rst
Date: Wed,  3 Dec 2025 23:51:21 +0530
Message-Id: <20251203182121.52759-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst' in
commit f40a7c060207090f41998025fcd1cfad06ea2780
("Documentation/rv: Prepare monitor synthesis document for LTL inclusion").

Update the reference to point to the new filename.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
- Use proper commit SHA reference syntax

 Documentation/trace/rv/da_monitor_instrumentation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Documentation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b57811..b847c58a96b6 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -168,4 +168,4 @@ The probes then need to be detached at the disable phase.
 
 The wip monitor is presented in::
 
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst
-- 
2.34.1

