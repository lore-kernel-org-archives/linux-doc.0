Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D176A218AAB
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581082; cv=none; b=ODcd1J3n6kaC8VVQuE3jAwE3iZWsySKShOrTMmaWgvkYd4iY1SZ+0r2peqKxIx6zHEDcSIUfq5HaIfKHoz/2dhAe73Xc9A5mIa9xtui9leMV/xRS9whPZUbe7cGEa0ah7SSZRdGVGBOAkygKjwY2bU3YhveWmqOeBF63ubqpaUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581082; c=relaxed/simple;
	bh=kU/v7wqnqnL/CUwnJwMJlEh59FgkJ8snU821pG4Y7vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhs/wy5MYC086kPMmfC7aWNsDnGWAWlvLZz1on7xbv7ZSj+z6Na3nuJnApiTKbCeblbFjMc5TRYsrOCQdKyMzPJZ0ohQecm31GRSq6vkML5vdHCN46rXQH7rGWsj++WrRKPxdeVV3xn72X9nTaTCuRtV4ks6L4TL/dpLIR/ngwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=HKTP/rEo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HKTP/rEo"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so11025781a12.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 06:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1740581079; x=1741185879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3lgX5xVuREpMskRYofLOpLEr+lAUcsjQpUjCM0xtcE=;
        b=HKTP/rEol4MUDaKRuNqYBS4LAinMV1RbRDy5AIFnFpP37rJ+cHLPKFoxE4Ke7fga3d
         luty92mDw39JL/6RPiQBQPc3Bvs1SuICsdL5bpjQ9fcnTtpH2eZoNrRE+ltjdz/hWdlj
         UPUDUSwMsajcdFOH8jap2vAQWwZnok1dzcB8N5U7sZcCKLzlarGMd5czaF49V2e9XyKx
         4pGkGTY1YctwNcH7/IOFozPvwB61T57iRHASXEcLxRU87haPmok09+FmGT0oN5MOF50T
         3BRlq7tmgeeQVEDMHBkeSDe6R2UeaSfYrQ1NBP6aJGe35I37yZUnZZjEbCXhm8CLgqEM
         /yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581079; x=1741185879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3lgX5xVuREpMskRYofLOpLEr+lAUcsjQpUjCM0xtcE=;
        b=ifIqUvO4aojohNbImHDIRUxIRANPjQshZNeFrNxsm5NKLsXe4Ia2iEbpadlsl9S1Nq
         mYwZR7YFNt1csryHSt3454GdUIDVEgUMb8grFq5n2I+AOES0lbUSxfQ8Sa3kCrt8ROHv
         Y5BVoXxTTiCeIc791uZKn930ZXeLrjpDCMcYqj5e9sCNAQIsntqscQgbnSi93ZzeQYPB
         NvVdMDvWxhGnh4EYglca5sVANX6ORVe9/ft0GB9HP4ynOfP1T2+prvh3AXic6FG6DcPo
         AH+WY4LX/4uWPHcg3muqCsX76LuVsL/Xzv+8K/wYCLmTYh4Pec2r0g+HKDGp73iDFXCK
         0ltQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxM3liVlnRVQMMER/aQgzLSRQ0D0g6xz2m/4bz1YWXLg+Bo7QXulCD06vryzwgwtAHMROWxUziwg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXxLxspipQo8giqgdYT14z310Ny1Is8En7oR9fcTX1mUnoVnG
	q8YSckv0iI0nrTD8sUT8hyfZ1+j3Sp9ojMgfosTfZY7KBlLpaXEh2F3PAyHaLd8=
X-Gm-Gg: ASbGnctYZxZqhyZ6ypD5rrI4UClD6remi+YAOA12Y7OsgoKcJI4mEqZxxi/nZgCd084
	QpDACIz40KVtCDS4rVPmbBo6vrAVrCH1YBEoCGATT/D6Uze7gzZJ2Isp/QNgcQn0W2viV8Fr1V0
	njFQThHBi1muJIMdUeOsiWa2bgJrUZPnFFK5wZLiB2oKNRxCBzrIbpwg0588WMk54VD4cItsNaK
	PMGgm8ws2PumV8OTpEyaB7bMCby0Zwsw0Jb6TWTiptD527Dhuni46Ro9U2MWlbNb6PjwEVWnYhY
	4v2WCFU+EZ/u9BdEFZ59zQKZZnEdwTeYRGCWH4RKSiCWtPUacMXumA==
X-Google-Smtp-Source: AGHT+IHIRtlrHZVjf/hDRjPSID8OLFIzIelRBHIadTGYyg2MUE07spOk+sYZauxSRswyF+7Ev7Qp5w==
X-Received: by 2002:a17:906:c147:b0:ab6:d575:3c4c with SMTP id a640c23a62f3a-abed0cc511bmr827247366b.17.1740581078919;
        Wed, 26 Feb 2025 06:44:38 -0800 (PST)
Received: from jiri-mlt.client.nvidia.com ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205c7efsm340987766b.149.2025.02.26.06.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:44:38 -0800 (PST)
Date: Wed, 26 Feb 2025 15:44:35 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jiri Pirko <jiri@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 03/10] devlink: Serialize access to rate domains
Message-ID: <wgbtvsogtf4wgxyz7q4i6etcvlvk6oi3xyckie2f7mwb3gyrl4@m7ybivypoojl>
References: <20250213180134.323929-1-tariqt@nvidia.com>
 <20250213180134.323929-4-tariqt@nvidia.com>
 <ieeem2dc5mifpj2t45wnruzxmo4cp35mbvrnsgkebsqpmxj5ib@hn7gphf6io7x>
 <20250218182130.757cc582@kernel.org>
 <qaznnl77zg24zh72axtv7vhbfdbxnzmr73bqr7qir5wu2r6n52@ob25uqzyxytm>
 <20250225174005.189f048d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225174005.189f048d@kernel.org>

Wed, Feb 26, 2025 at 02:40:05AM +0100, kuba@kernel.org wrote:
>On Tue, 25 Feb 2025 14:36:07 +0100 Jiri Pirko wrote:
>> >The problem comes from having a devlink instance per function /
>> >port rather than for the ASIC. Spawn a single instance and the
>> >problem will go away 🤷️  
>> 
>> Yeah, we currently have VF devlink ports created under PF devlink instance.
>> That is aligned with PCI geometry. If we have a single per-ASIC parent
>> devlink, this does not change and we still need to configure cross
>> PF devlink instances.
>
>Why would there still be PF instances? I'm not suggesting that you
>create a hierarchy of instances.

I'm not sure how you imagine getting rid of them. One PCI PF
instantiates one devlink now. There are lots of configuration (e.g. params)
that is per-PF. You need this instance for that, how else would you do
per-PF things on shared ASIC instance?
Creating SFs is per-PF operation for example. I didn't to thorough
analysis, but I'm sure there are couple of per-PF things like these.
Also not breaking the existing users may be an argument to keep per-PF
instances.

>
>> The only benefit I see is that we don't need rate domain, but
>> we can use parent devlink instance lock instead. The locking ordering
>> might be a bit tricky to fix though.
