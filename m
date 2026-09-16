Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84AE52B1DE
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573384; cv=none; b=hptbTFYhYwJKPQ9iWna+pe63W16e0/RY4N/9QhxjOxP94/RC0G6KlPIgvWPT7b8TLz6D8ZsPtbxWlgBxSxuZq9CpJBLZIVKbpxo6qNftCWQYO4qtfOQMbU+hx/b50kw84BDRcFRebxGxn2DHtNa3dItx0k6eupwRQalaC6cE+o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573384; c=relaxed/simple;
	bh=xzkEs5LiSja3dbzzicR21Qn0XTrKAUdE1PB/NwOkDos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDsNPkzTRRqeFNNxCAJqtrYR8UVGPOWI2N3uNLLOnzhyafbi94UG2ZlDXISjrpm3VDng1o/xLWWSJzT23HGkowgwTJtLeOBGlJ0oaiPFHRylenAY7EHm7wUJoJpEqC9fPM6heBj0Z1dVbAO45Xk/YuApMMjZnsJJxARs36G4LQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kod5TDBu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kod5TDBu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso8336275e9.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789573380; x=1790178180; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Sim/Uq2bss990wMC5LOqQrIp+Z1Yp2vLh2aHVXHuME=;
        b=Kod5TDBumB6ymIwo7H/RjtjtrnCuDomtfuR8A8HGXpN9zgO1n4IyBkl3igGXu+7HOs
         zw27PQMKllXoPTSLu/HpagKlvd8CU2+NFGHJiZ2WyfdcqLz31yTLCw7AVgVcp/IYfVbS
         I1Xlt7B7YltXwZ+O7fBbgLEprxlZ4BCPNCxrn3IRJudknDVfer8wPbaz5xom4wVVpNSL
         LHRQSL7U4jIQQm+VrlVv4qjOU1i3lYzkhhb76vIkfawkePesgPYnJBAcsLVs2B0IHc7o
         eavU318LnTyYFVlk/KW38KOB3d93So/91Lwn4vbIy35Ivb0es/onxLKICAcyvHkNdNk/
         IIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573380; x=1790178180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Sim/Uq2bss990wMC5LOqQrIp+Z1Yp2vLh2aHVXHuME=;
        b=Cs1OpvoP8PZe38BpdG7n+elj+O9uVqAa+4u9k131AEMRdp8qhKrdAnrcTlif/wN39w
         pdWcGLZxARgJ4nRMRipn13QZJvhR/8GY7YrrqwSH05bqDYqiZu90qWvZ1rzyHvi/rKCt
         d0SKniwOU+hqogUPfPy+q/AEnqWtBGEY/wLJtmFBvTFbbOL+6TWFprI4goVGRcxDJ/gi
         CzSR3zr0cPka6veVrPF/Fj0zZsujVyJvekvfoBUcnxwtNWTrG0QNaWMW9Ud8pSD1c7qk
         CIOAFKashw5olwdKhndH/Xl7VGbzgGC/j4IbPo5CImF9UdREzamOzE+kfovAn1nqje2F
         1ZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxakMTmX/6saS6BvqrujFTJFS9NA376osFmysQXxbKGxl60bpoic/QdbAJFyLMepbnYzEg8BzcE714=@vger.kernel.org
X-Gm-Message-State: AFuF++mWEaNnBp+nIxeiPbdYFQSLS/9CU0S+iya6hA6uZXqdsudpJNJx
	4IBUK2p1FEON5k8zSwckYbVqFC3QOvgwZZeo/drEgJJZmy6PmUJ8emMdFsbsJqeWRg==
X-Gm-Gg: AYBFou2qqp0v5O74YeL6ceGHOQDppKEhdVkcciNKY8jMqSg8MbVhJ9kYfor633l+AqQ
	0GuQz0Fwyihxn+zDOSrJMv8QmnCYJSSVknuzcb79vNhc3IsK1OYHLf/SeM4bzWLPAMBS7tzZqpP
	zk1iRU07lfP6TZyjILXWs6NJg/BcQcsoZdVKkaqngtQZ+QCTRhc0sS7AuHUiWaARxv5UHqPazGs
	EBbRRpgp+XwJdiiHZF4SVA72fyM7b8OrDsUfVCGe9a4DITAs6B4bHnVexwyjB2fIVs8NEk9xrbv
	Ofr646BG7D8E2T+HZMuMydpTP41Jk7IqTy+i5zYI5r3rRS6V0KNvif9UPxFLPMC7ldKzne7bznf
	MNj2OOsg3OvThT3s8BkHEL59teVWZNTqWmHq6SXrth4NKm6WZnsGsD9mn3kh64sj1HXtKL7wvbV
	a7RF/RlgLNTK4jaPndRvwZMYUf8wV7VsRIkfMBBsg7Yzhz+nzguVjqZ+Gu/bGivE0J7HYoiuDoC
	MM/2hiB5JnnHmd9jJ1JsPGnS2jyqZRGUw9KXRk=
X-Received: by 2002:a05:600c:5489:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49eb7340a28mr62591055e9.16.1789573378755;
        Wed, 16 Sep 2026 08:42:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:a430:d4f:f001:4a5d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27198sm7580265f8f.15.2026.09.16.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:42:58 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:42:53 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Christopher Lusk <clusk@northecho.dev>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: landlock: clarify TTY signal scoping
Message-ID: <aqq4_Xh_JJ6OHpST@google.com>
References: <20260914.b8a029f9abb8@gnoack.org>
 <20260914180946.1462099-1-clusk@northecho.dev>
 <aqqJAZfG9FC7PgMW@google.com>
 <20260916145255.1587381-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916145255.1587381-1-clusk@northecho.dev>

On Wed, Sep 16, 2026 at 10:52:55AM -0400, Christopher Lusk wrote:
> Hello Günther,
> 
> Thank you for the careful review.
> 
> The phrase "or otherwise driving a terminal" was LLM over-generalization,
> not a separate mechanism.  I checked the paths I had in mind against the
> source, and none justifies that broader wording.  I am dropping it.

Thanks for double checking the wording, sounds good.

        
> You are also right about the verbosity.  The generated text expanded a
> two-line distinction into 15 lines and obscured the main point.  I will use
> your suggested sentence and remove the signal enumeration.  I do not have a
> stable kernel documentation URL for that list, so I will not add a citation.
> 
> v2 will contain your sentence and a short LANDLOCK_SCOPE_SIGNAL remark in
> landlock.h, matched to the recent MAKE_REG whiteout remark.  I will post it
> as a new top-level patch with a Link back to this discussion.
> 
> I will keep the positive selftest you suggested as a separate follow-up so
> the documentation clarification can be reviewed independently.

Sounds good as well.

—Günther
