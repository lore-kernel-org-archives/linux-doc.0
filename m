Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC83380FDA
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780075621; cv=none; b=Xs9LQnKPwh5DOrCIPF1sgfDW+RWK1JANIMca74kByhbNoVbFMcE4xeCFy1yQyZk0AawXoSq+RrHcWwcu4E+iZkb4n64fDfVllPkopu90mU7Sw0XZECgL5PYIgKKgteHdHpOQ4mHwI5rjpIq1L5uVFUl9HF3ds1s+/Dof1OzJLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780075621; c=relaxed/simple;
	bh=cCVHycNzXYBDTxfQ2k6hsJzjSVBYoRMvdaVRtzY/adw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVK4AueJti/BzSz5GUG0C1Jwys09OFXj2O77EYJxxAKabsbosi3Q75hVuZ5+N/yN54fTcaKFtE2JKDx/OlHxBTa4pV5IpwQ4ZxiDdawrCz/oE/02L6qsYEmXl82OFXK71Ea5w1wLYZVI7SbuC+cuDAep4uk8ZUJ7sNwdknCpkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL+2t3eQ; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL+2t3eQ"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304e83724bfso1653773eec.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780075618; x=1780680418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUW2sBne+Sxe0sHajD5BpUUqGczKXbh7gDG8g1//2Hc=;
        b=CL+2t3eQQhiSf6g3RuyuBvOPe4s11ifeKnmDLUZ5E9JmBg0uNWmldIiwcTJCtSp0L5
         AwpIVm2Uw3tIqPA6XbVTUtLkXl/2NmsfOSb+dqLbOIKaxZJOZu+AyTcWxaz0iGNtNrdn
         YXSk7/k8wfCss0ZfMprA8bJKIJnJpwqb7JkXw5mEctk7ZClUS+O2nFQmRhiAeWKx+Ks4
         WoIvg3XXTYL0olWGJCtzxMA9Z9K6tJ8OPXzCXQmxSzFzxTfMRzut+k79DL80WzjGLIGg
         p8SwAsJIk7g38D3fnbwljVMgMYSI5CHt4xvBBt+MNCaWHbY988QypmS/i1M+TAFfkrdk
         78Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075618; x=1780680418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUW2sBne+Sxe0sHajD5BpUUqGczKXbh7gDG8g1//2Hc=;
        b=D/icdf3zKivV8U/FvLPe5hqa0aHGEeZNiu3uls1XFT+7rbyYUV6GUUW3DjqPXc445a
         0y2HsEms4P3xhGLRDeTFXfRWj2A6D+FGhLi5UkHGpF8CoADd0TcZmdlhE4d8DvXZ5V8X
         Qvtq4kc9coxw9dnqD9RrxNYXRFxo2UrZqDPqSeWdfaJURR7nxn5ve8jbkb5MyFw4reaj
         SmybByU6N52xh80O/8idwWi7uFpckXfmdWb3qnL8Kzbd5VmE0m7PPoP1NnBiLfwyviGg
         KzQdvcNSqUPBiGRAyDryZR9wadO8ZN3hWtUshVC77szef7YUiXZjrFVRJvyJsVhoZv8Y
         nSFA==
X-Forwarded-Encrypted: i=1; AFNElJ8iWfC0ldc3RIawpY5EONJ1/9dkCXKIBwjv9sovFD6XTPaalKUbm7JlKLJ/qdhDiWLJmdIrtySZSmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YySqbnCrtKZcSE8sI0LuPegm2AR3HOiCHNR0hHqChnZVXjpw2uy
	Kxl8wyVWtq/7gb25s9lTBr8mFOT+eoSk04RjHDij/MC/31oPMN7jLghZ
X-Gm-Gg: Acq92OEZA/hSpIkmI/It5ljH35koGhHvMn1W2fXVt62hj9RxZ0M/SsIm2GQ4vVKmR6F
	AN8zhvZ+yfG1GBBF0jgChm27h+mKXTYxXphV1tZocs2S0QjXs+DfF6Fs1CjD5VxJDzE2ZngiOLY
	wPmcewGW9YBkk4a64xwBp9Ru/JdcLY7FyPpfO94vSbGRkiS2klW43gCMtqK9c0Vgno7+NUcVfdE
	Q3txLBuUxWUBRkF4EVNvnss+z9n2qUy4LQ34+y85du8EKo/JGWcqmr8NFAoUFtMpV+SSBDmbSsd
	X8Mn6sehXkn78jyeMmFZp5AL45RgznaEpSZafn7u3fFN2UNyu3TxRlh53I6IF0/K/AN3nWwvdND
	x3f2Mq0LiDdj0Kp/H+uXS5dSEYDgJmJRc2OMdmc1MpZosRimEdWlWuRk+JUS72cz8IWHAU5GxyU
	yCzDx3I6gA6UOlKUw/kgbFQJMJKuKdBsbR
X-Received: by 2002:a05:7301:580b:b0:304:5a9c:6479 with SMTP id 5a478bee46e88-304fa4ec8f6mr378329eec.9.1780075618178;
        Fri, 29 May 2026 10:26:58 -0700 (PDT)
Received: from zhanwei.. ([192.227.223.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d06asm1785614eec.14.2026.05.29.10.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:26:56 -0700 (PDT)
From: Zhan Wei <zhanwei919@gmail.com>
To: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: raag.jadav@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Wei <zhanwei919@gmail.com>
Subject: [PATCH v3] drm/xe/hwmon: document DG2 fan speed reporting quirk
Date: Sat, 30 May 2026 01:24:49 +0800
Message-ID: <20260529172449.41504-1-zhanwei919@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ahm680G_8mf_cjG9@black.igk.intel.com>
References: <ahm680G_8mf_cjG9@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On DG2 the driver always shows two fan channels, because the
FSC_READ_NUM_FANS command does not work on some cards. OEMs decide how
the fans map to tach channels, so two fans can share one tach line.
When that happens, the second channel reads 0 RPM even though the fan
is spinning.

Note this on the fan2_input ABI entry so the steady 0 RPM is not
mistaken for a driver bug.

Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
---
v3:
- Drop the dedicated Documentation/gpu/xe/xe_hwmon.rst doc and the
  index.rst hunk; add a short note under the fan2_input entry in the
  existing ABI doc instead, per Raag's feedback.
v2: https://lore.kernel.org/intel-xe/20260529135028.20763-1-zhanwei919@gmail.com/
- Drop the code change that reported a single fan on DG2; document the
  shared-tach behaviour instead, per review feedback on v1.
v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gmail.com/

 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 55ab45f669ac..0da739d9a816 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -251,6 +251,13 @@ Description:	RO. Fan 2 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
 
+		On DG2 the driver always shows two fan channels, because the
+		FSC_READ_NUM_FANS command does not work on some cards. OEMs
+		decide how the fans map to tach channels, so two fans can share
+		one tach line. When that happens, the second channel
+		reads 0 RPM even though the fan is spinning. This is normal, not
+		a bug.
+
 What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
 Date:		March 2025
 KernelVersion:	6.16
-- 
2.43.0

