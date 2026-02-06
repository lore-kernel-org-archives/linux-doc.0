Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6899035EDBA
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370622; cv=none; b=Zm3TjQ/v9EkoQfmfRG1RwDoV3EEkbHpMFg7kAsZkV6BhrpNpQlhC699+OepjkLhsS0SK8SUnaURw/Q9ugPDQ7PwGX46i6KX2CCmss4+zB21bYi/TWxAvbT56pS3+prmCOpB14Po+TMNbScnWPDxRoRj1si0nnjHkfc/dhwBbHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370622; c=relaxed/simple;
	bh=PW/cUZwzFiiiVYrbjLi+IZRoi6zXuNxLhvfj3skBHOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLndMjLXlxRkIN3hA7bjR3eBZOUq3ayoDH6i1AEIQquLbaA4w7qsrdcTlu/fG8VsKSSgPErNshhtfgmU/1/pCRQmepEeM5c23wF+7esUsZdZ2v6xYGciJcU+SMZ9qcdNIU9xg2nFAfyrwqdIrwhUkSCRMqjUIAUD1vaew4Dz+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=O9tVlAas; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="O9tVlAas"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359a316d89so1544313f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370621; x=1770975421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW/cUZwzFiiiVYrbjLi+IZRoi6zXuNxLhvfj3skBHOk=;
        b=O9tVlAasfC87pV8+srE8Fnp7LzWL9qTDXNIdbHPsDemn04UoLuwt75lx1yjKaejc/D
         3IVAxkmeTjbWhCkwjvVprBNN7oHGz3yGjKohL6nCGX/LRP5XxdF/jsP9b4UIrvQAswEB
         v+r5JULntlZ4PPfiI95wnJXH17mkmS0J6Nm9NkeMeBpyBxiJQsjdQTLhO103M0JcpquT
         YRlMWhJ8yLc9p5DLqqAy6GLkd+4/LisZLRfdkO/GBx9rGZ5OZXIKK2/xejfjFNZix2lC
         xLlCuTEkuN8NX13FdtB7mjhCklPmZoHSgHs98HIQQjN9mE8KDkUDyWdEqex1uQDS+NRa
         mpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370621; x=1770975421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW/cUZwzFiiiVYrbjLi+IZRoi6zXuNxLhvfj3skBHOk=;
        b=IT/3+jraZmP8LGzMZC0e5axs7n9bmogDaOaLlvuPh88gp+zbKUBHXp64HF5bu+wx2Q
         fkq+MMBuj/jZk2g2mm2hA8cLEtll5vu9/PJ8mDH7IrtSViwCTwMArdHeuMI3i8eCtVEa
         nmMAOovLIu5m2BlOie9rk8r7A2hwOmYU8eLuSGelVLQ+kyqxZCIbtHVdk5mXBATBm5Bs
         DQP1u/v0CZh3Kl+se31BReVReg6lUD/Ar9dK4iXvmpDSUwBM2seeXOdCsSahp0TP97LL
         VDP4LrU8Hil0n8ANlzIjLoJlg5rriUFsV6Cy3PVinplIlec8uWqPzopJs95sOIsmUDna
         ZHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrLkLg9QSmYHfVY6fWtoe8192q9i+mJvP9GAU2ppxh32MSrAAsCSr+0Urt8iv76VuoXwTj2tmRv9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6tspOvIayUFyt+Vuhml+w1HUyFMmCHeeWDasNf87PdbLnZ3T
	UMAcnqrA6Jh/L8JyXmI1XaJ0bPwxdk9HaYKXCcnPQ0nooI3hac6V+JyVwOIu2psASjY=
X-Gm-Gg: AZuq6aLi+Vt1Eq/Ny80o14f9TrsH7xXvaTo5p8qsOhofw2DR4SXPx54HhAGqa2w604c
	fffNYqVndP9l4iSfRZ3/VSHOCHSzzwOX3CltxZF13IvtYfX6OTH/07iHjCE1EGEtfZUa3GQZAuC
	vLiq6lG3yR+58di8LgOYEpBFsARNzrmlJfP+9zdAn2YLZZrHO0V5e3OhFhbffXEDR/VmkQkGX0W
	zP+no4sIjccp9mAD0HKXfBgNZrMfFep5DUPQnt1c89ifjW8X33FWIHsiVBezwmI9fyYow5uHY5m
	OTicJ7X6VRIswrbYC3U34dEH/LFqC/b6bC6sJaL6jRJWVG0twYsXpsF+45GRvE2RQEdyQ41Wj4D
	NKrBv2SIgvsd6DkgqEG/Z14vY/iqGJYqngWGQBxz+0EcwuKVCVowEyhRcprc0eFa5wEjft3s/WG
	/lshYcCFZ/uQnjWQtDW4R7vRQ7Zsv5qQ==
X-Received: by 2002:a05:6000:2c08:b0:435:a48a:123f with SMTP id ffacd0b85a97d-4362937b167mr3578107f8f.42.1770370620697;
        Fri, 06 Feb 2026 01:37:00 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629756b0dsm4020062f8f.40.2026.02.06.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:37:00 -0800 (PST)
Date: Fri, 6 Feb 2026 10:36:58 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 5/7] netdevsim: Add devlink port resource
 registration
Message-ID: <vtlfg47c7tme2stoefit6nws5fhxhcyx6uia7pcbqvi4xenzoj@b44ivjpnwzgx>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-6-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-6-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:31PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Register port-level resources for netdevsim ports to enable testing
>of the port resource infrastructure.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
