Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02D2260C
	for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732595562; cv=none; b=eGWfXBda4uK1zMS3/x4vp30ppuxBURlJncOJYYh5hwIuMc3IOQKPHsnncfD/0S0c4mbEniWJzNDwQz3rpen4ULF4PXWvAMjUMb4uch5jU2CteGWfYcu/7/BYHCN3mLm1VughnQ8M/GIVq4xatHO9ReI8ccZISIe6U2tseMyapBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732595562; c=relaxed/simple;
	bh=wugeIFVZuQ9tQQCNyCWGQ5BTAZDhDWii7izA/Hi1bVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj/nnXeVabMZFPW3QAQ15WD2e6q5Q+DnBigxh7N9joNPNL/8Vle7odH7/pfahT8ziULWMEfeoxsI/Px5MEcsn1/41mark2Joga8mv5b2rW0DbLPRNLPOrlfeoYEtHdEL+Ao8NIYoJzMWfF3oarUYya1bdgpkf2H+g0b3cvEzwz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bN81gMN6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bN81gMN6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720c286bcd6so4662257b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2024 20:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732595560; x=1733200360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dj9qgfhpew+joz5eAIS43G7ysXnxDcyXL0gGD9SLu88=;
        b=bN81gMN6SOebynFEKNUKEGrwcLFNKzwN/AuCuGKzsbVIFybIBc7XTcQaEpEooCKvvX
         YEbnZZjLFl5P0YnVm8m03jfGiilaHaQyqFl2H8fws7L5TkgzWaY4NkpsnOJ4IlhrJevo
         C55CKWITD8lMpTpZ0n60R3Ovbox0RGrZ98IME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732595560; x=1733200360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj9qgfhpew+joz5eAIS43G7ysXnxDcyXL0gGD9SLu88=;
        b=sAaYcv8zL0gq3WJzCyGU4mSADhcUgDh7hV/CAC3PyH59aT4xV/Kz9CCpuz11KPVMv8
         plgl15zqVHL8HlX+H7bxWVG67nHB87+6Wy0M+BZP893CIzO29OVVhgWZDRyV2HOpYPOv
         ncKKOHnp6rjJ22198RRkBLgz7QBodbjmMNNzp9l6qDZ9o+0ppaO9A+1RxtQeDGHei4v2
         K7Sm7+e934ZoPZ5FPe7r+ltjuW7WmrbIo2hj06ZGk5kRwz5wcOnia+TPkzPYjRycb9gR
         UKieY/mURdZYlx7QZq7D1sbSbdWp6Yp4LSE+fHyYiVb7+iAhTuynN+2sYYSVIqyaXggf
         m6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6wxplYvqLe6ehX70WOYBWAN+NevMeD12M6F8XQI4Oj7rwWhEREtKr4ZWYh/drWb5kYgxatnGIwtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFumgOPv+rp742ik+jlvIonKSvzQPK16V+hBYdIkKB4lMI16Ey
	qcLl20JUANhdPOgq7YVCzv2j2bGKc8KIAnitnc9l9zk2RoK7Y0wpP2ZmDwz9SA==
X-Gm-Gg: ASbGncu6gHEfQcjto1a1w5mnfqHGn/Jko2YZ+hiXydhR1NTd8ybM83YsPabfd6/t1DV
	ERZzEVJso0zfqc6V7tnqWgAuuCcrQlNzZ7nlHI9NIsxTvn/RtMt5Eg1z0lQ1IkmJgF2kNxR8yEu
	0nm8g+PJ4xLTwVrWRvEfQ70qlE3cKzc1Rf4JE4Qv/yLc02GglhY9my+pE+nngtVeWi4fFmt1Qa4
	c0uUaf7MkoiCOmhQuH+EWRMih2Z81E1DpgsrDHcOF0vjFBcmdw+
X-Google-Smtp-Source: AGHT+IE6782zuODFee99BheWhco6CMCToJMqye6QDHvuZHHJs8+0En7RLAL1hfPEuaUYRDTNmCBDDA==
X-Received: by 2002:a17:90b:1d81:b0:2e2:e31a:220e with SMTP id 98e67ed59e1d1-2eb0e1256f9mr20707685a91.8.1732595559907;
        Mon, 25 Nov 2024 20:32:39 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:7631:203f:1b91:cbb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0d0451afsm7641478a91.32.2024.11.25.20.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 20:32:39 -0800 (PST)
Date: Tue, 26 Nov 2024 13:32:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Saru2003 <sarvesh20123@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net, terrelln@fb.com,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: zram: fix dictionary spelling
Message-ID: <20241126043234.GB440697@google.com>
References: <20241125024927.GA440697@google.com>
 <20241125165122.17521-1-sarvesh20123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125165122.17521-1-sarvesh20123@gmail.com>

On (24/11/25 22:21), Saru2003 wrote:
> 
> Fixes a typo in the ZRAM documentation where 'dictioary' was
> misspelled. Corrected it to 'dictionary' in the example usage
> of 'algorithm_params'.
> 
> Signed-off-by: Sarveshwaar SS <sarvesh20123@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
