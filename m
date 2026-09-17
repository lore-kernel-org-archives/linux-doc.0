Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E5D4CB8A8
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644376; cv=none; b=Ac7Jwm06FOx9ZU6Fp64kgYv4IKUFeWjbTihDJ6iQcvIyhYTQY5W2iPN2DJVHhazdStuI4VlClVxqbptH1QIdTEOkTkxsu0mB/GMFTWqL9v3jtX25zAEYTDiHeeaPd+94N4zZ1UxmBnH/B0znpMHZmlI8eZrwUqoJQcpmdT5NeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644376; c=relaxed/simple;
	bh=bZCKxO1MqB5pWx8QeDZ/iHw1wuuSVEHuO1tD5RDbccw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IG6dY9uKksVXZgq8vJo3Jp9HC7d1lIS/FYjs2Ox9vtcWjT/UHhjs30czrAiSAL3xpXJZtbOg6s//EwkiOoZh+1fmYCZ3C+FECtxF1tbLQ6gMosFUIsSvIj/sMuZNorEbbxwE6kba7ncCdR3OwdAFGwdrQbWSanqFt5B21PWvG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvGGvF7g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qucvmHi3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvGGvF7g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qucvmHi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789644374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pTp5uAMGwz7Ze7rhjDg7zXrqBXA6tuBeb/gAkdeZnoE=;
	b=NvGGvF7g778PmSfdEmhm6lhNX+Afbi9pWpFl9zy9uwmaa3Pyt9ndU6t+GZLMBdtaXmC+Aa
	+X5FpuItWGcnB1gaL3I+9rAMhlQllGbvTarIzkoQMpLY3TBw8Y7Z6PhBQh3jctXZlWLBjY
	sSLKlGl6alX4IQRYASd+b1cK0YPV8hI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-nD5adD4lNEi8ucFXOyFllw-1; Thu, 17 Sep 2026 07:26:11 -0400
X-MC-Unique: nD5adD4lNEi8ucFXOyFllw-1
X-Mimecast-MFC-AGG-ID: nD5adD4lNEi8ucFXOyFllw_1789644370
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-486f18da958so479929f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789644370; x=1790249170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTp5uAMGwz7Ze7rhjDg7zXrqBXA6tuBeb/gAkdeZnoE=;
        b=qucvmHi3LctotD+R3IYP96rHETUEbmAEhN7lbp4XVvwoNFcDKt1X8BH3aQtZ6b/HrR
         GPk2aEv3C/EKMHFgRy4Q+nwY2+JW0k/k5nMn2WHZtDJC1r2jSXzrOM+k9ziKIvLVrNm/
         BStshmStibezmi5CFpJ+VGAb9IsPVwwGkCLsjMLFTKdL0HlH6B8HgVzL7wcsM52fTqPV
         xGtGWKHZQE387cFGrQiLTkep0eCD7X/GvpuA7PSViYOVD/epGtrKLEudRyzyfGEDkz2t
         GF3lvyVvPRErXaqdDLqzpZrIKsljoO+wjnjevQEpnaHXIPhDpj4lWN/KFJb3DoEbDFx6
         iJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644370; x=1790249170;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTp5uAMGwz7Ze7rhjDg7zXrqBXA6tuBeb/gAkdeZnoE=;
        b=TC29fhw6hUzLFF0nI7sf/EVXkujMjeGN7q3vk9qeWiXdfBduUzixFAgIwu6DjTG6gC
         jE8NEyXYV1CMJOueMCbDwe7IdNunfg1HILDt1H5oDY56Ay1PjN+Tt6Hf1jXvQN7H2zPZ
         LE9DsjtfdmWxDVOnzVsKqQBNTBBRv1/2z6NknV2gqM6YxS7VeNk+CDU+Yqk0Xu9xZfoN
         Q6LVWvy/J7HBq3lntOGoAJd0+J9EQtV5AgBE8d7rlkOd+FdRn68ux1oKhTLW7sVq92Q1
         7wc6BUhIBPdxCXdsH0SJI8eT0D29YSD8gwRRca3sMWVhshloQmBQ0cAW/gu/ACwV9EcU
         gRHA==
X-Forwarded-Encrypted: i=1; AKwUvBwmtEShTXFh16HDCEezSfsNJiXrhOf+dxtUrHupyg9hOCOE0lrHkfSDiis1rbMW5B7bO5lnJcMDdpE=@vger.kernel.org
X-Gm-Message-State: AFuF++mmmxqfdSw714H5/Ye6uYRoqudN3mX9MX/iag3E4VPH/UlCQOKr
	LKeEwf2713EQ1pLr97jlR5Wjg8kOSDyxKmSADw9IXHmVNJ2zIQ5kz3m5QJ5cBMFQRMYCycHmGCu
	R4bTfmvVhVwM9vwWuGHbznZUYORAeVilJXXA2Tf2JptSDnguSWBBqdg3AOqrzqA==
