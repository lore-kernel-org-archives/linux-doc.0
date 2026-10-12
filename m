Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDF24D17B7
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830189; cv=none; b=WRg6OdbfOhsZJZzC+HosoFhzLuzvXW4JwZCdOm+2aHYrb9OMFwfHLkHBTFGk/PtgQCuqWP2bDhpu0UojvIUmwRKQiLywqfuAvf31dJsj6J2/7OJxBJqVVXvPJZO/8KZ0fBPxu4gmaiyV9hsIc/tBzy0rWiv4sjXVgd1jgzRqcA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830189; c=relaxed/simple;
	bh=HRAEX0icmzNcSwNMcvS3r/mqfS55EjfSaWC9s89g4Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/YtvjC0QXEE4nJGmVKDXZUA+d23uXF+5hdUC/MvJqTZAy2a/zxAu+fb2VeS9I8+DcStLSIHH7JzxBiHkCx/a4CidbPiEGDhlXbM+PLRNlnrzCHKDZPDnt8XMmyDPB74k0/Y0+jRl58o5H0nTubcMHqoNfqYJrh/9OQYeKTcQ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=nlKv/x+C; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="nlKv/x+C"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381b831d535so2485623a91.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 11:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791830186; x=1792434986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNkP45hU717bcOi5CRDm9mafe1wW6i7kblo6Qb0SPug=;
        b=nlKv/x+Cu5V+AuJ4npJrdNsyvCq7ENXW2keINz3KB8i6y7m0iGAgOKXEqQ8wPe6aFI
         NsL2GtYsQvxyaXBbRxSiGmfgH/IPhWRLZestFZuFhKF1JXEmhy0A6Az+48tbb+OaoRRS
         EB1KDVBYh1qLzyh9I1qHCOD+NmrsZCAF5BMak05z31GJFYXeDd07QP/UysYjvOK0dMMX
         qcWdqJ+cQE1Br/KISdZ0dBwqVdG3nhUKh878RF7F2RA6t0KAUlaTiqQPU380KLyexYPP
         8wxThHewelPeopQJmlqgEP80nykQcGDsAJLmu13WkCrYs7ZcHKQieIPYWbqiApLNIJGt
         u/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830186; x=1792434986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NNkP45hU717bcOi5CRDm9mafe1wW6i7kblo6Qb0SPug=;
        b=tBkDA9cXLSYhRwO8t9gIqSJuIR8jK16GCt0D/u6p8Aco4wf+6t9sJlwiTaRRVcvhAH
         XkqkLwDgqT9kP/2sfE/skCCNepo85zH/BwoqZsp8gqv7prtauYLnA2Q/qXNaI0DZAlEj
         G7WCU6EXRWVomQlhmcOSfxVZKgndHLLlZu48gpmQiiaRnHnIooV+ArFiHoFkKe6r6knP
         vtM8dpJrxUXdyjL0bsCZfIYah3bQ0FRzP1guwVscjbMVNXzHX+5L1d2IWrM8br4uWqG/
         IAKOg1U6Al0SYwBPuNaHYrdIrBpwv6GST2l2cOGw1EdKAbhqBJc5tUU/oZlIzFVlujci
         DHkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzslSWgjZQGOYUpgZcBIQr3O5hoHSbGIX5EIrjE+IO1BpmD1JWFbkila1v98w5O3MTR0Y+Wu1vTVnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsJczk50PFk69XFVMFDi+5VD2EfDml6pwijfHMg9WteN1KFj2u
	MK0E4cQqPnHXtDfFJ/hGGlgG0a4WyKLnJgQSPtvCZRts79j+TJWD+LvroTEUtgVs2/3HrSMzs8j
	RDHHU
X-Gm-Gg: AYBFou1FjiOrq0mBcOkwow97X6S3iQr3mkTT8+wnOw6SQL5NmUAUNRljuW/PpGhCxnU
	451gxJzsUPmgWn5W5zB/WSn5LV7kYixXjLwpcUvvH/q5XJ55Lkq/5wbOFcgV5pzpqi294yYeuPB
	KFPsG5lTbVOdCi/dKVb+n5WVOEklOYlqXCxKYV6EYve4SP9W6XrqQnmmOiBQOsx54DJHG0Xdc1q
	4+CpGJvhk91Q9rH7G5/81EPLulZ4mIf6j/HFiHIQHrGP0F9RHXxndeswBXKHZPN4KdeBlAH9jc4
	0cg1Dcs+LuBmhLfJbBH4sit2PQtPepSN/G4rhdMbD5Vh5HwqLorYR4xWXI2yh4MDwHDj1pMbR0B
	TrYNIKHQb3kgh/p0ZsLUkwC/KB4nrQpmjM48hXIqAaT+4NfUifN0r80mXNeP5K+LySrLe940vQv
	e3ekZ1QNte8FQ+IqvUU89zHlLiZ9Lq55v7iR7aGFaUFXeRarBcb663v06CSo8pU+mTGPyBtrc5x
	gdkZqZbNZIm
X-Received: by 2002:a17:90b:4b92:b0:3ab:36c4:b506 with SMTP id 98e67ed59e1d1-3ab3a3a1b41mr9754602a91.1.1791830186199;
        Mon, 12 Oct 2026 11:36:26 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:44::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab396620e2sm10547325a91.3.2026.10.12.11.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:36:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 11:36:24 -0700
From: Joe Damato <joe@dama.to>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net] devlink: Fix accidental merge error in nested
 devlink docs
Message-ID: <as0oqO44KD97Sa/I@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Carolina Jubran <cjubran@nvidia.com>,
	Cosmin Ratiu <cratiu@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>
References: <20261011090739.746757-1-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011090739.746757-1-tariqt@nvidia.com>

On Sun, Oct 11, 2026 at 12:07:39PM +0300, Tariq Toukan wrote:
> From: Cosmin Ratiu <cratiu@nvidia.com>
> 
> The referenced "Fixes" commit accidentally reverted a correction
> introduced in commit [1].
> Revert that mistake.
> 
> [1] commit e504cf18ef47 ("docs: net: fix minor issues with devlink
> docs")
> Fixes: 3bf4c5970ca8 ("devlink: Update nested instance locking comment")
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  Documentation/networking/devlink/index.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
