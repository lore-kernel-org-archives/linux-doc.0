Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9A738657D
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397931; cv=none; b=qGg3XcREO8yFg1ykDobX4GZkx1DmQXHk1lTMWxiTNEH9BjRD1Jqvne5qBjodFNlhKhvCgOKy5vh1uD8g03s/TCYgpqojpfdHzIM7hoWh6uUq9CZjZdF0QVWCzDKGn2uKOLGK2aCWZ4iQwhGY6esVw6f1YdLGx4WT1QUxtDYTXig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397931; c=relaxed/simple;
	bh=ARDNOtNdactOtEB8PJv9CFnzGzgvyH/kGKCxXuxvlWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxXnNEoFP3ZUeSK6vTgVd8SKwoojeUE4WvmslfzUzge/flpQxP06riywZBe9w0bYrlC9QJiOHzE+hFp0+ZIGe4ULpFUu4PsDIz1kaYQFP8+dOX6rrnWpetZDvfUqeY2ASYJG5KND7Kqg1V2poPqcEB3jffeEMaETIuw5sPoavbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jPKf8jiX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jPKf8jiX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1969620b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785397930; x=1786002730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBNxZ1KxnB0QqS9pltxPy4jCLVEpgT81N7jE3GWv+7E=;
        b=jPKf8jiXpPsetopsU5JLUPGqr979GSRLKdcSqoMToK/XCaLcdDrvcboDkpkVxc8cf3
         FcoGErAvAzbV3rOyuvFLPngzLiBZhRen5TzJ9eQHbqDQqYngyrmx5hw76V8RE1ThjxWp
         aymTI+1KOPrrAvTxzq5G63c1V7joSQFnau5xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397930; x=1786002730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBNxZ1KxnB0QqS9pltxPy4jCLVEpgT81N7jE3GWv+7E=;
        b=TFPwiP1KXLQ7Iw83iLwMBMNDhbZlIWwhmHza+6he0C0vDfu7WUyHvLycII+HgFTepN
         kK6iU6rNXPfNs4IiOA6wK3BJM/L2tqCGA+R2SM+WygyvElKF8VPyCru2o+97yJr2R6Mz
         t20bs7/3uIb6yr/Tp7cMU/0uEBvyKdubKo8o5NJO6BlKY6NH+NPDx2qdWRUthqZWyEbi
         eLLOAc6T515qa9aCuIyNd5eRH0zilHU9xbRpQxqe6zl0Cb3OMvB9c6Xm6l5kujB0P3Mu
         hOMLtA1iQaFSkEwwALtBfQif0C3nCU24izVbiwhgaHwHjm0RWGu8K73O7mjkDb2fwGGE
         U1wg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8XD2Scs0eGxGD7Zl16Gqo1v+H7ebKkua48tJObdgxmrM3S/Ll3KIPJiNqlwEkY5ueDnpzVstOVOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwtZAAygTOOPADY4b+YWmTOdzplPRtiCiPkBGe4mpJTD6CeCro
	Qu9JP+noh83DKjKTSwsYSIYgbRnSO+/TOT3QMhLm6rxqvB+p6SRV4kTZaPhG8QV6PQ==
X-Gm-Gg: AR+sD11m8V+TlsA4k8l5qe+xL1VarCf+aKAZxPVr9kxjP2KEBaHgJGLpNMkioqWcWf0
	bO5pL5ohGEEZA6rSLalgiBKMLp6r9x7kevZj/T0/uYJJ/j4c1RTt43GSmVyWvC7H3y7mZLVSdQU
	LdS/egCOIvdgAma8ukUsLEL0/giqKjV33LQY5SVxfZopq4PuoX7OFJ6pJhEaEYkzSU0mjnWr2+B
	gHfYXqYfZy2bKr/EYBCnypKwWR2xOA9KFPQihsmVwknupNk5TimqSDIKrNncuOGj+BxwwgKEQb1
	fcJ991K0OB6N3BH1n70q47GLIqh5A1RznXQoEPYZLr6gPs6aMsKyAHlDPgJGypkV0/jDez4uudt
	QisxXuPK17lmTHclMk7yiToJ88X9/+7TCSh8Cft5fcIpBqWrHEWY1OF8OC0bVYTxKcYp+X0Y5C5
	fmL+nfk3RRrtL1pBsLP9C9uymjAm5JCn9fK9/lJPuiT0FYif3b0ueaKECvLfcmjI4bFs6DkPLno
	JUkADNGgas/a8pTwu/1NYkWn37tsbWSUWKOIj/qWelJ9PCkyUWL
