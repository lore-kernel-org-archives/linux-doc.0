Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA73FDBE2
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868169; cv=none; b=e5sqUqTOcmVzc7rcY5owooFk+QiHMCcf4noWWoV+BGwjAcugfXd/Sp/4G3FLOZkXDC/7J+EswIEJsb6r8SqovQadqAY+TbrWftOeiCwDGA8uVcwtXRJ8IVsgwGGIt6H5bK26Sv3JBrQrkt9CjC994zn6OQTmfmndplme2+y+Uuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868169; c=relaxed/simple;
	bh=wVsqZq2pujX7Mzo3LIq+ONMgvAx8TwkKlQ7+abVJOkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f45FeRPQFAWtwrQpVS+ksvNBov3XhxxBwMtLAmWVwU/PMs+kX7+WWtX6t0Hl4+1AxR6v5lgaPDya//CcoREqdHODB9HNkJNaOo3YOsdNtc/ZgZFRoI4JM77THYaRyjt59nX2OeImQapjL55OZ8BO7fLvsKzj1qgZmUCKKgAhKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJUEGww6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m3toZXnq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJUEGww6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m3toZXnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778868167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pBTwi+jrHhMifAymDCS6TKusqewyQXvFSl5p7awC+y4=;
	b=NJUEGww6htzbwMbNx4ippGA3SE3vVVDRbAgRfkIYOkZrjhe5iwZk2RBxVfJEcfqCLs23kE
	I/imm8mcCqaaOVRmS+FefyNU3JpifZ19AeZqxRi+ULFGLLqFh6Hdw1EzVPRtCeGLHcmCQu
	t1FsDTrWSWXMLZ7Ub5Jpnd6zEf/FvNs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-Zn4W8qYaN-mR7cvmwk8KGA-1; Fri, 15 May 2026 14:02:46 -0400
X-MC-Unique: Zn4W8qYaN-mR7cvmwk8KGA-1
X-Mimecast-MFC-AGG-ID: Zn4W8qYaN-mR7cvmwk8KGA_1778868165
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48fe24773c8so364325e9.3
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 11:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778868165; x=1779472965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pBTwi+jrHhMifAymDCS6TKusqewyQXvFSl5p7awC+y4=;
        b=m3toZXnq+9DZdDjC0HWtMnnVMlfVE9MQ7z2Ma6bpKbdbnELs79ZZ4F9nDv/8BdPDAX
         QeTC5FtwEU9RQxIK/SpMTz+kT8t4PBrPkba9QMx74Xy/MCAx2+WDhJ+5f7QuyV/1wy7i
         PagfGoAFFF6+7dMaqQoV4w5HtVRNMdB61mV8do16Zn3v7KBQc1FzbemaLA7OFuPA2jm7
         rC4vFPI6ixieJ15qyFGvWkLqKWxMBX7Ecqnr8srtg4UjR/7W/WyNVx18l1bE+ZSAAa7t
         lEBfLi8+YhPA4w8+RU2pdXYcQ3DBeREII3Q9iog17prlQsI+8hmLQ0sI9e8XLnQEyaVx
         WTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778868165; x=1779472965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBTwi+jrHhMifAymDCS6TKusqewyQXvFSl5p7awC+y4=;
        b=i+KNY7N3VnWPK9GpU10sahpMmqYRXMlsOmRNrWV7htIwjJv0cyKDpS4ZFGY0pyRLUd
         y9kS3JCiJMy2t3KBIa9m+oW/HOJ9P4CRRF88CvCnLWTm68lHstEL4UrIU9NvZur9tKp2
         vFIDbsUVYWhmzKEqQy2qQpAz9h+KbvkKp+FYT3ZarbWaucS5owouTnkHl1mxwy8uR+5g
         VadyD3FZRSjA/UlEgHdjSw1y1Q2E9oq4DckULB2tZOS2/TA2Y4DGuqkmOAKv9/rTU6Az
         75xxfcKVuK+BZmvw5rAZYCag3OAgmL4G/dEgKlOZhmqwea9Q1jMFwgHkmKQ+4/Z8AnJp
         3Miw==
