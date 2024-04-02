Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7820E556
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 01:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712021210; cv=none; b=h4K31ZLslGpr0atpzMAtduhtRteFu1l1n3fmp+goNstcEvQxLSzozypNNxgXHzu0IyyYktxsq+2luRz3I8Dw8avabzTc+185rh+cG6K5e+kG6Jb0P5mqDWYe7pgMuRSETzfRw+epW527PQNtPBrt9I8CVqtA7szCC54D1Vu/6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712021210; c=relaxed/simple;
	bh=WqrYHc1OrW927dxpv9fTrIBfKRqR2NBvDdcY6XIS0bs=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=eIAeD+mGQ4Zwpowl1CTZKQc8QeD+3VeJfYrs4wp35txchmVhQQ/mck7iknw4AH+X6i8EOLmoK/6yINGQPWZ5LwsClhPrfzCtZtr6tJGTA3ghQSeGzZ+YAim4NU/eFRgCzdDsdfakqg+hNdGzeXAPfYhw3GLivUfChyUNfSrfbZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=G4lN+Yma; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="G4lN+Yma"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-432d5b5f00bso16755421cf.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Apr 2024 18:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1712021206; x=1712626006; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hRws9YXLN8yb7zuQUc8CIutzWgp4avkTPI09HZCU6cI=;
        b=G4lN+Yma1v3mXG/SF+E4Q4Vmtq9IXlAYYEGNzQXsfUcjzmflAs+JTdgx6LMlAIFL9g
         HDlwt0Akkidq+vZKEYCuIM8jG6PdXrvmlZSZvYvCuuoFw+UXnJWjIQVzVoTaPmseSUjB
         drYQtYihg223VfBX5smeEnjs9qy+vAJ0lPjCvzSMy/HoNWd/TZEAO8q6QRngJdOnp4EN
         9xaNBt90oS9blyJa/pJykeOXUxR6rsO8BLXsKDz6q/rxfL+/lA7UkmJHT3RL6kelYr/t
         eRDPrIDjF8MoOn/FpM4kB5PBwj/pbnZQyNAOl+U0vdT69ZGIZF0SqDAiL/yIpoyYbrEx
         8StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712021206; x=1712626006;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hRws9YXLN8yb7zuQUc8CIutzWgp4avkTPI09HZCU6cI=;
        b=cCHTFFm2OdZE9Dl52VOvli4R7FozmtJAQU5uobgzX5TcRZV8KBKhLDN7oHgstjro3V
         +cZyWl8eO/I79Vwz2qlNLqTlPqwzPIFvecv+TwzN2GlA2v8uXFVchThsZBC1c+semlmY
         lvwzsA8vRsnQ/8xtLdXbKZ5UwpuvtyuyY4fHB5qOXd2J+SF4pjX7Mkr+TUm8iqNdI5V/
         5hFuKIlX61ks7J2UCmPj/4kXWqpWvaWEE2dnDFltxxL54zgL9hP3xRvoGy5q9XcEdysU
         9H25hzBsGUH3J5xHT5nXXErTeLXEc9QkJA7yiEqkh2MInHuSl6F+iwA0r97PoxkEUvYH
         RY5Q==
X-Gm-Message-State: AOJu0YzuuzHGW3cwm8RQmLfh2SGXaC+FQ+zr1DCx2aGLgvfQX4hY8CRl
	amIFcw9nNR8z7nfARicnJvrhpKHHufRYeEYepi463FBuUtUFV6f6WNAYTJ6Tcw==
X-Google-Smtp-Source: AGHT+IFZ7SasfMMYh5vB3j/xGXqf/TCs4Bcif8z6dD6zV7+EZAG39P9HJEPaE4K4Urz2UW0TPzSDug==
X-Received: by 2002:a05:622a:4b11:b0:432:de8a:3a8 with SMTP id et17-20020a05622a4b1100b00432de8a03a8mr9661426qtb.18.1712021206548;
        Mon, 01 Apr 2024 18:26:46 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id fw4-20020a05622a4a8400b00432bcd630c8sm4405470qtb.93.2024.04.01.18.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 18:26:46 -0700 (PDT)
Date: Mon, 01 Apr 2024 21:26:45 -0400
Message-ID: <7bc35832c837a23773424bdc2255808b@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, fsverity@lists.linux.dev, linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH v16 15/20] security: add security_inode_setintegrity() hook
References: <1711657047-10526-16-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1711657047-10526-16-git-send-email-wufan@linux.microsoft.com>

On Mar 28, 2024 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> This patch introduces a new hook to save inode's integrity
> data. For example, for fsverity enabled files, LSMs can use this hook to
> save the verified fsverity builtin signature into the inode's security
> blob, and LSMs can make access decisions based on the data inside
> the signature, like the signer certificate.
> 
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> 
> --
> v1-v14:
>   + Not present
> 
> v15:
>   + Introduced
> 
> v16:
>   + Switch to call_int_hook()
> 
> ---
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      | 10 ++++++++++
>  security/security.c           | 20 ++++++++++++++++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index b391a7f13053..6f746dfdb28b 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -1020,6 +1023,13 @@ static inline int security_inode_copy_up(struct dentry *src, struct cred **new)
>  	return 0;
>  }
>  
> +static inline int security_inode_setintegrity(struct inode *inode,
> +					      enum lsm_integrity_type, type,

Another bonus comma ...

> +					      const void *value, size_t size)
> +{
> +	return 0;
> +}
> +

--
paul-moore.com
