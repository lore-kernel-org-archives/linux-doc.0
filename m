Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d64J0+YF"
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCBEA7
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 13:31:52 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3332e351670so5494153f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 13:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702416711; x=1703021511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l37jCex6rlt82MWndHmogDJSNA8Fu0vMs6uq0wbRrrw=;
        b=d64J0+YFjXjv2BtL9onTSs4AThjQOBV75kqIpwuyygIHpGexnPTczVp2pjGoOp0mb/
         3unf7yxQ0zh8m09HhY05THxy/vOTEF9j7dAtkLIaavzwPCTYBiEXwnP3Bw+WMXhktora
         xxugt48Vr5oUAR7HKjP07HPgaI7iBxqxKrBTNBO9YHBf3Ko887DkUYhhFiUq54bsi59j
         /12hkfKHRZMe02D1HQq02nY6ahEZRLZ6MNhL7/vonnj8Eor5E5jbBZEaR/iFw6cqXiZV
         tEaBU6UC6dx2OkbGxeaW+92azbWErWhhaUBGb6Joq8DHu1/TpbyzeB8NBdEVuNyCQpwi
         Y1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702416711; x=1703021511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l37jCex6rlt82MWndHmogDJSNA8Fu0vMs6uq0wbRrrw=;
        b=V15Kh+/VE3DQCVs3YRsick79tIFs0rAlzKS5Z/Z+hjH1gWHdOAlfRi03uBRf7MA4ZB
         8Xk+cnp+ZwulB8PuVM/iMjOfhbHdNNzZtd8/hYorJ/wUfGaUJ0TpvrASP6/tEpyAdoKj
         rnAGkUc89hNLwlNORbEh/0js3ReHHhNSEZqGRgi2t1gnFqgiYBXGqiwYdkVctpVCJe8w
         /itEOjuZoiVGImVWZFH2ne0pRcLdw03axQP/h39vksyS4rW7lmjDELY9s1xfj0VJVmDp
         PgDK3HIayKsCauMY18WqvWhydYkyNgfC+1l0aktExfXHNy7N4Q2B8YWrdVc8f+XR3NYh
         Ytdg==
X-Gm-Message-State: AOJu0YzcgmRHNdemUCPzf98lckDbB6kdKH6TodTYaKIehkipRZibR/G8
	qrelI3ycpuL/1k60DfecnYc=
X-Google-Smtp-Source: AGHT+IHk/tTMw9+Eeb4RsMK6Y1fNEq/9wFW2ikl6b4x+fQEAeu9o5mB61to78MaGtCntOIFiuwvexQ==
X-Received: by 2002:a05:6000:4c6:b0:333:3367:c366 with SMTP id h6-20020a05600004c600b003333367c366mr1873178wri.68.1702416711104;
        Tue, 12 Dec 2023 13:31:51 -0800 (PST)
Received: from imac.fritz.box ([2a02:8010:60a0:0:a1a0:2c27:44f7:b972])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d6047000000b003334898aafasm2078794wrt.11.2023.12.12.13.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 13:31:50 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	David Gow <davidgow@google.com>,
	Akira Yokosawa <akiyks@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next] docs: Change <h4> style to use smaller font size than <h3>
Date: Tue, 12 Dec 2023 21:31:37 +0000
Message-ID: <20231212213137.98453-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The docs currently have <h3> and <h4> set to the same font size which
makes headings hard to distinguish. <h1> to <h3> already have entries in
sphinx-static/custom.css to shrink their size a bit from the alabaster
theme.

Add <h4> to custom.css and set it to be smaller than <h3>.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/sphinx-static/custom.css | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 084a884f6fb7..a0ae9e90eeb6 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -7,6 +7,7 @@
 div.body h1 { font-size: 180%; }
 div.body h2 { font-size: 150%; }
 div.body h3 { font-size: 130%; }
+div.body h4 { font-size: 110%; }
 
 /* Tighten up the layout slightly */
 div.body { padding: 0 15px 0 10px; }
-- 
2.42.0

