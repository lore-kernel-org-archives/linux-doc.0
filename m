Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32EF2FF159
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451491; cv=none; b=qCzwlv/3gi0IwtdOvlGtkH6fZF2gnaMINfCobsXdZWTURV9JzI9IIjcp6FJtUZsoC4UestIFj/O7ZwKA/+L5kT+DqSPH/Ce0cpsAEs/GcvOYUFUGgj1irxTXr6Puv+q2T4SfHt7knEB9Xjupy5dMilHawMUr9qWYs98aYFHYsw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451491; c=relaxed/simple;
	bh=TH7NeO7vVQ/VUG2+FEeNWkKgZ2KsQAIwDaSHjhp/tv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d22uIs/a9KXG3TvlHZ37jXZrLvB62dFKdPPRLwJsBWAHwG+gpd1NiShM8ib37QOAl5Xt3eAsqpFeZhUSP+yvFtUJVDW5FGMDNbC+WA6v+VIe47OMHqYTm+Y/pgGzgpqN/LqZ3klHFtnmqZIbbAHjGEyzsIyD0IjRwQRELfHSXnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od+ejNtr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od+ejNtr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so2116990b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 23:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763451489; x=1764056289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oP6aqnAmldvD/TQWtFvRxy+Wad2q25rZrlIi47Pmepk=;
        b=Od+ejNtr3eoNuA6emZKmQSynTYrp8pstmcCLUkrqP6sXvzfLkuUdONqXvWmBQDwHWk
         EVsHDi812z8KKdu5+AJ822ysa8P0xkKPnPoSjLU8sECeUNyyrvz0mNjz4cN4oWwRwbQZ
         BlPWmMtQYdGN1CGwpjq19iyZWRa1TC20OuZ6TrhLmMRfvny9fqOcrlwT09VCExBxjaEp
         Up5Vd1Kq0T43w/g8EQ6U1w9aPDGqULWXHcPa7ECqCKEqkzL8BSGC5Bh6aZ5XVIm3VrSQ
         KBNQZVNtXr/Ncb8ECy6iz6xssRbfUXYUvSaMcsIYqpMDLVBuO0EDg0UgtSBgK7Xs1SmO
         R9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451489; x=1764056289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oP6aqnAmldvD/TQWtFvRxy+Wad2q25rZrlIi47Pmepk=;
        b=WMSC5DN5j256aQXfCV0ulik3V/iqBa2F7vIBXQuYrin0bRYhqteM5JmQL34HifyosH
         6VDDL8v7wiTdnON3CGUGqcV+GhwhnrXOv3PV//sfLueX19N1DsOb5Lu+SH9ugbwwHKov
         p15aGrxlffmIBNz7oR46+hhqsGL6XDgMh/lRfJiUzidNcYo91p9wgUfuId3mKE90ULIa
         Ic5+zNGVYfS/l5euRopUXIBgl71/UzHzaZit+NprgpFZodKSdKG+QuWQfGi3LX6xs3RN
         qZAvmXUM2tkubuuDWBrUjkQ3YyFzSk6o9OpFaXZI6zZq68XsGI36jfjjImZ9HZo9c5Oi
         iOjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQfStiH8bHlbt64KNRQrrJLHGrvpzAqcWsBqAQYm3dgjDTDbBPzen/qArzjX48ikE8vlw9L2PtSwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEiMqMqBq/1BFhsthCPjNaX7w/mSWduocqwTX87SNz4ukK6S3
	VNnPXK7EZGM1Dkyb2FljG6PrubSEfLwKH8mtTVt4w/wFzVH+cXQJNEGqn9v56w==
X-Gm-Gg: ASbGncumHq9fDRN3Sfgkn1otvQSSZSxMP4zG1Zz6VSSnOnj82fXlU/TBdhyLIpVqvuf
	tZ1/M6Uak2JzRvcMQmHw/gzeoV+2WuvDIv/HiXUMCupMRGDrNgR++OsYxFU09qtSHuVhGFzZItl
	/y/xxhMPky+GhGHQlryGiajI1MBEO9ayZ294iiZMMQz9BkTC0yU/o5mEHIrzaHhMopd038aK5Cm
	8sj4If2I8Kq10fK3jLrPSPkExKD+Ui9tDDs6BE90VG9YXMZrDLDtYuYBqUWAaATiPAO5U/wKHI0
	5BGMbHMLrJvt19K17BU37GTQoWExU1j9blzeBKyy+3gjm9yrLAnFBPwtRdr/iWw/QX9Arwu7sbR
	hW8LO9OcO8p49vr6Y+Gcf5sAcqBCv1CMZi3Um0L7vPy5hleQS8CN61tUVTTwpQ+SAUZlXtJWHY8
	ogxEAh2E5nocFzz5KwtZmR9eX8Fq2Wf+nENsNj3EY7KHlpsH0zPidA
X-Google-Smtp-Source: AGHT+IHtH29nUNBPA/lBB5oFVu9GhAwTUs/IjNh//vDlVAFByzmjZi0X/4i0dn30KDz6KOOS0/ffmw==
X-Received: by 2002:a05:7022:662a:b0:11a:e425:deaf with SMTP id a92af1059eb24-11b41406578mr6273847c88.26.1763451489063;
        Mon, 17 Nov 2025 23:38:09 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db7a753sm54607139eec.6.2025.11.17.23.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:38:08 -0800 (PST)
Date: Mon, 17 Nov 2025 23:38:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Input: rename INPUT_PROP_HAPTIC_TOUCHPAD to
 INPUT_PROP_PRESSUREPAD
Message-ID: <2khyn7qnwphg6hinptwsfs3xnn64nsitebja3sqnolceopwylg@mqrq3duv3nel>
References: <20251030011735.GA969565@quokka>
 <20251106114534.GA405512@tassie>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106114534.GA405512@tassie>

On Thu, Nov 06, 2025 at 09:45:34PM +1000, Peter Hutterer wrote:
> And expand it to encompass all pressure pads.
> 
> Definition: "pressure pad" as used here as includes all touchpads that
> use physical pressure to convert to click, without physical hinges. Also
> called haptic touchpads in general parlance, Synaptics calls them
> ForcePads.
> 
> Most (all?) pressure pads are currently advertised as
> INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> commit 20ccc8dd38a3 ("Documentation: input: define
> ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> provide this information.
> 
> In userspace it's thus impossible to determine whether a device is a
> true pressure pad (pressure equals pressure) or a normal clickpad with
> (pressure equals finger size).
> 
> Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> have support for userspace-controlled effects. Let's expand and rename
> that definition to include all pressure pad touchpads since those that
> do support FF effects can be identified by the presence of the
> FF_HAPTIC bit.
> 
> This means:
> - clickpad: INPUT_PROP_BUTTONPAD
> - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD
> - pressurepad with configurable haptics:
>   INPUT_PROP_BUTTONPAD + INPUT_PROP_PRESSUREPAD + FF_HAPTIC
> 
> Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>

Applied, thank you.

-- 
Dmitry
