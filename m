Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA033A9FF
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781716678; cv=none; b=ovG11YlqBbs0vkD9w84jBTZSnTbgZxVpkZmnSZywV/vyzlyt/NlIlXW11IR+OLYmtjA0JPNiW2SGugSqR4i44DTj8ZBxmAqi8wtFFpywIcon8SWgn3I+INPBtIcT0teMA7VrellJBTr/QW9bo265pNtUtqT7r2QMKUhsHf3LkTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781716678; c=relaxed/simple;
	bh=V3CcxOLia9CY0H8zjb+ZTGSXWDv/g65LFKetUF1X0Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be3m7z+z6gM4OoULgHa/IQKr3hYoROC2fJvvD72mRT0xuQvlhCyLfhBEw6FSodzKR0i43dhu3u9qBe8uH66Lhu1BU5OaJU8t94ajJ3extwox+IC5oEEZjMu7WOUCjyq97X6HaUuV9xH1d8djkd+m1w/xLbUiFL9ovWaC8IrOcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQrtBGsN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQrtBGsN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ac10e337so40922255e9.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781716673; x=1782321473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DHkZUMk1sAqmgYkyu6MiPiSjqHXH7Sbq1n0RCyPRFfc=;
        b=fQrtBGsNkl8jfhmhK2liKOfbaXsrqWGRmKfHP/5/oXW0UD7hJ3oahOR7qLAeo0OpBe
         2e6X/h8jQJOlMdK45XemxG1KXwmVmdOdKR/3HW11AMVUuy2FDKhx6t1kO60FJocpgZDF
         evkBG3W7V5BZARoJSX0atoEmHPrefGTeO35FOicNCIG5aM9OA1ql0InW0OLMoRJ8YDk5
         F4FnkE0SVPSi73SuQwgeOTPBhIBLWh4kel/JQ82o5Kh0CRc9f/rmAmRv1x7q+mcCAL7K
         8/0Be+VLTgQ+SA5VSHT4hBla88HOCJYiOJO6Jm6SRXG3FLP9Do007JkkLXKlE+Yr5EpJ
         mzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716673; x=1782321473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHkZUMk1sAqmgYkyu6MiPiSjqHXH7Sbq1n0RCyPRFfc=;
        b=KVz01pHGREQ/nMB5XRSZ2ves39Fvh+tg4JGY9agPWLKeJMUNHqSt75j7+rl7DiQ8gE
         Pc8fXDg/OnM5uC4sOgIZ0aTsX5Ll1Zb01HTRJ9wXpbyj9TgLCQrdT385bpq5WgHWovkH
         PEN0yR2AZhyC6Zhkl2c6u2pTfzMEvg3x41Ma/IemWr3dtELA69c1A4nIhlNzDiSTT+3h
         0AUztFlVEKBJys2bDJNQ0cdwGujx+FENqkySDvj6FglVwGa0uy5lSnNrot39jKp7Xy1B
         q0hqaameELgZegQIdi7ic8l9g4OnoxfhT81/jLH6rpKnWyYfdc96o7xwJyR2BdT+9Coc
         Yj3A==
X-Forwarded-Encrypted: i=1; AFNElJ8vdMwClHZIphC4oZkXYIZuvXCwwhwUx8fIsewtWBPzPLESa+0VcIFyI9KsILQrrpmjhKEajtb0Vd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzULWNipcBD49dCOMgtR+/n3ucE4/EJJ1iHvhhvJHLM80TJhmgh
	RKrf6u420CcMJ6++JJhgBDF7gwS+IQwyjFxJ+uf9ygRGXnm3RZKhFkiF
X-Gm-Gg: Acq92OE0rF/iCb/MiWBaPLmS3idFQ+UKXBAtEv1F5kW+gT/T4kewfVqxiq1ZkuVPab6
	jILK3vtW3vOnzhCkHwLDhcwBiJPyaHL2PUQETPgikqddL9hRdo3wgzvRzYi/zGgqmWjMJEGvuBw
	t/MhGEA5qy6N9WsSe8CTMVN7dr6DTo8WE1x+hRLgNoyApZh9vPuz+nzofDRWa6A0CdeZN++8V0D
	fs7OTO72NffS3CihV2ZiCWhcZ/Hz5Lg2G1sDUswOEiU3t4+4KhE5P61iPrTjmduPiEVQYhqK9iA
	VSDiyZOJw+6UPzR0Jkpkm8f91tqMpTU+vJ4ukwvy92Y7o3FcleEfLWCmoXJ2p4OlGklwK6Ot+O/
	UXfuCjNXwk040IOlhRyy5xbSTm4mZTeLDOiyfe4XnX1vkVxYnckzICFFf2lwhVCqtyW3pa+f+fb
	tYVbocufGd9vSgldJ+f21fZGSARqkn3iKg8D/QH4hAqCrszPCG5yFdOa1Aktj/y0g3KN8c1R+V8
	vUSpeg=
X-Received: by 2002:a05:600c:1394:b0:490:b8e6:be40 with SMTP id 5b1f17b1804b1-4923821bef1mr5753465e9.21.1781716672843;
        Wed, 17 Jun 2026 10:17:52 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm58928836f8f.35.2026.06.17.10.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:17:52 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <58f7163f-2fce-41e9-bc35-d1d8e6f4a298@gmail.com>
Date: Wed, 17 Jun 2026 18:17:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] ACPI: APEI: introduce GHES helper
To: Ahmed Tiba <ahmed.tiba@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <djbw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-cxl@vger.kernel.org,
 devicetree@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com
References: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-0-91f725174aa0@arm.com>
 <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-7-91f725174aa0@arm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-7-91f725174aa0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ahmed,

On 6/17/26 14:54, Ahmed Tiba wrote:

> +config GHES_CPER_HELPERS
> +	bool
> +	select UEFI_CPER

This config option should probably also depend on ACPI (could just move
it into the if ACPI..endif block), or at least have a comment that
selector options ensure ACPI is enabled.

- Julian Braha
