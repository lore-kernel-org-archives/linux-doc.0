Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5158226ED3D
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 06:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181882; cv=none; b=lgeTMx6tGxPyIXI0Gy2U8Wo9xiSZvf6RFuQt8HddJH0t2me7veXudqKF6oaZjwhuX5bjjmqzDftMD1Df8Rm7XSmf9HT86gyijybNzuCQvVgGNv0+KPGlllJMzvgQQou82dq+nbl4FizRhVDfDtANQY+8nxF97uSxJJrag7/E1Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181882; c=relaxed/simple;
	bh=klKIgWivsTCeKC53xwG7zHFtKvNJmDXHDfW4hAl1X8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJNaqiclDpXJDXDM/iDju+HByfRBHFKdrug+Yw9hATqyM3AIiZPed/TDp3nF4vF9GTfyLajWq8QOHP6Cm8qQXPr+QL9W7xliGlbOBYQz4rOy1zV+VBNsPzJLE5WElMpQI/MBN+PMISB89Yy1P3KG9sn2nU8PaAZg+I3kS3wXw60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IppDfIcV; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IppDfIcV"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e9f7491ffso75618547b3.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 23:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784181880; x=1784786680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klKIgWivsTCeKC53xwG7zHFtKvNJmDXHDfW4hAl1X8c=;
        b=IppDfIcVo2VMV969yqpwBWLLL0OJ6kRtVTMWkM04XzwNtMW0yYiOnwC9uqRvS/W2Pm
         fh58YkR7DCm+9Fl1FYSeysVvPnwMYz0ijcICw7YwJriiPHY3gvigXhrca7S3f06/pGUH
         kwyTJ/QplB7Jw5qydZsBqANWnbAzsUlIZVLYFaR4h8RCjyIEzeiXOh+av/lUixuoQMVx
         agtHwYu9ajv1mkGNN1ZyWr3pxsf7iKkunhVbMFxq1xeog7xvuxAACzpY42Ic2mjYwTyw
         XLTEacTzMNJKHyIEgnIHvazI/4vwmV87tcMkU5ECnuqHaYkY5lfyHUJdKfzPfGJbPDA+
         /yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181880; x=1784786680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klKIgWivsTCeKC53xwG7zHFtKvNJmDXHDfW4hAl1X8c=;
        b=EvOEhJ6jRn6VMbctZ1y7Uloy2NZkcwNImtdJdvtZ1wuFscDLEn91FUXwHDdefbYIv5
         YCLwCVkhbPxqaUv6zVdL9FLML0Lyacoj45kBvYbw/iSPhJ3y6sWgaC8v6yAvACriko+r
         zcWPiJ4QxkZ+eLhK3l2D509KyYHrGllbxJ/5+IURTbO2buQ3AXxNQZzSvJ2akQ8cpK9l
         b6m+QMgjigGZwl3+ajJpsveIH4tKgmh72cx20aRWTVroN4CByrgqERc/chAsyjcd9mdt
         enUDvLrGHUgnWRUyQNDfnPEJNpKJBgqtkQlQB6+wrpCiuet010j/HuI56GzvXzqoaxga
         QTDA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9tNbFdNJBT7JczokwnoA0Vvd//648COIsQToGEjtBdc0jp+ZftVlsGcpwiBZccoX6zERzUj4/qvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQevyd7AYkoBo6PctNJNDsziIqoBgbHbtkRoSoffFzBBy3RPSN
	mGQFaf9ouHCAQyKrk/bVLXb3ztAtL7jZc9yLiTOljZmpB+KZ/NmzO82k
X-Gm-Gg: AfdE7cnlcHtC9lAM25AryuGqIzztnkDgP8H6vTSP5twIN2HieGn90FG3lWhzjj9HitK
	J4zR0rjalPyiI9/5oULdvGNbLCKaulT7NkkQkKGylKzOsg0uPNNHxdgjRmOQOGOWAPzgrDe2KbT
	8b+CikOvCu6u+Zi92vyBx5xYvuNKmxTsjPbDgks6O8WTyR80FGGHkJrPKJcfOtfyGTRze2pkIB4
	9zQw4bniN8KnbBO4+Ztt3KLBHnNthlz9Ks54apU4/SmByWoR3vw01ms31rT7j3YFSQ22i6L+jPB
	U3dDwWYc4viiqpm3rwlMnu4XTijymMPcn4wK2yvq8dfzJv24i716Bj8FVu3rnlAWzxkO/4ZETfp
	HJSnwKRQ7FSE2mYH4dHPZmAi316JOsxEwga2YP4HuPrRdzvVkwcpirFOH/+kqi5p0gmboDCchtt
	lONbTxcsugK/rxZ2RfxzLb2q5elv5QQU+++UGmxmMyO80HUnvtBaVe7ogslewcmO3SNSXXhfZo9
	mdotryFq6UeaG0=
X-Received: by 2002:a05:690c:6905:b0:81e:97c9:bcf7 with SMTP id 00721157ae682-81ec0167c80mr68242497b3.71.1784181880199;
        Wed, 15 Jul 2026 23:04:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:566e:ba00:6d29:5fc7:266a:e62a? ([2600:1700:566e:ba00:6d29:5fc7:266a:e62a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6bf58f85sm187966347b3.18.2026.07.15.23.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 23:04:39 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a4d8cb79-a696-4016-8c8a-a56b14992309@gmail.com>
Date: Thu, 16 Jul 2026 07:04:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
To: Kees Cook <kees@kernel.org>
Cc: nathan@kernel.org, nsc@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, arnd@arndb.de, stefan.hengelein@fau.de,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, nico@fluxnic.net, officialnaumansabir@gmail.com,
 rdunlap@infradead.org, vegard.nossum@oracle.com, tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <202607152119.BF8E377B@keescook>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <202607152119.BF8E377B@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kees,

On 7/16/26 05:19, Kees Cook wrote:
> Yeah, it'd be good to add a checkpatch or even build-time check too.

I'll look into adding a check for this into the kconfig interpreter.

- Julian Braha
