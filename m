Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE172381C4;
	Fri, 16 Jan 2026 18:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768587341; cv=none; b=dY/33ak3fB5EXdYsxst5xCzgX7DypEVLa33QThjaLWAfBueTPYGeVqEcbX3BaU4N6EmX+uEnUV0aV1MLcSOvU4y+Qfos1d0zYI0sKyQVSHtsoGDUtumpnazuSazSQ4z8J8o6oJKW/g9O8A2WSwPIqg8wPBSyj497XASPXWijvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768587341; c=relaxed/simple;
	bh=y/DIJ6A7KeFAgG37NNbHyEhycSdAS5OhF3iDm/TZt3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bgkJqy5WtQ9ATQpvfjNDFpTW+H0zq0G1ISD3Fkent3lJ/oaFtN4TP1ylPK5UB8CdXrlmR+cHkfbUkBRBm1Q+Vp7C5APcH3jMlYwGTSD3iEtIpKWkDJkhid8k8ts+i4vWw0nGUCsmJ2dUzeXvfNN2FiNm9+lC/9cou6Y/AJuYM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TojyoqSh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TojyoqSh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A16840425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768587339; bh=UwFnp4J8X1Zm1cLi4jKdb2ULyOUOmtPVihyqCa637V0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TojyoqShbS+tdzHSFx17sOlMp1m6vXp7rEY9DNOzFTfhfoP0ouYVeTEtqqHaFO+DL
	 bNKU7oOJMRAUzh5ZWObRHvw7NO7S2nY/O3EK+2QRrzejZztZI7qwW7mLDwaTjFJN7x
	 zLYlUg8ixmjQBCrjw1uLA8rQDN/IG8Z2SPhawM+K8ClJtqSTKntPiA5cQVOftu2/zG
	 NtNmOnGuJdnr7KAhW5up+BvA4xf31q041dF62F8PhpnbkCLzBdnoPcn9kU+3TQq8KA
	 O8ctjRgeVk9MeyR1KqjJR4cZiWiI4he/EOmN4pd9E0WH0jIfD+I2JMy4YOrXFQo0Ui
	 v2/0JJFoGWmwg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1A16840425;
	Fri, 16 Jan 2026 18:15:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] driver-core: improve driver binding documentation
In-Reply-To: <20260115215718.6405-1-dakr@kernel.org>
References: <20260115215718.6405-1-dakr@kernel.org>
Date: Fri, 16 Jan 2026 11:15:38 -0700
Message-ID: <87ikd1o245.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Danilo Krummrich <dakr@kernel.org> writes:

> The driver binding documentation (still) mentions that "When a driver is
> attached to a device, the device is inserted into the driver's list of
> devices.".
>
> While it is true that the driver-core keeps track of all the devices
> that are attached to a driver, this is purely for internal purposes
> (i.e. it is an implementation detail) and has no relevance for user
> facing documentation.
>
> In fact, it is even misleading, since it could be read as if it were
> valid for driver implementations to keep track of all the devices bound
> to it.
>
> Instead, drivers operate on a per-device basis, with a separate
> per-device instance created when the driver is bound to a device.
>
> Hence, remove the mention of a driver's list of devices and instead add
> some documentation of the relationship between drivers and devices.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  Documentation/driver-api/driver-model/binding.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/driver-api/driver-model/binding.rst b/Documentation/driver-api/driver-model/binding.rst
> index 7ea1d7a41e1d..d1d311a4011f 100644
> --- a/Documentation/driver-api/driver-model/binding.rst
> +++ b/Documentation/driver-api/driver-model/binding.rst
> @@ -53,9 +53,12 @@ class's register_dev callback.
>  Driver
>  ~~~~~~
>  
> -When a driver is attached to a device, the device is inserted into the
> -driver's list of devices.
> -
> +When a driver is attached to a device, the driver's probe() function is
> +called. Within probe(), the driver initializes the device and allocates
> +and initializes per-device data structures. This per-device state is
> +associated with the device object for as long as the driver remains bound
> +to it. Conceptually, this per-device data together with the binding to
> +the device can be thought of as an instance of the driver.

Applied, thanks.

jon
