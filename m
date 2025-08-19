Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E7315769
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594884; cv=none; b=lA3nMtz6VRLa4VS9oy77wluc8LPQrFBh2VJqn4gqa13+xTwzHCwt9h6QGM+J5hz4O2tRqcQoSiFw/UTujOvCxftf2T2muiaa+UTsFPF9MwgjOKc17wuanfqBz98zj6Bmc66i/wUWsQvwBICUz0llPQleHsuXj7xIWbqsSk3xRzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594884; c=relaxed/simple;
	bh=IoV7WBKUuYn16T6F/r3wlHg0NlMpdOlWlmfnqLYAMxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPYv2gN9orLCDe64ON2/eCNyteowJJtfBj2Z00FimZ2rI3HNUBgZ1AbEPI9izBEU/lS0+p35jSCllBIHwmimpjWRI8yw4lkp3WWZJB46gU6F1PeD8TqP5lYmFxIJyNkThlEU+k1gAHzR9D2A6dkqUv72B8pVUGY+Ay/8KXDjFVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBYpGrRu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBYpGrRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755594881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WBft0XKYlUGliTx+DSLRnykfjvI7iBuKLMaBXeDuquI=;
	b=SBYpGrRurGJoXgQUCMdBg2Us+Mp2zXIws+GymozndGclrTU3CeV8gwDBS6bQmBN4T5TZ2f
	6RfhP/mCxNwjcpcS0RaCoKqrNgtmQ3ZyiqbKCEqyp8vl/k72fqMB609vxCHDbrecoNR/BZ
	8t3237V+CK+9jqptduW4ewen9BYlAiY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-vTq5azoMNgWyLmf85KsFIQ-1; Tue, 19 Aug 2025 05:14:39 -0400
X-MC-Unique: vTq5azoMNgWyLmf85KsFIQ-1
X-Mimecast-MFC-AGG-ID: vTq5azoMNgWyLmf85KsFIQ_1755594879
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8704d540cso592862685a.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 02:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594878; x=1756199678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBft0XKYlUGliTx+DSLRnykfjvI7iBuKLMaBXeDuquI=;
        b=jAiM15ohSbEmplbWZjGVG7bX7Y5rcZwk+KO9DVR/lb75e0Zu5izMNCHK2utWjbTFp4
         GYavcBmFhMpb3L0yLqmEPnpd43nXhEArpymH3vE2eQBJ+isRM74Qv40nrlT6CRZIn2oB
         BmveYhn+FvEnDrQr1e9XOROKE9V0ySt0EZkoaA/aJnUWgrAW8nFtD21MazHn2yMjS8or
         Vph0olS+rDNkfRN8iL27MdSB4Nm85/7skiy5TiUwWqTUQbsYySYL7vumRcqD5B9eH2Nb
         pDHuUouua4ZeEx4hZ1oW8uyVG727xD+ebPIxKHvXFhNggMo0UefSoheHzKzRcccbX0lh
         9NYg==
X-Forwarded-Encrypted: i=1; AJvYcCWpI3w+UDTB2dplzGdXlKWzMhBpjAwg3pZjGQFk6PSAnAgL0YRLwOoq+rEmye/zU8N2TuXEhjH/Sy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhqdid6zwNXmxvvNdWVwbaS3tPsLuKZeSrJGawzA7oXb5ADF43
	+HamOFT1fK/m9T1uXkbwssGNZ8aFllzT2eXe1cyBmAjMYP+0OBAFjMAZCxubYIEjrUIXbD6Vh4M
	FzPp3o9KRcrSPhDw+I11XRxlj1Zm3oiwjZtuige+GgFt/pFVDvU3I7/p48/G2Hg==
X-Gm-Gg: ASbGncurMgzRkXPAc5nBIRoQesrni/Dl3yrixuEXV3GaH91PqwiEgSqyXP0cnlHNOSY
	LMp8nw5HWOPVFbv4Di/jsJmFJD/7476s8aeWQAIpOb9Zss/2wSP6XwhLs31pnIfWFh799w4ESDW
	lRRmNi8yAmLN8zdHUSUSTEpvGIOXU20XgLMAle2n4+gwoNL7ecTUltn4bpUG5wKvuR0HGkPFhsH
	2gr7VoqzOHkRJS/5Jnb0xbU2kG3jYLmd1AqRGN9j4eTmcz1KAtfE+PF8oCviPkLZddjar66G41e
	7frdtVikRrS02bHbnXZida1uD3zm2tOQCGgWPic55dcwbvnOUa/LHv0mmgUjp+Z0a5JR
X-Received: by 2002:a05:620a:a48b:b0:7e9:f81f:ceba with SMTP id af79cd13be357-7e9f81fd24fmr40071685a.84.1755594878518;
        Tue, 19 Aug 2025 02:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmEoj+Ud8zs9th52SpZwFEUaYKQf8oz1qBWLxnyzGAiTxqSStJPJDiPCnTXIiBo4xdTU/u7g==
X-Received: by 2002:a05:620a:a48b:b0:7e9:f81f:ceba with SMTP id af79cd13be357-7e9f81fd24fmr40069585a.84.1755594878120;
        Tue, 19 Aug 2025 02:14:38 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.81.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87f16f9ecsm712066085a.24.2025.08.19.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:14:37 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:14:32 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>, Tomas Glozar <tglozar@redhat.com>,
	Juri Lelli <jlelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [RFC PATCH 11/17] Documentation/rv: Add documentation about
 hybrid automata
Message-ID: <aKRAeOakjiwmgML_@jlelli-thinkpadt14gen4.remote.csb>
References: <20250814150809.140739-1-gmonaco@redhat.com>
 <20250814150809.140739-12-gmonaco@redhat.com>
 <aKQ7iaSb9GGUtuCZ@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKQ7iaSb9GGUtuCZ@jlelli-thinkpadt14gen4.remote.csb>

On 19/08/25 10:53, Juri Lelli wrote:
> Hi!
> 
> On 14/08/25 17:08, Gabriele Monaco wrote:

...

> > +  static bool verify_constraint(enum states curr_state, enum events event,
> > +				 enum states next_state)
> > +  {
> > +	bool res = true;
> > +
> > +	/* Validate guards as part of f */
> > +	if (curr_state == enqueued && event == sched_switch_in)
> > +		res = get_env(clk) < threshold;
> > +	else if (curr_state == dequeued && event == sched_wakeup)
> > +		reset_env(clk);
> > +
> > +	/* Validate invariants in i */
> > +	if (next_state == curr_state)
> > +		return res;
> > +	if (next_state == enqueued && res)
> > +		start_timer(clk, threshold);
> 
> So, then the timer callback checks the invariant and possibly reports
> failure?

Ah, OK. The 'standard' ha_monitor_timer_callback just reports failure
(react) in case the timer fires. Which makes sense as at that point the
invariant is broken. Maybe add some wording to highlight this?

