Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032335;
	b=OFJB3Z3MUJC6jPKx3jG3fhLK0Vd8RCAEhZQv/dD2GJ6LQA5jwSuUOkukuVnesprjSkvr
	 WKq84eHkY+f28PpMzudviPyxfZEgfsxIpaAJlKk1aXZInS/w5rqGWQM0i2RMeS5dg5yKH
	 CmR1tUDMK6m7IRkPj81zqtR96MvVqAPeTaW2ZkIbgIpRLee9i5r71BfjLau6GxmTtBizy
	 PQ9+tDwaIZv1EF0j7yfG+xO1c9EcKgbm0fvUaksnEOvYzgXF3uf7mAHgqhLfjqnbgAevR
	 FmdWx0Cu+0ooF7NDWuMpoJz1UJqihvOScCTkrjQbxDa1ZcWOwb5icwlituqzCSmEUDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
	b=SiWv5uJ7kM9Og8ZozT+RiOJx9EvRgxr3DCLkmdK0Yk/HXCtXMi7vldDpwR8j0sR0ithz
	 iuLI1XUDKxbrrYXruxpO9XFCEu4P4VDN6BaHRetrjPOlmziRCsgaf4MjyQycEDfGU4sHk
	 70jKJa7oQg2v35atfTH9C9Ehc4m8oae8GTbHh+uYCy0FF/JYqD3APMkxHlymLZBimG/x+
	 GeEjuWwSTS17ttqk6hR1YreLDSeLk+NMgUMmglwsBhJ9HqhMVex6XwS3GpZ7+GOdx2i8e
	 KIhx2WEEvR7OH8Wsjg8YZeg62ovxrIBElNvVj1uWZ7XObYK07rdcUL9WTHiOx8eFhbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FMbmrY;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03EE606A336
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03EE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FMbmrY
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso210897eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032334; x=1795637134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
        b=Q1FMbmrYQQM0s+ITTtFVk2rDTCxKhZq0tHSCa2oNwKmMIhrmem7HiE4QVyRnT/aIyH
         DXfy3kpwMUJOIhMYIMy+ACBusVXxNb97WjPXy3ICtPgpymxbpK0/ogDILwffmlNlyHZq
         eFMxQxRZ8XFVEd972N+qeDY4Nq9JbbPp24pcGo4fctMzvMj5hnnox2rz/WUOKIrG/GQ8
         UYxRNzI8UIo14siV2QhWPTiAVnItrl2hCUZZrDkDRCyr2ZECEJjSWeooQOiNiQ3w61/C
         ryWjtdjI+8N6tzj8SewjK/TnGSE2EQeqN+0w39ywVYFJPV1JPjAA1lMfVffOxP9LKXSr
         VMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032334; x=1795637134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vm6X4RXhkwTGS0rODxxBI99H8aOAkurBTqwazIDQj1E=;
        b=xe9COnvrq/mRdO+FpsRosNQy/MRSsZ4LmcIx72tUu9qavARDZPUPApabK3Db9S/OXd
         Ch5IUxWo9KopvpPJQwSg4P5fq/E5fNk6fx4m8W8Ig2FSRPSr35C8J4KV8eriSTX3iDGP
         bsnHZL5sHqll6W51jinrIiXudXIPRuMgoH1sYL3RDrWeVx9H490W3iSr7RvFTQvPr4aY
         HhhjlLDiCDYJ5dngXaQw2N9m3F49K07bTrfweUmnImoif4AvOa7a4U8rVgxPJ8QtO9Xv
         QWeZVgZRSqhrSDw2B8cB7KVdKboN7vtwQ3eZdk0w64wr0eEwwWyKB3YiK8LcTlyV8Nj5
         2eRA==
X-Forwarded-Encrypted: i=1; AL+hErFVBnQmDNP2Wwz2GvjoUudPugDuAwpfY45tmMfO4pCF4YDYExUZY85pq/MygLyNi/e9z/yOdEnqdKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vk+LE4lFEotY8JgWxGLrSIa/SXV4igR7KVedtpEo+rwLCkbZN
	2lrorYCtM6W9/V/h3n1ttKfhIgr2gfqhLFwx7G/rsgewn8StbqGewULp
X-Gm-Gg: AZFdTZdeBE0SpE4QJ569Em5hSb0yLByMCmYd/7Sau8grHABfYjEjqW/u/wWblO1xu8Z
	0FfNwE2aAUt0h0uvfHY+zu98t8LPi+pxvIhTSc1YFN7FgpWtZ0Pcl5GP4SPA7kgaa974Ao9uQ7i
	5qqoUjrMwx/EXX+wXXzhGXIrc0IkAK2xiDMp2kwwAtOHpnIEy16VkX4rBgSt7JYQPjFVCvhYDu0
	Vd98wala6XRUj7IoCi+lj+mGYReqMNPzlXRFx0boXh1my7uX53NE51ZFD5LFyfMcS6+nQL4YDTY
	ZbvTo5qKjcoShtoYSsdl04YUYTY4G3aslLQtd1HoZDwzBlQIFvCW/OztkWcK+Pfq0OjAtih8xfp
	XpXlt4RjwaD//AnBXgJjXeXHRb6608ATcqnzZjaBaooVvgn0khW4Y6S/KoUW4fCTLwVF+vV1fop
	WPmMr4FGv7w+lFawqWfUKv0kVkv4GYFm9v4ETZOIjSeQIS7LvxoUOM1Vs8gT5LKNQDlv50r6/JH
	DQBkY2cv7ggoAVMpD1kDwrZi6HWdGWLjO1MIC5wIiJEES16H2JyXTjY58QZX9ILt6zYso+DDNQY
	N4KNb7Z+R4+Eog3khedo7RHzKyEa6s1yOhhc1cP4h6c9SgnnCtQ9uYHWM+eTkmGEBGk+p6maXie
	cRzgTj8unztHNFfrda3h4JMT9ALH/
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr420599eec.13.1795032333782;
        Wed, 18 Nov 2026 12:05:33 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm9683206eec.20.2026.11.18.12.05.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:33 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Wed, 18 Nov 2026 12:05:30 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617695.3136.6995182814188526026@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-2-ahmadexp@gmail.com> <179502617695.3136.6995182814188526026@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed. RAM cannot distinguish a byte read from a truncated word read
returning the same value. I have stated that explicitly in the Kconfig
help and test comment, and retained the direct-x86-64 restriction.

All four KUnit cases pass in x86-64 QEMU. Separately, the source-derived
accessor fixture records which I/O accessor was called, including its
width and address. Removing the forced-word read branch makes that
fixture fail. This is software accessor coverage, not a measurement of
PCIe transaction widths, and I have not added runtime indirection to the
driver just for testing.
