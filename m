Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83453126CD
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346851; cv=none; b=EJSFR6loANnCS5y6ehFaB4BlZET36KaxzWYPxUIMfnwnZV2XlR4SWUZAMMLnbdIQ4TVgCLJGsFvCWeaEoz2iLk7md+nWh7fvxnW5ZKXpQkd7IfI1wY9Z8dX29aifpoOpA+7vCwGrQ4onzHSlfbSyE8idv8jE6xZo6mfaq1g0tTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346851; c=relaxed/simple;
	bh=6EDEoQ8G1aeH7k2mK0kTG53ah50zIFSO89NPX7Nmkvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5Vj8agp2lneqRexvzt8Qmlxp/NdI46YTudhQ3lLzVs1ydjKlwnEHHSjlz4ds5JdoM+YIOh+TF+5cmIxAGEW72pzkSdgjjHFr+Mx0tuKToOpAM2+i+79LdSoO2qNo1N0CJjPZHLODScUHeY9SBRqqylUyufyRchWRbvcVJLPyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKshOQ/J; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKshOQ/J"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-43323420387so13286795ab.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 04:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762346849; x=1762951649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK/gceny5PWDz/DbB/PatvWx/loVHzoFjA0SzuhB540=;
        b=JKshOQ/JDrbEox4T9HnfRkoDfdHAcnFavdKFquyWV8hIiW1L4HxmuQhs1tEuDln+ap
         C6S9wp6Qt3QNtREyLDIKHyWUgGuTdL56BrKSXkHE+rdT3almFN/Pi7VukOZUXI4MA28z
         17cPR+knlYUEqIY44bbb2bGwWRDHoAetkhY1pE1dc5CArQeYR2xYq+0jT/2m69AAwpFq
         gSemZTxPfqkiyoymxqDTSpHm23or73c7yrRcLMyFceQVKqWhkVudth2nGVhQ1w10/OcB
         QA+2vATthIjtF4gGBjjQtVyG5jTuCRpAaEl94rLY91SvRGTolofuq/AWEoUdgDWcGYAK
         QVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762346849; x=1762951649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jK/gceny5PWDz/DbB/PatvWx/loVHzoFjA0SzuhB540=;
        b=nujmrU756xX1fBC0glzLwX1Dwy3KeyFAvJqGaK+t7FsFblvCNrqnLt44RMQkCNccp5
         JZalv8q18pGuIYI/U38bF5enKnyZ8y6P5Gb9j0W99L0vcQlglujLV+/78Te89wjsmfUo
         lZOGQuRDLYzGRRe88t8v0n7IxXML/cDrpZaqI0xGC8T/E71O0Le4De+f4ZqnX4ZPOUq8
         ATJR1B/d4LvMUx6n0Hom1J8yqbmxNkHGHqULUUaibV51CLLIMlIu4hEYkti+VIsxTS59
         MpFhTbhxPUaMHUA+9OLGWhKNlnL/fAcmqxAXMUz5uwtqin2GxBptF5MO/ecUpdbzHn7u
         RM0g==
X-Forwarded-Encrypted: i=1; AJvYcCWdUnfdh28sFv8mvdL66ATkHfZfp5zBaDE/qZXfvzDoxQxN4Ms8j3Typg9U05byMjaPUEN9fM5BwEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzHYPvLRawy/EVTjzFYxaIkEb12IT/DT41zeFOhKVR1mFGZH7
	ibVWvIitkw+cEhkyHzDldKD+zoW/BoKKZinkxpdaWQDxlVUrJP5dH+IO
X-Gm-Gg: ASbGncv7FbH71bN+Jc7Bc5lkxseYs+7IhJetTquPGSa2oIdf0jYe3d/JtuRDemOaR4f
	AiPbmQ4skeaYEQvPhaioU+gIeV5B7/uhn7ZVsira7K3kv6AxwaeXmQUKJJDzHoy0sO4HOvZkm4H
	GN5BlICX0eL0zh5+TE1KwU71yDd3K55CaX8SId4MgyLWGgQigqLVfIImQwGcTGNXvoB6MEnIDKM
	40x89MOP7nmuFT9sMYLGjfefvb49ug0CYNG8PI/XUrr48VgPJ/nw1/LUo2+0j0IGE4YBKiTce11
	0Y/Z406A3d7pypL2+WP9HHqYpQAZa4fRx/3VBK0Po8wVfM7RlsCikJ9C5PndGlU6m8zeo5ub9OO
	NGHtLqiVlJT7P3T72aSr7Cuk7N/uuJSF0a2IqSgRwJ5Y8S3aAwsVkCL0uF8N5kC4dxbk7V0lGgh
	TDpM98fslLfqVBcHhF95tctw==
X-Google-Smtp-Source: AGHT+IEYO5OB88hN6eQ+81LrxblmPXtqVllaL/oYvPXtpbKz7v2GjUAoOuzLaXR4zN+F70sNBnHk1Q==
X-Received: by 2002:a05:6e02:12c5:b0:433:2711:c5cc with SMTP id e9e14a558f8ab-433407d953bmr38615765ab.32.1762346848847;
        Wed, 05 Nov 2025 04:47:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43335a91956sm25775835ab.6.2025.11.05.04.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:47:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 34F4C420A6A0; Wed, 05 Nov 2025 19:47:23 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux NVDIMM <nvdimm@lists.linux.dev>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: btt: Unwrap bit 31-30 nested table
Date: Wed,  5 Nov 2025 19:47:08 +0700
Message-ID: <20251105124707.44736-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=bagasdotme@gmail.com; h=from:subject; bh=6EDEoQ8G1aeH7k2mK0kTG53ah50zIFSO89NPX7Nmkvo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJncbjOS1rX8C5NtP+1iKPE08O1B3+IO8QazyyabDETDT VNk3B93lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCLGmQz/fbmqW3c0rN3CrZr3 786N+jzWK8md8lbFakq3zDX8JKq9GBn6gypMP+cZrJy/wNT8Wc4f13k3brrduMjYqyDROeWzdTU DAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Bit 31-30 usage table is already formatted as reST simple table, but it
is wrapped in literal code block instead. Unwrap it.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/nvdimm/btt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/nvdimm/btt.rst b/Documentation/driver-api/nvdimm/btt.rst
index 107395c042ae07..2d8269f834bd60 100644
--- a/Documentation/driver-api/nvdimm/btt.rst
+++ b/Documentation/driver-api/nvdimm/btt.rst
@@ -83,7 +83,7 @@ flags, and the remaining form the internal block number.
 ======== =============================================================
 Bit      Description
 ======== =============================================================
-31 - 30	 Error and Zero flags - Used in the following way::
+31 - 30	 Error and Zero flags - Used in the following way:
 
 	   == ==  ====================================================
 	   31 30  Description

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

