Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12629366DD7
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828609; cv=none; b=bw51UICLo6wROPrD5E/M7dJSUjqwt51FcvwPbuJ9tDA5Eu8PyqvdyawscpRlfqEMqiK8UApYn+nCijfQ8M8Wr2KcCpXoppIEIx4kK9IZDPh5cjpnemoa4UGiyHsbHxhLfWRxO2iNz14EjOGk3d3iC1ZP3n4lG65trxbX/I1YifA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828609; c=relaxed/simple;
	bh=K6XZoyNgA4mHZWohG8tc3L3ulzvqxFpcRY8Ozu63mcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ8a/qaB0Gm6WkUgyTgTewwDccyJ5pzozuC+J2A8ah/BS2+Jvj+evoZzWZzqZgzWZEC6EgIOW0fvxBFRMRrHG14jtF7keQ+2/bWl3Azy0zyz1ZLq7jeyw2J+ineMLDU5bysecHxnt9xqCgJxv5xvTOfIrk0I/b9bEVZ+3qRTByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUUkjRGS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJEQtxtu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUUkjRGS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJEQtxtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768828607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xdz4rb1d9PRbGxq2hK7H+gxdLsBDCZap6WRSCpXGcXo=;
	b=BUUkjRGSf1YVGfaAeiaU6wWnfFbLp8k4yrYCXxZJdVxaqYG7tfqNNA/BMIGFyo7mmfNXEk
	gBAHwEAozbQOvA7jl/mxJHyzmVJeFVrZYnlENqFeZiXVguwW30eJMzwv3LAFjZ//gzVRy0
	QG1Vkm/8ZUeGM5YuK560g+FDWIGPObw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-AbH-r4UHOqqboHkE2cFfcQ-1; Mon, 19 Jan 2026 08:16:45 -0500
X-MC-Unique: AbH-r4UHOqqboHkE2cFfcQ-1
X-Mimecast-MFC-AGG-ID: AbH-r4UHOqqboHkE2cFfcQ_1768828605
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47d28e7960fso45836495e9.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 05:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768828605; x=1769433405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdz4rb1d9PRbGxq2hK7H+gxdLsBDCZap6WRSCpXGcXo=;
        b=QJEQtxtuYY13R0tTFEe4P5vG9C7JrUm5twXROEKDlcjxkOedNhBiSssg7BLkRLlWPs
         SV8Dk8ukKI3P4t68nt7fHO0cbCYahDKHS63rGY9yCRNTTTQIdG4iKP2XKPTXb+/JTGDW
         oQLXoWlJ65y9vMt5E0j2Gyk6+2UoDFS3n10+3aNY58kzYyMnHB/u7lKhZ80hxVxY0eug
         QZfyhtNv/2W2FKYZNxSUlXhRmmKA73/e2O9BX36Y+7ai8gOxrDqTxEAvSsOnfqaG1kEn
         AH5ndWwoHdVRre0W5D5H14F35HXaPr/Bx+u826owxfOgyz6xOzltDgHgIxtLgYO/RoyX
         zThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828605; x=1769433405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xdz4rb1d9PRbGxq2hK7H+gxdLsBDCZap6WRSCpXGcXo=;
        b=T7nj5PFhCcbKaJZUfp9E58qn0NFr9CD0GurqZvg5tSLnojDHR2Z5KnVwvMmmyIDNyO
         FPwBn7dRDF1UHFEtwQg9+SlnoatZYj1vwVxuqE4+ODhh+CKQW82jDsah+MnySCtsLaXu
         pqggmt/AVEwARGH4AcO9fctx56BhCC/TEVgb8OIsMPnMs98xuQpw3SCG/g4tazrnxWHc
         k/nD5BoWT2ooov8ucmyl5+xC7o/+/RxAz7ouEsc6XiF8zDxyv59BoOrWjc8uWHl4tBfJ
         OPxV00mduR8JtmCvzQ0v68rOu/xRNZzM3L06IuH8Y5d3vbaHzEjRiI5Nb2eDYtkYvSAp
         5qcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxyENIQ/c7NqL3PssbiNjej3i5HhV2nNGxkeOHerqQxUwB75hhcAlgnpmrXPtmLCVHiMAnINP3DlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtxGpS183H9NzmcCiU7msALkTcEk/gziUMMUYk4nDw1cI9h/9L
	2QvqkU5E2o0iVDo3r/9uO9/sz/8hRsXy63gVXbdTMLk3jGMQGqAoySTBgBVa6sKYaMa7hjV7u2c
	KnTD+yKaf5erP1Faw2F6TZJZ2JmruPII/DjSBWrWoNO4fMS//ES8GZHoCGWitJw==
