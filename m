Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536623;
	b=ZT0yYv1x5xbh5OgOi7GVzb+yLYl1n959uMU8X8IIn5uTkS0VFqCruC/XLHPsFV0Hk/ld
	 gKVQX6qzj0lyiIJSzm7joRqdlW14c9/Pt5a9/mL7+8xAV2VTBIoIKyFVFk7dUBAwP0j4Q
	 jOi0QZEGMibpjNuneoeFbaRg4A3WUwgAEGY+26VRYSEbsfIDuXwX2gU1T6ZycvHbMA2LA
	 D/o0g+4UNFYW9GsHwnr1sU7wmt0gOKyQk89qOcIkFlwbj3KUXlAJcjooUhsvIuQVcTVxb
	 TFbCFW8k89f+iYfoJnu4DPTXW3vUs3XEoTiM0HJEw/Ws53VK13Z48dIJt1gorXaEnqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
	b=O3RYEsShlfBYzxFFngtxYYnEH25zzHA5rHzViBVm7wDytu2Bqv7QvRoUavI5VKAH59fu
	 zdZsWqv4FYWlpG3524Yl/fby43maefcaqw1kqYXinvqA167pVSmYP5v2klj42fBsWfj8J
	 jL6oBvexwKXvZkeiOrpgov6RGMNzkxYkDqRR2ugszZAPoOi2gFktkQlItPJEaALdQLX8Z
	 4zFlB4JtAAULn/yCboff5I67D6HTTgpsbVA4O1pkeNHt/jGGUI9BiAxGUWiEQo0pyJzAp
	 89GAEKdscHjiho27t3B2LjyFxyojJdX5VWm4EEmzVUMBjFew6UA+lrGVNoEMXV3hlCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6BF60A3827
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6BF60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fuL01yBC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso1064625e9.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536622; x=1793141422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=fuL01yBCCOgff8Fcjtg40uzwGWns4yu2K79aOgLmuvLPTIqIq6xfOwGY+eNrV9NxYB
         NuLHXc6OKmZrjivF7l9UL8tnxGToPClQgFvUmKZMSX9ccJDpurVRWobpNkBCtnmcNdUB
         aQBh1L8VU/HjBgiGcJVCFs8z60tJMgw0CIfCS3TebzUjoMpedcSRCxPnL46oPTfekM/r
         EAtK3JGq6+2HquC1sETYjEiKdU2nyybu/oRxBP5t5d+kfuC6EVRuAOXmVBxFkmGmxVXv
         ZKdQvz79m7F99pOrPsWabv9/wRorRrzeQu6l+DP8GgJvbkNo/joMAomOB14jA7mMTEOo
         rlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536622; x=1793141422;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0sFZviiuD58KoKuefE1C//igVvTgzZQdIYejlrorjA=;
        b=kC3gl4LWEP2cS4h3W/7hd9EC/p1JOWGtRVbK57XPHb6njixMM3e/bQ07MuAHDPDhgL
         gox1EdJg3W7Oni75yaXkQyF83r8XTutUfbd8Bw3OIr0owGeyRnq8017ap8fDpR1ONM5a
         Y3+211A8Fb+qnvxQeAUPJfVrmOjvmj7OdrVD1EVdIJDRNwfwSo2QoREUQ/dZIW1YXJzG
         m22kfkkxqDsjm6pwfH1P5O4IvYHGqjrdcTFXBKqkmQFv8Px6hGFFUzDtRyiPPm5TJMca
         y0rGi0g7pcuT+nEOg6tMnmVIay0fPSOiLEUqsgFNWR7lu/8lTIcv2jQvQd7/0BeuJK6T
         3EJw==
X-Forwarded-Encrypted: i=1; AKwUvBxjm4vfhRgxbyPDGHsLSv6mWs++HuBD4e+oM7OPg/1ZRN3pLZnYz+sK1SdWGrfsfKFkgbnwutcJuq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP5gapNmjtVS1QTckI3f3VcadraA1/f3MnK5D71vayhDTn+tCG
	LwwXXnxP0HI5xgDr3yYf/WSSNiwm0Xz3VkM05CkDnXJaQpUwPHhTqZhe
X-Gm-Gg: AYBFou2B/QzalOsJWNJR1LSves2XA+n10yxq2A3srxQntr1Op2DQBnaXLI1tvFnIJI3
	fWC0e0djzQud6pc37MdJ8JIL2jo6GQaYCK/WEcXEUhhrdZBCeA/bXjVlbt/7rXjAL54vUCw6xrs
	8YiFIXcibZNO62tOX0uMRa/1dgaj7B2OmrccZPNL76204sTHU60n55icFId3lZSb4DwytTnS8J4
	Ke8cq2UHqe9bxKW0wOciDSxWCroNflfU0Sm1BZKKaEeAJDjL2xuQDz1dgba/amSP1N06U5TNvz4
	c8wyHXQK5D8ZZoUH5zlllki4n219X+m+MwOqcn+pjiowtujUD4xRzLtZUDLxpMgeSEm6HXxBqUL
	/d+Yp/wC/zXiy8qHU2uf/4Efxd0bUtIkH/YZsvt2MWO5Fw+RXASjkcykcBx+kt/1CMicH4oiqJI
	5XVwIUa1nDJnSiz58/VafiVGkcy/zpEo/SaITIwl4+zOxuLrAUDa1vJFfZzbyPDtaeTEAszuQgw
	YuZucUOERKzhGosgeJkjkFP
X-Received: by 2002:a05:600d:8646:20b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a1fdd5b101mr1644285e9.31.1792536621644;
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:21 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 12/13] drm/client: splash: prefer what the command line asks for
Date: Wed, 21 Oct 2026 02:50:06 +0200
Message-Id: <20261021005006.2341200-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-13-maximpedraza@gmail.com> <45b55f94-0cd2-425b-b985-ba3958502b06@suse.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 20.10.26 um 13:26 schrieb Thomas Zimmermann:
> Please see my earlier comments on module parameters.

Same here: my reasons for keeping these are in my reply on patch 3. If
the command line is not wanted, this patch goes away in v6.

Best regards,
Màxim
