Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E33B6BF2
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570063; cv=none; b=Rs8u5ixCq2EpQu+Hsa34xWdi4AG+TQepic3HM9HB7rCqNk16CTnqn+ruKTK97vd65P8Q/OT/U3opXxFlJ4Xw1mn4A4KYIVSAgiXNuaqUtyOhJHr4mNlZw7R6/e1M342u+YKUBwPTBB0QFuWbAB3FHxRlQZ3/7wU0yT7ZWDjKKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570063; c=relaxed/simple;
	bh=QdDo2hPyGr7KyACORnHU+oSr5Gx/Gwvx1tS/f9lpj/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gErpXhral1rSEYIL8+Hmgp+C3HdqLg+g37y6rsggeNNbvgdjjyQJ1ROI64AuYUNaK5rV/hGIMwMTMJWVdG4WJQRbVdpDKvJUWcA78YVFykMkeNlP/fHw8Z7vWtwfUM7ioKUIcy608kNtiF1Uww911Xr0vRFR4IzkyvmhT+DeroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0u7tpjO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0u7tpjO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso6650289a91.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784570056; x=1785174856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKvx+e7IPeEaP36bgwUEzZfr9oAgeFFSn833EXmmU/g=;
        b=W0u7tpjOPa8OvzP0iAAhiYDYU+6Ort717IwW4aVXnF3+lBRui+6HWRALdu1VLq0uNm
         uCuT9VfhfasVfiqgiJi/T/8+MFvJ4N9w5D7kFDYLijjURo8czLuBMEJZN15+EZKjVEiG
         lyD2AXU+HJR+K67de32tS3PQzzF3BuxXcVWr+Xs6pGmJcFTrRvZiC79TsRVbUC68ndXr
         ME92jcltOCD41PO7kWMaT+RdUjysSawy+3226JkQXtTz/ELWYOTbVDRJwKnjHOQKKvQ2
         N3ecuZ4KL6gFTnRpucaAsdfuQo2Gzae2BqfXl2QRDC7KBBWOyet+Jl9f0FUsO9e1GAon
         IBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570056; x=1785174856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKvx+e7IPeEaP36bgwUEzZfr9oAgeFFSn833EXmmU/g=;
        b=b+5VFjwhfO+katayJeHRHzJD3nKBj/PTIeHR9VdrqZKq4y9h8tFHbJUpXeFqnQFp0a
         zLp7noVUJ/LnJRCeZuuBVsmAbGB5N7AJmvrk2krWfdcjqDR9E2kNHDDwaQwwTznliXRs
         pQGgYYSvcHcOpkPrjYBfoXgm/kKXO4Rd06bXz1haxVItrAxiuDQ+OJ4U8lm+S70Iqf3k
         +X4LmveRRQH5Pj895O/7px1TFCtq3ws6jiusm7B2dXbn7eITzjYFsZMiH3aB4njSaeC4
         TLeQFxqd+p3N+Iq5i4N0KKktZCRZFPM/UyKvSUiMmtEX3NlWef9L5QPfaT0qjLY7No8E
         vQ9g==
X-Forwarded-Encrypted: i=1; AHgh+RqYSHQn0mqs8SLwoUVLopEDgr8uEqJwamTRo7pgOSDD+VDNvBsJlYViUuOT+qaIwM+djfNidoksT3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8e6bvPDGu1x4wMuO5HdV9a3PH1bDkH/Q33DFZZNpCS255E7X
	8nyiZaNctg2T+I4fmR7IHxnM0o4FdRp65yzk/HWEqE8Rwgweodp+ambK
X-Gm-Gg: AR+sD12v9KISyxuwbCJrfhbb28wK6ejerNeUJi+qM7LMzvJUIa5k4RLlLitgWykdr5z
	7bcZE36llK4t5LV+45xdM18hKkaPZpymFw8CFhI6q1lej/sYEdRERJEJ2bWbtRXWQYoBl72ca9A
	62r/hvjEI7Q3iwjilvC3udIOXrXvNvGY8009LZj8d5R7NU5IaOj3HoaEgrOZ6Pcu4hCIOtrmjxo
	HHkwK1XeB4hSb7/jEch+Qevkw/JDFhcRWYd+iwL8logDiq0/6mGCEb+PhEPL5f7jD7rbmm+NXas
	CMf1Fe10avoq0U+grBDN+NkVmcWo/OCrjY0HV6kEDC28usfCWwnSyuA1ZxIYGqvNXzoxwUgpLru
	z6naluDcmLurisixXJBYS0KSlz6z62hcHzPCS4vfeO+hYDkLckOcLmerlQeJ+KgHjjWcBn8SA
X-Received: by 2002:a17:90b:1c01:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38e4b46c879mr15804943a91.16.1784570056406;
        Mon, 20 Jul 2026 10:54:16 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm33370583c88.15.2026.07.20.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:54:15 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 0/2] ntsync: docs uAPI fixup and timens selftest
Date: Mon, 20 Jul 2026 14:54:00 -0300
Message-ID: <20260720175402.44338-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Short series for ntsync:

1/2 docs: align ioctl macro names and struct field order in
   Documentation/userspace-api/ntsync.rst with include/uapi/linux/ntsync.h,
   and note that absolute MONOTONIC timeouts use the caller's time namespace.

2/2 selftests: add wait_any_monotonic_timens to lock in the timens
   conversion in ntsync_schedule() (negative CLOCK_MONOTONIC offset must
   not make a 100 ms absolute wait return immediately).

No driver code changes.


Iván Ezequiel Rodriguez (2):
  docs: ntsync: align ioctl names and struct layouts with uapi
  selftests: ntsync: test absolute MONOTONIC waits under time namespaces

 Documentation/userspace-api/ntsync.rst        | 33 +++----
 .../testing/selftests/drivers/ntsync/ntsync.c | 87 +++++++++++++++++++
 2 files changed, 104 insertions(+), 16 deletions(-)

-- 
2.43.0

