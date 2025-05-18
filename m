Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB10813B7AE
	for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747589230; cv=none; b=DBkr/R9roN1XiStDqPNWjye316Kt0B8TixnVwIDNjGacySiDd1o8FJ41lohMhR3/mbRs8XLOzWf6JtHc4ZAKa7EWM9mPO0mTddr6y0rofYnVxiMZ/HvQnzuEnPmZvyQrQhizEm7hfCJ/OwrHpnEFTu8d4YCr5dnr0WA8AvDmxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747589230; c=relaxed/simple;
	bh=wYwNdMqup5K61ab5E6q/L6jCv1nQ7oPMFSIfSYBNmug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Do48q3AGOpqYenk3QbRoRL5utjOjxbAXG0UBErLuX8SN+3792APusF2yfZ5IeyJ15OHc9ptSbu7lfWq4H+s8bPoZQHVXOOSDaAlcyNBjscvKyKMzxgmiD7OndPfGaWM6zund6TrONIlpQlAx2FaKsHr+Mx1TN8S5xfY7PrCba0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vkpxcuaz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vkpxcuaz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74068f95d9fso3258297b3a.0;
        Sun, 18 May 2025 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747589228; x=1748194028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DuBqh8mBXLKtIB6g1OSUZQ+vapfoeohr7AzN1Pz3UPY=;
        b=VkpxcuazQ0QrVFNfZ1QQCnI6pDnJiRYS3jfyPfZd0kP5VoDmG4i2j8GGSydk4U2MUS
         tm0Q/WyKeuD1vVXWLuWB0O/qOYAGfBGikRpqK7RLATNTCPZAy6PKQlE756ucUQtY9mn2
         6oeIByDVmjzvQdPdyIPFONOQredZqrTQoT9ogTfrqWBDCk6hDzbUWh50i6ZYu5cAQpyI
         rMqmG+jGfMf7wgNyzl3P1BO6VNRy8Uw2GjVpu2LL8rr5v4oh55vNuv9J7+AAAHKbt2dG
         +U/swA28YHDcKVK3XXXUOiXbQW7QdREbK/+KI0nW/PmYUcvCls0pn22Q3eQbImOHWpnT
         dcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747589228; x=1748194028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuBqh8mBXLKtIB6g1OSUZQ+vapfoeohr7AzN1Pz3UPY=;
        b=k4hWo5ZL0tmIX3ox5NOXWXv3T6qv8840oXOnZULbhoSeADjfgg/i6mzWyyiKx49ovf
         LovavL+RcTqVJmIpPp7tG0ZCgDy/2op8BztW08Y5b1+ivBieD8DCRPCkLmw3B5mXF4Tg
         PsczQo/Pj8SzUk4TJUF/ZMGMH2nqcnPMEwllNEoDAhsuz3nxro61l7JH9n0DYFYhdnfq
         64ZhHJiX3vObs23OeZMVOsPn7yiGg3o25icpaBRmCfTB3aa1ug6niw2i9XvZPrn4Lp59
         gIJr6zTINP/W5pDwz/ne3VnSqSnG+KiOpSs3HhkZ4W0exK8Fro+V3rZSfD26DjgUjOE2
         gFtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1v1nmFIUhNp13Gq3Gue4LGPVzQA2XkEoPSgaC1Hrz3ttP8hdkXUKpG3mjMqbngGFY1b2WI9Vo42s=@vger.kernel.org, AJvYcCV2qtCnppLaphYY4MUcyswvXBBbzWNrH0ZwFEUoJYQt8tgluQVs7Vk3+btWGrB99pT6hzqxYKkyNYUCAxvBOyqb8rOOUdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93ABi493voo1pOiiLUl2YeK9ZNbWuBTkAMQnQMRGl+UO6ACVF
	7ACN9AopSJjWIsGpDQTrUTTo19NZXW3bB99CA1bl77JDiH/FVy/+b3W7