X-Forwarded-Encrypted: i=1; AFNElJ/6+k+W+hRWiSCWsSTtjMRsGCqAZLGPV5AtnyBtjn5GNSVz2TdSyNQ/Qw6alAebKw8fbehX+Szkz9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOLdOf83Q/ToawL1+db/TVGfTRj2ZLwA1ROIMgxCGDh/Yw44s
	YwFlNGRW4Hok6Db3khONMgjsPKvDlIZwm0NJ6IyRE1MBrC0JJIFEFTEpBcjOrn3LXjoJj5yNW/2
	shhPevSoG6Znp71Pis19ZgHdvziHHLgMI+NJFRm8fu6IxnOiKQ9H1wHOEKfwDJw==
X-Gm-Gg: Acq92OHj0iEP0LsFbDcs+Y8yLnEX/TTuzV5M1nmWmK4+XL/qzJhbOPS/D+Wc8e4F0v/
	PV0x2pfee3PXUvLH7py58JRZufalyYnnOxeSbR2NhNRQVBL7DwoFdZFrNJDzkv1nNL8r7TJFLbF
	G/eDhoreLmtGhPCamXHZl2rJByvYeUx4opiwOq5OXHUb1uBmpkQmQ+14Ms7VU04VI8O7zi1uN4e
	YXECFazebEgn0DJ+jClbMzAj5o1UxCg9CzAoXRoHIg7zBrjm09NQpKdB3vTOkd4MgkOXZT1EY2h
	RMyvVuFVL2N5sx9g62+/q5nlFWd0M5QYYFo6sk9MIeoAMLAzUIP2mXQyeyR2xflitc6+buAAFue
	auM1+BKuR0FX/1Je69u9YZk5U4SulbzoDQK8=
X-Received: by 2002:a05:600c:4e4e:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48fe5fd4747mr77301975e9.6.1778868164760;
        Fri, 15 May 2026 11:02:44 -0700 (PDT)
X-Received: by 2002:a05:600c:4e4e:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48fe5fd4747mr77301635e9.6.1778868164397;
        Fri, 15 May 2026 11:02:44 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab26ed9sm30566715e9.2.2026.05.15.11.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 11:02:43 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: sysctl/net: Remove ax25, netrom, rose entries
Date: Fri, 15 May 2026 21:01:57 +0300
Message-ID: <20260515180200.1490926-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These networking subsystems were removed in commit dd8d4bc28ad7
("net: remove ax25 and amateur radio (hamradio) subsystem"),
but the sysctl directory table still listed them.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/sysctl/net.rst | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
index 0724a793798f..3db464e006a3 100644
--- a/Documentation/admin-guide/sysctl/net.rst
+++ b/Documentation/admin-guide/sysctl/net.rst
@@ -36,12 +36,11 @@ Table : Subdirectories in /proc/sys/net
  ========= =================== = ========== ===================
  802       E802 protocol         mptcp      Multipath TCP
  appletalk Appletalk protocol    netfilter  Network Filter
- ax25      AX25                  netrom     NET/ROM
- bridge    Bridging              rose       X.25 PLP layer
- core      General parameter     tipc       TIPC
- ethernet  Ethernet protocol     unix       Unix domain sockets
- ipv4      IP version 4          vsock      VSOCK sockets
- ipv6      IP version 6          x25        X.25 protocol
+ bridge    Bridging              tipc       TIPC
+ core      General parameter     unix       Unix domain sockets
+ ethernet  Ethernet protocol     vsock      VSOCK sockets
+ ipv4      IP version 4          x25        X.25 protocol
+ ipv6      IP version 6
  ========= =================== = ========== ===================
 
 1. /proc/sys/net/core - Network core options
-- 
2.53.0

