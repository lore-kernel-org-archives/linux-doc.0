Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE83C6A4F
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285925; cv=none; b=HW3BalueCiGTkMsbtM8t9cP164cCx0+PAoUIpH+gFkmQn6MmMlE5oMORXGtOC1LPcVG/FIA61mPL1qTSzmf6MfaSexHKATQRu2/l6078YP/HI5MPQwxu9bFN4kpQk3WU5ycxYABTrsoPqcawte3zqoXke3IEMT1j52ksfqAj5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285925; c=relaxed/simple;
	bh=E51zmPEcmxGiOZYoQO8p6GfNbdBLeRt7rJ2sBizOoYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fn/1F+PXnQfUNW4yX5vAH1ushzQamFf6tDRCx1F/qmzOyuVOAgFZegLUI8RW3qFBg4DWmDjPDG1VoEKdSzf90JDvHUN1cRqXA2Xc5ZQ9aNHhKh1m6LQNBpTXrkQEMxB3JDiod4bmlwpJ3Jdu6UMEJYEnkVLIDr3YrhKprFtBGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQW0qA/j; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQW0qA/j"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-602947681e2so217827137.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774285919; x=1774890719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tbeh4qwPcRnsazlSaihmaNZJiTLzobAX3RSYW7/ADds=;
        b=jQW0qA/jVHgDQz0ZDo7xwsLa5vYnjHcNaLkJk05FB89/dB8TRQll3Z9T+UlziWtmJS
         nQRV0ZWdyQi27JATc0zy95oG11goq8LUKv7WXuU2DyuamNSWIn1bjDpKZoTtULdUxFlk
         ivJTMyLNU28/IMF8uRhisVJadV4dVrGEEqRtAwx0SFnphD3WYC4TsB2O0mW9DEuD6/MK
         95F8qlsl6NSU9PqAzEggII0JtE6UZ2R2X05sADBNBl5Lk3/rTMUZ2wluj8dh0I5BRVgG
         ZAkMqxVA7UYqrw7KGWJyDhl5yHyR+HA4rgNiTmz1r03UW0GiPYajszponEgJI5HubR2b
         3cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285919; x=1774890719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbeh4qwPcRnsazlSaihmaNZJiTLzobAX3RSYW7/ADds=;
        b=JOmCdyl3P9L1dHDoswpCXxvqY3m0xxX41l6hTMVpJ0Gx4N29Otd0JRLrs4InJTDLzb
         zx0ViFAhfO1kbBjOuVW9BrilKeWwt3MXdwnJwovceRnJtrTCU8Nyufg2PFlXiHfCTeVu
         W76mv/9xonDi+sDgKAKrJRoohWZNLUBNea1vNpaB9n2vx4vHjyg7XsYlzqPB+99JSF9w
         kVhoCyn8TfLxPjeOIwMdvvnhbAruk8hETGZaHTOWfY/Pu67mNlne2E+JNU9QAAD32j5+
         PlFqcjfoBa0v7dSmZ9DTPL+vYdmGgmOXYdsKnuvXPHtPehfSCqYTT5k5os467faCClkZ
         qFjA==
X-Gm-Message-State: AOJu0YzQAgz1PAxhK4Dz1tJZYSnwxI17Haq5RQ9We81DCdyUTYDSr2FL
	QN3zhRp/OJxhPuFwMIb8LMl10tMVqLMO7140uYKPJy5auINJxVFdVABo
X-Gm-Gg: ATEYQzxf5H6RWyPXLYPoEB2sQ+LZZ4rpszOkw2sf1ugXVXAbfeFaqjXz8DFfnM+eLXl
	aFcwGfkJj9lqlvklNaXD1NoDTU9oupgLlMB9IwQzjZ6Az4lLcLLQxfGXbtU8ENpntD3GxGYdBaU
	gEAvU0w4s1wBLag47l+qvt50+AkV5iUe2Qx2JO8qNarAi+BGOG55uXyLZtk4Lz3XweS9JYmIYPh
	+phqDM2tPybeJx6Bhk8ftMDniYT31Q/jb0jn4JNJM0CIpIZ20Vb1k0g6K6TAIVC4NMzk4kUK6+Y
	fPjP74wTCa7iYDOcTBfmTRxhTKBYSx6WJGvktYVLWkqcR8B1kt/+ii1ClConivb3dkAbOfS4hOT
	emSA8U5XC7QBsxvePrg8oVh8ooNgNbJRERQLzGVVCMTd3Jl0dBvYllA3u0VPfod+oyo5MgYcJpk
	k7Q9ddnltCwLtRHB2GKhQhgGzYBDxVV35SMgJkxR4A+QcRIRvIYF8bZnXLz5r94sIvp+d0d1SA5
	Q==
X-Received: by 2002:a05:6102:a46:b0:5ff:b8d8:b40b with SMTP id ada2fe7eead31-602aeb16725mr6341933137.11.1774285918967;
        Mon, 23 Mar 2026 10:11:58 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95136bb0901sm9507306241.4.2026.03.23.10.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:11:57 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 0/2] docs: pt_BR: Add translations for KVM x86 and Conclave
Date: Mon, 23 Mar 2026 14:11:30 -0300
Message-ID: <20260323171133.88074-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Portuguese (pt_BR) translations for two documents in 
the process and subsystem-specific documentation.

The first patch translates the KVM x86 maintainer guidelines, and the 
second one adds the translation for the conclave documentation, which 
covers project continuity.

Both files were validated with sphinx-build and checkpatch.pl.

Daniel Pereira (2):
  docs: pt_BR: Add translation for process/conclave.rst
  docs: pt_BR: Add translation for KVM x86 maintainer guide

Documentation/translations/pt_BR/index.rst             | 2 +
Documentation/translations/pt_BR/process/conclave.rst  | (linhas)
Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst | (linhas)
