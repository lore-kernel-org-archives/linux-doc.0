Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446404;
	b=2Fey3gELzFzFpRwBeTx/wuvT/fgpQWyRyyjdIbkPrYq+i+UM9GEZj5MB44Z3cCzQLfUO
	 dmV8Clw+7cNpXMmOwdOSoLAqJdNOMzMem+8vg7JrqsD4GsJO0CvBWvsjGzU6zj3gycVnw
	 Kg+8MbtM6XakyVQ1iNW18rSg0N8sydkumsjQwtrMzEJp5orhPjDwbpiW8XkReQYmP68gy
	 uPfS71pjqCNr2MUp4z6jgL4uI9Zlx3kVWkqbyKljKF5MP9YXQThgRJp6In64wKoOn9OcQ
	 fLpD5uFjBnY0hCfVzbheaooPUk2L3qBq+PvhxvfHOrUSq+3ZKTacpZNROKhxpQF4MZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
	b=ujz2Kxsbfu0sX8Hv3Alv87obo/sPfOOdwbHqA47vTw23Ml9ZB3Q4QuwtPH//3aug8qZ8
	 4US6TomkiC0p5QVOWS/2oguHnJdA0NXn+99KQ7/WW4isfYXvnQOkPJOsKNNJbTK68J5xm
	 638jUuLnEKoMIzSbLlBtB6EmEWQy6TYHElIGx0qs5Cf286omdz4hOHse+doBjdXavz+sj
	 F5+3jOYQosoy8dgduOw8gkC0NWTm57vWomMzbue1xf/jqWuAa5YOtbPL5iN94R9JlOTAS
	 PEbqepDT8jd7li+2gV9ZVnNpbJFIfvDgAvOruZ0BJNEQG9KMo1BG/QXVGWJ7f0d/YvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/gPGOl2";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA63606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/gPGOl2
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33277825e9.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446403; x=1796051203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
        b=p/gPGOl2AjZNLZFe6F4Wk681dmbZdcCIz/meIO31oOhZZGXQt3h6/CMRVP/Jqp+/v8
         IsFfPQtxZCjUFyGSLQi/YuFxseavi3mwMYnG5JH/pwXsru4f3M9Qvf4lmt1jiy+/VEun
         AIDSeXfBCksOEUfxvtc0HADMAJsewLbe+jNj0twQAuG0tKLAMqxsZVEII2eQN35R4t9A
         LJCIYmvtu45Q3uCX0i9+/G3L3BWdVi1afYT6vqANYc0LP8WWtjS21oC95qizuEh7FFDT
         qcl7D7V3Jar7IU7D+knRUXQXk6di7CfOrhtcinnOVqw8ws98NTu9bpZUbmROVTPz55zS
         pk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446403; x=1796051203;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
        b=KdH9CMImRv5ngsj585mkuETUZvWPNzBM6ESMnl2LFdyNPPwTlrofQeQYaagyi+knoO
         yYHrObAQTGFaW3UpQfNWQPcMFYFrlmQ7hTE1CDWv/wvSwi6c/vBNSgc24bKQxqAx2kIW
         hiZM2tOGh41QSrpMSUmskGajRoPQqUApmtZOu+Lipdbvzt2SZGIxcH7+ViUUtxgo7ib6
         NSuOm2SFiYKwgcRD0tSspl0WQQc+KVI7VRxQte9v6pkwXrRxvKmtXqS9jByhUUyuQtka
         l+WNF6RdjvzQoIyUU5gHGwmqTgjabjyE/ziuf0e1zjA9oFK6wHFZXtnr3BPSB1VTP/Tb
         bhqg==
X-Forwarded-Encrypted: i=1; AL+hErHX1POQAoE5sXGUiSPpXkp0yiRRNk+08VYn4tutHa/9qduJ7HtsPx0/piAaYlVoFCxmC1RWBJnc22g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IA9mPJSDB2BvLq9sTeTVfc0uhpi/EFLRXM86OVpvCYosFdH/R
	YVHn/4LJwjVYAqu0aCwI77sEUC5d1/HpM5Kvqpx3MmOHD0hp+RPXNrKH
X-Gm-Gg: AZFdTZfkFiGRRTsPP+Yg7Z7f457o2BJhCztwH2Fr2GHsEjPj5+XsDxS+ELfU5z1jiI/
	fz+xwiHkWXJeYB+vj+zQv4lU8eymQF4XPkY8p1pZyazTWN34edgsfIyf/XDEhhvKYzG/IYa9Z1B
	3SNLpr+U4FVIQjbqR6iL9xWC7MMuL8W06MMKFfA+jGgS/bTbhoPgesTWTnFeas3ieF2UyavHnZz
	vC61oi4m7dX4zK7oLp3pF6qD2kv/14AlBYqiyErK1mBEQSnNeuSjks1lfN4S/VqAUlb0y9fxKwd
	3/fufTSY31UxPUhhZbIlqzyPJipTpJpjdPIdxJCxFCyqmzQ3Lm8M0gxT93GP2gKZDjYf8PSODsz
	UJFd0c8sHZ4BIY0GWXUwTZUHoeJea7oM3EbQkAoeYBMyEO+yBu5RppdO2bPkAO//p5hPojYUZu8
	B86UpNfLxdp1RxPwKsbx9md6YUq/93QSVl/lRBEL9/3/kTulfy0K4D350iZLNvOjFMv5JtYOQJE
	tkYmdX1RpK+kfxKAXO1yMdrFnZNfywRkTadB3OPZm8kQM3OcVgrxWUrucU6MOvmZd2UM2cjpkDD
	C7UY2Q2mg5dx7X21lbLTmm6Xt0jVeDI1IA==
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr248093335e9.35.1795446402877;
        Mon, 23 Nov 2026 07:06:42 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22848177f8f.51.2026.11.23.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:06:42 -0800 (PST)
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
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Mon, 23 Nov 2026 16:06:14 +0100
Message-ID: <awRWEiYaktJcbFfU@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com> <awRQxKxzVyw10pFr@ArchOarora> <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
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

> Can I keep your R-by with this change?

Yes, please.
 
