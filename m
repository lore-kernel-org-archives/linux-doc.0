Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A66322B91
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 17:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821584; cv=none; b=bfHTG0UPU5b/7SoHLqVLNwlbTFo0rhqmogIYjgf0eexfa90WKfLQc7DX2c9k1094PoY5EM0LjhjAjHWBGiXCARrDn4uRoSJO7VLvIJ7wHRHZQX1lgkn2uR2SEfaCnySPDiJ67dyJd0yQq3fa/HuRdzvpfNdweTh2pJkJ6jUlxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821584; c=relaxed/simple;
	bh=rKVKnsmZY5Zk5WseCbLhC70tZU73oYSI0ZX68nvqOpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgNhlcnxX4w4PKrkTVsnYceKQ+eF4/FTUHGXa8VgEXtjjYWOjMItBIqVO9PKMlCmVTbGcxGPn4/6uUA3fZkIYH+4BCrSmFiN8JmIntPoaM/wSmcdyzSFHt86DxXlRpO8A+AINXOzdhme462ISn4ZyAdO+QkwwrDaZUhVlWFdkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWcISiYv; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWcISiYv"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so3248216e87.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765821580; x=1766426380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIbn2oDFRSGWfD5W22SaWrURpraJkYSQ1nm0bbeV7eo=;
        b=mWcISiYvQDMyWrcSRycAfbgC2LcfDHeiHNEwlrIHZIiej1AYC1xSGsNIQAQ09hrYkV
         JX5RKvAXPuBpvT42pleeeJWKLBH2sgmOEqfv/KpJmG2j4MZwEb/VhmN2KUWZSKmpR4y8
         W9Y9TRYiK/LUJSWBxJeCtVm6+grs9CMML+9OjkE4C8237semIawFtJN/0+n1tfa/B4sH
         4PXZxM7CBczsbeXD5LrxS/cB7X27CZ/SgFLeQqgNRSooR0u6fqf5viqD1bfmET98d1BJ
         y+OTGkBGOVpj54S8EoEEBS6SOazJkp5BEh/6fqKDGAxYCvW45iAXLY5VypDKgUjIZ0ta
         NCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765821580; x=1766426380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIbn2oDFRSGWfD5W22SaWrURpraJkYSQ1nm0bbeV7eo=;
        b=m8Dlmio3ou+QP7bivjHoNkYrUnbf/T5euSYbpzLTJTa+Ybxh4bTDb+hUqdapV+h0rH
         75hfnOhqe3i2CQgorJS0Kydqu7uL+P52eEZa7rbU/JKxY3+0wPRIlxdVTaOhqMqZEKSP
         G01VGPsj15NOV8Q+Ej0YVTtLArtLF7tk0+MS33YtJ8Lft04+2iT2eSxtVDT6RbmvmBGn
         5T7NLx6KXFoD8DhNGtT9PR1vKnXAfJ84XGDNtQ/iccb91MToQVT8wI3Oyfcd+GtS01yP
         mDItvqOodlKOlsldElqpJ/afWz7lrD0JBPCu9nCNdpwOsLheeOan/d6+PsGADz3SB9aU
         +I6w==
X-Forwarded-Encrypted: i=1; AJvYcCV6oAFKbVWspNslXAoJM7wyM1zs8Y1foH/beJEKB/6pjOH9O+7ukUisilZX6jGBSLKCyyJM41+ZQts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykz7YNBVpaBwEmN4SgZJJEBmbGqlS8M4IQqjEP6E7WKBwSIPza
	FRRW1hfehKIvzA8NMEXcxS+s8p5nzEdgjjjhpcUWqLiZWeeUEjOHuJEB
X-Gm-Gg: AY/fxX4km12iBCg38FEPINL4HST+cBYCR528b8fHd+DaRsHomuwiE6T4iFhXjHifcdm
	3Og/i0WEdaElR5V6fluqfnJNhqoQhejc7FCFLeXpye99cAd8oU2pnWLMq9v0EJZRN/vT6H+0hc/
	DhR+3ibyeu8vVurWvY1wSChdv0ZqAgfvjBLzfdXPIYvEdl2GvTN68UiVuil6dIarMTA35FRUMie
	ypMbAeWGlfxjvca54wQiAMBouw36CGL5l0Xrt0vunwFswq9Wqtmhg2t02F/ml0LxEtIongPoiql
	3w/ZCg0ElSaGFt3x09/L+NOeoe5sXRHB/hKM/3FHV8JoUGN0iiLRgRfmEQKhbDVs+VjhbwQi3YJ
	eioBmdvf15KqdWhLbYRP2+6m+WSe2XO302S5uTJ7JM/Ks3R+S4cc6Ub518acBntM2cmZWxSKJMI
	ldtrWkqGqm
X-Google-Smtp-Source: AGHT+IFsDUVoZATaLzj9N1/hjfRE03GZ2gIP+Qj4HQeX9tt2ONoJL779FMDFpau9DQULSPR5u/L2Cg==
X-Received: by 2002:a05:6512:1154:b0:597:d59a:69ca with SMTP id 2adb3069b0e04-598faa4d5b5mr3889154e87.28.1765821580147;
        Mon, 15 Dec 2025 09:59:40 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-5990da11dbfsm5648e87.13.2025.12.15.09.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 09:59:39 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: rdunlap@infradead.org
Cc: initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH v4 1/3] init: remove deprecated "load_ramdisk" and "prompt_ramdisk" command line parameters
Date: Mon, 15 Dec 2025 20:59:27 +0300
Message-ID: <20251215175927.300936-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5c3c4233-3572-4842-850e-0a88ce16eee3@infradead.org>
References: <5c3c4233-3572-4842-850e-0a88ce16eee3@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Randy Dunlap <rdunlap@infradead.org>:
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.

Thank you!

P. S. For unknown reasons I don't see your email in my Gmail. Not even in
spam folder.


-- 
Askar Safin
