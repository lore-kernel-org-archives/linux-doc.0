Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="fL8c107b"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4D910E
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 18:01:21 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40790b0a224so19674105e9.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 18:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1700532080; x=1701136880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx+xbR7vEy8WvypRwvrmxjfGzTQ6Jn5Kk2hdbYBJd1Q=;
        b=fL8c107bXMmME29r9Xb1RTi6RMMSXEhkw+rLp7U2zQhu85/QVhH71RNmBuK2EBpkYd
         ygdJ7KiN9QhI3AC+kjseww52CcUhpmq2z3Q5uCigxgCzPPjPkoH/G45Bzfz398/VNi3N
         ulNxk/tW03fAmU7852yNBIoF+YwauXcmDzmNW/gbYp09XYOI5lhV9bCuYf8+F9l+reNU
         zS04aatpJSkHZ6p2bPTTnFikRrSoatV+Hw6ZdvRAy7aryd4lbv9kH/tLCiC3uQL4/BO3
         nOmlFMFrqvl/QYn8cdbOmpAEvYWAVQDu8H/LdoG7s8HuATOU9ZGm47o8B6ljyH1u90Jr
         3/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700532080; x=1701136880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tx+xbR7vEy8WvypRwvrmxjfGzTQ6Jn5Kk2hdbYBJd1Q=;
        b=wTPfNXDmOschvy6boaQg4pkTYGVGSuhhhCJbPayvbjpApQMyyyp8sdV/gPylBTPPOi
         37iMFvLdolk6KWFXy00g5fKvpj7hIORSA0lU2ZS7Rh9snWbMiTXFq7knJU78peIs9uo/
         HtqXuFEpHl84VNuvuZ9HbExpwsmB9mxPCIj+PSc1n0cB9Ex3MrKV9H5VhmKUVuj2BLSB
         6Mo8AzX1hOU7IZGcA/rkFd5Sw2SfFw69+JoHCawxhky335Fz6Hx1aWe8/jwBWxiLGOy6
         SwnRIBWrCAYy9suYFVTMJ+gZJB5GIlGTQzd/thHyZNpEix0BGmr/vzeITxsf3durw2CF
         BuSg==
X-Gm-Message-State: AOJu0YwIG3VubmIrtFrnbs8rHsvHUlVBuMp48Q9GxfLp/3qFHahcGoz0
	g+9fdUInB/j7omukdchVqpf2/w==
X-Google-Smtp-Source: AGHT+IFKYDDZbYD7cqEdBrYbT7HZyrZmC0KpUYqH0Iwjou5g1nBYVJ4Qi5oQbDlIMr0oJ/5Pz+iE2Q==
X-Received: by 2002:a05:600c:4fcc:b0:408:5ba9:d707 with SMTP id o12-20020a05600c4fcc00b004085ba9d707mr8592956wmq.16.1700532079960;
        Mon, 20 Nov 2023 18:01:19 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id c13-20020a056000184d00b00332cb846f21sm2617105wri.27.2023.11.20.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 18:01:19 -0800 (PST)
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
Subject: [PATCH 1/7] Documentation/tcp: Fix an obvious typo
Date: Tue, 21 Nov 2023 02:01:05 +0000
Message-ID: <20231121020111.1143180-2-dima@arista.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121020111.1143180-1-dima@arista.com>
References: <20231121020111.1143180-1-dima@arista.com>
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
2.42.0

