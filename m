Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5893B47FD
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280831; cv=none; b=lS2pVTZ83aMYIonr6ujz0tMca6N8bB+Yk0XlmyQ34qjXtMKz2QiPdTJK5c4JL6fqRbCquHCOBJh6shPbX7j2xZui1ekp+h9DzAVrmszrjEB/g1QXJpkw1n/a8xV8TR6YCUxcltHmtQY9H2y1n3qJ1la4oSI0kg7jYDkU09LBc1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280831; c=relaxed/simple;
	bh=G8j5VdLcKlfqBzhD5E96qCqDUHkNy5m8xRujbXzWVLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBpv1TEzyZXG9YK2xQ8QncUrI7UR+AkabW/AKSrikDMLVCnzF4det5bRoaQNLecNKGoupWh7mNzBa0IsxPl6MJDamWJkItEu3y568+5jpMZUpFaIZDrWRGTNCM67JNE2m4BWs63k7RtnSPmzfbbYMXAkO++ACNSP0bCfGnae/yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TRXa/kDl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TRXa/kDl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so25894265e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774280827; x=1774885627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p1P8EN8xuW2XM/nvn4JwAjz9BQQ7OXUbARn0dbOo/2E=;
        b=TRXa/kDl0Ozhj8EUMcBmj5LnaAxrmbsXTNG5KYmrhe2+k3T8/q3l532xMPFB9lzMjG
         +s5stxV+EPn+4AVcaT16txUAVvZofDCfWiYNYbWSpHFW+OBJxdllkFlNF97neVfP6IU0
         HyfwSUF+Xwc7VDJ7MZJxOLpf8gh9SQmgbxoLAnO/FlcHWBuwHZ2/m3cxlqX1Pdkbw6Ry
         VwA89R46zWc65Po0911Y96KwtoKglHUSKTO5M1NxLGB+Yjk+6QNMoVTMOqLdS3X0BGqP
         ec/N1xgHKMxjDvJdW4mpLmHDBH0PyivzGjQUM8iC8MI5tzNw7XuwaUuWnH7hygZGvqTd
         HPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280827; x=1774885627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1P8EN8xuW2XM/nvn4JwAjz9BQQ7OXUbARn0dbOo/2E=;
        b=WTczO/V6c+gTYCjPTATQasZJlQajT0SXqX/Nty9dGhQSHEEXYkUAGs+xm0nJYvJ5hf
         fCmRahGinoKsThtVlPKmBbARksHhHt3odmqND7E4rbbCyI2MhcodPqHYvbH8Jq392+bN
         eDrPqStDPnN0fYGW5wy4Rx6PBtDOn7G0dKA8NQbc2AVtgHoYssg8pIBcZANZd33QJ9iX
         lcQ6a1eH5UDrb2alOsPSEV0E8C7B9CexaKehqoQFQSnvoOsxd5L8VnjusW9NQ1RPfvpb
         /Pt9YYbzK97UUuFi3ZcS2FuSQ76ZRVDS81CzzUNLtOqsjS9pUJLzfcPCC/KpdHcPAhsP
         hiJg==
X-Forwarded-Encrypted: i=1; AJvYcCVS3QKBuRLfRny35sYuFZ04rh06Be6x7/c0hSy+j3DjQ7qkT5GQksZKzczeO0uxuoJuO9rZGuk3/p4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyikgtu2N5gqOWzKKGaSsM7jBJmC6+XowYDpIutSeStmyx94DNo
	yQLq18afP+CLygRhwvO1muKIIWXLkg/3/TGqDNcFuFMuAYLPKbrumRALODmk/5jlCUM=
X-Gm-Gg: ATEYQzwziQvPxtduRW++gEmfVbR13oxNtqHtlGunOZa6MeuAQyqwuROCXXNezspNp9P
	e8fLTPTXExWd90IFLGUUpCXpuKv8G2vC/W7tlm2+gZbLAbMcVDpHYDIzAHkSbsFsTNdQuXXOYhp
	MHsdryeq/rXxrxM7eJ6XSzWab01FR0H/ZaZ30+PjfMScY/1sKIs58FajkOejcI//S7yqvrmZXDs
	IJavlfHPhPw4Q/HpGFKPm1H39fTxtvQeuF8lDzRwP90p+CWuJnRoWQBM3wNeVuwtfb0ZER3icpx
	QY/Rz+x5DvHvEy1qfvlJArkE1gyHzp1QmK3hft3WFjq+go2Iq8TacSCWOljgskTtSBkyRt0RbBr
	+WcYWnWusRCpA3cEvIlaBECrjG9p8owp5ikGQKI5ZY2DGSRMYV4fssubimS6QRBca5fjSQoBDNg
	AYYI2bV6sRH8UNav7Jqp2flT9eEg==
X-Received: by 2002:a05:600c:c09c:b0:486:fcdf:c065 with SMTP id 5b1f17b1804b1-486ff01caa3mr140759835e9.27.1774280826645;
        Mon, 23 Mar 2026 08:47:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm425261635e9.0.2026.03.23.08.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:47:06 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:47:04 +0100
From: Petr Mladek <pmladek@suse.com>
To: mrungta@google.com
Cc: Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Florian Delizy <fdelizy@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] watchdog: Return early in
 watchdog_hardlockup_check()
Message-ID: <acFgeGymRQALM1dk@pathway.suse.cz>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
 <20260312-hardlockup-watchdog-fixes-v2-1-45bd8a0cc7ed@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-1-45bd8a0cc7ed@google.com>

On Thu 2026-03-12 16:22:02, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> Invert the `is_hardlockup(cpu)` check in `watchdog_hardlockup_check()`
> to return early when a hardlockup is not detected. This flattens the
> main logic block, reducing the indentation level and making the code
> easier to read and maintain.
> 
> This refactoring serves as a preparation patch for future hardlockup
> changes.
> 
> Signed-off-by: Mayank Rungta <mrungta@google.com>

LGTM:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
