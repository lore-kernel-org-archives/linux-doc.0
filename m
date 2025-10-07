Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1E12E9EBE
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863367; cv=none; b=MzWGjB7sr5QeDrIHXCbe0L/Sf7Intxods+xGAnzrmT3gA3BFiNzDnWVSJxsEHkww1t8KsWN5ST5lN32QGbhNP27ihTjwJ1lH/dZO0s3PQ6vtcjGeFs3ZiXZUkpDfroxzwIYKDbLDFWjz0rlnQwtBmVhBTi1Q80wVsqtWAlUxPfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863367; c=relaxed/simple;
	bh=pSc7gPSIF4Ju9Vbb1RvH3FU3+BzuQdiE/nwuOb/8DcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRqq02uwWkGaGDyQsEeyLY4eGFlgErwt7GCsQ7npEivwh18YEkwBMtYctyh6yLTfqNVGhnEQtwgLcqmLT4Ed2eEcJzU1Sqrq8lmDFcgS/IJuH483cE2BeXZJsDJChS20wODxhqElzLtrm0bMkj19X/lNs7VtyOIZekJuqPXoHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHxmo1xV; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHxmo1xV"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so4336576a12.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863365; x=1760468165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWXmB+0eRU50OqdMozBO7Gp94A6Xe9er0qbuUMERDjM=;
        b=LHxmo1xVA7D/dIEE5rrb4+dUV+uU2OoocMEPzeNdE/WbjmeOW0KP9POgp+9E/aaHAE
         pnlvzoAYLF6DCNnkiRC5LIpcZzO/axt1ZGKmuCSvPcgnfAsiQPFTKzqfwBiVU1+j4aKf
         voAtXpVaoZFEf6xI9SJvvfTivMERMVn0uNi95IExgttkdGfjs9Mka0dJrkEoIU9yb6tb
         Y2ixev7OKy5yzOF416PK0NAdJ91dsS5nA4WFt57kCmleiQgzKUTV/HBe0gn1eGOtOK3q
         hOsD07mm9MYJ0qmCjMj+NtSKvxaZMHHdRKWwj7Ds63YfrpqW4hWhLizgruEliBj7RvL1
         XlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863365; x=1760468165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWXmB+0eRU50OqdMozBO7Gp94A6Xe9er0qbuUMERDjM=;
        b=vTgMQw6fkPf63iH4BJ2m+7yFjCl3ao7AOIs5uMIKvJZdS6kIZpQ8crkZIUCiyh3TUy
         2wYbiqa12Hqg0qRIUAv36laQtI1RWf9HwhWrYhTEX3oU6TWHqy1eAoY0SeOQ2j0bhsq8
         Iu8UmDZDvC+eZ6vjLPiBY+7jTZAAOCB4IOQqUW2ps8JCLoxWMDIKtLStUH5zL1+FXjjx
         A7benNRc1gNboRo0W3oOmjfZVm9O+IfXJ06ePwQcgZ8Rnq3VIaucr7uWIVf0g2//iVX2
         j8jtrtmQF6ACIEEThBM5d/eIALBTda/u7KQyZA5oloRkbY5aY8Rp0ZdFKRRb2QdgMIkH
         W9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUfPm7w3h7MeuNi7uoMJ5yCr3G4JHydnWwxesyDrIDPagtygsMqWTfTgtI4eEUoHJTWSRNNm72LZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRNjzOlPd2PK9+Dq50cZtNaYPFWgsdRMq7pLVGn3Jx4WdNiue
	+xyp8NwJHiFuPJNomFLZML9ArqIcsMp4zY7PrI9+AJ14Sux/ktLK6GVo
X-Gm-Gg: ASbGncumC5O4kNnqBZ6ooDW0bT8wOUje0XNH2hXitKppH4gg04sVsgqrR+Fv/sc2Bz1
	dK+4N1+UNQ4Tu2aszSC+reg0PM6qZLyoSytSllGWk026cYmqAbzCLVtgJ4i/rE9TMLteDgQMDTZ
	JrEXFqhwdCF2Yg0KHVUGW3eRrErlwPubpIB1y3E4gslUwPde0DBsFvQUa0FK7yMCyHIzDRdQ7Ro
	fSSPCEKXYv4v9/TFgSdInH2bKnioK/fuAAsv+WvHL/5vnrloUSm8Dezqagt7ZI/IfcIBumOo+ZP
	LZSYPFl6C74LX2c34ieMMPDBv5G31dEDUuWSjJXDJwokgFmokUHzu5gG230IUKCZ4rAtdqeLprB
	Oy9EfWRg1uq39xUZzcmyoRYBXWgjFr13COw21V6zCF8FI+arCeHbhzciDKeVCWpP/TA==
X-Google-Smtp-Source: AGHT+IGvYA4pseNCxAD0k16xn0xkIZT6WBhqKdCmXY+O/CgWIym5mkyzdw8u5N3F8B4gY3vtazxjYQ==
X-Received: by 2002:a17:902:d545:b0:28e:cc3a:371b with SMTP id d9443c01a7336-290272f8534mr9092315ad.57.1759863364543;
        Tue, 07 Oct 2025 11:56:04 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:56:04 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 6/8] Documentation/rtla: rename common_timerlat_options.rst
Date: Wed,  8 Oct 2025 00:24:55 +0530
Message-ID: <20251007185508.40908-7-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007185508.40908-1-krishnagopi487@gmail.com>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_timerlat_options.rst is intended to be included by other rtla
documents and is not meant to be built as a standalone document.

Rename common_timerlat_options.rst to common_timerlat_options.txt to
maintain consistency with other common_*.txt files and prevent Sphinx
from building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 ...{common_timerlat_options.rst => common_timerlat_options.txt} | 0
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/tools/rtla/{common_timerlat_options.rst => common_timerlat_options.txt} (100%)

diff --git a/Documentation/tools/rtla/common_timerlat_options.rst b/Documentation/tools/rtla/common_timerlat_options.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_options.rst
rename to Documentation/tools/rtla/common_timerlat_options.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 61b5b55be96e..f56fe546411b 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -25,7 +25,7 @@ occurrence. This tool uses the periodic information, and the
 OPTIONS
 =======
 
-.. include:: common_timerlat_options.rst
+.. include:: common_timerlat_options.txt
 
 .. include:: common_hist_options.txt
 
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index 6f09f30c74f0..32d33c792dcb 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -26,7 +26,7 @@ seem with the option **-T**.
 OPTIONS
 =======
 
-.. include:: common_timerlat_options.rst
+.. include:: common_timerlat_options.txt
 
 .. include:: common_top_options.rst
 
-- 
2.43.0

