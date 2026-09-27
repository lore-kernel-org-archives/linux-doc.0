Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC043551C
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 18:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534273; cv=none; b=SzstOSSQHISn+szs1ix+vttJzFuXeydtSZF+Z7S6flUlzs2d9mxrVTKWeCnyPRLOoIA/efgggB9GCLE/5fu3kEHcVewLwXWk7uj1XQX6ptQt+au6qyDGBC/3DazftbLcKbGPxsfhQPETmu9LduL27vqajZd3Em4l1nmIifYpxps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534273; c=relaxed/simple;
	bh=ChgluWySqe5bLyRQ3mKdfYBHl/WntzxgAcSZijyK5i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjTvkXFX9t0B/SXylZh9KUfEoa6gaRyJCD7v6ECa4aZOAZ3JonBT8awy0CzIPPD/KDfMPUw9Z5vaZLoBIN2wkSNpt707o5o7QcbdAfoJJI7H3v5CjyIN9+Xw4/U20jqMDz2eP18Zgz05Iv609jMsTWchAsoV7f4b1BvuEt4Lkbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=JNM/ABNo; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="JNM/ABNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790534255; x=1790793455;
	bh=5HSCKuIUIJ7lPkEVZwbZxEfUkuwJEOoSOb+0kiyPIQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JNM/ABNo3YAqxkIZXcb6LMEAd5GgmXMDeUrgvFnpcP51O6f9OqJznhKdP6B+Ql8H5
	 GqAADOeMlRKy4DMzJ/zUW8uyfdYfUv2iS6B3Lbc4xl/ovnQhY3mHs2gRzusDZimhUT
	 bGVb1ZK0xrMG+v/fLvx9nTkiPL1HdA5QE8V+gIia+1uTu2Nz/agI3jo53k5zaZj63J
	 t0daNgSS6mTlXawFMLcUoieYRd8HGPhlsNmcgRPpeqL5TVEzLOLYBtkwJgu2oB4oFr
	 bksYxg/hiDFpz/RmyYeWP7kcO6Vq0CLLtYUNEgqLixo3jXT+wy21IynpktUrq2W5sR
	 1vIhptlXohHMg==
X-Pm-Submission-Id: 4htCq13sZcz1DFG3
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 3/5] hwmon: (aquacomputer_d5next) Validate incoming status reports
Date: Sun, 27 Sep 2026 21:37:21 +0300
Message-ID: <20260927183723.4078226-4-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927183723.4078226-1-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The raw-event callback runs before HID core pads a short report. Check
that the report is an input report and that its length matches the HID
report descriptor before decoding sensor fields. Otherwise a truncated
report can be read past its received data, and a feature report with the
same ID can be mistaken for sensor data.

Apply these checks to every device using the shared raw-event path and
check the report ID byte before updating the cache. Legacy devices keep
using their separate feature-report read path.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index b58f5b5c9..d4ed204ca 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1332,7 +1332,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	int i, j, sensor_value;
 	struct aqc_data *priv;
 
-	if (report->id != STATUS_REPORT_ID)
+	if (report->id != STATUS_REPORT_ID || report->type != HID_INPUT_REPORT ||
+	    size != hid_report_len(report) || data[0] != STATUS_REPORT_ID)
 		return 0;
 
 	priv = hid_get_drvdata(hdev);
