Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779590;
	b=BTs0mDqe3OWeboKUMXhIAf9Uaf8TE3gul3uf7AZpWlr4YlMBINF9HNC+nzvJJagjLWCp
	 PtbMAbMKrpjG7ji4S0RT27j39qjOL6HMoGXYXGZUmFlOzjBSUx2V4RFQtJNMX8boYht8H
	 3mE3OjtPVN0gcrUxMPC1+L+u5HMgyUNUdHnRXQIrZT5rGvdvTucv+hD+MZHB5RhbNenqi
	 e362QWzpFsLc6eRJVxuEfcj4nRVHDnoU8tYOOVTEQUFGoIjfO+kASnsoJ7V881oXGzvIF
	 /JlL6GC/uawOlJB6J2gyzA9Iv5RDGcu1UTMWE6UejOwIT/ED6ew0KEyu9WYkkftAU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
	b=cG1TJ+q0B8s1fL7s58HHz7NTt4wx5TDoqe4tO6UCG8hGMqRJTxI1BSKIurKfejRVQRwu
	 /FfhfzPuqev54irgPODr4g0d5N6aGU7q9YAKC8PE5m+YmVOBAIrsSaxVOPpnBtxHVkXvU
	 +CyBDmhr1ObNg2lBkJKtmD2SAtaEbJcqX4LW0D8MuxKjQ291b8op3XPjeqayLw+ahUq7g
	 ZTMBNR2xhEbn6lsehlb14N9Tj/i7pwd5/OwIhj3UfeB0rlcoRzJXZrAzfrdEgBOfhTX8j
	 FJu8Y8tk4sUlALVyYmGyxFQC+SS+7PiQjK8/zhnXfANZyAFuAxmy/7tnABQivOZM98g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQ7acz4x;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D4C606A32F
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 11:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D4C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQ7acz4x
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49a92144733so4015661f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 03:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779588; x=1796384388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
        b=QQ7acz4xlhD3RYLzomhJm165MLMJRjrcJfaTP1hC7GEuhv7Pl0QDXSRfBa+sSY4IhP
         xyOvTvytUxb35HqQoOcP1+CNe8ZHmENXsBnlFwDKezoK/X88d1dhFIC4ehx+ZMBqr8hF
         O+/PYmYYjPLIcOaLmTc7RXfGLEzZC7XQs7qiWGTLZHWydyD6SQTXIR+opISl65zupccL
         AbCn9LfLWpJn5xqjafq8RMsnvLsNOv29K1WgZj56A1qHuY9CkeF9neQU6QbLLmDp8cQ3
         tRZDl6jXH+dBbyxw7KGO87eG/V/VegWsgA6YWFG2muMVehGlCjdGntKXlA3J7+o/dTnY
         WTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779588; x=1796384388;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YwGjvP6ctTxZun8XTu6GbbqiRyztei0tj/DC1LKv/lo=;
        b=WPNexzqOgdD0dKj/7aD645BZslF+k8MJJcDWOhu8kIUksOce8RIiYtoP4NHinqbMOV
         WVY1NG8undSqg4xrtPhq5N2y68q1xrwZYIDeOY/Ku2vM9u5uyERG3frpuhDRQ8hVpZOS
         LNQJ2BwsEpDVr5a2Nh1xHooU9e29/HlHYGaZtEdOSOizuT2BrLBiMU0UQamsZ2GOJzgY
         tsDT0c5QmZEgeG3RKGQvaGL/wIS8JlsfDWrP8f2Jbla4NZZ6HoYt9V1VPbC43TOBbtSH
         8uN1DI9e5TMjaiD4k6ALpXJjzeH0Rx9DzvcS+bDeTGBUfjvSR5dtEHYjEZiY38j+IRHN
         mM4g==
X-Forwarded-Encrypted: i=1; AL+hErFbYs41VSA6yqAZYw4e+L/mU2Asdw4g7XaennDO3j5PDZtiuXAE3KNRO1Ltdwt1xN/VF4FqiyoUMw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z88pTJd8xnaInHAXO8s6xBDmbPuUwhE1nYVjOOn5qP+gAETHBaK
	ES6ZURQzjOfvkCJesTPqAqL8LDVnMLbPw3tAEeJpQG8qjL3kjjX4TEV+
X-Gm-Gg: AZFdTZc4oiNeYcXzEqpmTHgEQn5IhFwgJQ8csqwSAeb8qsV09NQHIw0ov+9m5nvOBTu
	NxYVDZT7U2zY4nt16iMSQ0N9CsVkyucSnkOCPaq3ah2fmGpYnjiTNxaGIe7HC1f1ojWCZ1hVRQ7
	v3xRpvMbrvgjPtNZE8kaW35uS6u78MBhCdoL+ciwFahzsqRjOJ96du8P83EL8ei7UATzYnbhN0l
	dAUVu0BBzyRg8gyq0xbltHdH9kipXCCEjjWciGHnV8H8gF1mnuk269dPk9iLwey+Os9b6YORHP2
	Kn17bRyYV+z9/QD++ldlj9iG3QEAJc0VM+gKsYvBYZYhRK/QjnBS88T+b0ZT8o86ESRtRkIjb7k
	5wudiWv8nNVggtDYuk62LWb0/V29WwqV8VnBOJdPkWn3ki3n2V07xWM0oaSUW8ouwFNy4joPf0R
	IhvXV5aFTLeOlQXblYAw0TI7O72Vc9v/qXSLoXQ7XiB/61KyAbpJpduKyUiZhuBffWytJw9JOss
	wYuqoDvT9wY/UFZEUmv5dv2RP/iyKyyPz6l4UhmXsZOBjselHEXDZHizT8wy8drHBXy42fxZ6w7
	j5x/rr3uSj+eYLXnBh0+y5u9fBwss5A=
X-Received: by 2002:a05:6000:184d:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-4abacfea55cmr51711565f8f.8.1795779587982;
        Fri, 27 Nov 2026 03:39:47 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm31135419f8f.19.2026.11.27.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:39:47 -0800 (PST)
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 17/43] drm/vkms: Introduce config for plane name
Date: Fri, 27 Nov 2026 12:39:33 +0100
Message-ID: <awlqNR4-W6a8w6QN@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-17-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-17-21194cda2468@bootlin.com>
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

Hello,

vkms_config_destroy_plane() frees the plane through call_rcu() and
vkms_config_plane_rcu_free(), which is module text. vkms_exit() has no
rcu_barrier(), so a queued callback can still run after the module is
unloaded.

Thank you,
Oarora Etimis