X-Received: by 2002:a05:6a00:1490:b0:847:94ba:f432 with SMTP id d2e1a72fcca58-84ebc1f4911mr1594838b3a.12.1785397929690;
        Thu, 30 Jul 2026 00:52:09 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:fd2f:da94:c3be:e16c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f9740sm2565278b3a.37.2026.07.30.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:52:08 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Haoqin Huang <haoqinhuang7@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] Documentation: zram: correct algo parameters configuration documentation
Date: Thu, 30 Jul 2026 16:51:46 +0900
Message-ID: <20260730075158.1339787-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zram has always reset all previously set parameters for the
given algorithm in comp_params_store().  Make documentation
more clear and explicitly state that all relevant/necessary
parameters should be set in one configuration write.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst | 34 ++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 2f6bbfd991fe..148b7cf3b924 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -109,14 +109,41 @@ path to the `dict` along with other parameters::
 	#pass path to pre-trained zstd dictionary
 	echo "algo=zstd dict=/etc/dictionary" > /sys/block/zram0/algorithm_params
 
+	#pass path to pre-trained zstd dictionary and compression level
+	echo "algo=zstd level=8 dict=/etc/dictionary" > \
+		/sys/block/zram0/algorithm_params
+
 	#same, but using algorithm priority
+	echo "algo=zstd priority=1" > /sys/block/zram0/recomp_algorithm
 	echo "priority=1 dict=/etc/dictionary" > \
 		/sys/block/zram0/algorithm_params
 
-	#pass path to pre-trained zstd dictionary and compression level
+Each write to `algorithm_params` replaces the entire set of parameters of
+the corresponding algorithm, parameters that are not listed in the write
+are reset to their default values.  Configure all of the parameters of an
+algorithm in one write::
+
+	#WRONG: the second write resets level back to its default value
+	echo "algo=zstd level=8" > /sys/block/zram0/algorithm_params
+	echo "algo=zstd dict=/etc/dictionary" > /sys/block/zram0/algorithm_params
+
+	#RIGHT
 	echo "algo=zstd level=8 dict=/etc/dictionary" > \
 		/sys/block/zram0/algorithm_params
 
+Select the compression algorithm before configuring its parameters.  The
+parameters of one algorithm are not necessarily valid for another one, so
+changing the algorithm of a particular priority resets that priority's
+parameters::
+
+	#WRONG: comp_algorithm write resets the previously configured level
+	echo "level=8" > /sys/block/zram0/algorithm_params
+	echo zstd > /sys/block/zram0/comp_algorithm
+
+	#RIGHT
+	echo zstd > /sys/block/zram0/comp_algorithm
+	echo "algo=zstd level=8" > /sys/block/zram0/algorithm_params
+
 Parameters are algorithm specific: not all algorithms support pre-trained
 dictionaries, not all algorithms support `level`. Furthermore, for certain
 algorithms `level` controls the compression level (the higher the value the
@@ -124,6 +151,11 @@ better the compression ratio, it even can take negatives values for some
 algorithms), for other algorithms `level` is acceleration level (the higher
 the value the lower the compression ratio).
 
+Parameters are handed over to the compression algorithm when the device is
+initialised, hence invalid parameters (or parameters that the selected
+algorithm does not support) are reported by the `disksize` write, and not
+by the `algorithm_params` write that has configured them.
+
 Set Disksize
 ============
 
-- 
2.55.0.571.g244d577d93-goog

