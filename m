Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E971FA859
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780231964; cv=none; b=qicKbC3KL99IOpiB6iPwWM10g45dpZ5Y6+pIe76Q3SwLtX1ALE7zRs+sBbruUQa0xn+NUOm2YVNW3LQgpUVhRe8shNjjwarF2ZkS827KhyYhfkeNDEPKnKo+GE33Cdtwol0BwtjAX1RBqFx1ArOe/gzipYBm9K0I/UepQZfuHws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780231964; c=relaxed/simple;
	bh=x8mfz075moeph0upF3Mu3jpczbDMMZHuc5hRryJ6wyg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRXKBmJXT8rDlhkj+f/7s2oUu7mEtZCKH/2Gyrm+7+vkjM5IJ5CwVFNDseH8N+EkzI5XSKupK/Ft4uCrttSNep7FOh2bCj6DpOxbtyN10tIj956x5TnuHJh7ULdqShXsX8yV4kPNX4a1z4ySxV08UGh0SMv9jEqcWRCr6z9axbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kdwcAk+q; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kdwcAk+q"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-915511c2cfcso53503385a.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780231961; x=1780836761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnMQ970O/37FDrK1Y36am7zIeSijQMUukVCUSJ3uyGk=;
        b=kdwcAk+qz5dYZlqVRUIFLZ5UdtfYxRTViVjSm10SH2lvAOTY9UIQARP0v18awLcFAY
         k5rwJmsmSiMjzXQasuXWI+M7ZLQb3ZYj3bgYUxCGp7fQt9Gwh+gdoqx4Y1mlunz7VTbv
         KoNPjubkzp17E6sPUpebCW26UoVLJryYO4P/8/kxkMjuVqTQ2CHUq8deZPqD+FZgqMha
         +diyv4ON4kngzjUtOxb35xR8WkLn3LHmnfZYITRSZqCD8zn462jWOJTtmO7YQ4CAwIzo
         OyF9E4o83pSbK7cu4mNFuuoD8NirlUC6kwi/xfHziTXKJsoactY3Uir6wh4sGsovG3sz
         76BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780231961; x=1780836761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OnMQ970O/37FDrK1Y36am7zIeSijQMUukVCUSJ3uyGk=;
        b=R5DIUjisHgUpNVVPfbrusCqOhbk3rQ5XhxITdZQN/9eq6vtkjyDEwIMRSKGTSk/ibW
         +G27ct0yRhAIOVvOHbPaY59yUpuQJdd0IKCqtLAyroIFusNwY6WnPNA/PRsZxhKVFJZO
         G+eqzUKl4syeFRq2tRoLnALFkxfw1SuEd768Me3oQPjSNZ62eiTodiNvrNszqRtLtETW
         cbs5XqaORizcS96P0V/jFcqbcpzt4AgC8kgAtLO+PjBaEuWR2UXVYHuYDr575OOjC73a
         r4+gPgi82WI+XGjx9fopiP/mX+lKuLIPSzvseTy6jZlbSETAOv/OIYkVJI5RYRLa8/+t
         SDtg==
X-Forwarded-Encrypted: i=1; AFNElJ+nswFyi/OtzGsXUdVetJzoCIdJ7PJwU5MpGuO9jmKBIjQ10nHj+2np3qV/3ospTKOdNcT3mSm7E2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTUg21k0HfZPIrIXfLMA0V7Na3NcD3j6Wgz8h953HRKFnfjGM
	S8cSQ/GySLLyZoouF9pEORKmYdQlxZDQodUa87fUJI2F3NhHhGWOx7vm67tAUCveiow=
X-Gm-Gg: Acq92OHd/om8NswGikhI6OrYyZwfaJIeEKZhRy/vye1/q1P7zUFoZeb+i9pK51vIpsN
	wHnlBMT2m21DIzfJ3RWGrTU4QCto0erep/ZYA7sk2a03cd5oJSSA9waXR/QsVslddIqSsSc801X
	ADNB40SRuqY16IwC4ppabRn8Vp9GR0+jeHA0lBUtEBzBwY+j1JP0CXnO63NFTQqv+kLb/Qiefo6
	GxaSHipArohbLFQ4W/CVl1dgGB8I2GXxv6NeeqshXw/6VvFt7ql0ergG8/opD/W5cGGARpve9Iy
	XD6aKbsqOLVrWVGhw7BDEiZxp15V21eNpvr6Zc6g/6jNFhn7tpEAMHl0xQ5iGipPWoKApg7BSXY
	EqNAazJH6ClvQuuhZLG0rPIcQMapkcCotqXxPdsv8UuUyKW4yMfkzQue681KDyjO4ThByBLSazZ
	aA9V8vImOqJRBXGYEFiQLIfJwseytL3FRN1XqsgVEENmBHqyaFWz1GMl79cVZgMQ==
X-Received: by 2002:a05:620a:1792:b0:914:ca5f:bc59 with SMTP id af79cd13be357-9153db8be70mr1156444585a.62.1780231961592;
        Sun, 31 May 2026 05:52:41 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153247515esm743332185a.13.2026.05.31.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 05:52:40 -0700 (PDT)
Date: Sun, 31 May 2026 12:52:39 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	pasha.tatashin@soleen.com, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
Message-ID: <ahwuA1tYmM0LZt0d@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530221938.115978-3-pasha.tatashin@soleen.com>

On 05-30 22:19, Pasha Tatashin wrote:
> Refactoring luo_session_retrieve_fd() to avoid mixing automated
> cleanup-style guards with goto-based resource release, which is not
> recommended under the Linux kernel coding style.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_session.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index 146414933977..8d9201c25412 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
>  	if (argp->fd < 0)
>  		return argp->fd;
>  
> -	guard(mutex)(&session->mutex);
> -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> -	if (err < 0)
> -		goto  err_put_fd;
> +	scoped_guard(mutex, &session->mutex) {
> +		err = luo_retrieve_file(&session->file_set, argp->token, &file);
> +		if (err < 0) {
> +			put_unused_fd(argp->fd);
> +			return err;
> +		}
> +	}
>  
>  	err = luo_ucmd_respond(ucmd, sizeof(*argp));
> -	if (err)
> -		goto err_put_file;
> +	if (err) {
> +		fput(file);
> +		put_unused_fd(argp->fd);
> +		return err;
> +	}
>  
>  	fd_install(argp->fd, file);

From Sashiko:
This is a pre-existing issue, but could this error path allow userspace
to hijack a recycled file descriptor?
...

Answer: No.

get_unused_fd_flags allocates an unused file descriptor (FD) that 
initially points to NULL. It is not associated with any "struct file"; 
this association occurs only during fd_install(), which is the final 
function called before returning to userspace.

>  
>  	return 0;
> -
> -err_put_file:
> -	fput(file);
> -err_put_fd:
> -	put_unused_fd(argp->fd);
> -
> -	return err;
>  }
>  
>  static int luo_session_finish(struct luo_session *session,
> -- 
> 2.53.0
> 
