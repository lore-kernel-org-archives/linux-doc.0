Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025024EA90
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598162; cv=none; b=R/gBiD20rnJqwrz1ux2wtpCyFUqVJF9csmIGSKDqQ06H/RtdsZEv/O+pDzeKKFD6LBGtOz+iiqQHPYTXd1X2gUQj2YWJp1sZ5T1NOgP9HtX0pLUdth0/g8KF3HIbIcxVR8f7rUlR7Kdi0uzA4Zkh8UJqZEvPy9EjiidDvkA+7U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598162; c=relaxed/simple;
	bh=xIYiLKWaJMwJkehNlPTmmW7l1oeBPiPWKXBdPvsnTR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kTZZgRcWYHsjI4bLJqGSy3VSayWjRGtkQyi5GydIfEQbYzQ2UpppcKckgCjXRjt8Pq2cZFtmim6FVeCT1PGAYLJOZsLR/WSfdfglgjA3uxvppRco3yJ1oQKRxy99GzXJThioYF2Zy2p1xCsFHanNirxwt+GgXHMj0sj5RCHhz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fb/K/wLD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fb/K/wLD"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-484392e3d33so1187364f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598160; x=1789202960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXXgK3vFKr5ZlJy42y1su29qXhHDXXAMM02bZzb7nLw=;
        b=fb/K/wLDJTVKw8sOLlnR1GMqCGb/27h6bvMXhm8W18tv7BgATYn4Ai0j4JTpTo6vTp
         TOuqioczZI7jBDmpF59daGPLJB7hE6Uzxs8MgylPPliz2p6VEsRn0dIuYmoQEGMUS4KO
         hrBg2qzs2TSfED4SeV2FkMxkAXKMBfYrsjefKPaiFVEs6/fzkUfhnn0YxnClg9rbZp//
         Ba5exf96CSlizR1q5KSitezwdBDgj3rcomRHnCMoTw5wBTFEPFJlnI3tSDdUHBHPoYqt
         viCSYzOziYQ+qWbZaUm8Hhqb22gXOYV4I3HdwczQqKMzFbK0wkLIe020my+PAID92VFh
         3ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598160; x=1789202960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXXgK3vFKr5ZlJy42y1su29qXhHDXXAMM02bZzb7nLw=;
        b=O1I+/dDNFbyLueXx3v0UTv0OoHuKq2mWgFAyo2xZgQzlkkUEKekq6dntR8rYZbD14j
         S27vOW4EKqA+K7eMoVhGBfWPjQZf5ZXGqJPYj5UZpeuflaLXKuj2xFlkOChvhTtHw1CR
         Iy6Km6iCnItzocFABbwTDsf2ShG0MLKgOdvkwbBuTvx5vWfj8hWHUAZYkwILoDAWbCEc
         voprllAlZSkLuKPu7GM1XL/SlGPPzvuY/5kgiXH3O2wZlh9sVIbmhcsclCUPbKBnaEmU
         KQQ8OImXk9cQlRbUaujekuFfP92B7t2w9tQiieyPhZNK0rSzXE+8PUviz6GsUk1WWJZt
         W10Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAzNV94V+QscoiVBAgCvoh1we7awMbKaWgp3qEUUEfmN3skWyY0d+LZ1aAxB0YYAYvyHfjQC1amys=@vger.kernel.org
X-Gm-Message-State: AFuF++nJfh+MyCt5tYjz19EOLshnFj0sKG9nJ0gk+9XdouJ784yKLen9
	13zy3nm/RAFocDFMJ+hmHO8iwBPoYibnkTsWd0u3RRc5IQ6dT1Y48JWwswVW5hDZ
X-Gm-Gg: AYBFou1I2H5ID68BoOhHQyzgQGvttcQpNfhoHxB2Y8XHPLBCZsmHSa4AYahqMKVI7JX
	J+hzztVZ9e+8LGJXJhhcUr4Fl1ua+q4B2LfCoyVKOBkXl2QszRuchJfNkCPV2ZvZMMsg3clo9zE
	ndasVehT/GWHJHfKs9AqTr0HfH17jHfqYvCwbF6/KJ0TIj90uEpKiXWDScR+6HDR4DObxEdC3xg
	utQ5D2FDrXvhtapu6+t5cmV+ZuUkQhob85tPE10kl6UK5L2n1SfbEfvYChYfqbzLhVqdf1yox8C
	JSuReyNoVF6j2BA6FjGBunBk+0m6W2G2sMWnCn6vk5IQ2ndrGOLgKKEs0uTXfrpVN3fDVnp1sib
	xovgY2O0SaC+Xr/+rGKP9xn5Swd0xorMEe9rcSmLkkpL18FVXW6VIeT5dtBUR9gmfLMsDLIRYZu
	Es1Fdx2k1sI2WpFLE4bXa8xRaOk3GPbdQXY7VAo+GuBrLzinmT7MtqfgvTVk/1as/3R2ZJirrYO
	t9aiCdmXPuqnVcnqkYnPteOc6Z8k4atI3Ny9clKHZetDyhb0eDMnkzQ53cZ0KatPb74Z8l2y8GT
	s/08vNjDfvDzEGSdSODVedQn3EqvCs5vH0jxfybTjjbe9xASZdDfVDbaiQVa8z54RLcO
X-Received: by 2002:a05:600c:a0b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49cf8262133mr117706095e9.16.1788598159566;
        Sat, 05 Sep 2026 01:49:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm9098615e9.9.2026.09.05.01.49.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:49:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-pci@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH] Documentation: PCI: Point the pci_device_id kernel-doc at device-id/pci.h
Date: Sat,  5 Sep 2026 10:49:16 +0200
Message-Id: <20260905084916.40196-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci.rst pulls the description of struct pci_device_id from
include/linux/mod_devicetable.h. Commit ad428f5811bd
("mod_devicetable.h: Split into per subsystem headers") moved the
structure and its kernel-doc comment to include/linux/device-id/pci.h.
Since then the directive finds nothing and the rendered page no longer
shows the structure.

Point the directive at the new header.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/PCI/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index be35e9a1ee75..71c42b0bfa8b 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -84,7 +84,7 @@ initialization with a pointer to a structure describing the driver
 The ID table is an array of ``struct pci_device_id`` entries ending with an
 all-zero entry.  Definitions with static const are generally preferred.
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/pci.h
    :functions: pci_device_id
 
 Most drivers only need ``PCI_DEVICE()`` or ``PCI_DEVICE_CLASS()`` to set up
-- 
2.53.0

