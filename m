Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AD648B38A
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561939; cv=none; b=aAJZcla9sqGgVK3v1IGVeXcc+pDpb3Epb32Ivp0Wml0A0R7NCy3q2EjxAFS3sF2pMQGTz2kwDDp4x7j1Y8vaSn+LM0S4AgmNdUM903DDjn6jRW5unQ/EUX7SJJ4HPhJoqe2/+ktTb/ye+DUNTeT3BCybEfnNJi0F4GZbLqs5HIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561939; c=relaxed/simple;
	bh=KyCpFVWIR0wTHD8X7nxriNwgwLgotJAeVNysqCrNQXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K81c6lthVR+SMY/udyFK/z8q10RRX5nO04mMvLgGtbRH/Ijtxdfa21sKYwFSrYlvhVe7uqri+NviagRVPpayVdrwz1aY4mfc0e7Hp3kDhiCt+nVqechmhp+KUYnaEaVViCXsGKmbFx/hWnabuDK0a7G+GNFxEyIvIlsu89TcM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cksnLVa2; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cksnLVa2"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39da614ab21so97286a91.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789561937; x=1790166737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJDV4Cw67hspsaR/vUzqgbUI33DQmeDxdNAof5edoKY=;
        b=cksnLVa25DRgb3hGhVxxKYe3vOjCia9Si5W/O6g7eMcPH3IqL3kBYO+VMbSbHWtroW
         EaOx/HBfkr32GZ30ZTkp7PgWk5Q0PfR/fgU1CvHi//MGYTnFK4wzfibn75J4DPT5Ynr/
         tsfflDdoF4cPjfcIKMO3XfuX0BvhDOS8JS44imls7J+ySXDBb/RMsRj19wfHN+Lozs+z
         VjXXiWR7r540riVj0Mhu9/rxL163G8EDiPU76PIkOOx93fRCP6/orWoFgEjyFpIwE7Iw
         w5b6TTpq3XqPkiQj64qWwmtsAT/7r645ciU27rAW0eGn/mMoh5hMtzZIqriSYGWbW3A1
         KiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561937; x=1790166737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJDV4Cw67hspsaR/vUzqgbUI33DQmeDxdNAof5edoKY=;
        b=Kv/XVHqO6DSyjm/3PNpDkwIovoLgnJ69/OJZ5y3CPJWeXRahyiprHBFzJDT0LGBVxp
         Oz06KnHbQGy+VvnNrYOAYO46YpHk5MfGWcUnTLo96h22xLwcZGj4Ja1cEjQuOBc3MTsV
         CIOTkfpVKlaFS/2lg4KZY/Zb6+HcjHmDjJ/3YJ3FpUR8YCMoHYUvrSJ1z4P7khkoJGzY
         Cre0iL+YVcd7s/ct904UXl1cM2yVNKLz1mftdtWUAG2IglywSpBFNBe/LIrQEDGX1apM
         op1X8VJgNOZCqB0B4DUsLF13h4RyGMUIrnCOTBz9YmO8fGFEwzRLRFiTr0tXMtS4m0bv
         DTCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkZ7sCsYNrz7+bx5xF8LelpgoeqMVct7QXzoJbCyDQvEO9rdQHlT+Bmy36rBSC2ci0qsBunpCENhw=@vger.kernel.org
X-Gm-Message-State: AFuF++ls7dp8DiQOK8J0cX74jR738RuY35SWfPjGYJG/uPe8i0ptjatM
	nD8uruC7K2gAmzbnAn3+XnTjWqrk+FaG4qsMpRoiAQgH46SS3NYRjozG
X-Gm-Gg: AYBFou017zo6njDwNprT8wdn0vhBSKlvSETh/yBeND5kvoC4lV590IJho7k4QIuSsYU
	9P/1A5Hjnc93RwzhcI1aRlXhpVBeM9KK7leMwfBBehvidHzLHN254r3X8yH5C6YmzKXrpNivt/9
	B5wn7DDQ/8cyXxGalr5CaFK0lF4Efz8WERWrgRMVRpynCZVWxI2WpxlPVvaXVzcp/gcZx7drGRB
	z6VZWBkfiP1EGjyaYq6E2Jck88kv/C5p98JQZU7V/Mj09k16A+UO+RbzS2RiELGPX9ywa34Zf+t
	JQHvtrCR9ISew4Ad29CibJRpn/JUdyRHNp0HOABud+FfZRdvNe0l4LzCC7RDEPawHjqU6FJSYQy
	s1Ug2PWzV+7Hpsc9DNjgH8xIQibbNXUVL8m3L8sxolgGtN+iSouW5xcjLFEKLTFlsDiEguA7LWi
	Jd96kY/WzGhPeml0F+oU4mQ+bBX0hvbko+t+lA3ThVOYQk+YX3OX/qy/fM2A/vvGTH0pbsmQ==
X-Received: by 2002:a17:90a:d444:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-39e1e4e2964mr3825626a91.3.1789561937354;
        Wed, 16 Sep 2026 05:32:17 -0700 (PDT)
Received: from elitemini ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b3dcf6dsm4778247a91.1.2026.09.16.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:32:16 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:32:13 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Chen Miao <chenmiao.ku@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: report Sphinx/Docutils pairs that break PDF
 builds
Message-ID: <aqqLZTz6FAieAjbA@elitemini>
References: <20260915-docs-sphinx-pre-install-docutils-v3-1-95ee86793673@gmail.com>
 <87a4pi708v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4pi708v.fsf@trenco.lwn.net>

Hi,

> I'm sorry, but no.  This is a great deal of complexity to catch a
> single, hard-coded mismatch that will soon disappear into history.

Understood.  I'll drop it.

> Finally, this has the look of LLM-generated stuff; if so, you need to be
> adding Assisted-by tags to your patches.

Thank you for the pointer. I'll add it from here on.

Thank you for the reviews.

Thanks,
Masaharu
