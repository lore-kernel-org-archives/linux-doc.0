Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC06130F954
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762503206; cv=none; b=rkDxWvXkoJFOI9gKWGOUl/aFaKTTrUkT5NqJXws2Gu/vxeyfsXSAVaOVmcsdzzuhqBkBgwFW9KcPZuqb+zBvX6YWXvOEcS5HJ0EJ0iT4I7NllDC8YJJy8ka4VWtHuxR9jjiRQphC0J7C+YUe4zRyeuFCFrEa2zXkOo4cK+og7RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762503206; c=relaxed/simple;
	bh=L2WkKVq1YkpsdiT6yHvKw0l7RT+zYDKnfrxQFfdUrw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZCRyQVZXcabdId57fIroEZQOcwASUP9EWCd3QUtdcd3zxwV1j2k9uctpBHbj4k/41ShzIDvdLwz8qIPJ0zfzAWn6rxSrzPh7RNxyArdHcUBFBItIUpazIyWXP93VeYCoZ+U4VPQDguIO/qbuGnrlQAIqZ2PU0q63Lmmk3pQhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaxeFPhz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaxeFPhz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640b4a52950so719119a12.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 00:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762503203; x=1763108003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOIIVZmEuR4lMVP1407hIBpNtWT/l6DfS/U3dPctlwM=;
        b=NaxeFPhznr3qaL/YsC51SpApEyxbOCr4AKR0DlLu6SYd49Td/I3JFK2nU+Wa5BNU/I
         kqEHvSWZkXaZpXSuYmNIuLI2Bh37i/t0luSL2+D0MKLnS+waiRRViQAluPLEPGmIl3jt
         gVpkfE/N2DgglXYKH/fMCt4V+vPnz0v/r7ZhD3luhAcOcNs4fYcUcuOEyZSBGHoK0vel
         WBWVfmR2vtEiKGkjTxFkh89RRNpI4ooHHowKdY5tAf6GcZEvwZvW5xMuWW+QxKWfW8RI
         lzhRhxKdsZPLQlkI4+gZtOfSqQY0Bb9isYzPL/VlpNlDYrH3U07lQscPUZNRKxkqtDF9
         BMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762503203; x=1763108003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOIIVZmEuR4lMVP1407hIBpNtWT/l6DfS/U3dPctlwM=;
        b=X/CGps+msac1okEkV2zDBgejV8yj00zSBe9f0RxvQBcLQqOO4jkBB+pFzScaC0i4eu
         gHmTngJpRYbF1npd0Kk39Y3oWpWJUaoRCsb0s0rgjko/ZPg2Pt6UdcuKYS4leL3r4qOQ
         yoYVFbsNPeBybZAq+yY3TVdlrSfhfXcihzbp8WRikZWX2QDNgH0b/UXAs1grAto+2XAS
         gF+G3NT6Lswp96RZI3a/ad5io5ZS25RBFiZRJ2I041diL3Tlb1zaqDqYUeKaWD+Tlzqa
         XZPWIbUkz5LsDNkk34vYi1ReJf0tpB7lA686cDXgDY6v9U/Tp77D4nC09hgnyWciVIfP
         pvjg==
X-Forwarded-Encrypted: i=1; AJvYcCUB9RLvlOkk3kzPFNtFmuAdtsIuwm1owdqGMX1n5q2ueyeFAd7f/5VN5lwl8QdQcfZkoZbRcBlBVn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm75dDl69pl9g+xgbr6B9g/PZT4pKXTpLY7bEUvOrDcBH3jw12
	D3aSazda51WaHYOtijUCGhqbmwXjE3+kNJpFHkv/yJ24h07rGN2g/Pyz
X-Gm-Gg: ASbGncvZvO6v4A4zLJsmpZag81NvHCU8u8u02V0UFJ0YcA8SF1Dj3tmgSOGGvYykyJa
	Y9cjGpUOVx7b1u81R+O91jxGk/D2Q+DHAPG41ZqyBAk+wAWYygrftsJrivbCC74wC7sLrBWn3LG
	YeuwRABMAKEGvN2yp2s00qx3qXJ8Hny1Ki4JSu25XnbkVvO4tAuNoODvN1MNao+KWLvqJGtxuwe
	nMi6A2OGup+5sTfE1ykPlmZGpuxqtpMnVuG1StQnEntrZtvLk+dZnKutjDGVxLtSjh8HiP9TnRl
	4ThurS1w9Eyjp68TB5KBfGmoDW4p0zXop1dfUvO9qAxmQfGLIdbT36WMSSPID62xwhOLT/iqwTO
	dM572Q0YutBbHSZdKxIxucCpVQUqSt8sKjM5qKNTcvTKpl//xk5nCUOm8UW7g5L9RMW3VXTKnrS
	ei
X-Google-Smtp-Source: AGHT+IG665bW/Iuh/8EXmRznhqf6ur9YSSabWYQHPQ8dXHHX+fgwFkGMvxLWdfgY4F29RVykMMnqWg==
X-Received: by 2002:a05:6402:3045:10b0:640:af04:d718 with SMTP id 4fb4d7f45d1cf-6413f0771b9mr1621773a12.30.1762503202832;
        Fri, 07 Nov 2025 00:13:22 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f6780b7sm3665313a12.0.2025.11.07.00.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:13:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A7E38420A6A8; Fri, 07 Nov 2025 15:13:12 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [PATCH v2 0/2] genpt documentation fixes
Date: Fri,  7 Nov 2025 15:12:59 +0700
Message-ID: <20251107081300.13033-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=bagasdotme@gmail.com; h=from:subject; bh=L2WkKVq1YkpsdiT6yHvKw0l7RT+zYDKnfrxQFfdUrw0=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJm8K7T8b25LFBZc/qP+aoJmfOcx7kTmCJe83VsDpX+uN d+yY1psRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZy5x/DH77TBhliqz7NbmQx erzRocQuhy3w6CX2Uk7Xmf11j67zH2L4zf6sR97r3uS+rqjU1Sw3pm3KOpwp5Jn5YL/WF979yQI XeAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are fixes for two htmldocs warnings in generic radix page table
documentation. The first one is reported in linux-next [1], and the
second one is also found when making htmldocs locally to reproduce the
former.

Enjoy!

Changes since v1 [2]:

  - s/to set/to read/ (Randy)

[1]: https://lore.kernel.org/linux-next/20251106143925.578e411b@canb.auug.org.au/
[2]: https://lore.kernel.org/linux-doc/20251106073845.36445-1-bagasdotme@gmail.com/

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

