Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DD3596E9
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369857; cv=none; b=QRNbrTD8BvSzYOS+amGbiOnw5R7TYB3xXvlDr+2n6lrzr5x3Lah983uAbGVK3wTtBdSmt+rwVgn+9cuyK4GZHukpqkC+YbP3nqUKJr03mh2NK2dxxaY1AhhYL7JO+bZt/KzGE6p6ocw7ZKlc8KSYKaHB/reqgzA8+NUPjDJe2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369857; c=relaxed/simple;
	bh=P50Q9DHDNQka2qrgw513BMd3JIx3mSPm10k7dGqR+X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxtkKfBJnnmQAQJt2EreLEmA/DiS9dwU7/LiTE9t421wJX2eCnfeiMc+i3sN1tZjwI65ml/CKEbLgDkVaPAdMcsTkt1Syk3YF+TCf+X6U5zYskc3sg9pYa+fP481l4Q5/Ef0zP3x5CoLdbnyhClDhyAbQabNqg1bJ40gm6BAcko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=hA7rGr+v; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="hA7rGr+v"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4362197d174so1165521f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770369856; x=1770974656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P50Q9DHDNQka2qrgw513BMd3JIx3mSPm10k7dGqR+X0=;
        b=hA7rGr+vuf0mvhOas6mZuuAsd6tK6ALSjbAZ/qxozj4H/A7N/1wQ6/FUpAFkUjPxlY
         KKW2OUSCgEYyyF1rdvsxNIKlQ3ooQHN3cUjA59CLk2tipXiEZ/7LbmR44b/OHmONpI0Z
         +mI9Hg5iYcJQ3deDEjmj24WoAhS9xaFNdKSr4TuyL/dyeOkn5wI8H2HIrvCpqpQIJgpB
         pEZoI9Y/tLQDPjP2CwsDuotVOrn/JEJ0OkEk53jvXUOnicnZT/w9/lETYxPpcGNjeu/Q
         UXZmRNmulTQ2UyTUosRWcioXUHcZPaQaGxtEnGMbh6iZmcmikdpmopjcpwCMeGTJL23y
         Po6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369856; x=1770974656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P50Q9DHDNQka2qrgw513BMd3JIx3mSPm10k7dGqR+X0=;
        b=pIAwHVWiE/Uih8GGNys2Wvgw2x/JnA19oq6699zgwX+i8TdT/1aJBFSJgRqXie4amX
         Ev1QFG9akTJUud88R/wFZHk0GO63v5SJIm8tdLEdgpuh582zAZfLs/p36T2qimfRCpKc
         U1WcyVlbxfBuc3e/ZEcrTkAJQ1R7e4istvZHDITyM+wMFExMvteP+KiIZC1d2dplgIEu
         BlqOIrFnhw8f4QetxGRkSfgQbhEEH86nHSM8UgvBZT41AF3jYdBGMYlh0VkBg8poqqe1
         qY32wt+9+68njP4QgjA5vi0Uqe4aOGiJVGNvsVAB0WqW4LdZLd8kgVqCLnIIu3Qbdqg0
         x4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUQNpMVVZTul/SXV3pGzlJRv3BL/HysAC8Z0fEBZC9X26D349FtyuQUt5WmpLGd3+WGNIDv/99Lk64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWJyPgN0fjZ6g7+DAN6cLqcRSKLuivjUSLrSFd1RH8HXRblUj
	wpdICFWUoNzCyZM1FCj78vbZt8t7ygx52bRsIhmczfVzuY2y/uz+xJwQilBwLamwEtg=
X-Gm-Gg: AZuq6aI5RiesjjaYmuFIvtL/M0Qf+1eq3h9WiJHN4IXm5BVIbz2feW4sdILOrlsvRTW
	4HnerNNHSOMF378KVq6gRtK2r4taO0j+KNP2GbgRzxE4Lok1a+D6ErUyawy4Klvs/LNgYq8tUc/
	x1IWT+2azao0Gk3ez8h4bfltFmoV4E3hQp75oRw/Fv/kOOcwHBQvQXAluRxhUdtH2VRjgEp46nM
	K11Y0nzeZCPncuY9Ue2FiDVenwI5zAV10BtPREAHySmNHSG9A7UsWznPqQIfYnmSMUgCSzWLLQp
	bN/BXpkZFNJFtWy4EEggd4cW3y6o2qIWCbmLvsfqoLnOztrhKTu2D+CWUdRwzYF14tSFj2xbYMF
	QCaYACXuz1aun6nBYNP3/gBtzL6Znp5DHIW8RYAOWZhRamN1FWM46XydROLR5jpV+K063eQNc8G
	H2lY/PLipiLEGshtn9Oes=
X-Received: by 2002:a5d:5d13:0:b0:432:851d:35ef with SMTP id ffacd0b85a97d-4362937dd22mr3165723f8f.42.1770369855926;
        Fri, 06 Feb 2026 01:24:15 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25d5sm4583939f8f.2.2026.02.06.01.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:24:15 -0800 (PST)
Date: Fri, 6 Feb 2026 10:24:13 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V2 0/7] devlink: add per-port resource support
Message-ID: <7rmcwov5zbu4blljlnwfzhobmmjsitih3t7w7vabpmkigat6du@erprfflwyiqx>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-1-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:26PM +0100, tariqt@nvidia.com wrote:
>Hi,
>
>This series adds devlink per-port resource support.
>See detailed description by Or below [1].
>
>Regards,
>Tariq
>
>[1]
>Currently, devlink resources are only available at the device level.
>However, some resources are inherently per-port, such as the maximum
>number of subfunctions (SFs) that can be created on a specific PF port.
>This limitation prevents user space from obtaining accurate per-port
>capacity information.
>This series adds infrastructure for per-port resources in devlink core
>and implements it in the mlx5 driver to expose the max_SFs resource on
>PF devlink ports.
>
>Patch #1 refactors resource functions to be generic
>Patch #2 adds port-level resource registration functions
>Patch #3 adds port resource netlink command
>Patch #4 registers SF resource on PF port representor in mlx5
>Patch #5 adds port resource registration to netdevsim for testing
>Patch #6 adds selftest for devlink port resources
>Patch #7 adds documentation for port-level resources

Could you add dumpit op for the current devlink resource? I think that
was indented originally. Will help to see the whole code-picture :)

Thanks!
