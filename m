Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217623932EC
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408233; cv=none; b=aPFXulqmeMrD3jN07WPTueBng/QpdU0ZUSN6jmNdeVkzbnrncZmXn7WxkYLL0lqSF8OEZeBB5LM3aZrKV8gYoec+2YId5d7KC+7xklVId0k5mI+IoO9sYeBmn5Ft5x+Ht0o7le1dBTIhCNjafkTDXGXJmXFm5IYorwCTcP+jjIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408233; c=relaxed/simple;
	bh=ZtHwRVLIvoDuwE15SqsQokaOwa/XA5uaZPU2Mzcfynw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcbfkTz1No6UC+tisDuvIkUVZJTwuDyZKNCcaJwuEZiqNIyV5Cp2a2UTG1j1Fm40ByLb40PNwKSplYlATOpv6tWe75GBAdBI8PJxuofQYRkB9xxzSpQBwRDImm795D/OujBvT0x4W0QesZw6vSkfwPxH1+/aY4XQ2vbYMuHMKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NIuhXoTP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qLrFnVlx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NIuhXoTP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qLrFnVlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773408231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R7HlaCIiaZDqWdp+o834N7JPGX2olX/c1Y000VF8Mwk=;
	b=NIuhXoTPTJxBfC2TqV4iGl+Ex9fz0azpXBZ2qegrTL3yspEsD9W2/L5u9ZY8Iw4XUy01w1
	D+SDUopmOkD3a46TTOLv0xn6E97HtYA2Ktaev9E4dK5euPWuTRKEeunqUisoFxawVJba7N
	/wwdAZMRQU4R/CiFHJWuLjOu+C8tIEs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-S_8tIMH-P6eqfO0RCZcw7A-1; Fri, 13 Mar 2026 09:23:49 -0400
X-MC-Unique: S_8tIMH-P6eqfO0RCZcw7A-1
X-Mimecast-MFC-AGG-ID: S_8tIMH-P6eqfO0RCZcw7A_1773408229
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4853ab1cae0so21737235e9.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773408229; x=1774013029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7HlaCIiaZDqWdp+o834N7JPGX2olX/c1Y000VF8Mwk=;
        b=qLrFnVlxY9xtmVRF2P1UIqIEG5AaN0PZ0i2rup1fi0MX5fAqFAGhLo9d/UEY9KrgrV
         pXPpO4NWzkXUHGh3CN+q0jzX1pJbBNqynrWIQGRhXfRXLWsnmZalJU5l52q1w51yeb8V
         e18OxwMFm3WYuYOgBFxN4o8sTGvj5nXiNQ0mQqp6/ukDMNhoWEfET7ky09FXCdVuKaUw
         vPlWqiIT7gkPYPIyLgU9+/i+sCqJzun/g7eK2FyZQveCyhiJLcWlxukCC8fjY8usREA9
         zd7vE9yobr6wp3vZfke3SKKybZGgrjspqhyKil0H78MLWAS97ddLZcg6irStyG2nrdKE
         +73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408229; x=1774013029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7HlaCIiaZDqWdp+o834N7JPGX2olX/c1Y000VF8Mwk=;
        b=QIGbEunXSiNBtBAtLj3CFHek/C0A66h66ROyOoVTGam9LAIDRDyrywtzR122SO4Wkd
         eRL8dNJAiwGguC4KBRhyXkW22+iPeu9jDOOW1UDarbRWNI6HopXBTG6N2L2cfyZs+EwS
         sTfrkGcj/V65p58wE97KuYM+d8x87FKvVydcetzI2IeujtBTIqJpk7H9RgdT21vY8SSf
         VIiy/TDyRCLdLduQqbB0Uaki9Ea/q0OJxeMs48NHJEERsy68+23Nd/aRbJDSwjok/y2k
         Sirg4K6+z2Ai+ylXiV49WdprK1AtwfWbVS+ezlyNQKbAziomlwpF8UbMApTIY83NYFau
         QzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnkrDC56VNawnn23x8rfxSyMvUBS2lOLSiORYfWLHjY+15ZsgPL7CG3mjEx7lUnl3NvGBl2s1gJRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzI5NGftvkc/kClC9Y09TSzkTs+HDhevdsDMtIoBii3xiNsrT6
	j7f/WVX7kWje/p49EhLGofp9TWpfbat9Un73g1UAk1Aif7ZF8Qi5tzi4vAnYwrhYLiT2lRtLuFD
	wZ6h70AGwFR/8D9Kype6BKzWd75eFVWHq609EanLTHCY0PYhpEAGUcPaMUnk76g==
