Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF9264FBD
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163982; cv=none; b=B6m/BhaS9q1Xjark9tbZPxOGmNptj0oqj1tY5AVTZ7VRxmQUk8hWTgHfZX2086WsvHMWAI+UmXJ01uOnKcKiglXRTLfhm4SJwXaVjoteP/Wv8KS7d44sCTZ32TbEhoJeqsbsm0LyDkM4pkXlJQ27X6WF22qUoi49+uJu1DcI39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163982; c=relaxed/simple;
	bh=zQQIdqNjp01QHJgc8T49LTRPfERcB9yikYEMSaVkSjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tBewarOVJXiCYWGsDN9lNu6fOwv+Bh20ycKjWf9G1G1g5+08r1BO3Bt1MyTeBPcGamj8A2ta7VE33SwOjNM/aSfS2zS7fr+WyUnh78a22Fvsqa1dwknrZPmBJeeM7clOuIXb1eXb8eeDMWlGXR4rBBhYczizna7bEa5z9Mxn39Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=C2JQleBV; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="C2JQleBV"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b2d6df99c5so294342385a.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 09:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766163979; x=1766768779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAi40aONYYS2GMctKaFM3RiE3Hz7UFN2kCA4YupvU+0=;
        b=C2JQleBVJLosFAHXA8ac2qKskwiMAd2osixkMjIdzwhExEtk2qafW9sCaeAC8+adSB
         1Ehfi8FyGBghq01DkqBq0sNKBIzK5UUj52LRJ4wYIRhligd0XOOFSTlvwis0RGjd7m9M
         wBfGXLWrCMZO/ReqKo/5hpoS+c+L40BzBoGRkAWUd3p53fArs47S/1rHxb6racojYtnB
         BtkNC84urIH1XirOT+Nyn4NlizXen18XI9gv5InOE2k99IKbEXLPQZUAOdc+oNYkDHs1
         f0+PhnkcSP9AVPTrKel7ZcxNIIPjUsYLS0mMrVo6C30pTTRMHJZiu0WPoRhgK0Tbt9pr
         3QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766163979; x=1766768779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAi40aONYYS2GMctKaFM3RiE3Hz7UFN2kCA4YupvU+0=;
        b=Bgo/+K5o8CrJGrYK99p6nIo5KFYTS7MIRbAydkq1m0bD2Ry8k+GjNCDfqHPyStHj83
         NCAZfoaXsCxXZ5IH9VtrDAWWFkfu01BEVoczox5ng86OAJeAbTDrKUMI5fqLRTv7P+TP
         o7j9yvgmTRETXqQP0O2iIrRrRLgY+G0jgKTWbsOTsRSXOUwuANN1RRUBxp89ooYb9kye
         YBdt4QKmabxYmEtOyy3NH8XZBvAzC5l5kGmCmE8w5fNiGO5+6ZUMXi2pHcHo1pzFJHkb
         CZ2itKR0hM6eFOjHHVcAWZTbNIIoTKh1ct6eiNVc+xxBVwLcqyahWYRbHiVK2zcJMf9Z
         Kd6w==
X-Gm-Message-State: AOJu0Yw5ujFtUNc4PfeoC05k2eLF0H44WGAcjIJxxDSpeqxZBdVUVOU+
	wp3D1cN4GKCjsTKR3XnmGYOVdm8OLE2uPudkpKwaO/Z0sAXrVImoZNDspvmyNTlLs9U=
X-Gm-Gg: AY/fxX4Bkl7rn0ZG8VC3CV4Joqt1m+DtlMi0keszTOHYkt53j6pD4F8oA0/2fULbHLl
	vy/Z8Mo+WABYuePa9hFDp1WiGND7veKsDX4dqUqm3qLQcdDidL8l2dPYWJHBq2Rzj/OYhXXewml
	heFcrsz8YyvnOmLi290BhA9VH0iFydcRjaPkhATsC/CG3jJ4vTRg3juPW5GL3NvLrVroHWOshGU
	2qGG3A6OZ4oo+8wyS9GqGoDKqNSGOUKvZYRVEgWXPBTxf1eiPZYE0aSzA+eJJ/fxIzPtMxWKXu2
	Nxqc03ldbC0BjdQpbfAa9T2SbOUBme1fRUnNGghqdPRFs0GbtirJckSxiPgeRSmfJL4H7yHk6wZ
	OWgR/roX+65B4x1cZUbWkwCyzttW+shdU+0ckGxpJF+D7FGe7vDFIILh0PF4BUOI/bTLqrqK8I/
	j08gvtZSKy8+GtHJUMb7S/ZiE9ovtpht6Njv4/NoGAtPAF98AUXesKV69TXEqkKSkx3Nziu7LBq
	w8=
X-Google-Smtp-Source: AGHT+IGhbIcoK3R4lJkefP2BB6CcSiL4xwMlpDlJgBcatznJIZP2btkmkXBd4Jhxo+7BWvO0haAtZA==
X-Received: by 2002:a05:620a:2945:b0:8a3:6c1f:31cb with SMTP id af79cd13be357-8c090029a91mr524959885a.26.1766163979186;
        Fri, 19 Dec 2025 09:06:19 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096787536sm223197185a.4.2025.12.19.09.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:06:18 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net,
	gourry@gourry.net,
	rakuram.e96@gmail.com,
	alucerop@amd.com
Subject: [PATCH v3 0/2] Documentation/driver-api/cxl: device hotplug
Date: Fri, 19 Dec 2025 12:05:36 -0500
Message-ID: <20251219170538.1675743-1-gourry@gourry.net>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some documentation on Linux expectations of platform software
configurations to support device hotplug.

Add some docs about general BIOS/EFI expectations regarding CXL devices
in general as a predicate.

Gregory Price (2):
  Documentation/driver-api/cxl: BIOS/EFI expectation update
  Documentation/driver-api/cxl: device hotplug section

 Documentation/driver-api/cxl/index.rst        |   1 +
 .../driver-api/cxl/platform/bios-and-efi.rst  |  23 ++++
 .../cxl/platform/device-hotplug.rst           | 130 ++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/platform/device-hotplug.rst

-- 
2.52.0

