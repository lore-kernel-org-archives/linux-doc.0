Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645086;
	b=OYBF9WFT41rWQy5XGTXYFUmPA1ZIrcGJaete3WSCmxa5JkimnJNdwpVhTvOQKp9y7uen
	 sRwANNFPuR97ohvEYbJXTBvV1rIgkcwLSBBKI78mUkuJ/ORgoFSpUG8E0WDaAW1bdOS+4
	 7StVuduAuKOBqv5AetnPRja2yClIP8aN/LxW57Ha6sPCeAZ6U1/FTGjLpKF2U+8FH8HVH
	 x1dJbRYaFutsbUlDONLpwdnD1H80OxMU/zuMj1sTEevsQxqm6klyL9p7S8KWHg0h4sVLh
	 5DkabtxpIL7OJbiqE+Q4vj/sFUGk89xwpYoL9nDX58gxfHcS3503ZuEjjnge2HGPOBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
	b=vWUcLS4jkfXhNb8Ca/N4luVSV7gL1KseAVHUtQvP2hgaYLQ0kan4ELKAVnsDd5tF03IN
	 cO7Kxdlkr7Q9r4p81N8CDFAqJprmquuyhwSama+Wosx+p76SCbHE3W9BIbab/nnCvVIlZ
	 97Uv/SzAJmzj73L3r0mM4PQit5f2yGmmZT3NeA2Tw+zDfmhU62qu4xPGrLiWyuMnAFPJf
	 gMZOneIobzxYUJmtN9YCvR6RlhsvGta8vodouESicNWWnaS49OrHg49H5ujvmuiMKpKlg
	 79HEqIK0RV7rVdW8z7YRvKrZ8tW4uUwAxQ5DppNZsDGxjVvIulobJL/QCtKY0MDhmiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4C4hDru;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8051606A32D
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 22:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8051606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4C4hDru
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-385d8a00598so9370845eec.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645085; x=1796249885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
        b=d4C4hDruGezjryJjUXDGrcMNv91JTeaHoH02IBRRrhMTYsm+KdaIq8zPvV135GrEUc
         cvTs7SLLqIRI3xDB36dHNrwLjadHZcmthjeYZBAcbMxsjuMh6oR1Xuj7J8OhSDZxXLWh
         HRNsSiqMMhd1VVny4P3EaxuOdbqriGk/39ad7BTzpvIXsVMvfLzWWJ5nH4uow1MRDTeY
         UhRPjh+jgIiUaw8Au4cOkmXtrbFuYujQGXJAvddaXTjGjbNpXX2RlpIR0po5hxehRSXu
         Rl6cw/hPk0q9VfnwoiSJaYbhSkZwBtCc8ZoEGexB5piGnbQYaLNac+56G22AemftWcA+
         dLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645085; x=1796249885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
        b=1L1Xuka86KwsX9pyBJvq7+ENAJIDARGQnCUNvuA21rIUhHod5EJaLCtr3S2vcKBK0x
         p/BmTS3IOJFaRWDoY6EkAzPOkmSPo/yBtkc5TeLxWOMnNYwgKQrsGW1kSBbMTIFsMLo5
         I0+++ieU1IyjIsJyE/NiHQ7A7YlbMIcHEEfNWvcr4YlIVTjvLop8UN2WOBqeAQ+mXCJx
         OgDbQB1rMNoMSe5PNP/TecxtkggRjZ6WiVYe4e0fxTAHP9lkD1d9e7R7h4PKWSDIbnZu
         kP19KfS9YwFQON1e/iYfYN2YlEOU0CiA691etouczoVbFU0z5nUFBhHZdfrHg5S7F1uB
         Lh2Q==
