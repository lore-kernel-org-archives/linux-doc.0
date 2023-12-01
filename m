Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AJqYPYmB"
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2323A1B3;
	Fri,  1 Dec 2023 05:10:58 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B5B61C0003;
	Fri,  1 Dec 2023 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701436256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9FeCe/iJRh9PXhO+JUUpdycmH2P44LnefnJNVIv/kuk=;
	b=AJqYPYmBu/vDoqeI9rBu4CN8GosfUMAM2vgRkj1+t+8ObxZRYocEBYtYfbqbdzcnWL30W0
	tuGpzJtwIojPVVL8qILibvkexgcKaY7wB8B8oA41718xyiTvDJiPy8SQplMAiYG052ymRg
	itl6SdNjjXS3RTFldZfonOz6aiFIfA5xGQV2bBHnNX0BD49SRqw7E9jSLlFGbluhECx+6Y
	//s5Iqw1+gdCR8Q7C9wa4Mp+qWNgM7FHbUoHQLrtf5t2L4oTN4vQiFyCji5oSZasTUQfbX
	ZWDNQqBXlR0bgjXlG9QFmJDjk7ZuQVC6ydCPEmJdzK2y06x5aHabjC0L/aRLkg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 01 Dec 2023 14:10:42 +0100
Subject: [PATCH 1/2] docs: nvmem: generate kernel-doc API documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-nvmem-docs-kerneldoc-v1-1-3e8f2b706ce6@bootlin.com>
References: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
In-Reply-To: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: luca.ceresoli@bootlin.com

This is useful on its own, and it also enables hyperlink generation for
functions mentioned in ReST documentation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/driver-api/nvmem.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/nvmem.rst b/Documentation/driver-api/nvmem.rst
index de221e91c8e3..d5655b95c0f4 100644
--- a/Documentation/driver-api/nvmem.rst
+++ b/Documentation/driver-api/nvmem.rst
@@ -200,3 +200,9 @@ and let you add cells dynamically.
 Another use case for layouts is the post processing of cells. With layouts,
 it is possible to associate a custom post processing hook to a cell. It
 even possible to add this hook to cells not created by the layout itself.
+
+9. Internal kernel API
+======================
+
+.. kernel-doc:: drivers/nvmem/core.c
+   :export:

-- 
2.34.1

