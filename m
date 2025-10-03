Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633712DAFA3
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513187; cv=none; b=TB+4wSsyUKjkBjVWgQTlWc4PtYpodJ1MeQPD9y+QfvmGrI/NJ2hMmNU5S35zCxhcncbzXoCOeZbe2rXtfRKSqaw3laXJM71EHesTKhMechuQIaXGSJ2TQZG/IYPu37XiiKq5HIZMYwLnRS9ZerI10Zfi2K1QPKE5j14EA8I3ISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513187; c=relaxed/simple;
	bh=ZaUhRL9uYRgp3STBiIrntA/xJ/L78oxvSHtu/809KNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMlRfDUVPoP4fYYqLDn0hJ1flWtQ+4ncqpOGRtYcuB23ARYndZMCoJM+bmxDh018NGhQ9KNgZQtaWhsNlLKSx5mXY9jsYGqVFe0PZ7ITGUJ9ZQUK+fgdfkV9RLkg2PqMWAHZqjS5PyKUkodI0Z1EFSGSo/3d2o18tpB6SHiyG8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3MGhMWt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3MGhMWt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b550eff972eso1733360a12.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 10:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513186; x=1760117986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwVgppgL3hOntHtqfj1wQPCPEzCZhCKf11suJZJq538=;
        b=G3MGhMWtJVTTfbCi26kQLLnmedAmzoPsBHVqkIQQE+YvuIuMAU/V+Txv5BB07jNWCv
         P1uZbstAZOkxZY5+w4A2BTYtL1MZJCoPnMxMuPsudH8GxzX99EIeOMqb/SGvrshX+xh8
         ldawJdF7Bvt3eXsYs/InAIAoRDyKTBO4YBZtKl0SWy6GY79QriUW53c912jRilONOFaZ
         RUyVs789OCGFleIwTwhF6Mv5WEn0riPkZ4azEODtEABhdQxrYCQ/lkCIrqFbw5kXySxx
         Bg/9Da/Q8j9ylaO34Dbc1xdmJa+8HSV8iKHzxDzMq+FTz4r+tbu5dLuruesHMh9QFyVW
         ghUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513186; x=1760117986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwVgppgL3hOntHtqfj1wQPCPEzCZhCKf11suJZJq538=;
        b=NMz8rQ7wpegF5gKpyZSZ89fyPfZxhA9VtNbQFRRoaz8vTjiNxe+wqz/LuBNsRJ02sc
         tozduYJ8teCYEDXZZScjqd0J0xOF2GrnwKFmesz/QjmSGSpqAxyKNwpJ/77cYvgD8JfO
         23fgbrhbzAMu+RSkjAQn3rZBfK+0woJAfGm0b7AadRkG1ny9Tpqxf6qbbZt/N0/WVVdN
         8zuulr7ApJgndC2Av7iUQGrkr9sYJcFONLAPupfjFv370RllaBa+GCMx9a5+RBnJu7lo
         dHOa0zx+42CEboCXO4bK85RET3UtR20EGfiEM9+Mftvaz2hlWMQ8h8pzumdVc3OW706m
         /u8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBohaVVoquQfcAyeYYTPi22GX3C2i+kG/j0C8cMb1WquNmjrTsr0ypWq+OAMz5ReXeJAW+0jMH4d8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwihBwuZ+nvZb0r78V0N4snvDAa/l60NkpJ2OmiAhZ6hxGyWg4S
	gl6DdN6QwPhkg+eN6ZskNFlHxtbScgTkVvJp855B/wTPVcrCPh867jpj
X-Gm-Gg: ASbGnctDCt7sa8QzWPE1RIU2llXEgIpY1TIAJdCTrunYrwpC8t0xCyxbxuq4s/gdVvc
	+vPcGM1maNp0FeH+2ytOlqLACOk3Y9Q8BKq03wMWLi9uG5A4EqxiWrsguwZf9H2X9p0605eWx0J
	wXERS8S+PmpkZ6nImv4PlVWiBo1oXQwWPTgKycg0fIzGNSf24BJFJvvOKNsMiQCG75b5RtZbDPz
	Y0RRVe408yzkXyHzBl7fRgjZDU0wtBz6Wx7MmAqrKBygm4FBdComJoPNtAILawrAdEwZbPWiek+
	fUAR71cxu0oG3Ixf7B9QJYQQxUycZgqLru/9fo9ZKUupq6OKKRn6uhQbgOIvfXgsZqcOKaZgD03
	3qif3uDv+bhxqh5xWyFpOL57O0qt67maNMu/IA47yvt1zx93X/9iKTrGIy3S+y7C5xc3fvE4k1B
	p1
X-Google-Smtp-Source: AGHT+IG6pd8ft2Gfzz8OtvTYc1aPctUPueNw+N8ygaqoazUFNcD1dF0JrQ4yow/VID/T1AeeLSKoZQ==
X-Received: by 2002:a17:903:2f0b:b0:264:befb:829c with SMTP id d9443c01a7336-28e9a5463aemr42367135ad.9.1759513185641;
        Fri, 03 Oct 2025 10:39:45 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261edsm56267635ad.34.2025.10.03.10.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:39:45 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	zhanjie9@hisilicon.com,
	viresh.kumar@linaro.org,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	2023002089@link.tyut.edu.cn,
	qyousef@layalina.io
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2 0/2] docs: fix malformed tables in Chinese translations
Date: Fri,  3 Oct 2025 23:05:58 +0530
Message-ID: <20251003173926.10048-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003162626.6737-3-krishnagopi487@gmail.com>
References: <20251003162626.6737-3-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes htmldocs build errors due to malformed tables
in the zh_CN and zh_TW translations of cpu-drivers.rst.

Changelog:
- Adding missing TOs to the relevant maintainers.

Gopi Krishna Menon (2):
  docs/zh_CN: Fix malformed table
  docs/zh_TW: Fix malformed table

 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

