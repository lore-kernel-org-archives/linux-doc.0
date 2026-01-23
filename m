Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D942BE04C
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173502; cv=none; b=MgCilE5KJl5FbHFZEoA52K5gHoX6rVrps6iJNN8FJqbveaf3Fg79v9Gl+4aQv/igNSduC93FX2/ajVYZfYBF+YoQdXCn4HvkXMeAcwxaK6Sku3GN8ORrg8iGCrV2EqK+8jYbQ6gl/OUA0KZtb8aFKCuLGjCPO/bDsHB6MZ1QEuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173502; c=relaxed/simple;
	bh=GrQhLX3qJ4J6w45Jm5Htv0xb4L4VHCgdyRzGiiv5elU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnTQo9/lHWTIGVjfMIBM5v0WIAf80Qa+KF3DbSQZ33PTa6HZjK3ZVQCei/0HRqR+kAAmV/qwG7Dpr8R5dbG1rx9vYeLVQTWM4lvhCsXaS1S0834del+i9DfRDnUWPZ6jN1xcYCH+kWM0jmk43XcDlOZtwdY1y+C5d3U0/WUQDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBDiNn2p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tcN08sAT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBDiNn2p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tcN08sAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769173499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bjXPIm7SiNqRIwsRPBl3ikwBN8vOPh/MFbWuMjNL3IQ=;
	b=SBDiNn2pXlZBQb2HCYIrmiOlKr8jI6EuE9BlGYpcXA1LnSTTfef7BPurY8+IR3b2Lcyh5V
	lIEnG8i3ppqkgB/OTcYyX+NJH5LSZCPzFygypJDCHRBBbd1TG/Yf5go3UvU0Tj2uG7KgJc
	moy5epslB952uR8r7R5fB78LtlasVOM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-2A2RA6LYMPWtqmEd2YH2bw-1; Fri, 23 Jan 2026 08:04:58 -0500
X-MC-Unique: 2A2RA6LYMPWtqmEd2YH2bw-1
X-Mimecast-MFC-AGG-ID: 2A2RA6LYMPWtqmEd2YH2bw_1769173497
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47ed980309aso21289855e9.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769173497; x=1769778297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjXPIm7SiNqRIwsRPBl3ikwBN8vOPh/MFbWuMjNL3IQ=;
        b=tcN08sAT8ungT+9vBBrfHGru2Dqc7DxPPfj9todI93TaksYc8whEm+mv/KIs3Y6DWR
         dXM/sbnDKCiS8SNEt5JP4pLesi55ZoEXgw/MC6G0uhQw4odjKmyZmB2Tp2Ph9g3gwnRD
         8oNcsdLciuc6xsPagAZdeHR3iBnj+g9FJviDDbZaZujluIBJkhiM8XoYDyBgFucqA5qY
         WF54V1xRUHUR8GT4w/XGzxwnQIK81jBN9pqi9jaeMyoT/g5tLieXdvlKBD+L/ETdU0DH
         JISKlPTAM4p2dWqVwq5sph9PcHxKoS/eSk22Et8bHpsfJiX18lvLrmrwe3v44f+SHNjL
         s5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769173497; x=1769778297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjXPIm7SiNqRIwsRPBl3ikwBN8vOPh/MFbWuMjNL3IQ=;
        b=AtmIi5c9OJYaCuIUujdehrgbMjGD/UWOmLeSs9ykBjxIUSA91e7VYjzfIfeWCyr4XR
         CSpE0WbUQCutRNqLQYk3NaYgrK2BtmwAF0og48rm1xYFL2jExwh1VOU7sl8EZr+cTizA
         mhg1bK0OwJdEMlCEO1+TeVzrjwZKqooQhSmnceFnIuunLfKj5MPtCO7iUZ/gLamMTmGF
         grn0HZ1V8uVkVEe/4c3k4Hc6Vwp/G7gUUNY1cNjAVT/2cxSQU/jrwI5gQxPQeBa5SLaa
         mvfm4+LO5R1YQ8zLHfVaJJy7lHYQINSiwIkq2Q0HSCCb6bC2WdUN9HvGl0yXtWUarN5d
         PU1w==
X-Forwarded-Encrypted: i=1; AJvYcCUAtk55K6MoK0G/X5OFfIaNQj/nCQFhiM0SIzsegm6E7miuGBcUGNTpI/UHX5u7+3m9JACFTtxeEa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHnGYT1kyIeysj3KVnxPoNLD19jEw6nyv4gdJiUbKc7vSJZKZ
	lpUvsA7h5QXeZ15C8yRKG0NC873t2+WkFYC2S8tVRxZI+croGzUQ03ayIBAWwYcelA3nByEbwt6
	9urDBjKeUJnHIp3T7qwyR63EPW+6UT5m9CVB6YA2T+IabAvcZ+L9b6nj4qxcpEQ==
X-Gm-Gg: AZuq6aInLIoXatveN4DrtQAImHip6rzyrrhjCgUJK9OBX1JWZY2wVY7wacmqFAFMQJg
	MtBsDwIiz9YaKtgs87hhWhfAUR1GrJSJIadCxRTc9Nj1WCGA7vsRysoNmqgx0jcY6zlKznarnS/
	4R3LWlThQ8+X6BzYV99v3+2zKEqMCvSwRQqRJSVMnWD50tO5G7ZARRpEiTzHxhuB8gnyCC7g5MC
	R8843U7KmhS8FDtz19kXA9OtDgLLhlkivXpNY+XCmU6rjgfpmWPy7Km8/HOrX1aDmAYeX49kwTl
	tz/EB3Y1OVLQo+yikmzQ28Gps1RbWE1cpvlBzlP/YxE1w+rJ4ItKT31BGreJlqYYoyrdgEZpDvu
	iApi/Gc5pPoOLJZXHyO7lvgVaa8o7XCkBVuEvb/Ca
X-Received: by 2002:a05:600c:3b01:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4804d2b1b02mr44399305e9.4.1769173496819;
        Fri, 23 Jan 2026 05:04:56 -0800 (PST)
X-Received: by 2002:a05:600c:3b01:b0:47d:403a:277 with SMTP id 5b1f17b1804b1-4804d2b1b02mr44398825e9.4.1769173496416;
        Fri, 23 Jan 2026 05:04:56 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.129.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm6586425f8f.17.2026.01.23.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:04:55 -0800 (PST)
Date: Fri, 23 Jan 2026 14:04:53 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v5 15/15] rv: Add dl_server specific monitors
Message-ID: <aXNx9UUpAx2enihK@jlelli-thinkpadt14gen4.remote.csb>
References: <20260122155500.362683-1-gmonaco@redhat.com>
 <20260122155500.362683-16-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122155500.362683-16-gmonaco@redhat.com>

Hello,

On 22/01/26 16:55, Gabriele Monaco wrote:
> Add monitors to validate the behaviour of the deadline server.
> 
> The currently implemented monitors are:
> * boost
>     fair tasks run either independently or boosted
> * laxity
>     deferrable servers wait for zero-laxity and run
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---

And these as well look alright.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

