Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369F421240
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185668; cv=none; b=T4pZn7HK/X9mMKj5zLZWDFho+6LqL/saBrAG9IPa1E5w54LzE0a2g9/0W9QoxA/tvnUeIU4txBH1kRIuuiiF7HFqdrbIZZb/Nxl9/ulO1M3+fFwJye33l5zaYp0Au3FqWGtw5tla/EzDb+/kgffwoIOXaJ2LHjL68I3HFUXhXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185668; c=relaxed/simple;
	bh=n6MwkDMMmdyC7Dq+zcQ57KcdXHon0jUo2EcFcUF/B/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7La8+5nbAdqQv4g72n65sD0Ep24AY6+xAjTGRFCiemzMMpYBaKZSvLqGjP6/Oh4ridUD6Zeo+YWwBhVD83Q3awHqhF3Z9FYynBS2qpNGd1ooyduRaFF8xJr1FFNgXvkFxBZD1d6tVoGliqzkjEEVAg8Lr2WedhLwWLmZAkLePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GgvcH/p5; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GgvcH/p5"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e25400so682001b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 10:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185666; x=1790790466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdnundYlcaGdSnMUNx2jzVtyM7k47JsxnQCk7S9RVjw=;
        b=GgvcH/p5346HEawsy0JGKsAHE70EAhAMYTxamZ9JMrvMarXvx7U5LPAwMT96RMHCRW
         zcL2DC3nk//tbPB+OrZ3wnVAN7oCa8R8qyM6HHn223G7TXTQbxeIj4WBN4mQCJTdatzX
         eDLYKhf12zepHgIYjqKbbRN2Tf7tn9IupLv3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185666; x=1790790466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdnundYlcaGdSnMUNx2jzVtyM7k47JsxnQCk7S9RVjw=;
        b=wCVIzfsB/F85vAeMVqejeizNfEEkoFZuP8GEAlGEC9taI+tSw1WBvpoBn8z0BTUSJ6
         bOFoOwbEOdieddMVPZAYf4TKB+TN+z/xN6q+CkL0ekpmsWv4nOLTjiqv4XvIvks4ANUL
         e9QF0traNf7XV7rvixLt8ZWQs9JAQ/5SpOBd43tmfRnI22CoqKOj5d7wrja4EtdgYIN1
         BVuPtnzCrhpVoyxrpE6qfTnrXUCmPf9NK8LON+WG8DuMuUvw2D8d/Q+uPtZNBow7y5pl
         2T3PpFlW+eshmtpKlD2p4WT/gNg2Szsky8RGvvT/OBiuEL/BbjXFOEZfdIYFN+Y7NyZh
         EVzQ==
X-Gm-Message-State: AFuF++mJtKxQf9vXR3+oJQLWSjE1YXM1LDSd3w2+4Hfp0SZpE1YL02b5
	3LHObWzAsD+GBjvVUAZlan+bU5FphDSkM3bQIAeUWYiQhurYDfnyzdE7a1pdABiPKg==
X-Gm-Gg: AYBFou1giV5+JBo3f4/rbj4KBmMb4YYDqN9cjwsrcP9ea7zj+zOB7fFkVanAncETvEs
	DWNKt+VSIF5lKWfHAm+lWWDryhB7fOqmNgtTRf3IXt14pjy0fAyGylPSV07rp3d6qngs7Peaboc
	jJNIE5fEEgOaUi0ZtYJbcoxaznJv5IfizBFwwQMZ/a6KORVEc6QSwc8z1vpVbXIiG1pDqUS9mk0
	gDMZZrsS7OtW9BdG/PDvMgtWDD72iJ6mjiC5EvftHMJuvQ21gNkPyRpH2XxnMyzmk9uAGrwoNsL
	XpFgbqTsyv89GLEB8qe8bKa/0gQG9YaIm+bnla95pLbt+RfrkL73/twoqARiLq+MBBqmteKPE4f
	CXMGvhaqRcIkCJgBXpVzkNXCHHF1aungqfET2QYwMdHuO+elV635GMqmkUJdLYh0JqsbJVzkolf
	eIT1Itn9wAO9yrGSa075/ImpMX1y5+C+uhyyF31rVNN6ZOGzv/ul4cMQCDCHbbw3FeFE6muTBhd
	e/Pu0AqVDdxrjN9OmVynmDqa2ojAD/q94Okyg==
X-Received: by 2002:a05:6a00:887:b0:87b:b799:370d with SMTP id d2e1a72fcca58-87d1a0b08d8mr2987166b3a.9.1790185666306;
        Wed, 23 Sep 2026 10:47:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-87d1cfbf839sm1796040b3a.13.2026.09.23.10.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:45 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 5/8] PM: runtime: Clarify ->runtime_idle() callback return value handling
Date: Wed, 23 Sep 2026 10:40:29 -0700
Message-ID: <20260923104031.v2.5.If6e26acac7770c65446dd0b81f891948abb38973@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This doc says "Negative error return codes are ignored by the PM core"
for ->runtime_idle(). This is misleading: any non-zero return value
(including negative error codes such as -EBUSY or -EAGAIN) tells the PM
core to abort automatic suspension of the device, which is commonly used
by subsystems to prevent immediate runtime suspend.

Clarify that unlike ->runtime_suspend() and ->runtime_resume(), the PM core
does not treat negative return values from ->runtime_idle() as a fatal
device error, and that any non-zero value stops the PM core from
suspending the device.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 Documentation/power/runtime_pm.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 114c4a872cb1..423287fce34a 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -158,9 +158,14 @@ suspending the device are satisfied) and to queue up a suspend request for the
 device in that case.  If there is no idle callback, or if the callback returns
 0, then the PM core will attempt to carry out a runtime suspend of the device,
 also respecting devices configured for autosuspend.  In essence this means a
-call to pm_runtime_autosuspend(). To prevent this (for example, if the callback
-routine has started a delayed suspend), the routine must return a non-zero
-value.  Negative error return codes are ignored by the PM core.
+call to pm_runtime_autosuspend().
+
+To prevent this suspension (for example, if the callback routine has scheduled
+a delayed suspend or determined the device cannot be idle), the routine must
+return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
+->runtime_suspend() and ->runtime_resume(), the PM core does not treat negative
+return codes from ->runtime_idle() as a fatal device error; any non-zero value
+simply stops the PM core from suspending the device.
 
 The helper functions provided by the PM core, described in `Section 4`_,
 guarantee that the following constraints are met with respect to runtime PM
-- 
2.56.0.rc1.310.g51773c2048-goog

