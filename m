Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CAB34F484
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216512; cv=none; b=s2Lph7OPZn3mkwNNzz2UzXOZGrsUSx8FKqxC57uF7AFwjHgkKcSr0cCp0gFQghBxGLOJh57yNXKp1j3HJEOeo6W0P7LctNYjMNgIY8wTW4kQZeKqqAT6yP08UFRD5BPSrbk02SNQixva0+n6dL/TaxinJnN5L5s9qKILbmJd3vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216512; c=relaxed/simple;
	bh=UY4PAtYCPhfTFvflgw9McFBL8GDEV1IGg0cYHqj+SP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTjUbfBEJ7sBfrJhRENi2y88l+ljYACQCMm6GX+KCgj7lcOy4PWBrI9OxwCDkSOGAtu6cpoLM4E7vktdfHMQXJ4agUFFtsbfHVtm/u/H/Zxz9Xqcpr+O0Y7Txkoe+4cy1XlR5y25wprIjMQXFlmUqzwXTOKRdvVifgze4t4tyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=OMAzL0Rk; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="OMAzL0Rk"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b1099192b0so100758881cf.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1756216508; x=1756821308; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WXrsBqa903YM8Bb/iVPoGxewN+EOL3SzPn1F/Ek/XpU=;
        b=OMAzL0RklIwJFcqgzEc6yGluGUmxfi/KxSKTicurIEIH9poMz8tj1w8ld9oh24Q29b
         ZgILejwmV3r7VTOC5uhGPVa6popGpqQIFb66SOpdZ3tENHivn8HMV7mXO2PVYOWEbnSP
         1fn9TN281vwcIO8qFVAIsIMrvjMd5PIeLt1s3nc9suDmvKeVvco2KFH0jwewM+kb3ZrI
         3ntiOPJ6DQt7Np+Bj5xBShG3e6RYJpWgf87BNsJNc7317EtQ60LjF6dRGyMG54SaRH0D
         DLCZ4uHNm9WyjVB27zZuaiWwc139BRIbI7DgW8PgEr+q5iCe2g1XQZuteFydZoc+CUvY
         LD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216508; x=1756821308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXrsBqa903YM8Bb/iVPoGxewN+EOL3SzPn1F/Ek/XpU=;
        b=QyWC2BG2Cp68Fgwr9/3120OA+Y8f2v3R0HEdgvHaGA/jme1mffP1esvVvkg01w3aN7
         Vynzz7EpMLprGkXG3EYkP0OY0PycGAfWXf7dH6Y7poNE4WGMzCVht1ShDH6IEflcLZM+
         Iw2y3xicd/tDit7iNFxB9gHoBEWFWah8bkCN8yPc+NK8VvYtNm5AocAE8cwgdyXW+wFl
         O2qiCLg4F0F27UvxPMDbed5kvI2lwGGDR84Jv/cxN/2fc4DUxJDxWpnAHiSENDMZ+ZA/
         HLdV3YQA+09EcgBE8G/aIdVBctyzifyMXsausBuuiNrW35zz6A/9fln+d8WrLYAgJdDP
         tXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXkEX/YlYFxwWvbgAh2cpbQe6VWey0+xJKNDX+UtLUNPNFLQXne6rbssHQg4LNeD3hwRqgvCtDbRCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWLC9wJVGjlfotUxQbl2GZWH6V4sSEW78q2Q8dmYSw5hnG9ve
	IoVNPZGQYCUrkj3yHgWtkgXLIRAcuIo7YKLUNAq9aNRq3F1cdYPoO2/2cVNT9qRID7uvrN69lE6
	hKUzxVVLFykJqE9J6X/O5KORHxJX8srFCylTqfECntQ==
X-Gm-Gg: ASbGncv83q9ta+BAjLrYFJYeGoqZd3+klTU+DRwTMWD5IjkGaUPxJoUm/CNQWLW5M3D
	KyQNR7JGuKsiQ7EjPRHzYK27RynZ752DXQx91lgKRMXAAEIHi3DWXu5mUgwk7f2zcO+OGkHQVDP
	gxcWnk4260ZnyqHvUUlyrKBdB4t6Q0ZSGr/twiYKZf7dNDP4pmyQ73WgXJAV60eHDXtBfJMo7U9
	TqM
X-Google-Smtp-Source: AGHT+IGcGuep7n1ZMQbOLWojaFaiFK2h2fVsewAul/Hz9Pfb7IpF4bpoR5o0QPDcbUbeNlPIwhAjeljdyRG6U6RmHSA=
X-Received: by 2002:a05:622a:4083:b0:4b0:851c:538a with SMTP id
 d75a77b69052e-4b2aaa81e96mr162452241cf.8.1756216507983; Tue, 26 Aug 2025
 06:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com> <mafs0ms7mxly1.fsf@kernel.org>
In-Reply-To: <mafs0ms7mxly1.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Aug 2025 13:54:31 +0000
X-Gm-Features: Ac12FXyb-9ofKcB5jLMNzC24BIRSCWuL4lKgd8Qnfh0hAm4ydgvkrr7-UIknHkA
Message-ID: <CA+CK2bBoLi9tYWHSFyDEHWd_cwvS_hR4q2HMmg-C+SJpQDNs=g@mail.gmail.com>
Subject: Re: [PATCH v3 00/30] Live Update Orchestrator
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> > https://github.com/googleprodkernel/linux-liveupdate/tree/luo/v3
> >
> > Changelog from v2:
> > - Addressed comments from Mike Rapoport and Jason Gunthorpe
> > - Only one user agent (LiveupdateD) can open /dev/liveupdate
> > - With the above changes, sessions are not needed, and should be
> >   maintained by the user-agent itself, so removed support for
> >   sessions.
>
> If all the FDs are restored in the agent's context, this assigns all the
> resources to the agent. For example, if the agent restores a memfd, all
> the memory gets charged to the agent's cgroup, and the client gets none
> of it. This makes it impossible to do any kind of resource limits.
>
> This was one of the advantages of being able to pass around sessions
> instead of FDs. The agent can pass on the right session to the right
> client, and then the client does the restore, getting all the resources
> charged to it.
>
> If we don't allow this, I think we will make LUO/LiveupdateD unsuitable
> for many kinds of workloads. Do you have any ideas on how to do proper
> resource attribution with the current patches? If not, then perhaps we
> should reconsider this change?

Hi Pratyush,

That's an excellent point, and you're right that we must have a
solution for correct resource charging.

I'd prefer to keep the session logic in the userspace agent (luod
https://tinyurl.com/luoddesign).

For the charging problem, I believe there's a clear path forward with
the current ioctl-based API. The design of the ioctl commands (with a
size field in each struct) is intentionally extensible. In a follow-up
patch, we can extend the liveupdate_ioctl_fd_restore struct to include
a target pid field. The luod agent, would then be able to restore an
FD on behalf of a client and instruct the kernel to charge the
associated resources to that client's PID.

This keeps the responsibilities clean: luod manages sessions and
authorization, while the kernel provides the specific mechanism for
resource attribution. I agree this is a must-have feature, but I think
it can be cleanly added on top of the current foundation.

Pasha

>
> [...]
>
> --
> Regards,
> Pratyush Yadav
