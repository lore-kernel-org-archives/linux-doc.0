Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9978F5B5D6
	for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726240718; cv=none; b=Ni39NuGdWpUo5d3Y5ik6FmEqe2fRvxAInBeGhGtMQHVz/iYdNpGfXPlRIXJSzJn/N3lc3L/+IFrUHgbMa77P3DyUvoIr4RnIRGMswsdlkyGIVhF73aVOOxEf8B19RxEaEJXvw3P3hUpt6rmOaXDHTEpvIhgkY/hNoj/6zO1hmbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726240718; c=relaxed/simple;
	bh=ofnY92BfWw/2QKucsnWYXMioD0wxXc4P7xS9iiziCDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJlR1avjkZrZiEvKD8wyKT+Ug+fwtyQv9YrffQagY0UsaKwwmvAy4RvBlgMr1MhoPt9L2vwXF0cslaUkuCCTJ7jvknk9BbFAkRn1U3E7/QYz+SRaHtPYOLEtx6PxNw76AKKxen6s1kvFNN5B/NMmLE/gPuhclene+veG7/u//V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Tq6rXw6A; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Tq6rXw6A"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-536748c7e9aso2896366e87.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726240714; x=1726845514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=erENPJZ+5RHEuuZ4KGIlZ8duewTsHT/YiKKhan9XJ38=;
        b=Tq6rXw6ARLaST9Fl0oZQCoJFyd+rkbTnEGL8IoSzM5X86XOB29AOt3lXQu8NwfgBbL
         rBGsi0102AxekSeNA1yJ7xO8U5F6MERbLsXHxADedfHrLJKevwUDx1o1Nz2fxHwi7KRH
         ij3DBML1Mn1U4Aj5U1fstmpVY15j6N+0klkFzwVi3TTUaFo4v10IXvxeP6bK3Gf+UbST
         KXX7U9RmnHAabYfHZaYuqW46GCYQ5LNZIK5eReGrqCyWoihoR6QBGxTGs0rJzR56aL1d
         dTw5khAGrSHR1SzKZJaRfUrqTcBMnO9m6fISWHyB2P/Hbf0WRmSnqLMtLH1nuN9DCu6y
         Sjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726240714; x=1726845514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erENPJZ+5RHEuuZ4KGIlZ8duewTsHT/YiKKhan9XJ38=;
        b=gZC08C0EBgVz9Cpk9KhEiMlro9g90MNqTQtXFxhgTCGvysqVYaV5Iru8Y/lnyvBEPm
         Qd1BVNZbT26v2c3Ha5YpV/kknWPPEo9t5wQMjIx8rZMMOiYpbTFUP/l8RaYinm75APmV
         U6REp85cGD8D/jvxTdpQEPuic4+ECyoiQSuaSrMsUrdMuK4s8RDj5fwxkOmdlTXcnraX
         1yQItGF/QHuX1XEa4dK09Ki86OmxIryRhUGoOdWY+2FJ5CYnopJrTNNWQ1fiFHDb7Tnj
         eCwb57NOddqKqul0lHmiawYHDyR7lKkZEfhsV6SHccUmkuXypn7m6f0A/6WNvgpVSBJP
         DjcA==
X-Forwarded-Encrypted: i=1; AJvYcCUzZYuoy1vRGTw/Zlqn8F3+k9JsQUuTzVYk0HtcAS7+4Jjw45AvwaeEKOcT2cEp3FbwoFdF7oDifJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTM1X220YgND0SnS0uTvNUGihEqdzyXPYWSuEEG0FLuQKXIBW
	/jgS2oc+fIWTqNJpsAXrDz8t6envefPXLccbr6q3HVVJXDuqPpByWnkpRX6Xn2I=
X-Google-Smtp-Source: AGHT+IG1lNEaUhJt5g/N8BT5UA8mh5OVuIjbuvsCvrvD8rUXsejxN4URMYPbo267vlp/W/YFHYcWBQ==
X-Received: by 2002:ac2:5683:0:b0:536:7cc4:1313 with SMTP id 2adb3069b0e04-5367cc416f8mr4231936e87.19.1726240713432;
        Fri, 13 Sep 2024 08:18:33 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c74068sm876024566b.131.2024.09.13.08.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 08:18:33 -0700 (PDT)
Date: Fri, 13 Sep 2024 17:18:31 +0200
From: Petr Mladek <pmladek@suse.com>
To: Raul E Rangel <rrangel@chromium.org>
Cc: linux-serial@vger.kernel.org, rafael.j.wysocki@intel.com,
	ribalda@chromium.org, Adrian Ratiu <adrian.ratiu@collabora.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xiongwei Song <xiongwei.song@windriver.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: kernel-parameters: Add uartclk to
 console=uart
Message-ID: <ZuRXxzjctzwOCTNA@pathway.suse.cz>
References: <20240912173901.3969597-1-rrangel@chromium.org>
 <20240912113616.1.Ic8770cb6e660110359b245808105e5310d3fa528@changeid>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912113616.1.Ic8770cb6e660110359b245808105e5310d3fa528@changeid>

On Thu 2024-09-12 11:36:19, Raul E Rangel wrote:
> The console=uartXXXXX parameter is just an alias for earlycon=uartXXXX.
> This means it also accepts the uartclk parameter.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
