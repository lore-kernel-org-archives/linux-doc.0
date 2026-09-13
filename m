Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D5037F75E
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789293079; cv=none; b=BSvVAj6qwuc3vxrlJtmTk1S07Abolj36bHhF68IzpdLvukcD2wMgPVq5E/35V35YvETCC7dGoRgg5BP2lOUr+YLWjhq6HzL4DrGespemb9Vokw/DgJWOL2XFmUsw2g+ojslX6mkUi4jdlh5YpiZkbuucDi+o2iM+28kEeXqE9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789293079; c=relaxed/simple;
	bh=jbVm0RLVeDlU9P10OCDpld57tDHcD90z/kytGFhXC6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4cOJZCvoDUs5h517WuRS2I7HJBJucIJ4A87lkZ5/nB7t3G1qLo3ZMk5LDgaV6H5EBr5CYV1Ij/5jv9lPpi5UUe9//7v5SidaAsfvUXIlYLgpJ+dBvNcyigD96pI1w0+GoxRO+cyb/e9DIj6T2VhSUHkRmD4lgUbC/XJDgNtSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nw/4EyLQ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nw/4EyLQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so193524f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789293076; x=1789897876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gcs5SoEwbG5DjCJj0LVT0Z2R1O7xtBNzbwteyqKUk8E=;
        b=nw/4EyLQCkwYfTO5vXLsjIHg8oWDopE6qgjNyiU6hL/cLbwFTeFG9MnCSG5O7SwpKV
         9CCwIUoSa7pd2xxsDWHj3ezcRfrxb+uBrdV6woLkRplgmGkfnti9BrSlRinXQTZBXyG4
         G+c1z43+41VOop36KotSePgGb/2pIf4pim847+TvN8m88HXPmB0RvpuDitYX0U2xkUKs
         7HILPXEC1B/aYpFATI98vCdoXVXLf0ElQPt964bdt8Y2jq3qaprVAFeHNNDzNff4a6SX
         tg4+mJn/auZWVfAPSkSlS0lI4J+qBhh0RTGGbEkwwBuotxN0zNL7s5iHYWinOy6xp7gh
         SlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789293076; x=1789897876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcs5SoEwbG5DjCJj0LVT0Z2R1O7xtBNzbwteyqKUk8E=;
        b=oYzOjtpoTRV19Cnsi7PUqVVyO3RJgCKoSxOcDiX4u8aiVaLJEXrde4Icjn+jI/WisR
         jtCHWQJsjZa6LfiqvhlfJ4H8V7ERwpn8xdYhw8K/qrXr7darWrjFU7Wo//lEzD2cQn55
         JBGScNQBDfjrqHaR7dkKjIfli3u239J6apQExrxR/5VkXN6E31cI/skFZ4el3fE23Rn+
         QgAsBji/unqbzPEO1qh8enYICKv5JtZ7YIZOWaJ8Pc9HCjyfb47dVHWqao3k/zcotvX0
         Ov3sxG5azH/NY5+DRhI7TffqQutDCdvcoAHW9VdBXjt7x89Hd4LrdR1EMRaUF4rTV0Y1
         bjqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFbyx2k4aUR8XZg+8AOqhSTwwfPHbVU99gBuKEbnK23CBNSe1YHza0z/6pyuwfGUJ4+0JtdbWN74M=@vger.kernel.org
X-Gm-Message-State: AFuF++nnEbQvaPQUW8hFqWc1prOYxIsWoUhU5y44Gx/mPvMYSzuS72Fa
	9yuoM6JfxI5nvVkQf4r2w5eGijwp3R95Wp7x9CyYnI3KM2si3O9BWnU9
X-Gm-Gg: AYBFou2y9mpMALPJ5OjWy7hHSGAn6wFL6nUxS7ShkgaJ8UJRPN/9xljguzTEvelavB+
	LKIHjlbmY/kssYnP/U1J3GlnqaNHJb2zoruy7aatZuWx35YAcZojSy68spP9yg+MqNrlr6qGqoA
	3Z+ngU53h51EIw3nAFPlu9mQlHvhUWzlG8VMBhLOcO12X/SOLq6UZnXvGYZqPpX7ZaSgEhTQJ6H
	R/wwenb47m9xLIzRUqkos/fSNko2Oyp82CHp2FeJV5g/Ja2wcIowXtUtoRyC6GLUZPd0qOiB8UO
	iwxAE3Wnrra1ui0IqC4uMaM2Cg+ej0xIFpeOpq6aHWCzlit3ZMDky8uKBYATi0FvJFEo1u4noyR
	3ZRFJC396SaFPQAFlxXzraCooegZ7kcpyZVw8MOwzKui4MK+9lEIgnQGHlGOCb6CB+WQKvpJJHy
	gNpgqvi5AgoKZ1vtv85vB625E0ymwWZZrJC42hVhAXyTijgpF6CAntEmnsP78U3PvVWpxJb1GLe
	qqjiTB9Mb6yLBpTQeadf2duWYc/U0ws3qQqnZeY/9lBz2P5t5yGroWx4vcja2R6u3K4tF+GMYB6
	02bQFXcmr59SbP411aRoGrIR
X-Received: by 2002:a5d:5d0b:0:b0:486:f768:395b with SMTP id ffacd0b85a97d-486f768400emr6172871f8f.0.1789293075665;
        Sun, 13 Sep 2026 02:51:15 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm17401532f8f.34.2026.09.13.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 02:51:15 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: rafael@kernel.org,
	u.kleine-koenig@baylibre.com
Cc: kmehltretter@gmail.com,
	andriy.shevchenko@linux.intel.com,
	corbet@lwn.net,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miguel Garcia <miguelgarciaroman8@gmail.com>
Subject: [PATCH] ACPI: device-id: document struct acpi_device_id
Date: Sun, 13 Sep 2026 11:51:05 +0200
Message-ID: <20260913095111.2543502-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct acpi_device_id lacks kernel-doc, so extracting documentation from
its header describes ACPI_DEVICE_CLASS but not the matching table entry.

Document the four members, ID and class-code matching, and the table
terminator. This complements the pending documentation header-split
update without changing its include directives.

An LLM drafted this comment and changelog after being asked to address
the missing documentation noted in the header-split discussion. The
field descriptions were checked against the ACPI matching code. The
extracted documentation passes kernel-doc and a focused Sphinx HTML
build with warnings treated as errors; checkpatch reports no warnings.

Link: https://lore.kernel.org/all/aqEWUBf1pewPP_K2@monoceros/
Assisted-by: LLM
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 include/linux/device-id/acpi.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/device-id/acpi.h b/include/linux/device-id/acpi.h
index 65800cefd..8c3b30ebf 100644
--- a/include/linux/device-id/acpi.h
+++ b/include/linux/device-id/acpi.h
@@ -9,6 +9,16 @@ typedef unsigned long kernel_ulong_t;
 
 #define ACPI_ID_LEN	16
 
+/**
+ * struct acpi_device_id - ACPI device matching table entry
+ * @id: NUL-terminated hardware ID (_HID) or compatible ID (_CID) to match.
+ * @driver_data: Data private to the driver.
+ * @cls: PCI-defined class, subclass and programming interface code (_CLS).
+ * @cls_msk: Mask selecting the class-code fields to match.
+ *
+ * Use @id for ID matching or ACPI_DEVICE_CLASS() for class-code matching.
+ * Terminate the table with an entry whose @id is empty and @cls is zero.
+ */
 struct acpi_device_id {
 	__u8 id[ACPI_ID_LEN];
 	kernel_ulong_t driver_data;
-- 
2.43.0

