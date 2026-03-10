Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF45426ED3
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127801; cv=none; b=ZIXBI8Tl49C4Q3o0A9hnm4Ix94WcMWoqjDdLQ0yWZ3Q+zGrs0q4XkSV2eetLvegVd+Usdnv4jTtdUueMDyRlseQRkhIXlDfUlq84e7Iw+qaq+Q1pXlT0/NkJx7BjH4zCmUbFo0oSquIHQuQsvXCaFeBfWVTGLsdQOK0GBcxYvgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127801; c=relaxed/simple;
	bh=+kEIsEkNrgiMDln9QLi9kLSl7tnqi3h+peDwDxpuRsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNPPiXpqWFeQS33nRLUnHsBKngretaFgx7K0M/DVv+0JfN7Qx5R8NfKhSMqZDLoFirHdWLLoa0EpogMIOmpBkzyJD5dMC+xjVdpK3XTUfhuDVqCtegY7xpy73BrTdc+83Lf7LNaHRE/TYstdNT1E5kW1U3stnEV+9HOkkMAk8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABS1b5gB; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABS1b5gB"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be4781d2baso97481eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127799; x=1773732599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K/YC43JaMjg/lgU+h9WNDYLR6OqHnqHgs5VzidUdCY=;
        b=ABS1b5gBkufIbCd+Y3k/PdnZYG1ndnEGiHrSFMjIyGgsGGK5Oy6B7MRwWU7hoNzSgX
         xt3RCW3mB2UOnvmaE4jA5u7V8HwdmxaKb8Iq/U8aGRxAKHaK68kBENu0HgpdwY+sywUz
         Xv1SFAuEJ7IYMrdoQwkFWyx4PmgYPtWSYZSfH0BsDP9VT69v8LuNoiawKg+hkSuCKxak
         bMYh8ZE8U9VkCN8FHOog3KSNn4HCyjj4gxPpqMLsDbpQCGpOFNTvohfnbZj19Ed2xrak
         q9riO+SN/D/YjZCpXkTSE//5JTd1+DapFYVrM/D6K0w0fctN3LX2MFiSjdSXm+oj98zm
         vr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127799; x=1773732599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2K/YC43JaMjg/lgU+h9WNDYLR6OqHnqHgs5VzidUdCY=;
        b=lEXLbshk8cC/FhMZoddAulSNjapK4VOTmt68eDFXL2Sa2MWFXKW+5QYt1IFDk2aM50
         fCLwqBVqDyy9DYT6UEh6/vNj5xkgFJEd57SzSwCfFyhAic391QmXuHK4qw7cxcnohsdp
         1vm3w7eA4lw5VrX/Cso/IO+YzS5h7aIeTJbYBySYpvoNP8pgLWO1WS6tnb1R+XHBGQ+U
         lAJ8Q0lDMYVFnf958n7QFBdwIP6HGTXm//lI7QhexZc7qahkb5b4BYZGbZHSB4ew4wU6
         FDqkFC2V10ac8QVzaDFcFAmH+6TsBOOxqlF/yA1G/C8/iC1bGsFfBWpoW3G2kvL3ROKo
         wbGA==
X-Forwarded-Encrypted: i=1; AJvYcCXfQCZNTPPK63kpk8SOVEmPhNk+XnaBhyTbc0zcvL6Udh1zbgRTKJ5kbHK6ZpdxiPfsBoteertgnK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbd6etV1LNVKuWsmXk9HedW1FEbL7ABS3m/n7T0UkKIsjgD67u
	9/oTuXBvnz7G9usXz/WuSIDtONSoJpkvnLRmbShGjpMJLLHU2s0oLYTf
X-Gm-Gg: ATEYQzygNY6HsVo3WGH+ZcsAcezNnfkVCRjoRfxdegtuOCwPyumIfHWRdceH3bJZGNb
	k8n8LVIXapRoic0lVTUDpetkwH58SThXHFvK3nYMqQNDYuMvROT8dq244c4koLiapc+j5elnWUh
	JuHBEMbuw1LoDDpl3AOpPxAK5+0tw1y+FXiSMHRIhAyDytAM5Ghqlblu4dkZjIhdF5zYHajmE05
	z5nrUe1kc2zHLBaMYT6jGu5ghIOBCQc1ImpKUHxmoRX1GexABDtwjQhxVLrWHNqDNRe+fb/ilSZ
	lcNkywY0XgJ9a+yP7Aee66wz5AEgf8c10E60TBO8Z+LOO1xSUn1HqBmdtPCSIbJsLeFIdlhKByE
	DFOKGcibsYlhUdYj3FJdLNA0s30k33y3q5Jvb3UzdPdbvt6zKkgvhxmoN1sDwBc54jAFRj6QqxQ
	T1BTZoFT3qox4DcvbNx4BwouzCzLnDYbHuNi0NrAtsEZb1kICA3f+UOnSJOjlDyZPJ7aHeUbg/D
	F9I7Fj2Y8vL6f4=
X-Received: by 2002:a05:7300:a10c:b0:2be:b50:68fa with SMTP id 5a478bee46e88-2be4deb932bmr6181300eec.8.1773127798813;
        Tue, 10 Mar 2026 00:29:58 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be81209142sm721925eec.12.2026.03.10.00.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:29:58 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Richard Hughes <hughsient@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>
Subject: [PATCH v6 19/19] HID: hid-lenovo-go-s: Fix spelling mistake "configuratiion" -> "configuration"
Date: Tue, 10 Mar 2026 07:29:37 +0000
Message-ID: <20260310072937.3295875-20-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
References: <20260310072937.3295875-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.i.king@gmail.com>

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 8ffa25b20f9c..01c7bdd4fbe0 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1396,7 +1396,7 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 	ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev, &rgb_attr_group);
 	if (ret) {
 		dev_err_probe(&hdev->dev, ret,
-			      "Failed to create RGB configuratiion attributes\n");
+			      "Failed to create RGB configuration attributes\n");
 		return ret;
 	}
 
-- 
2.53.0

