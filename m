Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6103A544F
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357536; cv=none; b=txFkS4Q+6KNufP9crNrlNTxG4D9IfQsbUMnM+rVH2AxRPcBSCz2ZdoBOh+H/UnQiwPIi+UoiJE33wLrMwt0nncpcuf2tzCW2h0DD41v3UtyVC2nrE5NWa1ZTM2WoTuC/2vZplnLdrD6ei0B/fj7puQ0KwLMr7gInz0O+htBoiD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357536; c=relaxed/simple;
	bh=c5ob8x+63Jafk7vg3P7eaQn2ve59Nggw5TcAv/2m3zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQdokeMRKq5zxfLVKF7VtI13EKGCWO6mUPGZewW7wSMDEwr4eu18sk5We9JpR2khUXtIbmcnCpQa5zNCx9nLlNnWjE5EyugcMNOlanNKU50BxXoa9KEZoa8X+i953bqwpnKphcVaerR1eTAcDUVG62Zq0HmAzpv3Dzq4Yb7pW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=EFzEjqL1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="EFzEjqL1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-487035181a7so21612235e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774357534; x=1774962334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c5ob8x+63Jafk7vg3P7eaQn2ve59Nggw5TcAv/2m3zw=;
        b=EFzEjqL1CrH9+xTEQCCpzA5wU2vTa0ZY3RcosBio97hIDcHZBskxxAceCFYxV67SFM
         PsTcBXmJJvz4+0zHWTzSrknsIRvi1p7y9gYNNDPeAy6cBzEUo4GHYGzSilSFRbUdOhBY
         shUTABQWxsLpoSzpCZFYP6G9GqGEMj90LW9rmoQwemQ6I9/otaeFCWu9SP/rKdtOcV2N
         RvyJsoJ+5I/0lFD5fi+ZjIej+CX+layGDTrr9dJUmgQdQVZwYcZafg8XEa/nZSkm45a2
         MXtwhLewzXFRS37telw/QsZrlr9R1w/prdiV7ebHrNdCbRvSWCdfyMihQCLi4MxiZtni
         bT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357534; x=1774962334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5ob8x+63Jafk7vg3P7eaQn2ve59Nggw5TcAv/2m3zw=;
        b=KS0jq0bM29tz8gnnGxnMdjJOwfjJhMtV6lN2ZhQ5Pf4jpocjefDA1PyaCJ0BBNCOzO
         Uh9RlQUrlCsJFRNLLqUIjUAmfLKWk+UQN+bnKb+QxTuL/t8Aje1pVQ1pod9HPHlhhxlJ
         q/AwFk92khmrdCLJ6Tl1zJVfDs5Po+lRifHfQtZI61tpmMRoxfcaM/4hEUv4QzzRrq2S
         7XlKrOh3V957Ka4lZcsXdNwvBbu/0rHgJO06s0WbEwQrqKVWPhKVBnUR0mJ+6uJInK2O
         /73BfsIUamRzy7SEltRuCcVjv2DWVyrbCLHvdmKBzcC2SQmw8NU1ZIXgfHzzJssxVV3S
         jrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDEdQJ2FHifEOWkWQY1XTGA8Qz20UOF/qgw6TplWvLCngPglD4XrxGzsFKYrOxBm2nAt2CyFibJMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9lgb2ozluwvP0B5R0Wu9yT9DT/AEZ1pJrmADxt/2g73Lw8iWD
	d8kUJgsJi4dFFRhwfZR7kQIrM0vf4OZ2fSZ7knfMtiCPegqnUPS+HOtv8ibuWKaa/74=
X-Gm-Gg: ATEYQzzafYWCi1/q3P3V9f8wIkjHCZ3XSF3v2XtxUsadKE0v3XwlGEGsdz31R8U5uD7
	CXB5WlQgpNnY8oGypMNwVYPUHoN2h5FWK89wGG9pf6KKeeufoAdSotcoqJlHaDIpMj6Yakm8mmo
	nNzFBjvpnsLOYCQ+eBsoXHEjRiZ5n+NR8IlF1G/yhA7GC/3CCkOxIq9mufPHX6rPZZcyrIgf2r/
	5+/qijZCurmxQPEmKOfA2BpXSa+TLvs67strE2291pfKy0a3tbz5d3VM0hTRnZVSJUayl1ECiI7
	oDiUFNQ8frcbqxVovvQG3MlfFWCY4uhnJJ7npLEEeze6duoq1YCei6X1avJ2odZWjN/lO3RqGlv
	5oKCaKKLOLOhh0r0VThecusJY9PTGDLUcxeUkHfyakIqhg/CwKh+TpdtFsXYvJfARvyRkiHLFuh
	mL3L+w6ZbMbRrLx5r3fI8iFsVOWhafKKZc3/I=
X-Received: by 2002:a05:600c:4f10:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48702e86a88mr205126035e9.15.1774357533835;
        Tue, 24 Mar 2026 06:05:33 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48710fa0e35sm46182275e9.3.2026.03.24.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:05:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:05:30 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Chuck Lever <chuck.lever@oracle.com>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Shay Drory <shayd@nvidia.com>, Kees Cook <kees@kernel.org>, 
	Daniel Jurgens <danielj@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Willem de Bruijn <willemb@google.com>, 
	David Wei <dw@davidwei.uk>, Petr Machata <petrm@nvidia.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V8 03/14] devlink: Migrate from info->user_ptr
 to info->ctx
Message-ID: <yfpepx63i2om7y62kspzizq7a3xxknfnzrg7j27ppt2oxpeou2@kfbomamxpdo4>
References: <20260324122848.36731-1-tariqt@nvidia.com>
 <20260324122848.36731-4-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324122848.36731-4-tariqt@nvidia.com>

Tue, Mar 24, 2026 at 01:28:37PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>Replace deprecated info->user_ptr[0]/[1] with a typed
>devlink_nl_ctx struct stored in info->ctx. The struct aliases
>the same union memory, so the migration is safe.
>
>There are no functionality changes here.
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
