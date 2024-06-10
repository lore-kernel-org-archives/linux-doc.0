Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF41F947
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718045047; cv=none; b=kloNkUV8VDpB5+f7RVSmJNmdxyWAAVVJXfGXO36A3U0IKV9nj5lDvvXz5e9DG893NS75MQFreffTOwOuoX+uy+Z1DnQv3T++pSWKsFgXk8YXq3Ni/U/5UWlgVyvAMuiLa5q01a2BYlK6nCyFJHAbrj00B1B3fJXpjV2gUBUfNBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718045047; c=relaxed/simple;
	bh=kQX70Vy3SOzj2SJ3a85okwSkELfOHYhjgBnx5jtuHIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4DhMyRvB+5N9Ev/2iqI2aXfYFeBorOoSBTrvJVq1Ws2uRbDh+GwPfhk9TL4SPpOqLDUvADtW9S8A9lcfz12TfWIO1ESE6keZsn56AeOpedtrfJ30ZhfjH1lWxlhcIKLGnrv5BlhhgpObvPnLNM5DeXq7ZREDjWImcYsoMr1HfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDJC2Uq6; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDJC2Uq6"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d228309540so831812b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718045045; x=1718649845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1s9iVaNzaT5IXDVjf0WKwEojIDLRNs248U5XlwshvbA=;
        b=hDJC2Uq6WdsMeuZVUqwHX6MWDIsFfdpMu5zeuRBsljYUurWQm38x9r+PVxfPwq7gv9
         RwwDy5OmN5q5jtffR6bKEDIi+EftGM43XezdBQaBylxmEsHf2Zp0EZ+MUSKM1/T6taks
         dRB2kUMc0AEhbktdNCoPxT5T4Rv2tOtLsDSEeGEVzzuc96oohkD1Lk7tVPN33on/Tz1D
         prMdgcNkMjyCv/EF0TUXQ7sLbA5do3WyrHyV9m0R0zBVTXxVwv1xoZm7dYb6MhgvA2kN
         8o79FvBK0GRXUGFV/BLm4tbQDyBci1Ha9WzCFVTZkmeD3fGFvFXnhnk4sMyiPjmkPQqD
         9VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718045045; x=1718649845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1s9iVaNzaT5IXDVjf0WKwEojIDLRNs248U5XlwshvbA=;
        b=iw76Hpa6f8ThZUu9PP5NsqD51IArBzptTGnEcfDTN9X2W4foLEp3najbeOYsKQ3iA7
         e/HXbH8Dgvk3jvaujIFOegVzEhC+R3Tw0DidSQZ7TSPROJeqxpEvEjGuxZY1UanpiXjQ
         xxgwDg2myHFxN7hAKKXDTvAVvpn7aZl3O/R77EboP6s0fwXzU5W7Wn03HLknJEPj1iQ7
         2eT6Ha1cORbAByS5rj3Y7MaOex6rv6MXbTaefme2Wv/z5rBvL7yDITogepQxgSURzpaC
         vRfof752oilcdIGfQyNG/IViy//r04LSwBP5lDkxV8DboVKIMhAmt6NqatP6eSt74qF8
         wxRA==
X-Gm-Message-State: AOJu0YxOT8/4Do8MB/poKC9+zd0JEZPfbe+W9sPiWppXe1cQAMG/0qLA
	EP2G3rkR6MMlvYGtmM8IZU6XiQTCxNVm3kLlSg3c5hg6wXxJn8dq
X-Google-Smtp-Source: AGHT+IFTw3mY7VUrG+X4Mo0FOM+Fnh8Fj5RGPLubwdXto0gWn2PrPMNZ2NB6Dr3iuFSvGUOmso6B+g==
X-Received: by 2002:a05:6808:1482:b0:3d2:238b:7a6e with SMTP id 5614622812f47-3d2238b8adcmr6640784b6e.54.1718045044977;
        Mon, 10 Jun 2024 11:44:04 -0700 (PDT)
Received: from [172.16.2.84] ([136.49.128.149])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d222fcb693sm694974b6e.32.2024.06.10.11.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 11:44:04 -0700 (PDT)
Message-ID: <44ed000a-8dd4-4dde-853a-2b35fffc8c9d@gmail.com>
Date: Mon, 10 Jun 2024 13:44:04 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Translation of kernel documentation
To: Matthew Wilcox <willy@infradead.org>,
 Matic Urbanija <maticurbanija@protonmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
 <ZmNbSZglTdsB7aTv@casper.infradead.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <ZmNbSZglTdsB7aTv@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Matic,

On 6/7/24 14:11, Matthew Wilcox wrote:
> On Fri, Jun 07, 2024 at 05:45:10PM +0000, Matic Urbanija wrote:
>> Hi, 
>>
>> first of all, I'm terribly sorry if this isn't the right place to ask about translation. I sent an email to helpdesk but so far no answer from them.
> This is the right place!
>
>> My name is Matic Urbanija, I am a teacher at Vegova - Upper Secondary School of Electrical and Computer Engineering and Technical Gymnasium Ljubljana, Slovenia (https://www.vegova.si/about-us-vegova/). 
>>
>> I would like to translate kernel documentation into Slovenian language. Maybe some of my students would also like to participate.
>>
>> Are there some special requirements or procedures which have to be fulfilled before starting translation project? What is the proper or recommend way to start to translate the kernel documentation?
> Start by creating Documentation/translations/sl/ (the iso639 code for Slovenian)
> Add an entry to Documentation/translations/index.rst
> Add Documentation/translations/sl/index.rst


Your first commit will probably resemble this:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20240607&id=444064185df7c4b0f7bb41e25b1bb197a1e4a918
but, please, don't add yourself to MAINTAINERS if you aren't willing to review
future contributions (maintaining).
This is a fantastic way to introduce your students to the kernel
contribution process. Note they should at least have a basic understanding
of operating systems and low-level languages (mostly C) to translate
effectively.
Feel free to add my email in CC in future communications so I can help.


>
> Now start adding documents ;-)
>
> You can send patches to this mailing list for Jon to apply to the
> documentation tree for merging.
>

Thanks,
Carlos

