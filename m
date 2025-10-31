Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03D2BEFFB
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 04:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761885665; cv=none; b=hRQRC/yOmkEhF8IfqbWhhG+MIZ12IZIx+yClUO4C0lD9OmiebPf6bc6RWq+Ro2vW7GXQfGzmRidua2r2bDWrLmZuIc4JysJYOitJtxZ9y8qI1EjhHqFGQeqj3NAxJYyvXAeW4TY1qG7pyVUumY5dKhINIO5oLL0Z8BrKgPP5nzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761885665; c=relaxed/simple;
	bh=xm1kLLlZ8QYUI6qMFsmbQ2UeHqCoMYMXfw7ZjEhfXyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJlFXf/ZdSA/FFJPm9ZqEw5pQuTb6DWlpBoTsEhefOHCQVCGuPs7NoA8p3zi0HuEX/t4iI2Ux/2Y1X2XO8dhCDq8NNbsa71ejcmj7fUeWLolEJPdtO2CRF2KWkk+hLc1FIw7d9yAknRidHmlYzI0ddV+fzi/GZoXxUzHetW7BEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=kKaC/5yd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="kKaC/5yd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a2738daea2so1803671b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 21:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761885662; x=1762490462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdnadwcTawt/UEGEIma6luMK+Xpdo3yqchdI1J3A4DY=;
        b=kKaC/5ydquGRyFaMKZLA2hdpxOy5uSQVuoj5nyPPQIvGn09CdOb+g87iTv4C10zjsX
         zjgI02RZijDbsK2m7n0/HXcssHbVZWyPpkubRmw5+10WWsuAyf+kaKW7S5h3LAJOY8E5
         vfBLAq+loJ2DNFxyIiRogZZljJ6CHpkX7l1YzHtttH1qIfMavCwsqmzolQwXoeedO80z
         iB4S8iYdA0jJ/dgiwSMKm25k2WsSk/c1BOKuLjnrza0kkc1FJQc6SKWaLufttq1Hqbn3
         qZ4B6hDDwXg2Mel30elLgM2EOjaSjjd6Ur5+arnUmtb6S4Puq+eo4qlAdkX6YSAQmEvs
         eUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761885662; x=1762490462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdnadwcTawt/UEGEIma6luMK+Xpdo3yqchdI1J3A4DY=;
        b=tKg0jbO4vkyyjut5ucBhrqUf+zqVSaZtf7TyvoVNkO8BDrSfax9tvha6JMToCYH+u0
         jeznpwem62ugA1yYzZw8icteil1T4RXoD9dypSuJVBeUuBT4j4qCuT5iZA9VZDm+k8Zj
         LEP9yBsvyu0wBs5j6g/o4JJT+cvgAxilMGVz2z9kutIk6sFm3RyVlM54cGpwCDovsQVP
         3VaxO3i9X86htFo3wxMxon2owMdE7qiZUNNZAvAb5cldz6r6zFld+UOhIY794pvM1FJA
         J/niA8uimY/xJ+srcqfmjDsXUhG6rLRuDp7Wc98L2Nw4WB+O3VntmiFLFihrChELbjuY
         iaqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYENlhAmm+kJKm0HLgURbB4f6bw0YQKHCqWmGMI85LCtjXUyoZNjeweoZFStnOO3H6paSmrp7FLKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YziDew0tjw1wBsbUyJbVdROAsjk2lh9/SZz8Dyy5nhBP9j53AX4
	U7AvVvQCbG0IB7WymW1EQYm2sOdIrIhqNWE49av4W3YmUBrL9VTPAxT7AJCK4a4gkHBFcy0St7g
	B/gJQLMpXaA==
X-Gm-Gg: ASbGncuS2dH7piIhW4DiWfC4SQY3mkBWtIXKWv/9TZg4bn05xZL/Z5Z/rW4kPbJj1Yx
	dSkuaeHhg/Sqt6tmkQQ7izaPzH90dSahKmdCqZ90MYF8kL9r5AmHIDlzW1u+tn69uI4EdGHYp9d
	+FFS7N8HETpSoRvSfXkqu62DN0m9DWep2hExVBgqSEt82bjlbYFSL/Ry2EYo4USV4l65RN7zfVP
	Y0CZyIJmmRCjPYM1CAQ6Ng0bwZ8ReRbZULYCyKHTqF2ubNJ+eWPt+OmMwbnPnfFvCnUKbiha1NZ
	+sJUi+WdcWkoXD6Nq4Kw4t2RNP+p0WfnQLZlB1o2UZQUIhFHApnONHpSttymXzdfENxVbKGk4Kr
	7lV3S/JvlCK7DrgP1l88MvOC4hQamiQJX+mhE5vpejDlGh0m5mYJYQ8SUrRHblT+7vvFDZfI4zx
	op1vKHjg==
X-Google-Smtp-Source: AGHT+IE01ibbxoTk4WwnS0PNINpOsBGL2W4lqWf8ORWbKUs1964WrFpG3w7OEqs1++R2JieyDQyk7g==
X-Received: by 2002:a05:6a00:1826:b0:7a2:8ac0:7ca2 with SMTP id d2e1a72fcca58-7a7799adc31mr2393559b3a.31.1761885662008;
        Thu, 30 Oct 2025 21:41:02 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:ae30:6f8:71b7:2e95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7273fsm616450b3a.24.2025.10.30.21.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 21:41:01 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: robh@kernel.org,
	linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Thu, 30 Oct 2025 21:40:59 -0700
Message-ID: <20251031044059.714744-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <85e83f3e-3509-484b-8cc8-110156d5a2ab@roeck-us.net>
References: <85e83f3e-3509-484b-8cc8-110156d5a2ab@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On 10/28/25 08:17, Igor Reznichenko wrote:
>> Understood. The bit in question controls the alert pin polarity on the device side,
>> independent of whether the pin is used as interrupt or not. I'll drop the property
>> for now and revisit if there's a board that actually uses an inverter or needs to
>> program the bit explicitly.
>> 
>
>This is kind of unusual. The requirement used to be that devicetree properties
>shall be complete. "Only if there is a known use case" is a significant policy
>change. Has the policy changed recently ?
>
>Thanks,
>Guenter

Rob, following up on Guenter's question above.
I'm not sure whether it's better to drop the property as discussed earlier or keep
it for binding completeness. 
Could you clarify what approach is preferred?

Thanks, Igor
