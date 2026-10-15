Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB31A682C
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 16:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082774; cv=none; b=i3LdpNtDicgbnXpKLCy0LtwT6sKDaqLORK7I5vvQPXiVqQqvwDKIZwQHeS8f30MR+CSqxT46nk+gbfrkvQfhhX1pUdYgoR6VU67Fpbeti1/XaCTlV5FDlJcAX42eZXSvlueKJ03e2NTWqY8dTz1RbRjci/nrldfieHMSEekhUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082774; c=relaxed/simple;
	bh=4CG7Q72yRGz5EsH68xLRNRJVsKA1jOWn98uDNF0DgEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmfaA0i3MNC6O6qSrfzDxC0bUTnDjwKkxnKu4AWLeYcZtUpW7EGwdKWHIJWycINDpqHgCd8Mml8V5KMojglLdRqIASMxNKhn9VaZoGTuLyqGmYFVUkUTrBuQXZvkr9DjU0hNQelb7KFE7Uxr5a6DST0kYLi1z2WOCsE24m084Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmQVP98D; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmQVP98D"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dc1508191so647427f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082761; x=1792687561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrXV9sC8WQ9ZwV/XmjLuOdbNwXh/8tikKfM8d34Nfhk=;
        b=ZmQVP98DfOHlSUbELiu6x61tUnZxQv/cjYguiIw4ZotPnbGjGiy72CtJv2UVKI7krx
         bvzdZZOhNYZxKHAALvo10l+68tbRcEtoVN60fQMVaKrRho9eYMFsfe/eULzvyA9SJQav
         H6zBB/m0u9F2YczUVDpIbv6WUSfBssAinUhluoUtbZG6JRdNEBR7FMWeOHYOc3QID0Z2
         j6lu3x8SAvadnPPNcBlCTG3zefhfFCm0RpCTxtSvEc+Nzbv19Px/wy6VPfdSuiiMO8jT
         hCKinGWDCe5EopYbqvmeW4PGMqXdmE0gyV5JaqewaWg98r4gWqczXJADQJkdz1Pc5ep8
         8ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082761; x=1792687561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zrXV9sC8WQ9ZwV/XmjLuOdbNwXh/8tikKfM8d34Nfhk=;
        b=THwUPgPJ+HBdiCEROVk0apNJAT01qYq0qlQ4Q7qRku5xFi895CpJM3oml+6uqbcZ4N
         QfmBNi64/nuTcDGWlhCK/PyHD4pcdxy/f5XzdG28Lq93/X6QPG/QHgP3KZMRZG47CUhp
         Og+bpn8W3X3+z0SEHbfGvYrj8y+BTuZaejEgJgWaUY99lcs9uJmFApIxedY4PbEqaJI9
         ImPw6Ha6/tS9xd9aBZEPmKV6kAa/H8xHYTE6aHMDZ76/YUZ5mM0FsO0wqg9iDZAB/Uj7
         ArmkYfbpZN7/LrVjEIyAyrQ4btcxdOFGCjp1/5CouIqhB5npPCz2cOI1u2jTFqibyw3b
         nxHQ==
X-Gm-Message-State: AFq9FYI5TMlcOvKnf89MbHlgOaZOd1AbRPFkXktmlT60ZhqS7ROBTIUe
	qUc/dx7c8z1jhTFQshXTyGcidbVAOUwUWLJnDqtBUWZdH6rHunD/RRmr
X-Gm-Gg: AYBFou2qgC6okkxJY6sk4P1owVUF2hfGW23w+F8Zyt9v2hseRDMQsxph+hmJlH3UN//
	5KtuNuHXj0kw+/2eVCpw2mngax/ydijILGLdiDvPfyUGJfKHEnVdvfbUEhDyL02YCsxqOzs47ah
	rtQpAjNGZ6xcxHlw4veeMjQXCKJQSt9C2MMTNYM2BrOQR4SMCRBYAN5EkRx73ZOaTFARHSPzo+v
	kyvMaLm9jfo3rLZ6wjEXkYG3S4hAz9Gajh2dx1BpgcDFg7jmTvNPUNq/7OKsqAZDUPo9K68vK3t
	Fi33m+Cdz/XRSegxlpHsYZc9Y8xqnnMwaZDtQ1ONQhdwTKlvs6SwIULRbvBWYWKaNPVEurGwjvE
	IN2JfQ4jXIVem+jArxrACIRPmib3gKsb+NbgM6ps9c8r3nSjNvksWiK4tcKFxo5idl/bIavcpi2
	PESQHTTJ94so2wbRkMQM1WKMDK6oOPQ1j+V9qBcU3DyZTORXkLv+od/lsLAGPGrg4YsI9ILOhpg
	3w0HTgzbhYL4BfmCKUA
X-Received: by 2002:a05:6000:24c2:b0:48d:f102:aba5 with SMTP id ffacd0b85a97d-48df102acfbmr9440964f8f.0.1792082760502;
        Thu, 15 Oct 2026 09:46:00 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.74.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm19110712f8f.54.2026.10.15.09.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:46:00 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	emmaonana18@gmail.com
Subject: [PATCH v3 0/2] docs: kdoc: fix TRACE_EVENT_FN and DOMAIN_NS parsing
Date: Thu, 15 Oct 2026 17:44:46 +0100
Message-ID: <20261015164524.14066-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8733u7t8xq.fsf@trenco.lwn.net>
References: <8733u7t8xq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two kernel-doc parsing failures where the
prototype was misidentified and parameters leaked into garbage:

- TRACE_EVENT_FN() family tracepoints (e.g. gpu_power_status)
- DOMAIN_NS() wrapped function names (e.g. iova_to_phys)

Rebased onto docs-next and stacked as a series per Jon's feedback
to avoid both tests landing at the same spot in
test_kdoc_parser.py.


Omokefe Emmanuel Onanaroghene (2):
  docs: kdoc: handle TRACE_EVENT_FN() family in tracepoint parser
  docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes

 tools/lib/python/kdoc/kdoc_parser.py  | 18 +++++++++-
 tools/lib/python/kdoc/xforms_lists.py |  6 ++++
 tools/unittests/test_kdoc_parser.py   | 50 +++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

-- 
2.43.0

