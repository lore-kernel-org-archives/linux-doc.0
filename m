Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710187;
	b=rUUhe33LN7q8GI3DAuIxKAZ25G4dDkekr4OB9+jJXrmpySHkwi1VJNbbzal7r06E5t0o
	 Nct46Rz/XPRp3U66OIMDC/nHIwm5y4cy2ShkEjZ01mtQ6oaMcWw0p3e7irPNwP4M3nf+1
	 10F/BVPVyBZjPcYcuFjZK4Ic3p4Wj8eI5Ih5lsqHL5z1zoNEIWvV4ViGqWi8zB6ZMY0Ea
	 aoOFJx0Q7yW3B0uN4nWtPtqVEbFCdbcPUusTwTWmbo/ucv39ZgGZQG0YbwvQy2C0m9vVa
	 wNSKgjp3ag+UcpTDer4n3L6wTH2UPHnKp6iPRrLL2aCJV/KWZUDnwFn2WUMbspobkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710187;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
	b=34gd/y7t8oh/F7ecqRdlJVU2DBabtIEp695aFUwSQZkul6LrF3bc+NZI3XZk3OaAbQkc
	 Dw92vhGLL92iRGVPjt481PGIk09ErLRQ+PNPUyuNkS+OOUNanqgLqddakVmBAkKtTvOy3
	 plZcLnzn2c3/cB0m+i2xlNapM/WTtiJtBDlXRCYGLTPLrNr2nCUnklBFUxaivoZDD+jgQ
	 96efPZOAL7hdvLCxx7/auEQw7ZKBBmOkPGfKKHW6MGJVWmmbHWp9qLyO/8AXBy95dedY9
	 tC4unpsyEKo7GZsPSVA6fi0ERAYjh2DQ8t3nF6qMKyK5O7OXHMVOkqiUFf35b0pQPAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFqwHaIC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xww7JLoQ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA7606D81C
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 12:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BA7606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFqwHaIC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xww7JLoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793710186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
	b=FFqwHaICct7QSwW0MYlBXJYNLiSGf/Lkxoww3ILpHDpkKGKpDBSCblGXbBVA8Y+SEkiPrl
	kGRrGwZm4yuL5JGM3qNzIJnVEb+VI873zD5wh2aIv0X5Dxi6KTAwmB3Y+x/CeebebblUXE
	bUqSORcltwzLWtBAbjz7aG5VcVGMhzM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-kmm2i0fKPou0o6zXwIQjYA-1; Tue, 03 Nov 2026 07:49:45 -0500
X-MC-Unique: kmm2i0fKPou0o6zXwIQjYA-1
X-Mimecast-MFC-AGG-ID: kmm2i0fKPou0o6zXwIQjYA_1793710184
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so8487635e9.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 04:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793710184; x=1794314984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
        b=Xww7JLoQMeMT0Huf7Hi/NXKYvB12byum4d8AkaunCDsvtr1fiQ6OU8UVKa4Weoujoe
         FVWcwa+A9Tjf4Ihz2OAgsjh0ML09t1+i4kArRCa2ToN2uggyc14m1PCQt889XeS+OmSd
         ylhDzvW+16k/Vq0RHhjZGT/YROWPzWlvBJZbihCllk9h/Nb3yhdAsMCPUeGWkwe3GL5T
         9T8TvmlavoTkgdQQNr3SWdszdiiKn/NgsiXiMVE99OuMETWEKVb7gBImpDeQcfSYbrMe
         PxBCukwxgkqG7fdGRY/ttjFpBOd/Oux5DnG9ehYzZWu4KSR4aQ0L6wwKGA9/sBGjXPV7
         2thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710184; x=1794314984;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myuQnKOqiP9L07B+scEBOciTR/Sw8p8F06G+sEEbi1w=;
        b=wt3vDoJT1Y+rEVvWyQUB6FeQcAhFeehWWw5o5qRTniiBWM1lqPDv7mPPwsc3dEJJJr
         cxSnVUUk5uGhra+TCd6FXfzZKfLadOqTz23knFlcjWSqUIMrN5Bz8jzy3okDd6X3hUSa
         6zY6oX+r28xNxk9fu6K5eNfL2auetP2gdgY9scCKTvDuVaMM11YFtzsls96CQsyr8lcO
         zEGapMl0tzTmpCmsLz38eO1BiNJT3F+AajNUD9A5xHTGuh93zNCrDqjiIIoNKyOn1BTV
         bHioDNsoQ0cBCBLtGpYQb+TCM33ACvkjWdpGTz5xy468fRk0XsNSLeErbObveX0TolDu
         18MA==
