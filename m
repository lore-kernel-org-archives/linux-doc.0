Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F503C9EE4
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 07:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781326; cv=none; b=s84Erw3d0yxed1hc1/lef5vqoS/QDVZkLSmTXUnA+MmJrAHhb8z+DcFhU7Pl2Y8Q1I/jr/95rL/asYVfZxuGAeqfcF5Ix3HW4n3Xbza/znXeIg4oVR0xDhFccLVgmnEghDMt4jBlGdldqlkRVxTBybFYKKsAvi4SJG6SA/rMbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781326; c=relaxed/simple;
	bh=E/qFLtmVUNW34+Ixf++D++sSrm9KXhLgjM3d4kgyiZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feHjUeiJtGJFwrcnW11Goi5CL1Ru6QZy/v9/c8Cnolyz4OUsjR2vEHAh0Bf36PqLnJoYP7y6TmDCfUtYnZA4fFbtDDoQC+Aadca/JW/iLqfzHapAvieC0C/L6hcb3eNB0m9r1CuAGf41Wg6IXOQnDjUrOesIHIQKH66azlw+gyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=NKvgWCRK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="NKvgWCRK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49068493267so11769685e9.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1779781320; x=1780386120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/qFLtmVUNW34+Ixf++D++sSrm9KXhLgjM3d4kgyiZI=;
        b=NKvgWCRKQAxei3XOKqtyPqJk4M3SHlJ4ifdvYXIiwEnQ5aXiynfRwcz/nSWDaopK3l
         ZEMPiaD3qWuu0edhQkZ3vVixgGfySaFwv9jmPkLfcOqcNePhiVj1n6IavLhPh8Ro6OSL
         Fbc73d+w0KDbvdkxjN2eAiePbpEpeCLH+NYf6OuBHKlOwBrjQ9z1RwRcS9Qr/FlO3oGu
         bfVYvC/V5QgLXZTgmVOrMhg5H73tsSqvJQlHkfZBlkcX068aCzp7hXoBe0IMoE76dRHE
         T9NMKheRAOvBFZmmWKRyw/P7H2HJ+IJpQoJU2ZTOhVL4DFZpiuCov+OzZ/xo2pGAiTJ1
         8CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779781320; x=1780386120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/qFLtmVUNW34+Ixf++D++sSrm9KXhLgjM3d4kgyiZI=;
        b=kiW85vlfPqL5loHZWvDZpYgZ9iDbyjqkO8iRRwgBVNh6H+UlLCBF0AizbexM0Gfhzy
         jZrbkrzEz5KSEl1z3/ryzVi1p80u83aNjz4TfZBPe5xfkgZ+F3zIwjjOITEXhKl+HLr0
         o9wZOQE4TfmL5UwVye4PBmNMDoQXM9fkKN2PZM2XUhLAegdvPfjx/LfegAENWxFQM7jB
         IcgNQtoUOLy2SWsUeMWfbR3EgW61fReRJTCX/K7kcg6wmX63m7Df3PlvghN5p2N1NiIa
         02stdeDuRLd07GNrxPK6Ou9jbigpPE3lonqLqChhBlh0WR/ch1uAdASzYtSJFYU6wulV
         /cqw==
X-Forwarded-Encrypted: i=1; AFNElJ8ETz+pNtJBHJj37ivgfZegq/VpalYbgzjowZA4WPPNTmREx+TBPKKxj7pCbp9TCMBAtdspu7SYNWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUuL9XcDfRIilISzgnvUtvOrIteFoC1TaQSEG4bxrRXf4+16in
	EO334C6zGix7c9kSY8q4ePIpH3ciemsapz9LkZNRLbKOD7ig1/4CKIDckxorTzgumaE=
X-Gm-Gg: Acq92OEr/7wFVzt1pbZHhayQWQiibGXuRSgHZgUELgQBSvKfM+chu37/MSZaFsPrs0b
	8SnxBu/TmNE38uXH8NdOPBP3WM4HFcXZP+pI/t8jN2eki6GS4Xiha9DnUMW3VOQtiZcXVYUP+Em
	1EKq1jFzMP+Pqmwj0qYq71C77KAXSbfNh9KUpflLe04xDmxC5ao/iS35xV8q0oGmJJjqw1QduFN
	vSJc0imxLQw19YCTMygo+p7X8IzN+m45juuknxHdBtLZYvKKIZ/77TtvWY74wMAdw4GIVziy1FX
	g8sVbRFsyj7eVQ7IlPLy2cICU3Kl2PV19WiRNd/uKnEld7QblLSsurAhKyAots1tP5ZiI+yM9Pk
	XAxpC3gu090B/snqPCRZ0AUfM5/uWVI/P0PavLKABoK3/FivsdYSuaLCOM73/IiwNqnxitZ5SGb
	vKvu4U+OdTtS6HVzTkslrh17bRAuY1tHnKp9Fy1z/j2FI=
X-Received: by 2002:a05:600c:c83:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-49042250219mr286320275e9.0.1779781320072;
        Tue, 26 May 2026 00:42:00 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm34281078f8f.29.2026.05.26.00.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:41:59 -0700 (PDT)
Date: Tue, 26 May 2026 09:41:56 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simon Horman <horms@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Li RongQing <lirongqing@baidu.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net-next 0/3] devlink: Add boot-time eswitch mode defaults
Message-ID: <ahVOlJdfgkRa5z0Y@FV6GYCPJ69>
References: <20260521072434.362624-1-tariqt@nvidia.com>
 <20260525124256.650fbd9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525124256.650fbd9d@kernel.org>

Mon, May 25, 2026 at 09:42:56PM +0200, kuba@kernel.org wrote:
>On Thu, 21 May 2026 10:24:31 +0300 Tariq Toukan wrote:
>> This series adds a devlink_eswitch_mode= kernel command line parameter
>> for applying a default devlink eswitch mode during device
>> initialization.
>
>Jiri? Are you okay with this?

In general, yes. Couple of details perhaps. Let me check it more deep.
