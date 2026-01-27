Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD96B1A23A4
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473434; cv=none; b=ji06AKlvWskl3PIZW6xKIMPQWtOBw9PUGQRmm3/hY/vts5/hDBdXQtlhQbi4oaWr1zM8qIjGTJBpQuxW0NNcwwoEE1gtzdMmjAIC/lzcQ6bPK/UzXIPpChV/R5AV/Rr9tA+G3oUyzy9AkLihJhW4bfF0AmEm/WBG+hQcab5SM3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473434; c=relaxed/simple;
	bh=bVmYZCvIg0fuqjElUFCUghFOqlB1ruVviQKp1Q1sy0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2bzqljr1QBRLvDW8JyEHGZAC+lYkZ+biiPFJtt4VZPCx4C/3kM/QE2MtMKPG9DclAFdKnJhzl4ENA0k6uo8MeQNxmiQl65fh+aN1cbO0jiYiNSyVRBzMfOHosqtv7IaQ4hXRCkfc9FJPjePYmFWS7kVGhlqAvayby1n/WYTBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbjDnGf5; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbjDnGf5"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so2569116b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 16:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473432; x=1770078232; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caooTO+7nQeQ+uubG6MbzWHbwrWNJFEfGvuRG7PXupY=;
        b=lbjDnGf5g32V0Cc2i/EDWdlx8S0Qke/6v6VHJaZcW0YOzanGHdm13DznBQSih6H2wT
         MlgK5Ul2qUpOcBqYlEQH3mE559TRabEmMxw6JLGz1RkCiCt9AMPHEE5KFkOgD5nkrHM2
         F/qiPv+6G1S9DBTrY7pXaqOl3F6WpRpRrLkXp/8w+HecOcaImPkn3RNm4E/TfAktnLAC
         BRhBAV3+bQ4gdvbo4vaUPy3PCPbb6YaS/BoowajSMoo4hmmhI6g2NkEPw00/zUDpZ8id
         k+smLnx/+agkhu/JSYOoE5KhJtfuoHsWY+Ca++5FncWiSDCDO4QmaGUiRCy9GzotX7L9
         ZzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473432; x=1770078232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caooTO+7nQeQ+uubG6MbzWHbwrWNJFEfGvuRG7PXupY=;
        b=t+1OKyTrdjNUHK/NH534xNkZEG5PQO4FqwordDYwDFT2tYU0Jnn4rCxugSU3MaPc3/
         82CdVU2i1Yf6HRsnimenP7YL5gaBPdwEJFAuWcypXDkUm1/IilMkGzKGTU8aA5Y5COcd
         VzqZ8/556c3T2tDIhvr2+JMS13jtTVz4+MQOtm7eufc+2EuCSqTo2goQXH1BxggIR/+H
         ddlb7gHnZGWfsDNXvoNZmftlqydaZDtEhgHXeeqO6Vu2Q99jz5SVAIAF91rsboEdNEG/
         22aPba+XVMc3Da7hdndCR0ipVPd8ANLvpUyMMyEqjzWjI8xB5NYrqvQmIrFJGtJ6G3dQ
         BCvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7xTjJBai21NpOP7Wu+eSCsPQfxVyq4Vbg1WVxBHbsJ19sVXXGqUyjQ82yWlvxxikO69DUbtxeiKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LZElOY7lWS5w/Tu7bwIoUOzR0T0PQkYe55l70brJZ02PpqS6
	4ZmLMpcnEhywwALYogr8n5zb4QAaxvDG4lOs0maU+gqunnOO4+suV8ze
X-Gm-Gg: AZuq6aJGBJpIiGoAI3btzdc3kjlEQ/7rxfY36Ula7fuaRn4v6RTfAprUN3VPC3S6iWU
	zin++1QKk29glPWewj/XWRtpI4gYFLjZWIwdkXtY9K4Mj9+sMvB7lJ3j3AEcrbI+jzTmVD4dP4y
	Fcc659w8utkgKG1m3wTmO3W2hryl7hjI/s74UWKM7YxDED+TU5m9bNX1YmUqeKGq/kkMU41TRib
	4EVSs6R1RU9CJTmL0Vz1wEh+5yIl8dRuwuhw3IIGT+uG+F86lYoRksZ4H7U1cuZ9BJ6/izBjxzV
	2afIj2ioeCKnuMOd6Pym/zdKHn6Lha2cGPDL09lRc9UnZ4I28BJN6FH1SIYBBSW0yEoQhZvF50b
	qBMPQpz88NhlusRS9dyKRQjhWwwjybgPtOrTmYaTZ+nobd2sD92wL/oFnxh7U55JKfM0hFQSsMS
	unooQO46Ha61hn2ne5YvvJal1R
X-Received: by 2002:a05:6a00:90a2:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8236916ac21mr31129b3a.14.1769473432307;
        Mon, 26 Jan 2026 16:23:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644bcasm10315629b3a.2.2026.01.26.16.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:23:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:23:51 -0800
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
Subject: Re: [PATCH v2 1/4] hwmon: (cros_ec) Split up supported features in
 the documentation
Message-ID: <6741ce04-c51d-4c21-84f4-c7f26b298b44@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:55AM +0100, Thomas Weiﬂschuh wrote:
> The wall of text of supported features is hard to read and messy to
> extend. Split it into a definition list with an explanations for each
> supported feature.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
