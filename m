Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887676;
	b=H/gUdiQtgOeH//MYEBIzeBuB1n7V79nI6Y+kTUdmn6UqyZTlYQpu0vxFNfAqnrEOxbWQ
	 OdwER/grFd6D+SBzoEH+F2O+iy+SiCxwi5VxDigPlu3B9R7+i+eRRGQ6XWW31qUDFZdPS
	 RRf3YpMeRiUZ9NNL5MZtxsKmMvA6YDo5351epp818jqcua/yZzu4Jnow+hDwPhklXotc5
	 ukzezx2/Rf4pVTPx7jHM/lXGs0/DPWCHSw05uZZu5+sMnK8Q8dB8NGmikh3f0cDsbmXkw
	 ubAq6ZfGPjM13hnP8NEg55KmlDc/wIrv6IChRNiNwy46+FfFyyEZKxd8DPaoXPWXWXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
	b=T7ALjY9lYkvr7dqZOOnfnKNlB1BEHm0LEn557o+9NvnXmKQ9S6ZgpGrKEgt7DCT6U95N
	 m2+CfeR7vPccA+2JpKSOxSk8r5Nhu3JONHDoZPJxmq9o2VKi37jfs5ehRkEc/CMK8vpgW
	 NYC39KV1Exm6jLRTTj8tTgZyxG/EA2Wm8VMqz4ArdyzzODvfVu1IL4RP10LkLUHHczq18
	 JVuqPw35SBqYx9cnMFoegM/tZSlwk6CXV+eQgNj4BO89e+qJA0BH++0GDchiPunu8+DjZ
	 FWHdEWu2FjrArJr4fL/fHMJau3XVXCHjHfqNX3xO1NBIFfpAAoeIbBKg8+fg2b0JLEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2f8mTIs;
	arc=none smtp.remote-ip=74.125.227.200
