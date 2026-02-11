Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E023315D3F
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810962; cv=none; b=gJkE02GAbSxs8tSSw7zC0VyxE/vIaWDpRqncvOHaed0zP7TGlX0Zfm+gFYG98ZeS21/4qZ0ozVVA0oroBJ1FAhnabJGyXAg8RZiwlNPYnJA8jsMkRqlLifLZwzKkq+gXJbFreLKqSGcIzD+nw3JcXaInqFXngcEO7WTCdZJULq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810962; c=relaxed/simple;
	bh=+0oTiVEciU4czR3f/w4qaJMu4GmlPg8+p7LTIxCV06A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUwc8l8YfpHrKmKjLN13BtknqPP7zmxZvGVBW/cvewmxAm9RhF0IHA8xlDqVUzG5GBv4Nq8XlBN7F2pLLw15j6O1KDP0ufExCQI35phUlqWmbDxu/HWSthLm5Rz3JHzvdj4tTDYiO8i/sd92hldgCcoo9yMGM4QHKQOu8p5LoWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LBmVtAhl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0XKRK8e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LBmVtAhl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0XKRK8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770810960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aY/0evCgUnAgU67WTuuAcR9YOZDCXErhCMNHMcMC0To=;
	b=LBmVtAhlyK7nxiOrE1qrhiRXYda0KAGm3cbNmaeG7cFIJb/W3G2ajEPZbA8xolV8ZU4hu2
	fu6UDT9LBOof6DxLU+TX+I9rz5kgng4jstKeVDZQ+k0Fl8x04tQ2dKLi+SPpKrBwc8Q9KL
	Yp3rWsus+63zW9KCZpTrLXYeRDpgMAk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-1hhyU2x1OD2wWd7Zga9tGQ-1; Wed, 11 Feb 2026 06:55:59 -0500
X-MC-Unique: 1hhyU2x1OD2wWd7Zga9tGQ-1
X-Mimecast-MFC-AGG-ID: 1hhyU2x1OD2wWd7Zga9tGQ_1770810958
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-435ab9ed85dso3326371f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770810958; x=1771415758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY/0evCgUnAgU67WTuuAcR9YOZDCXErhCMNHMcMC0To=;
        b=K0XKRK8epYl8IZBDshFy7nylL+9Gx1BrBDEz6hfb2bQRcpkwityShmWhrfi6iGFqa1
         GLrVTo61vNWfHVn0ZAOyCyZs91z0b1aVd09/b0rhLWexnpcD3nNMsPy4VxjSLAMn1GqU
         sQVKzYF4qNM1atz/RW5zpdVcIALP6JzzRlugpqfFMc2ilFnzkTgjLn3KRc3xlE7D5+R8
         l3KgxyznpqLkwhiwhZclbqbBfLs1YXGU2VWTIfB/mBT6dvC1xkmYX4K4vcW3YoeGMcbQ
         Ab/M12SLWisyKsjuOkqKQ/gC0g36hjI/01IvhC7ufz3ZDNmNnd1hh5v8zk66xxaN4wUH
         7tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810958; x=1771415758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aY/0evCgUnAgU67WTuuAcR9YOZDCXErhCMNHMcMC0To=;
        b=s3U0tFqfheY7UboL7BoJa2GrGbbDONqcnZIciqi3U6U08Mo1rXAXhDsSeOto7DF3V6
         aiUI9I8IcOTQUN2iV8tkmJV6KIQJ+uPRNv/lmTNjplo4m6uLkOLaBkA+Ba+x0c5wUaWF
         thxd0gHQ7PxXAHtEVecqjF2T1zfgC0Ib5WeAtwNiBG+O/5cMyYnhmozNGNWZxy7JeC6f
         VuXNBP4SsQSf6JRez9/koxNexBXJJP9q+imwKml0q0m7Yf7UDn6ro+mKrWyrNHUtxMsK
         1WAxZkvqyUO4/SIHwoPYJUkqe3Hm5dDXonn3FtzZkqrfHkBW7ZWWASd2rATwBCef70np
         QjTg==
X-Forwarded-Encrypted: i=1; AJvYcCVmJokGrt6zvbTzrDXkw9mZah0jxxGOMRjIrNiiQuw+M+n379NqDUoH9FGX3kWXB7GkWMReuWE7mwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsXWqzWNIxgrrekBFOXa9GcqSu0KqibtDyvuYkV54z5L3dOtiB
	tvSgrqJrg5IQimnVLq7WwP+cKMF+2VjpbBlLpOxiIuLZkRVOO9RFFJDNOw3GgFnw9xqlEtqirKQ
	Oz5aKe8DGGPUdfOLTraBiN5dCoDpdNt1iSJ65HZ64omQei5LkBKgCeGksu3wxYA==
X-Gm-Gg: AZuq6aJb5ePjs5p3bLvONq4pPg55NxqRFMOGaKnaOT4DIgyoYsCPnIHPnpvnIc9unmZ
	iBf6kPZpdCp7TKID9A/983GzBTH4cTG5EEZfTDErWO/IqKElbzknLgEKKhXQTwwQuOe1X4CU5ea
	CF/tO5VaArgnv96MREv3i65ha79WaEuNLalB37pLEqWzoNaHRoUCe2jBh6klI/a2qHIA5e8+d2I
	v2Xx1/3vDsFmmx+9lNyyKIDsAuFI3q1nETcyT6Leg/JBRw2WDzh4NjfTQeOCijzCihr/Wyj+NGp
	Li6TAgP5D8VHS5u+tOsEzYA015TT+gNjjj3pPZz3ThL6jg5O7tcYAjp6SaiLK7QDLaj8aI+KWoS
	nqDF1fVH4AgyurK2lRQdSYh0zxA==
X-Received: by 2002:a05:6000:18a8:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-43782c259e6mr3400553f8f.23.1770810957931;
        Wed, 11 Feb 2026 03:55:57 -0800 (PST)
X-Received: by 2002:a05:6000:18a8:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-43782c259e6mr3400519f8f.23.1770810957451;
        Wed, 11 Feb 2026 03:55:57 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc54csm4207496f8f.25.2026.02.11.03.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:55:56 -0800 (PST)
Message-ID: <f2882370-a531-4a83-ab39-cf73878c0d03@redhat.com>
Date: Wed, 11 Feb 2026 12:55:55 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] docs: ethtool: clarify the bit-by-bit bitset
 format description
To: Yohei Kojima <yk@y-koj.net>, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <f43999612ed9d17fb7fe8f21e777e1c784f23c46.1770457868.git.yk@y-koj.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f43999612ed9d17fb7fe8f21e777e1c784f23c46.1770457868.git.yk@y-koj.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/26 11:25 AM, Yohei Kojima wrote:
> Clarify the bit-by-bit bitset format's behavior around mandatory
> attributes and bit identification. More specifically, the following
> changes are made:
> 
> * Rephrase a misleading sentence which implies name and index are
>   mutually exclusive
> * Describe that ETHTOOL_A_BITSET_BITS nest is mandatory
> * Describe that a request fails if inconsistent identifiers are given
> 
> Signed-off-by: Yohei Kojima <yk@y-koj.net>
> ---
> Current ethtool-netlink documentation doesn't describe several behavior
> around bit-by-bit bitset, which makes it hard to develop a ethtool
> library without digging into the kernel code. This patch eases the gap
> between the kernel behavior and the documentation by adding descriptions
> around the mandatory attribute and bit identification.

This needs review by someone provided with English natural language
skills far better than mine. I'm wrapping the net-next PR right now;
this has to be deferred after the merge window, I'm sorry.

/P

