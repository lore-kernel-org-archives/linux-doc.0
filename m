Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD5132117
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 04:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762229918; cv=none; b=S07EKXkyqFiS7RPyYkMrG9JMa3yNDKXj96la6dKQv54S7KVwX00aO4bjV+Xfr0tb2yXKyHa4MaCet3vlyLe2hYtwrv0TqfrwFym094iCB3BxBM4dCDk1rAoXthcda1PSqPPhnwm0T5XSYdMaxqV8pUTbvJzmKOgr2lJze7YJb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762229918; c=relaxed/simple;
	bh=PFisK2Y4v5ov4h0HXydag3IhkH/WZkWHxAtXqBYXpOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYpD25uKIMtTquCCqrRd62n7O6i6OcYaVIB0QRQu9QhwAf8ujb7ttkVW9pImdPqDyF+nu0n8ZuVCNqFoqBBOv7VvywZbonypfa4Cfpxyzzu4qJ8NmcC05536lJ5r39oOm+lZF197ixlC0OYttKKxhmGe4wOUo+C6fa+h9DQOWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1y4HDFG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1y4HDFG"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso1740661b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 20:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762229914; x=1762834714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yYFVSsxYLMJ5ZqN2sf5Eu8Pe3jUJShe4wJp81wRNCs=;
        b=Z1y4HDFG181YFbrIBi0yEkGOqwIuZF3FQC/oMFtCLLfpajvzUpImYIRHZoPvoMcTGs
         5raw/Bjh81+zFSdXUgLDT+bkXypxFf29+0NnwM1wOXGoAHmbUiWQ1Ux6m5QSsYaDADNE
         gO+JCGaWhWOKi/36arHKzlNyseWT+vdH4NnKVTW4bPfIJDP01UH44BgdS4lcfvrp9LXD
         +rY3OHPDoyD1VdWCsZ2dHCz2jDmF4pR/lagDbuVjmr7Ff3I5ZG5Tvn/N+w9PBadvePCg
         YsNAUgKfDEuEyfY/Q4jt1cEtbV67ncG0KiLuXExkYev5WNXdH6hD66QWkeQWHHf9dPMB
         aC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762229914; x=1762834714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yYFVSsxYLMJ5ZqN2sf5Eu8Pe3jUJShe4wJp81wRNCs=;
        b=sPKS7PisbCyj6Q3DzR+2iO2WRu1zTTm1ofBrew1wKQHWOV65tldIBG2/ZtjXUIOAe4
         mpJmjU//YhqJITv00ELqk88Un/498KjMR8MagiXUlfvrYLH6TzJKE+Iq5SXUDRvxFyZY
         gGAsJjvgyhKMoZ1nT/oaC9AcFrkwbAvbj+Fiyg/vPALkRXdoLLbOA1I0wEM1zEwT4MND
         BgAvxZY5hSIn023vSXSlW1W2dhRaYVJWku4s23xQdkqtRXJfdDiQa3PWb0GQzb+4nuqQ
         pahdvPGqSPpw+McXSSI3d015vcmWK3ChqarMxZMtyCPXgItn9+iuJShCcdnOAmGvksbZ
         Z01A==
X-Forwarded-Encrypted: i=1; AJvYcCVfUc6+TAUkYJ0lLCkqSngO5x6igApCwTt9QO4Lk6B1lLQJ5N0llxTuHXMF/8qHXehT05py/MImWi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBLbeGfREVyAuowtOBLoeq+yZADhm9QByb/apRMXBsl1Jd59k
	dErzwj2Nok4ub00R4W8zP+2aFmlr8g6Eju6lWN5DoOqApW/49pIFzsTN
X-Gm-Gg: ASbGnctE+B8wfDLDQgYn5BwyRjcO2J9RFeRrIoOwC0CR3NaKgRrCvrdzS8UAAXNZ9WR
	edXQTwW6sbNdnESahGalabdUHSKy0YlMw7ZLxFGuiDndJEM/Xcq0cKYzh0yokL5zEFPHfpAUo4U
	bPU7BRgy3n3gKgIFltJbveWHROdkHBFlEuDwdOHGCcpZqgb6Ig1KMuLWpyHXm2PB5Lm8ohyYVql
	w04YRKskM0XrFznEhSC2Pq/c/vc9qRmNtm0itrQcr5m44jxL3AH6RStGRuQmxHSoxOMOQWY0Faa
	rzozkVnpa0dHaF4SU5rzsvGUlRNo2k4+yb9POC2NisoVIQoTV8j3X7eB06Uldy3HaTUYQuy3u43
	o1edUWWmcMYnZeH+WBFE11svqOPIKSdHZ9XXdrz0qlxn+xG2iw+6uM/PrFrTGKwt/+ZT6ss0DXK
	N4mJqAu+ytduY=