X-Gm-Gg: ATEYQzzQp7DNl5dkZ76sU2FmvFMOhkX08vPJkOB+IHNJXTPmHg9Ok9SdBDLDwUc2QKT
	ftCjuWzSTuH2xZfLKSr0j6aYoyhlbq0jOHC8edUy04P7U7LBCcqKmvY+c9Cc9UoBxGdPJISO0AM
	Rl1nYj9wOhRtHE/qxXS58XN5GUFLOpMP6lPge5nK0AR1atfbMorKjkyyKXoNuZTRkojUx3jYMSv
	WI6svl3fejsCkr6SscydalMo3oaVqkd3948nm/qgybi2+fBV++v1nNNTNo9pwX8eW3gQve2ypWq
	gwCYMsexF+UCnLo93nG73OKMx7nO7eXqiCKeZ4/ZZ4Rl7ilxH33/89dmeQRPNByjHjAjAbX6BDO
	rYJpfrtFlJBjN5UUrPEVJRAwz5WYx0yGGml+u+sISzLdd+6aFgnM=
X-Received: by 2002:a05:600c:8b46:b0:485:34b3:858a with SMTP id 5b1f17b1804b1-485566d2d66mr52863335e9.11.1773408228611;
        Fri, 13 Mar 2026 06:23:48 -0700 (PDT)
X-Received: by 2002:a05:600c:8b46:b0:485:34b3:858a with SMTP id 5b1f17b1804b1-485566d2d66mr52862635e9.11.1773408228148;
        Fri, 13 Mar 2026 06:23:48 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557784c18sm51257345e9.4.2026.03.13.06.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:23:47 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:23:45 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: gmonaco@redhat.com
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v7 05/15] Documentation/rv: Add documentation about
 hybrid automata
Message-ID: <abQP4ZwPZsBJ0TO4@jlelli-thinkpadt14gen4.remote.csb>
References: <20260310105627.332044-1-gmonaco@redhat.com>
 <20260310105627.332044-6-gmonaco@redhat.com>
 <abKX1XO4vqY74uA7@jlelli-thinkpadt14gen4.remote.csb>
 <4620e92b1c7f4d87f192a017f3026dfc17bcaef6.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4620e92b1c7f4d87f192a017f3026dfc17bcaef6.camel@redhat.com>

On 13/03/26 14:05, gmonaco@redhat.com wrote:
> Hello,
> 
> On Thu, 2026-03-12 at 11:39 +0100, Juri Lelli wrote:
> > Very minor nit, feel free to ignore, but ...
> > 
> > The formal 7-tuple definition includes 'i' (invariant function), but
> > unlike other elements, 'i' isn't stored in the automaton struct -
> > it's implemented as generated code in ha_verify_constraint(), IIUC.
> > Worth a brief note clarifying this design choice so readers don't
> > expect to find an invariants[] member in the struct? Here or below in
> > the example C code section.
> 
> Thanks for the review! I haven't really thought of that.
> At this stage we are not mentioning any struct element (it's purely
> theoretical), so there shouldn't be any expectation from the reader.
> 
> Later I mention "The function verify_constraint checks guards,
> performs resets and starts timers to validate invariants according to
> specification".
> In fact, also guards are not represented as part of 'function', I may
> mention after that sentence something like: "those cannot easily be
> represented in the automaton struct".
> 
> Not sure if saying more wouldn't make it even more confusing than it
> already is.

Yeah, probably. As mentioned, feel free to ignore, it was just a
thought. :)

