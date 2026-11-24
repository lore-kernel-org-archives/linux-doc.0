Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544526;
	b=jy87m9BUQ4D/tgtWb6ny6RQs/N/K2RnZi3hlXKXWNiP9jfsumc5jJ3x2/YbNvBcCVyOR
	 oa+t8bdp5rZ0R6G/w7Pl3BazJwh6moOh5FDGNn93kgdBl+js/jOaYoEj/GkTsa6LikU1Y
	 Ebw8jgmViJIeEWDVB1txHc3JG9REnnhxPM+MJ0QK2iTKLTa9C8y727wNG1moTMP8t+4y7
	 C7Ut6L/fa3/Tl+Zm5VyW9uTjLcr4Hf2X0TORs2GXGby2KXr2lj/ZQA+GciGf6A52sS8EL
	 zbjITjJyWx7wDA46rJU058b2Mrqtl7tvT0vQcAgovqS8QeFcFiwgU59Dbif8VzgFQMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
	b=ekEmQvxWih/O160zdFvmYWFpgvLkETI5qS9SThRXtABq7ejW7Nr0dB7IITWlLJKpIIqY
	 XXDxf1/efwC7gvY+i5cDk2VNSE8llTbLSiDWvA6NWgsTWRZGjilPWbx/oB0NTgJ0/WkeL
	 ft4hMHQkpsR24JflX7tSvCk5BSjPVuIdGqjc2V82snbQxR/KSEfQH7KzERTs2iwEfYEhr
	 /sI5LGzMzKu/ZPAHZ1wfBWdXL5+Vc4daj5p9NurTP1M+qgoH4Wd3GD6gwO7yg7LLHoNL8
	 uynevhYHo40xucicreD+IGypZhZw6uLsC9au5eIoVzjrSuAwwxSLDk2X7FwNYnYJ0Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrVsW5Y1;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B2606A33A
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 18:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21B2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrVsW5Y1
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so31712335e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544524; x=1796149324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
        b=XrVsW5Y1bdWNUbF0AXAKO+y5TpLoe8GfxGqndppcglHWXyVzHnzgl/rPx/zKCBANzj
         tfcyEVENjVfe/0u3hWD6v0kkS3b7DjrY68QN1Q8v5uMSTqpDEfoQKQKWfAHsv1r9FnPi
         Kqt/28D68T8DjO1+l15y8cUuIOL0PQ18171i/1Y241ZCCFpifXuyph4TfPRpnGEBjbSr
         pXUZUvegKzw94OWAT48MdEi6A/k+RyRnPxx8D5KN73Gi4kLMHbYqgX+OlADQH4XXIFzh
         j1t+kwhBzn+ISz8iD5Hohh9XrQTI15hSNT8GnG9r1dI11kiOqihj9dCE+VvrnTpF7VpD
         YjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544524; x=1796149324;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UNWM0kxmEWnOWwACmt2LEHoYvhY3LG1h6QPQ7rX8clQ=;
        b=oF6Wbg47Vbcdd6Z8fTfh1bcBA8G+UvJqAxY9qy+lB6PWeEtq2tLG/4Ky9kC9nqQmUM
         X5Mb7JIA6SixKzuZLd4YGq+BS95+JDPiDWAiVCa8ZICxLhwiFf0QgLOETOipwoDeDzco
         jGIsrFnh4Dre+5jkKuctN3/e0lQS4nvm/wWJ28bszWnWxOKeQojfOQX8Ir9xZgAEgbAN
         9H3ou+ViQAHuyUiTM3inmMwuN4JzCJrQmiCcyhqcyR2YUfhqitFAdm7A86sCvZlo7gJc
         Yj8QMBJypZD16nX5Sh29Vq+WgZj9wmU8dmDTDLHT9siIYs2JcgBBacanAXVvJ1kdtJ/g
         tk3w==
X-Forwarded-Encrypted: i=1; AL+hErGiRAkSUpYF7MzZG00B54OHTG6ivVUYR6NZ/nDp5h+MecdfZiAqxNNBanMSmUA4bg47svG6GFzj5sE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CbHHpIlXWQcSxREXjcu6yJf3MxcJKNTdUSLA1wn09mhoR9xZg
	i6sX8P7KUiIaCbgKRC2zOebGqOM1WmB5mqWNGqns+YxiCRXclABzqCfG
X-Gm-Gg: AZFdTZcOx/JkCo9KUUiD4HGvcimMDk3ZevPR9BKnUS0ryH5u3I2WTdM6A2KSilos2Jb
	xjw2bH22tJpjJAGISWlMBNfv9jvroQp8/eUWvaq0nsmIJBXkUEsSrmU/e4KoZRfDW2kgqMLeHfU
	L4DQz7Gu9oNe7uLWxwAEosuT7GQPQuR9j6zJK8zo8Apj5pPTxmvvkZJig22cZl+QVttzPTMPLHV
	0APbZuqDzg0ZNNxcyRLwELjf0hnlfPkytRTwPTKOYSL7vOnCAQkLdTnNOm+MQ0hU5NJEWB1i09Z
	uPTw9mFGKxHi3005FufB4EK/J9nOd4bX28ayDnCr61nccgWQAttE+xGPO2LC/Rf7mwdg0N3lP5c
	dJsPi+tVOvjrUP5MTwuJIZzT9hGXKnZoZSC04DybiAmgjCT7FB1cbGeXp96YhOQwU0HSm0xba65
	gWIboW9MHD6Sypr7xMXPBXRl4cbvnjkeh3RoZrNVXpLPlNomBzPMhvG7pYsMDIiqK+dyqAtJxNK
	gtpZ2Tm6HPJwBM70b57WwG/rKGniKKXwdYS/rX9VbWE3zDOGtzlbrbFkbCsi2SMVAhj4EvYKKfF
	sU3C3sS5om9GszNRLRjkKvW3nNXfnzgO
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr358586325e9.13.1795544523856;
        Tue, 24 Nov 2026 10:22:03 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm34524117f8f.21.2026.11.24.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:22:03 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 13/43] drm/vkms: Add KUnit test for device lifecycle
Date: Tue, 24 Nov 2026 19:21:49 +0100
Message-ID: <awXRsQbfxPzFWHzw@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-13-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-13-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Louis,

Two problems.

.kunitconfig fails the config stage, so none of the four suites runs:

- DEBUG_SLAB and PAGE_POISONING_ZERO are gone (2a19be61a651, f289041ed4cf);
  PAGE_POISONING_NO_SANITY too (8f424750baaa), but it is =n and skipped.
- DEBUG_KMEMLEAK and DEBUG_OBJECTS* need DEBUG_KERNEL, unset in the UML base
  config.

The device name collides, 9 of 12 cases fail:

- vkms_config_default_create() uses DEFAULT_DEVICE_NAME, already taken by
  vkms_init(); device_add() fails with -EEXIST, vkms_create() returns
  -ENODEV.
- 12/12 with create_default_dev=0.

Tested at f046b77fa3e9, CONFIG_DRM_VKMS=m.

Thank you,
Oarora Etimis
