Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B31E51E1;
	Fri, 14 Nov 2025 05:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763096539; cv=none; b=qeJtEwJoANjKB+7/Bmfi5V/HbdXryJg8ouugEKIqYmu6FTPzOvrpLWnwxm7+JPjJ/Xv0QMa65Z7KR/9NIW8I2z14sIj1RZQC/akQuxTNnfGKMacPfh0L5LAZ4qRvo2pKP+Df+qmNr343yHaeQb4EPMN+sY3RugTCuGJmiiIKEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763096539; c=relaxed/simple;
	bh=8OBZWGzZYp4Zh6PpewvShL1bz7fdkPEiic53aWLfhhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+IGACC/gyaD1knDBfmdKVKJhxNjEjXutpDqdqt/kBi2v6Ifzrdq4D7JT+oJ7mWJk9CFjva6xEv1mesvWR+SJIpsqSi5hPgIZ77hh56Ld9upeSSeN1A6SFLX6ZnHNy9JTzGfkJqnWGWrrrYzHr9TipthORQZfsfcHh7yQAm+MSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=evZp9ND0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="evZp9ND0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3B5y+sYm5sP4UrSKiyKYVoarVxgUD9FR3ci7tWNg9ZI=; b=evZp9ND0ddr8wZMzxlQKPuxKt3
	bBerHXBJjX0dfm5QtEkdnAapXe4voZ5rCBMcwfToBvyDoB2BYMnJfWxsbHAyZQt60eTu73/hBZcS9
	jWmGg0/G3KZcploW8YCQpcrNTFYaQFj5Rv2Xcuf7HYXJI8SuhjP43wFwwlDY84QrS0Zmf8OdPaZMM
	URcbrOoVqGu/mN4VF/qKYVifyG9rbnk3IE7ToCFEADkWGe+qs0wWGqA3So9SeAh8l7B1bn19nHXQy
	efolh0nblOKqKzwuMRZSLOeJo3GULZIrK9+L2dmbGa72eINYoTT1tvv6bgrYUE89M0rVMMXHPriX6
	5siNHYwg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJlwr-0000000BZrS-3zdC;
	Fri, 14 Nov 2025 05:02:13 +0000
Message-ID: <0eb1a2b7-8064-4ac5-bcf8-b4898a8b5ac7@infradead.org>
Date: Thu, 13 Nov 2025 21:02:13 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-13-165ba21401dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 7:22 AM, James Clark wrote:
> Document how the new field is used, maximum value and the interaction
> with SYNC timestamps.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  Documentation/trace/coresight/coresight.rst | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 806699871b80..80b5ed09d69b 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -613,8 +613,19 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>       - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>         <coresight-return-stack>`
>     * - timestamp
> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> -       <coresight-timestamp>`
> +     - Controls generation and interval of timestamps.
> +
> +       0 = off, 1 = maximum interval .. 15 = minimum interval.
> +
> +       Values 1 - 14 use a counter that decrements every cycle to generate a
> +       timestamp on underflow. The reload value for the counter is 2 raised to
> +       the power of timestamp interval - 1. If the value is 1 then the reload
> +       value is 1, if the value is 11 then the reload value is 1024 etc.

	  value = 11: 2^11-1 = 2047

Maybe add some parens?


-- 
~Randy

