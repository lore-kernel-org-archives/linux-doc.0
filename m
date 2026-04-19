Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767322DAFCB
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776625597; cv=none; b=V7KNwoKKTol4Zcb+KBXuFuHP/zg8WmTk3jY7fRKPfJ75b8McRcBlJCnRi3e6KpA/dmvtTaPGrn6mfyQ+Eq3FlEexys21GCp3CxxlvzEPSU0mZVlVe2RF5gh6t38komuFrJLdtfMh+QchIXz7IepB0CPYL516LDR0vXe82l/ZUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776625597; c=relaxed/simple;
	bh=toOFf2xg142rVKdQsq5pdhGPVdznNk8pu3Hk5d0NOts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRuMPZCHbBL/OcwT3vxOO6D1P4PCkaZzVsmw2MY7dwOgriWtbZVnN+lp67AZKqQ+QaMXkq6cHSiQMdiLmAdIWy0+0tkjl2MYsmOKdF1p9cEzdzyeuo5uqVrFVDF9yp6Pksll8hGArDvs1RyUZ9dP1tB4xslFCLB9hXsydo1vN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTeUfGQR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTeUfGQR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b2429f98d0so11880245ad.2
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776625596; x=1777230396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYwumL6ukXBAj/RoXbmDU80+PEG893ZgwxOy7tBa+0w=;
        b=WTeUfGQRH0GwJ71BnR2Q8ONqp1pYQOF5fB3LbkpfMWv8/kqWOSNgxTecNIWTH+bAbw
         zqPLRumgAkiziz7pcobaPz9GnAAZqMSlgwT5S+742lPYZRb0SCvtbzfy6jdqubBe/RCa
         rrb+pw7xibhU0FQVpdPEeb971mYzYRdBbNH8CbJ29nEJU6tTBILRkPhNUzpsgvzHjIO6
         65k4N6AugHi50yENYA7zLIVfaNjs/MeyivTGDg69jcSAWUXhECpCLjQHf010r4F1z+Cz
         LvtsrmLXdlCBdkx/Pk/OP6cuEj71xa3QhtjJRBzYVNLMP2xoMXBPI3+2qBY749JIyjtI
         nnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776625596; x=1777230396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYwumL6ukXBAj/RoXbmDU80+PEG893ZgwxOy7tBa+0w=;
        b=ekTMqagthvHWB2OSkF1YT9axP7oYKlQfCmObKMwSAr6vZjEaSz268gQIAc5bGGCk/l
         iqhqk2hupNZeKDL7UfXpfmnJyssckGDm79b8x4Ir2idy7xl28vK98v6WWd3REMtYUrzX
         pvClowAVPydOpd7EDLE4E3naIOjjbbia3N6tlODZcqHQxepWv/vTCXtcR0mCO/XrBNc1
         QvOQQs0dmIIPCGGotM+pwZj0tNVGV8d9az/GZLGBOEpnnYXR/1Ka0e5lixH90lmfzzSi
         4/TPVls45COnbGdoSIZvbD9tUufUh9SmfGclz8dhxlWDBFQHTm6FT7MQ2zXE3FIy9qP0
         TUKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KmZ+h9sy1ewfylHPpPLqlf90NrQ7A6vEku4YfiZpwdVcWQqTXyDWohu+stQw9i/50yZc1vsh5GlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YywaJzIO50cbhrU9MGwbYpa5kcw/TWoVcLfqBuJsKsPJGlASySN
	Yk74+EHT1R7STtFtFjdr5T66G+lfpO70ZY4mNg7GcxOBXDEykpVlgGG5
X-Gm-Gg: AeBDieuRFGhohTlIRS1yghyWmf9ZLPcKk/geTJHznDdO0PanOvKMdPzGVM7sTyQ3EhF
	CswWKtDrPI9yCet3ZbFYps1PZeSHUzFzNA1NkcgeJ34+BxshJwyTs7bVkQVOvIlHqdw/sVgjL/p
	nB0Hjhi3fqhAepK6vjBvjfrJ8ygDHmcCxFvS2cspkcLqGHFmQ81rR6u7CnMzXjFaFAgOZKQyvZw
	TkSQ3qbuyVpVvnxl4kOhFU/DhWBFcunRhTv3i3ZvSMTC7xyZVdvLSQ0dTYpiEPtDeEQzAfKfP3r
	x9pxWazZVTQz7CeKNmUXuty03WzIowZ9UO7iNhi0ed2Hg/b6hz+xr0LAvJgZVsXVFh+g4aKp+gL
	VmAMGFpvKpon0rvHaK0AUiuXcqKnZDx3h1iYbbnpi9k1lIvoL1VpILPZ0f2eqdTARIYllVVcjdP
	hGTYgC2RjExJbWE2r4y7heqWMqm94ZBiEszRKIcNSfXUCYqWaHa/Xyj0j6AkCH6OiVctK0z2Zvk
	4yO7ldRMSU+U6bcEA==
X-Received: by 2002:a17:902:da8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b5f9e773f5mr115776375ad.8.1776625595761;
        Sun, 19 Apr 2026 12:06:35 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm81585585ad.24.2026.04.19.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 12:06:35 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] Documentation: fix spelling mistake "stucture" -> "structure"
Date: Mon, 20 Apr 2026 00:15:27 +0530
Message-ID: <20260419184527.779828-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixing a spelling mistake in Documentation/trace/histogram-design.rst.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/trace/histogram-design.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index e92f56ebd0b5..41a726cd3536 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -247,7 +247,7 @@ field's size and offset, is used to grab that subkey's data from the
 current trace record.
 
 Note, the hist field function use to be a function pointer in the
-hist_field stucture. Due to spectre mitigation, it was converted into
+hist_field structure. Due to spectre mitigation, it was converted into
 a fn_num and hist_fn_call() is used to call the associated hist field
 function that corresponds to the fn_num of the hist_field structure.
 
-- 
2.53.0

