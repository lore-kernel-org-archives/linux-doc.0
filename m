Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC652DB78E
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741481; cv=none; b=cYfo10zTW+v2OV+i/BlK+JMBoxDoFuH4joMVkdF9364DOWGIOyfCvLj+dkyEbO5BsndFLTJfwbNr3Ujs4fZA/Oao7h30iFJ/RyCM21uYJizSDsx/HZtX38Jh5M+bROTso1lxkm6N+i0KaHRpidq7jzC/tKgArWa9Sy7jrBWqfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741481; c=relaxed/simple;
	bh=wUwgHuHmpCBzr7H/7WVc35i9GU4WgG3mr+gnrIaHswo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ao7TzLlQBceO0gnNUEuytnZNZjouaP31DalVA9t++x/wO4NIZd37zyAXG/t0n4q8Cxsz3iqHRjd1Kna8qcOeJ03whcQB3DpvHwE/Zi6/f6oeFSzuk+VYMC11Kwu/D078hRPc0CToxJtpyIjSVTJdxRed7boKKA1+ycaam2P53nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFOpd+70; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFOpd+70"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7388dd6ae9so658778a12.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 12:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772741479; x=1773346279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2oBvJJ8Vpyu2t20z6NeyFLZEi85VPiTEdnfqY4mNl0I=;
        b=AFOpd+70AqmmlWvE8mYViatXCkC41z65wtFuSvacuun7J4Z6C+21z47pa6OwCytEn4
         LrKNJDJTg7oD5O0cLrAYyXS1SirsoJGP56E18fKZ0e2gLzQK2BrzQXOvOcKfQsHwpK2L
         tM+eCKGukZxSakNgYFO/VeVQIR5mqKgPjEbRSwNR9KUoLJQlOouBjHheU68Cl/fhql+1
         o0DbCKwoiOhs80wFyPjeC3dseh9asCQ+X9I7UWkqfahczL3EnwDgSB37AZMMV+gAqclL
         w4axh+O0KkJgSk0tm2Nay2RQPtoOTb3bwhKJfUgf/HWHCtIFi3ZhuJUvn/Qu+vMNkdun
         D4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772741479; x=1773346279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oBvJJ8Vpyu2t20z6NeyFLZEi85VPiTEdnfqY4mNl0I=;
        b=q0P4N89u1OWGhY19in3PuOK+HZ/51cX8KK+T0suNIwVARhXG4KPidqYjHr9Sx15Ygg
         I74X0isenYlDuFc98mYT/eFc4Na9X9DQZ9MTmaERSS6usI/7DY9keUrMMhdDyrLddHnp
         9ssaUTcvg4uTyDPe++5ssFDEiWbt5ysgE1mZH82LUWMWScT9hsNC18lBM6wU43ZYE9Fr
         a2PcMZO+CxPxS+aOEK3yxIPYw/8JPvtVM6JuhN6cLgLq9oMZrqrGJFwEOV/4AgnKX6lz
         HSLQtNgVqKxQ7ZyQexKabtMmPVjY/kUUEmb5WDdv6QrCDPtBeu7xymZ7Fpu7BkbJiuWH
         4IZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbgSRM4npWuzvvjYPIQzaAntN1IjvKzG+ec0NtxxJ+hMzi6H6XLbcdq4OhcSc37jwT6yOe6vBEJVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3K//D//Mrs+hx+QplHVyXOmgU4g63LY3SDQMTVSJQadEFwhy
	M7yMEcWdz+jBHGtKQdC4vPVtQCzet200tKHvYIjmjqpHYIEK3C+XGagP
X-Gm-Gg: ATEYQzzawgAToamI18HLrTRyYB+0N5/Efs6UaEPDTpI7KbqXodlqtxRvaQgkKmsJgvO
	sNI46yhtqWQwmTokxSJjC9KRF+H38TKSjZapid4enbiH8eWzrNOR8/RAze5j+kB1DIAO8GMfmQ6
	H/TIjAk08z7DK7W08p9wBuYwsB4FclB00a0oiFG9rvqRG3ityd3ZiL2BBQwZsI2zn5UeBmaASEX
	XPS9gckzSSo+ZdNORbfb7WmpZPrgiOntYKEB+/TI0g3xdRtZqbXMlq4uTJmROlBphWhay/qOccR
	BB9669PVqu9ltUPm8+zBJ7eN9sUTyGoV0hYva159UIh138Td8k6MV9dHQzPkDOY3Zi3K1hafJc3
	LgmQFlQ5PPFIWDnmuPbj6uQkHHT2xxHFc0mbsRD8KbT660kwoIAUjMSvWUtoyZRlGK2p0UqN8Ul
	+aquTpJXr6qszui1qW2RVuaj4CfdcpPq4yd9Mq/ZDv
X-Received: by 2002:a17:902:ea08:b0:2ae:44db:56ed with SMTP id d9443c01a7336-2ae6aa20d76mr68815895ad.15.1772741479596;
        Thu, 05 Mar 2026 12:11:19 -0800 (PST)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a03fbsm309850115ad.43.2026.03.05.12.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 12:11:19 -0800 (PST)
From: LIU Haoyang <tttturtleruss@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: LIU Haoyang <tttturtleruss@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview
Date: Fri,  6 Mar 2026 04:10:58 +0800
Message-ID: <20260305201100.10119-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes an inconsistent describtion in testing-overview.rst,
which should be ``kmalloc`` instead of ``kmalloc_arry`` according to
the original text.

Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
---
V1 -> V2: fix some typos in the commit message

 Documentation/translations/zh_CN/dev-tools/testing-overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
index 286ed6b01f65..8bdc51b47b5e 100644
--- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
@@ -154,7 +154,7 @@ Smatch和Coccinelle的强项
 Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
 检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
 
-例如，用Coccinelle你可以从 ``kmalloc_array(x, size, GFP_KERNEL)``
+例如，用Coccinelle你可以从 ``kmalloc(x * size, GFP_KERNEL)``
 到 ``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很
 有用。如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很
 恼火。你将不得不为每个警告争论是否真的可以溢出。
-- 
2.53.0

