Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96743E9CB
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976074; cv=none; b=mh+ZvUZWHCsaRTRkl8jm/r4qmjoe4qb6EE+3JRRsu4P/Uhz9YknB1aQ8J1uZIc/svff4ByajGDaJecE8J8KTFcLLNwsl1tDA0/Jnf9qX0BO0wmgI59VwzZne2xDA6A0HsOB1wmLieq/moo2aKqI70+hn8fBQf7/4gs7C59tje38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976074; c=relaxed/simple;
	bh=lEPbhkAEccg/+UNfVGbkEMpzyY0mRkY78hs0YVYZs6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyU7ZSwWyzyloXH984VUSTlbG3kpyNVa8JnFMTNJLWzCYKyR+I9EMh/4QxIS9K2jv+W70XtdPg+x73kek/GSdGzQvNhHhsj9ABPlw12eSBDcjYlN+WF1Rksx1rRPXUiQNcTDo3SCMzyIuAI5yxBykdRkyrnpJ21SkFlMB5Acwnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBzl3ulL; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBzl3ulL"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2621198a91.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786976072; x=1787580872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVX3vWywMBNgDR8AdiqyF4jrABflZKPn3lQ44d4b6Us=;
        b=BBzl3ulLRgzgmOdCw6+ZacQbQc2/DSR1uRJYRQoHoLdBzXdLSzcWnWv0Olr+l3oWvq
         0zPY+vMNJIK0uXsktqs63Zrcq3UQ/7EBqUJSH++hn3iycbW9bwf8z8u+RH9TYgeI5Gzj
         l/UNfDLDQhWT355n8j6LT0R+V8I9UQTLuNyvpvTFZ2kKIuNb0cE5ZzGFldCvXKyOjSAN
         1vvjkgET07k8dRaXL2P1Aaj0iwFb210zJO8kUG/CUfaiP3KR1zHEYNkskX6efEB9hCpA
         pHNENxRjtIux5L6gmGmGxE7n09QsKtc7UziQD9V1eMy02UaizA9zx4DtOVzwYaEYUj0p
         NyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976072; x=1787580872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVX3vWywMBNgDR8AdiqyF4jrABflZKPn3lQ44d4b6Us=;
        b=YAgSpu9+R7tX38hp2ThlTFFPXH0XWJpqEHAzrlqiacWeJUwLEYfVSKNsbtavtqbBbX
         JYRcDee1V/KAPqda2zlBrRNdfov9p6rac3koQxyCbL2vnyrGon9WkgJBCYSLF22Uq+mh
         B+49KXQAMHnlhRevt0vsN39Gd3m6JxsoqQ4eNX34xSyf3eyFPyVYLCHWqnzEWNdugpPW
         C9CyNQs7T+7PP/yHS0GtZYE70QuKGtTH2i12ohrxVgufJ15IhuWdTc6szKRrF6/cgUtQ
         RWneHsiuN3hCv8TC1lKHXu5y/IsJ/K2PbrpmYvuwLarTJC9Fp0uPAWKx8TQWuwN6g/oP
         SK9A==
X-Forwarded-Encrypted: i=1; AHgh+RrEgwC4w9uwrVE85NNurs8I/AgGZwOXB5HkXnRR9yWWdqvV1wjEfQxvh2H/icnJqicYheSq6Wngx2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9FEWI8195anFPibUJleXimj4hw+PK+mQLDmAo9Httb7VxeLW
	JTZ1lYuDZFyMqz7M4leklG+rXkEXrnKu6yK7FSEsqNgQBBPgQRK0PQtG
X-Gm-Gg: AR+sD10Xh2Wa5zJbng7Ofhy34zsNUV00X0uSqA6FJKqiPmVQoCIZkuS8H7OleYZjG/D
	ELj660mTa/1QQlTECrkdHnBRj7znGf+9a7SJGnvQID2mPHgD6EctfstxBy5o37V6ArHgYt6Lv91
	BjQVPKtsBbo/m182lyF4NztBo86Pi+QiScntunQGOrUAeicdAd06D2lXpw4atWSAaJ1MvkJqxQQ
	xTrQg0P00nd0ehKtxE8JlQAzfyFUiaW+XFcfm78CJI2k62OoYfc+hCMp3cIhGroktJDSvEiOiuk
	mEhPPetN173VhuH3yhaM2CwcGz0pF99H0Uda1R+9fmPlEi0z8ncivo04S4MD3DTT51Gs7gsWrcS
	8mLfkbOK+T3mfmfpVF7gCGEXL3l+wXYYV/4M4/Be05Gu1kyjlf6jlhWxb0czSWle9sfQdNO3sHA
	2mSOYhpMcSdJvwknjTZQ8Ou79jwVJmSIx7IM+7JqZi5BWUjNuPwovXV9EjbkkWZEkztEULICO2H
	Jk51k6dUTc59PC/Zkb3Cs5rU3osh/gEmb6A7nc+eNTkJbs+/NstwPsD4EaDftMI00BUaui2YhmR
	FIkkpgtv0WLLnA2TG48HQvyungo=
X-Received: by 2002:a17:90b:28ce:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-3933b891cc4mr27074305a91.10.1786976072079;
        Mon, 17 Aug 2026 07:14:32 -0700 (PDT)
Received: from [192.168.0.104] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b8080sm2483192a91.4.2026.08.17.07.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:14:31 -0700 (PDT)
Message-ID: <de38a940-9973-40d2-a4d1-d9e8f43e6439@gmail.com>
Date: Mon, 17 Aug 2026 19:44:26 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: docs: fix dead link to Intel HD-audio spec
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rhys@tumelty.co.uk, rdunlap@infradead.org,
 linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com
References: <20260321140212.5026-1-ninadnaik07@gmail.com>
 <87mrztsjnu.wl-tiwai@suse.de>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <87mrztsjnu.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27/03/26 3:01 pm, Takashi Iwai wrote:
> On Sat, 21 Mar 2026 15:02:11 +0100,
> Ninad Naik wrote:
>> The existing link redirects to a generic page. Update the link to the
>> specification document.
>>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> Applied to for-next branch now.

Hi Takashi,

Thank you for accepting my patch. I'm not able to find the commit in 
linux-next or the mainline tree yet. Could you please let me know if the 
patch is still expected to be merged, or if there is anything I need to 
do from my side?

Thanks,
Ninad Naik

