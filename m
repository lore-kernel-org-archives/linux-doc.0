Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB11218584
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427369; cv=none; b=fAXh8p65vPeOJnAS6lxDJX1s9IMoXTCZn+ee/okQsgwuPg64h71ATO7cRPDnEPRBCJ/K3cshWqjgLZoKKNLaOHN9p9N+mbE0gcexxxEVeJrTSoVfHzzUfSU5tn7BDTGq6vIfO9Ja3pFMRcAUeLTDvaZ86D8pwqYPbSf7g7+aHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427369; c=relaxed/simple;
	bh=c5hC9+VtTz6kwof7J7yZQkbUh7fYmSvFsE5LwuukxFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAGGupTSRu1+OW3Ioaw8/RgtLDjCFqC/vfV31puwrLpGhSZZrDsel54g05w9R6zi36WX6DUbDw6Uoho/4d1DbV8BJdOsZ47/msf2Mrl74sQr1DDhFUT6Hlpj5MgUwks85FYry3XNDF7I4VupmHH06S5DBRX6Wcu7D2Wu5l9SOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=suEKhKmY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="suEKhKmY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43675b1155bso10936415e9.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 04:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736427365; x=1737032165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9WqY/h/bcn1twZ5Fg6im9L2+kr0LiyIHsmlOD7PpqUU=;
        b=suEKhKmYzHN9iUHdRguBfZQDJLmbTE4MJKp2ylAXgvegIe+RRGY/D2rQb02pRYKveL
         QqZ4Xrd+EVoCHzlLTIC9XJKOVSUjDs0BTiScFtONlviVd5qvlyJOsnnwcBSyWbmosDQ3
         Jfge404Lyzq9LlYVfM2GNP2r3NjH0J2PhS4MRtCeOaGR1F9bjq8VZ9kSxrhdmZjNyYaG
         0UZ8y4V1Pp9rN5pJrpKckgyeXLo4fAfKIXOt35jE4Ox1rTbHE+OB4iHqMOUvmi1sd63M
         uZ4V/26Y7K07AFS4Rksocysjbe5d/rHCgSEe0VKk8u9Nk4xHs8diH1zcevfCrhUSKihg
         gbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736427365; x=1737032165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WqY/h/bcn1twZ5Fg6im9L2+kr0LiyIHsmlOD7PpqUU=;
        b=qPER1kOT7r8CuTptjQmOB+1dk/o6zPw8MsS2/LVr6IMuGz9mlu8e5dyciAp62mJrHq
         7pNBS51kV8HrfVurhIOvnOa/B76cTtPx6om2VBcI/8MHNcmNAFv4mHudS31YCkQqz/2O
         ts6Qmhm7xLFrbbGq42oGslz7RQXv9NyQndBrMOO7LkFiAXxEMv+a49mi+yiFXfCtK/XW
         xzgebFLczrjEKTfIXAau6G0H/EMRzoDsrQGjDI4y3j/AEYJM2UdW+KbuGAwkfB9cv/Mw
         lucnPHDeLJoLYNTKMU0/OwjftSkjskteJKmIrMkm4cXtfnGrFZ7rUBGeb1vCKJXDXEC1
         AZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3of6HA4YJPih0XsSW7VVNknnahcmpP/TP4dVrMctFr+wU/XP7spsipFijPeONMgY1b0/qt7yqqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKLzLMLuTLtbgtx71UAZa3C1ZFKSaPTNKjB/W54LMk0wpNXwPY
	T2RS7VfhaFuCh4EERKzqW1DfiSoHmC393wY5WmFl710XauTU8T88RBw+ehZGOKc=
X-Gm-Gg: ASbGncsD2DEAuEe61e0rg22Ah56sURcD/wacja5c//oJ5yGI31a63EPMVe91sXkoLvu
	oP2yFQpqGfvqybhEwrV7GyWG2H+AHE/buZhHHUr8kTXb0nljbSAMH4b7EzuULv3YDeFGsRkot1l
	HwT38QLfpjjjDbt1inhnSdXruTp7K8nki7fRnJ1Vbl7F4NvKnfbPtqLqpRrQoG5k4GKeZsWNqmJ
	loqQievu0xr6nun51vY8z+vGLO1K+4TdRSQ8oy6YhkwHbNz/21CJLx0EY/OedZf+P4YKuvK
X-Google-Smtp-Source: AGHT+IHdDqdu12f2GBL1HlTu2c/FxLg9hn9Q8O0SNbAfDWrZrZZD5lDtD/M12rK8SmBmODPlL0KScg==
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-436e271d3a2mr68776305e9.31.1736427364919;
        Thu, 09 Jan 2025 04:56:04 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89f29sm54397995e9.28.2025.01.09.04.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 04:56:04 -0800 (PST)
Message-ID: <8d856a0e-9226-405d-857a-35c2807e35fe@ursulin.net>
Date: Thu, 9 Jan 2025 12:56:03 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] Documentation/gpu: Clarify format of
 driver-specific fidnfo keys
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
 <20250108210259.647030-2-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250108210259.647030-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/01/2025 21:02, Adrián Larumbe wrote:
> This change reflects de facto usage by amdgpu, as exemplified by commit
> d6530c33a978 ("drm/amdgpu: expose more memory stats in fdinfo").
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 2717cb2a597e..2b5393ed7692 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -21,7 +21,10 @@ File format specification
>   
>   - File shall contain one key value pair per one line of text.
>   - Colon character (`:`) must be used to delimit keys and values.
> -- All keys shall be prefixed with `drm-`.
> +- All standardised keys shall be prefixed with `drm-`.
> +- Driver-specific keys shall be prefixed with `driver_name-`, where
> +  driver_name should ideally be the same as the `name` field in
> +  `struct drm_driver`, although this is not mandatory.
>   - Whitespace between the delimiter and first non-whitespace character shall be
>     ignored when parsing.
>   - Keys are not allowed to contain whitespace characters.

LGTM, thanks for documenting it!

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Native english speaker maybe could clarify if s/Driver-specific/Driver 
specific/ would be more correct.

Regards,

Tvrtko
