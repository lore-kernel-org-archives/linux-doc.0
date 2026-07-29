Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2A3AFD1C
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342261; cv=none; b=M8ou7NYQ+GAt4c5UL5IjbxZSkPVYrWOJC8CJcskQQd0VZgG9QSZJeDcc663rvCwMiB9nsA9FgUP2DNUuS2OMo3latUg/WKgd5SLcQWP3+euJ1d7I0LLLLDXslFLnNG88BXfsQEcfCQ9vWpp7F9IgZ6K6SW/qDVybtBLooMUZ2Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342261; c=relaxed/simple;
	bh=5YRWzESNup/uJaXwpxZXtL2cnI88MqsveWuEJC0Yp0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR1a6q2wWEf0qh0S8ATzmG9yep2NKTHTF7uwrgRgHrq1q76VUIk519c2GiWO/ipy0UjBs8ou02ZvSlmidoelHD4IanEwqZfMZVOptUIeh908EWhETD4ku4tzGHxMYDJBPhCeFLx+nhdaKQuQexHKJa6yktUcRNUYNDAo5Mm7QlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=uo1Am/Eo; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="uo1Am/Eo"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso671359a12.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1785342259; x=1785947059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhhJU7MnTb9qUtSrGFKUek+jSKmzQXJZbHXf+DBOgvs=;
        b=uo1Am/Eo52B9YEe+jwBKnL1orOZiXzekZdEwMuErRGBKVDJgQ5voDtCRakP4kfXqfw
         br7YCyQhFMIZc9I9bc/lIV/tBedFAo5Lyt+66Q52BEgFhKbw7KAARQqERG5JFhanUYHV
         ZK0MH0lxQSY9SiiGO459vlB5pwVB6NQpOHEqGKNjKsxLFb8ndWozm1aaJgHWOMj2YBoO
         8VHsHzywZZyXEvpjwlTqITrFni/5zM9eEPpjeK26HM5LjAcM9bDShQjU+P5Gcz4MNh5V
         Acx5UaVlJzJsfJUGYPXiyoIgcV6tFnNWlgRsSZ6YLK2DeuVKG6nurm56MrojGdyRjZYT
         SIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342259; x=1785947059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AhhJU7MnTb9qUtSrGFKUek+jSKmzQXJZbHXf+DBOgvs=;
        b=euVBjOaZ/zDxlFFjm7n9eF43MqJtu5uMtYoIpQPvwnh8qUEoIAch0TXLKpu8kYKoXl
         VEi13CocgokCRl0fhJASxgTKhgVxYBNyFtEex9EuGfqhPty0JMCVuh8SZK/GAI1uz2Rx
         Tf7Zxr31IoATq4DajFBXFZL5ViEfZCi7jsdYvixTYi3jlBksxm37hjtPMXHF7G3C5XQH
         fexKdA5wLmQWEqhDi7p3GeyFk9e/yybM9RFKoVbgJjm+nABuXg7PLbiRn3arpLDYAeAx
         DPGGyo4kt52kH2FoOunZlH6Pm8z3y//m+mp/zS9W2QWxEOAa7ofAusylYlMfI5usqACP
         F1+g==
X-Forwarded-Encrypted: i=1; AHgh+RoPjOpcSwLAI/iH3XGaovPeECVX4NanYCOcVxfpcnEEOOyPGWGb/hifS32SiaB5dIlCVI316c/UXKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWPOF4zRsrq2QRUHpAQWAlYZBJkpAjPYelCiuwZAWVHB81Kfvz
	PYweqo+BGf/NRwGMe1jg7rJUZtelpDhz+qN3vw8KKicUdmZCoU1rdBOuj35vACkb1fs=
X-Gm-Gg: AR+sD10ucGJj3JZVrx1cwaQRByF2b3ycrK+3m6WOLyDX2mxC8Zj8OX9hGdKI7d/FQ+L
	n+HoQXLQr2VMVnBkO8THiIUrR/EW0VlDy7B/2v5WtY1dK/QsB5lNefEdIi0FZ5l67HrsZL0sefb
	caHJDHYsjGAyQlwJOwMCfLKY74oVzsaJFncBkrqVQOH1keM5Q6gSItFg0DuCyKe2hYT119SJA21
	LXU2cAAe4C44xWCANadL6YmLmqDpud/GMixwx0qPQAm1M6I+Ftq68Gxy8DTkp/pZs6gdy395zTe
	6wTxjdgsAfaVb3sFz+F/BDtoN5JRioV5VUMyVGLp0Si6Q3E8+JQrmvImAMH/53KTdLnOk5GOFj9
	zWo9YAa0UrzDfYZsSEnqXIcAbnDfjf8FoqK9xz9xZtSY5LczLuUC7C6T513l/zzt9JJgvRygeo3
	0APETG5Y6C5DMXleUhZSB0R1qspi0frxChI6qVD7RzOLDFtAW+ukDN
X-Received: by 2002:a05:6a20:7f81:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3c8aafd66bbmr9065958637.18.1785342258755;
        Wed, 29 Jul 2026 09:24:18 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba92937csm1097115a12.31.2026.07.29.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:24:17 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:24:16 -0700
From: Joe Damato <joe@dama.to>
To: Ayananta Paul <ayanantapaul@gmail.com>
Cc: kuba@kernel.org, donald.hunter@gmail.com, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: netlink: fix spelling in tcp_metrics.yaml
Message-ID: <amopMJMlD4uFuM1L@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Ayananta Paul <ayanantapaul@gmail.com>, kuba@kernel.org,
	donald.hunter@gmail.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260729034147.6970-1-ayanantapaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729034147.6970-1-ayanantapaul@gmail.com>

On Wed, Jul 29, 2026 at 09:11:47AM +0530, Ayananta Paul wrote:
> Correct the spelling of "reordering" which was incorrectly
> written as "reodering" on lines 113 and 115.
> 
> Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`
> 
> Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>
> ---
>  Documentation/netlink/specs/tcp_metrics.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