X-Forwarded-Encrypted: i=1; AKwUvBws4g5BIvbZUyFME3nuAro2VAnRlsS66Z3m4ZJAo7E1CJskEwRBiRbqY4dKP7NByDfu7xZi+WpKd94=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N2WSlgrXWiGXoAzJoyyc655FY/r7z8cMNCUQm0Ps/oR7nWL7s
	IP28CAUP2gqa7e/HpXmRdbLb7oGeDd8Y34DfphUF0zMeJtLbrg5K9a3LfPkSeFUmEKlgbB6CwUr
	BFgjH3hbD6HmSVUsPn4tTgbkE/DXYfgg1SjSPqa+YxDn3+NAiZ60wFKb9+jtoKw==
X-Gm-Gg: AYBFou1wcmBBSgl2HHgZz+6a2FIJyoCr7wV5InHG6MBqh3klJMLJitcX09xF9FJp66i
	iCQsnCU2lGXAM48X0ZbDYwkuVmeoSEvZKur95ivm+ywrgQ4oETcFYoLvutRsneI/IuY48+Ca8qN
	mZ1Qj4DDsF2AkhrI4509pTc/Q4Zsa0ugOYYLf+XWspXymAPmSDfbITZaXUu4oa6TtBqkqos/F8J
	Pg5TMz3+9Ei1Aw+GQOt2K9saaakMbn2k9bbxvcXsZujJgccTB0Q2xCmoRaQm/l/dJCn6R+hfMdG
	7Tr7L4tTeYwys5Na8/BW7ElHelNoPwWgABT9M/zi6qsIxbIdlJdDy3BEBIYKVwxkoxkQE8K1pQ4
	paJiTomstKl6Po1h54pcweFKSIn0YjHTmfK/WJkiOw2Q1fA==
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr299088105e9.14.1793710183976;
        Tue, 03 Nov 2026 04:49:43 -0800 (PST)
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr299087755e9.14.1793710183537;
        Tue, 03 Nov 2026 04:49:43 -0800 (PST)
Received: from [192.168.2.75] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm247611225e9.2.2026.11.03.04.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:49:41 -0800 (PST)
Message-ID: <cc1e3d99-a96f-4589-8541-5c8b9fb509b7@redhat.com>
Date: Tue, 3 Nov 2026 13:49:40 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/14] dpll: add a simulated DPLL device driver
Content-Language: en-US
To: Jiri Pirko <jiri@resnulli.us>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261103093910.596225-1-poros@redhat.com>
 <aunT5wlkgVJ9xyTb@FV6GYCPJ69>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <aunT5wlkgVJ9xyTb@FV6GYCPJ69>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/26 1:31 PM, Jiri Pirko wrote:
> Tue, Nov 03, 2026 at 10:38:56AM +0100, poros@redhat.com wrote:
>> The DPLL subsystem has no in-tree driver that can run without real
>> hardware, so core changes and userspace tooling are hard to exercise in
>> CI, and the pin-on-pin and reference sync paths see almost no coverage
>> outside the vendors' labs. This series adds dpllsim, a simulated DPLL
>> device driver, together with selftests that run against it.
>>
>> The driver is controlled through configfs, following gpio-sim. Writing a
> 
> Why not debugfs? Works good for netdevsim.
> 

I did consider debugfs, but it does not fit what the simulator
needs. The key difference is who creates the objects. In debugfs the
kernel builds the directory tree and userspace can only read and
write the files in it; there is no mkdir or rmdir. In configfs
userspace creates and removes the items itself, which is exactly
what dpllsim is about: you mkdir a device, mkdir its pins, set a few
attributes and flip it live. configfs also gives me
configfs_depend_item(), so a pin cannot be removed under a live
device. Doing the same over debugfs would mean inventing a little
command language in a couple of files and parsing it in the driver,
plus handling object lifetimes by hand.

netdevsim gets away with debugfs because it creates devices through
a sysfs bus file and debugfs only carries knobs on top of the object
model devlink already has. DPLL has no equivalent, there is no
netlink command to create a device. gpio-sim went through the same
decision and ended up on configfs as the replacement for the module
parameter and debugfs based gpio-mockup; usb gadget, pci-epf and the
target subsystem use it for the same purpose.

> [..]

