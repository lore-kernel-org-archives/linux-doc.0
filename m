Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1967C41E6C9
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 20:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874226; cv=none; b=aCwFVe3xqGTjYyeQot+5cXcJz8rdFLe8nHuLnPgKrd0xoqy6QcwpjvRSLfga7bvFnpIK7DONJZvsRpB4Acl1PAzf4BTIyFdIEbl/ZsFOet0njvAm/k7qoTVU06rskxEuRxf3cw0I3JHBpMZWdnp5UbVpDZ8yzjttYgAygEjrEdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874226; c=relaxed/simple;
	bh=odKAfR5SXlSj3tEVHIoteaEXfqaVk+LE0DGQSBsWgG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9EmzkP3LmTMkoic8sdEC0TqTmJBb2XxK7azRVBF5iqYadHo0FnUAtHInkCQwQwTul1rw3U2TZ4wgnvumLuqcnj3BDhJNR9TdTSfLYRMZJnp1cngCAAilzD7DnVtr55k+TioTvHiP0fXDaDRU4oJN7Wgj8RRCW/Mex49QbEHAlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNhKhpOI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNhKhpOI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso39359a91.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874224; x=1786479024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8tm2RO4MsvgozdnzrWxXsPnsUkx4Tr8PFjuKoLu4mc=;
        b=FNhKhpOI8xVn5sDP58loYU3ZBMpftsOY/ogOsbT/tLfkvq/0Qart6NlIsLJ2KtOsVE
         hKn8HNxr+PKiu2OwFHZYq4VYo5Kv/lBNj0mqvMOcMEeHFjS1D56H8++MnRuYPY4EbzLB
         KKvFa5lkKaKnHZtTSsySQ9FDX8JdxNru1KkG+qW2KEG8YZkx2kpIQyxIvTbe/sj4GSLN
         ypiotnvvqCeEGaJnVRezxYqsL2tEWnXbp4aBROHDhuPHeRW+OajNAwt6GUjtA7SFDE3r
         IHmR2vXYOVgrBAud/MmCyI+SZHtxjjG++rUYy0q28W9l2poQNx1nK+Qyk7X4jH78Lz3u
         +LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874224; x=1786479024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8tm2RO4MsvgozdnzrWxXsPnsUkx4Tr8PFjuKoLu4mc=;
        b=c538lKhcK5XxHVU/gfjUO7TSLL2vA2kzpsIipADyTwdWaGOMSWfJv/a1UcNa8cILso
         zkTl8vqYOxiukeoyu93ADwY7AMq+0/S97gwGCwHY5lzc532bans+v201Xs+87gS3MC15
         9T8honUraM1uiGbDVbyeHB0aIYQjcfmXYnDwp9sRoUWUEYYjlBGVzgMFjLyBtmjwzJLy
         H/tH+/XeV5neVSETRa7FNIK9E3Wg2rioFIDjNgE10Ca+fwY6TUp4o/fiY746yNpIrdIB
         1Aj5dN06rEABTDSFFwuviVu2doeOBRDyYLJdIZRBFRJLVEB3vh52cfDIk0ASrAsiPR37
         aF3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp0/RyJWtmlCCdn/DNGweVEINMVRQWoVzrbphZkaWUbs6ZS7GI65iIuw05r9JxSwilkaHuZwnDCXaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8UOaxsbHb0mcHYZgR62l/tsRT/JPijVd8T+PSNmMOjwTI05WO
	XNsvEpimbYv0Pa53K03DNl/F1zLWU+CKLDbncz/xKpPBwHKuIfDv8udb
X-Gm-Gg: AR+sD12p5bad98FcrvEG1gm8aFx5m5TAWQ7HnQn7+b8ihSCiX+b7rP8DePyXZhoRFSc
	AOAX9ggpmpUPrm/yYMc+Y9iWQaPkDNyUrStJBdCtZQGHbB9WcW2QDKwZYDDIFgxad3Uaa9cHl0q
	BUwNqWZvLIG0DQO2CnYyzc62UCUuWSyx5A9vn7gS9BAU9YKOEOMlf22DtHV7w1IP6sehRQpsDI8
	yWW3v2wObwKcTwAQkKRKEQNwdTINk43uknffk9xDpnOsuhih4kWKC5T1EF0/x+J+lbEfvdcr0KO
	f2rzEGxqnab2ZpGUpJ5XCIopdEw79yOv/+hAEijeSf59pXvnbRb3bc2A2F5rgpAZJgTYAXJYCoD
	lvgrkFszgH8X1pKG+PExs7yQ6MqDbMawmXMD1xjePCLunYxl3FnNDPl0I+oQ8YbmocmJFP2u1De
	DYU8pSFkjrv5HiQ24J9BgaOI8HOgbNlzTFooEuyPfVHpOZZTFE9VEmd0HcVsDAxmbBUfuz9TyWG
	KYID5iFn4xSv5Qw0UAiQKLIdipiHbkflfRF+D45FBLzf4u0a8T3FBqXNtPqJH5zBo5H3LVOgVIa
	4yQQuGNBQzwzQ+80gr7fM1A=
