Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2522128B
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 03:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339117; cv=none; b=aDD64Uw4CLFB4gP887+cI2NRg3mhLRchEF3Gycw7djvJRBKzDCS+GuqqJsGjhaEV1yyWKVO7LlNkQx/dvLozEIkS+2tSDfXG+u5lm+NwHm/nR9NpoOaBA7Vq+yBJF7HtWZNiydUX/Yyd/r58Y4t2ukBA2hyPbo7Wk4xMNQ4aarI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339117; c=relaxed/simple;
	bh=lL6U5I7FTZTxDBO2M4GdSI/DZFROdk3+cfKw1PEXvSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsHlaVDtQI/bX0J/tGgpJsI/XO6CVRdy8lvvZ//ht4opiNiz/WmqXIsyXXkRCiAlN5KkyszpTHk9aCz1vINIWxGxpjElDF4OK1mgceA3hLoLH6PvICEdJKy4znpi/A/MWvK8y8p6j8p5VmNaNVLrfSgV7vis3AK73EYMvEnh90k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxrGzlwD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxrGzlwD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so7500079b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 19:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765339115; x=1765943915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLTayMZyzyEdMj1XSy9P+nrWbhCMNK8qp29uvdTLWjo=;
        b=RxrGzlwD6IvREt2rhLkRrFPlOntqzB8M7xMT8apQj5kAr5KCvEZubeBFp3JleASqXI
         WrgFM2JW6uNCA70nA6SK9S/ezHVPqmeCmTVv7xmRAl6ihkflVxL40ojwU8ha3C6n/PSy
         JCo1XVnoePvDrV5f0eL409Z1ZeZ5FrdxrXjaf4WBrkFRPogL/Ljr1vBrPs/+QB32u+S3
         gQmXxBiqR3MgxUBPTOAylKSXJ2xRe/JKhwQvAKuYil2wzEgRo7T/AjBlhZvmiyiaHKTz
         4c+Xzw5z+Wd/gMj5GFxod5GoKfg06cHzC/hTLZAqZ8HdgfcC/o8ycXF7soWGPN8LMX/t
         SMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339115; x=1765943915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eLTayMZyzyEdMj1XSy9P+nrWbhCMNK8qp29uvdTLWjo=;
        b=uEmoBpKz5xYCYwJmrcpf2d0lhL3vMrGThPzMpESFVER1qFPErn4FgwafKE7V0I9arG
         Aiiiqd6tlQ1WJMa7D04XdOu3LoXETHeBfDofiuKLywrCwCJQwrg51OHpSWcdgF6MvYQb
         kHRamw+7Z874VkJIBtIMP7DfATonNF1KcrmeoeuyEUtqdXXPKUSTeGgZ31uVWRPDYnpR
         K5jWx//xdq9gyurDcguzUIlwizEqTpvPGwxZxaq2XqXGWhQNmCS3IFwe0QrgoN+9M3Uw
         MGOmFUL57Rgz4FjublAsGe5fMCOGW6XXuYsFe/blOZvHQIkQ5krFkkZpXEmtO0Sqh3W2
         4n9w==
X-Forwarded-Encrypted: i=1; AJvYcCV8iPAA0G0kxUsIv/QWExlas6/cERqX2cYErA+hfVtQAKVl/B7I1eE7vfw8eo/QknOvrJCulycLAYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dl7GLxPhZsYPCmucBiTsnLwCvyfk+4KcLy7vKM6W1KYfcYas
	p9XUF/6TWmYil+zzc3PcaMIfE9wT2mQyd/k34DXgCPqcazwbHZ9N3ihh
X-Gm-Gg: ASbGnct1CDhyx6Q+9Ep7rfTvdbtpbv45rVqEq09YMen1+1uK33AYmYwXqRdnPAbP4ir
	BhbQcjMfn2DsH/MXCCbdtAMHE6/KVC4X1MOJZNvg6Be1wwbjYAJBZQLDFdqllXg7wiA+O8PfRg3
	AGAjVrmegXb9wQZ2mjJmC3ehD/BsIk5dxRFKo2sJhddxq8169zu/IeE9THdKYOxRdMXHhotrFXT
	AlZ3H/9Rsd5pGl6Ft+YBgfq4VuQZWnY845AFmCtMlAV+I9ci4TGXTgNQXi6GdPlgjL0FtHiFC9I
	gP8Mt6lJ43+QhvW6ikko5KzVG5ZMZeYbl9iPgzqDPngtrLngtWiVGjneIjrOxQutakXSkRj1JYj
	UD7E9J8jHnmvuPV637gVfB3hpQkh5Z5asjAT1HHBid4pLbRRi7DK64xe3dafyGhH39qZV1mhvwZ
	JN4k5Xs0CdOJCYhPJT6rU=
X-Google-Smtp-Source: AGHT+IFWwNwz9uWu0CC0l9ch1VCQs0lbE+eC1d/Np3AIjDbTK+dJEy21yqLxbctC7tQRmPjvP/pvxw==
X-Received: by 2002:a05:6a00:b8e:b0:7e8:43f5:bd19 with SMTP id d2e1a72fcca58-7f22fce6121mr912288b3a.46.1765339114883;
        Tue, 09 Dec 2025 19:58:34 -0800 (PST)
Received: from LilGuy ([2409:40c2:1295:13e8:41e8:60cd:6181:4fad])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7e29fb94c05sm17430658b3a.16.2025.12.09.19.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 19:58:34 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: rdunlap@infradead.org
Cc: bagasdotme@gmail.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david.hunter.linux@gmail.com,
	hpa@zytor.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	mingo@redhat.com,
	skhan@linuxfoundation.org,
	swarajgaikwad1925@gmail.com,
	tglx@linutronix.de,
	x86@kernel.org
Subject: [PATCH v3] Documentation: x86/boot: Fix malformed table in boot.rst
Date: Wed, 10 Dec 2025 09:28:14 +0000
Message-ID: <20251210092814.9986-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <438a873c-0ca8-43cf-b705-e224d5c57d05@infradead.org>
References: <438a873c-0ca8-43cf-b705-e224d5c57d05@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sphinx reports htmldocs warnings:

  Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
  Text in column margin in table line 2.

The table header defined the first column width as 2 characters ("=="),
which is too narrow for entries like "0x10" and "0x13". This caused the
text to spill into the margin, triggering a docutils parsing failure.

Fix it by extending the first column of assigned boot loader ID to 4
characters ("====") to fit the widest entries.

Build environment: Python 3.13.7 Sphinx 8.2.3 docutils 0.22.3

Changes in v3:
 - Minimized the diff to only change the table headers, preserving
   original indentation and body text, as suggested by Randy Dunlap.
 - No other changes

Changes in v2:
 - Dropped accidental whitespace changes (the second chunk in v1).
 - Simplified commit message as suggested by Bagas Sanjaya.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/arch/x86/boot.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 6d36ce86fd8e..18574f010d46 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -433,7 +433,7 @@ Protocol:	2.00+

   Assigned boot loader IDs:

-	== =======================================
+	==== =======================================
 	0x0  LILO
 	     (0x00 reserved for pre-2.00 bootloader)
 	0x1  Loadlin
@@ -456,7 +456,7 @@ Protocol:	2.00+
 	     <http://sebastian-plotz.blogspot.de>
 	0x12 OVMF UEFI virtualization stack
 	0x13 barebox
-	== =======================================
+	==== =======================================

   Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
--
2.52.0

