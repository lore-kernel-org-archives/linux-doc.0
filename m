Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042079;
	b=GenZu6IUhItEUqQzUiumtSo1S6ZGJqCo8GKhUi4C0Ish8Dj4soG9nlLhr8P8AKElisM+
	 JL0U/iFHpPGwybVYebHXEvlN4WAWahVHtdRMQH7CD4cZ/kgMYb42AB0Z+zapVdehWWeGh
	 kyAcdr5ZmNj0YOAbfrBrtXDNvZcSflwCmKNEBjwODh09rdd/NutHalXbeDRlbj/ihVoBe
	 kpYeHDDwCa/sdX6AgwiW4qZjpMiFM17Sogh41s4S3vUI/amGxDyWW0MMLkTwDW5Z4Aasi
	 sYm/JEGc7mqNbrfoDplmoo98ZVWTLFM23IkVsDOnuz5Ol9QqsCWlDxaehkcZmN6W/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
	b=vXJhEmbhROXbdAaNpYkhUc8qckw5arc23i1ExCguPbKaKbRlQABs8drqBOL1nBWSuksB
	 iAfxtJIowJ/RSAJWAGj3f6V8M5d03Gygv1IfMcubaFv+2dlryLcJctNGe4ibbyoGh5wc8
	 SDC46nnEH9IsdMD/QkO7QWFv2DpWKkCE+LeZJ/xNmjG6Djd9YjGxsAyHZe8zX8XwBSkNI
	 LDmVu6+RmaMqWowqYi0Wer2OA3tya61sir+6nUrko0V/NGEPOWsgLV8MruFrOHb80rXww
	 TnsYYaohi5IgqGvQdfdGzDM/uLg+riV7mpnA/o+gxkNbgy5xduBJtv8waGZMr+p1Sfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k8IAvO4R;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C80606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 19:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k8IAvO4R
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so7783009eec.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042077; x=1793646877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
        b=k8IAvO4RvXOI4qstAapQi7ZztKLiZvS5iYhzCyqZlUyegpcJPXdEfn3HNC+IByLvLo
         2QcUsv/9AeemW48Rkcen+gEew6+zLRnsIbBaegLEy9Rxwah1P/GDv79WiHPZVHk5uwyx
         qtGVsofaF0s+TydBCzoU1UNRIWJ2lpzvJTRjr01tOZvUyylQGRuTcNxRJkLQlitgj942
         sPBxSxAlG1A4LssCZ+83sn+WhxGBbVc+Rg8+XA5OLbvAkOn9gaYCSMyVAvW1gV5R4/Nq
         UD0VZzxhPTODb3Fsle4SoH0Q0z+H6H7hpnNjWJiBSQNZkYEedPYZHlCz0P3Mi2ndcGB9
         K5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042077; x=1793646877;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYd1AfKqcl+9tRJkqB8FFaIjzuEdllawIMWqWesHJnA=;
        b=l27u3kejdn5ea1Ul5Pl9TH469KJ5Ev76/l7Iw+auB4YLAGDO5UVQZpOvkxkYgJho32
         1sKo57spo7uUydUN/JY9Wa6wD+z9IfcRi48CpOIiYS2plERHr5NPZaMrWHszHQd2cXfk
         AH5uV4eHpIRp2jkMvgGQNkuT/vpNZm+U1sQEVBZJobTyDb+8dxy7O7hV+KqrY8gDL+fL
         jkBo8AQthlAWCl4csqqxUuCnAt/8vgzsfj8lFoOHCCExD8/kAVqT5xAYU6f6pkOaBe5C
         ER+1MdlNCPIjczr+P7yPNwmGqrDMkIW/Y/1OANhi2DJ348N2MDh4PXuvGOZySnYdYapV
         SVPg==
X-Forwarded-Encrypted: i=1; AKwUvBwm/28x8Seh1AJXQ4LaK9pjhUlLSomjvjg8wQjyWvqpvhcK5fdsf45dvUeRrb50sUnr704Ii6g/E4c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVgOAiZLAMRxIjH0pk3SFcN+YlEmipz+JuvxSBvqhZYIx0aE1W
	ZsI9fNvmVAWeX+n01dwoJByXO3C1/MSJfgddR9CWzpaSjZeqiS9N1n+p
X-Gm-Gg: AYBFou1sc/jrT/16g7zbMYLAcvx4vjnEo1oAKCdWeu7sbczIvMIpVsd+BhAcNMmTU9Q
	km6WUziS07E7NNWcy987RLNWjnzPuMZLZiRNVwpkqxou2eEC8B7Vi4HEmjUrvhwYcclrSr6VAiC
	8hz2dycgfou5ErtFRXfOuNH8KHr0HPmA7wnPcDmQ7Uou+69ZSEXL9Gt8DJ5yYCPmFY7L6zjgkP3
	7HLwr4TzKT/pY9gnorkWB4RclnjlkPgldCfHYrNPyU1ITJDQLpaED1OTEuuFw0bnIdsS2dI6XFO
	urvXMoFnZkZWwYF0EV/fI2p+VRljqYCmd5ePCmjKgdtMoilYFwyzX++DfhpAUHiSKBut94jWEdg
	bVhxcjuSi0IjXptchhJbQspeoBvhMD2HuWGCG99vmKzBLaFemSeLsqbd6KpJopHhZM/kLjd07dd
	F2JGik/0i3+Rqtg5CKpgL21r347Y16DfPvwtjU0DjC/q9h++q5v2AgV9AzJE7QCn60rtu1xeu+I
	dBeNVshpPnWnmiFiPoN1ttAjW5zgCO9ZCnaySulo/32s2cCzFyxzrRg+Ju4gs8+QEGeEg==
X-Received: by 2002:a05:7300:471a:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-369e8b0b5acmr12248693eec.36.1793042077191;
        Mon, 26 Oct 2026 12:14:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8afd64fsm31480019eec.0.2026.10.26.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:14:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:14:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6683) Add fan control support for MSI
 boards with NCT6687D-R
Message-ID: <c302d22e-6ef4-409c-8f9c-28922afbad59@roeck-us.net>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-3-someguy@effective-light.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004153250.516730-3-someguy@effective-light.com>

On Sun, Oct 04, 2026 at 11:32:50AM -0400, Hamza Mahfooz wrote:
> The fan control registers of the NCT6687D-R used on recent MSI boards
> (customer ID 0x20d) differ from the ones used on Mitac boards, and
> changes must be made in a configuration phase of its fan engine.
> 
> Add fan control support for these boards, based on a reverse engineered
> register map:
> 
> - Manual mode is selected with bit (channel % 8) of register 0xa00
>   (channels 0-7) or 0x80f (channels 8-15). In manual mode, the duty
>   cycle is set with register (0xa28 + channel) (channels 0-7) or
>   (0x260 + channel - 10) (channels 10-15). Otherwise, the fan curve
>   configured by the BIOS is used.
> - A configuration phase is requested by setting bit 7 of register
>   0xa01, and is entered once register 0xcf8 reports that the fan
>   registers are unlocked. It is completed by setting bit 6 of register
>   0xa01, after which the EC checks the new configuration, locks the
>   registers again and reports whether the configuration was accepted.
> 
> Fan control is supported for the CPU (channel 0), pump (channel 1) and
> system fan (channels 10-15) headers. Add pwmN_enable attributes for
> them, with 1 selecting manual and 2 automatic mode, and make pwmN
> writable in manual mode. The behaviour of the driver does not change
> unless pwmN or pwmN_enable is written.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Applied.

Thanks,
Guenter