Received: from mail-pi2-f8.google.com (mail-pi2-f8.google.com [74.125.227.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F47606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F47606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2f8mTIs
Received: by mail-pi2-f8.google.com with SMTP id 41be03b00d2f7-cddb56fa486so968578a12.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 19:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887675; x=1795492475; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
        b=g2f8mTIszN7dVObfqgo3fNF0P891H6ZEKGtteGSegN02r8UpGCb2URkABmGUmYG5UX
         h7d0gzS3tRjkJRrRdxRlPb0Q+FbXKI/olJtsgjj7en8saSqG5KG1KtXWmv9v/X+yEDp1
         ELd3qugxCtjn6OacodEj3gOCDBU0VB+iC3KeH4MlVUwYsPvkQLHn1tS4DuT4bdnwMrsi
         Mk0KuG/ZXGEIcVOY73FmrBwF1rua0pZ4hheyQYe7+YQW1YsOUlsqR7wGCIkaFXTUn3Ia
         oxA+RviOv+5nyuz6paA0jGNJF+sXHbsU5OpxL7bjVaxQQ4u3KejyjhKXnYIBXKpAPiJs
         twwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887675; x=1795492475;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
        b=eK9TNmkCPlDC7/4ebARxEufUtEi+GI3JbRuhxhFC2KmnQ9Px8Kl8IGgc0RFjgOG1+U
         a9ivhhyHUQaKTy5dpZKxRQWqMSd/QY7zryxWa/GVa8SSamKJ9cZ0nBCn/weH+g16cli2
         ogTDvMtPdHoQxz+LJoWIyw8vVoSxKx3T8BiP4iD8KTw8F3AmGtG8wEOrDaQXDeYHffFe
         fSMkUF9QvSPBMg0fUWMU+iAOyWB6w7zL/+BAPF62wEZObRMnrzApHnf+yeaCXuom4ytF
         UEk8d9qWY/VCk6hXyplQcQW8gKjTG5DHlQx0QIdH9wjmkNEO56lO812wZeDEbV9HLGg7
         ackQ==
X-Forwarded-Encrypted: i=1; AL+hErEHRGtCaQnqB3A1CMDuRoG9kwzHtjV2tc+8rg941qzA4/vuapnds+cTWSGxma20BJ/um6w1prNJMPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n76MbN7e5QItKz5uXgGYYILOsrRCPWGHDHMZTjO/eVKgfWwzm
	Dp5AynX77hlSqyorYeJ6ADn/jAaj5qg5cbrgBuas5SrcViU1Pp9Vohni
X-Gm-Gg: AYBFou0nAIMDvYEDIf+Vf86kg1dngtiPWcfwnikvps+9VzEuWAdkjLkNKlSRoYi3vD1
	r/HSYQio1TqTivjcsfJi8P8bqzMUGL8zd+Mw81PKK38izNfVNDxEpTNWiRLE7c4oHJSr7IUeLub
	t3sF6kee7LhskOBYlVW/R1L5lg5hi1XjCn0NZPDfTq+1lCtR2/EJPbl8qiK2kNj51YOp4QOSo9I
	Ju6uhXlNUa1wvty9j2CxjheTD18V+nJm5rC8LxDXXcDZAIhoX3wW4BadbOJefiUu2OVBvum1jfa
	ZRdlA2IHoky1efm2iTDH/9H1QvOb1R4UjbVi5UTp/X1KglNuLZwiKZr0CSBx6JYmmqaDRChhFlL
	UfekTK6yVqgJ3aaCB8LpmZALz8x6vLBoXq9w+xg12RfKjuLg4RI3gcuHBvz/NC6TVgUGgwFoABe
	L0dNTusVECl0jwOAawfMXNjqc+mbfC7s1YvYbGFt1x5CvW0DasG55clgIfchd7EJWz0r88shq31
	5cuhFUTshlbCK5uh3LLLYqcMZZMSSS2ZSASkwnKqSWt5+eFFqa3akeJXlq/xCYtY52sat2yfYwi
	ZlMchEuIVYvzJfLx2SvOV9++gmwRwQ8pMyV8VQ/EDxcarSXl/pf7RneIawO4ZZOJD0Cu5nEDREC
	9+1mnrfWYoF2d38iHP337nqWrKy/ywkkwUnJqoRMQqvcw8Jk/XdCeGDOdIiV9/Q==
X-Received: by 2002:a05:6a00:bb8c:b0:883:904e:da56 with SMTP id d2e1a72fcca58-8beb677fb7cmr12261080b3a.36.1794887675077;
        Mon, 16 Nov 2026 19:54:35 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm4319559b3a.45.2026.11.16.19.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:54:33 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/6] mm/damon/tests/core-kunit: test
 sz_ops_filter_passed_last
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 17 Nov 2026 14:49:05 +1100
Message-Id: <179488734513.2.6285120857568566018.b4-reply@b4>
To: mattathias.pinchover@uber.com
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Mattathias Pinchover via B4 Relay <devnull+mattathias.pinchover.uber.com@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, SJ Park <sj@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261116-damon-sz-ops-b4-v1-3-1cffe7227e6d@uber.com>
References: <20261116-damon-sz-ops-b4-v1-0-1cffe7227e6d@uber.com>
 <20261116-damon-sz-ops-b4-v1-3-1cffe7227e6d@uber.com>
X-Mailer: b4 0.16.0

Hi Mattathias,

On Mon, 16 Nov 2026 19:10:06 +0000 Mattathias Pinchover via B4 Relay wrote:

> Add a kunit test for the sz_ops_filter_passed_last DAMOS stat.

Since the motivation mentions contexts with multiple targets, maybe we
could also cover two targets in the same context, with the stub returning
different sizes for each? Checking their sum, then changing the sizes for
the next interval, would verify both aggregation across targets and that
the value only includes the latest interval.

Thanks,
Aveline Noir
