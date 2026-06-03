Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746353E5595
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 03:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456244; cv=none; b=N37YTcHf44OOYbIqjeeqlEnQMPXweBpfuUSyKnaMB9FmmlEx99CBTNaDl/ACEPzp+blZmUjj3uf/BFnLLcelEknurt8CdulKfJkNd1IowTOm5zhhX9CzyxQH44hb+6ia2F04gcQD25V/3JYFuHtV9kUQmhx6NLKqBP6Je2uYtog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456244; c=relaxed/simple;
	bh=HVNkOPHRvv2OjTiFyRyfjJ8pj8Jxd14in2nZP9HrCGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa/SP1EwXrzyqgFmGRnd+guf1Rk2DGYy93rdk0OWF9A3EBMoW32zf/nSgfHOaaEVmDJeOLWhzzzuTjMzgBdIjgDdeGwcVs1SE2c4xAkQUM+ARFu2cgvPdvIR/k1G249AxeVVtwUJrOnwzMCB3qdAEsXNrf5DTp0y01hVptA3WWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Spm9oXR6; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Spm9oXR6"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-516d0db9372so106740781cf.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 20:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780456242; x=1781061042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkUPkSV1yVhPwfuKkUdfLaMgLJzqLtKdtBHH9XilSKA=;
        b=Spm9oXR65xzWaE7H22QQFdPwz0C2KkpSzCOPtbWhbo44tqLfsUjVKSF9+K0RuCqaJ+
         NPsll3cF0QrelaMuEvcsaxlDoatXR2w30bA/xyBG+Es14+hoadk7T7+SD/HwO1X/Kh3Y
         jw3AP6+BM8blpFjMnkdP7WegdyJBMN95AC/M3mu9SnxV/UCxwJFU5QRRGHph6DJmnuhi
         HWvBJQ7pQsS1gNAoJ6ibmshUMgo5dR9QaCMSXlHQjMcdnRWiSphX07nPscR2hxSJLdcc
         fgztBz1V8m2Lu6s8bW0cMKXXCiWqC5U42g/ROLl9C51TDHAVlpfPOzNSN0lr5WAC0OiH
         FUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456242; x=1781061042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkUPkSV1yVhPwfuKkUdfLaMgLJzqLtKdtBHH9XilSKA=;
        b=er7h0OjM6tFidwBO1FZgJpJcODOINlMqavxVVz2AHevcgd+6sO4WOJH0xhYgd0o1j7
         xH0umBqecnzZoFdfXhbo36minpvfu4cYIqCbLZL8wWEnAGb99aXY9ja6n1/Xu0jgaN0j
         bH1H7UFKS53ZnIROqSDiUsH32fM5lWKMx71kSJa7jaRyTm0Z3au2Nq1tWRHJc2tUzBi/
         E4afL6XKLbr8eRKSKxS+X/JPc6t5X1KZKIXxIQv2qgK7/QLDa49GsklUeXCgbWdNovzI
         yrMCAKPkf6M+Oc4ybKMRd5o0ZqXDqCSiVmqWh0Ia741384MQqczLwezMXYjnlhFnDlHi
         WHNA==
X-Forwarded-Encrypted: i=1; AFNElJ9RGXGeiFg1aDn068wUMIglyjsN9p1Qn4y6TZNRgs0xCULlbt526OMt9FXvrkZC+1v2+wKZZbfzhI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdBNgEFYDSXrXazUtJDQyNOZoit2MbdDRCa6iXMTTaoLQOvwgp
	VIiExVjIFT1wJBOgscACygPGK8c4ihXskQpSL4azGbenkoO/Jr809W17nWFtC/vwtrQ=
X-Gm-Gg: Acq92OE6Uv+zx5Ilij99wtLVsizXJCkkLtB0ThGjb8srP0svkB5PIYrFE4h31v08IF8
	bHIGyvF75aR5gBfVIikFoAqSU/1okI7LsTy5iIN/VeUlSypC+R4EZuZ01BrFADu8imZBKIWG+G4
	5TmgkJVgn98hWA8xPkrPS99atywy12SN8W/itKZEcxecTUSNq/vK5DLi+HT+p6F0kx44dTBd+CC
	0ATSXuvbTxjFH7XKqbBTnuLOUM3hcKabZcyhvTKbtLHKG+MA9DWBGMqt17EhyPIcRWiYfe1pHMN
	khEUcGjMIAzSBnBvyOL8yYctR75IhOqFSM6QuI1e+vGmjsQZlGSwMrT2bQtP1mHDSERe8hf98fJ
	0q0ITx8rPbVxaxbBxN4hjRyPULZD6/le88NFFN6DnAMvPCd0kxPvOytKePBsTWjLsgpSlQ9itVU
	Lhi249SrKOUdiG+8JS9ZGG4E/uNjJ70u6eIkGawo8lle4VxZ3rIBoGhCvE31UUKyDUu2mk4bu+
X-Received: by 2002:a05:622a:2487:b0:516:510f:2dd5 with SMTP id d75a77b69052e-517786c83c7mr29904991cf.28.1780456242538;
        Tue, 02 Jun 2026 20:10:42 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07f0dsm14637641cf.3.2026.06.02.20.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:10:42 -0700 (PDT)
Date: Wed, 3 Jun 2026 03:10:40 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
Message-ID: <ah-YOeu5PYa4d8xe@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-3-pasha.tatashin@soleen.com>
 <178038801485.119771.9514973100282773342.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038801485.119771.9514973100282773342.b4-review@b4>

On 06-02 11:13, Mike Rapoport wrote:
> On Sat, 30 May 2026 22:19:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> > index 146414933977..8d9201c25412 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
> >  	if (argp->fd < 0)
> >  		return argp->fd;
> >  
> > -	guard(mutex)(&session->mutex);
> > -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> > -	if (err < 0)
> > -		goto  err_put_fd;
> > +	scoped_guard(mutex, &session->mutex) {
> > +		err = luo_retrieve_file(&session->file_set, argp->token, &file);
> > +		if (err < 0) {
> > +			put_unused_fd(argp->fd);
> > +			return err;
> 
> I don't like piling up error handling inside if (err) statements.
> 
> As we only need the lock only for luo_retrieve_file() I think it's better
> drop the guard and use goto:
> 
> 
> 	mutex_lock(&session->mutex);
> 	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> 	mutex_unlock(&session->mutex);
> 	if (err)
> 		...

ok, done.

> 
> -- 
> Sincerely yours,
> Mike.
> 
