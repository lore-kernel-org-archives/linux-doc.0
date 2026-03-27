Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58B3914E1
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616175; cv=none; b=AeYkzwewhbTm0304zz7frQATSnj89HSR3foGO99tY/A9ZqK4DC+B9MA7ReJJwaNCvXRIOXhtj3d/Oe+GZDElxX4l66xQapoCGxfauh4eYloLraX5Q0vnMys/2Z7GmAGSQyrL9JjmElnh3F9sNXNC7wODKtOOLmujbo15ObboKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616175; c=relaxed/simple;
	bh=SC4zFf4KhPCh2R8LWhNlRw4gB/Nr2njb1zy22r49p8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0L+ZHGe+QwUA1Xs2b4NpIz8meMfd9T55y4LIqDXKr4tVuA+QUPMaitIl1CMzhHGFwU4Z+VvYh54nHO2L99YyJG1btkiR5lFHQvpmbE3Yi9+VLppJ+6Bpn/sfV5qCQsNtGAg9nZ1YNEtsXXUfTPd75PgT2uCR9JIyUOduI+1ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUf+rvcm; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUf+rvcm"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffc8987050so1671092137.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774616173; x=1775220973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgX5/WqExva+5YKc3p6eoSzRYHD1OW/WVC6uLNtelpo=;
        b=jUf+rvcmoe0R2UMiXcjghuEgd3hQT75kWKwVmNVborZAxrUfDRFBC3GUdlw0vWQVMi
         TEWxyUmKYZa9wKnCasMgr+cR0gMBEFkG4fQHrmIy0JYwcuEFuTWEUOtmtLsqorVgFI1k
         RGcYvNPoz5nQVxQEtjTpVjkFO219oI3W+lf5W4S4GMKgtW+S0H5v1PgquHmDcX+br+H5
         gyboEaP9u7tcW8U22HOTHgBE2dWyCCciPT+kDfkv5B2sN5TeqLvEGCdve3ctgnoPPIWY
         dG6bWXCcgBcl4m2lTKNW5d7u4M86fw7UcdYiAX0/KjGutHD8Ghq4y43TlFDUkyNnvkHS
         Kz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616173; x=1775220973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgX5/WqExva+5YKc3p6eoSzRYHD1OW/WVC6uLNtelpo=;
        b=dZfcS8mRMfwfP0LMjkemR6Mc9Ac49kiqvfeKDb7jupDfZ8g/qvYS4wmEOQBlVXcvij
         dhV2I2CyENwJLfbDm1VGC4FcfR4XspHqh6xaePcrfRz0tHuggbTLo83dJworcovGeDzA
         v7f/5TptfF0M1w0PnGPhDFwXShAQqFw8CYjdGZ0bgO434jPexJsjuyBhwILjhzeQnHRZ
         nTz9zcFKmzTIDFSaL9inLRHroOlDhiJpZXhSuNy3Y4ST6+U8EtXKKTHwJoFwtRYNib//
         BeSKJtYc5RStdR8fCECDlVlKt+YArdYfwTjIEoF+mNiipQs+tkbgN2pVQ1XFP52kztiv
         r1aQ==
X-Gm-Message-State: AOJu0YyQveDuKhPkBS4wtfjoyc31ijHfxqomRUMPBIMCeuJWgmGnyv21
	KiIDD7jQCdbNgileecDyrCuku0Dtutf2j6UsL5fBhO3W3Y/m96lNR2Nl
X-Gm-Gg: ATEYQzyEQre+WAs6DjSNBquE9jwVWoGxs014pza5l/gdzWAyldEVNMzmBN4vgAzUt/r
	6v+xbmUR7Y9NSjujk4Qq2xD2P93gPfcYuKu/jQJJo8tZtipNqeDI3nzMCNMeY1qQcMBjveLdsJy
	fpL2n63peJxu9/f+pMolmhmBhIc5rd34BkWqDUr5Tc9Vr98aS/+Aa2sDxEtWZlVwURArrM26mbI
	ZuceA6Wj2KqXKPWhELr5YX1iVhmJBcxYDCOY0Zj0jaOKRcJIL4a5Ux7ToPr2PZQHPisV21YPtaE
	aj4R3P0Nj0qU67Y3IaY+ZZ8L6bevIiEfR+Q91YEVFi5gx68QTsmhCacSp063b5uS7c2/Igq82tc
	tGzkp8Yt/lWfT+qEz+0PmOMYGvYdfWmjDbqcAacqXE9MXbgUejePdMCONA06vwUN9J40SZvzSvd
	LBd4xKzIO4aAUPMwagJn3sirXZGQvgOZ6B2rBPysdqOVJfcpR68Uy5mdWHvjkRJfEh1YpnxbWfX
	g==
X-Received: by 2002:a05:6102:6e86:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-604f93350f5mr932579137.33.1774616173034;
        Fri, 27 Mar 2026 05:56:13 -0700 (PDT)
Received: from parrot.dimenoc.com ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d50c928asm6259318137.5.2026.03.27.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:56:12 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH 1/5] docs: add maintainer-kvm-x86 to maintainer-handbooks index
Date: Fri, 27 Mar 2026 09:55:32 -0300
Message-ID: <20260327125538.581064-2-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327125538.581064-1-danielmaraboo@gmail.com>
References: <20260327125538.581064-1-danielmaraboo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Include the KVM x86 subsystem development process notes to the main documentation tree. This ensures the new maintainer guide is properly indexed and reachable.
---
 .../translations/pt_BR/process/maintainer-handbooks.rst          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
index ba36df8ee..bf7a38147 100644
--- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
+++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
@@ -16,3 +16,4 @@ Conteúdos:
    maintainer-netdev
    maintainer-soc
    maintainer-soc-clean-dts
+   maintainer-kvm-x86
-- 
2.47.3

