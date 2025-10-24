Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F6931A7F7
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303631; cv=none; b=hpwi2J3ww+NiZ0sYH0SQhYNtEoNND2mturaHPRo6h9oS8DfE48aMRNYM2Xrd+tg1KoNbgTE+aRnmsuT5ZvF34liPb8NDIu0vxe1rL2LIXtPW8/8FcxrcGAu7yEN5s7pMkAvmqrRPFpI9iIwtlsZ7edUvKGLHOJL+BK0WQb8Ou18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303631; c=relaxed/simple;
	bh=sRmLVb4WDCfxemO60P2Zl3Rgl7zJ9hn7HxwvQBrR0HA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbqvnOKejiTbU4aVqxzXHjZ8fmk8lSuIBO42IFY9sISnaArf6Cjo5/ZSidB/RVBYzm7d0HpcK+EdfhCECLdmrbKF78UGPYkile/fRAaF1rg8ZcVA38deBUBqSX4WkkwcQ/NiBdSn4p/79aUCddfyjP58mi0uHCNH+L3OAG0eaMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ohsc8+Jx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ohsc8+Jx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47495477241so15980275e9.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761303628; x=1761908428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2DlPJEXE9bFCg3voEVGTmMxEdVMG5zLWK3yFZXX/LI=;
        b=Ohsc8+JxXZo8CLR0CflOAnqkT3ZYz6TVHYeaEoc4jd8DqcmvfQN34oRj9bOfCo6ViJ
         SXT6pIyKIX06Eu4RG3ni6RZY0neRBkvteP9LH3c7Z7NZROTLRLA4p6u56a2LaNrJhVyx
         znAWEwOCrSHaBQLL8eOJDc9LYx2bAGEbS4hm4Nn3jpI6O/Qgs0a+ZdykQQYw5S0Hjrhf
         JgNwjBmEuR7stxJ2rAHcdVoyR9LWtey6PlubB+iPcQvAqLo4GOag/9CGJOP9moorcdfA
         h0he1B4X97jVxuOshV52IZqEXb6y+ClHQ05CnGl/7tPPk2TNGXTyq7rb6vYlAb5i7Qym
         2bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303628; x=1761908428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2DlPJEXE9bFCg3voEVGTmMxEdVMG5zLWK3yFZXX/LI=;
        b=nyxs46vfLGtLL2uvqrukr2gNdO40wlJrxutAFhg+12E5xWNVgfOCCT92UHvlJIoUCf
         Bc+nbJ8jnvUpeKVvbV+m7kAwXfMDNtfApiU24sSKnYgEyeBWJMYjPv/tUz0QzY5MVF24
         CPs6rtOsWMW3r8O2UV6S98uHjdX62x6gVFDIFGRTVEZWBgWJSIFAypPdNiub4WgGEwy0
         kPRzb0w9Cfe5gUAZS3oAv6Smlkho6+gpiLJ02jZ/8WUDMImrCxmGGi1F3gPP+KP7G/NB
         7MBim5WtluLAa2aBqtoTDVleo051UAw0uDjW140/pJKo07OJNyPhRwJHb2yczHvLvwcu
         Q38g==
X-Forwarded-Encrypted: i=1; AJvYcCWe5ZwUDR6kqufiWMojmhKjwaAdG/hfA1AuorUBsb6ZCwpMwpiXk7u/qOQpFA3jnSsgFXUsClVfA3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7X6y6NXn7shCuVGyTnKEpmvdtjWNVYkeeDpBNHlhVVoW0Q+rz
	vREajEXATA0UDOMCDiS8mfLq9/4oCfRSsFDfwS94c5tgFvNU3YbjyNwW
X-Gm-Gg: ASbGncs74jiXX37ncV4/1OLxaIGJqfcenjFk12I5yQsjS4EyqjwePL14bHycF0EBSpK
	IKRY/2QVdn1hfehEceTI8avlFizcVmBL9saESKwsVzUOoI8gkhoO66yqZdTpCvz4CrQr2dyQYOD
	zhldbtcHvSXRXeOuNM5OOb+4i3hOcAa/GAQe1S90QtXN9HPZ1nzqbOKGFVUa9R8xa/6T8p4uLix
	ASpoZwY/ksr7PuvSiPVYLT5vyKqTXW4vb2Cn2P4ULV8EDoRwdUqRFQgtGuGGfURqtqk5aQuikWi
	YTB2KwZc814MmeFP9n6yx0nOsWFa6d40XjO6b2/4ZX9c0Dr/mopfywscLpwAtDi9ZmeaXpql/nF
	WBrxVH1A/exHZODnWLc0EWuVGktEIXAZGTFqKAEs6WKtTxQlRoG6hA/VJb76rjo4LPTb7D8ElSB
	kNbyNgpZPhEfWVyQAAgJKN
X-Google-Smtp-Source: AGHT+IFDGexIqIJe+aeZRvtxTGvwmt0zUxNNK7H0pqVfPDQQTVgP3yUieL4uwsisR5iCtogwo4ejsQ==
X-Received: by 2002:a05:600d:8303:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-475d43c85bemr7875965e9.16.1761303626317;
        Fri, 24 Oct 2025 04:00:26 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae9253bsm82484615e9.1.2025.10.24.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:00:25 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] drm/vkms: Update testing with IGT IGT_DEVICE
Date: Fri, 24 Oct 2025 13:00:05 +0200
Message-ID: <20251024110014.4614-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024110014.4614-1-jose.exposito89@gmail.com>
References: <20251024110014.4614-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

VKMS is no longer in the platform bus, instead, it is in the faux bus.

In addition, when present, IGT picks hardware drivers instead of virtual
drivers, like VKMS or vgem, if they are not forced.

Update the documentation to use IGT_FORCE_DRIVER instead of IGT_DEVICE.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index d8c445c417b7..1e79e62a6bc4 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -159,26 +159,23 @@ To return to graphical mode, do::
 
   sudo systemctl isolate graphical.target
 
-Once you are in text only mode, you can run tests using the --device switch
-or IGT_DEVICE variable to specify the device filter for the driver we want
-to test. IGT_DEVICE can also be used with the run-tests.sh script to run the
+Once you are in text only mode, you can run tests using the IGT_FORCE_DRIVER
+variable to specify the device filter for the driver we want to test.
+IGT_FORCE_DRIVER can also be used with the run-tests.sh script to run the
 tests for a specific driver::
 
-  sudo ./build/tests/<name of test> --device "sys:/sys/devices/platform/vkms"
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/<name of test>
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t <name of test>
+  sudo IGT_FORCE_DRIVER="vkms" ./build/tests/<name of test>
+  sudo IGT_FORCE_DRIVER="vkms" ./scripts/run-tests.sh -t <name of test>
 
 For example, to test the functionality of the writeback library,
 we can run the kms_writeback test::
 
-  sudo ./build/tests/kms_writeback --device "sys:/sys/devices/platform/vkms"
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_writeback
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./scripts/run-tests.sh -t kms_writeback
+  sudo IGT_FORCE_DRIVER="vkms" ./build/tests/kms_writeback
+  sudo IGT_FORCE_DRIVER="vkms" ./scripts/run-tests.sh -t kms_writeback
 
 You can also run subtests if you do not want to run the entire test::
 
-  sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
-  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
+  sudo IGT_FORCE_DRIVER="vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
 
 Testing With KUnit
 ==================
-- 
2.51.0

