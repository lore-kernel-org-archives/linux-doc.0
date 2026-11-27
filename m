Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761537;
	b=uAoJEI79NgD8ctE6IhJq7T8bh9SZBmFM5VN/Bo8Y/jXcT8/iHU/jYGBlIDsmi1n6j1gn
	 3GHK8dPfkHo4DRJc3HL+9essqdgCYOyqI+l7MtYX2evEvIf5xvNZKKGjeiL7QNsUEp7bj
	 7/gr6ih4QuBjWtusAF2YKUvPxUho0SmAJqYOEZYl7tdb7AeW0txsLHW/zsl+ms9tllnjA
	 /r9TbNefdievHMD8yO3d24dykCyI9cXSy/7Y80Js1WRzRMqFAPb2wEt9cksfUOsjedKlt
	 RncD5K5mYF7z7pmaiEw/BAI6c9TpLrkyv0bg4ozgow82RzNbdzba6WaxrCxbUAcobOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761537;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7o7wf/XwLX8cONxvOHkzMOsn84EM2U61JcBTz69PSzA=;
	b=zxUsvbjROZBt3xqR8B02YBzpK1SawGFNjpegR+JbmSgLHN1H4nV+AYsQtU+dBVLd3CBq
	 Oxu2l9tIvqG2LpVuYIGUsIUrSEhP6LhQUl2RFzYCEzusexd76s1qziasarn1C4XQbB4GR
	 9evMK2Kc+yx+DDjqd5renEI1O00aBmJDISu9FtXQEZQhpCQqJZwDDI5txdGDkMr9d1AeU
	 FlrZ8Pp1l27EkEtz/91AffyxyU+sC4q2IOdMIZjwzkf02aJAfH67YT/8JCF0X5SwbVqAe
	 1Yiw4T30QVD2ieZP5LuxVqRluu1y85awSH8HQhBfOWMhByn+kDyzEHzASNujoYBEqCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KO2Ac8rw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A61606A32E;
	Fri, 27 Nov 2026 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KO2Ac8rw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761537;
	b=vjlGSyJbRMQE9n9K/vEW6myMhqoQ3VXrvBK106MhGmimZZYSh8jcq5eg7ulH3Y2pHFX+
	 06Wck/RD8Rs0yXje2l9qlHAbvywIilWSrXh5d0ulm4dwCRvSGZk4as3YgqLN8T36XAyvn
	 UQF6yOQgfRbH6OrMWaUdNFqcRcAxhD15Dy/oTHMWrMT++m3MR11MZV27pfk5TQirrkZqK
	 Ls76alX1uaVfdeNvxqItqSIytD85d4zq8nt6/p0iJT9f+YbUgOEyTT/Ph88PCvbcXnVnR
	 EE/DaXPkhWsVFpUTc/0sYITy+tGits0M55akwd5OTRNpPuDGcvVoLDiSsbXPV8803jw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761537;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7o7wf/XwLX8cONxvOHkzMOsn84EM2U61JcBTz69PSzA=;
	b=kHMbpMx6uJrepmHU+LAinJ5v8+hAAGarwNC4zj+zwLoL0d7c+W9Xgn3Smzjp6/0Pyxl2
	 BnZ0sS7GDThqIEwnpn8aHM86/UR3By+OhBkY05Rw+xjND3/UjY8n0v8KOG4/9iXbAnqbE
	 BqTqFjYJg/DTWzIOtixotJr80xOR3wMuqObe+jQhQEU0HvmEruwY5eXOIFqOj+/PtkdbR
	 gqJcKQbhhqoCWfh84T1Jnb9+UqslVbB9HULs52olxu5ZCdbNBt+RZmPaaU1zqyN9qlcls
	 rMH/wXxMJscX9QPTP0HuwyrLseQg5CLjQg8GTHJqMoCaKZspaErOBBT6yCnwvLL4roA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C8FE1F0089A;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761537;
	bh=7o7wf/XwLX8cONxvOHkzMOsn84EM2U61JcBTz69PSzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=KO2Ac8rwA316ou6OzkV8jvxDGrZonWqRSYAHoYduw6UQo84L/KTOHFTchTNepMI0P
	 K0/rCmM0oZusw0fyeFsuwDCH27SowZ04acALnMH+g8VrrIi2Wr4bpCN93OeCK2IiP4
	 bWAp6GDptiB+ZB3u2ku1HLmzvyaZAGXltcQAIqsDYi5X7EFfx9eJvUNDN5y/fQDuST
	 JYcJI+HgXVh+wrp+emzgCm1Yac0SNyh9nFjF516yO5T8/cffY/rV4BWoMF/5X18Lu5
	 d7JCC6OM+zRUoAOImZzYGBdLqxZrWO0buN4kfP9KMlE42BsSHyPx60UyBFL0ddMhxn
	 LfwmR7Re/ZbeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E1364B5C0;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:39 +0200
Subject: [PATCH RFC 02/10] coresight: cpu-debug: Make the enable parameter
 read-only in sysfs
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-2-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=S8ilSl3i/zzxTPiODOCucBWFSnR+cdlYr4OIODiodjE=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqgVMuWF/PGWT+AvTsqardj47+/nR+4lCX5hbnnMWf
 7gdKKTSUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACZiG8TwV3rmt9UpRv0Pd9Ws
 P7ztS/KNY/3+Vw88KTfNtmV8vCNBfSbDP0vN/9fiwxqPt7hFzWoov7lyH+capqehnkn3d52Vu61
 mzwoA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

A write to /sys/module/coresight_cpu_debug/parameters/enable changes
debug_enable but takes no runtime PM reference, so the driver then
reads the debug registers with their clock and power domain possibly
off. A later write to the debugfs knob finds debug_enable already set
and does nothing.

Leave the parameter for the command line and for module load, and the
debugfs knob for run time, as the documentation describes. A set
callback that does what the knob does would also work, but one run-time
interface is enough.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index edccbd2fa5e2..f9e6e344ed59 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -109,7 +109,7 @@ static int debug_count;
 static struct dentry *debug_debugfs_dir;
 
 static bool debug_enable = IS_ENABLED(CONFIG_CORESIGHT_CPU_DEBUG_DEFAULT_ON);
-module_param_named(enable, debug_enable, bool, 0600);
+module_param_named(enable, debug_enable, bool, 0400);
 MODULE_PARM_DESC(enable, "Control to enable coresight CPU debug functionality");
 
 static void debug_os_unlock(struct debug_drvdata *drvdata)

-- 
2.43.0


