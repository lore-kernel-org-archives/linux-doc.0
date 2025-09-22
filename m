Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D98303A0A
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758537400; cv=none; b=MaIoJDgd7WlM4XKHFk8kdex72FHZ+xTcUo20u7Az2yTQyJ6xReBu5zrL8wwYf3hRgwH5zFmRM3rRHeiKySrQt8IoywKRWn1Vy2g/3m7LC9Mc+2WgbrhJYVbkOaGIPKZqBOwUWAncy2vSTWOneh/IlmqEDf4xGIPlOWrjH+wo43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758537400; c=relaxed/simple;
	bh=5AEGBnus0Qpin8vE8E3VJOLKJlPJziaZtjsBzVOmbM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feBih/3Odc7AKz+ypPCYxjkqTc0YngdcTsjtCUt7xbTKwXldc02CTaQHeb0CHT9e4/MjvcwsnL63/xxQ6Z3D9ULWCb2V16r0gG1cffn+2a/WXLSJoyXfa352BoLz+DVdJhPNheeOlpp74HABQLoA9jcL0bOm2+PWRpO/XUMbkBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuJ5Lt2I; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuJ5Lt2I"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso3817002b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 03:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758537398; x=1759142198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja79xQC+jV0B6iDYhE4odk4g+YamsPvZ5MHaPQIPNoM=;
        b=UuJ5Lt2IwdFIRIIDzk3CWDnBddOWy6cicXVnmx+fWYcf9BZ5r5rs2FHI8wJr89DXnW
         EsLdGivCuqd7fZcmVSHr7o5BXw2Ibrz89AtMX6LDq/BTjvaR4hmPGgqCfVddcsp5nJTA
         VzMPD5Qk97zPqapOj7s/m0BtrhcroHyJ8prO4C1qfxPiMbaQYG1/XvHZhvyPl1iEgoPF
         1hcMR1FTFkPU0wMBSrqIJufwYo6a/YyqBUDx9xnkz2g/mQni83oqRxVUHhtRPrKnEYwa
         Nwf7EIQ4Bx3crXYh7Io6uy/cVa554+ASjBqA1/iS3ydGlUSzhDuaBn8TMOUusGQ6j7Ve
         t4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758537398; x=1759142198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja79xQC+jV0B6iDYhE4odk4g+YamsPvZ5MHaPQIPNoM=;
        b=gJZWTUbZBwguDu2NNVNmPUmquW/DXGGlD78dtROdfiqOMbYp2AWDDVjZHqf9WD1xCq
         2tQDobGkUW5Tdf0QCSwhuLD/DmZK+WWiSWnW+EAW0IdEIdgfQoulEjqyvoImI+B+6GyS
         E5Xeo0nf10uO9tvPdj7NYhLHoaiZg4qz27vGG4a6CT08z01DKzthGISZ2Qm3zwr9DeyD
         AqVQFCYujwpJNO/9+RanQRaD9awXF2IF15R7DNUVjux+a+HF/+6XJ3yqbilgSeOjxndA
         4BBDgRQvg6blP2QfFaJuLlUaLr4MDIC9RcIx6TMNzsbCijDeCyd5GI34SLwxWyPP4t4y
         RL2w==
X-Forwarded-Encrypted: i=1; AJvYcCUYqHTIB9uDsc1liCezV0Cbd/radMjHHYe4J8F8fDuAGzYTsl4QTKG8Xmvha2ScscutDgikQCCE+jE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGyUU9q8mlr3KkYTGTFUC9OGPeiSEeMj0mwq9pvD3BicKP11Q8
	k/20TYHilTn7vaoAuyb+hUy7KXTH+DPVTbciDDyp5Y+tVxxcmBYJ1smR
X-Gm-Gg: ASbGncv7N4lq8zDe3pU8sS9yN/236zIdPE+h2p+GajtFHLQw6eD3at9P3WixrebtSfx
	GPX2hvt5pDcE9Y+8usUj7qN7eQXVcjDXJ0I6htUYaBuV3kWcWwonv+3A0SeiSaS6YYQUsRVHfMl
	JDu/L8ksJ7+5MrXpC7RgBuNG9YCGPp/HoO8aLv8iCXI9VCdS4o/L8YO20eao/0sCNj9Q4NQ/mTF
	WPN30aKMFwoQ1I+TSBfng31JJF2yMIH+SgBcdQ5TVW+abFXzQw6o96O+jK7yaNhLpZ/Ln+H9215
	Jf4pTKqQrhG/chp+wpHecFYqscSTm/BaQaCTfI/rtaqpFpGJwFmDRuYe3FH8ehPXuF85d/ksj4H
	U/cmqY+HXnlfwmI0BCl8TRA==
X-Google-Smtp-Source: AGHT+IFjbk1Ge/dq+0OQP8qlAA9psarcE8O7P0zDwLh4eJYft0zHWrPMxSR3ke/HuW5RGmagj5p9LA==
X-Received: by 2002:a05:6a20:6325:b0:2b5:769f:254a with SMTP id adf61e73a8af0-2b5769f2904mr3892589637.6.1758537397559;
        Mon, 22 Sep 2025 03:36:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f43b6f6afsm1391686b3a.65.2025.09.22.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:36:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8D31D4266764; Mon, 22 Sep 2025 17:36:34 +0700 (WIB)
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
	Arvind Sankar <nivedita@alum.mit.edu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/3] Documentation: fb: ep93xx: Demote section headings
Date: Mon, 22 Sep 2025 17:36:14 +0700
Message-ID: <20250922103615.42925-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922103615.42925-2-bagasdotme@gmail.com>
References: <20250922103615.42925-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404; i=bagasdotme@gmail.com; h=from:subject; bh=5AEGBnus0Qpin8vE8E3VJOLKJlPJziaZtjsBzVOmbM0=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkX1QLfr+8rFNv9puHYSc34IO/K7k2cE549Xpo+tULlQ 0oDe3JeRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACbiGsnwz9w0YcmvlaXnjLN1 9yqKHxcS3Hx0B8+XW6usP5+SLeKd/Ifhf9INZrngmfMshXZ+kV68wfn1zFd6m9ZkZ1ZZHT3xm0V 7AwMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Section headings are formatted the same as title heading, thus
increasing number of entries in framebuffer toctree. Demote them.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
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

