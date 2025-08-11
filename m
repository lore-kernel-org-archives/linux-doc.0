Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3721A5BBA
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921336; cv=none; b=gZYpzKX9J8G24ftqvm4gSbTnmL/HaA71r00Wd+KAe/sAJl9kv3HobMi3LpO5s66JThTdb5FD7PTOQr8dGmJ+eRV8VHexjMHt6OKzCfmyvLnndU/A59UE637OZR7hZqsF5FmWLRtolCtOuD1n18wKQurboz1KxzfDvT7bxINHrto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921336; c=relaxed/simple;
	bh=qVusmEX7F08TLfFu2Oy22o7zWBWgcHQ3EwY+yru4S3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sA3CzW5q/Iwm8J8ztsrbS3uKmkhXSs1zJDjHjD6j0+UCMcpjENd3yx2K0ASsGAK7VxXA82CejjEJBVWjrCSfnEX9zwCOJY4WZKR47Mv92AHF0efM4yVZtvpJzEG1ggXiaNg7VrMlhKkmu+qcaZe9NjXWyjL/C1s/o5dvKtCefa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=N6rO8Nsq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="N6rO8Nsq"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2CAD940AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1754921334; bh=XnJOz379ec1OliKGJPfuP/l0AIgxdNSrWBCSdn9emi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N6rO8Nsqzr/Ey/UQzkerWuMK/PgB397iw/73xnbySEqxRfa0dxQvqUYxKfAMF4Y8y
	 2/0I2qthr+oZJGNoDMRnnpKFEkq0AlszB3QI/YlOyEZ0MTyQ//RMPuhJcBnD0xy41C
	 zrdRfezx+BaPZpFWdE0zGyizEdmanD5naYrKMxj34HrEyG6kp4z5WHhr17RyFS8g0r
	 c8md3n6gkeAQxM+grhnHEX5GR0/Wb3LMDyNxO+OZRd7HffgXldtcNkVLD7FfCdZ/bH
	 jVqdPfuAd5wziKD2heFOlBgwWKWeAOx/U8eafJgwgBJLu86b5m3+KMwjW5AG/kL6RP
	 uQD/37YaLQtIA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2CAD940AB4;
	Mon, 11 Aug 2025 14:08:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nikil <snikilpaul@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Nikil <snikilpaul@gmail.com>
Subject: Re: [PATCH] docs: timers: Update dead OLS link in timekeeping docs
In-Reply-To: <878qjqgdew.fsf@trenco.lwn.net>
References: <20250811034717.6100-1-snikilpaul@gmail.com>
 <878qjqgdew.fsf@trenco.lwn.net>
Date: Mon, 11 Aug 2025 08:08:53 -0600
Message-ID: <875xeugdca.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Nikil <snikilpaul@gmail.com> writes:
>
>> ---
>>  Documentation/timers/highres.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/timers/highres.rst b/Documentation/timers/highres.rst
>> index bde5eb7e5c9e..24dcc32f8dcc 100644
>> --- a/Documentation/timers/highres.rst
>> +++ b/Documentation/timers/highres.rst
>> @@ -58,7 +58,7 @@ merged into the 2.6.18 kernel.
>>  Further information about the Generic Time Of Day framework is available in the
>>  OLS 2005 Proceedings Volume 1:
>>  
>> -	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
>> +	https://www.kernel.org/doc/ols/2005/ols2005v1-pages-227-240.pdf
>>  
>
> This is a worthy fix, but please provide a proper changelog and signoff
> line.

Ah I see you've done that, thanks; sorry for the noise.

jon
