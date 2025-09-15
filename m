Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4BE2EA740
	for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757924396; cv=none; b=Oauj2vpwQu49qRlN5blercWrtcl5/RGQ1VMpBZUebVq/0v9MHmyVaTiYBVdJcz2/zx/4MV+jLhX8vTToOGmMb6emtl/N6D4QJGU7J4Cl9jKd5UiA2zkLdP1/u+hWx7Bmr8X7RKNkOWJzaeO8YRKsmH0Z6J3iDVmZI47XRGQLwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757924396; c=relaxed/simple;
	bh=Dz8aa4kS7lSfCPjfsAQ272A7eZDZqhkqJwixqtO8eVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2ML/wICGkttlHZElWzf95gSabv14Mzqp89RjbXMF+2Pql5GsVNiyvy45miQ/I/QESGWQULDTlodYcXpdrSnRlQB5hufp6aFtz1/ugAdf31SnaAmezkiOO8KjgJEwzVD7czY9qNWyreU6R7F4h7qp3Os9tmSh1PpmDKzJ29BUC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyTQuT9I; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyTQuT9I"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77264a94031so2810365b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757924394; x=1758529194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCYYREeHHqW+dHHJ3sW/tx0z/7PT7VOYKqF3xiPJ7aY=;
        b=XyTQuT9IH8rO6Ltz36QRLWLVEfJxo6n5zj9emUAOcYeipZ5DA8R6vi7ouwn/m7jBkO
         Agynq9YoFRyuYjMo7bJ3qlg5AdHlfM1TAMT/57DNY0bmWmqdlSN+q8noREz3ai7gROyb
         pHXOOyEFp/VP3Hb7JmuFtmgovsHULub3Onhl3+RyVD1IqKKC52UHc2zBwxl4s3CwG9i5
         0hD/sSBW6IiyFpL6YG7PuwRQGMhCXH/RX5l0shyWc5Txd0CpVQX4bn29DpUMK4sNTxyg
         TYHmGcKwzu3PfEJdnMxPcxGZFhj4iG+bmS/hvzu9rXtbOcRUBgCXQ38tKSxXfoLgbvFL
         E9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757924394; x=1758529194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCYYREeHHqW+dHHJ3sW/tx0z/7PT7VOYKqF3xiPJ7aY=;
        b=XD491c/0YfUP+7PSwN5eA4LdyT44NLl84qK1W6MBrWtl+Q34Ezef0QVpAAvLEKj+3j
         RorrzqfwHfSU2lMWOMozrIpJHnhYfagTtR7jPnBf4KLxbSUJ3Ecj8O8pY5qIHpMWBsdo
         ATjV4/RZqsQeKxA6M6Ead6R1NUkR/Z+3dJa299btY5PwwfE+GXfzcqIau7LURhmfx4b4
         r+/7BoAA9Xz5vqhvS6FA+M/4FLRmOVSqqv1WuvVQ1auTWNbHRFRln9eKzSVpUtfl+w1/
         r9/HzwL+8ztKqkdc+h6i8J3IXhlpJrwN2EE4UPfcwMPG1q6OU9l1Qv2t9gzwZ87cHmHQ
         f1PQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2+Do1AyVBn/HSdkDBDl1UZRCD18X5sU6pWUyTExjuhkpJHOtrP/ZCfXSJLJRGn6I0nMxQKsHNzCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdWDq3zxrXBpknJw/d1gMYoz1fBZsFRqyKMuAb/sqUKOotus1
	Qpc/DiBl+IK1kOLPMLCVUe7UlCcmGw6hbOSzBZCKvXhsdl2LEtvI6sdO
X-Gm-Gg: ASbGncvHwWfQ9qy44vQVbY75NviIj+u9p7J98qd28LSvFSRpq3lR7dpzSnvHigoHrbl
	pDkbS0FHogkz2tBy7UscvUa8e+IdYXIFfQLFjF36j7aZg2gXIVVrFHq1QgH3X6KV59/iLRVWA5c
	bQ+IoKLZEf+455MDu5wdwUJDiTEgX++NFNeP7KwtDCVwpyef+LJbhNIFAPFi9u0bGNqbhxy2CmR
	9CiLv1UjdfAhZA82iHGj6R8pr3fxPRLu3Z5N9v/lpBSgIHt1BQ4+n1RZGNE5A24PUdSZjJ3814Q
	9iWv5ejztgzjtwvOlpnutYgk1p2sLFzLPUAEFM0B8fT3BX/jG4soB9kq1v2MFdqkBiFkUeuElGe
	FfHR4nWUPxoGXxCkwYK6T6Z3uOw==
X-Google-Smtp-Source: AGHT+IFBi6gISS0cUFo8fw2LEFLyNg67s8phKuzRYUMqcuMHblwEHM8uZZ8DTf1CeFNCn5jrnCBDzQ==
X-Received: by 2002:a17:902:f64f:b0:250:999f:31c6 with SMTP id d9443c01a7336-25d26d4d96emr124838495ad.32.1757924394240;
        Mon, 15 Sep 2025 01:19:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-263bb2ef614sm42899955ad.150.2025.09.15.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:19:52 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 47EE841F3D7C; Mon, 15 Sep 2025 15:19:48 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	"Bagas Sanjaya" <bagasdotme@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrea Righi <arighi@nvidia.com>,
	Johannes Bechberger <me@mostlynerdless.de>,
	Changwoo Min <changwoo@igalia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jake Rice <jake@jakerice.dev>,
	Cengiz Can <cengiz@kernel.wtf>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>
Subject: [PATCH v2 3/4] Documentation: cgroup-v2: Automatically-generate toctree
Date: Mon, 15 Sep 2025 15:19:26 +0700
Message-ID: <20250915081942.25077-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915081942.25077-1-bagasdotme@gmail.com>
References: <20250915081942.25077-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=bagasdotme@gmail.com; h=from:subject; bh=Dz8aa4kS7lSfCPjfsAQ272A7eZDZqhkqJwixqtO8eVY=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnHT+c9PbFiSrDwqXnb/q1dumP7k4Q9bnvYpjw96HXp6 PRYI003n45SFgYxLgZZMUWWSYl8Tad3GYlcaF/rCDOHlQlkCAMXpwBMJFmMkeHvg4unUry5H3vb vNa5VOz34Nq38gtS2fIau1dU7lCYPvMSwz+9A2c2T+tre24rUPZHmPGfh0vdDr2t1nvUmqT9JNh du3gA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Add automatically-generated toctree for htmldocs readers using
contents:: directive.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index fe8ac5aa0f1ec9..4bad0a18c243f3 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -13,6 +13,8 @@ of cgroup including core and specific controller behaviors.  All
 future changes must be reflected in this document.  Documentation for
 v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgroup-v1>`.
 
+.. contents::
+
 .. CONTENTS
 
    1. Introduction
-- 
An old man doll... just what I always wanted! - Clara

