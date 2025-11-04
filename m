Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97C4400
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 04:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762229917; cv=none; b=at731CqXaHygG6d6NtbvRKyAp6UqjIBtxnB38jt8TxNH6zYiFN6trIG0BYhMbthWPswWRH1kpp0qUSoDMrDUco272uTys58+ToObxpfecyelykATpIIQLNZUEWWGUYTm99SepIdBsXi+3NAN7y5EtOvddz+II2W+vhwTlCIDEIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762229917; c=relaxed/simple;
	bh=8855m9+nqy+8wYqmAZmw0bP5tKS9ASfH2+owXVBRaZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+zUC1zc+RUyc9sjOrA3cePYZQXukZjjZIPg4z1v0xrz8qlzs+0EJyM4CWHSpliMueMQGA6aQmCTYLOhJXeEJ77QlkyM+tM6WScx7zNf5T8tB4htZ/cr92TmlQt2AO//q+zCbrPsZYk1IUoZeMGB5kFCd1GYMVvTRO7ijORO0XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTlTFM0T; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTlTFM0T"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so1373669a12.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 20:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762229915; x=1762834715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0HMtYKZFYGMCTqL+m68iyK+g2w90hvxS2w8+ON2XP0=;
        b=fTlTFM0ToMSBftDU5O1wmYMTBQsx6b7HkTm6HJVEG3acqYzsbPMzXhutECiGuSB/mu
         CZV2Ba8JvN0LwuoNN7v9C+CazVrLw1yJ5/yEb5zUdtF5h3vli54VHEzhhilxD4OOIqfm
         VwBS1o7QdG6+6Yxc05/0fOl6slCkvddTjr+b6ZGE3B81OWnQFBuSA5Wf2BseNXGrak92
         OVMq/EnqJW/PYK6JAltfr6niznQYKesmAlb6PqtLujoid+95rT/Q+yVLcOypKyFu49Ko
         4XDvZOyAHb+rBL/GPGSt8WClWX+7nz/VoulH6ny/tPynD+OWVkbxOe1W5XMBADBLvY54
         Ffsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762229915; x=1762834715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0HMtYKZFYGMCTqL+m68iyK+g2w90hvxS2w8+ON2XP0=;
        b=BabtJrpZtXI/4Yeu3lpAM5TpRE8Fd7aXB1Nlpq2ciOW5LAjSH/rugPLPoGNWmRdZow
         0SbNUOmLdy2LLWy710NwyRAnsCEnMXS+yl9AHUHauG8EGG2uFxnc3wWTQYDg4Aactnka
         IkDvaZsY4JR9iA96LMfstPlOEG/qEyaYHKvFLmrxkAQxBJxLDacXcdtOLvT13hwHH5eO
         MTwbh0/EcFfsFXsFCa11DHdCxaugyDfh4Pf8IX01ioM4apSE2vGsmtKhxTPeB5ENSLRm
         Iomh6NPKR9FOHDarA0NZMA/k5mXOcAsW2QsrxLT98sACe+8IKtnXxRRebb+OpR7P4klc
         Virw==
X-Forwarded-Encrypted: i=1; AJvYcCUnUOuS5vLHjYCk1T7U41p2I/lS8a6aJ0Lfb+m/xM4wzpmeaBnuVtg/t5R1he59qUmj3OUwUX1uYTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6SazCSqFt5ZEbiSLCyHM/8n5k+kDNHVy0co6jwkgB6fkvu7n
	79C3IMzTvBwB3UJrha8nF/hM0K9PndkEiPpRWOqxubsZaOn+tilV65p5
X-Gm-Gg: ASbGncuPyc14QwGxVlTjYbftvvzmpvRvbs3bcs0r6mFo86953CSXPCr3iUjjEYsVOZQ
	xWYOqvauj0Do5ZiJrmG5PeVxx3eLjDb1avQBrGWUoX6u6M9ax+kfcqeToLPYSwD7WMGCdNjGHo9
	WIRtZOvZ/7iBuBrsk1Rn5fmYutkArUbPFW0Fh+uZDkU/g9sOgP5YODgaT+2m91MSA5no5wbxzeL
	tbwEXSlfmuXzr9ZfGbdrREfBKMCqoUC6fft++9IGVm0/14YuwXcIAffy0JoMhdGdLwyZTS1ZYST
	MvxGBYjiaghi5cEkadbQb7qSQQ7WgC9YVa9Bkp2N2xVJ3yfl/x1FBoSB8TpvU9cEZBgD+klkitC
	MKIQfiB2HKbcoRmodhQFzkrktisDOIQP3MBTSl3a9Pzpy7G0XvtNnEktXsD6MLQQXyrbdBHywmM
	qi
X-Google-Smtp-Source: AGHT+IH86x1mFFyx35rf6M/5gXmaVcDwtyw0wR56zZN3L/VZzuo6T3GgD57pxoyZP4hb3kyYFK8e6g==
X-Received: by 2002:a17:902:ea0e:b0:28e:9427:68f6 with SMTP id d9443c01a7336-2951a3e6517mr189573085ad.27.1762229915395;
        Mon, 03 Nov 2025 20:18:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a375ddsm9071975ad.72.2025.11.03.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 20:18:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9BF6A420A6EE; Tue, 04 Nov 2025 11:18:21 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Akshay Gupta <akshay.gupta@amd.com>,
	Srujana Challa <schalla@marvell.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [PATCH 1/3] Documentation: amd-sbi: Wrap miscdevice listing snippet in literal code block
Date: Tue,  4 Nov 2025 11:18:10 +0700
Message-ID: <20251104041812.31402-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104041812.31402-1-bagasdotme@gmail.com>
References: <20251104041812.31402-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208; i=bagasdotme@gmail.com; h=from:subject; bh=8855m9+nqy+8wYqmAZmw0bP5tKS9ASfH2+owXVBRaZQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmctQyHL3Vr1f2aEnB9x6RNWecn2vMF/tH6uP0ow43fE fOPuWgodZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAilhcYGRou3e3g2/Vy47So +VLT/Gectd2r9fb0utMHWO+b/8qrObCBkeHphOgS4aVVP3Y3TdmhmSYWrHJd6XvnnbxWtkeLfj6 MWMcLAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Device file listing (ls output) is shown as long-running paragraph
instead. Wrap it in literal code block.

Fixes: 4d95514d14e874 ("misc: amd-sbi: Add document for AMD SB IOCTL description")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/misc-devices/amd-sbi.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index 5648fc6ec5726a..07ceb44fbe5e19 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -28,8 +28,10 @@ MCAMSR and register xfer commands.
 Register sets is common across APML protocols. IOCTL is providing synchronization
 among protocols as transactions may create race condition.
 
-$ ls -al /dev/sbrmi-3c
-crw-------    1 root     root       10,  53 Jul 10 11:13 /dev/sbrmi-3c
+.. code-block:: bash
+
+   $ ls -al /dev/sbrmi-3c
+   crw-------    1 root     root       10,  53 Jul 10 11:13 /dev/sbrmi-3c
 
 apml_sbrmi driver registers hwmon sensors for monitoring power_cap_max,
 current power consumption and managing power_cap.
-- 
An old man doll... just what I always wanted! - Clara

