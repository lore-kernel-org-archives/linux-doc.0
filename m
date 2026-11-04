Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810797;
	b=GFrWzSVV8THNQuBGrOFR8BZ0hdRzIFOi2x70z1H5UKvA07DK2mVU7zhRHs7HZekZz+wk
	 tREunaGqQNo8OzwEmeSrCoSerSIe+2TdQfuICCZzypxKhjhZc1iHMZBbPEX6KNQho6Cek
	 jlniDAgodUpwCf4cN7oq3g0OnKYZ0RKsTDk67CaXsLpWPW0W0PVlh3s/xcn4BzzOda4h6
	 IyIOrapbJj2BeESDRx1tFU0WByY2/Wsj37/jsvT6rssxhVfySDCTepqmXbjX/WEGYn/2z
	 N1Euq3VNr8yvfohSynG7xuKgwU3IWb1XHPVacKpDZiW6iRFLrTWsq4mh0V3pszf2Ozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eAaKlrwhgxVSTJYKvS+Mu/JmjMNNY3TaQOKNMaH3oHI=;
	b=Q/+sEJsqIuwOesVi6aED8LcTXHtdOItPuStzmWMQ0pcWkvgH14pBFcSNa30CIsJAanY3
	 0BQT5L+6XzxNxQwN6Gsjb4bt6gKnV35jhzlk80LBD9OVw7uTv9+pqDS/hO4SIVS6SmHmK
	 IvV6Z4dGk2fp0qSPT6kizdDvYZwEAVB5I6uUjs0DuLqtNFTCxAijO+1S64Db6eYHtXK/o
	 hbC6f1ReH13NIevTsgCdz8iS0YFSbO785NaYTayX7qurBDchJsIvDGveHxlgIl8pz3iCe
	 wyn0ebDh68Umy0rH4WAR6lubeu84DOzMHDipWAQCLjeV0eLm2PhbY0adiYoWh9xEGRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JV7jvcyh;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BFF606A333
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BFF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JV7jvcyh
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b1ce85287aso835601c88.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793810796; x=1794415596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAaKlrwhgxVSTJYKvS+Mu/JmjMNNY3TaQOKNMaH3oHI=;
        b=JV7jvcyhDzFZgOzyiXMsrrE96csI3o5reJpHhY1rZC3R+/mUnsqjvCmXEjOL3OVxrJ
         JkdmZ7gnsvz/rc1SGznFGm489hIxWfufBaTe+g/2UZU6OFp6XAoftty8q01wNHobQd8X
         wch1oNFN1YQPF6MTpQuBWXmoCzX1jPassCZJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810796; x=1794415596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAaKlrwhgxVSTJYKvS+Mu/JmjMNNY3TaQOKNMaH3oHI=;
        b=ECwCwt0uFMcIbOt85cjKEkLFCNt/lyiggc5mEP6SBFY5d5oBrKa8efPH8nJGINTkZj
         Xp2p5Oqme0y198Heef7prxd7LhxaJnFFIoWfje7b15tNfsKSwgl2pA/WL3woVkcpGcfW
         0CXKg0ADf+jhs/YSeKCLc2oQ04DEiil1kibzCLjiWzUYckwHDdSbBbQgNGuZyNn3peiN
         yh6Y+qBuG+5BhACW1l9Z8JSmcBUeW5vk7yY815Qkq1YA18kiSALYH5NrH3+7uTG8X3Kx
         CXdSaoFvQQEy6xuO0HmpHS9vPDEbUjctLsLXLTKXm+YkzpcIHfx5bhEJsm90i7RuXRIr
         Tdyw==
X-Forwarded-Encrypted: i=1; AKwUvBxfjiM01sudKWk9jNRNt2QrQmeVqNaPAJXhOsNTYkCIKcW7gvscWt896DA0PBySjNfbBQIoC0dOZs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CGSAMJxXVSE5W3IZQQmDQYnLVJy/5wx5hVcyNuzuCtu3kWTys
	TQo+yL2IMBtj33v2pDoBfc29Api67l+2c9mLPTG/4gBB3ZrVt8npW6N9Ey/nFl3MMQ==
X-Gm-Gg: AYBFou1E45jV3RxCPXCR9dnH+nznrY6NEZhMmS0uyYwC/ve8UJoGjtZFxHYq/ari3p6
	wa17j5Kvtsulo8CzJ6sTN4TEGlxPq/LZ973TnBYXIH6wA+DM83uNLSOQgZVmMrMneFOQXVbGY4+
	RgebLkRtWpvQi0ifjUx83GGgt3tb908dE2fTzYjdgj5GS4bYrfQtyBkUvHaQHgxa6Jd893d8N/l
	NPRFnoetXaB1YIFHB1KRHsQZsJcFTaVq8p/rESz5z/5WU+3PA+u8n+wO6VpsP1RDos/ynQ/UOWP
	uppZX4Z3k7INm1TRx3nlYYrEBLOCmtUjZj0jrpBjPVHPtzeStEmXJhF7kC+PrWne6grIbTWb5ib
	bcT//udjMlXZdbnMhy62BmNw152wyyhqv4rr7X1acLlyqB9VUoeElh7qabCcJndtj2qK4O06HtN
	ZcsSp/bbFg4snnapweCRpj1rI/VbXQa+/ZSEaw0gOJjcgNn0BdCJwGRuU0hRciOZCXcBSjULIF9
	+Nmh/9m6cT06TMLDHn4CBNtHOrh4KctsszrtwwvI0xwmRQctcnfpiYJvBtUcD+cjWUtf1rQqqnh
	TMNqRu+fk9XSfEtwpw8CfVIodCLRIR5jd1vuLgwpv3fdzCpNOYgr7fMZfMxpdcpP+II=
X-Received: by 2002:a05:701b:42c3:20b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b2366ae854mr11976510c88.32.1793810795926;
        Wed, 04 Nov 2026 08:46:35 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245c2de58sm8522268c88.12.2026.11.04.08.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:46:35 -0800 (PST)
Date: Wed, 4 Nov 2026 08:46:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Stanley Jhu <stanleyjhu@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>,
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PM: runtime: Update runtime_pm.rst for non-fatal
 resume errors
Message-ID: <authaS5a_NrY-NLd@google.com>
References: <20261104151651.3035537-1-stanleyjhu@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151651.3035537-1-stanleyjhu@google.com>

On Wed, Nov 04, 2026 at 11:16:51PM +0800, Stanley Jhu wrote:
> Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
> suspend callback failures"), rpm_callback() no longer sets
> dev->power.runtime_error when ->runtime_resume() returns an error.
> However, Documentation/power/runtime_pm.rst still states in both the
> resume callback rules and the ->runtime_idle() comparison that the PM
> core treats ->runtime_resume() errors as fatal device errors and blocks
> runtime PM helper functions until the status is manually reset.
> 
> Update the resume callback semantics bullet to state that on error the
> PM core resets the runtime PM status to 'suspended', returns the error
> code from synchronous resume helpers, and unlike with the suspend
> callback never treats resume failures as fatal, leaving the Section 4
> runtime PM helpers unblocked so a subsequent resume request can run
> ->runtime_resume() again. Also drop ->runtime_resume() from the
> ->runtime_idle() fatal-error comparison.
> 
> Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
> Fixes: aedc51762a0d ("PM: runtime: Clarify ->runtime_idle() callback return value handling")
> Signed-off-by: Stanley Jhu <stanleyjhu@google.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks for fixing this!
