Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E449311971
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302387; cv=none; b=XTEfc9RNo8xmYvVqMm9e25gj6yrqlh8fq/kyuVzkhx/6S8HqxtTYAHcKQGvzZ8H2N85DzmVLq+pWOBwr1QHF0be+UsbswyKZ3MMuCSGVmOhBTmmRQA+jCLddo7+UWgMF1SWbRmbXc9YjAteEuH1dqLW08CrSuBY2AGaXmCJRI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302387; c=relaxed/simple;
	bh=uyiLO+LNkEVTknh5PCD2nlZig9mEvwEHQFhgoM6Efq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L3pBetb9fih5QV1Ykyk67tICvbd3SzAg+RrFNfOW3/LNMTlGcYXZbQA9UNkuSzREQc9NBdlHZ/E0hfSeP/ThWwuXMhA4uxExKWU5i0qCKm0WOtxJTUOnIbRrn+JvvJLe7aBjfyIGcI5hhVeKd4TfkEdek7VVDcyLgQBNbP4Xyuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7yi6jXF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7yi6jXF"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b6ceba7c97eso1744250a12.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 03:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761302384; x=1761907184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLzt3nHwXvYmUXaWuT5xx9MwPLoAGs/1Oa1T6U/Qgwk=;
        b=Q7yi6jXFphbw4ew7tGhMrHo76Zi5fbGktMvFTMQQEo0qO8HmPZhd+N39g3T60LuXwb
         2oCS4WyJYsG6Sy4oNQfhSiSVRyxyfgiRbsoZ9blRRcYzuqzu+WhzPP6jlzVaNYU07hWa
         n3G0veYa4vschtn220bjCkzfkAxAgAU/j7UeffUBltIm/TjYipDCQNkkFw73fQkCJugD
         I1t0GqlzbXctB+uCvo/6scKrHtVSBvuc1LwjxWsMmO1/8mOzulg5SbJtIiNSRp5nvfen
         pwy20839BsmgTow1VmUP75UpnWB/AVdYBq0r1+eG56FEgZifGW3UV8EiOg0cAO5akYbg
         hYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302384; x=1761907184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLzt3nHwXvYmUXaWuT5xx9MwPLoAGs/1Oa1T6U/Qgwk=;
        b=AvO+jGKfjtjRAEY/Os7T+Hlddhar+IRNpunQQY6R52cCyKjxw7Wox4oNtTB8Sm2pb1
         g4/kV1dM/sXLvHZ82urPGpFQ2u6G4+iRu3xCgUqtKz2FVZlDiUn09kKkILEc4oUNsOPR
         X6JoeOcVbfrwTQUa7YPtadxPJyTugMtn2iR1caYPC41JBq1IbdPDG5RRBh0l5BRqbSwK
         q7lgJ7pglPdj9ntQWJL7co/9Y1tbJdP47rLwjf84d9jAPBv0AhB9Ii3B3aEZGMxH4FVS
         PMXD1xGC5BrhOrJzbbMFq4MW+L11uIb5bDbMW8vFabTu7AGmhM/8EeIqALL/YU3TNFwR
         h2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU//oKe2IeOyuDP7eQu3r52O3M9RGbYJxJdsHKmd8NlpqAxtypdQqgSKU0l7a9cxquoMjeoXsnTsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvzB0XU1vZNv1nP+8+VnaEdRDfaXtj83a2xox+DYy6swaQbPGM
	AsOg3s0OgvMeKPRRoI3e1XLI5DyTmkkwa5Df9Bsyvsi+ZY5oLYScnY4w
X-Gm-Gg: ASbGncufOlCBVq6fdhdqKOBRp3jxUulfE+0AzmHyCo2UFU0xypQnYv5a7nFtPEXRhtX
	W4d1nYTWNavsQW72yyoi35m7qThcx9RPBiVyBq+H6cRqQHz/t/0CjoiodzFlTAm+6BVgR5OqenU
	jWdrewuhjvCPGHakrdJkGeeCKXRUdN3LzPsgVQexe9XW0nY8VdkJU5V05763yr0WqC2PLJitDc2
	Wfq5SYB/t5cDApUSsJvIXGMcgHU7fAPbjKExqZ90V94ABn5Q+5N4AGgNC6tibSUtt7yv+S2Achx
	lmmdxeYLHsmmnNIxQD7CuT0HYyABWE0A5vSORD5M5sGIag8BZv/gm+TazvCOohwYRKins3DE07O
	tageWRhADTN5sJGduc1WmtzExms3Em2yVVPpXxmTLHhqkGPiYoPKL/aH8obg9cBSFmB4vR0ZoIm
	5/IIc3bjZdma8=
X-Google-Smtp-Source: AGHT+IE7bXnfWQJON3TLaojyE2i4thoKnt7jmM3h/3l0Kl0M5gviToItxxqZWN4WOizVmxSBsRm+Gw==
X-Received: by 2002:a17:903:2b06:b0:25c:b543:2da7 with SMTP id d9443c01a7336-290c9c93a96mr323148085ad.9.1761302384388;
        Fri, 24 Oct 2025 03:39:44 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de0fdc1sm51738365ad.48.2025.10.24.03.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:39:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 737A64206924; Fri, 24 Oct 2025 17:39:36 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Input Devices <linux-input@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Masaki Ota <masaki.ota@jp.alps.com>,
	George Anthony Vernon <contact@gvernon.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 0/2] hid-alps docs heading cleanup
Date: Fri, 24 Oct 2025 17:39:32 +0700
Message-ID: <20251024103934.20019-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=457; i=bagasdotme@gmail.com; h=from:subject; bh=uyiLO+LNkEVTknh5PCD2nlZig9mEvwEHQFhgoM6Efq8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm/ww7t3HvO+itrZPcHkfXXX7POv5J7Ivt/t3dNXtw95 cbLikZCHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZjIh2xGhgmngiZOvbv778Mf qt+c6xktz/Pc7ijtvij5rZxfJeSmLAcjw3xj+Vsf/t/RK96vft34pM2JBH3ug1OZyy742Blr3mf TZAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are two section headings cleanup patches for Alps HID documentation.
Enjoy!

Bagas Sanjaya (2):
  Documentation: hid-alps: Fix packet format section headings
  Documentation: hid-alps: Format DataByte* subsection headings

 Documentation/hid/hid-alps.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)


base-commit: 828aeac92901c1f31b51ae0b9d792b9af5bd3e27
-- 
An old man doll... just what I always wanted! - Clara

