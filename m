Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FCE2EC54C
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777723373; cv=none; b=T87uJODiCnEX45JLLILkIt8PWC8mPXiOBiE1p5iKO6Ln5DAukLm2Y9zNL6/LPk1YW+OC46md1r6ugD4sKbQurMam5dllEcR8FYN0QJl+y1VWYrv/+WG7mdQeC4J5gqU3rfGm9F737t71kSHpFxhzKTeSwC9zFPQWAqRhspH+M+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777723373; c=relaxed/simple;
	bh=3INnfaqYJtlVKydOe32xg3MJIQCuBckCEpzxpEDMS0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdXlQSMfvB/O8J/ehaoa5NeK3VYLKmZu+wD9XUYp4zze30Q7gdf0Nyc3F5RVDz5jnNzY6afAAYZNIIo9f/vS3mA/7IF8Clr3pzWvC7OjcHFw/T1aya6aaFIoSwqTmIQcNyDvncWFITCRMOstlmMFIFgObmgSsqCdzcMAElOsq2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrqXJZyb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IC3FgaFQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrqXJZyb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IC3FgaFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777723371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2GdRS1eTjosloTRbS7bY0K4+qUs4PcyPn0xpWA1AQIc=;
	b=LrqXJZybpTBkcVitttZbALrLhKe3bl5B6j6qmSrSiy+OwxWHLyopLszglA1BeE2BE7wjwh
	XNnaA2+DMLtmd8/k91R3qv4tO9gZPIKrYCI7UgxOtRe+6qeSXCnfofmK+n+eEKiPi0utPR
	vApuDxUlQ2u4euRW7y6kfKruqRhdu6U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-hh471SvIOaKSQcVYmImWlA-1; Sat, 02 May 2026 08:02:50 -0400
X-MC-Unique: hh471SvIOaKSQcVYmImWlA-1
X-Mimecast-MFC-AGG-ID: hh471SvIOaKSQcVYmImWlA_1777723369
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48906aa28cbso28840875e9.0
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777723369; x=1778328169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2GdRS1eTjosloTRbS7bY0K4+qUs4PcyPn0xpWA1AQIc=;
        b=IC3FgaFQ9xC3I3GP5MQ20j4vcTPzBQ8ZfyQjUQPYdroUvM2/uNIJ4Hj8fBC6ZtTAwW
         6vxH4gUhFvzuXYd77jrmbWuXBLR12Om1yzkkzLpiTHsyd3cWZW0FesAugpagFkaiubzV
         0cMjbxYA+5QymVh3T4buuOtDjeAgK+3VbMdqNNBLZO5rHoxCkzQXP05jEeWnQhH6Zeki
         MeORjnTd40vmf1R93ybhgrueVbJHeci2U7kFN0CzYGjomMJyivus06JRvsvCJF3Po0iM
         gkdvyOkuJBX8nRR4CNYrtK5C848On9U1CWoqz6IsgDCb/V2O/Cn4bMG6RlzOyPiSiVjP
         6PtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777723369; x=1778328169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GdRS1eTjosloTRbS7bY0K4+qUs4PcyPn0xpWA1AQIc=;
        b=e1wJZtPF+1vnmmuqow9FDWnabAA69+gdDAd1/UOvDlF5l3weH0Ji5pVFkmxHBh4Ufu
         4SCY58jxYtMQN5+KH6qqjoQcB9I+j6x6r2uRCIQMnQ/kUizASRxbTK6/exIu4YpabH2J
         NFHGrasKeId5OyF3T3pGA1FUhcW0MVlK2Qqv9moShoZf5kzUZ+Ea65183JA3Wmqp1gTU
         qat/0fR/+NwswYSkgsLJMnGqyrEq/7lZqNgbJ1ZNj//jHEfTjYsI43v555im4Sblxm+M
         Eb2C4t/VrAeiPG3bTcj6Z1lUr5H2wB/2ahxF5uCZUKb/Rri5FFdfr8hteof8MqHv5OF8
         2mVA==
