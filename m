Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435316;
	b=ll/57tuEz2Q6Qo7irX5Hcgc3F6r8Tm6LQA1Ej95+Ae726Gi1+5//lEuMQKTAgKXARUrX
	 +HnPiLlU5Ba11TkmFqdhzso5IKqoI5HizCwtv/O7DXprsjLBg8+8n0JJf/8OtJLV2WgYr
	 AdzHHjxrqaDTAj1n4zi1sjQdvyzv+zViM3+hEaB5/DaVKGy5C5Ywbqv8mOSo4pqlOM9Q+
	 QoI20nNo5d21D8bzN+1sB/xiRnhkJ524T6rw74uCRrlKyrTBQRBGpuHs4+VX4sdtbVRaR
	 /C4ZzzBs9jqCk4ATeFE85xsH6uXGZVFtPbtTIV6toIhxXxASYb1B4LOBFShyEbRQZ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e00YkeKRrjU+Nmoj9deWhfLwl2lr1/3aXWQO3K02B7A=;
	b=BNOyvnILQqVfSbuOg5snA+wWbHwg3yWSaSZLbR/igjWE1eX1VIpwo8wAwU4K9XpbUk6P
	 Yfu7O36h7mFgROmA6DH7egNEYauQj0oBiGSZSkK4M+eZAAi3er+uXCd8Cch8MNvJMi/d+
	 KiBAn7mL8Hy4Xyvh/wIBgLj/jlpDyOwTV0VQuB4vyjo02rg9JDmnm3SImVjnjDG48QOt+
	 9tsCgu3jesDsIfUdO9WtJLAO2dh+9jsYYCNO/s/W07TP56+jyEFRsbtT1knMAbu2Ti1pV
	 ay4MK1O7DjsXfYNXRWg4l8a6P00hYM69SMNd+KN+zYwzmQV5+1EVmQmcRAzO9rWjWVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR3sH7jM;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33CA606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR3sH7jM
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so1794759c88.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435315; x=1796040115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e00YkeKRrjU+Nmoj9deWhfLwl2lr1/3aXWQO3K02B7A=;
        b=wR3sH7jMCf2+rI17+ClnmeGyCW/26Jg8aO4vtwmwZ6TTUhLC7+YQrld933W7iAc7N2
         by61tUpcFFtnqtlahNI9IT5mZtZezg7YKhbAHVpxdpxeCt+xP8e1eOvb/aOvZsBZPOAV
         yNpj1SKAJSHJm6NmAjpM+O6iTDyIaephfA4uaZ+s3LEAS7I2EoloNd4Kq2OvWZ5GHYos
         x4Fob+gWtA/W7obrCVzuVnZyCYUYBewxL3n3j/z/sWjmtD8VgzaDZ1mqNSpgMk9yNh4d
         hQNg8SnAD3K7RYjtJhY4iiPp64J4EMFvL52uz5llTCiaGWFSpA5p1QDt5pFK5JPj3E2f
         C0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435315; x=1796040115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e00YkeKRrjU+Nmoj9deWhfLwl2lr1/3aXWQO3K02B7A=;
        b=rmdQuKsatBQ99T27qh7mJZ2Eq9U2SJSv5YNPv/X9nWPlOy9W1aYi7rIHpIK6dFFiom
         nTBKClunCQ5ouY6z7c/nF4Clv6sputV0uXvGdidBlplJX8ZKLtNoT4GdVGPP0dH5m1gQ
         HjY9+Vtn3e448VGBD8BcuraMmQGAGbmMTO+JBD0vMpbNHbrUhP2yVcw013qIFZCgnwGI
         UkPoJ4A2qvxxGnsvQ/iMjJ7dgCqwHCKFGNefgteWz1jLhIMdjpVuvNpOHPbVSXZwI/CT
         7AQ5kBs8xjkvFtOhyE1h1YTUoxKJgIJ/qrCLgnZP7IuskX2lQ/4wOdvxzOPMwLTQPvG3
         /LJA==
X-Forwarded-Encrypted: i=1; AL+hErFO0tFxMQ1Zmt7cno+ckZtHRoJgCyr39+VJhhMepk16boL3qAroyNua7n0n/TPvazWJHg99+tX1DFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bJw9s3oC5hOyqZlN70uxSvQLf4WkBHJNIeM2Hm0J3wSKQCCjN
	ymH3IRKfUYOXwsoggaEiAlxMn95aMmQ5z8fc5nANdeLZ8phg9JJwG/tUCEY8IEJ8TJ0=
X-Gm-Gg: AZFdTZcaHOCoap6+7BeJde5hGzpC2HCwF+xiNUZBchD2xraQKAvt/oVdRDYUm0SmX0i
	oub5mqOXLSNX7qXiDJerGspQnf1PAnoZ8XkTjlYAExuubYLJNwKSPwcnBtCuqaxBatj2FAdiXa3
	MdIM8+G4/ua3PKvNABQu6cqojmG7XkHuW0cgc4XmtTkGJUY4UIhz0qdylkKvq7/I/x+FrLyxNEm
	ui3vVHX68Z+glKCqV1oGEQThayPPMLm+0WkI0mTmMeZse5HE+lP3GsM4HJpX2H9tvf4RziRu7P3
	3HmwClvAy2yZxA9OMs81UDfEzL9WGCYr9AJh50RESJbrOWYz/fXjIS5x96JGpwNCrt4neI17rfV
	d8DY2EMmlTB9bryKLVEB8cpdIDUhKkIWiZF3yIZPvYtXMPNbvikNR04wBNAInADP6EJ95mkjAun
	DoL452KzKAdUzQwoVgTvJ2JnKACN/F0LDUnBjN2K1z0ksLjX2MYfjU5G+cwhILfr90z+7IXZ1Mh
	p4qWjz+UEy73pWO+B0ed+7Y0UG/VQ2KXy6n7XJ4SeKxBBHFhQS1PczYbDzbHglU0MCRFop/7Szd
	TOa7dci1nHCkrX+kp5jbtBbnv4qK8zZx9bCTLiIk1nFMmO268pFIq+wGzY6EGtohBQkG54hNOMq
	iDB2W8i7tW9h3LQ==
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr17936494eec.7.1795435314904;
        Mon, 23 Nov 2026 04:01:54 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm45141438eec.5.2026.11.23.04.01.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 04:01:54 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 18/27] Docs/admin-guide/mm/damon/usage: update for REPORT_MADE probe filter
Date: Mon, 23 Nov 2026 20:01:38 +0800
Message-ID: <20261123120144.9278-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-19-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org> <20261121210013.130397-19-sj@kernel.org>
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

On Sat, 21 Nov 2026 13:00:02 -0800 SJ Park <sj@kernel.org> wrote:

> Update DAMON usage document for the newly added REPORT_MADE type probe
> filter support.

Makes sense, so LGTM.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
