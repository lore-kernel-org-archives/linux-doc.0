Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD402367DF
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610995; cv=none; b=AFRHRUDdP54oCdDvnnSbN3WC0CDLlz9AZik7LGSDHd6qSPh8qLPG5mxQ6JP08zVUQO+zQt5dbP8RxEzo1NUQFyB6Srple1XIsHcwkIaQbN/EXWAuTPns+dWShtMjySK6gPezVbNL7vVDVL7AJUy62/s0KZkdyovaUXnhgZiUaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610995; c=relaxed/simple;
	bh=kDg7zJyqLivY4/l1H+Tca7EYUDHaYlB7/rBvbKgyZ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuvtnDkKVUy66bBUv4KZVx0xGapda2dvNgk6tmUE+8FdFFsOtuv3X2AEjUYwP2aT9m10TRbUcPmbn/q2mTNvPDYH8juiRTTOW2hNou7qUnULLG1LGCRe7Y8X16WaEST8Rp+e1I6OGUiUfgeePb4lGqC/tRa7ZQsUm8IqGBh3IwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsQIb6Yj; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsQIb6Yj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26d0fbe238bso4428935ad.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760610993; x=1761215793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U33wVBeZWn4QEaKPiFWLL976xCbviMDRkFuQmbH7L9U=;
        b=VsQIb6Yj8FLCGZX68MCUK+bz1vtGruDHyNFTq3EATe536a1mkMLiV3z+PCF5IXYCVO
         iIHD7OaATfQFtLlDA0JUFEnVqe+Lw9msXhAbVAEQP9IcXEEXbR2BRjO8rfCwB+jHjvoQ
         7HRB1GHEDhhbehoUQ2rSmqOb0zaA5cv3JUxJdq8KTqK991kIg3wbaSKsqmydwTUKcQih
         aS/iEDXbxEhZiiK3eDCHbmSX/uUH1x8MBOpwRiSEZMsR/sQ73t6iv93hmU4oiOzigWby
         FUlnqlf6hb5BUC81Anfd7bHIi3ByQenH1Qmu9GyjQatBIUwrryZn/GOKa9pzLKX9aboj
         sumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760610993; x=1761215793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U33wVBeZWn4QEaKPiFWLL976xCbviMDRkFuQmbH7L9U=;
        b=DDQOg5hYyxNr6VvpGPmtvlOL67sBOz5E2um/IK4UQdVb0az6vk8clWhcMReqK/MCUY
         NDjiVO64hOXgfWFjcGluy8W3J5e8AakYeaLdPLRFluZzmU9sZ3vnMK1gWuBeCVm5yReZ
         Idm2babWOHKmaZeeUb2iZIuWVFfMeC9Khd5PPUZTSYhXDyhro2XxfEfs3CCtu58UEnKS
         tbn0MCk8066L+xOirhrfCNuI+P4iRgFMngy3UpIm1MUpmYFrEZOUAo1/uxN1bm1964Cz
         69RWKMFjYr7hJV8iCvzM9AETY2W60pkveBLmKrraxXtJkYA4QERNm2rXP4GxPDV8CbBH
         OzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlBWfutHi7W394vAkcb3dncwX10zMoj4L404P6ZQjgqhA74DOl3Dw7o5czbpuGGO3M99UAFpvEr5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5moQhjm/4kuR3swasSQt41hbxGah9vsMffPBVrmOjTBY3/Bq2
	Kt5yORo5rvnWsDVNR02igEIH4JVoGTriBiImvU0mL/+z3YF3LDKhaNJLeXPZdHH9
