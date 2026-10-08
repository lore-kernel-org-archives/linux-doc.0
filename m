Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8066946C4AA
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459502; cv=none; b=a32iweOcM9D3uCrk7GVLpzAvQ5cVlTD8NnjPyhW3lBRL6S9KNxBSzP4wdyMGq4mFZzSsIuOoV28HzD5IqbHlKaZb5u40SJaX584lk+MaH9L2mBRTNgfr6fxLrykNA5CaAOEuK1YbMKe9xR67gCzntJrrZ/wxTtoLdBKVErue+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459502; c=relaxed/simple;
	bh=9e7W2f6a3jz8YGTOd6N82PW0wtiqPYTCubq/Qgl0fLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLZMMBVmtS5fCZbEavGE6YaDp3LUPZAGV5PihEMW/EVew7rr2i8NbLjPOP8YZLRitU/o9i9KZ7ODPIeKFkc/aK3qrqBY9Vu28XYyFHzX0yUCzpZUiR4/fdvrH18T77PShRM6uXONTQwaVnYNVDQ58WhKGJqIgUc0vqNiexb8wcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8XPJuhL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8XPJuhL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e49fbf92aaso18744225ad.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791459500; x=1792064300; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9i/+azlZLZIzmsgzlfAJlh5HU5L+X3Dl1o5h/G5ZaiU=;
        b=g8XPJuhL7dgS4teR9JbxDxXm0RpOZjwXlvgP1eohhNIJFTl+fA61jgcy/N+bFNXMrp
         MXSYTGtc378dR8MRHcGKYwfDsFJnEf/oac9mIQprw466khBgOGXJbW6sORymSOJ5ReSO
         xcdZW9TRxniPA/DrP4dI3FfQ/fkp3k0zeMVOZnzsf2KpKEcQAOBFmuaY6y7I5kwvUZkY
         C7Ee2UUPiFs1163+Nv5uZTUJce4kZ0gwoz9LK6qXiAzG15P7vni/uwRK3/HEz4xPyVT4
         ZyUnb7E0Ref+CW6L3jnEEXWa5rhWcdQDn78wUuh3bl7mHnAzzIkxPJgW9PUmKd6saH+E
         92UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791459500; x=1792064300;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i/+azlZLZIzmsgzlfAJlh5HU5L+X3Dl1o5h/G5ZaiU=;
        b=zGY30iwFa8t6pFSv9UGmrk5N6hFNU2tXmf1hQH2aeA9SpPqcdu04gnabzQ7V81pNZN
         u+FxD8ZKHRndg8jsK5RL3dXY+NSZ612rfRQwXcZtNGyol/r50irJFxARy6L2XZJJZjJt
         FDSVXe3kyTzChez3AcG5ST3o29mdm8xHd17kzdFWvHBjZvTvrdPkwdip17Wz03wr0j0H
         8yCiiKMlDwj9407ikEuwOZQW41ZwjUCrpaSTVSHgC8RH6wIZZXWG5DwRkVenzt8AexkN
         Z0sfQERIKO2ja2dJjGBgRlk/icSimWl7ilw5nqZzNkx2HlGUBpqp06iaD3eyeCvuSTXK
         OWEA==
X-Gm-Message-State: AFq9FYIe2N4W3xgJ30okdmY/6GV3q81MaZqSOLIOMJQ75r2NueuYiTBa
	J3QNRqD6r79Q2yUvD4UPtCPRo3xyxt1TG+EbIOXK8E4C8f715XYdUWnvK+O7dIOs
X-Gm-Gg: AYBFou0MMsvXl+kTcZ3oM83xnVOtygAFUrOdcb0mMlNgj/ePM3PDA/YD0L1Y4ZhQrWf
	UZXtIq5drWoVjCFHNfJFFxSkCwhxQ1cRv3JwoXwyXIBK+3JaK728BCh5aM33cWjKe2f7LRdj07c
	Umoz+ZCeghsXrpoMbLNRtAY+W54CxG0GlmAiGmq+0UAK5l9FOFU4sL9pMnJylmfG7Srkr1HN7vk
	X5F25KSxOyYrUPZvXVgnbwv3yfD28SmoU+nftQv/GbMlkV9+2hnGn5rPL2HNjggeV+K2VYzJeG6
	b8EhF2LzYSUVLvUrYBhQ40RDdBjPUaR9uWioFrSYzRLdKxSHe+5r4Ro0dlLuuo98C356wkV8OK4
	60/UYzgpwQmOqUX1P0MxyBSUqBvZUb/ZQPmxAXUhKPWgskmB9T6hB7WpudfJC4fZzcKE7VO5oiF
	V68E04zGC0gxleQQnRm3Frxz42MyBgykYEvrGdacUG/Yrfxyq7DlqRVWbc3WOF/qBjmOI2
X-Received: by 2002:a17:902:e74d:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e613b1f621mr35425745ad.74.1791459499719;
        Thu, 08 Oct 2026 04:38:19 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm22616365ad.50.2026.10.08.04.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:38:19 -0700 (PDT)
Date: Thu, 8 Oct 2026 11:38:13 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface file
Message-ID: <aseApS_MWoP3Jtp0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A path was misspelt with the delimiter between the USB <config num> and
<interface num> as "-", when it should be ".".

Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
---
 Documentation/ABI/stable/sysfs-bus-usb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
index cad4bc232520..400237db166d 100644
--- a/Documentation/ABI/stable/sysfs-bus-usb
+++ b/Documentation/ABI/stable/sysfs-bus-usb
@@ -60,7 +60,7 @@ Users:
 		PowerTOP <powertop@lists.01.org>
 		https://01.org/powertop/
 
-What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
+What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
 Date:		January 2008
 KernelVersion:	2.6.27
 Contact:	Sarah Sharp <sarah.a.sharp@intel.com>
-- 
2.56.0

