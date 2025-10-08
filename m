Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E42EB878
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922665; cv=none; b=csSVmzqDedEjoqJ38n8xMf7kG8dRXAmeQfeEDtrDwgEYAEQ5Fw6PA/rcsLc+cn8ZNbzhZQM8BhIy7ffp8qPcaUnLlb1hejdm8LSjlZOc4MegwV5ZSr7M6YKWD6Y+0uWhOG70lACZ2YiWF4yRJqaXtBtA7x6WcQaR7vTOjV6V9sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922665; c=relaxed/simple;
	bh=KhgwqCmWQnKf1NGRM9QzpocddkHPlKhp9lU+qW/BhUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LK57oMo5WNuTNkJ3WKQICdQIK+AKka3rOGyqMrXhb1M3aqEM+wu1HAnxzaRBj6pNsh+hHiBSWj0UcYfBKcLRM/0fdh59FGpuQpPVc9sXDLS9Q2K7AR4i1LV25WbNORxeGnzDfRTAQJ2wjfR37W6IWfPMq5GaJ2lu1zBYmjRvLOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KS6b8rgL; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KS6b8rgL"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b55517e74e3so8480808a12.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759922663; x=1760527463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpunCpJAgk2eLHa/FgrPVIG+nR6l3Db8tqGL3tL6T3Q=;
        b=KS6b8rgLfxaiL0nJqMlG9AFR6qZ7W6E69TeujeBoPC/fESE32iPnnK4oMT1Wlrfx5S
         1t19E4aRcoCV+vhk17rxCTOWopt7Jcnhl8AFqqS7ILz39yglcbio1mKTqPD3jLlvBsZY
         BkMxibSlYRO58lyipLmoIX2dVI1W0Gke+Hcv/1N36bYm5j0Vv0hlaNQhAm+MinUbu9n0
         9GPyfvXXReZOgxKt2xzGJ2YQwG4DWYf3RiR1DBpH8pWyYmeHsIvT21ZF/SLrJqzyQtwg
         qAnsNcTUcWHTNFjHh6LGhLzWPQ7tAzkENjR1n2YS8h/vLN4cH4NX2TDFgtHVUqet4ExF
         AvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759922663; x=1760527463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpunCpJAgk2eLHa/FgrPVIG+nR6l3Db8tqGL3tL6T3Q=;
        b=c4NOZ0BKKS/IFrOg+Uu/qkYTZ7WXgIzgWws3gLr8YD4PC6AQ6r+m00aic+PLbtmGdr
         VUxGHoJJCboGJf/I0HqDJReGwW8iMOQ6vg99VusoYLQNrDOFYSD7ZQl7XfZvUTyyNMoy
         oMhQ9XbAF8pu9h7wbCY3tFxjAaWytD+T+1tDaw9r/yE3s93+vSPtgTIhSt/8yQ6UuQhO
         tf8bHKAGsZVppt2/aCl+ABDu5Pk+P2gdJamQ5r+bkd1C2v82wMQJocrISBYhzLB5ndID
         DSpTiulop39+hMk7nWMcl2B0/GL3XzXubYCUz2+yM11g0ncDrvvm43wIR3qsd77WDsiR
         iYHA==
X-Forwarded-Encrypted: i=1; AJvYcCUkgnnvWh18FYoq7Vt8Yn0LTaKcECo/14BHxEdGbGluMqLqG1fDRyLmSe0Drmo3/HvpLyPOkxyqzVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPW/IOaMw1OVcFIq/t0usSeLf7Le7XYJGeDFOUCQgemicPIbfk
	EQy4mpFvMLlhCgrJ6mClKkyE4fip0+eiqsquRJeBhk9TYrN1B1InG5CKwtwdMfG6
X-Gm-Gg: ASbGnctH0Glr/etWhUstIKgm0bEfTnTYFfJWupdeZ+4nixJHOG6ve07C+PzqhhvbEaI
	/ipR+QDW5nOebqLrujXQqKPUWNfPYpOL9ILBmk7E2RMFY+zuyA5wZRQkl/2xN/8Kk69zWWytZeg
	V7EU3jFlxOilc93uW8sAPWclU7OdKgh4X8sSEdI85CigDdgUWavBGLpCQ1tdvxIxe2dp/GPWPpf
	VKpBt+oVd/ogIuKrPxeiMTs+nIFfp7ffP9JKdhV4Z6cjT6v9JVV0xCyo8yX6vdh0B07Hk7B+kQA
	VEQygkkBkNhKa9rcgqxtiVffYaTfA41vRQWuCh7x/qPuLGR7CFbwF/0pDJ1wm/3mDEpMHNJP62s
	lrNAepTbE6X2fONMTPEvEoU4zkD4gZVFVVNOPp9f7rrMNdkBYQQ==
X-Google-Smtp-Source: AGHT+IGzccRUgsYIfQOv4mK4YMIOcoXs/vxnypDZjs9mlFa+b6ZL037YONwW6vYEs5SdhyVUnUekog==
X-Received: by 2002:a17:902:e786:b0:269:b30c:c9b8 with SMTP id d9443c01a7336-2902741e45bmr39405215ad.56.1759922663079;
        Wed, 08 Oct 2025 04:24:23 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b87acsm197346765ad.76.2025.10.08.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:24:21 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 88AF54235ADC; Wed, 08 Oct 2025 18:24:18 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Serial <linux-serial@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Cengiz Can <cengiz@kernel.wtf>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Anselm=20Sch=C3=BCler?= <mail@anselmschueler.com>
Subject: [PATCH] Documentation: sysrq: Remove contradicting sentence on extra /proc/sysrq-trigger characters
Date: Wed,  8 Oct 2025 18:24:09 +0700
Message-ID: <20251008112409.33622-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=bagasdotme@gmail.com; h=from:subject; bh=KhgwqCmWQnKf1NGRM9QzpocddkHPlKhp9lU+qW/BhUw=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnPPNX+/1pfwGCQKK3s+DfytrPq9rOHNWqEbr17qcH5O qasWDmvo5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABP5uoWRYd0dllWvI757CZ/P Xq8s+DNbUjkyhFvf0IBjQolASOktc4Y//Lph27lub92yaKuATKC6kUfyz8MvfrRkFWS9tjsik1j HDQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

/proc/sysrq-trigger documentation states that only first character is
processed and the rest is ignored, yet it is not recommended to write
any extra characters to it. The latter statement is contradictive as
these characters are also ignored as implied by preceding sentence.

Remove it.

Link: https://lore.kernel.org/lkml/7ca05672-dc20-413f-a923-f77ce0a9d307@anselmschueler.com/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/sysrq.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 9c7aa817adc72d..63ff415ce85d66 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -77,9 +77,7 @@ On other
 On all
 	Write a single character to /proc/sysrq-trigger.
 	Only the first character is processed, the rest of the string is
-	ignored. However, it is not recommended to write any extra characters
-	as the behavior is undefined and might change in the future versions.
-	E.g.::
+	ignored. E.g.::
 
 		echo t > /proc/sysrq-trigger
 

base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
-- 
An old man doll... just what I always wanted! - Clara

