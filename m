Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536619;
	b=YAhQYowz+sLN7wRT6xJfnbS0ehpU8rUJBuH0GexzboBitmKBH+M6SLC+cTwYB8JjtxK9
	 XAuCqowqeef6tDAYCvKBAalQGVmfh4kDm67zmaqIhKv9pGTi4EiygC5xY4vD8v/LzyJh0
	 pwfUSfph+y5YqoKwpRc0GXem5eTxxfpvZD9+I6DQVkBDZze270yVhgcFrYoiwawyVTYkv
	 4QTE3I56NX55YWfPBAmWFZxiX+Z1NBh06Rgv/dTVtdG+lTJfYErBRQAjgIlvkCzflV8Eg
	 HmC2Lec9/or7Qv3AEQ3acKHxGstTiX8E7aEQhOu0x60vJwXICSRuQO9RpKC5P3sihRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
	b=MewmzqzB3UjkG7O7iNQOWMkyHvNXZnAF4aLnQvhNo+hJB6xaehXCfMbAmFt2LJ0gWikn
	 amdOIRHkd8f1DSSN91HuMzEoCYkKI4ea4Q6mOLOOXA3xbhuf9p6GO/C4m9L67s8xjPWhR
	 5cGHSCD0o0VrFNI0p9rz2mwZ40RrfFP/mUQcZ2G9lqkirDC42ueaBw7TJEw+4a/krHPP6
	 n/FZLIpWJx7Lr0LXyNMI9xjF83F/cVq5VGhN4anQwIsKIDwpM+ZBDGens/5BVEukOVwsj
	 zkFIcCV/g6+VodvZ4F9LP7AvfyfHk8KbjoZ7RTe5SgwZIUNFzgW/3eAoUpUMMU3tKQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D89D60A2633
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D89D60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y9FIbqDR
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1346985e9.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536618; x=1793141418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=Y9FIbqDRFsiHCh6wCMx/lGXYMzbEMpcYPExHRKo8kxmfRwSdsbHKcVN6b2o3fsfWmS
         EMfNStvVEXtwQlwGFhTspCN6Iy8LsIslmTQJZArs9croRUFFsg9a0R2Wmowm78fCGk+p
         qoMRAjWrlWyjvmo/cv+QOkjio/QCUym29eIrZxNWbZgTO868C5tZQiYnBcrDy/y+qYxV
         AxXCy+jIbfVSYNWbB6SaV+1+cus75rqPWlO2twcCFTqCAqrzmVEb5SQPuQ0TN5KrYxQd
         MNdNYIr9ltemS55NjRHUaTPPPJnI8hAvgtgmCV7T01bNB3UVCcpT2l7+0a9cI5hk20GK
         EuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536618; x=1793141418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zL0S6kvmtkQoYmoWRmufP9rJujsnjUqprK46hj2fn0=;
        b=zvDc35LRDMa2jR04R1jm3FMpTooDV9P+QZ0HFaKmr+5P3xxgz11ER7p371YhdgapPN
         9dn0qQAhKuFanlI4A190xSTYrNv7qxsgf0L+6HFKYIHUevvznlYZRQguCtFaZddo8Sao
         3js/8oQjBToBfi1h7YuP194fyfd0w05Ij4o0hKtUSbUE8wKwWfplyeVYK5972Misoxjz
         WfGdGRcY/RxSh/GbmskuX0AYtzoTvB2rrh70Tsxy7JWqhmG9oRMArqvinl1t8UvQhOEh
         Qk97jwmLx+jLkzIC08hIniG/e4UB4BZJph5DujbQuXJzSS+EEK47v4hxwoY7YPp1ewY9
         FUzA==
X-Forwarded-Encrypted: i=1; AKwUvBxzU/yCs4C1+EhQ73S3cGTHlUbZlyPPhXulWJk5I1M5V2nNtcKStdTp94iJeUyRPeNfuRaLBgRfwYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvnVxqs0i8HJFKegtUXccS5w8EfvczBj5Mg7gn6e9oT8DhtSN1
	WQD1/4Ks45EO6/iLbSxhHvXLYE40FUOltKbC25nZ39ch4eT1QTNIvyqe
X-Gm-Gg: AYBFou1POE/A+MIXELPgi7II9AbNZZDkitt/T05WQ0tIm8qby81LqXape7tveA28eAp
	h+PxH4/AZsUmRQOzFxefPvl6MpvWSwG1mtCHeBzHfsrnEJzCgpPaKzkyNWlR/09tYMWxw8+MYAF
	v+cYomOiB77sUaht+pG0klyrfhQT5f4WF/2vxW0QpcwbW4fKAsaz7MheQGX2L8kTcu0aRkddAo+
	euwooc9Z/bvXcQ2+c5kRqyYcR6NCrytG3oFGVfj/ge3IsbubU/0Auu8MGy615bQNpQBjwbiLFxb
	Ve/LtNkJRbOh9G+f8zjhxB9qAHVwN9AKnMqfeO9IT6ckUJ4yMojClnmaRYOcAapKQl5YdfS58PS
	AsCTwG827jtPkFyzFWL492m26wPYT2QGpmuLH4Od2RJiqBC34/ixrIRJiCiklb/iPwfN7FM3DsA
	qYeWRq3PEiE30I0hsTR6OZoKp4py8FavXujmt7QdMOPp/Lxr8y8lwg7Sif9hFtaHvaiTXtiDJIn
	b9o8PWZG8hV4wabhDZYBBG9
X-Received: by 2002:a05:600c:b8d:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a1fdb165d8mr2576335e9.5.1792536618009;
        Tue, 20 Oct 2026 15:50:18 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:17 -0700 (PDT)
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
Subject: Re: [PATCH v5 09/13] drm/client: splash: turn the device tree image as it asks
Date: Wed, 21 Oct 2026 02:50:04 +0200
Message-Id: <20261021005006.2341200-5-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-10-maximpedraza@gmail.com> <350adc03-dd7f-4120-ac9c-b6d04ff44faf@suse.de>
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

Am 20.10.26 um 13:16 schrieb Thomas Zimmermann:
> Reading the code below, may I suggest to do this in two steps: first
> read the image data into a temporary buffer, invert height and rotate as
> needed.  Second, copy the temporary image into the graphics buffer and
> adjust the color format.
>
> Eventually we want to have a useful and flexible drawing/blitting API
> for the DRM clients. Keeping drawing steps separate will help a lot in
> the long run.

Makes sense. v6 will do it that way: the first step turns and flips
the BMP into an XRGB8888 buffer, and the second converts that into the
framebuffer's format. The buffer is as large as the image in
XRGB8888, up to 8 MB for a full screen 1080p splash, and it goes once
the image is drawn. If there is a helper you would like the second
step to go through, or a shape you have in mind for the API, I am happy
to follow it.

Best regards,
Màxim
