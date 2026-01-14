Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0223D7DC
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359093; cv=none; b=pFmAxWZamlbVzrAe4hpHopHSQ1Ou5iyz2zWPxcJsbxDwNm50MrNuNk4feTcwMH/8UAb4mDoCRbiVKPipn42Wtg6/ST9HoObeKxQ0aY8AtIZic3n7VCPYe15MzVO9K374jQKDyQup9+VFoyQ3G9DDS4UJf3ds/eH6m3CNfu1qJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359093; c=relaxed/simple;
	bh=TQ9qf7bYA4BO/JcL+3MsINrpNeFWmwB3AH5fXBm4h3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdWZ8hEOMnRKvza/dMKnjBEnNRAI/++WmMjnONmZMm9q6q4BFfHcKO75brrygmbKZ80WPjatCUcOZB4q3nmDGyJdTRpv4p0ZT26o0p1/8gchwCRO760AOejoW+zNHIkof6GvJd0r54nMLlj6fCoqW5nsjIb5g2safjbU3jihwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4GRVe6i; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4GRVe6i"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ae53df0be7so13659781eec.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768359091; x=1768963891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvu8UPfLlwRF96xOboi7Nid/lju0eRs0SRu/ifxBI60=;
        b=A4GRVe6imWB1NZyzORBX0cWShTUGxqMNMwdwYSBKDz2+zVFNbNuRbb3W8QbV38U/4J
         wYPThp4fxv4B/tI6I9xC2ocbPRJeBLMTHqz+jRnLMjgdExBv8HE0h0AfgIXYIJlH0x2j
         brmRtSGWG9J4csIUS3qfnkhH4m01fde2G5b4OJEzlU/qnAL/O4usbkOaPIDO9D97S35g
         WqVDTkGgpHPLoEasxBF+eUachrekqhFVaDUDSRK/d0jy+ZMUvyVUB83EDbTyYHazulEM
         WXi6vNEeou+a7GhzO8Gyu1XtBknHiOG9yCaiYR3/RGsmiIuv8ekGilPt2K4CJHQfUXL4
         84tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768359091; x=1768963891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvu8UPfLlwRF96xOboi7Nid/lju0eRs0SRu/ifxBI60=;
        b=edjN3OeeiE1fl18MC8+tHsg2wePFDSSw/2RzezUafj8K06BXzIShTjFZQ803iG+ZXf
         8Ouc2iqsll3TrUVzu4Wj70M/wZqRcwyf99AjmP1tZbooUTI2kmQrY25IvCqJbWOWWW82
         Paleb/IT1bFJup5s4lbEcmXaxSfBVHwgjWsxNjlMbucQfglFI5IbFuTHMrzkf3k6FHVT
         ySxlpl+v/bHf7BeimcCQfC94KkJ27NM6XBafsdPrV5dD20OS4wdLhZzXTe3zF7bJLTvA
         IODcMhsHsyco4zaPPO9iVsvR8h+i+nF21X/exrYbmGN8rbtKnQAn3sB6XobPULtO/18N
         IiCA==
X-Forwarded-Encrypted: i=1; AJvYcCXYW7fbSBO53jxmwsAfG8KXEN4BBsdnjjOMVWAbwgTVu5BnwTmlGdk0sAGTfvuTWmRYClnjQWRhux8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyene0JEslB2q2ojHdagku525M882lKhXC/o6Mn3EyHokhex6H4
	+t+8QpKd1I7QQ/AtzW37xqUsYBfJsnH/PBqG28ws+fhwFuOPzFWlDvOd
X-Gm-Gg: AY/fxX55+WhM2fuWpNs9dZJhbmgfyuLIP/mOZixBReKumnFd2bFzNvMKecr4gq8SPl4
	7haJHq9Ie3XvJti9JFygrWbjFA+nQ+xRoTNExwZjuceKRZ8w9IlA21A+tYQi9FzUeQcYeDlQKsJ
	M01/NlgaivhanUSkuwMoc0vSO9dBtFSovfg58HtTvttxqzX3qcZbYrrD8rKe9Kp7Z7NPSgsKP5G
	vttGUK9nT+T4Up56Y0TRrGUaZOmBv+8L31jYBvvPO5x6SCVQq7tkIy5ogQoKA+O+MrOk1TnFUZ6
	kLBAytBf2dYMGK8TQDcpQkVl6BNvpP1q9CQICsV7KUkRPIwB/X+WDY6cUoGvDvBdDHGdvXeThlU
	QUsOGQ0WqjtMgWtBdFhSEwXgKHqeeGryJjoz084MFiSB6HUYGztvVNMxmFlTz/3TkxBOoLEKI85
	M2wQHefi9ypGw=
X-Received: by 2002:a05:693c:3104:b0:2ae:5b88:3499 with SMTP id 5a478bee46e88-2b48f6d41b6mr882336eec.37.1768359091038;
        Tue, 13 Jan 2026 18:51:31 -0800 (PST)
Received: from localhost.localdomain ([2607:f130:0:11a::31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b4549fc8e9sm3001123eec.28.2026.01.13.18.51.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 18:51:30 -0800 (PST)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	damon@lists.linux.dev,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@suse.cz,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH 03/11] Docs/mm/damon/design: document DAMOS_QUOTA_[IN]ACTIVE_MEM_BP
Date: Wed, 14 Jan 2026 10:51:06 +0800
Message-ID: <20260114025106.81183-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113152717.70459-4-sj@kernel.org>
References: <20260113152717.70459-4-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Update design document for newly added DAMOS_QUOTA_[IN]ACTIVE_MEM_BP
> metrics.  Note that API document is automatically updated by kernel-doc
> comment, and the usage document points to the design document which uses
> keywords same to that for sysfs inputs.  Hence updating only design
> document is sufficient.

> Signed-off-by: SeongJae Park <sj@kernel.org>

Hi SeongJae,

The documentation clearly reflects the definition implemented in patch 1.

Acked-by: wang lian <lianux.mm@gmail.com>

--
Best Regards,
wang lian
