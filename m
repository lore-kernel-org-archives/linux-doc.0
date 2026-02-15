Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB122D9F7
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771161182; cv=none; b=JMByuyxO3rWrOVv0hlpH7ZFWRKjdWBefrkLvZmWHyqbY929CvnZldEoXu8xDr/uckI4zWc4E8rG//MqUe/5dPNLrqZyV3qKBzBgRqI1b2xr5w6Ji5IAdR53THdpWcp2uHeBy94Jyhy9cohISN2vpDN6cKmrZtIOlZ3ItRLx79R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771161182; c=relaxed/simple;
	bh=tt7bxtfArP/l+PAgE09PHLMdbFWOizBIi5oEMs3SJJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4gNakzbrexL0rcTK6Kzs5NMEiyzYNamgbCm/VbjlLoIKa0Suz8FdMXclgjCffyNPbSeqhNyhKYF45r72n1CQfV48eoy4/X2yF8WjGJ8z9Nkn+hAuAvQ3uZg0ouLjTmFIRQvvbHeDOV+pSGaxw3FqsU9INhwH4L+PBd8DYtDsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z5p0pCUg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjrKo7HL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z5p0pCUg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjrKo7HL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771161179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hh0PgHLJOA2hn/hqzD3P6Oh9Wnz9BFXmuLgfZVc7phE=;
	b=Z5p0pCUgtFw+3mLMcDzlvdgPIr/yr8USwsBfD/bnjHl3w87MEHSOQoETBgvI8idgAeqZzd
	7V18v/PoydM/vjgSlQTg1uZA7ebLPQzhzBfMreRsa2pxHDLM1/7zGOqyuNfFZkx7xTedTG
	gFZ8bejsCF+j3CT1vtPFChfAYFW2f1M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-xJZkPcBFPveYBa_NiMaFcw-1; Sun, 15 Feb 2026 08:12:58 -0500
X-MC-Unique: xJZkPcBFPveYBa_NiMaFcw-1
X-Mimecast-MFC-AGG-ID: xJZkPcBFPveYBa_NiMaFcw_1771161177
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso18715825e9.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 05:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771161177; x=1771765977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hh0PgHLJOA2hn/hqzD3P6Oh9Wnz9BFXmuLgfZVc7phE=;
        b=PjrKo7HLFDnoaI5q6hLDQIFoqJqo6RnbO9P1Gfwsp5fQx5qrSjM3dy3/7IbnktEsZJ
         dSPJhZtWvHBNDgkhzF4v7K5bb1mbi0KXoCZX6r/xRINpKD5hHVwcqQJvle79xs57VZdX
         Jn1ZNOmefDf2V0LbOLhlTbqxAPJox/iQO9SdQVNhlkW0rRxuZx3I89u76RsYvSwBKd77
         E4NDJj4cAhem0t8hh2q2cqey3QyS4kr5aT0o31mAHGGv9d34gUS6Dx+Z9kBocLmTc4C+
         j7og1K14Z4Nr6b/1zf1/KOb3XxYurFb+aGpH/lBbzrCbdvZ88hv+5irXc1Kuz8fbtL8r
         ezAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771161177; x=1771765977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh0PgHLJOA2hn/hqzD3P6Oh9Wnz9BFXmuLgfZVc7phE=;
        b=NsqNDIpehiMUK9UEwbCqEHhRxkCNEt+Qg+5rQgEcBiHVTamBtcZWN1GYTyoD2ttkPS
         yLJAoHHyTYclMbAC6xgnwhoJN8GaLZbOX+jK5vpltHvVV5mr4WFSbkvut07QndCtfwbM
         Yo3UQoHOicMsFe+ex9gbZQTk5c6b+Bh+F0dqP31qT9Bl9lPuTPXKzVbzzWC5gmdN+ElY
         MEqCDqo5XyuLyusdoFG5qZiN0KVzs8/fu3heOlxwVu2MizqND57J7Hao5KjW6B7LH/th
         7sL/Ix+O2XYB7MOMYTDFs7aUAv20v9oLkcCQBhNuJjziJ09zU95jIOFhYDoDm5gAKfkz
         y6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlsotuiwEpX/+MP5AcMYtpbl8R3BZiCNjt2NBNwQZoGXRmfmuew5UY1hnO0SRHedm9+gNbtFmLuPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+DDvBGmNBrjFuWHYMC4u1iFa5in2UVLuRdD4M3jqaNoqmqkbo
	d0y0ldURyiH3Rf/BfHftfhgR0rdyXqVKBM70bR1+Rl0GgxDU9XYdwQiWKR4DpjZss7lB6vZ7ACx
	Z3BXvZ3BWr2k9xrY6X/CQKyb4Eu8WCyuj4x4DsfGkeYheYLdBLof91GXNf06LCz5J+Xc6uw==
X-Gm-Gg: AZuq6aK1gXLupBQBkTF2nENJMAtO/c/hEIEsm2qKOIHqaLd46tw9ntpZfRZTfPM1pIL
	4w3hfmFmhOR4AkXGg2qeZphSiDm4HsxgN0MY8ADYuhHHSukYuc7nkawxsYA6e5KZ2TNoapc5s53
	dqVOhAclW7FRQwJcKo3haXmSc+Mol9/RqcGg0JjBuPg7nT/XnNTMaR572ZNt3G6tG+j3HldAMZG
	gdQg37h+wiS7jaUshRFd81YZ4ZDHZb2D0YeRmZmFeuS2lVRdQVg9pKIJYeNOLbvK9IXsd/h4ACf
	m/1+IQU5cg8HMe98agFTPWEK4WGkmLIjgJgBKCbFf3R0+b/el2D0GGXhTNv7VvuH0ONGVTuoP+E
	o8W20G2qEMMOOUkcI9wuRngqr7b8cPD3O5NDDEg==
X-Received: by 2002:a05:600c:4688:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-48373a37a1dmr111168465e9.19.1771161176947;
        Sun, 15 Feb 2026 05:12:56 -0800 (PST)
X-Received: by 2002:a05:600c:4688:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-48373a37a1dmr111168135e9.19.1771161176500;
        Sun, 15 Feb 2026 05:12:56 -0800 (PST)
Received: from costa-tp.redhat.com ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm515148295e9.0.2026.02.15.05.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 05:12:56 -0800 (PST)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] Documentation/rtla: Add hwnoise to main page
Date: Sun, 15 Feb 2026 15:12:48 +0200
Message-ID: <20260215131249.33437-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hwnoise to the command list and SEE ALSO section.  The command list
is ordered from low level to high level.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/tools/rtla/rtla.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/tools/rtla/rtla.rst b/Documentation/tools/rtla/rtla.rst
index 2a5fb7004ad4..6df1296b8cc1 100644
--- a/Documentation/tools/rtla/rtla.rst
+++ b/Documentation/tools/rtla/rtla.rst
@@ -21,6 +21,10 @@ results.
 
 COMMANDS
 ========
+**hwnoise**
+
+        Detect and quantify hardware-related noise.
+
 **osnoise**
 
         Gives information about the operating system noise (osnoise).
@@ -39,7 +43,7 @@ For other options, see the man page for the corresponding command.
 
 SEE ALSO
 ========
-**rtla-osnoise**\(1), **rtla-timerlat**\(1)
+**rtla-hwnoise**\(1), **rtla-osnoise**\(1), **rtla-timerlat**\(1)
 
 AUTHOR
 ======
-- 
2.53.0