X-Received: by 2002:a17:90b:3803:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-3903b9c95aamr1372765a91.0.1785874224258;
        Tue, 04 Aug 2026 13:10:24 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903927db6esm380454a91.10.2026.08.04.13.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:10:23 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>,
	Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2] MAINTAINERS: update Traditional Chinese documentation maintainers
Date: Wed,  5 Aug 2026 04:10:12 +0800
Message-ID: <20260804201012.110713-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The zh_TW translation has been unmaintained for about two years: the
listed maintainer has been unreachable, and because no active
maintainer was listed, get_maintainer.pl did not point contributors at
anyone who could actually pick up a patch. My own zh_TW patch sat on
the list for five weeks for exactly that reason.

Following the discussion in [1] and the plan in [2], list the people
who have stepped up to carry zh_TW forward, with a shift in focus
towards Taiwanese Mandarin terminology rather than a plain
simplified-to-traditional conversion.

Move Hu Haowen to CREDITS and drop his personal repository links,
which are no longer reachable. The current translation is built on his
work, but MAINTAINERS is a list of who to contact, and the listed
address has not answered zh_TW mail for about two years, which is what
made zh_TW hard to contribute to in the first place.

zh_TW stays a separate entry and is maintained separately from zh_CN;
the two may share a tree for pull requests, but the review and
terminology work is independent.

[1] https://lore.kernel.org/linux-doc/<20260603082531.263115-1-chenyou910331@gmail.com>/
[2] https://lore.kernel.org/linux-doc/<amcZ5SI3-Hzw4HkJ@wyuan.org>/

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
Changes in v2:
 - Drop Hu Haowen's M: entry (Jonathan Corbet); a CREDITS patch will
   follow separately.
 - Move the division of responsibilities below --- as suggested by
   Weijie: it will drift over time, and a commit message is the one
   place it cannot be updated.
 - Collected Weijie's Acked-by.

Current split of work, for the record rather than for the git history:

  Chen-Yu Yeh   - translation and zh_TW terminology decisions
  Weijie Yuan   - miscellaneous matters, list monitoring, status reports
  Dongliang Mu  - review

The address in the CREDITS entry is the one Hu Haowen asked to be
listed under in [3].

[3] https://lore.kernel.org/linux-doc/20260220160201.41149-1-srcres258@furdevs.cn/

 CREDITS     | 4 ++++
 MAINTAINERS | 6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index 91c51c14e993..3866480db6aa 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1817,6 +1817,10 @@ S: Am Strand 5
 S: D-19063 Schwerin
 S: Germany
 
+N: Haowen Hu
+E: srcres258@furdevs.cn
+D: Traditional Chinese (zh_TW) documentation translation and maintenance
+
 N: Jan Hubicka
 E: hubicka@freesoft.cz
 E: hubicka@suse.cz
diff --git a/MAINTAINERS b/MAINTAINERS
index 2f9472c1a090..1f7e783023a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27460,10 +27460,10 @@ F:	kernel/trace/trace_osnoise.c
 F:	kernel/trace/trace_sched_wakeup.c
 
 TRADITIONAL CHINESE DOCUMENTATION
-M:	Hu Haowen <2023002089@link.tyut.edu.cn>
+M:	Chen-Yu Yeh <chenyou910331@gmail.com>
+M:	Weijie Yuan <wy@wyuan.org>
+M:	Dongliang Mu <dzm91@hust.edu.cn>
 S:	Maintained
-W:	https://github.com/srcres258/linux-doc
-T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
 F:	Documentation/translations/zh_TW/
 
 TRIGGER SOURCE
-- 
2.43.0