X-Gm-Gg: AYBFou3xbvpThwUd4s+iSMmcAl12mMUM71zR0YhMLkawKQ/vF1KLH9W/Sm0zkhS9m28
	8+umeFwVFYbX7KtFU+RmUwG54UxgHz5FqACAvzgAniLR/Vgd2Gor9EzNisFYYDxFK2uTenHYiup
	xNV4uEDcvZqtluhLfyuC/gsdneYov/aoZZB1pCAPxWdYg3XyX5CQxFqIAaA8uYWSB/KwHHHBm2D
	gzKNF6SGbeycx4HbPcEY1Ufck26aNWZBgDfw3/3KNKZY1TqUyx1+qw46RgfG3JLHY8QlV2wG+jL
	ag3Ehf9BEOxd7czDdBQW8Hs8tTiHflYy2wJ09gbW0QYbBcxeXM5gBZS7O/zS14jofMbYyYcZPg=
	=
X-Received: by 2002:a05:6000:4715:b0:486:62c9:5452 with SMTP id ffacd0b85a97d-48713c72068mr4609011f8f.28.1789644370073;
        Thu, 17 Sep 2026 04:26:10 -0700 (PDT)
X-Received: by 2002:a05:6000:4715:b0:486:62c9:5452 with SMTP id ffacd0b85a97d-48713c72068mr4608958f8f.28.1789644369555;
        Thu, 17 Sep 2026 04:26:09 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf413dcsm14684512f8f.31.2026.09.17.04.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:26:08 -0700 (PDT)
Message-ID: <c49dea95-69a7-4c74-8321-ee81f7f6fb66@redhat.com>
Date: Thu, 17 Sep 2026 13:26:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm: Rename struct drm_atomic_state to
 drm_atomic_commit
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260427-drm-drm-atomic-update-v4-0-c0e713bfdf25@kernel.org>
 <20260427-drm-drm-atomic-update-v4-1-c0e713bfdf25@kernel.org>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260427-drm-drm-atomic-update-v4-1-c0e713bfdf25@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2026 09.02, Maxime Ripard wrote:
> The KMS framework uses two slightly different definitions for the state
> concept. For a given object (plane, CRTC, encoder, etc., so
> drm_$OBJECT_state), the state is the entire state of that object.
> However, at the device level, drm_atomic_state refers to a state update
> for a limited number of objects.
> 
> Thus, drm_atomic_state isn't the entire device state, but only the full
> state of some objects in that device. This has been an endless source of
> confusion and thus bugs.
> 
> We can rename the drm_atomic_state structure to drm_atomic_commit to
> make it less confusing.
> 
> This patch was created using:
> 
> rg -l drm_atomic_state | \
> 	xargs sed -i 's/drm_atomic_state/drm_atomic_commit/g; s/drm_atomic_commit_helper/drm_atomic_state_helper/g'
> mv drivers/gpu/drm/tests/drm_atomic_state_test.c drivers/gpu/drm/tests/drm_atomic_commit_test.c
> 
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
...
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 41c57063f3b4..4ffa057e2784 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
...
> @@ -1764,16 +1764,16 @@ EXPORT_SYMBOL(drm_atomic_check_only);
>    * Note that this function can return -EDEADLK if the driver needed to acquire
>    * more locks but encountered a deadlock. The caller must then do the usual w/w
>    * backoff dance and restart. All other errors are fatal.
>    *
>    * This function will take its own reference on @state.
> - * Callers should always release their reference with drm_atomic_state_put().
> + * Callers should always release their reference with drm_atomic_commit_put().
>    *
>    * Returns:
>    * 0 on success, negative error code on failure.
>    */
> -int drm_atomic_commit(struct drm_atomic_state *state)
> +int drm_atomic_commit(struct drm_atomic_commit *state)
This causes now warnings when running "make htmldocs" :

.../Documentation/gpu/drm-kms:308: .../drivers/gpu/drm/drm_atomic.c:1841: 
WARNING: Duplicate C declaration, also defined at gpu/drm-kms:408.
Declaration is '.. c:function:: int drm_atomic_commit (struct 
drm_atomic_commit *state)'. [duplicate_declaration.c]

Should the function maybe be renamed now?

  Thomas

