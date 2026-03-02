Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1A83E8C6F
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457347; cv=none; b=UyGE/UunyvAApvvtCc22U17v3vGPib6tBoV8IAGzvRRBiuBWtKkLPHIDEAAe4soauBalNZgUTJYVPhDgC7U0AC/R1jphyIPic1Egjz0Q8IJELBFf+zEZrnTpjTF6NOjj7GDJ9s14+bD9y8N7yvZ4lIgKZcl99cM0y6cyu/Ys2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457347; c=relaxed/simple;
	bh=JV5gSZRhPiMnRwmWCCQiBvuE3NFV3+3iTTS8WPm+N7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpd5GY+6Nc/o9uLOvwlchgXRmym4R9yPZAyO1BbtgzOoxPoER3mY7D8r04ScLu76OWdCt5EbFAc+IGQEAMaiuxZBsrTSPyREVGmq9AVQTwLpmeK04LTgUAe+YQBtZscH585K4Ymn/cJp7FYxFdeJR66gs6JMoUlgpeu2JbZLhAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=kP2OkOx1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="kP2OkOx1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806bf39419so39905835e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772457339; x=1773062139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHkP/futS2zgWyQTyC5FXIesale6XSmEvAtzel8W+sM=;
        b=kP2OkOx1OGk8QzCJ6cnKlczbiViedPD27Ke1MImKIvKEN29UhPXB6cIS7krZpIPTg7
         UtmjFCmAQS32toy1Kky0VUYQ6nknRRVluwBbwXHw6cWEZNCVAgS5EELzDaqzeBLSo6Hl
         6MBO8HVZMvyD6PlHRN33vJ1DlYOmwGHcGRfuGiwe7PpC+cjWOvs5SOS4yXY3lDq7hvss
         zkaT8t/3Cam4w5r+FQXLTIz1sN4S7eEd1VX5QajWDFRjikohyMIelygNs2O2oH4ZYw0Z
         AUAaYJJMMI4yT+7+5mF04/q4qHGd5KDFQKS/68y4IqW0DIWdfkKgJUsDRnvSUoosIJpM
         kiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457339; x=1773062139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHkP/futS2zgWyQTyC5FXIesale6XSmEvAtzel8W+sM=;
        b=p2JlGnrLvEc71hfvnipd0tc4q/Niuyyfbb0Rlbso8MN6O4MTYwUfCDGDHC7HpKWnxh
         lgZ+MD3uCLVwq3U3aHsHb2+bb3a5ay0VoYKuDuV9cbNNJYqU9S+DHX43x7QlE/ElVM1M
         487kSdPs8JR8ZSszYXJCZdQm3n8zCBbGZHtRys4rUnxOSWWEaX/tFtWKYegmFVvF1rpw
         eqVt/KY0RNO/DXdvcqhlhoqvw75T0U5Hg21uCQwtVOzmD2H/TdwCnPwd4b65zYuVlhP5
         sZ8ivjFQHnt62zvziOJbYvkGrrgkaRQgn8VZJKvxSXRYZkAMBv1SV0T7SHGyEvGtiX7I
         ORhA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Bv2149BDTLTetHzKxNYJuC8Xn2qegHidfAYl/UgfNKaCrWnkqZLgCnOz3v9dxE49Wp3kJzNOpzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuRHNisxU4GEZXaviSBuZMeBn+HOjgBzH9e0v3ipl88ZPc0Sf
	qjUdxJ1LLLk+KPJkCftEdyNrEC7/XutUuJTxZo+M2Vt08gAEqT1qp0JA9hD0WkgHVjjEx4V9/Kj
	IAaBbs9XJdw==
X-Gm-Gg: ATEYQzyHDbaSrJ/LX4EUY2GkxZBShPCjiTWvkAFTgmMaWc/PaODhny2n4WpwouNbTmy
	VtvxjojaRAlyete8rArJc/5dPRDJ7DqhOMwcqTKXfOycSDOwkM0j3B8HObDlDt7hhUv0D3M/MEf
	UcuHX0yIVWG66eA3ZRbnspM0m9NRDQWWs9BVBGYPxy9vIl/z1S6kElK9BibfkFR73vZnh50reUD
	Mn9xP3EUtB2yUBjoVcAyHmhq5ltoWIIEtETycfKKRwRSXHckw3ACzSfOBzlLW159hlZ6OyzABBC
	pLLHer1GYZF0tKXU8fDLd8UgIuXqRyF01HoKknKIUbKiin3sXd/V8F/70ZeG8fu7PvGS+fYIkY8
	iTy95pm4I8IDBTpeGgBUWod1lwjy7ex3D9GFn/hGHEsAqecIbzqgK74d6++e9fD7cRS8b7PTCEl
	xi4AbAJuZeBQG5UhvyCNK7Hc45FgzHB2b3+foAAqJJVD0=
X-Received: by 2002:a05:600c:a010:b0:480:4a90:1afd with SMTP id 5b1f17b1804b1-483c98dc373mr207220875e9.0.1772457339037;
        Mon, 02 Mar 2026 05:15:39 -0800 (PST)
Received: from FV6GYCPJ69 ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3d24dsm245616515e9.5.2026.03.02.05.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:15:37 -0800 (PST)
Date: Mon, 2 Mar 2026 14:15:30 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	mbloch@nvidia.com, przemyslaw.kitszel@intel.com, mschmidt@redhat.com, 
	andrew+netdev@lunn.ch, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, chuck.lever@oracle.com, matttbe@kernel.org, cjubran@nvidia.com, 
	daniel.zahka@gmail.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 07/10] devlink: allow devlink instance
 allocation without a backing device
Message-ID: <lkotihkrjr44jguht3cbj4kozxykqdzqedm7rm4cxuilsy76s5@mtuhatnluxgh>
References: <20260225133422.290965-1-jiri@resnulli.us>
 <20260225133422.290965-8-jiri@resnulli.us>
 <20260228150138.14e35ee7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228150138.14e35ee7@kernel.org>

Sun, Mar 01, 2026 at 12:01:38AM +0100, kuba@kernel.org wrote:
>On Wed, 25 Feb 2026 14:34:19 +0100 Jiri Pirko wrote:
>> -	dev_warn(port->devlink->dev, "Type was not set for devlink port.");
>> +	if (port->devlink->dev)
>> +		dev_warn(port->devlink->dev,
>> +			 "Type was not set for devlink port.");
>
>since I'm already nit-picking - maybe we should have a helper for this
>case an pr_warn() the message if dev is NULL?

Okay
