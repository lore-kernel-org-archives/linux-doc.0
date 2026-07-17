Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A83914FD
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318047; cv=none; b=BcxmSqy/bHju0tVaMqM2QyO0401nFYsFDN4t5Gmc83VQq6IW8PYMLXZ9ULAfMWfjQoAZgczQMaDAUnaB+2z7plYwZLR0xokhigg/IQI9phUt6uIZPoX3TTb3xJpM2ciujmtGL2BLLclGwqrO2Cl7QUNaf417+29M0SHth15HBKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318047; c=relaxed/simple;
	bh=qDEL+NdYHAMBArrfQo7xo37wngGQUozp4Fd2l50ofPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tp0Z/tqATE91d7nbDhmE4Pa0duD/6U+y8qLiXK33dHqBNKTx+EIpMntXFCQUv1GWoq2aHa30Wsen0wmmhEj4xdHep6Dtz94ioKobmsJm0z/e4gCLH0oTsz+iJtCuCaemu5EkM7soBdsXnisvWAsnd+2iukVypkWpfFZVyEH26BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+uxy9AU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+uxy9AU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c96c92c0980so3245515a12.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784318045; x=1784922845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OErWzxQXSQHPfYViK6AsSVvyH9H9J8o7igncn0U/Abc=;
        b=L+uxy9AUZC3kEidm+53y3EJTc7PQo7VYY36st+YyDjSGKiA59gU1ARKuXr93lIvTuS
         9LoCifD3NuTzEWYiY3B2v7f09wUfe9SLBRbhv0xAeC1DUPKMJ/HIRYweobUd6rx5a6JW
         i0vk/u+gGJoGWkd7/iaPFH5UPX8+4hezyzMjGfVCuZRzEMLU9HZKJQK/A9a1qBnUmccy
         ARbITB2d8E4nPPl5432QId6U59i0Op45A3C0thrkNKoRDaua+3ks/LJE2yjXqwe/KDbO
         l9H9zKCFV9BCMRVSIuZmI4tHrFFXRwqLDh/4PcuHaIxwfUUgniRL3L1bLx2H67gagbTo
         wGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318045; x=1784922845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OErWzxQXSQHPfYViK6AsSVvyH9H9J8o7igncn0U/Abc=;
        b=qSBYVAKb9/g3HOBOvIz9wP7V8FDf2brwbFCcfuV1B2sFh9SQrkZk4uck4D8IRFwZkM
         nmbZZxxfiIHJfqHmIWKk9CgPGVUcmrsjDWG2azqYsJbHUZxBLFWmwOFOoUijVneKPnJn
         IinupNpyiF/fUGCChBzdg6eL6VM+PEuiVytMq3p3Oh0jJW1GVqGKNhIni4UpNzXta9O4
         L+VfTCUBihL3+QljOvHUTE9E+gizUU30iPBjvSQ3KeytdqlORwnBZhcTQTgZHYvwdbE+
         jqb41VHmfZgZk+sFpU6z7KfBYKhH2GP2vrqWjyNILcsM5YAmE2oR1bwseZphS9NMb5AZ
         kDNw==
X-Forwarded-Encrypted: i=1; AHgh+RowbujfUBNve6QFCruF/rWEMT+OPxgW21/T79h8A8lBFGBW7QltMwfqrntYMeJaPmTiDEok55QFDkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/r5GbbpOK7zgJG40Oj5cgmAU02ugH/aUh1lfi6qQ6GWeeXt8G
	jkKzW45ASSrQGpBlnsRu1gWyqadVToeg9K2DIpIzk33e0vafHIZZBGYh5y8DlBQz
X-Gm-Gg: AfdE7cmmthNrT/q8uYhw9rg92p79lfxkuXhQEwqTPh0Q+AnZ0SAQ71uRFiSxIV02jy7
	jNLyrfWtVvLPOKx7vXLbaIPkuBoxdW535nEXyykU6+qeyhinCiDLdMcmtADyH2k33IjTa6JcKRs
	rRvERQNamQA0F5HRdf2NdfkOmiV4kG+rjD4brY67kNqZAfJzSDV8F0iHVAfvS+4bta/c2wGmAUw
	SiTd9TSi5+/tWH6LmC/dN3JJUcB87yfA0IdvmbSvIc03aQzfe22YxVkbHgDucHEWcJiKJjdSt6K
	vt4OwkP1oExjXnR8RQg1qbfj0GdMRVs3CepvkdbwQaiY0D28xluwb5W94HBjz84F1x6DZmjeAUY
	6i3D2KjqqdkE2NBxccwM8DaB1shVM/adRqGkfLo6V0gfH1HwgR7bfCBw4+vYMWr3FihOnUYxRcE
	Hr3/NseqtTJ1eIT/908IGwVkJNI/4P2AogeUo11413nLm83xG9hRGyj8S6uLKzvuFfQbBkyI4kO
	Wav
X-Received: by 2002:a05:6a21:6813:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c3adb1f025mr4919860637.75.1784318045058;
        Fri, 17 Jul 2026 12:54:05 -0700 (PDT)
Received: from ghost.localdomain ([103.170.252.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7103119c88.1.2026.07.17.12.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:54:04 -0700 (PDT)
Received: from ghost.localdomain (ip6-localhost [::1])
	by ghost.localdomain (OpenSMTPD) with ESMTP id 7fc67677;
	Fri, 17 Jul 2026 19:53:56 +0000 (UTC)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	stable@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH 0/2] usbcore: Add quirk for 255-byte initial config read
Date: Sat, 18 Jul 2026 01:23:34 +0530
Message-ID: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a quirk for USB devices that fail enumeration when
the initial GET_DESCRIPTOR(CONFIGURATION) request uses wLength=9.

Patch 1 adds USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
usb_get_configuration() to use wLength=255 for the initial config
descriptor request, mirroring long-standing Windows behavior.

Patch 2 splits announce_device() to log device identity before
enumeration, improving failure diagnosis.

Nikhil Solanke (2):
  usbcore: Add quirk for 255-bytes initial config read
  USB: hub: Split announce_device() to log device identity before
    enumeration

 .../admin-guide/kernel-parameters.txt         | 10 +++++
 drivers/usb/core/config.c                     | 39 +++++++++++++++----
 drivers/usb/core/hub.c                        | 16 ++++++--
 drivers/usb/core/quirks.c                     |  4 ++
 include/linux/usb/quirks.h                    |  3 ++
 5 files changed, 61 insertions(+), 11 deletions(-)

-- 
2.55.0

