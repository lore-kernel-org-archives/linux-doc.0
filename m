Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91EA2F7EED
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 02:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762040; cv=none; b=obk9Tzss9pgWP8VaCuN9tsHY3zUiV6M30sNGGXXWmuqFdjwx75Ew4fuMLKSu6wsV4DzgW7LpHWX2dBuhiEO7JJgZBWeyTjk8QxD/9VbPqQ37CbjM2iiC8H06v7LU2d5OseLIUW/LyWOyUgt2wkbp6WMxFhH68Fry+tUqAQQLL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762040; c=relaxed/simple;
	bh=wSX7HQLlP53MBTgwV2/UOqZrP3UUj1AsBNH2tTFCGIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rdJDD52iIAys37cMkY+3KKtTTLhSeASrvRcJum31dVCmsdl5G8fwKBbdhONFASHlPmQVglB5K64QAyfAbFcGtBX/XW3isxtD8ICR+ym+AGpBqw9/dGxJAGrzWqXzVQWZai/c/ehiY1I3x9cNpn51l3O+ZRfG+J0RCR76BAG9Jkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ekc/gi9I; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ekc/gi9I"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-824c9da9928so4602662b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779762038; x=1780366838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmLGig4rjoyZs66olaJ2SZEhAFnRI+y8KyNxb4ztmCg=;
        b=Ekc/gi9Ircfsbu1BgetopMBkvYXhF7exgB6xWMsAPzGYnaJTAXKvIgLit6cEixJuJo
         2F1CJifmtOlNa/jscqam9MGPmctkFN96TkhkcOEczr+wMMVvE4u2ChPDkbXSk+tfWWNz
         g0V3FiyNGKzqhsWVzqedeKlvEoNgsOau/54PKPbE8UuaTqm7SzZBS5kTo8SUg8iso/qW
         mJK+pvzp9fMV5Ngk89XiwuhHCKjtajSTl2tyUzG/AX10yhobidY5aLsdPbGSG2rAMtDv
         MV6djiLgXgsCDUy9YSF/AJ+RTkqXJ8I3J3NNzQ9va4lXHWpYUJaApvHqkd5jTWZM5bKB
         Jq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779762038; x=1780366838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmLGig4rjoyZs66olaJ2SZEhAFnRI+y8KyNxb4ztmCg=;
        b=BQ+GTpPZLByOpaPCUcBk2f/USfdpBDlKo3ne+9o9gl2WoG9jUjLpyV3VijEzJFY9W+
         vxEUsqP//TxrbxcmNvRrmcH5Ic4Z48ImvHIVVlQh/g4BnBITl3PP5Nyw/d163jdXqEYK
         0+uG3ojFHUIRYqHVUBBbxkBVvex1/pi5EAlwbIwggzM6EZnSXJtvwb6UYdL5Uycw5scY
         jEbFUUrSOKOSyrCUfNCFbNxjDIbHA/igSK0Iba9FNVgfzu4TsGWRh2jc1H9+qIKt5Lml
         1gh2eZkV715l/lDhN1WS/PgVuxSztOLvKDeM3qiwtUvqsnBh6/v9IsOUYHnuO56rIbTL
         Xu+g==
X-Forwarded-Encrypted: i=1; AFNElJ8Ojsvm+BwQT3vLoyceZpqA494fSYc7zqh7eSoVnpHCOhqnjZXDHJwDdwaO40QkMZHMnDJtOw+iUnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnAq3W8533snYfuQKnRPAV6bI8uslOKaVqWQZmWTVEa6dMygA2
	lamurcKsQkOsh4GiVt8q+r+EHlbaiEjKIpeCB/6JVJ0gLK4sxascptv3tvUdshYR
X-Gm-Gg: Acq92OHn7WmSKY9HAfnkeBN0QCB5RIHGUSbXStdzl+7jtdLZ4nXh4rRrxNHg28NRiTh
	CBRSRuco7NhAswUCavx69LuTHghBrtWc/WKyI9kBlEnJD6jEKrgO+Zjscu0VUVsAfmO6WHT6b1r
	kHcbD45ZO4pxHvbFNR5YIjOBEP4hMi/rweFAB3Oq3n8zasWuvODztXoPWwoSJWOcUT0aanaavY5
	oPbi2yObSMDkYHqdL5FBZUTv5H137exH3bXQevRHqTfV1UA7/anDgHhXotVo3e+7hVbDDnGweXo
	n++Glo229+WrEpNbKuS8P8G1LgmD0/UD3JQVU44mPtFvrNOcdqcva6DsQqpztlC7KqCeRhHH/4I
	BI2iVVel6qgooOT/yuGCR94NMdWZ8gjxhO2bggLBiwrwHgf9DOovnWFbatzSC+7gzHzpUobtL1M
	B2WtINVsqbkknJGeK3vKnxaJnI/S1mEeRf/ekDt42DDp0K
X-Received: by 2002:a05:6a00:1992:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-8415f307cf5mr15858014b3a.30.1779762038214;
        Mon, 25 May 2026 19:20:38 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd8127sm10277571b3a.50.2026.05.25.19.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 19:20:37 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] docs: changes.rst: restore pahole 1.26 minimum (regressed by sort)
Date: Tue, 26 May 2026 10:20:33 +0800
Message-ID: <20260526022033.1301884-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9edd04c4189e ("docs: Raise minimum pahole version to 1.26 for
KF_IMPLICIT_ARGS kfuncs") raised the minimum required pahole version
from 1.22 to 1.26 in the requirements table and added a paragraph
explaining the failure mode for distributions still shipping pahole
v1.25 (e.g. Ubuntu 24.04 LTS).

The next day, commit ece7e57afd51 ("docs: changes.rst and ver_linux:
sort the lists") came through a different tree (docs vs sched_ext) and
re-flowed the table alphabetically, but its base did not include
9edd04c4189e.  When the two commits met in mainline, the textual rewrite
of the table won and the version bump was lost.  The added "Since Linux
7.0..." paragraph also disappeared.

The result is that changes.rst on master (v7.1-rc5) lists pahole 1.22
again, even though sched_ext kfuncs annotated with KF_IMPLICIT_ARGS
genuinely require v1.26 to produce a correct vmlinux BTF.  Users on
distributions with pahole v1.25 hit "func_proto incompatible with
vmlinux" when loading any sched_ext BPF program (scx_simple,
scx_qmap, ...) and have no documentation pointing them at the version
gap.

Restore both changes from 9edd04c4189e.

Fixes: ece7e57afd51 ("docs: changes.rst and ver_linux: sort the lists")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 Documentation/process/changes.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 9a99037270ff..a4db8f7b3afb 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -53,7 +53,7 @@ mcelog                 0.6              mcelog --version
 mkimage (optional)     2017.01          mkimage --version
 nfs-utils              1.0.5            showmount --version
 openssl & libcrypto    1.0.0            openssl version
-pahole                 1.22             pahole --version
+pahole                 1.26             pahole --version
 pcmciautils            004              pccardctl -V
 PPP                    2.4.0            pppd --version
 procps                 3.2.0            ps --version
@@ -147,6 +147,11 @@ Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
 generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
 modules as well.  This requires pahole v1.22 or later.
 
+Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.26
+or later.  Without it, such kfuncs will have incorrect BTF prototypes in
+vmlinux, causing BPF programs to fail to load with a "func_proto incompatible
+with vmlinux" error.  Many sched_ext kfuncs are affected.
+
 It is found in the 'dwarves' or 'pahole' distro packages or from
 https://fedorapeople.org/~acme/dwarves/.
 
-- 
2.43.0

