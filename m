Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3E830E838
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789379; cv=none; b=CVNYmnrdVWN2kAAlT/82gdzAscolsXzHU+0Op0lr6qh3JjmfDkynXSFJDoTW3ZcaIttq2AZmsvQizFrk7glVWAfoq6i+obFZ9hQT5DpMXob8EOWv5DbLCi6fuqK5YLCKuy7O2n5UlLogmNX4su7bVybLDU3WZQo51SRbZPILZvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789379; c=relaxed/simple;
	bh=OhZGOlTBF13Mqs3FLTxL2JDmSrIm5aYAHFnS6dI8ETo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnBJlWsddaJ9b0f5e2P+DyQ4Ydq0ggMtcyPpze7zzv/kNl4SyTrp+MgQEl3zgrR1kVGnY5s1Dm/jKEf63j9tWmoF2kXC6tq+OCO7F4HtJxI8gsd/52lSylH837a+M4TWKCqYbkAzmVjFCid3mDAjVRG39mQuI2Ui39AivyO1aWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbU3hQBe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbU3hQBe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b936331787bso1469566766b.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 01:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772789376; x=1773394176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLeEDEhf9GDxufVHFP+D7orc27n/ELYDA5X3/DN5+c0=;
        b=GbU3hQBeDLZBCZsh4Oa/9qk0M54CeyOORnhThcQrKHKkKNE8P6StNaqG/pxuuX99zR
         BCctaV+X6IkiiD9ASzN05wESsnkm2uL9jvgoiAdWIyG7KLaFca201iSErdC5bd93Y/LF
         X31aWX7SjsUC3m+q4FtbukDJhS/909gaoqxm585qybvTKU6NMluszmzPrWSgfUegyu7S
         X8nC1HLLIJeWMcja6HIg3cER1/pCd4Jvk5J2ZQ7Wqad/I2ED9IpFdMRkY4zHp6BYewdf
         d/QXes687U4ElpnIiko+C80ELrj7LYmGNwILxUG+ArTVomJFtrSRJZoZnEVLJyTuLxA5
         TSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789376; x=1773394176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLeEDEhf9GDxufVHFP+D7orc27n/ELYDA5X3/DN5+c0=;
        b=vsQol0kbB8S6Sn2g6IYcpfG/xJDXQaf6uJDGbbX3277VHHLz769fIGUwmotK8ro4N2
         rahoCddeaTbZ7IX912kzpEik+iEy8Ubl7WUiDM/4Hz+cAggxGci+WbE0mnJ3EU0/EnSV
         rsYWzsRdjpHkenqgXepx1BfMyXwQ4pFXMtH60+TleNFNNZ2XV7yA9imX1dB5WaWIHRjd
         hBtUVot7ixxpiVJkjH6uLCyq+rxX7CjuvFPiAZe8hZL/seSUtP5De0N3f8x9l72ePY04
         cFIYMK7RGYBcjjuObX3XErfmF04TOHhwooM7oJjlJ/lcrVUzn8URxgWrbYG6r4jphl9c
         dwFg==
X-Forwarded-Encrypted: i=1; AJvYcCXAOHmErzr+gSlGZDuqfMMvZgCVLa87h1cgxa1UJUnmNNU+jQwhiwnGnXbbkfXaKKI8rjjghYKWa9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+zIVM6krICvEK03q5rProfjS0A+vW34r2lqgZqiZGIasrX6I
	6EIKtXgUHDYF+wiCmd1ZC1c7dbnvTWBABRWW+/6GnzIICImdz/ePz7ya
X-Gm-Gg: ATEYQzyTS/zoGtysUKMMCG5C/jVXJFhL1Wr+ofXGDHkSZUJQPB3nWo+cm1HltUuxu8w
	+1yQ0+6Rbajc57BuTjkJQr8+4bOCzUoAZYHjz6LQsezTSluN0pcYf6JVQFdP7jHL8hj7N3i1hpv
	frtGHosY38RXCOtt8G6T8xELejaWgKDHsxy6F55wJeYljcnXZo+E639PhybKg5m0E6+cK5hP08p
	7ycf9xhcW8Dld9eG+mNSNfjUK99fdiRbmBw4dOsnEawN/gbQ3FmQ3ccz8QMabt1nF2IHhPNzrxU
	/w41Krw2dGtQ0OCdr7J86gXukBzgAMEWSpYtX37DznxIIULMHNxPgnAbyj508O2NFWghj1jGQNw
	Wx8/G4ays3R8+YB0Wg4hVuE0en+hTnOctISgTM9f3uIS9MX3HjzRSa+OpIjh1xIiyMemHH+R9S4
	+9FLEfMK86/va68WykLqLagRVNBOYW33jo+v1hnf3VTzU7Frc92OELPzyqVyV1jQy6cmc/VUoM+
	fWtMXjHhk4NLbeavH2xuds+Sb3x8Uy/7EcbnuKIr4F06B2Z6QDG82obBQ==
X-Received: by 2002:a17:907:d09:b0:b8f:f070:8c30 with SMTP id a640c23a62f3a-b942df8ad63mr78594766b.49.1772789375925;
        Fri, 06 Mar 2026 01:29:35 -0800 (PST)
Received: from localhost.localdomain (84-24-131-219.cable.dynamic.v4.ziggo.nl. [84.24.131.219])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm307163a12.18.2026.03.06.01.29.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Mar 2026 01:29:35 -0800 (PST)
From: MikaelRothig <mrrothig@gmail.com>
To: corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	MikaelRothig <mrrothig@gmail.com>
Subject: [PATCH 2/3] docs/gpu: fix typo 'implementions' -> 'implementations' in todo.rst
Date: Fri,  6 Mar 2026 10:28:21 +0100
Message-ID: <20260306092822.48393-2-mrrothig@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260306092822.48393-1-mrrothig@gmail.com>
References: <20260306092822.48393-1-mrrothig@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 Documentation/gpu/todo.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 33678b669339..4de61d19ecc6 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
-- 
2.49.0

