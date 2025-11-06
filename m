Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA1221DAD
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762414738; cv=none; b=adhhoBHGAXxcRDblhpbuFXGFWClK8I/4RSCY15vjRwIxXvh97anPXxPPoyIrZVWIva+UHy6Rxpsp8MZBx5OINtDnInxbSVNnmBQFXGLcIhW73TURPKdRr5ZbfqF+026pdQ4fueL+1R/2wi77d7lbt6HpfLagtT+08ZV83eGLLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762414738; c=relaxed/simple;
	bh=fHpHqdj6evMaMAwbOPs89dx0SybJWtU+E52RFwbkzc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDbHvuZ8W35i6XBvhVjr8MN1h4Yuo2ozGSIt9UwM6yLI/gqePmbwJ6UCDZ8wDs9cirCaBGHGHoLewbf/3VaMzmdx+BqB6SZpJxkbf6rM8MVhF5Pyis8M1BM6b1kD2MWdrb5xAQDH+da1DuNHtdHFVpgislqn+c2RO46movjXWCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHOgH7zG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHOgH7zG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29524abfba3so7096385ad.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 23:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762414736; x=1763019536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W74SW9CUtH8YSGxvzwDmnorAFynOYsju91d1AAA1bkk=;
        b=SHOgH7zGORtPieXbge6fT2x9yo/yJNVJLRJAXUWpp0OvoN63IqsX/zK4oLYoQNOWZI
         JCu+xwrKE0koUTb5vnLqYFGLhk4vAOnLusOwP2Qxv1a6Px6KqJWtS955MQYFnNkLnlbp
         Cm9IwyU4pTYAHgLKwVkJBmsPkg8z3bw0uEqlIzePyPh22qaHFnrGpiwsB9HVW1o+HR/f
         JUFNcfoMWslB07Myk3Zzi0kVuBi61mtsH92XRa1K2ommh7SBWTi+4v1Em4TrOryFfYeo
         QTN+sV+cYVxQBa4ftJz7lVDyCDfoecRMwMoECQCo/6oCUoxZdP89KW4lj+gEg6HWpicU
         SNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762414736; x=1763019536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W74SW9CUtH8YSGxvzwDmnorAFynOYsju91d1AAA1bkk=;
        b=X3Sa/eHYeQAzpHSVJ+oEcxy7/vvbOrReJLBgJQTjXMHkwVA79LsyMKZdE59PG2T/AD
         TQsGbe55bOK8U6otIrtmBLAcbbPfdOrLSnf7Cc99U6j/zPAx8HiV5PUN15cezB8XcqgT
         WyQcWly3Agy7V8J5DoF4Ud4SfPLyHbb6HQVquYUU9ZURVRUsdlAIYzCsHICsDcrJQd+Z
         8WOX1iPh3MjxiD6+W+ER1RWds6HebMZZHhXSA6xKtHnshPAX8favM+g/DoHFyjnaKWyZ
         seEJ+0v8knrhLOYufidSHoR+NOkp2MbsSfLmN14oT4GEY2+PPnLie+zON5v5ioE81ti/
         cK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUopONASsHb/6WDi2lcHlVQjDppcIYIK/sIk5mzbBcERFplQaOEOI5tXSd2yEtZIy2FIXPm2bf7YSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOuJUUz/SdjDacGNwQcglmqFdaVxOi+K0fwzWjScCaWboe+ZRQ
	nRzIW1BClScuBv/rFTUEmnHvbJ033g+wE0KdYMyd9FMXqJTS5Uu6OAfW
X-Gm-Gg: ASbGncvy+4br8EsqXHtJTx81HnMi/stWHHboctzRTEEu9MTjn3FCEqClBZ8N88NC406
	252mIpuIymv1Y64g8bGp1hWlTlirN1sgM0V056IIpAMH0m3uL0EtDlCot6OkrGqIGUr5ZpCD2TZ
	0ncSzotMQXqQIyGuUlmpGt2tBFokdd0f7yCVP45lzkIB0tW0J140Xr5t+PeVUA/8hKXcXwhbnc3
	ckwn2r74bdIava0kchHWIvRYFZR5lL76gpq2e9dScDRmrZ+SZVut9Fe7gzu/B/X/wFCZLSGTNbS
	1th2MWdHxn8vAwbkO778A9OpkrLyaGnw+a9wQ8bLcrElyQ5B76uA6XUEkfFiyMOw+cHInby8Q9a
	jaz58QiZVNAl//O8+Tw+jZ3J70ZPOcddywuTwL4g75xkuhWyp8ltmkn7FBDQtp4PeiuQ+i0OqXt
	xnp5DEiWD6tyw=
X-Google-Smtp-Source: AGHT+IH5By0meVnQ9qhOd0v1dNWouNpBeUnyg8cUDtnc/vnhavHu9EHhWNQzZaDdLMGKI0UHiqsGCA==
X-Received: by 2002:a17:902:e801:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2962ad88b6dmr93261795ad.31.1762414735847;
        Wed, 05 Nov 2025 23:38:55 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1eb7sm18451465ad.89.2025.11.05.23.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 23:38:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A3801420A685; Thu, 06 Nov 2025 14:38:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH 0/2] genpt documentation fixes
Date: Thu,  6 Nov 2025 14:38:43 +0700
Message-ID: <20251106073845.36445-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=746; i=bagasdotme@gmail.com; h=from:subject; bh=fHpHqdj6evMaMAwbOPs89dx0SybJWtU+E52RFwbkzc8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJk8/o+fmyZ3n3i9oCBhSdKKY9OONbWdFd38cSPf8ewvV X7JCduOdpSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAizXsZGc6KqrfvqfxneLHS h1PwzMVJTDdqr3x2jHx979X7y1p/Nukz/OHQnqrrrBAvvqldJ7MxP3qWXrHerku+jWuXTYwItOk OZAQA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are fixes for two htmldocs warnings in generic radix page table
documentation. The first one is reported in linux-next [1], and the
second one is also found when making htmldocs locally to reproduce the
former.

Enjoy!

[1]: https://lore.kernel.org/linux-next/20251106143925.578e411b@canb.auug.org.au/

Bagas Sanjaya (2):
  Documentation: genpt: Don't use code block marker before iommu_amdv1.c
    include listing
  iommupt: Describe @bitnr parameter

 Documentation/driver-api/generic_pt.rst | 2 +-
 drivers/iommu/generic_pt/pt_common.h    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)


base-commit: 75d9ef7cf1e694e5c0fb387be99f04acc7f864a4
-- 
An old man doll... just what I always wanted! - Clara

