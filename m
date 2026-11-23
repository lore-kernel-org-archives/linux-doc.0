Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445788;
	b=hTVzHCpQ+anaN75XSMwgQgin91zhKfvskiEclW0pvvckPUMLteUn61LPlXuaEqW9RxqD
	 AH+YHRWjp0vwqpzj33614Gf6oGT84Cr5Fz6rdTNgmE5xi41X0nEOZ73rpxZfy5x1DEza5
	 AhRi/Fkq9MbSthJ88BRZRVd28JYsih6DrX3Lxq6MiSBzEH50xLHvQCQ9PadIw39k05ykl
	 UUUtc3GXyKGHJVxK8EkYjUrs5/ZHWeqTZwTO+WQR3PPzpohk51S9r+S+D0+Yf2luvU0zx
	 vULQafAOBIKa6MGEn5tfuJryAymZiLtNLQ9g0wSsBLPN5UVBzC5lzGrpMJ5NYh/F9yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
	b=GEAYtPq4e7qLk6hDJmSmLOhG/NzTuUBYBlSfqvZZtsx3rM1Jw83Dze9NAD/5i7DMi/dD
	 6fSfeOUJCPnuIenOPKZt0KLFTf3rVZoWX1+yfm23ohuNMy3nqOdUyPUyduN5eXrymwu7M
	 pSXC7Sdn3BH1JitmNz6FkFBZhP9Xqe91cWO4Zc9dozAA7egWiJBEYozp6GPum1GV3RTQO
	 hr8Jf1CxABCrB2BciR4hUaZB5mveXUi9wwNoih7H210sEef/2deSkL5DrJQCQEVJub2pV
	 YbDI3RAjz7jRqqZ2Ub95DzmO0BMYmdvToJJNaIT0m/bysl2oL/1tU7nVso8kGtt1eRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bofu6dUO;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C2606B089
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 14:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4C2606B089
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bofu6dUO
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4aa5833c263so3232267f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445787; x=1796050587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
        b=Bofu6dUOLeJhpudTlg6fGStNYoci8efs9cl6wNGmEKJDGeGPhpmvPaFqnwzb5qrhKO
         gePlSwURdD/0CVh3tshh/MITnnFM+tIKSAHqxynv68UtbnbE2HmcqIZVRj6504n72Lpq
         Q+X9Obl/0dbc7/evV7O+ParrfeaxZddPrncgZajAazuEqUdvZhIdFFnQQ1hHX3u8O5Vp
         IahXxjyQpNmLWOzCGOjyPJWGcStkhrg5P9j70XtN4U9jtAO5H+mdupSU5sD7iKdt0Vsr
         1R8CBwEz6sUaqcGBMP2Bs53kyQGibDR3hwLZPyAGci7u3lLdifNsB51JM4RgQBx8cMzA
         59ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445787; x=1796050587;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q/tJR8V7RQfLEvY5F5nK+jr/e2gzyMXUOQNnz1DPicU=;
        b=okeZlPiXvtevbcKaDu56DOrTQajneRW7xGIS+D2IrfBXDz4AUVx/Oi6BsJNbfadeur
         4eIJGICVK02dr9QUPYl7h0a57FWVsJGGB7YeZ0FLICXBGrULLvjQ/S0yWbmrIT7SbmyZ
         qRWbZcohpuTeKRbwlTF08+g1X8JHv81ULdcsjFkkXZOW7awcqwfz0TFKHzTt0J+Twwq1
         4TIIiDB9Qzd8CGeIH2jQrOWKoPm5ZADj+krMHp431wDMbJMZWXsIBAYMvJdEzfnfcUgN
         e7Y+MA5aSJCiGPey84N3BzBLby+XLM6vIeG7DFG67zinDIyednQDjLx6z0JiyQkyDGHl
         9VoA==
X-Forwarded-Encrypted: i=1; AL+hErGW4HTGLl1co3fU6t6bCk66BhmuqOUV/jrBwhEERQahrzsHU32mJ3H1+ZDkXeMpVKgOltuwj5Sadd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ihnvlX+b1oWOqePceBPChj7/Q44tB5cZH2qJyaE5rJqorJyN7
	u09N54jqfJTnT86Sk7m6GWSPWb13+OXfUNJwT5yPHTqaUmnmem0lvs0K
X-Gm-Gg: AZFdTZePpT97ejzUfmpJRUqt+plO2Gh7PM/+gmuB6JlQkoTudkVghfhFqirOVXwfhn/
	cOnJly4NTsgR1faPXXAEHOJBpBmqW7Ew8eFTgkctEDdc/Otx/mU1NtN8M3gfdUBe3c/M9aXji5p
	CW6RgJrrjMV+URyw5Ikq6xr8Q3dsscU6OPMhcenm7H5O0toQz2ye9TUkN+aDnoMG8IbebyKA2RG
	LQK4MaJAC9zC62zRhaAwTE+k2q/vr43lrY0OOSRx7pgbXbQqylj2Z/aStBO6bRB92IDB2ouEJpM
	fjE5SQ00FlH5JeajEFzpI/vrLvSGiwMwESxwBm/1DywiVmuyivKyIvPhg61x4fgv0Hp4T7PduUl
	h92BuJLkezX/BBFa0dOypqDbX6/gWxFLSgTQpFIwCxLy9DuZ+IpnCMjuCauWd6/dXBoYg45Hexw
	EqbuFucmV1PRJuMZ1IuKwAIRMea/JFGqCFHUeQGm8dnk91IxkXwm0AYd3pJkv6YWMUdAD+Yn27h
	cYUkgQFKDbXPFKU6bLwC42xhD+H9Gd+p6aviGn3h5akJjRvuAWHC/JtLTA9z77mSgRYmZqnjJBs
	CgGItJGXVpprNBdPc5G+0ePlMttIyNC+3ZyWNVSX8Ln4hqJFuGBL3r8=
X-Received: by 2002:adf:e744:0:b0:4aa:2afc:e63c with SMTP id ffacd0b85a97d-4abb400a6bbmr18514149f8f.38.1795445786516;
        Mon, 23 Nov 2026 06:56:26 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm22988840f8f.58.2026.11.23.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:56:25 -0800 (PST)
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
Date: Mon, 23 Nov 2026 15:56:06 +0100
Message-ID: <awRQxKxzVyw10pFr@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
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

> @@ -265,7 +266,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, vkms_config_plane_get_type(plane_cfg),
> -					   NULL);
> +					   "%s", vkms_config_plane_get_name(plane_cfg));
>  	if (IS_ERR(plane))
>  		return plane;
>

Small one: with no name configured,every plane ends up as "null",so they all look the same in the debugfs listing. Before this patch, the core named: "plane-d", which was pretty handy.

Could we keep that fallback when the name is missing, as it can improve readability? :)



Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Thanks,
Oarora Etimis
