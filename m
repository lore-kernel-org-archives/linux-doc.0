Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBBD1AAC4
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741587344; cv=none; b=V35YXX9WupQVL69HBYSc+Kc9oy21UcHDzrgXznZsFFZLJn9YsMELzEKnQl5NUHwc43VTUp+Clallonbc4fdmH2xU6Qv+SYPK+XUJ4fgENDxe4/DpZ9Np2wijvIJ06m48wsYlqOEJpCuV3mPjivmfM0p3i8y33jq7i8hag8cI4fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741587344; c=relaxed/simple;
	bh=N/XYxrYYh1Vkf56xV617pUrV8Lr60Xzn5kQ39SDReBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLg/xKRgLhmT2wB/7eZZztNNaBmZJOppey8UK3dD508SwYEccELNvS+Q7wzpNIqHSQSQsNzDVro/QoyfwF8wi0ZcSslQ81KTUS0Z6hiGyygVuviGyrYVzejpT7vhCq6lELk5lJ/S9fsywpPnPFWbrAY9nyUjgSomtYOYsMP4tRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I5Jt2lq7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I5Jt2lq7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223a7065ff8so53843355ad.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Mar 2025 23:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741587342; x=1742192142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WibY/XeJMEPDzBQenCLC9fzziipC+UPOYIp2W8k3LJs=;
        b=I5Jt2lq7fwwNC5FCuz2GcYBVvkb6kaUrJs3Am7PA16bS+y8lZXYJIRnYSlCh7jPgl1
         SMsximMdRKSAcaeCHyNObdOeMo7BG1Xwd9KkLa8JcfYhvZFh48rx2rxaggCH/xI7JFiV
         eWeDqMApCb3Bd4EZk9Mh/zHHLCuoGto3H3fmewkLPaQq+hpNeV/k3nmwrYSEs22HSLxV
         QKTxyRDS1l15iEhzkoOsm2oKkLuJS+jQvRYbFKPisyg4yOqHEgFERA3SZFVoS+uNFmk7
         wt+IlF4/CXYfzCs+SNpIC51v3f2n8H88OX/pq0gVnqazyAKNvg2uLJaWyx52C31SCM0K
         8lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741587342; x=1742192142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WibY/XeJMEPDzBQenCLC9fzziipC+UPOYIp2W8k3LJs=;
        b=m+yalPQyFpGtDUUmJHAVy76T0IGyikmx5Efrrz4UsVWRJt8eCtgCJJ1tG3I0XXvSgl
         uZT3hzwDzedEbPUKObI05R2MqzhF4adPS7akQpbTb2RbeHNJoOA9eTtQax//w1JbHZKw
         HPXSjGgE8IvuZNWTpOnwSgPspJ40q3nN03n6XCoHLhK+TvH2qrpM88wV8PD2ERAeMLAE
         i4nqS0xCdAb+b6anBOBZtcgNq1xquYksqou4u72mf63Nb2vE7zYmD3aK6nQ4PfcxuMt8
         5GdTHq+1WxfLQ5zt5RKCXQhf/6liI3sp8Q09NDVj9k6KRqo31bEPaPHb6jsQibCsFHg9
         CBgg==
X-Forwarded-Encrypted: i=1; AJvYcCVUMtMUTVjtvO02W+MXbxnkj26DTFjBiyumVZMN4XElqw7R0OHehV5qwyXcSg7ml0BedniQCZKz1eM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8QH+8WeQ22t/CiBOLVnM1QfVNzIKIHbvedDJYyvLRjgCF+rYP
	5gulNHQjq4ry//OjzWThYqZBn6p0ZqY0GeAEZlzoIAkANUEA5FwBC9I2rZcaFKk=
X-Gm-Gg: ASbGncthz9u7awofROpQG/BYEQvQYIsZhTUWapQuP8hx/w4KE+LP17nPjKGEdqGuhNS
	aoHqq155VcudRkkFg+axG9NTsP6WfffucB1v874Ht/hlttaBM5FlQc8SgYt/QSv/oeo+ewX8cf6
	xrOPnrDHcHKupNkCpcvvoJTV6GLFZRqPBQqVrslTc9quiF1BG/iRxvPTLo9ER/Pye7doaT/xULm
	vhcTnXDfxEEqdJfrYKkNbiMl35tYaafPN8Ev+tf+CtBrCCy0/qpB57f43/Z6dbLxCoS3RmE6O6e
	3AnI8V52r8ttnZAzaCdnm+nCOvnyyU8VvpjNRWTpnHo6bELE+VHDkhOQ
X-Google-Smtp-Source: AGHT+IE67+3IMf00Ld8YJZyg9Ls4jAy9KYKY/1GyMXJef6AIWxOa4NMBdVmmUSJ9htur0pAmDSGRGw==
X-Received: by 2002:a05:6a00:3c87:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-736aaad21dfmr18986179b3a.21.1741587342552;
        Sun, 09 Mar 2025 23:15:42 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736c1e7e142sm3509765b3a.114.2025.03.09.23.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 23:15:41 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:45:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] cpumask: Fix kernel-doc formatting errors in
 cpumask.h
Message-ID: <20250310061540.zpfyisvchyua2cuv@vireshk-i7>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
 <f4ad81150eaa00b43c161f0d1f811f8ecfe21889.1741332579.git.viresh.kumar@linaro.org>
 <Z8snakYmzhaavkKN@thinkpad>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8snakYmzhaavkKN@thinkpad>

On 07-03-25, 12:05, Yury Norov wrote:
> On Fri, Mar 07, 2025 at 01:04:51PM +0530, Viresh Kumar wrote:
> >  /**
> > - * cpumask_next_and - get the next cpu in *src1p & *src2p
> > + * cpumask_next_and - get the next cpu in *@src1p & *@src2p
> >   * @n: the cpu prior to the place to search (i.e. return will be > @n)
> >   * @src1p: the first cpumask pointer
> >   * @src2p: the second cpumask pointer
> 
> So the question: if some word in this particular comment block is
> prefixed with @ symbol, can we teach kernel-doc to consider every
> occurrence of this word as a variable?
> 
> Why I'm asking: before the "*src1p & *src2p" was a line of C code.
> And because we are all C programmers here, it's really simple to ident
> it and decode. After it looks like something weird, and I think many
> of us will just mentally skip it.
> 
> I like kernel-docs and everything, but again, kernel sources should
> stay readable, and particularly comments should stay human-readable.

Jonathan / Akira, can you please answer this one ?

> > @@ -334,7 +334,8 @@ unsigned int __pure cpumask_next_wrap(int n, const struct cpumask *mask, int sta
> >   * @mask1: the first cpumask pointer
> >   * @mask2: the second cpumask pointer
> >   *
> > - * This saves a temporary CPU mask in many places.  It is equivalent to:
> > + * This saves a temporary CPU mask in many places.  It is equivalent to::
> > + *
> 
> I'm OK with extra line, but this double-colon. What for and what does
> it mean?

Without this we get: "ERROR: Unexpected indentation", for the last
line of the code block that contains: "        ...".

The double-colon creates a code-block for the below code and gets rid
of the warning.
> 
> >  /**
> > - * cpumask_weight - Count of bits in *srcp
> > + * cpumask_weight - Count of bits in *@srcp
> >   * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
> 
> Here nr_cpu_ids is also a variable. Why you don't prefix it with @?

I was only looking to fix the build warnings / errors for now, and did
not look into detail for such issues. Yes, it should be marked with @.
I will try to go through all the comments now and fix such issues.

-- 
viresh
