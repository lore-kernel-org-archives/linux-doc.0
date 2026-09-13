Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5E3B6379
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324693; cv=none; b=GWr+chFZ1VVrLesnF56MLsKgpGjeAT1t7CL1QhMxVrHacHP1yIzxGBCgD3H3V78asNonyVbzEBV+Mllmpz/WHQmVZfXeuqol+kWVvl+oFfTJ/nW4rGhAhYTTADtPEkrNkKuWEySf7wg6z1EbXcGpCtoQrg9b+/Y5wLPi3TnSQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324693; c=relaxed/simple;
	bh=+cBOmdfMRpo1mKp8ZhzrQDLiYCnzdvGdytXX8AvmtTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXMYMtddlVAFp4kJmYGyplhHiHLzw9nlTMr8hKydc+Ia+lA2CIzVIuQtFTKzTKwj3GfI9uQH+Y3HWuIf/4WIe9iJuHEpvJnm8R9eROWoWrZfMKlthFtx6Krk+c8fMBNhzI2GFHwVv9ARZ/wQZGyXbA7GzyyUObbebihcZH7YKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR1wEWcu; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR1wEWcu"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso370556a91.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789324691; x=1789929491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8egR4dMbs0feNIgyGf2N4bg3BFUD4E92PNKo+p8ClY=;
        b=SR1wEWcuD/mMkbPBWlrbP1D/60M9OmaU+Yy/7tVisKQLnzOTSoVWuPxnoKWbGwnugN
         986M0OeCBZwK7RlX4NB62la4e2CQdZrbe73yaLoUk39tJGJmjRk4ISV3tT5C2QmVhSN4
         5mx1XMfwjH3tZ1eEvAYwy03ooRcEIte5tKgSJ7+5bWtdM4kwz8+eCXjuU2waR9ogO+wl
         cNSFes2SaPXPL851/HISNQplGpyjdGFVPOpCms1bqaFvQrVLeppdBOmmvgUvyuOcJzX5
         IHc37Lgk4M4dPqdtWxZpikcV5bUdttnpt7mibyYuMfVLVuTd2/AP5umnW7c5vu/cc3gw
         GSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789324691; x=1789929491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8egR4dMbs0feNIgyGf2N4bg3BFUD4E92PNKo+p8ClY=;
        b=Ts/vgr7c4UNj3MZ4l7/Bqal1Cs/jCACWIl+Dw+EIgXGJ31QPKS1/d/kPSc5laHlXIN
         zHKxXTJ9EkC/KU+SxT88BVcZsoGYuV9TI46wcLDa37VGKIsZ+Rqkt90nps5tKnCI6yBM
         oimAdLCGyId5SRLkHTUV5lwXYnXtSV5oto7ekkSPJziAxtLBwojP+FahdOovy8IqJmkJ
         b4iXOqTf7dTfxiqmgo4/gj3Ru+3MgOMgEcrO2/7YyPEXmuTIA0lyD6pj4bBbP0mBMp1b
         3j7W4ii0s7DtAUuTh7RVWbnpQBb4sF7Mv+o3bKTLbGOXFZkLvRoPnIQ9y5IlFwMj/Dby
         JmHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/MWs3WG2X2bAO2wCkzUYXwx7IYA2loqRA22Q4Hr4klAiRoE6gqT3N+n8GY11XU4SDPHzEif60zgs=@vger.kernel.org
X-Gm-Message-State: AFuF++ndgUbvTNi64VU5NV0gHQqPC6FObVY6b6VNObSZwGzwABJ7+JPs
	rvG3mJpDXgQO4honJkzSILpQQfk9JYNZ7Yp/VRoZdMxZ6Kiej7yMLVs+
X-Gm-Gg: AYBFou2RFT1H/6+L5tzw3dQNUpVAxi3PO8F1O9qPjzrGV3mwzQW2RbCJmvVySjjXm3+
	I0Iotp/H5V5VN983yzUysbFGm9WdUZRjsePMjKTE6Y8UqIaFrOflvFoaLDakDMbLnbnwodfsNy7
	pJhoVgvkQZ75/KW3t3D1lBxbeRisLQPkXXrCR29K22OKRYjKXApePw+53FgaTCl0lnRQ4LVY/Ir
	KQFf6rx9awTw7L2LP8TU00FsY/+PhBeejM5caywMX01KtJaGyZLRFI2DWtr7t1A3GnFqzCcxyPH
	m1aSdG0jMl0J5A/ATFlauiZrbSA8bWPyoEqg5liwp9yNHiECNeCbTGrl53kV2lJ6W+YrtBCWgAT
	ciYzpHZVKkJyTBurn7WSS/5QWBBuSUQ6tMy/4kGZOuqx6jhot36yfSCJXBt5+Yh9nu+sbBEa/Sq
	GYmdZyGuv2cs1k/+EsfASjXsa3Ek8StpUeGA61i/O/0EzYHKwPyz+/c1PjpFD55cpzmBqrvbTEX
	07EweseqsLXWvwWtA==
X-Received: by 2002:a17:90b:50cf:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39dd54d7dd3mr3783446a91.2.1789324690644;
        Sun, 13 Sep 2026 11:38:10 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b08165fsm4118447a91.1.2026.09.13.11.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:38:10 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v4 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Mon, 14 Sep 2026 01:37:34 +0700
Message-ID: <20260913183734.134307-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913183734.134307-1-vladazaharova2018@gmail.com>
References: <20260913183734.134307-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