X-Forwarded-Encrypted: i=1; AFNElJ8gxYCcZqG45wKyCQvO3KruPe1SsxJVYQoFxWELq6fx1WA4ZsXo6dezCP9Sp8jV5nsOax40EmV0vYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvFJq4KRh19iZMCl+1YUMwQ3k9YbneVriU/g0UbHblNx5LfhZ
	YTTVd2w/SVCvWS7xxRA/qE4k0pGSNfrMoC5gL9Y2HfLpwc3hzMaLEp0WKizTNNBNzrXtMx6gEHv
	bw6bN9TpptFex4pgbBWh8qX9bA3CSpdzCORQL5sZfBnJEc4tAtt21S1nRHpkRbg==
X-Gm-Gg: AeBDievAKq9Rq8MsH6odRsfEc07vSso/O5Oz/h7NyWqfclPKKRiGeJ8nwb8i1pIxCXA
	g1eo+Osx7vj3hfckQhhrzLFVxezWWrG3odglZfk7/JNUrvMiGI1BwmgIBRrHnHJPJMdIDjIjs0h
	+Nseit+Ub2Wbx8xnaj6zy8DBbwy4rDthdeWnepDq74GwQ/vR6ZbC9SeJOv+thpMEVTo7SwZHKyg
	Z2VhKw6SCU4tHbOPuh0nQwXcDNhgNtfrV8WIcsfAScwEQBThxCy7hOWdFkgL19Ckdn5cl/Engxd
	5Cil5oGf0S34xjJe4mxy0hPHqziiD27Z8au/gRbPET0zDLpLWbxzx62tCAZmqcxgrHITIyn8kDF
	CIm4pk/Q3gJwjhh1YeH4LI/+yZ7+Klv6F38P/Ttaul89ZbHQI
X-Received: by 2002:a05:600c:1d89:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a97111ef3mr43047795e9.14.1777723368799;
        Sat, 02 May 2026 05:02:48 -0700 (PDT)
X-Received: by 2002:a05:600c:1d89:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a97111ef3mr43047465e9.14.1777723368398;
        Sat, 02 May 2026 05:02:48 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee8751sm55621435e9.9.2026.05.02.05.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 05:02:47 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v2] docs: Remove stale ISDN parameters
Date: Sat,  2 May 2026 15:02:05 +0300
Message-ID: <20260502120206.1289126-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The icn= and pcbit= parameters referenced drivers removed in
commit 02bbd9802da7 ("staging: i4l: delete the whole thing").

Remove the stale parameter entries and the now-unused ISDN tag
from the legend.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Assisted-by: Claude:claude-opus-4-6
---
v2: Remove pcbit= and ISDN too
    Address comments of Randy Dunlap
V1: Remove icn=

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c13c354728bb..96c189e5f5bf 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -24,7 +24,6 @@
 	IP_PNP	IP DHCP, BOOTP, or RARP is enabled.
 	IPV6	IPv6 support is enabled.
 	ISAPNP	ISA PnP code is enabled.
-	ISDN	Appropriate ISDN support is enabled.
 	ISOL	CPU Isolation is enabled.
 	JOY	Appropriate joystick support is enabled.
 	KGDB	Kernel debugger support is enabled.
@@ -2245,9 +2244,6 @@ Kernel parameters
 			syscalls, essentially overriding IA32_EMULATION_DEFAULT_DISABLED at
 			boot time. When false, unconditionally disables IA32 emulation.
 
-	icn=		[HW,ISDN]
-			Format: <io>[,<membase>[,<icn_id>[,<icn_id2>]]]
-
 
 	idle=		[X86,EARLY]
 			Format: idle=poll, idle=halt, idle=nomwait
@@ -5037,8 +5033,6 @@ Kernel parameters
 			the specified number of seconds.  This is to be used if
 			your oopses keep scrolling off the screen.
 
-	pcbit=		[HW,ISDN]
-
 	pci=option[,option...]	[PCI,EARLY] various PCI subsystem options.
 
 				Some options herein operate on a specific device
-- 
2.53.0

