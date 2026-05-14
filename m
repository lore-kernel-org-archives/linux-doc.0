Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE543A5457
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748823; cv=none; b=tmCfMU/7rxiuFWabEw6bTG6IcWtswpPzhEbxb3ns2oVKuiCusayy+abFsYO+9uTzYiPRqhh+CFS1B9TRqN3NrlCIIb5au7f5mZz+y8dlsGMMrQ9nFP6cgqhvlFVL2AFZmIsaZdR418aDBc2xe8iLF79balxdAe6mEj+F12mB9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748823; c=relaxed/simple;
	bh=mdcOcRFdk+kFxge8RF1JHjCRLxgOkic/0vjen1/AoRs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nvoLX9uq5PKkeC+3fiEM1nvnj52GCVmEU5T0u/KLSYk1Cwjc900dSZsX081y95PWRbZmEKK5v1EvCv1YZ7qZM0L4yr0h7OK4wKIPlCXDFL0bTj1xdjOo4FZ8erlTlbKgGJOgBPVW5xaD+QOnG9+dwcsPGZv7hNjmGRJ6S97EO10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByTl8RvL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByTl8RvL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ac04e13dso6103465e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778748821; x=1779353621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H02A+VbK9Aj1S680nY/rdW6eTeDyQxWPgrNJtVSjlqQ=;
        b=ByTl8RvLFh2+HKL4oGqOqjKY0x9jo29ZPMKCr3r2UR3+wEIGa0yFCCSBFpXk3iSzL5
         yUB8k3XyIXMUUcj4iSLqjhB+eJrWAxJDutpckzEK/r2Y2YHQ7lLnkj/r+yqHOz9rOKTt
         jldQQfAaEbGvjsLzCrIJOcVYWVA24kBPhZpIl1aGl8U8J9x7QjN7O7aBYbhHm1cbaly5
         6537hupxkp9UEE9/HHvzyXj2Pjl/Nhb/H2NMyshlusQdt/1p7DTDTy9uwi+yPuN0HsUt
         aWGDc62KaVuEczpNx22+lBx6j5XA5HxYLWJR6WZqvL46TGqXdvSfr3UbyoN/rIDW0Pnx
         JPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778748821; x=1779353621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H02A+VbK9Aj1S680nY/rdW6eTeDyQxWPgrNJtVSjlqQ=;
        b=OFtp6kUkv1uMc94Pv1Ujsxc4vw5a71h/7VSTtBGPYyZwe6WEZoBcNY8xODFJYuGBUp
         YboD/8xFl7EQAWApeVYM2BjaJdH54XCzZiVIZeHg7A1C0vDGdG0tpvdxdXeRPap2MWxV
         p34EJzGGPlnxgkBCqSmpLv9V+a6k5XJVNTsPHMqhMaW8URRTBAoi+dLGfwOUfJm+XBcd
         O4UXxrlDB+dqbzeJ0bd2Bu2peIHT+7MG5QbCKeHlNuwRi5JkTWEPQJAxPGr4VNaQ/Ntg
         3nwMlZstIDQUHM6oxeHZRixbUqyZMybeXCkvJ1IK/X+huXEZ49T+NZ9SdTPgigPduomZ
         /wqg==
X-Forwarded-Encrypted: i=1; AFNElJ8EHn8Oh7EWaTRx+Y4qj288aUOXSWoyZ4K3DbDXxHMo1C3wiN7fEwaUbIl8LdhqXo6E+aMjEvsh9Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/m7O2Zhac6OUQx9A9lMEXXQJ97myt+/ddIHG2Rr+tbwYUE1y
	aMru+61TxRflyU5hXK9fxtAgYLk4z92Qf5tWZ0d+SmHHj0jzDTwNT4UJ
X-Gm-Gg: Acq92OGKrFfWNnr0LPZ42OR45rom8W03eNwqcddL3G+RUEmz30h8HHwtSQLw7QBLHOs
	uyIJpTTR/dYnu57c6c8cqG19XkKgeA6p0nRhIb8ZDN0GuOVoI9HujKZvJzYEiT/0ZrW5/PyHf4D
	qhZm3Ym5UzNM8aOJyi+irHgWiGe4ykAKVbOWhWOXhsWisA/khAkk8hr3JmJk4L5o0D1eTcqrhZK
	DuZnKxu2hjOuvlm1nOHFgv0TxXQP1dqmunFZBo48ALdYf28so+4IrY0eEf8RodUn8vM/izBcMm2
	Rl4f9dNcs2ouKHB1GB6c5QFJ4RQbDv8uM3IvPAKpgwkF8Owu9NpFhPgoj1QcdDx1LCB+TZrpvAq
	fdOqg8ZyeVJcJvzmDj07JFhSScfQNtPMH4wRAyeDvnywSNqka8dMAdrRJqT1CZ6+WRpp9TBll+6
	VkEWu3D6zUFZ6G3V//HGPNJBDEyjnPsyYdNbttBVyzAiI=
X-Received: by 2002:a05:600c:a08:b0:489:1c1f:35e5 with SMTP id 5b1f17b1804b1-48fc9a44496mr50115175e9.6.1778748820886;
        Thu, 14 May 2026 01:53:40 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd649a21asm53831875e9.6.2026.05.14.01.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 01:53:40 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: corbet@lwn.net
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	hcazarim@yahoo.com,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH v2] Documentation: iio: fix typo in triggered-buffers example
Date: Thu, 14 May 2026 13:51:57 +0500
Message-Id: <20260514085157.20327-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the "IIO triggered buffer setup" example, iio_triggered_buffer_setup()
is called with "sensor_iio_polfunc" (single 'l') while the function is
defined and later referenced as "sensor_iio_pollfunc" (double 'l'). Fix
the misspelling so the example is consistent.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v2:
- Drop the file name and line numbers from the commit body, refer
  to the example by its section name instead (per Andy)

 Documentation/driver-api/iio/triggered-buffers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/iio/triggered-buffers.rst b/Documentation/driver-api/iio/triggered-buffers.rst
index 417555dbb..23b82357e 100644
--- a/Documentation/driver-api/iio/triggered-buffers.rst
+++ b/Documentation/driver-api/iio/triggered-buffers.rst
@@ -43,7 +43,7 @@ A typical triggered buffer setup looks like this::
     }
 
     /* setup triggered buffer, usually in probe function */
-    iio_triggered_buffer_setup(indio_dev, sensor_iio_polfunc,
+    iio_triggered_buffer_setup(indio_dev, sensor_iio_pollfunc,
                                sensor_trigger_handler,
                                sensor_buffer_setup_ops);
 
-- 
2.43.0