X-Gm-Gg: AY/fxX47zCGdBHcMdgnjtFv0YFJk8yMx0U1AI00nZE/OGSWJRBwn/DpN3LxzcoU1/2T
	l02x8zmJk5zdqm+VMz/s45iILkA7fc0yZPNbeAbjjFSFn1f+mtroppZTnBddtAlHbdVrQUao0mi
	/QU716btfkTyYY1D04bqp1PSFggCJb264JqGUKh2J7t4trDiQwkroJfR/HRNuONtPdvFjcMfvJp
	w6tLrT1NvXxUbNMRVRb3Eyz7U5O+qgxvUzcqiaBHsn8r/MFkGmlC3JCJMEZcZ0dVXxEYQt60k+7
	KHerl0t2IWFOEFZbjdT6RV+dgIjlYcmlVc5g3xsAvOt5/j6R3s/Tcy5YSkpgZXySLXvHpuQNQT/
	+m7C7jXGizDiJE+Fo3XseHsNDFXm2X0LOT+oIht7k
X-Received: by 2002:a05:600c:8a09:20b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4801e4a389amr113571815e9.7.1768828604567;
        Mon, 19 Jan 2026 05:16:44 -0800 (PST)
X-Received: by 2002:a05:600c:8a09:20b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4801e4a389amr113571385e9.7.1768828604145;
        Mon, 19 Jan 2026 05:16:44 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.129.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm245614985e9.10.2026.01.19.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:16:43 -0800 (PST)
Date: Mon, 19 Jan 2026 14:16:41 +0100
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
Subject: Re: [PATCH v4 14/15] rv: Add deadline monitors
Message-ID: <aW4uuSUaG-W0NWuI@jlelli-thinkpadt14gen4.remote.csb>
References: <20260116123911.130300-1-gmonaco@redhat.com>
 <20260116123911.130300-15-gmonaco@redhat.com>
 <aW4PvcDxBJnDLJFq@jlelli-thinkpadt14gen4.remote.csb>
 <5df16facba05b84857ad09cee12df0c19a551285.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5df16facba05b84857ad09cee12df0c19a551285.camel@redhat.com>

On 19/01/26 12:35, Gabriele Monaco wrote:
> On Mon, 2026-01-19 at 12:04 +0100, Juri Lelli wrote:
> > Why use pi_of() in above cases?
> > 
> > For the first, in case the macro is called while the task is actually
> > boosted, we then might continue to use that even after such task gets
> > deboosted?
> 
> Mmh, yeah thinking about it again it doesn't make much sense considering we are
> not tracking when a task is deboosted, unless that always corresponds to a
> replenish. Thought that doesn't seem the case..
> 
> > For the second, current PI implementation (even if admittedly not ideal)
> > uses donor's static dl_runtime to replenish boosted task runtime, but
> > then accounting is performed again the task dynamic runtime, not the
> > donor's (this all will hopefully change soon with proxy exec..)?
> 
> At this point I should probably just ignore the pi_of() right?
> I'm assuming the original (non-boosted) parameters are more conservative anyway
> so it shouldn't be a problem for the model.

Yeah, it seems alright (at least for now) to use original parameters.

Thanks,
Juri

