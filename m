Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9E632E68D
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 03:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515206; cv=none; b=aBGrywSMk3W7zayBXiNx3cPN2DH7ikN/57Swd0G5faL7EEpJBaChGpkPY0vk6iHM0lsIlrD9tULvsjveY0kC+zEqfemYVySOIR1view98egbtStvTU34sxmy5k6J3YvM6BpBENfdTgjOCY4vjsEquLbM5cPbjRjdTd1ExqOxgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515206; c=relaxed/simple;
	bh=5Uz2zi/HaHZ9scqnUVj7yk+2fytGfDAxOLNXAwt2vw4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=gG9y63IEzg0U4RDTVlHowCWq+eDwmKM1d4OnWRY+iiblvdsQ0rVcygFJbrKDrGGtS49G43Sva2sdqh9uIRyiG5Vs/Vp7okQyDTtEchckd/ZQacy7Nuwkz2YQ6BMovEevPUxlFECoYxHp6A3JU4/KTBDM0xYjfYRxGJYNybV+Zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmiwYATY; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmiwYATY"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88bda150550so2218458b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791515204; x=1792120004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrdVnUhtPNK/Av17PhvpBtm9fsARY9axkUcpxdE9xCo=;
        b=gmiwYATYJDVsrjbDD631PuI+E1Bodn447DUDkztIwobHVVaY6Tl9cwqDDtalGnjCCh
         d2IFLrQEBmM9JlR96GifgEEyp8Fj2tgUSMeQr/u4XPyIO/+RcgYdOg1OnWYwTft1ktzh
         gA0eNgrOcmxsdQNazDWxwCTV1kT9aP/8m0sHi+JYY40vp5K8dwI9KN4eZ1JxvnwOTOIX
         IBI5fwfLpMruw3GT1CwWfkZHTyVyRqDFr9JIU4cxYOy0fe6hbQrN36k8cPMUSsL54+PL
         /nR1sFvJJuYj4Hd3WDjucQtPhlWFbMXHy7j3bd1Dwg7y2BoX2TIBqkMwqohbL5kNju3R
         jKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791515204; x=1792120004;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrdVnUhtPNK/Av17PhvpBtm9fsARY9axkUcpxdE9xCo=;
        b=ipBwrRedaZgCJErMVPkjc2rIrygeg9CSdalN8ohDxn76YRZ+I0B5XQgn5C5MLU6kMH
         9cZPZcwhxtlH0NtSf/kBfBt/xVFhKOwH/vRxgEQ6plsYONYm6x74gwZ4URHYe9kTCqZi
         AUvuI5c7AgNJfNmPke1i/Eho7ZaGttripXcKJyRMkIhqeRJokC/aHQOxuoLf78NNgUQb
         TDPeHIC2T8GYk+oDf/5xjxnb36O9quQq5YBM9BJ8UWKUArDQxoPQEr0FK1WyeZ5ZAo9f
         XUJ3wB5BbaEaGfZAi5e5nFlhni1gWipSBk6z9zDssbbblCYJU+o0MYmkIZXjZ0pV2gNN
         L3AA==
X-Forwarded-Encrypted: i=1; AKwUvBypNu3o6punqEt7iBaESOjw/PhTqoE8yQce4C63Vp2x/Zk5O6q5oVbvjjZy/7dMUidyd/D/92zJzHc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUcjtdWYzr2nMlOaxcnzcGvl2J8EswFbf8OdyhiWU4vAbeqdLJ
	yJmxEB7lDS7astDB0EYY+6Ib+n2LX0J67TXPInhU9W3DWDFzRmnJiOhQcK+5Sw==
X-Gm-Gg: AYBFou0y/f8Zps1hWiCtfOAmb1Ob46TqBbtfc7GUu4s2tDdT/udBXe+B8nFW45yDb0o
	rgKHPam2yaSPthE3OFTU9JucjVLGXmGPfEa9IQG+ycRt5qrPVACdz8Iii7HuBVnTNIRgT8WkNVC
	aENeno6lbwbLj8lR+0hjguaxlj0po6ZToPrcgwuwUjzZNk2VvFj4sw8R/anqjL+tgqiITp60Cmm
	od+TPoWTB9KIFAfPIpgZNrticoOzCfctJ2VrcHOo1/RzaV4EyUlKTe37QDKdRAu8ni3KB6IYHTu
	sCFAfi9KGf90OhIxhEhDyHhNjyZ2p4JFq5ck7f9qmV6PgcudQbIFxxIAGt7/yd6MuM83/i1SGYS
	KQR34NcEzvXQYqe2IKTwLEgVVbGdd81oUCvJAKUvNN5wkgC/Yue9/V6FMBlHxZJS/AiRgKkrG3S
	76RgZKBVeIEwwTZu2l4623ksuoW6iu996qwXAPqKhOfItxei8esuk0sAfWZOVSqUQ8fnzBQWj4T
	5SXpxOpeVMEYp9abWvsCu/YVCaOFuGQvkv7O0e7OQVbmUtpwo8yMqjYpJxdars80sc=
X-Received: by 2002:a05:6a00:1254:b0:882:bba:8791 with SMTP id d2e1a72fcca58-897c73f9603mr484203b3a.34.1791515204273;
        Thu, 08 Oct 2026 20:06:44 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ecb01dsm320656b3a.36.2026.10.08.20.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:06:43 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: hyperv: Update documentation for sending VMBus packets
Date: Thu,  8 Oct 2026 20:06:37 -0700
Message-Id: <20261009030637.3869-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions for sending VMBus packets have been simplified.
vmbus_sendpacket_mpb_desc() can target multiple ranges, and
vmbus_sendpacket_pagebuffer() has been removed. Update the
documentation accordingly.

Fixes: 45a442fe369e ("Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
The Fixes: tag reflects the code change that was made. The
documentation update should have been included with the
original code change.

 Documentation/virt/hyperv/vmbus.rst | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 654bb4849972..77a437969b49 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -137,18 +137,13 @@ control message contains a list of GPAs that describe the data
 buffer.  For example, the storvsc driver uses this approach to
 specify the data buffers to/from which disk I/O is done.
 
-Three functions exist to send VMBus channel messages:
+Two functions exist to send VMBus channel messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
-2. vmbus_sendpacket_pagebuffer(): Message with list of GPAs
-   identifying data to transfer.  An offset and length is
-   associated with each GPA so that multiple discontinuous areas
-   of guest memory can be targeted.
-3. vmbus_sendpacket_mpb_desc(): Message with list of GPAs
-   identifying data to transfer.  A single offset and length is
-   associated with a list of GPAs.  The GPAs must describe a
-   single logical area of guest memory to be targeted.
+2. vmbus_sendpacket_mpb_desc(): Message with one or more data ranges
+   to target. Each range consists of a single offset and length plus
+   a list of GPAs that describe a logical area of guest memory.
 
 Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
-- 
2.25.1

