Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119D1E0DFE
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758242225; cv=none; b=EVCx8CjV5pT2oXcoC4hfjYhdeAJS02VZg/HX5unPt3rrtDxzJgQZ0YuGuL0fjvEujVnUKIA4vbV+FBJq+BVCrxtaJpkwW2vVntUY9MxsNp8G2AaVKhhoBPHTx+hOaQ9Hd80wujKr70/0I1JBhdjs9ohNY2C6b+UsBWs3IRFW8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758242225; c=relaxed/simple;
	bh=k2dBfrdNtLGAZ64PrS3NFKJy0ruuW50Pp0bwQuFiRAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPz4fqo9cVrvheCdqwfnlXouT+2/sTA3eqFq0f2d7LilffGXeCCZsulmAY/kwGq2YH02ZIejPgTfi/bGOLJrQjyeUgI6iwmGHlUhv6O658mMF3AxzvMVfhSJmbBgacp58zGugGQwErs9QpbzIaOXTZ9nptdsDPsmleDr/TNZHDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1yBAU0F; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1yBAU0F"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b551350adfaso744729a12.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 17:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758242224; x=1758847024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWbzRPCjSF9zkkrc1WhzONXArq9qHtgULo12Vo1t/Ms=;
        b=l1yBAU0F9OyIDzCYGvQ1xfpg8acZEoqH10xMtJaObl2+EZbCf4fXuWB2TZV5h10V1P
         Du7h8bmQyBrAWGs9mXNN5av5Pm7dVG2NfbsIPyC4AbSSpvvM8oZCFucIdSMpYXJ/6pO7
         H+Hu8kfOcyDoIO/CHJ+pRiyCLm6GFGgILkphr19ZIqbxkT44aaqXcJIqrFfs7iiP3Mm2
         BQILtMgRbZPh728zLo5SQz1MVLdlFRM7crf5XAm1UxIydmEV39NQjMv/qB8MPxC20Vh2
         bASArHIOvxiIq2yxbvkl0Y1hkPM4q8+1SmUzRA+/37aYPiTMvuhKfsRB2UL/zAHUukG2
         NmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242224; x=1758847024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWbzRPCjSF9zkkrc1WhzONXArq9qHtgULo12Vo1t/Ms=;
        b=VlDyZezq0BKDYa8pcdBYbGFL/3TDpLPTEgrebDBLYURO5DnW8BZfWeDaIq2bT8zKVk
         h/3kTgA5MLiuPsn6NUjxo+P2TI1XUjE8PGncQNbLG7cojI7T2O39LU2qv4r5C13Hy6zs
         gBGLhcKJaE5d/T2SzShZ2UwLztiAWK0Wg8fwrnYk2xl869FRrcoyPG/OC41pwZOvGqxR
         Ck2bfsnNchEHD7rialTozvtRIRv66mG4cQQdQJpgEf5Spl3hyW63ZvHKcMb4fu1mke96
         6K0x4eily1Cubhi55rviUvxkLX8TgUxFsg1NxLkvQZEA1g8rwIrEfI3vMc/HX99ltLJZ
         eRdA==
X-Forwarded-Encrypted: i=1; AJvYcCUIeAlkrCUUwt5uO8nZ0vHKJxRxF/FvJWW0NPuByRJjdIJqvLsCNIv+BTVvfwpIyFahDLYNvQhg+4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxinm3jFfymGzhlfCyxH/2tSlIc0aJ7ZLJtDwkX4IEZc/d9oNQd
	ZDpjlUjCNr9wVIcnhzMWhCKN5irKs8qhS3wMYhdssu9i5ErsYq+5Ehs2
X-Gm-Gg: ASbGncvLQU3FNeZnFMZrEbVdCVpMbe3v9Wjm3inRfMRaXSAu1S2PUrZU7wqAvTZ1P2H
	hUCRJNC2geK4C2Vc9aDrdlxipmkgttGNGmwQcqhtzMX9lchs2v/WqEmEsVVg9s6MmOKbYx9rela
	myumkQyVgnvw1kdLyrLIUoGVcaL7hb7rZxdRgWm9CbaCXinOUOo94hJrcraNkMsGaX8KErAjL2A
	Qeg1dr01Be/dTUOup8GkZbwXDLSSJujF4PE92iOysqOnQpbOxM5gyRJX+n+0kyYknConhPtjRC6
	CASDY+NKdD/s+k3PovGV3jckctWlVCJnwFWobOuTWgJLBi3AARekZmyC4ZrLipBupAcfa41Zosl
	/8zmkIbofvVx3uM/ynUT8wgYciELqFHR0TX3IT/i2
X-Google-Smtp-Source: AGHT+IF04noo2z6nfhj/WjW4j01+xVKhsQR6t2wKDzK6qpg/OEXcEUFT4SqFii2oCqgKJ7SG0yCTqw==
X-Received: by 2002:a05:6a20:7348:b0:243:d1bd:fbbb with SMTP id adf61e73a8af0-29274fb7736mr2077670637.59.1758242223625;
        Thu, 18 Sep 2025 17:37:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff445dd7sm3349864a12.51.2025.09.18.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 17:37:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3E9BB4227234; Fri, 19 Sep 2025 07:36:59 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Framebuffer <linux-fbdev@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Bernie Thompson <bernie@plugable.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH 1/3] Documentation: fb: ep93xx: Demote section headings
Date: Fri, 19 Sep 2025 07:36:38 +0700
Message-ID: <20250919003640.14867-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919003640.14867-1-bagasdotme@gmail.com>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=bagasdotme@gmail.com; h=from:subject; bh=k2dBfrdNtLGAZ64PrS3NFKJy0ruuW50Pp0bwQuFiRAw=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnlrS7CYsEXRY8VzLlwce97sGs77MD52g9PZglITvF2 tHuyhHhjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAExE4R0jw7Fzb+umPpMMTd19 ISEk4PLmfTIrrl+Uj/V6U3ad46ODfhsjw4eweXXK7uvdzLu5XZkaBaaXbdrsO/exk8VUf/bH/u0 yjAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Section headings are formatted the same as title heading, thus
increasing number of entries in framebuffer toctree. Demote them.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/ep93xx-fb.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/fb/ep93xx-fb.rst b/Documentation/fb/ep93xx-fb.rst
index 1dd67f4688c751..93b3494f530979 100644
--- a/Documentation/fb/ep93xx-fb.rst
+++ b/Documentation/fb/ep93xx-fb.rst
@@ -41,7 +41,6 @@ your board initialisation function::
 
 	ep93xx_register_fb(&some_board_fb_info);
 
-=====================
 Video Attribute Flags
 =====================
 
@@ -79,7 +78,6 @@ EP93XXFB_USE_SDCSN2		Use SDCSn[2] for the framebuffer.
 EP93XXFB_USE_SDCSN3		Use SDCSn[3] for the framebuffer.
 =============================== ======================================
 
-==================
 Platform callbacks
 ==================
 
@@ -101,7 +99,6 @@ obtained as follows::
 		/* Board specific framebuffer setup */
 	}
 
-======================
 Setting the video mode
 ======================
 
@@ -119,7 +116,6 @@ set when the module is installed::
 
 	modprobe ep93xx-fb video=320x240
 
-==============
 Screenpage bug
 ==============
 
-- 
An old man doll... just what I always wanted! - Clara

