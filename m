Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A641533B6EF
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 12:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539360; cv=none; b=rOBQo75o3SxHzglpr6Fmd4QV4687iel8qHs+fNrzZQKJYvGcMf/IWkZrBrcjTnodnCRNc1uHnXC5jwV6dpBkI9EZI63vUbPJQR2u6+cRiZyh7C1PgCdEmJJhKIpgNpEBnzqeKJAzaOHv9lj8jylozRNk6FabZ3nzpL7ciJbPDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539360; c=relaxed/simple;
	bh=RURiBjnlI+j9ynKopNwrYnMT8OMzIkJJKi9VeigHyXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vxj8Yeammkj2snb8EQ7lZp9rtqyRbBR9XMaxfHxZjlnU4K2evdaSm9BLCVl8HcL3fq4/5ElAF73HLiu3+BCdiljjxdou19sRwGb0IXVuhjwwDbjDz/t3B7RkYhcHkmz7z5CqoPUPe33rjSKZ2xpVrh3EI+hifmrc1cgtN8CQR/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zi3PVK9y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QeT1OknR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zi3PVK9y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QeT1OknR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772539358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zPrY0bCNZmUER75pIwhfEmszVv9c4ThHCZyMPBc/H/M=;
	b=Zi3PVK9yP9i4U6mnVJuKxD1xMwlBX6iqh28BEuM465/IIHy5FInlVzxk9fqqVuKW7CbZQF
	7dMHf82Qqm2grOp2intewt9WDauHsBGhE3OpyvJVd30k3UcW8QoAcM9oFquv1X9HhoIo55
	vaAi2en6DAN9IXE3Z9WRFkOTzZd50fE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-ZtsgvBFJMEawtWFottcXfw-1; Tue, 03 Mar 2026 07:02:37 -0500
X-MC-Unique: ZtsgvBFJMEawtWFottcXfw-1
X-Mimecast-MFC-AGG-ID: ZtsgvBFJMEawtWFottcXfw_1772539357
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836fbfa35cso30295405e9.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 04:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772539356; x=1773144156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPrY0bCNZmUER75pIwhfEmszVv9c4ThHCZyMPBc/H/M=;
        b=QeT1OknRA09d1gDL54GPDKrf+SH6vSiK7U6ziCM9h8AEEFDsYjrJnxP+6Zgc2LLNwD
         LDorUhKF4ICe1IWCOvTooJUbr+oRhc0sPKgD2U3kCenVxlQtvL588qxhyEghruuKp96b
         6s/RKUOmjDPOx5h4gsSkmwm6HzX8yr84hWyup0L9z8GilxuyJgV2mJ2ZvuoKOW8IZWiR
         yqF9panHz6gOVm6Moi5banSidFrZik931ovfwAzrzMRPiZ8TmvzRyFZoy+amjTbQXG0i
         VMKI4POkKovPVD1FFG54XnF4p9y8WnkQHId3ifbTCkyHVdqrisEOynwCjAwmzYGfcuOV
         ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772539356; x=1773144156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPrY0bCNZmUER75pIwhfEmszVv9c4ThHCZyMPBc/H/M=;
        b=TFIAxZdH7F9oCsfVAOCH/ydgu8SW7hgiLBa74920e1pAHrJMK8ubL22mMji7pDBFYM
         HLGjcXVCBv7sM+OLoo3UcSjD0i9PF0RREQY9Kz8LIDZ+vyo3dhRwlNUuxEMQbpx9WkyZ
         wN7LTiLIU3DO2qBgL7jdBWi5oD/1Sq6px1HLwtN5qjMbzqdP7oHd0b5HwT2H7a6UXdWY
         ghA6Kv25DJabmi4cHFMOS9jOtDjHn3I1+OOb+ZavG0bOa3a5P6Lq9uPCTdUF/uAYAIVH
         Qz4G5NfFdC/xL1lYgFsYekHvg8Ge1BTNNbU5j2mj+/00gFrhoXh848w/LlXiQTsZb0XQ
         Q2Og==
X-Forwarded-Encrypted: i=1; AJvYcCU0y74GBc9C4M1lXubRuESK/EoSgjORUXJBQo1yYwG4MhNP5bTBNmu0d2az3E1OykU09a4kGdTMzkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLGaOBRNCbXv5PIM0HDjchRAGV6JnY7Rv8wFMuENa8tglWAnLz
	ZxVhbsZI1M5Xh7bcBAZ6v7gC1vVLws3CbXxqQZXtMyJiWEhNGzs/wG3TZyGqvCyRZkvd46qqq6u
	lAaqxQdAmMbNMirTD3bdiCHbUImlAclk5mJar5So0z+meLP9cFpGVd2BRIHEY5sVnhhqHCA==
