Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="X+/VFNzF"
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1941998
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 12:57:59 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b472f98b1so19450125e9.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 12:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1701205078; x=1701809878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haVpn9fvl3FQKPXQqTZq8l5X+Z7fEQLSNTR+x6poikY=;
        b=X+/VFNzFRdRO9vBk8qEUd1Xvnsy/r8oXPIUgzuf9V+Ogbhq1xvTehaKGXbUxcuXqrt
         /DOT0HsWiA9Vgk1onV/SRvIeZz7VVAYPoMo2M9y3GM8SRf1LhRAS+CP7uIf6Y6DSsGQt
         VrqDihOSSvduP61EtuSPyhLTkmaWLvyxkW1uzWYR/b7TUzwKfFPjjqdg0SWXbeiPVpYP
         hMfMo1Z8klVPM+a/7M6NxSm9jj+VztXDyN7XfzzonPBa1QzWKSa/wWJ481a86OUkzly6
         DCsKuF8h9ZyLyQ6aqjySmL0nQwBSPJUiFLuIzfTt7EbHxyp4M28vIa2eG2IPbavVuxOT
         dP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701205078; x=1701809878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haVpn9fvl3FQKPXQqTZq8l5X+Z7fEQLSNTR+x6poikY=;
        b=vY4yHj4bi+cgonwHobSirQQJQg/E6aE+UPFBjy4SxxxB42E5PR2Qxj3ePhGrnH6x4u
         tLUm9X/aVH+wyeLItjwawQf+qFxxtXBltLdSv0xzMtWgNDj1ELkIlN/6Xhawun4a4X/U
         7acHMequMN/CsGGybsq/78LCTkB9StMBKmfg19YTNrI6Q1/h7INBj/nE3Hd/azwPcYWA
         Buome8KiefMHvO3Ccm3OnfCiYJXOQZt9nOYjg34e3MRSTpSUQdkIPL75YXBV6wiYQ0YQ
         AoiU5DZI+0Xhq1Njwu477sykdpHHoBUu+qw0A+BQ5YgJhm4wUz8tFynyJ+9/UrClaSmO
         ep4A==
X-Gm-Message-State: AOJu0Ywb/BfHpG+c9chieduIj9Nmy2uIEO4zAWKz4ETffdcXQHTO+MaH
	7LVz/vBMfv8+R9wRor6O2AQPrw==
X-Google-Smtp-Source: AGHT+IHe75ef2Bg0woYokUOqVhJa3Jdl5ifX0suMTxQoZY02Pt5ZCRGaUum+XIxfq3e9yYFWh54Hfg==
X-Received: by 2002:a05:600c:3b0c:b0:40a:6235:e82d with SMTP id m12-20020a05600c3b0c00b0040a6235e82dmr11675354wms.15.1701205077998;
        Tue, 28 Nov 2023 12:57:57 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c4fd300b0040b45356b72sm9247423wmq.33.2023.11.28.12.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:57:57 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Safonov <dima@arista.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Francesco Ruggeri <fruggeri05@gmail.com>,
	Salam Noureddine <noureddine@arista.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/7] Documentation/tcp: Fix an obvious typo
Date: Tue, 28 Nov 2023 20:57:43 +0000
Message-ID: <20231128205749.312759-2-dima@arista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128205749.312759-1-dima@arista.com>
References: <20231128205749.312759-1-dima@arista.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yep, my VIM spellchecker is not good enough for typos like this one.

Fixes: 7fe0e38bb669 ("Documentation/tcp: Add TCP-AO documentation")
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Reported-by: Markus Elfring <Markus.Elfring@web.de>
Closes: https://lore.kernel.org/all/2745ab4e-acac-40d4-83bf-37f2600d0c3d@web.de/
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 Documentation/networking/tcp_ao.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/tcp_ao.rst b/Documentation/networking/tcp_ao.rst
index cfa5bf1cc542..8a58321acce7 100644
--- a/Documentation/networking/tcp_ao.rst
+++ b/Documentation/networking/tcp_ao.rst
@@ -99,7 +99,7 @@ also [6.1]::
    when it is no longer considered permitted.
 
 Linux TCP-AO will try its best to prevent you from removing a key that's
-being used, considering it a key management failure. But sine keeping
+being used, considering it a key management failure. But since keeping
 an outdated key may become a security issue and as a peer may
 unintentionally prevent the removal of an old key by always setting
 it as RNextKeyID - a forced key removal mechanism is provided, where
-- 
2.43.0

