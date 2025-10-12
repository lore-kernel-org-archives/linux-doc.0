Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE316288504
	for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760279531; cv=none; b=NNYrj9DAX43r5MGB2b3rbp7OgqfOBygQsTgT2U5uySQGQnd75BIjCnP7NyvxFq9cejcMS0KjfHjJBZtzdlK8/pG7x0U5VnEwLU1DvPfLP9XtJp1CuKAj9a1Gd4cCuVD8Te+W5hq/uR/tWNWtJwRZo6fs8Iy8NNu9s8iTNLa+RN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760279531; c=relaxed/simple;
	bh=exVDaTCv2o9KGqW9+Cgff31C7B8DfZakECaMCpf1bfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvR3UxkPFjkwnV6UGJNhMRkUAtZyoRYMIP5HQl5ShRodm0KyOrmMciKHkZ2Rja+0B1Anw+ttyTl0q4nMe1JZaNBIZkzPSpcY7hyESvKNrfTIlw5YgswItiY8zu/M2XFUMmu4kC9gqGWoCeH2tAno+5NHhN7TQ60iGw/2odAxJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1s89k26; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1s89k26"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-879b99b7ca8so49247246d6.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Oct 2025 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760279528; x=1760884328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lafAVcrEHvdofnatEPGKT/Xtct7Xl7DSjL6fT41f0Sw=;
        b=K1s89k26nbYzSwwGw7yMYiYrRjewHFeqMCWTkxii0Kk1TGe8AJjnPIhBf9DswDh9AP
         Pc8PZkqx8PU/oLLaaseQlS2cn+adpK50u3OR+RUldZVfZbHOgIHTkf2j22hZCKR1/bY8
         K+WzATCb/aJGKL21QkWActjsYo1QICYWvUqnwm7Y23ReLGJMDnVIHhQ2nCvoLuAZDF4k
         MFpNBR0+2pc6q0LW7u3kXC9ZmsMz65gusX7+PngKjBo7pwiyG8Q3ip7uRmtL6kKVKXvC
         P35XoF+hOLRCfEMQFis3zy8k4eGD4BO0dwAafZG96RutusvGhhC7+CY8MhB04M5dSkS+
         lJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760279528; x=1760884328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lafAVcrEHvdofnatEPGKT/Xtct7Xl7DSjL6fT41f0Sw=;
        b=OysCBusoyoOo44C5tY6nP62COjfbJKGowZNIhAUfA5zYtQmrjZ6/muDJjabKCiJdnY
         rtCYmOLD+3VShAATIg1EfsJD9GT9DAJAcY67b8xE2wDv+TPJySdIdhWjqpmxSPiPe7cb
         opLnnbFOEtzG2W3oy/8ySjQxDMRMUTLmFtA3ufALYKjsFyvmp/+Z8FMjmoY43Q/1LdfQ
         BjPPNxUvj5zTBbMhwMEH7CIzwK5I7qWgndiNWB8HdUrsZyCKrXDMGneTszTQuZfEe0rd
         6A5uv4p8ZNvkNrNsesUVi86M8o4oRd1M+Q1Eh9zTMAjwvuP3x3bXO5E+U/gWg9nvyncp
         qp8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5xw+lekYYy5VDE3/NlUWy9ZzVrNcq1OL8wTN+c5p7IRd9JGJufjmvYDEF9glHQy6HFnPgKQTJD/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPp7qNYBBDsWZzoT1mHLwFEXKJc/QhNk3rFlrWsWIrulDTTKn
	7NnzIuNdv23CxwHbanzqaHWKuCVu3eS2vhxjHMKkdzMAkkXh5yn3iH6q
X-Gm-Gg: ASbGncv00CwLDnVu8171ExC/odbz3JA+kqMROGTzOpIN94hUfPgPaTMF0fBMg3QHt5m
	taolrNCcbppuJxKSH6vCkm3kDzc2OE5wmLPkKTfUUdq5TuW9XA1OEvpsySgexzDJF4l+/6wOGWI
	/7MMstvBA4j6BpSXdJx0P7Vh3f8uIjwwxUyT0zlNR/g6GcCCEnyE+iwWijsPV7+zhQ0NJdglq3/
	ZfaF+Sly4LECTb2LQxCS5Q33oW6O/20BKl7s2nUxra70SVwQ8cgXF9mjFMddACX2PU7kP4lPlKp
	uA2i6edas2ClE8dHCKZnjd3hYw4/bMs2N8CzjrwfRQhD9eLm5cYGXW2RGiDU7Bw9HVUkR/qVvMH
	qotJOB8plWc+KbYmNux24va2OiqhOGsMZGtZ68ABMVyPh2MCzu6Hm
X-Google-Smtp-Source: AGHT+IGylxeC57G3HP7/1vZXTCP0woc3CF/bb9piQD8YyNw88k6+Ampz6Ayo2XWXeOakyOz8ZMmEgA==
X-Received: by 2002:a05:622a:30f:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e7222e7357mr20155591cf.8.1760279527640;
        Sun, 12 Oct 2025 07:32:07 -0700 (PDT)
Received: from gmail.com ([2600:4041:4491:2000:f887:3bb2:9bc6:cbb0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc35930f3sm54042686d6.43.2025.10.12.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 07:32:07 -0700 (PDT)
Date: Sun, 12 Oct 2025 23:32:05 +0900
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
	hca@linux.ibm.com, corbet@lwn.net,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/5] tracing: fprobe: require explicit [GROUP/]EVENT
 for list/wildcard
Message-ID: <aOu75evMUGF8pBxE@gmail.com>
References: <20251004235001.133111-1-seokwoo.chung130@gmail.com>
 <20251004235001.133111-3-seokwoo.chung130@gmail.com>
 <20251008095316.cf24f13a84a454ddbf530120@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008095316.cf24f13a84a454ddbf530120@kernel.org>

On Wed, Oct 08, 2025 at 09:53:16AM +0900, Masami Hiramatsu wrote:
> This should be a part of [3/5], because when bisecting, the test will check the
> README file and check the feature.
> 
> Thank you,
> 

Ok. I will fold the readme_msg change in [3/5] (the patch that
introduces :entry|:exit and keeps %return for single-symbol input) so
the tracefs README matches the feature during bisection and for tests.

> On Sun,  5 Oct 2025 08:46:56 +0900
> Ryan Chung <seokwoo.chung130@gmail.com> wrote:
> 
> > Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> > ---
> >  kernel/trace/trace.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index b3c94fbaf002..ac0d3acc337e 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -5524,7 +5524,8 @@ static const char readme_msg[] =
> >  	"\t           r[maxactive][:[<group>/][<event>]] <place> [<args>]\n"
> >  #endif
> >  #ifdef CONFIG_FPROBE_EVENTS
> > -	"\t           f[:[<group>/][<event>]] <func-name>[%return] [<args>]\n"
> > +	"\t           f[:[<group>/][<event>]] <func-name>[:entry|:exit] [<args>]\n"
> > +	"\t                (single symbols still accept %return)\n"
> >  	"\t           t[:[<group>/][<event>]] <tracepoint> [<args>]\n"
> >  #endif
> >  #ifdef CONFIG_HIST_TRIGGERS
> > -- 
> > 2.43.0
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