X-Gm-Gg: ATEYQzzbdOEZY+kdx0YIAA9d0Fx9/5ejbidRD4wdTqp/qhoBoCsKyVpzn5+SW6PULU5
	pS2lDxW6BCHyfTe81Uh5bthqK4Vozngj6ahjvuRY3dWJ0ap3BZ6gZEVGdJ0g0/XvKXRlD8W+WLd
	RWFkdyAHVyIfy38s7uQt58tdaEBXSDArB3jo87gN9ZaO1dLclpdbeOA8cygisO1KlDrvvV8YJi2
	hI4cUvWH3E4G2JcVRMrbqACkXdcPstfcT8K1QugcUgiCy3NDFwv00A3bPb0qnkXtB1mRHNWchH1
	GbFRNDhEr0rcT6RZ17nbAVM+H1u4dAEKOXGJzow0l+qBXnbR0SvSZu5vmvnbunHl3lb2BMIbkTE
	awCtbD7rCrt4VBe7bXJYStVXrdguiGUtTTfzMNdp/+8z1RFeG4UM=
X-Received: by 2002:a05:600c:a086:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483c9ba3ae6mr292510855e9.2.1772539355895;
        Tue, 03 Mar 2026 04:02:35 -0800 (PST)
X-Received: by 2002:a05:600c:a086:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483c9ba3ae6mr292509965e9.2.1772539355337;
        Tue, 03 Mar 2026 04:02:35 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.73.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125bbb48sm24956855e9.0.2026.03.03.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:02:34 -0800 (PST)
Date: Tue, 3 Mar 2026 13:02:32 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Tommaso Cucinotta <tommaso.cucinotta@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: document new sched_getattr() feature for
 retrieving current parameters for DEADLINE tasks
Message-ID: <aabN2DpeZOB0IFdR@jlelli-thinkpadt14gen4.remote.csb>
References: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303104215.1324243-1-tommaso.cucinotta@santannapisa.it>

Hello,

On 03/03/26 11:41, Tommaso Cucinotta wrote:
> Document in Documentation/sched/sched-deadline.rst the new capability of sched_getattr() to retrieve, for DEADLINE tasks, the runtime left and absolute deadline (setting the flags syscall parameter to 1), in addition to the static parameters (obtained with flags=0).

Looks like changelog wasn't properly wrapped?

> Signed-off-by: Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> ---
>  Documentation/scheduler/sched-deadline.rst | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
> index ec543a12..03970cc8 100644
> --- a/Documentation/scheduler/sched-deadline.rst
> +++ b/Documentation/scheduler/sched-deadline.rst
> @@ -628,10 +628,21 @@ Deadline Task Scheduling
>    * the new scheduling related syscalls that manipulate it, i.e.,
>      sched_setattr() and sched_getattr() are implemented.
>  
> - For debugging purposes, the leftover runtime and absolute deadline of a
> - SCHED_DEADLINE task can be retrieved through /proc/<pid>/sched (entries
> - dl.runtime and dl.deadline, both values in ns). A programmatic way to
> - retrieve these values from production code is under discussion.
> + The leftover runtime and absolute deadline of a SCHED_DEADLINE task can be
> + read using the sched_getattr() syscall, setting the last syscall parameter
> + `flags' to the SCHED_GETATTR_FLAG_DL_DYNAMIC=1 value. This updates the
> + runtime left, converts the absolute deadline in CLOCK_MONOTONIC reference,
> + then returns these parameters to user-space. The absolute deadline is
> + returned as the number of nanoseconds since the CLOCK_MONOTONIC time
> + reference (boot instant), as a u64 in the sched_deadline field of sched_attr,
> + which can represent nearly 585 years since boot time (calling sched_getattr()
> + with flags=0 causes retrieval of the static parameters instead).
> +
> + For debugging purposes, these parameters can also be retrieved through
> + /proc/<pid>/sched (entries dl.runtime and dl.deadline, both values in ns),
> + but: this is highly inefficient; the returned runtime left is not updated as
> + done by sched_getattr(); the deadline is provided in kernel rq_clock time
> + reference, that is not directly usable from user-space.

This looks good to me instead.

Thanks,
Juri

