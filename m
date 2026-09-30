Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7998C369D5E
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 02:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736666; cv=none; b=Y+zG9bu35hYm3FjOrOtfL8zn6xInyWT+8p2ChgNO3mgnxRUadVhye8xK+I6MYZ97xaSvk2f9r8UoH0BFE48RyBOAoaX9XpVjxl+R4fK1bgVLMOY6Dteuk8uOrH+RGfe3isxshcLpC9E7Qg50VQfXRtHU0shZ4E2UKejbLrQfqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736666; c=relaxed/simple;
	bh=CEvQSVd9fcBWsFlrSUx992wsWzAaElAKnFEAug49VOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loGBPj7dBc77j0D7330IhGqtmpdhgxvDDGRjxWWJ3KGL5lafhpUASBQEU1jt0OwTieXoyNSOmY+YMoFlFOuZsKLJC4Caeepokx1W5OIpBstXWfwZbhBEBd6g2IxbAuLK/OmdpHGEBx5Rx0yNem494sxbth0BswEfiG9ubaTOGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GNJh7COz; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GNJh7COz"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-1473f265b82so1304165c88.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736663; x=1791341463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNuyZkHjXDfl54OwZ1Afy6yUiGFdxCu/3F6vGj9C4zU=;
        b=GNJh7COzmxgVm3qY+r/0zPSnndPN61/aT9TfEwN+/pEgDCvsol9t7lwl8Y709kNyxk
         HZaoM63szGD8salow2uU9iDE/9NXVAil4E6iFW61ZI5fJK95JFy6FbZRlmw9T3SSjJGJ
         bEy9f2pwFU92YC/GRrNkqSELhkEMsGTYWGUe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736663; x=1791341463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNuyZkHjXDfl54OwZ1Afy6yUiGFdxCu/3F6vGj9C4zU=;
        b=ResTiiKf3wpEruq4rlCel6Vf41oO5CAyRfIaWjoI5LVRxoqjE5GOW0FovvBAiZAhUg
         kp2vpRTyZhbfixI41rXnwSAdtPR+2/oP+TM/Yc9l5H/M2OkYDogctEGVKw3OFm7GxjLi
         tNRQMxvHeGJfEHDR0PXvCJv3K2PIscGJQxbym7/L5NQYzwHBn5oJ48qFsdVELB812tms
         NooS7bjw7+QyTP2O9jbdUAwywm7NRwKpEDWjoFvOMxr1mS+MN+DniLZHodogH5aA5lnE
         5QILdo1xktrnHysmd0VA9GiA7JpYl1cIgZp5EqklpTVzpeZB3XPZH4/aceRTwV0EN7yZ
         jOSA==
X-Forwarded-Encrypted: i=1; AKwUvByeeTtdh0/8IL5thynKIpWI8Z702qJ37CXYwhIPZsccb34fguOn1l+ZT4/xtop3tL5+CYP7ILCvyp4=@vger.kernel.org
X-Gm-Message-State: AFuF++nonzb65TNntY1q5oHh/RVXCrtDxcf3E6PGnIY+H3UtMG84wZvR
	4UHOM8upqat6Wd3Egylpj2qBYjvoy4j2qjVhacnBPGeGwb2wIaQnmOphEPylz5772Q==
X-Gm-Gg: AYBFou1bhIPukuZ03grjAdBaDT3rIF8DCNMDWfnFF5aE7HlbhwzWiOTb1hDNoG7OC6/
	HqRu+6ouqbwsvC5AkxyAajvJlV4speMEl3r+zG3dIodKmCnx6dTd0faq9mAeUEo+iPFOUF3EMHH
	BnKDTUI05KdMa6XUbBqWeWFOlc4RHkh/lNr0dC4J5r5RV1CTaaVqZFPLVxfcVqOzFJ/VC3csY9o
	kHFceFmDWN8QlQqJ1kkVE200bOT3Eo55NYI5Y3etjj0MpbNbEPX+U12oX3tN1D+wX765T/4X6Fi
	4Uh7LW/47JAET2zvSdsVLWSlRNoVqU2h5kxaNrWll8LyGR7OroZiSCK6/y5V0rZCzzIFvQed/Ed
	2aFdZm2spksElx6ExIrMVufFJQqSq8XArTOK7sQSKuJNOhBpW0mUZSXq5wRg1ee0xzYyeg2/NMF
	9sOq1hN2ej7T5R7awgcmkXP72z4c/eQaWrFMjPUNRG4C3Wfwr2oQRtScF3kkP76XRDnr/8B6s3l
	WyI3AGhBMJQho80NM47nXy75OrgVBrX6Zn1
X-Received: by 2002:a05:7022:28a:b0:145:152:b547 with SMTP id a92af1059eb24-14c9be70a84mr1517330c88.1.1790736663479;
        Tue, 29 Sep 2026 19:51:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14d08fb4f9fsm197376c88.11.2026.09.29.19.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:02 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 1/8] PM: runtime: Correct pm_runtime_autosuspend_expiration() doc
Date: Tue, 29 Sep 2026 19:49:49 -0700
Message-ID: <20260929194956.v3.1.Ifc8b2d1742729cc82f46220d85c6382fdee1fc8b@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930025044.104824-1-briannorris@chromium.org>
References: <20260930025044.104824-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "adjusted to be nonzero" comment may be a relic from when this API
previously used jiffies, although I'm not quite sure about that either.
In any case, it doesn't seem correct today.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v2)

Changes in v2:
* New in v2

 drivers/base/power/runtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index bb008dfe85a1..7e75f6d5df07 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -169,7 +169,7 @@ static void pm_runtime_cancel_pending(struct device *dev)
  * Compute the autosuspend-delay expiration time based on the device's
  * power.last_busy time.  If the delay has already expired or is disabled
  * (negative) or the power.use_autosuspend flag isn't set, return 0.
- * Otherwise return the expiration time in nanoseconds (adjusted to be nonzero).
+ * Otherwise return the expiration time in nanoseconds.
  *
  * This function may be called either with or without dev->power.lock held.
  * Either way it can be racy, since power.last_busy may be updated at any time.
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

