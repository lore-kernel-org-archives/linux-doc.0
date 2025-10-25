Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800622405ED
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373754; cv=none; b=egNTLP6debrz4Ye/OFvZxO0OJlOMLqBuWlKIxEgxefXHIOIinIOcaX8sImLj9DT1QUTFbRc8tY1gE2V1vToJLRUJE6mWSu4vs0dk5sZs4r+asW6ojfHEORpHgJAX9zOXG/i2duNbEn9Gbzz/1bxyQoSF1gngpRrzKxEqS/5sQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373754; c=relaxed/simple;
	bh=ujGGd/a7ODVUfmCS2kG83LM8Y1iCgHMqzkGVaDz6NNA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9rTJHHd0prsh1ZS+EHfko5xSU6Paa96yxtzZk0gtEq0Lu/hnJEyu6RZsyQIF3W5wt3H4FLcVTPQ30b1zrcGkEDxepb8VA99QzfJYILjIIbt2mgvZZegtevbwUQPzf32KMIky7Q5GhEgdfyAwT/UqWqKVpwILrnW4QB2j/7aQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTWlzsEm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTWlzsEm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7930132f59aso3716324b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761373753; x=1761978553; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ujGGd/a7ODVUfmCS2kG83LM8Y1iCgHMqzkGVaDz6NNA=;
        b=dTWlzsEm1l2G9adWWl3xBc7R3/a6QZRPzPRzfVNA3Az+VXjrOkqXkLctfH4bW1fo4w
         k9at0EvHSm9ekagkY79nm3/HK5/m5aTsHeR8zaj6PmiMF0Ve4Z3khG7o/dwOzPOyZJ6z
         9ZujqRNxRMXepJ11jGfIwMpcNDIeWYsKIVJYOGEQssG4uJZL51sxd4/OhdZhiruQc+d4
         Ve2HsMh6EO1WvBkr1H9YFRb/noihuCdlHGwxAZmUWkCo9dpUTZYAhxgXB5BzAtlRkS9U
         3GNSuNyIHFuyCKfemUKfh905RuFeNuVAHzZclkhYHWMG96DHdPp7STfc5KfL9VkemTwv
         THGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761373753; x=1761978553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujGGd/a7ODVUfmCS2kG83LM8Y1iCgHMqzkGVaDz6NNA=;
        b=JPjOe9erzRek00dUdgVmy3+v/DLrszCgflAD2vYpGuvrrcWApwT1/HeB4oTPvjevZw
         AiKMuDnvcOALZl9R33u6o9Li+d9tb7VfnWAEYp1YvhyeWRgRFv96KTItuX2jMSYmEXFF
         L/fW3+J4sJe4mi1x9CH41PYXQoLIpbK5EjHtopnJd1nGjD9RR8Oi/Fr4oIOs3rgNL0co
         td4lRnw1PAcbZi4wDgMCS99pWeNY1akBsA6Ic/80z0zTnHiUZqTc7JVxN9RzFfZeCQsL
         tPfscrHf8Qx9SScqGcZ4f6FEVKpSbHHTCAcWfl+JCSXuyjI65fv3Wps6mEXJX/lWJGxl
         gZLw==
X-Forwarded-Encrypted: i=1; AJvYcCVrtmJ+sNvS2snW4zqi8YFNeVCY60kWbkRPuLr8Fp9FxGWkDxDpqSdUC1S1GTwo5EvBgdKY0u/fbrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBspyuLjNbMPJ2Td2m2UiInnVJR4V2uDlbrmYzW1p7Rgqa+PRj
	9Zu31zHcmUnvK3OUNHfehJYDM6WaV9UyUe47wqFhReXm0Gr/5YJBdqVd
X-Gm-Gg: ASbGncvN5A1ABI9l5iaw2hE0/UCr1QGzFfWUxe9F1OjrDcAWC6TnzNo2/D7Nd4s6Of+
	jUGXkovarYu3gyhG0G2OII4Qj9W6mhxu17zm78/78kgFmfSGMjj/LBNltHnmqedAudfBERQhbtQ
	7nC+uowfvvJacobok0BZ+C1SnDvBusYZswmQO+eDOIAPTyJ0zjY+23B1FFwucelkbjD4b/vPO8Q
	HwmlWiMOKysfO8hdz51eociuRJOoqTJur1W0lp4IZmPrIJ5Zgk2iGcQI0mLaZi3R3H5QTeLAqZQ
	55DhyAcfsoLmqp2BztxXSPq5Utzz2JuBBX9GD9jd13fEoYjPU+Im3HYXcTewzOgj89v6d1KD0vM
	evP7fYDKfOj/Rkgo7/qCTSVWT9OZLSs+5FYHbhlQFF1L+mqbfsPS14Q9v9P18iOFuxpi/YMQHhf
	1TEXQ9e1AEzO+de35GAlGE0WcX1myTuCFFZ/OwEgUrieXZXOmAB7FCRbYF
X-Google-Smtp-Source: AGHT+IFWUEUqUpK9BOM5WuZByjx+FKXT3VLhONWJFmh5THmG3nVw5cQe7vhxVbZm9c/e9p2ROCfQ7w==
X-Received: by 2002:a05:6a00:cd4:b0:7a2:7d0d:80d5 with SMTP id d2e1a72fcca58-7a28680406amr5047434b3a.16.1761373752751;
        Fri, 24 Oct 2025 23:29:12 -0700 (PDT)
Received: from ?IPv6:2401:4900:88f6:d7b0:443:a828:b6ba:688d? ([2401:4900:88f6:d7b0:443:a828:b6ba:688d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049f47sm1181005b3a.31.2025.10.24.23.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 23:29:12 -0700 (PDT)
Message-ID: <403df2fefa9b6f83f805de3da37c18c7d6ef661f.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
From: ally heev <allyheev@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet
	 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Date: Sat, 25 Oct 2025 11:59:05 +0530
In-Reply-To: <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
References: 
	<20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
	 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Based on the comments. I will drop this patch in next version
