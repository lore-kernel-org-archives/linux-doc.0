Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098284071CF
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882821; cv=none; b=DB2MRDuP6G3wDtba4bJHyKj0P4iE+VcuZZKlqHagVHYg3hpYRDXUZ7dIfcMkVDImHmKpFDFQ7Y0qKpY2XkfUAjWSwMmJTrAL4U8onFbesK+yLGbfQMX9pTIHiOrmsTSmI1PHWky2NNIgyVelYcwZCBuPJlcpUryb5pM5W+89z5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882821; c=relaxed/simple;
	bh=L5dCiZ7Z76aJT65i7zCUOY/qCp2HbdKHRdXEafRjYp0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=RTf6fQilcFdqLi2Y6rkbHWbzfLpha+BLVdkWKiZEKHKF7jQkiEM9q2EF0YGkaDO21niPu4PmUbG2EWczzj6dAy20Kz6ht4Cl0jV3UteoouGfbCM1Tos8jXfDB6Hl1EoSCDMPdECBPOtckXG/W8ynu85sKhKkvo8NhenVOzDyHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8wMrTh2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8wMrTh2"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842cd900ee0so434536b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780882819; x=1781487619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5dCiZ7Z76aJT65i7zCUOY/qCp2HbdKHRdXEafRjYp0=;
        b=b8wMrTh2neugdH7O/CHBd8SZXNhGrNJhMCmnUf0c45nFlhWUfGttTE+FJIJO43gMC/
         XpLVUSclQi4IRYcFEM+j1ROsHSCpw3iGxcNo3s0OT/GVh3KaGwEVZo+0aVgGxmgH+wpO
         cP/tGE4FcZLBLr7wPH4HJfa2DEHV8gvmquJy1+7HEYNf8HkYE8gkLWMum86VrBtqgAku
         IobqsxOl8vkdRXKT4oR4Rsfy4SnKb5M6e69VWQ0PFakMcMQDK/oTmACVVJwXRHkgEKIG
         +q+k2+YrCDK0x3WTmBU2SEqlPJo06fqz0GQOJaCDOWhRgcZoK684BAfpoRqK30V8Hzoj
         D1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780882819; x=1781487619;
        h=content-transfer-encoding:in-reply-to:content-language:from:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5dCiZ7Z76aJT65i7zCUOY/qCp2HbdKHRdXEafRjYp0=;
        b=O6h5+XHSOhoaepst1I6C9jENMQv5tXAu6Qk1qCL6qhBwyl2GUTBQepDcrAUEN38ltM
         dQqZtxWIQV42ydqFcXZuceT8vhZxceuIx8qWZu+TXxjOAjvLvA9ZPVwchouNfobu1DCV
         V7n3PAXv1bEVKpcq+5qHx3cYdAqbC8A72fet5S7ni2EIR0e7wE8rCLPfxaKMurQ+aFfC
         iQQQkvxoka/ZqNIaKyMI/zRBVKsjmF+hNcMqJcyFtRM9edl1VWQ33dRowxf6ncfS2YT0
         wb1MIVArVPoSn897L/XC00TwwCvNRvS5/pm/1OUsu/I445pmMDJtABPNN4etZEsqKluT
         9bRw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ct/o0PeaqpwaQqo2+uqQHdoFso/RMQFUwMIDfLLWVvUhoDxpYXZMxSf814UG4IT9MI0Co+Wfc2lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYxnCXbEjpRLaD14iNU6fdFj+RhpkQyRPCKle+zOvQFl85LFB
	26BG2sXJ2OR9T3jk2Zef5zrECKS4pS/fMNvL9u9ulkEmqqVvQlTOFXwi
X-Gm-Gg: Acq92OEfTmGu7VQkB1qmzjJxj5ww1lnFma8FskyMEtBGAFjNCcOEkkAdsewyLzeBIjN
	19nHIdH8DWjCrLyiI9d7/LwPd7nIHEvA2YMU/z675pJgVgXp0FneeHGJwni1nYUevINBWQjWcZg
	P6Vwqfzpo9XmFdUbh5dNO8Ye5OP5nuWM0fXzvEmRja0YNTvb7OLOQ14VVPXW+gIfYSx9UZcZ8lz
	twnvfU4YwXygR0LUvQhgkzmsOJzErQIUkFmiPS/E8CeJ4GTv6/8owiogoA9HtN86PnET/78qH3e
	oO25dFv29ihk/MzwNCiczP1tRftekIlesC25PnqMhg26R0As/ffnN20BMJDh6NLLGbAnoTkUfiQ
	gwbHcZllrW7v1CYMFdZX9rv02qP191qgGv/K/BfVIH2l6uJiNsg4GB6ojrccQ+NwdVAsfqODFGr
	N6g0+V1zRVKKZq5VIENTsh8fQhXddlN4K7WeFjGJsMCkQ2FXRY6YZzQVDUbmlZD2yRmdNLi61S
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr13822040b3a.4.1780882819355;
        Sun, 07 Jun 2026 18:40:19 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:2f00:bae2:daf9:9217:a5c? ([240e:38b:e68:2f00:bae2:daf9:9217:a5c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm15939190b3a.34.2026.06.07.18.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 18:40:18 -0700 (PDT)
Message-ID: <b7606f72-eb55-41a7-b685-00164050e159@gmail.com>
Date: Mon, 8 Jun 2026 09:40:11 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: dzm91@hust.edu.cn
Cc: alexs@kernel.org, corbet@lwn.net, frederic@kernel.org,
 gpiccoli@igalia.com, jani.nikula@intel.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, longman@redhat.com,
 mchehab+huawei@kernel.org, si.yanteng@linux.dev, skhan@linuxfoundation.org,
 tony.luck@intel.com, zhuyan2015@qq.com
References: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
Subject: Re: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Applied, Thanks!
