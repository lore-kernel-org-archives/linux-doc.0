Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578A1A23A4
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473502; cv=none; b=eKIlIWiOcL5RqSt5N1muYgAppb5Xgduc0hhuqUzJ4j9Ii5uZ04eU9aXsc57VGIHXB0ISLlU+M6NLa/rOjk+RvB/tx+yW7bbhz0aPXcBUR+EG9T5qbSLfMb7af0ytak6hlAZTZSscxT5HLcRqBK7nMX5cnqByYsLHedb4eCAkQ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473502; c=relaxed/simple;
	bh=rmQIko+hNFaIJSkG88eILSSlkJFZkBF7X5UpMK5l3Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mz4F+SqDnafKXhu7PLj9hFdO9AR+QbmW9y6+ICtxHcXcuu3osK7ZRDumEwZAYSd/m87dlmUbthy/3f4zp0jQ50q/iuF7x1y8pc46/P92K6gwRF32K1HxpbFsh97t2/wGZ2sHUULgbCj6FT1Y8qLQ91jpCHZowJiUUKzu0zOE0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKH359aF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKH359aF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2405187b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 16:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473500; x=1770078300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62rwDCz8UGjVLmBZhM+IIc4DKJxP95Zzwu51NkV7SQs=;
        b=BKH359aFI+BQCUMCRlTVuJ+zFfDs8WEuSMZxUKOlmcAbPRoOgbGbKm5KyGchNkVw68
         O4YoAP5tWUQPSVzCROVrF9wWb06EyFCaWb4Ai/D1LsnkSugUZKoUblD0BdL1jn7xHsgI
         mM0nGdeENMWeJnpUfwx9FrwSZucukb1eVPZ4W6PFJRjQd7v9jafhcaVoG4W846hgO1R1
         ts86NFtdzD2IQINf1ihjNNg81V8svc+LhBY7Bs1Af/VueCNwBgxZ1CmZD9J4WkY5bxqx
         2ImkDvNCELT7DRFKltImIwjCYgir3NY8Rxh4WVzoJqm6j4vqTlLkHKhqgf/NabqTN28f
         q9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473500; x=1770078300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62rwDCz8UGjVLmBZhM+IIc4DKJxP95Zzwu51NkV7SQs=;
        b=SfOSD832jUU1G0Lj+rrHu5wLJAzHq765cXl7LCySlK7VNpNDs+F6G6l+Qt+NTTEMcP
         sN/UBrMgm7W/Y4YASk36vVGY/jq5yFdCrZ6iK6e13snnhCYGT6gsysG0VvYgsHb17DzS
         VpiACVFgu4a6aGFy3V3YU33+uEFgrdJ17Ogueo0sB7AlYpBKjTzi7eFfvqK9WcmL/tk0
         ZIfoo5XFVt6jCN+s5yI2s7ZaHq0fOM5lLUHJPJH8o+YCcuOWbkhJKsOPDSk2qyyL9/Bm
         PtxRqDqbxTMLvYd0MVHCseahaWAmEqQo9ZLoJ3ctzD9UoZZ+sHe2AJwi0px36gAZNLqq
         Ra/g==
X-Forwarded-Encrypted: i=1; AJvYcCXONCGEsHYjQn11LzKWDAKLO9bB4LdvPG/05SWJeg0xe7svyIJSPu2d/XJr6cinkLKx+cLai2Fjnzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cOaVYR/F+GZ4f2NT/5f0jjbVMw+JATgoUtHA8GebpzvFDM+v
	2sl4dEEMykep5+QHgBMJDo5CS30Eg7AQufG+XBUurJUtPJ/5QBx6fH6l
X-Gm-Gg: AZuq6aJfljTOoVopW69Uye1iMtYeu5VOkLebQ4w99FdosEh5vSwmM4j16aurqQ91x/T
	cVOTwvpUyCxiDIQS5DjtaQ1gWMgC8M0CcJ37J30RXe/s+tZnV0fUlTzCoI59nUvESrcK/GZXb3K
	ywGDNj605KUEsBR6NQsDpm0RP1kO5mQNzQJeg2nAQzE8sq00Gde30vQsZ60OqEXEw8Sr9vpqPnv
	QzccY9gPxffZo6cZ0CTEnBCiQWckJ13LD+q0U01hTSBUQf3RHpwmB0x+WnQCQfPznjosvD1VGyQ
	qbjXbTE/oWV/iqHhjUvdDv0vkLHcqWIOsWcvPgF2Nj9X7bWWlytDAgRUjVj6XqeLRdhnCR8nd94
	vQgU70lU/VUQHPL0aYQHAQ8LG+zEm4k1z28VjyBkmYUttxmPfXmDq50D4b2yoOJdPqVj0Iv3jzu
	3nm8J+GL5fKTD6aOFrbGZAlw0r/GrzJlHI+CY=
X-Received: by 2002:a05:6a20:2443:b0:387:5daf:b310 with SMTP id adf61e73a8af0-38e9f2569d0mr4995496637.74.1769473500232;
        Mon, 26 Jan 2026 16:25:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a142e5asm9250970a12.12.2026.01.26.16.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:24:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:24:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (cros_ec) Move temperature channel params
 to a macro
Message-ID: <5d540b6c-1c7c-45d6-bc72-b6b1bc3a4b9c@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:57AM +0100, Thomas Weiﬂschuh wrote:
> An upcoming change will add more channel parameters.
> This leads to a lot of churn and very long lines.
> 
> Use a macro to encapsulate all of the shared values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
