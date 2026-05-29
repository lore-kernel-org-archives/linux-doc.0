Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0083A1A3C
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780032182; cv=none; b=guUDMSz4hn08nM6S7DYlg47Lfy0y7AXtZhZ6qJ4xfuPE1RUYR9oE5k+DzON7JLxOqMdavHPTF9fBJyhvJHHXUcjWUJyTGiExx21kf7ces1M0lONP4FPH61RcyLhNnUJM8E0dAp+NLDZnD8iKXPnCE3LZb9SA6hOU8ZBdo85qax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780032182; c=relaxed/simple;
	bh=uVEZU/+gipWULzqX7BJdsxlQpV9amP+FJ2XDIND7gxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJLSfZyC/MWLcFH+yW2oNY290hLPcZAOvI3gAeNz+oFYLSPzx156bU4oq96mrZKmCMZd26+I+qPOl1DFNyiQZjJCvV9R0BWKJTMgEb3anWhSETiatSX2ls4vYodIJPcf38lEv4vzlnNbvig+J5SP408ueX6JlrKWmTdyv8MfZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkQwhhex; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkQwhhex"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de46b8e432so11861425a34.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780032180; x=1780636980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwqBkxBqToEXWExg8efj0rcQqkFJQIIdG4GoWkLr1k=;
        b=SkQwhhexE7R60DljNv9ohdMXEzSnfrj0pAxxBDOWT411u8zrc9ZF5nMVbQ4a1qQE+8
         64U/p7HtoVjilzwL3qW3Mr/C7p5PT+xTyH1t3ykCULWc4rhNAvlEtobuuQyc/9JjoCWk
         RSVaQ6ylmjyG64lWrWpLTQ1AGpoVSn1B6E/gsZfMCEJl1FEHxMEdZdjsUJhMRxRbXDXk
         LYcLTALqEWFdk6pXYrDAzaOfm9ePv0gvVnGyXFFSVzAIfyGS7ejPhSZ3d3ykWp5z+zbM
         qXUD/+zRS8uNp63xQkbQCF3+0gzLvP7z1BzYrcIa3qkkDxOF6F+4TsgFec+je317hQc5
         49Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780032180; x=1780636980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6kwqBkxBqToEXWExg8efj0rcQqkFJQIIdG4GoWkLr1k=;
        b=rDl/8iV6I6t1PNJVfz/VyHR2/e96oto5tdpoLPtiCiCKxC8AGhK/e6tbzdjeHZjQLn
         H541zCh2VDTcth56vv6JQETdAWpffvdNgnfgHzY8ZipiBLx8IxUEvKm/54sXXmoo02My
         P7vuMlNNDzv883zA+baSWt54oowBHHk7ZXJNKeIFcTe/fLfiXI+eU+2oIfS9upxtCdWX
         1Ll2fuJJ7U6mfqB4sLoq/XZ71pn6PQ4HWvFR52rsnwotLISw2+b+lprWWfw3j7b7YxEr
         +tWk3MBS4kAFo5iaRMaid6mbp4M/wjkUIjq/9awFUhcwX6L7g632baKOb/8ZVKw0PKRu
         lq0A==
X-Forwarded-Encrypted: i=1; AFNElJ8IFFDqhPerOMY7IFSxeMe/yx6F5j52diUgYqI5rKX/GBo9CTDzTRbURRgLzf4Kq7Gq5uwlBb8wmH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+7LUzIfZn4j5f72G5vLhuL4OBzwJSArjNU9VXY6oF440hxbGB
	9E1iCOqmnM7qPyjMB2OgCRATs2p/iokhcJJPopWFxtpTfGgqhMEctMRo
