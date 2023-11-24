Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="kuZ0+Y15"
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD14419E
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 16:27:31 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c5071165d5so18148011fa.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 16:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1700785650; x=1701390450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haVpn9fvl3FQKPXQqTZq8l5X+Z7fEQLSNTR+x6poikY=;
        b=kuZ0+Y15aZOHrCN9ILYMuzyTZdieBL7vLkhqKn9r8miQfqXTteHyAKyIrWNKqfIRD0
         PcltV302f7NG7g/Ou+M02IdWVYcKpNMCvCLdxFcXyNi1uEtXYg1mI2nCz2U24Zow4Lvt
         mvtPfh2uN9WRwsiYo1GXP7uiUCs/YClsiwzXKWYfhqRZO7jviNxuuAZ9MknB2jp5Iqgy
         Q8+9hg8DGYwLkXY/TZUETAVEJ+4QzNXHovp4+ZZqWJKs9UpskErUvXHWgjhEG0IcbDwT
         rI0IOpQoBlT5kHCtS6PiIRK1RmNRB/T7gav60+N/QsIvjSZ7u+EUbU9TFpDeprbZZY1f
         W3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700785650; x=1701390450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=haVpn9fvl3FQKPXQqTZq8l5X+Z7fEQLSNTR+x6poikY=;
        b=pS0+qMAAgxNK6WpAJELVKmkf+fg+OPYOz++ZkTMzx4+8sT5+qhNbDeO/Lgjxd98yeL
         zstGgRVqdHIZEoHO35ZF7rLlU1VXQXKXsZz73Tty//Nxql7tkloWNyEp7GA5AN1RTH8f
         eCQn4iAvU79BoKDhN0pR9oYjs17fMjwN1ckRIyhNr2Ue5h2+ASO580Y9oHT0JntZvecj
         g2cFFvyu9zSc05JdOB7DYa1RyMgiXpjScI0pSzhbYVzmD41RwFXUO67TAoz6enfAewAN
         grclUBdurtJfNQygATbXjbmD/P8tQS4eETYI8HDBSonwGFTluue+vmqTvgxF49HSD8vr
         X/VA==
X-Gm-Message-State: AOJu0YwxEkHOPjPzpnZ3tfFyZEVwYniBG/XbaONFz3+X3ACTtb033seV
	nq0nI7Kx/7wlhzUTRyHfzRWGqw==
X-Google-Smtp-Source: AGHT+IHvSX4dfruCcOgcRtZCAUPbc5qH1FOaW1B+QFPdn0Cp+RKfLN7Aj9D7LHFfPa23KeJI5ynAGQ==
X-Received: by 2002:a05:651c:1208:b0:2c8:8813:2e7b with SMTP id i8-20020a05651c120800b002c888132e7bmr649558lja.2.1700785649997;
        Thu, 23 Nov 2023 16:27:29 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b004094e565e71sm3453230wmo.23.2023.11.23.16.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:27:29 -0800 (PST)
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
Subject: [PATCH v2 1/7] Documentation/tcp: Fix an obvious typo
Date: Fri, 24 Nov 2023 00:27:14 +0000
Message-ID: <20231124002720.102537-2-dima@arista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124002720.102537-1-dima@arista.com>
References: <20231124002720.102537-1-dima@arista.com>
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