X-Forwarded-Encrypted: i=1; AL+hErEmPvi+QKfOy2JAEzvHbaVqeSBlSlZ61Em+sNaAXwRstsrGF2l7+7VZ0dv1/ZB1/K2qZ7eISTz4zcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ye1uIfJrYXc8d/ssGHIrDRA8mNdiizmW4tJ3zZWNI0mDdIWkl
	+MTcUeorTFazIohMXTlHk6Pp1iPFOq9iBmykU65JJMgzx+JBEo97juoK
X-Gm-Gg: AZFdTZevgMR74vD2vNqaaupFSTAO9rp10iAn6/rwUCvlG+CKBNFnwzushE5r2SWdjeR
	oZFDF1WaLOi/tGECoH2HBRrmXEtX5QsvbgAq2GDWdEz8N+9DmoUvHSKLdL9hziIQnMltAQLxGLX
	rzTNvnqX/BvcXiKbXOSnwUGG3AfuqNe2i9232tghuzog9nBfmALpv0/uc26kqT6sUJW0STzNXQB
	iOUIgaBHDgXob4DhcyneJ7Now9ueGK+kh0DBYslinH36spyEA7XaXwEnVvcYweJcbx14L56gty3
	LpE4ZsR6/qSiivoDNTGDIp1AwZFtyPZmRLS7q5LqZ6fKLEzAM0NRLO3FZCs43hb+OWOle+KxKL0
	+AftNxM7/tcIdRVn9D3crdiNtluIrB+SlKrS3iNIHXEhQsPJZ+GpZbukZ4Grv5xijmkyl9+QcYb
	OKwTM4Lji+CCoqD1+oqT4V3155lvaUhcYXjhcXbU1HIMqMf5ENbEHFyPXGnQfRfFbVlfhVi1i96
	S35slO1gUEmZDQJe8VIep1b8/ljqPsxglOHLNRmOe+3jJAy574lH6kUqxvyJRdcJesBVeJF+Zkh
	FLfSk9yzuzDyADeBU8EBPA==
X-Received: by 2002:a05:7300:ce93:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-386bbfa6402mr7456394eec.32.1795645084664;
        Wed, 25 Nov 2026 14:18:04 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:04 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 1/3] docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
Date: Wed, 25 Nov 2026 22:17:56 +0000
Message-ID: <20261125221758.2535044-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125221758.2535044-1-takano32@gmail.com>
References: <20261125221758.2535044-1-takano32@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4e29dd3821df ("Documentation/ABI: Add new attribute for
mlxreg-io sysfs interfaces") added shutdown_unlock as a new attribute,
but sysfs-driver-mlxreg-io already described it in the October 2021
block.  The tree ended up with two entries for the same file, and with
two different defaults: the older one says "Default is 1", the newer
one says "Default value is 0".

Keep the entry that came first, which documents the behaviour in full
and carries the kernel version the attribute appeared in, and drop the
later copy.

Which default applies is a property of the board's CPLD, not of the
driver: mlxreg_io_attr_show() returns the register bit as it is.

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports shutdown_unlock twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
Changes in v2:
- The documents are fixed before the checker is added, so the tree
  does not gain warnings in the middle of the series.
- The internal MCU protocol_version entry points at the top-level
  attribute; v1 gave it the prefix of the removable controller's
  group, which made it name the same file as that entry.
- The checker keeps its warning for an entry without a file, counts
  lines rather than occurrences, and drops an unused loop key.

 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index f59461111221..00cff8965b22 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -741,18 +741,6 @@ Description:	This file, when set 1, indicates that access to protected
 
 		The file is read only.
 
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
-Date:		May 2025
-KernelVersion:	6.16
-Contact:	Vadim Pasternak <vadimp@nvidia.com>
-Description:	When ASICs are getting overheated, system protection
-		hardware mechanism enforces system reboot. After system
-		reboot ASICs come up in locked state. To unlock ASICs,
-		this file should be written 1
-		Default value is 0.
-
-		The file is read/write.
-
 What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
 Date:		May 2025
 KernelVersion:	6.16
-- 
2.53.0

