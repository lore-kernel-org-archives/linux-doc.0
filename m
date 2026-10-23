Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760706;
	b=D+tDelEzuBtlAkDdUW44Lfh4CN1H5jDwSDP8SViZUYUqpr7vJ38PUY310NIxR8sSs0LR
	 gazr2yijkwRU2FehJdQ40g8D5R4lCapZdJr0SokKY5so5XcJO2s08LUV3ofdmeRAvCsjB
	 SZQHojIQrmwjP5hMAtrAVUj+dAUCebnB5oNwjzAlUtQQChHG/KpVROLr6OVjvsXHifBo+
	 QgFPXrNQ3zB6UI1IyYGq7NNiKGrYhvxeiTgYLE3r9BQZ5pkLUyM0V1Mr5MhNa3DBi+xjg
	 OxsvotYIM+HnHddONBI2tIA/zsdumc80UNjWpbsNLFUKaQ98SvfaVZci5xXKVtC3hWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HHctjoTOvtuOQ24Ou0BbRU1HbUb1u2shm1c/Rj8y8vg=;
	b=TIAwHJTLwFomroyo2UwirCj7w+CZc2Y3ekdacVeF+bk3pek8YrJGf1pvDonAPb/rRsjL
	 tJ/+wMq7JhESHshJfUUQtT1ZL9xMKSnd6dR8qGdvVpAM2lZ4zYVkCPdKpsTfOC3dsRCVr
	 9I+gkEm63zZUr0C6rZghLc9gFmTfEJ5AmESxFLR6y8afASq9l4GnWzw5Kb1DjEHDonD9j
	 rWXhcgtuqE7M8UV9onA2ND5PPY28VEK7q5tl7MhDw5agqnhAbnq7zHDhrU/sVLXZ9ZqFi
	 gMOaaLHC9BHIohg4qNJhvjLMkEsPrn6ojXigRS4zcfJBuHFv31az61Jm6mOJSdcX0ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YR8vZHAz;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEEF606A336
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 13:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEEF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YR8vZHAz
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06f29bso164411f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760704; x=1793365504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHctjoTOvtuOQ24Ou0BbRU1HbUb1u2shm1c/Rj8y8vg=;
        b=YR8vZHAzHjlnrld10IBkG1iGFl4E5kW1iSewGUVVMAFCK/Hnn20YfyvKeyb/GGupNG
         EhzQQfmhHrTs9e6PImHV0ZgS2mOpyQfIFmeFkIZ8XRhRM8z+bac8RNnhD4Am36n1yl54
         GQbjaHfcrB/Dm4mEzndd0eAJXihiOKpM+d+r1JhQd5Cim8XHP1/fh529uK7bIahyNIN6
         8qczkNJi7HBuwbeNZJ6IY+WUkOU+MLcuq6860eLUqIzn7enBQFjk4K7izdhP2OlTJR54
         1GtSITZM2CLkdCYYFxW/atfd8NKOJQNRLnhxd+ModVGgI+ar2yoOg/sSah0YucE7IsNg
         qKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760704; x=1793365504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHctjoTOvtuOQ24Ou0BbRU1HbUb1u2shm1c/Rj8y8vg=;
        b=Wvr6qbTr1cD6chHEnvrZo1ATIoOnJnm7iL2hez7d8wItmCsK90rqxn6XdxXUiExINM
         Py5aTlR/A2zZwiz+45qqahLYNUZsuKyX3Qjvzc45wJVSPm9CiJq1x/J1qqqdWNiV6fOs
         3WDs0urKW2lkQuSeS9G3hZJZtru3Utbav8PpSj+H5wv8ZUZtYUC8NNR2iYyUlC+VdbjN
         CHGfWvnCGOKFIB4C5WFCI7s3gEyu1NpDwpwnlvbQSeJ7qvsZkTE/r9+buiWLLg/iQEEE
         GDuOBYmhaZTcnmmdklPowGlf0jrrtlDP+Vvn31WZ9FlPMGDndsXVOZ55m+IQzSAJeGCE
         zxSw==
