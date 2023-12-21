Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA8579460
	for <linux-doc@vger.kernel.org>; Thu, 21 Dec 2023 23:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="N+6XTxKl"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7811548d0b7so67485485a.1
        for <linux-doc@vger.kernel.org>; Thu, 21 Dec 2023 15:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703202425; x=1703807225; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsVUD3VufeS//NudK1mZpNpNjqh483A+CiJoPn/HOt0=;
        b=N+6XTxKlaC2HK9apPi5lF5yA9U9+v9+igO+KUZKmWzb0n3Us6OAR6OM3G+JISOmwz9
         31dKEVtXKscWJtAEgklym9CqFS23Ek/8S17VlPx3WyqrVtq6ZYEzH2+EDIPr+3SFdVGr
         ux3u6ihviErkgeJXwFumSuIsCxF8qzfb+wwKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703202425; x=1703807225;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsVUD3VufeS//NudK1mZpNpNjqh483A+CiJoPn/HOt0=;
        b=m0xQ8XbzF8i4z/ttyqcJT4WAOP+kwDJWllTQHLiPbk4bKVADr1y8s/fc3CvuD1OLMX
         /CUqe3b7Jp67kHqVGKNwtR7MNrIgBuAZ1A5/51SSy9FQJEk9spKdK4U04b2o4AtnI4U7
         MVwOuHLw1nW1NIINeMWcPZXUF4vhnDplXgt0J2PZln+QnqEC1AIMPSV90JEkU7mPta9X
         8OZidLROLxxiGZgFZ1jyNDR7BVm1AucND8QfAzLqwSW8/qNGpFCdpy7M/Q2XT8c+Qyv5
         vdP2DWRtrcuub4iv53UOY5kEun+9YvdlSdiYQh8+L9wXV2uF/LJBPjpdfzR/dmQR/a+G
         bzJg==
X-Gm-Message-State: AOJu0Yw3F8LIUZk4pzxIux+/CEUUhAN0Ah6FI6oS07T4skcIfPycPYVD
	NV85BRP0tQ+aMi4EZpIhefkYNr+TXf3OEw==
X-Google-Smtp-Source: AGHT+IGgeO55s3ldTAPyX28iP11/SY4z5r1rs1DkQ2IuOS9AvdwQW3R4/9nO6dEIKqII2xWc9D4G0Q==
X-Received: by 2002:a05:620a:2843:b0:77e:fba3:757f with SMTP id h3-20020a05620a284300b0077efba3757fmr680867qkp.119.1703202424838;
        Thu, 21 Dec 2023 15:47:04 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id j5-20020a05620a000500b0077d74f884d9sm993080qki.117.2023.12.21.15.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 15:47:04 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: rdunlap@infradead.org
Cc: corbet@lwn.net,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com
Subject: Re: [PATCH v2] hwmon: clarify intent of fan min/max
Date: Thu, 21 Dec 2023 18:46:46 -0500
Message-Id: <20231221234646.15776-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6ec27515-d2c1-48f1-8935-55f0ae48e72b@infradead.org>
References: <6ec27515-d2c1-48f1-8935-55f0ae48e72b@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

> (other than telling us what changed from v1 to v2)

Appreciate the feedback! I'm new to this, so basically it means always
use --cover-letter, I also noticed that I should have probably added some
'to' entries, the command suggested by lore moved the original 'to' fields
to 'cc'. I'll be more diligent with the changelog in future contributions.

Change was incorporating the feedback from [1], changing the comma into a
period for all three changed sysfs entries.

~Ivor

[1]: https://lore.kernel.org/linux-hwmon/40285311-8adc-4ca9-86ce-27c8b723a102@infradead.org/