X-Gm-Gg: Acq92OHT6BYY1Dp3cM3tA8pwMiaUe5rIKlEHNzUDXZ7s+fZONfZqtDSF9jXiVALkltZ
	oHucfS0Gfp4ucoVK0ndIb7kNSx6IU0AlBFywNw7aQ/GOx9LRsLZLxPACbaER2L9LfuZ4ws2ElpQ
	CQyXTdMH6uOUcUBxdgZQReJJmhOjANLgtmA+9hv8CdMwBet3KNn2n1foKG7Zk+0t5wK8ZxvduBE
	EoY/QRTZaCO4TZkowv6JXB8WALJbhGnq4uLv1gM0GxcCy7YTwf1hVo/9LmRghjLQbZ/9SEPHqVw
	PlFzuoEesRXrs+mChZAAtU2RODzASjRuWsbpjhKyQsLbm6Aisphw9JrNaPGkt1I4Hx+0i1L/0gL
	60yszxFDUihPblwEnMhm8TNrzf5gB8an6ZVtA9lkr5jX1YJ5UzG6Ul+Z+ScbzaehEpT2PTqEk0j
	xSkWrLtXAZKBv5HSpB377JleVev4Be43xS+TEBw9OXy4DMNdgFOxOh
X-Received: by 2002:a05:6830:2118:b0:7dc:ddfa:73e7 with SMTP id 46e09a7af769-7e694dfa401mr929130a34.2.1780032180459;
        Thu, 28 May 2026 22:23:00 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695bd790fsm760909a34.10.2026.05.28.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:22:58 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: net: dsa: remove obsolete dsa.txt
Date: Fri, 29 May 2026 00:22:40 -0500
Message-ID: <20260529052246.4934-4-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
References: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dsa.txt has been a redirect to dsa.yaml since commit bce58590d1bd
("dt-bindings: net: dsa: Add DSA yaml binding") introduced the .yaml
schema. The .yaml has the same filename in the same directory, making
this redirect unnecessary for discoverability.

Two files still reference dsa.txt, forcing readers through an extra
hop to reach the .yaml. The stub has not been touched since August
2020. Update references in lan9303.txt and
Documentation/networking/dsa/dsa.rst to point directly to dsa.yaml
and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.txt     | 4 ----
 Documentation/devicetree/bindings/net/dsa/lan9303.txt | 2 +-
 Documentation/networking/dsa/dsa.rst                  | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/dsa.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
deleted file mode 100644
index dab208b5c7c7..000000000000
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Distributed Switch Architecture Device Tree Bindings
-----------------------------------------------------
-
-See Documentation/devicetree/bindings/net/dsa/dsa.yaml for the documentation.
diff --git a/Documentation/devicetree/bindings/net/dsa/lan9303.txt b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
index 46a732087f5c..0337c2ccfa9a 100644
--- a/Documentation/devicetree/bindings/net/dsa/lan9303.txt
+++ b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
@@ -16,7 +16,7 @@ Optional properties:
 Subnodes:
 
 The integrated switch subnode should be specified according to the binding
-described in dsa/dsa.txt. The CPU port of this switch is always port 0.
+described in dsa/dsa.yaml. The CPU port of this switch is always port 0.
 
 Note: always use 'reg = <0/1/2>;' for the three DSA ports, even if the device is
 configured to use 1/2/3 instead. This hardware configuration will be
diff --git a/Documentation/networking/dsa/dsa.rst b/Documentation/networking/dsa/dsa.rst
index fd3c254ced1d..42a99f5dfa2e 100644
--- a/Documentation/networking/dsa/dsa.rst
+++ b/Documentation/networking/dsa/dsa.rst
@@ -509,7 +509,7 @@ Device Tree
 -----------
 
 DSA features a standardized binding which is documented in
-``Documentation/devicetree/bindings/net/dsa/dsa.txt``. PHY/MDIO library helper
+``Documentation/devicetree/bindings/net/dsa/dsa.yaml``. PHY/MDIO library helper
 functions such as ``of_get_phy_mode()``, ``of_phy_connect()`` are also used to query
 per-port PHY specific details: interface connection, MDIO bus location, etc.
 
-- 
2.54.0