X-Forwarded-Encrypted: i=1; AKwUvBwriuNoyzw8VWnlqNdU+EmsVnFek8pchfvCctFieuTfjWzcdZ363fj5o7TpEBZHWv9H1DOpwzUps68=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt3lKYFX5gKQ7VG0GzgMI21NzBgglmYemtaiYOrL+3RRcj6mr5
	LQZnaobEmEW9bmsgSKn15Pp6OlntG4GjV8NeCgaxO+tJ+cuAU2F3tiNN
X-Gm-Gg: AYBFou2sRBLy4tb6c7XJBVymSqnbeGISv5Ic1lotYNhtnY0b7ioFD8HdSHCn/zWfxTO
	/gCs7zWJsg6ViAFv/cjdYpv4P+8d9vyWOAFUGsaYlS1R8wCbsomEgdAhz4RnNZZAKgfx+vakDVH
	PlJCteoeFCc87cnjNA5jm4h/8Rexs6DWzSLu9vuXWOJn4a6PfsJf1DjRnb+W4ZNUMFzUS4G54nP
	t7wxiiVHjf2olEO0PhtPLO+yAo4vx9e58lDXXotl4aFED0jd+2gWbpdxhw7mujEAy7d71aYClPM
	wOUntXlI2MFko4QuRdd3tZ6GXBGLIP8VEeBDfTf4inZwGQFxd4GEE52tTdSiz9hLOvt26baSeCe
	i4EwQwATDh7zhyK7v6XqKx+I8t5m/CHgfCfVT0n6lREGZS390mRmBA1M28zLpKGp3xABMT46JOB
	bAuwDgIiZr4ChRfGAyCp65x8xwbB8FnYDzG7IqjM5LQHFwrRRowgz1GhdHV52sBbtrBGMKcxP++
	sLI65WfAav4y0PfqBUQx/z+u2P35H9+lMAzlMs3v9kfsBU21vw2Fq9MgSp9+SKUK9Li4bbFMD8Q
	43A=
X-Received: by 2002:a5d:5f43:0:b0:48a:f41d:83c with SMTP id ffacd0b85a97d-48e384dc66emr4505487f8f.0.1792760703916;
        Fri, 23 Oct 2026 06:05:03 -0700 (PDT)
Received: from Nuel20.localdomain ([105.112.97.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38061c7dsm4658755f8f.54.2026.10.23.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:05:03 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH v2 0/2] docs: kdoc: convert tracepoint parsing to CMatch
Date: Fri, 23 Oct 2026 14:04:13 +0100
Message-ID: <20261023130444.26270-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016231148.7b5a88ef@foz.lan>
References: <20261016231148.7b5a88ef@foz.lan>
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

Mauro suggested handling tracepoint and syscall declarations with pure
CMatch transformations, and keeping any nested-comma tokenizer correction
in a separate patch. This series follows that split.

Patch 1 fixes CMatch argument grouping so delimiters inside nested
expressions do not split the outer macro arguments. Patch 2 replaces the
procedural syscall and tracepoint munging with CMatch transformations,
including support for the TRACE_EVENT_FN() family, and adds parser tests.


Omokefe Emmanuel Onanaroghene (2):
  docs: kdoc: handle nested commas in CMatch arguments
  docs: kdoc: handle TRACE_EVENT_FN() with CMatch

 tools/lib/python/kdoc/c_lex.py        | 22 ++++++-
 tools/lib/python/kdoc/kdoc_parser.py  | 94 ++-------------------------
 tools/lib/python/kdoc/xforms_lists.py | 39 +++++++++++
 tools/unittests/test_cmatch.py        |  7 ++
 tools/unittests/test_kdoc_parser.py   | 56 ++++++++++++++++
 5 files changed, 129 insertions(+), 89 deletions(-)


base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26
-- 
2.43.0

