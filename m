Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEAF35AC23
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187059; cv=none; b=FEgiU7Twwe6RJtns8kB5MNrFeYDz2VWnQZ4ZhMlpz+27tVl+DQCTd0b0GH+bQoTQ0i26qhjre2r+lBcYfdJVL1Cz/Akt0HVsYXqlsOwimikt6+FGiX3CwmfwR2D5llr9hfjEy/G7bXFoFubDrMXg8gcKt5AaAJyXFWRKR9zRcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187059; c=relaxed/simple;
	bh=cJP0g25EjCZz5LlBgTEgoSsBxXU9wIOyRk9oOM+QSrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/Y1S9zgsZ331V6DJMOw7Dedqrl5Exd2yyCzLUfAaoA3EoPqVD+B+BPVceeVQXwpHdSr3WZvh+kda/ae8FQ8IFkoZNC8AM2ae6cNWKhFYEXmgbw/il7o/j3qNRuElGMpZz32P12rT4v1RiHtD3XvN7+Ukp4+hmRAiad/KMkYEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIFqrWbB; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIFqrWbB"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be27fa54feso11753981eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773187057; x=1773791857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJP0g25EjCZz5LlBgTEgoSsBxXU9wIOyRk9oOM+QSrc=;
        b=AIFqrWbB3b8Q2yvMj3UY2nxw8dWHRt1+hLZDX3RPfurL0kLnPSu85CgFt+mBTmbbbV
         Gp3Kr2bCs133zdutc1syhVa5ODeaxptTEGcgoS7crflssZy4gjxQiMSYjRisYzopnW+m
         rMH4iIOwAj0Ss1/+2ze+VL0oLnDlKOeEltaVFO75tSooGvbDDwMEZAHLvFCauGWghROK
         UKG4v65JvDjT0dwgHyBpO6PQnMpMeol/6i2ekuslS/NZIyn9DHAWujdPfIaMyMLp242b
         Bp8midURrAAyzm2WYlMXQxn2UWTs6jGjDDXsdysUnh/Qs93ZDhj7BDuVhSvhv12gEtKB
         ZzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187057; x=1773791857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJP0g25EjCZz5LlBgTEgoSsBxXU9wIOyRk9oOM+QSrc=;
        b=bp/iRahhgPTM8q0Ofj5rTb1aEhEafzGYrDA3VKCakgciPn0qxTTi6wFblvL6kbY1ny
         q+Y/mC2jiUonR/G8odrKABYgehZg/B7GK79ALmfNcQoFEyfPvYgUX+m/HCheIlgoS57V
         GgZrBAiDsKI0KGJreXrLcFJub8YnQFjmbHeS9qKrUoafoxfAQvSB1o3M91bHbqRY74JI
         YCbifEl7360Fu7XoLou2mEPVz/n8QO6nbJ4lZq+/XtCk7goonQm2oycGqURIpm1pJyLg
         uR2jqiBhCXlv+FYw1oA5tmD23lrDG7TzH5iC6YvF7SGULw+PvRqfq7im6eLgX2s958jQ
         kJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYLEwOvE/pAOoinMg8f9fSczwQb5BUROkmpozonusuosHE2W/aruXtCU1xnJ70ouIuhc9TDblZ928=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84lJ5QuAjGicjJfDY6nxFe/Xk6dt2XnUABUwvxc5mtngqmJw0
	zp2j32apZmQUgLbnDYwKZ5lSTlOJTD5t1oKDHldSkfjLFbJw8thvG64o
X-Gm-Gg: ATEYQzxCrM1fTvzjis4Kv1pE+hJrWeTAXy8riSUcCMQtflzBgy5lQL8XL1YSC2kHR14
	ELXSexNOKE0hFUpbKNx94OSPcwXI701wyeyFq14fCepZ3GIPMpia33njVTexnXdei9h2R9yjvfz
	9oOKnL5F+xW+6RhxMzH2JiYm6aJM/cQW/caMHA12EW+1BDyfzj+1f1S9Qq/6IZAAEBPcIVNGuuR
	1e8nRBInk5HG9aX3DwVsCqK65Ig1MM14Nyl8e8+2GESCLv5caHUPmEPptuE1+nzILniuTN9Z7qt
	gmUZz9nNhAAy+O2YVD35Dhm+D3JcA5KUUMBlKMRzEAtR6+iX6f7kDRxUFbH+K5tmqOzmslYs7KN
	Nihd4hqTAB4u1UtSwy5SamZ6l5zl/E0lNfYsqCoxW89qT6s3Q4RU/XQFGPIrnZoQ2GCE+bpyK41
	c9oqMb8huTVXkcmKKJpD6QMGmdogie8M/VUGuF3AZI
X-Received: by 2002:a05:7300:dc8e:b0:2ae:51fa:b7ec with SMTP id 5a478bee46e88-2be8a2eac77mr236090eec.25.1773187057388;
        Tue, 10 Mar 2026 16:57:37 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa4ff75sm468057eec.20.2026.03.10.16.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 16:57:35 -0700 (PDT)
Message-ID: <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
Date: Tue, 10 Mar 2026 16:57:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com>
 <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
 <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
 <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 3/10/26 13:14, Miguel Ojeda wrote:
> On Tue, Mar 10, 2026 at 4:33 AM Carlos Bilbao
> <carlos.bilbao.osdev@gmail.com> wrote:
>> TBH, a reasonable case can be made either way, and there are no written
>> rules on this question AFAIK.
>>
>> In terms of precedent, the Chinese (simplified) translation keeps code
>> blocks unchanged, which I suppose avoids giving the impression that
>> non-English comments are acceptable in kernel code.
>>
>> That said, the goal of translation docs is accessibility, and since these
>> are illustrative snippets, Spanish comments help readers follow the example
>> without having to switch back to English. Personally, that argument
>> convinces me more.
> Yeah, I guess it depends for whom the docs are meant, e.g. whether the
> reader is one that will afterwards go and read code or the English
> side of the docs, or whether it is meant as docs that external readers
> may want to read to inform themselves about what the kernel.
>
> I don't know if there is a policy for translations about this, but if
> it doesn't exist, then it may be a good opportunity to align.


I'll leave it up to you, Edwin, just make sure to leave keywords in
English.


>
> (Relatedly, machine translation on technical topics is quite good
> nowadays, so if the intention is that a reader may read the English
> docs or the code afterwards, perhaps it could be nice to have a
> suggested way for them to read those docs via machine translation,
> especially if there are accessible/free/OSS/... solutions).


Yes, I suppose one day I’ll work up the courage to use automatic
translations for what’s left. But I’d still need to review everything
carefully to catch mistranslations (the classic Spanish example is “driver”
to “conductor”), though in practice the issues are often subtler. It also
means resisting the temptation to skim large paragraphs and trust the
tools; something that’s probably more tempting with docs than with code.


>
> I hope that helps!
>
> Cheers,
> Miguel


Thanks,

Carlos

