Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C5B32AAD3
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417390; cv=none; b=ZmIr5h3ODvpvYk7B7H9anV2dss7NMSa0zAWK2ztsF59rLm6z6jCX5IS2p2Bwmr+juDY8SutG8SWE3FhCjDw+TpQWprhnhzZAZ5AiT2kL/1dpmeLiZSLnhPECN3QsNQb1fCwtxiabSGyUlLIwNPYQ7N8qKuPRaZ7I67bf3mItOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417390; c=relaxed/simple;
	bh=VKYVMzmse4VENDeaxPRZlnUBo4oocwkoZeRYW616Yh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2x0HDHY6SSFpKn1XAnzOGVUMQo7SX6DhuskUwOxrYHehqavja+lWbLsYWZnnIjdjxs52owIuzKw5QMAQn6cOdtBlmHKoAGo1B/SyHPBHar5Mn1SRaSqjbFHtSV62TXS8S/v4l1YIa4e+eTl1PvqLHRf4NCV+1Wsgo8GBpAkjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZfnMFU1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZfnMFU1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so17137245e9.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766417387; x=1767022187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+OKjLww5FUfSr52sUiaIMe+sYSZvUySZJiUbOG9H3w=;
        b=jZfnMFU1neYz2N0+LZ0xZBvAMMGME99q80aCW09FNEb5XJ4fvdzUoItA0Z2PnEpIt8
         2cLFmD/1Lfrz1LLz8LL6wSLR3g3AptCvUOHKvz9JthfxbNLzURY/xdA0+GrV7VUo/OA1
         hrG3UAD2d0uLtjI1RFgbg3krwI2PdY4NbaniL63Uh7yHfEewxQ8y/ek/E4iaI0RprnzY
         WQYWhkymAFmJ6gejWhpPyRNdNby2CDCrYVCl69scI/EcLOCyHizaUZG4V98s4lqGq7t2
         dPHXSKfpJEutBWg+siqyJtA0l0pdcmq5/jrdVMfCxKcP9nVYM5ppnN62UZMVLLYmGMOU
         O5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417387; x=1767022187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+OKjLww5FUfSr52sUiaIMe+sYSZvUySZJiUbOG9H3w=;
        b=RwG2e4raPHFOwc4mwuVuUlO7Z9h2+pQRaxlX83tFI1mrx7Q5BNXySeZHYhJbVtxHaY
         /kAK0FfkNYJ5x88IDT8906m2iXItYFG15ppxIYMaZR4iJ5jqy2EFRAMccVdg3LQ8RUy7
         QWJUFuzgUxP8rcUcfvCs6jkn7alqoNL/OHPLIEkQKx0CmaoU+FEgHAtn+54SaBteVuKK
         c5v7ba6wtDCh3T7SuV+ETqd8EJIPw5vnM8xKhvWbpsdfC1H9UhcCaRiHzLY//r1ewiUR
         dY7kTZojh0hn/z/Cq3PcdBjIrKNl6rJR90/AYWJsQfVpOwRNa4GIApFAHuQKXJOcN5A4
         QXTg==
X-Forwarded-Encrypted: i=1; AJvYcCUlXS1vMzLipS/FhEgjApLBJ1lIaQotVtig17QjTIsPGwhrK09EPHkAhLgctsxNIUMEWTWO8vqsfO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKuXyi2J3X3nMEfbGQtPFeK8ahwhIcOW/lbTMkmIBGwUfmudue
	Yu7VEfQ+vANeOnru70TY5nH1bGFFAnov3LqJTJP3a7aVRtEaXd4kv3Od
X-Gm-Gg: AY/fxX67iUocGYg1fZ7Kq1bmfElvp6kh9Q+wqdiajc7dMcZwLy5Vj4wCmfsHmcYGEAV
	YktbqMAMIAiDwVQLIAqVYpZykJg6fjI83v3dm6EwRM7M0lS6Vj67ytvMWGONe0NHuCy2J/i4GP1
	MCXau3jKIwjJVwS0LgRNYyvp5vMt3m15zsc3U+939lzHdLY2J0zZyOXUQiC/1bJBKhxPy17vtYN
	Y9xCkXcsn0kTjG5goJols/ZEAE+BmLau5Ie7dSeOz4GRXpDjO7Uvj7NFxbgBhXDujXjl8YkG9eT
	TVdGIReYVCSUbbP74HRNx06RY431Krn+U59rGFSDi4/0kdftnBDgNnM4XdCbMcexVnFrvu2U3EE
	Upl/4AOBLvoJoDHLd/LNz2N1BC/9Ihsoh1syacPXNriaTL2WS7BQArjByiSlEP7Gxg36vlGHk/v
	51BMZmn5BKzMFwXK9lu3mPgQXHKcIgQcADBr5kKFm0KChTiTrE7jGtbl/WYAM2yg==
X-Google-Smtp-Source: AGHT+IGM6fQvuIIOpREP+B+O3M3ibRqFT50uyGcMNAnyJoixh9A0Qh1WuuHB5+i9945AYtgxkpjduQ==
X-Received: by 2002:a05:600c:37c6:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-47d1953c178mr121525005e9.3.1766417386840;
        Mon, 22 Dec 2025 07:29:46 -0800 (PST)
Received: from localhost (224.85-87-222.dynamic.clientes.euskaltel.es. [85.87.222.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm296520225e9.1.2025.12.22.07.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:29:46 -0800 (PST)
From: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
To: andreas.noever@gmail.com,
	westeri@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
Subject: [PATCH] docs: admin-guide: thunderbolt: replace ifconfig with ip
Date: Mon, 22 Dec 2025 16:29:26 +0100
Message-ID: <20251222152927.38101-1-jaime.saguillo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifconfig is a legacy tool and no longer installed by default on many
modern distributions. Update the documentation to reference ip from
iproute2 instead.

No functional change.

Signed-off-by: Jaime Saguillo Revilla <jaime.saguillo@gmail.com>
---
 Documentation/admin-guide/thunderbolt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 07303c1346fb..89df26553aa0 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -370,7 +370,7 @@ is built-in to the kernel image, there is no need to do anything.
 
 The driver will create one virtual ethernet interface per Thunderbolt
 port which are named like ``thunderbolt0`` and so on. From this point
-you can either use standard userspace tools like ``ifconfig`` to
+you can either use standard userspace tools like ``ip`` to
 configure the interface or let your GUI handle it automatically.
 
 Forcing power
-- 
2.43.0