X-Gm-Gg: ASbGncvt0zi0IUiU0CcNlO0PDreRL9Ef2QR4hBLR6ulIYSlQDaptyOcPzAxeVGFNfhT
	RhLEQzqgkpAsKvChfcmWYjPzUXFKWyxUBUR5YOCDsMabHERyulq0XIVhbHUw+q+QtZirQ3cZA58
	nrfXmLN7x/X1HMKOqVrPj+Kf2JsonRKrZDE7HRStUuUmfQ36RXaLJ9Ez90RMk9xKu0pdUIQBNSo
	w4MQe0Hosyc0JOX9vCMibS/gUfPdsem7tPwafsRK4jAW1JU8fhpGeYlbtdPCJ9nYSXM304fr+af
	0PE4rR6tMrpBm/ZwqtWImOuHSpOAcq+9mMSgVAQOvF6i32aoU3lkDscPCp0qCp4XberKeg==
X-Google-Smtp-Source: AGHT+IFNNL2ZkPVXamnUo67RubUrZoilCFAxx7XssIrL/c+rCV8VnyWqJCiDgHDRzbS3fZv4tO9rqw==
X-Received: by 2002:a05:6a00:23c8:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742acc8da94mr12587120b3a.4.1747589227834;
        Sun, 18 May 2025 10:27:07 -0700 (PDT)
Received: from dranzer.. ([49.36.184.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfaefsm4746793b3a.33.2025.05.18.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 10:27:07 -0700 (PDT)
From: 10sharmashivam@gmail.com
To: corbet@lwn.net
Cc: linux@leemhuis.info,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@vger.kernel.org,
	skhan@linuxfoundation.org,
	Shivam Sharma <10sharmashivam@gmail.com>
Subject: [PATCH] docs: admin-guide: fix typos in reporting-issues.rst
Date: Sun, 18 May 2025 17:26:58 +0000
Message-ID: <20250518172658.6983-1-10sharmashivam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivam Sharma <10sharmashivam@gmail.com>

Correct pin-point to pinpoint, If that the case to If that is the case,
and its only slightly modified to it's only slightly modified in
Documentation/admin-guide/reporting-issues.rst for proper spelling and grammar.

Signed-off-by: Shivam Sharma <10sharmashivam@gmail.com>
---
 Documentation/admin-guide/reporting-issues.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 2fd5a030235a..9a847506f6ec 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -41,7 +41,7 @@ If you are facing multiple issues with the Linux kernel at once, report each
 separately. While writing your report, include all information relevant to the
 issue, like the kernel and the distro used. In case of a regression, CC the
 regressions mailing list (regressions@lists.linux.dev) to your report. Also try
-to pin-point the culprit with a bisection; if you succeed, include its
+to pinpoint the culprit with a bisection; if you succeed, include its
 commit-id and CC everyone in the sign-off-by chain.
 
 Once the report is out, answer any questions that come up and help where you
@@ -206,7 +206,7 @@ Reporting issues only occurring in older kernel version lines
 This subsection is for you, if you tried the latest mainline kernel as outlined
 above, but failed to reproduce your issue there; at the same time you want to
 see the issue fixed in a still supported stable or longterm series or vendor
-kernels regularly rebased on those. If that the case, follow these steps:
+kernels regularly rebased on those. If that is the case, follow these steps:
 
  * Prepare yourself for the possibility that going through the next few steps
    might not get the issue solved in older releases: the fix might be too big
@@ -312,7 +312,7 @@ small modifications to a kernel based on a recent Linux version; that for
 example often holds true for the mainline kernels shipped by Debian GNU/Linux
 Sid or Fedora Rawhide. Some developers will also accept reports about issues
 with kernels from distributions shipping the latest stable kernel, as long as
-its only slightly modified; that for example is often the case for Arch Linux,
+it's only slightly modified; that for example is often the case for Arch Linux,
 regular Fedora releases, and openSUSE Tumbleweed. But keep in mind, you better
 want to use a mainline Linux and avoid using a stable kernel for this
 process, as outlined in the section 'Install a fresh kernel for testing' in more
-- 
2.43.0