X-Google-Smtp-Source: AGHT+IFnp1rbVVecnteXZeZnIaqpgtoYIsbHg7fTb655l/TYkGbuBKFMYcDW4EKUbz2aSe6ujVbAQA==
X-Received: by 2002:a05:6300:2189:b0:342:b918:b475 with SMTP id adf61e73a8af0-348ca5653aemr21654681637.21.1762229913809;
        Mon, 03 Nov 2025 20:18:33 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2893b60sm786440a12.9.2025.11.03.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:18:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 29EDF420A775; Tue, 04 Nov 2025 11:18:21 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akshay Gupta <akshay.gupta@amd.com>,
	Srujana Challa <schalla@marvell.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [PATCH 3/3] Documentation: tps6594-pfsm: Fix macro cross-reference syntax
Date: Tue,  4 Nov 2025 11:18:12 +0700
Message-ID: <20251104041812.31402-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104041812.31402-1-bagasdotme@gmail.com>
References: <20251104041812.31402-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=bagasdotme@gmail.com; h=from:subject; bh=PFisK2Y4v5ov4h0HXydag3IhkH/WZkWHxAtXqBYXpOI=; b=kA0DAAoW9rmJSVVRTqMByyZiAGkJfQGiE5u8TzO035EqLG8fweYv0qclsCh5LSy93iEYfkkSg Yh1BAAWCgAdFiEEkmEOgsu6MhTQh61B9rmJSVVRTqMFAmkJfQEACgkQ9rmJSVVRTqNeNQD/UG1J 86SKDgQI1vIuozXIBhGa4FAyv3lasv4yjgDOEWkA/1SgEt6JTFU4EPlldzqPpBg2dgW8V7LI6KV uvpy6wwkK
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

C macro references are erroneously written using :c:macro:: (note the
double colon). This causes the references to be outputted as combination
of verbatim roles and italicized names instead.

Correct the syntax.

Fixes: dce548889650c1 ("Documentation: Add TI TPS6594 PFSM")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/misc-devices/tps6594-pfsm.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/misc-devices/tps6594-pfsm.rst b/Documentation/misc-devices/tps6594-pfsm.rst
index 4ada37ccdcbae8..5f17a4fd9579ea 100644
--- a/Documentation/misc-devices/tps6594-pfsm.rst
+++ b/Documentation/misc-devices/tps6594-pfsm.rst
@@ -39,28 +39,28 @@ include/uapi/linux/tps6594_pfsm.h
 Driver IOCTLs
 =============
 
-:c:macro::`PMIC_GOTO_STANDBY`
+:c:macro:`PMIC_GOTO_STANDBY`
 All device resources are powered down. The processor is off, and
 no voltage domains are energized.
 
-:c:macro::`PMIC_GOTO_LP_STANDBY`
+:c:macro:`PMIC_GOTO_LP_STANDBY`
 The digital and analog functions of the PMIC, which are not
 required to be always-on, are turned off (low-power).
 
-:c:macro::`PMIC_UPDATE_PGM`
+:c:macro:`PMIC_UPDATE_PGM`
 Triggers a firmware update.
 
-:c:macro::`PMIC_SET_ACTIVE_STATE`
+:c:macro:`PMIC_SET_ACTIVE_STATE`
 One of the operational modes.
 The PMICs are fully functional and supply power to all PDN loads.
 All voltage domains are energized in both MCU and Main processor
 sections.
 
-:c:macro::`PMIC_SET_MCU_ONLY_STATE`
+:c:macro:`PMIC_SET_MCU_ONLY_STATE`
 One of the operational modes.
 Only the power resources assigned to the MCU Safety Island are on.
 
-:c:macro::`PMIC_SET_RETENTION_STATE`
+:c:macro:`PMIC_SET_RETENTION_STATE`
 One of the operational modes.
 Depending on the triggers set, some DDR/GPIO voltage domains can
 remain energized, while all other domains are off to minimize
-- 
An old man doll... just what I always wanted! - Clara

