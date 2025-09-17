Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B31230C607
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758098743; cv=none; b=G3pcEbI2OsklQ9PBKUKVgQG5FCis5h6rlEcisVmfeB96KGyYZkSa8WHz4P7d8YhN9NSNSfanRdBIJP5x+7ofWK+bO2ibu6yY6BwIoTU/eCfG1Pk/DX69iyWS1HBypomIv7OkT6mvPYHtLXtk1IRWdkwjzX5PcCjyrCjccfx6VRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758098743; c=relaxed/simple;
	bh=6oSQoJYXy9kzZUXXsKvQNgIjw+FKm42ZDgUSNQ81kUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0k4x/05M/WZ0GvJ4kHDen98XMh0rvU6Mz2dohP+rZwB1VtyAaib4uX0kIiag+RSOTY7bfXecPGz2DD1S1vYFYzXfA5Fkfi88/aJQNoRt0NvVYKi3kibbahgNJIm9DmWeXyPUhiKYrSqTfd7/ZxMeugJyswVBXxrFrcu6M30Z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9wlBi/F; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9wlBi/F"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2681660d604so2909615ad.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 01:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758098741; x=1758703541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=er3gFl7t80h11A2nHITwY2f9Z7fB978uzRRnymZFcUE=;
        b=M9wlBi/FpO/Kjow/1WggP55N1brC6tQdJTOi9aYa7JJTGl8xeskuOOgjVfHrmLg+/s
         dv6EgfFhUGSFBcfOAT1A2i3a+ah0U/JF62GCNCIFAXL+dEqODm3d3AKslxQfqXxHpAPE
         68gs3B9Bnu2iyORL27EXSkVOxl1EbPrH4epiet57kWV1ePMaNRNc0UZzpJ4jXQUmRqnL
         UaulEKmwa5Cl9n4ghazysNf/1KJAt6zQy3IIydsFkP+zni7GR6riKYk2E22rBMGs0j1g
         DaP1MxIlsbpYHP3oW9j5boY+WKMCHbXR/XYX9vBT1+zkXk9jrzUMXR2YJWtu/ctnzb5H
         87aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758098741; x=1758703541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=er3gFl7t80h11A2nHITwY2f9Z7fB978uzRRnymZFcUE=;
        b=MVCdvvoLtF7j5OlvOezPiJGGU4Nj2Y3kJ8vuBiGpSWpH8TuDLsJTcpffVlcY+Bz/U4
         RbkFPykid7r9mLwIVb2Qb/AYuTe1q7umK8jrzEogkuSCrGTkHz9aM7uyjkNNKhSLkvgK
         ckiqoc6TV1tuAbcaBXKEvHE+GWrSIj1m31duy92pbVSzBcl4yK/+IYwglCYXbj5nKCdM
         O3YEzJe+SjJFp6brkhYiGsAtv8V56yvlr35d2HpsJ76VBjBqAxYflw2dbN384nC4Cnlj
         rWUtZ8xvY/CGe3Xy/tU56pjDG8cq1Q0m2mxD3IdwQmO0PeoULJy6f9hRWi4Li1L+D3e+
         mzRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpj7HS1/uUE7RZvsR54nJ8vyiXJB8OQhp92+idldw1bAuTQpCR94w7YDi05iFu+P7ZXVOGBpO9dy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEcBP3lngtSC4LuT+DOkgmd7k3Hoh333T9T/FgYdzt8O6kF/n
	BAlgH2T53RegV00FyRenxxZcoZmWyvu89TgraxbOYir7FfxYWlTmqWJnC5KagQ==
X-Gm-Gg: ASbGncvrQaJUmFxFUCZCbV8hnzC+TfUkDRCFmMl+PkjlKyENaX40wMJa87voUcfA0Jj
	a/ntfCoWfe2WjQGcXb/jTZhymvggBgBN3g6Qen/bJILiEoKVCZ4LG+FKS3Tc4Gxrw9SwbrozsM3
	bBnM0AZROLOZYrfrOv4Qz8InqRMH9HtVItIh1txKICmMsbnJ80wMKdIDYAOWgBBiCUwTVCWtcgZ
	MvRWNsPPlskrp0KBv5Q71jvExHhC6di+BgwGTzZol5BpPPzhkzlDZUq+QYhY0GDrkuycnKvQmtc
	wBUhMHlod2Kfrs9We5LRFu9JctRvT089lAn7du9O/u3EDYyaONQj5YUtgxTtde8fQDznPx+2HIn
	gcBg+ByyU4vt37ms1LA4d6JzBdvCx1xI3Un/IQy1+SccG76Nm+EfR5c3ECnUsO+JgfIGw
X-Google-Smtp-Source: AGHT+IFMfFBVGxsXgshIcnGLbqap9aPS4k+g7Lx8SuIeyuVKI8d7KH80dJtO1YOvvV9NWfs0P0JNIQ==
X-Received: by 2002:a17:903:3c67:b0:25c:5bda:53a8 with SMTP id d9443c01a7336-268137f751dmr14664605ad.37.1758098741577;
        Wed, 17 Sep 2025 01:45:41 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-268012804b1sm16864895ad.106.2025.09.17.01.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:45:41 -0700 (PDT)
Message-ID: <215d67c4-af89-4757-aac4-20d2de659b64@gmail.com>
Date: Wed, 17 Sep 2025 17:45:39 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/21] tools/docs: sphinx-build-wrapper: add a wrapper
 for sphinx-build
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Akira Yokosawa <akiyks@gmail.com>
References: <4d4dc78a4e29f2478fd1c1a746378dc61a090ca3.1758018030.git.mchehab+huawei@kernel.org>
 <1d454604-288d-4185-8567-836e06b3cbea@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1d454604-288d-4185-8567-836e06b3cbea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 17 Sep 2025 17:35:31 +0900, Akira Yokosawa wrote:
> So, I guess I have to NAK 06/21 as well.
  I meant                   10/21.

Sorry for the noise.

> 
> Regards,
> Akira
> 

