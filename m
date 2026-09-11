Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F769306741
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 00:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088145; cv=none; b=JaWAZTtBtqppM7AADIr8VqmZslmoAZE4E1Udg1RlfcIlOy7r5Q6GzyjIfOlV9Kp6jlpBCkRwjOL12/hQQp7uDkUI9ZTuteAtHmMD0wrbuXMN87z+nLw7OSUrvfsWHavqMwimJ211XZFkqSYELgj6XIBL1ZnvD32aPEtkTP+DygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088145; c=relaxed/simple;
	bh=kQWpc3BV+U9JUEReCtGuwJXKFGM1uWH1U0sMLM6Pdcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fspUtLoE2o+sX7D5kLswg6bSdPUUBd6QvZzH/dfDSe9ov4OGmbtfMUjxnT77OfB9frSr/z7Pxku/DlxfNBTKpxWXFMRPEJkkwHGQRGoEHuo7ZiPsTglakbrzy1VcHY9fgi09rM2L7RMXwds0XskhTCUMT71aT5Xi6t1YIvbVNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLOEP7dw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLOEP7dw"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso609427a12.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 17:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088144; x=1789692944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M8L8TbJZToCP2k41SeR8S++Lennpcrk/WxA9QKMKSdM=;
        b=JLOEP7dwPdT9A4akfGf74DcuSKrE6mXkflVWY95Hv4VnlXqUTcMYg4IPbNhryibEpg
         qIxTvlnQbyk1hwEzRjeUUlfKmKatkSPhZWlrbqVfvBHBA8zK9S+J7FtnI7jJ5nHIv3wD
         BU6ULdGw7Cs3thAq2W5CUDnfUzxhbQi2G6Etk3j7QglfeJzQdyGSd/XaNZf/XA2pPHzH
         mUvfN6mni2nnb/9/VeRVdpiQpnxmo5AG+CYAbL/pirX44QkGYmAFoBsd2Vc14gOT/ZE5
         gSQzEP10rH/dkZfhcQ+vsEXk493bP2is/OKFle0stkHDqlaJ5f55o1sC+3QmhSOUfe9A
         7f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088144; x=1789692944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8L8TbJZToCP2k41SeR8S++Lennpcrk/WxA9QKMKSdM=;
        b=Wt0eXx2QCX9+2wtjsylBk/ZFZbMQo8aPuEM1UruHL6/7hVbLhL5taQJgHekHC9Lb2E
         PdPwPjoMclkELeiGnQZkknmLITsn3cm1/Ca7KthukN2Zon8NL7M0twBGXPRA2rbLy3Mu
         0IiznNPQWbyn80q2pzsPZEzxaShllR9hDHU7smS7EtDD6JI6IiC8U8wCX9Ex5rH5WUnP
         46nWrybAuYZgmHNyY2pNExQph1r97NxloyIsax4ZBVW85nj3cprkXeguDL09HOREQtcA
         4+KNOA7sxkeFO2mFsRVDNXa3l2GjsM7W7yslhbiJioSpdHP0rVWXTcaeAIpkWILXfMu7
         mB/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxgfqp9c8bNVZCZ+UPI2oEauLFoGQWtoyK8HAwNIDVyo6Ms0CcYzZ66ljM1+Wj5qcOcFGt2n9CA9rw=@vger.kernel.org
X-Gm-Message-State: AFuF++mMLw5mgkUgRk77r9ViNOJsNS+r0n7CiJHnAukTK4phDu/TTdIs
	zMby2LhqHTePFyRbgzoz67enbWWRqKbtz8wvKjKVCznqWuWW1LaPf6VDLwoHjsjf
X-Gm-Gg: AYBFou1w94533jO7qVD92f2pMiM3Hb41t1nuYbqzsuTpXKClZg8a5+3GLnx5hrHv/m5
	y5SaJSF5X0djfZhu8w/DhTTvtmhgzB1XSNf4TSYKdqmYKLscEvfBSqd8YmZoLMu8JJ1t+3dWJXF
	LxjB3xkBeB65xb1ObM9bJMN0ic+H3Egqlqzv5Kb3nKieRtOtMuUTInFe7pstHESfHli5bETybQH
	c9wSKgZkbS1Ml1XGRSK9qv0eTv386uobfEfDW+MLHxQcH16OWkSQI5T9Tz8mjWgysAfPbq+fwOQ
	bo1hDQMPR2JMhJiMYbq7t1nCqMPnvbjzLRYJjSaFABNVwzmbT23P1GOOpgxo4e5lQ24bLZCMP7F
	Hlg3J5TtI6jz7ODTVW1sa+VZc15J+DHCVB+5rjrBkV+sauOSnjAfCi4IsKLxXPyVkrRNH+XXpv9
	yR0gwOQYB9M4BrFgzl22wyR8byaqSed/RnourqcLxJXRwDuvPry/+bkzdcLGJLW4K9iWWvOUdR9
	sWgofHI2YRU
X-Received: by 2002:a05:6a21:a96:b0:3d3:afeb:880 with SMTP id adf61e73a8af0-3daed895710mr2723199637.28.1789088143739;
        Thu, 10 Sep 2026 17:55:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm1469131eec.30.2026.09.10.17.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:55:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:55:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: arctic_fan_controller: default PWM cache to
 MCU 40%
Message-ID: <ecc9ba0f-03cd-444d-8b47-f0e8719089fd@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-2-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-2-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:03:59PM +0800, Aureo Serrano de Souza wrote:
> The device has no GET_REPORT and every OUT report carries all 10
> channels, so the cache has to start at some value. Starting at 0
> means the first sysfs write to a single channel also sends 0% on
> the other nine.
> 
> The MCU factory default is 40%. Initialize pwm_duty[] to 102 (40%
> on the 0-255 sysfs scale) at probe and on reset-resume. Any initial
> cache can be stale if the module is reloaded without a device
> reset. 40% matches the hardware after power-on or power-loss
> resume, and a first single-channel write leaves the fans running
> at a safe speed.
> 
> PWM is still not taken from periodic IN reports: the device is
> manual-only and the host cache stays authoritative after the first
> successful write.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
