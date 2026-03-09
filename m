Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208935838C
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042465; cv=none; b=I8gnS+7+nubQlvsjHXnpchlCLnw4XudJDA7t5nLjfXNnxK8p4YKxqnCmyrkdqi+ME9gf+6SGk/I8vvgWtuiODliqBtji9CHx4O8JBwf914azaJSZojn4jsHafUBYueg3uIKMrLBeMdhM349ZVocJCgGB39gZLNxODJBV7AIi5m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042465; c=relaxed/simple;
	bh=WqbiNJuAVkpgWVxqRObSy17QjhxTIJ++1zkW/vSLoV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWaV75rP3i5oLF2C9pib51RND1W/EdoLisWRSWFa6sR+R2FElhQj4cgN98JbQuhrdNTGM04Vjc0HoeRz3dGIX6NqpwGwerS+kIki8UZsEaVDp2XzlvHxndMu0pcQxS24kJyKX2waqbj9MSf74gZzV1wocx4RzOdKOXG0PreeZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htxhBuMY; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htxhBuMY"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82980945556so1690660b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773042464; x=1773647264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTLXyt3Yodz+EGh8qX8FwOWVOCUrcElDnQxjn74aWg0=;
        b=htxhBuMY/gmpScsZUAoOsnKD9jccGTDnIUWNM+bH9IBNmORjcskY1Uf7pb2Dqp6oqJ
         AIVH4H6bW3vaJEVD0iQXJEWnPz45fk2i4reOsRcaTqtsNHyffK+yPg8Y7RKpNtMWbOZ4
         Ou6Db+Arf3jsggMqibThWd0VnY4NLIG9K+HxQMP85pLmukmlXRO6U/xbVHUxxyYhHoRB
         Z4T6rVrlRRTwszj70NOkvz1LhOwcnOL4TDpUbz1fp0Yuqc9hBY6OBFtDuFVGtuZvoqhi
         NAqd4jEmlzLPJI8A/X97RtaxxVVoKpkrT93ILp7xO6v/QrqFlRRH3+XyM0p90gkAbNJ8
         sjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042464; x=1773647264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wTLXyt3Yodz+EGh8qX8FwOWVOCUrcElDnQxjn74aWg0=;
        b=UUgD8lXfQfOBMSH1NYmSb9gEZg84AI1bb0G1ZvW5x6Dp0l2bcvTb0ZzqZQCVhocfB2
         s4O0SFb3IqRIpAHqZnrbqrFktCamrZqahtiCg4VZj11WWADwUWMNA55Yoiukzr1Ej4E6
         wrMZ28JOuqa3iJ9rrRv++Usa7++s5VNB94ujnp/zO4huXGK20TW0Wb3kEryebPJ8h/gL
         ZHquBYAL02SPm0OC3iUj0DYD9zH/33vOYRnDeUDDGithAfWuBtJz5YLD2ULND1seqp/Q
         SUzXH5mXz8FI88Xc2Me+F7QTN9aENDAppCxkqRRkS54pg3jHLA3svTfhDCUFXu3nDEmk
         BiYQ==
X-Gm-Message-State: AOJu0Yy26NWH4puopqc5ctDLpEw4wN0EnBk5khdlq08an3hX+Wod2Yii
	8Hwe977cp1yva9f3zkhg/iorAhm9SIefonbZrmFNwBViCGvmsx2C5BRM
X-Gm-Gg: ATEYQzy19vvCJR/IfA5cdwrayV17SWk3mgczsxikNQEP7efzndg1EVvfCuo18u3wERU
	JnPSkqyUH/OjVxpmkVP0WsJjVg6KFvyz/2EXWYw5rG1rTJCKkhjgaiLVUwT3OEcYx0OllaXmI1g
	XT0GCSYTrt07GjiUbG++vOEZtCmwCAR3k6lPgcghNWcgXyeFEpIBoN5d/IdIbUuu/IzIfUXId50
	4+CQ4IzLzlpTl6aYLLZ4z6KwpXh2qXyGRqSJnTu2WKL6vAmIBETLYVJgUXQOYVDfp65lVmJshSE
	jG5Zfk3/B7fjSPyznCUGB/CU5xjdhi3gDpV04NUXFWdbs6wKNlXE+GTTxxga4oJsJofcgJnRHG1
	PKLeNmB9rwsqlpYZwbFvO+EhoVsRF7kUJszfgJjjCbPZeCGxdGgkCvhFg1HIth3fmbbyglXW5BM
	K87JJka0lmqQt+buK1we4nGSS/jYrxygN4fM0xX88WxV9JI3y1i+3ygZF62GRab+T0KgHXwXf0Z
	+MRWUJ27oxkDl8oC3FvWUZcHzvvt+Y=
X-Received: by 2002:a05:6a00:928a:b0:829:883c:1d5e with SMTP id d2e1a72fcca58-829a2f6c373mr8736495b3a.30.1773042463869;
        Mon, 09 Mar 2026 00:47:43 -0700 (PDT)
Received: from russ.ust.hk (ec2-13-114-166-128.ap-northeast-1.compute.amazonaws.com. [13.114.166.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636973sm11678394b3a.3.2026.03.09.00.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 00:47:43 -0700 (PDT)
From: Haoyang LIU <tttturtleruss@gmail.com>
To: tttturtleruss@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/docs/checktransupdate.py: fix all issues reported by pylint
Date: Mon,  9 Mar 2026 15:47:15 +0800
Message-ID: <20260309074716.10739-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308104135.9037-1-tttturtleruss@gmail.com>
References: <20260308104135.9037-1-tttturtleruss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes all issues reported by pylint, including:
1. Format issue in logging.
2. Variable name style issue.

Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
---
V1 -> V2: fix variable name style name and keep the format consistent with other logging format

 tools/docs/checktransupdate.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
index e894652369a5..cc07cda667fc 100755
--- a/tools/docs/checktransupdate.py
+++ b/tools/docs/checktransupdate.py
@@ -76,11 +76,11 @@ def get_origin_from_trans_smartly(origin_path, t_from_head):
     (2) Update the translation through commit HASH (TITLE)
     """
     # catch flag for 12-bit commit hash
-    HASH = r'([0-9a-f]{12})'
+    hash_re = r'([0-9a-f]{12})'
     # pattern 1: contains "update to commit HASH"
-    pat_update_to = re.compile(rf'update to commit {HASH}')
+    pat_update_to = re.compile(rf'update to commit {hash_re}')
     # pattern 2: contains "Update the translation through commit HASH"
-    pat_update_translation = re.compile(rf'Update the translation through commit {HASH}')
+    pat_update_translation = re.compile(rf'Update the translation through commit {hash_re}')
 
     origin_commit_hash = None
     for line in t_from_head["message"]:
@@ -131,7 +131,7 @@ def check_per_file(file_path):
     opath = get_origin_path(file_path)
 
     if not os.path.isfile(opath):
-        logging.error("Cannot find the origin path for {file_path}")
+        logging.error("Cannot find the origin path for %s", file_path)
         return
 
     o_from_head = get_latest_commit_from(opath, "HEAD")
-- 
2.53.0

