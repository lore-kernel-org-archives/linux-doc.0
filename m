Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE430BF67
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764125737; cv=none; b=Ca69KV2OAjzjmdA3RO89ZhwABWv7LMFxhmyPfhAW8imFuzKdCGRw5muDFlLr29paRY6P9PCUDiJrujF0e1sewSqrfO8zK2iUQPqCvfft7Yfsi5C8qckdtT2xDnzKYfXN3S6rLqPbhvWJeVd9RPiE6FYrwQpffq3f6UMQ+2ZeHlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764125737; c=relaxed/simple;
	bh=8nunAVieA4O9w37XssbSe19Y/uUHKYciNk0UZswTyQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fON5DNJqRyAYxMnE+XPuMlELi2nMItCr7VhVTPF3foH8EY5JtfGhqA8AGCvpaIbjhyE4wkMu5AqNqBbDBdVdX/dPodG8zI5LkxQzhQwfShSKZh7V/falZxRjqbkAW6nHHLdlKmuqp7BnR7sCZWdgsk1nugclZqqJ1fWy2Y+G6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Szd01XJj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Szd01XJj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5364414b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 18:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764125736; x=1764730536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ1v86AYgGbPvh9JwAml9Ork8fNwqowDeVVE0VvbE/k=;
        b=Szd01XJjeV0LzfRN767oKLhnDFiQHpuOxG9AvNIqH9rj6Y9cy8BmQW+UGO5TYksAoy
         DbVtfXWwAdyqlS1+Rfz6qwZOH6f8X+trKVe6fO/ydBmm+NZx/kDiUvFtpjzhfGLIhYWP
         ipgjyFLikclivm8KJ6yr9Jlr0ZwjOaRO0Uo5/PjP0ndOCbZi7hTc56nQoMlVmm/kGe5l
         0hDLu4QyQXG87GvXNHhHv7GC97XQQdG4Zb56VmmkyAd7QlUrp8UY2LPEbUV0ZV4bL44r
         0DaCdehsmDfUCNDncGB3E/GBqQe4O/Td5fTcDa9H2Lc7n6xbiG6A9P1GciPcM9eaAwNS
         B8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764125736; x=1764730536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NQ1v86AYgGbPvh9JwAml9Ork8fNwqowDeVVE0VvbE/k=;
        b=X7YqSgp7YOg8g2E51rXScGxfganuaxJadYkcuLTE6uc8rhGl4wO6L9+4+mtug9Nw1g
         0X7W+jV7XHliaQBJsoG0P6ivuHLWzrc0Ah+4JwmBIJUz5XPp/jnyw0svlvNLt+iIDCLV
         jR1fgv7Hgqxm01YvSpMz3nyRry2hEmPc9hLa0Umu4n+dSaPr+FgEbNqN454s6t/jLsup
         8kOtmzFfNQDtWgB9hcB+2i9IH0In11uAx6k3UYUFqfH2WtECJxmpC7U7yiwgURcIAqs1
         ibxsp2DWa5Q9VnLdKWOHFzVPOx4JpmAM+xrobw6rOQgpibnuDyRAVbut4LbQG/HzbVPH
         ADWw==
X-Forwarded-Encrypted: i=1; AJvYcCWzJZ/FALarMZXUAEa0QLD72AFJStPzbCrEwzsdATVqd3xVbYponmqdBFoAgVTurqqksy8D/+R9n80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaoEzDJpIxGp8cV+4NuKvGaaw4B6+Ix4WG+QOeQENV8POxITm
	xm0lOrtx9YCnIa6GfqjgnOIKHfuJw1NKiF14+DpI0/V3bxVUcmt6Mmhy
X-Gm-Gg: ASbGncvcXbzOUWdy1nC4j6AgVccX4aFF5V47fsyqcOiMWKBKsZKC21nMZ2sE3sziaoQ
	h4s3Qc3O+mVNJzvbcafbjSz2/EUaICi2w0OQlAS+Rt6RFJ0aqo2jNJWK8z2e5S/lSPWM4sN3+YL
	vEBBNKTa55GzF2Dli4OFwQTUZkPrOaRyo9A8hcl3FcTqpWCFI6ydENoOiXgn+WDiXvZ8JlD3/S4
	XcXWyYejsICeXSPyjSInYcwHaLIgH6YIoYJn6tr/qQc95xWk/kb00TyRofHA9/I42Btuxg3vqON
	GN7sU2JfwkIGcC07c/eY48OjQ+0hc2rW9Ox5SIjgcvnZHgovaTAA+GGVxue4Dzk25jLZ+FF8FXr
	u3qgOUcFnL0ud3C1vH9cBkbBiwe2ElpTE1zrArhaxdDS5J2QkSob8bU3t4RjXLjBz47lc7UsT+m
	pZ81qr0+34QBjjByeCkAXy0w==
X-Google-Smtp-Source: AGHT+IHVbc3ystjG28RtgjitLUwnGbdDdLuynpzu0r2WvQ0kwUE3uZgm5k7gSSYgMAKqWiy5okykew==
X-Received: by 2002:a05:6a20:a113:b0:35e:8b76:c960 with SMTP id adf61e73a8af0-3637e0b9e24mr5630671637.48.1764125735506;
        Tue, 25 Nov 2025 18:55:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed076853sm19509628b3a.2.2025.11.25.18.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 18:55:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id DB3254832699; Wed, 26 Nov 2025 09:55:24 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux AFS <linux-afs@lists.infradead.org>,
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Daniel Palmer <daniel.palmer@sony.com>
Subject: [PATCH 4/5] Documentation: zonefs: Separate mount options list
Date: Wed, 26 Nov 2025 09:55:10 +0700
Message-ID: <20251126025511.25188-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126025511.25188-1-bagasdotme@gmail.com>
References: <20251126025511.25188-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=699; i=bagasdotme@gmail.com; h=from:subject; bh=8nunAVieA4O9w37XssbSe19Y/uUHKYciNk0UZswTyQY=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlq2SsNV+7S11lwNj3sN9+CopKTmXL1y5st55zpvuSz3 cD5SZJERykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACbiv52R4W3lqqx/yYdn2+5j D+ltmfmhZOHfr5knp30VlAwpWJa/zorhf/3sop16Wutqd7Z9cup+8O+y0JEPAceWXC+vzUszsDU uZQMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Mount options list is rendered in htmldocs output as combined with
preceding paragraph due to missing separator between them. Add it.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/zonefs.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/filesystems/zonefs.rst b/Documentation/filesystems/zonefs.rst
index c22124c2213d5d..58cfb1183589dd 100644
--- a/Documentation/filesystems/zonefs.rst
+++ b/Documentation/filesystems/zonefs.rst
@@ -307,6 +307,7 @@ Mount options
 -------------
 
 zonefs defines several mount options:
+
 * errors=<behavior>
 * explicit-open
 
-- 
An old man doll... just what I always wanted! - Clara

