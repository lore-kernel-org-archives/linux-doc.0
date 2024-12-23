Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C01C07EB
	for <linux-doc@vger.kernel.org>; Mon, 23 Dec 2024 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734971623; cv=none; b=fCojk5kfzWVrGOhwdGtUKZI0zhaV7dCBec2yOHmgRjdlRMSZN7v4iAxFJwj6PANIcWvyyfGNXJKqscY7R/qO1BoJEMj1xST3DSn4nTOeHTDLxnMJuCoqxoVIElrKyO2ReL3mXIDqoA6LAAMBIFwJGISX5MfAkyP1+bixHhbBKwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734971623; c=relaxed/simple;
	bh=gHp/getcUO7eTngzfX1tPLqe+VFz1jDhuvKQASC1t48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeCtH65kbfFVW0OWPbeKj6GKUwG7avMSsoEzg1K1QjmJl+Bz6Cw1CD1m1FIworw5SPpUxauxEijYtDq+7sB0Ulc6nKq/GipggmmZwdE9cqg7fuOor8xG0ooJIRaPs/0ljywKkJPp5P1Pqu70IQFIBvRzwPK6N4lsTaQLULcD0ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fxU3Hqaq; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fxU3Hqaq"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46783d44db0so40871971cf.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Dec 2024 08:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734971619; x=1735576419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/SA0lbMvAXbipK9BrrMsVmdVVOF+CvMmuegNIZAWTAw=;
        b=fxU3HqaqpJnh2CSOiIrhWoEbcZ0VH3juVGwQf6Blqpo8iqujjJY3INZXqHSXwrS9z/
         f9vfmlDsKdB7f9qbsiYtye5V0TNP201gJqSisXlDXMto44xAgMhDCD4vcH/aYrDe58Fn
         np3hZPnzpJCn85+bmgBbWZGDEhFBqQREgpBAg4WpQHaZymhEbg14LVvzcu8WQlDPMe7d
         WWGTnFchWZdvNbkenSX6u1IuugwkFczu9vWcPx9IMDLCXplOdKjlhB62Ut92+JPakGAt
         3A+5ZbgGN99eOFJo2tFoIU0s/xb/3QZ2GPS3SZz6AzLadq8ALKGt78pqapujaFS5pGX3
         63LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734971619; x=1735576419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SA0lbMvAXbipK9BrrMsVmdVVOF+CvMmuegNIZAWTAw=;
        b=cwUxk7bhbt1vl4TxynnboDlCA3r5kqjZuQU2qOs6qt4bNJWQt5BIWEETTmsqKCNYhV
         F9EMlEABY7Tm05u6TZQyxEuM7XWDyhamv5w9OruBIJjco4uJ8GTBrSHnhRA1dyg2hta0
         KjumE9yDiDFTp2jDUZYWxjEHJ/P1sw5Pbznj0nWweGoTJsxK81qVnzfQcLxIPfQWbPvc
         EqCWdHQDUUgjK7pEA11gQ79GmpHslzJvoqkNSlSGsse23pkFKU60C7Hb9VN5UEgo/KDj
         79RRMEIWasWok8vCNla//NiAD+axJzJcHtXBnpHWhC/wqy8Tksbsrj9P/5GboZ4MQLss
         J4xg==
X-Forwarded-Encrypted: i=1; AJvYcCULAQejbu9hnKY4npln3hejssBb7413k+nH7Jfk2jeeUsWieXAn9sStMV5WrDuXb3RNKM+sq2+oyH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TTCbo9yf44OF0n83biawSYlja7+ZzuPD25mv3kZWKGC3ebwc
	xdBuzgfsM/grvlKecqznVl0DMjwoJgqjqanowDnIS6Vtx+N4D/PUnTpklpHKZ8M=
X-Gm-Gg: ASbGncsYuFMBTz3eMvogjEJtsHi/lBwzs6aOZ0/BVnaKyLKvwcMH95JDAORov26Qo+f
	E9E0EyB2syiCCgkPNzRXTzKCefuuqxVoyow0dGwLtgeINkOResHs+p23C/WA9o+1auIP+SqDP/R
	5+DiHfDo4Mm97X4JxdvtGQ4XRfa/v9AHwG/7YsIfNnrZB6dxtoNKT3NzVx6va7Yo+8VPSYrFyan
	jwa31jKqdCagyc+TEfcWVcT5f0tkZRkVQrNp6mXRfilFvg9EJYQ/+dl8OtpOKliyvo6wzdEBPK/
	zerob4MjX2DYx1pNuVU36NoR
X-Google-Smtp-Source: AGHT+IEpUycPZNs5cOOouNZJTjwM+ffbSpYr89ZBbzgPq6xyt3OVF9nnjxtO1B7bzyodulThYgS8QA==
X-Received: by 2002:ac8:5a51:0:b0:467:b649:6a44 with SMTP id d75a77b69052e-46a4a970385mr208293661cf.40.1734971619282;
        Mon, 23 Dec 2024 08:33:39 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb17a2dsm45116571cf.59.2024.12.23.08.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 08:33:38 -0800 (PST)
Message-ID: <fe046df1-1868-4008-8999-97a9d0b90b58@baylibre.com>
Date: Mon, 23 Dec 2024 11:33:37 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: ad4695: add offload-based oversampling
 support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241217-ad4695-oversampling-v1-0-0b045d835dac@baylibre.com>
 <20241217-ad4695-oversampling-v1-1-0b045d835dac@baylibre.com>
 <20241219161301.3f708302@jic23-huawei>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241219161301.3f708302@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-12-19 11:13, Jonathan Cameron wrote:
> On Tue, 17 Dec 2024 16:47:28 -0500
> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>> Add support for the ad4695's oversampling feature when SPI offload is
>> available. This allows the ad4695 to set oversampling ratios on a
>> per-channel basis, raising the effective-number-of-bits from 16
>> (OSR == 1) to 17 (4), 18 (16), or 19 (64) for a given sample (i.e. one
>> full cycle through the auto-sequencer). The logic for reading and
>> writing sampling frequency for a given channel is also adjusted based on
>> the current oversampling ratio.
>>
>> The non-offload case isn't supported as there isn't a good way to
>> trigger the CNV pin in this mode. Support could be added in the future
>> if a use-case arises.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> Hi Trevor,
>
> The clamping fun of get_calibbias seems overkill. If this isn't going to ever
> overflow an s64 maybe just use the high precision to do it the easy way.
> I'm not sure you can't just fit it in an s32 for that matter. I've just
> not done the maths to check.

Hi Jonathan,

Thanks for your feedback. I'll look it over again, do some testing, and 
see if it can be simplified.

Trevor