X-Gm-Gg: ASbGncsif2IpijtZEYnha4Xhc7d0c6GN82XXO7I5S3cu1dHnkruLsQAFZfAfwvHcaGP
	GmYzO8QtO83/MdsrVB8Dfkq7i9ZUbiKz/IjLq1OhC9w+ytExa4O1hxkgOUpAWvLJ7eFfkbWrISY
	HSnUvoXExuQvgleDjL3DOASYj0i60sg8wdREBQZvIc8bjxQSIpU0e8tE7EPWQz/ERr7Ax6uhPPp
	MzZQjJBhDahskmbQz9GhQwMU8U3scuRbRJIc8TvO+WjG2AF1lWGA2R/OFOaTqKiGScziUAbE8Ut
	IdRTporuEyTQAShIj+BXmuHKlgJCiwqFsxh+KjrCLnmjvOjRiJbNTQHD56jDVxQMFy9x0RmjMPn
	i5G2+s2ipeFlcJu5DBF1mIrJcRnXMDwFagwA2OJp4YGzXCZj+CyAGU9qaBO24cDCGSa7zfuPLzs
	QnZZg=
X-Google-Smtp-Source: AGHT+IHPctzgAiv32FrdsplWmXnwd78JIYIpOpAG4G8Yzyo/AqYrtvdElUpgeZ8mYl5/x0UlR89A2A==
X-Received: by 2002:a17:902:8a89:b0:27e:ec72:f67 with SMTP id d9443c01a7336-29027356abdmr297126485ad.6.1760610993115;
        Thu, 16 Oct 2025 03:36:33 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7de2fsm25351505ad.58.2025.10.16.03.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:36:32 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BA0E8400365D; Thu, 16 Oct 2025 17:36:29 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Serial <linux-serial@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Cengiz Can <cengiz@kernel.wtf>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Anselm=20Sch=C3=BCler?= <mail@anselmschueler.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] Documentation: sysrq: Rewrite /proc/sysrq-trigger usage
Date: Thu, 16 Oct 2025 17:36:10 +0700
Message-ID: <20251016103609.33897-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=bagasdotme@gmail.com; h=from:subject; bh=kDg7zJyqLivY4/l1H+Tca7EYUDHaYlB7/rBvbKgyZ1U=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkfTk76vLJPZ5VPQaZJ84M3Pv+FHGe95vrw2mjbi9/+7 3566a9b31HKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJtPsy/HdfpR/hI60s31Sv Ms+45Jrfs5XmP39O7TnOeW3XjtoVq68yMqyJj+FpUuG5c3rpztKcHjs2EU/rYxsFzj5L8Zm8p29 SFxMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

/proc/sysrq-trigger usage documentation (in "On all" section) states
that it is not recommended to write extra characters to it to avoid
undefined behavior, which is contradictive to previous sentence that
such characters are ignored. Also, in order to actually process them
(as a string), prepending it with underscore is required.

Rewrite the description.

Link: https://lore.kernel.org/lkml/7ca05672-dc20-413f-a923-f77ce0a9d307@anselmschueler.com/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  - Rewrite the whole "On all" section (Jon, Randy)

[1]: https://lore.kernel.org/linux-doc/20251008112409.33622-1-bagasdotme@gmail.com/

 Documentation/admin-guide/sysrq.rst | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 9c7aa817adc72d..6157d93e03a1e2 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -75,16 +75,13 @@ On other
 	submit a patch to be included in this section.
 
 On all
-	Write a single character to /proc/sysrq-trigger.
-	Only the first character is processed, the rest of the string is
-	ignored. However, it is not recommended to write any extra characters
-	as the behavior is undefined and might change in the future versions.
-	E.g.::
+	Write a single character to /proc/sysrq-trigger. E.g.::
 
 		echo t > /proc/sysrq-trigger
 
-	Alternatively, write multiple characters prepended by underscore.
-	This way, all characters will be processed. E.g.::
+	If a string (multiple characters) is written instead, only the
+	first character is processed unless the string is prepended by
+	an underscore, like::
 
 		echo _reisub > /proc/sysrq-trigger
 

base-commit: a1af37b935c73049c54cb1412cf0850212af420e
-- 
An old man doll... just what I always wanted! - Clara

