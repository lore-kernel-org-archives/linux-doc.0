Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B5E192D9A
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 03:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741230828; cv=none; b=WpzlJIX6zC77LID0ozQacgPC7oWM2L7994PpITR26IHkdPHbSDYdfWqyGAVEmVXvDBIQLp00aBNN0xVgsKunJZtZzD0TpEi0f9ZMIK9fAteHhmrGMS0tZ7ml68YvqVVbnG0AD6fvRM4aNsYJtxEOz9cxmCv+b8TWZqMb40Q03S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741230828; c=relaxed/simple;
	bh=oZj2gcVqtx107nGAwDgWw/kXoOh4Lwz/K/smzUH9Qtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L99Nmk3jyVecOxJkMaHlTbldr+ur2Dc5b8M7C0anGBs0k6ftR7FC77asuZrRzfS+yvt3oYZj35O080lE5Jwy1VTdSZbUdG9N63kQiNebZOsfE/Q2wEbg0glXpJOrUcFpTH0W0uN6gS+DztkQtoHaPw4TslFpc6Xtb2Kcun+fEeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IqsLn+Tj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IqsLn+Tj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so170111a91.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 19:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741230826; x=1741835626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5RD/anlchtvUN+J2asseqeoYe9S0VGBCfqERf+0yHQ=;
        b=IqsLn+TjnzVO9kfZQU8c/t0LkueDvnHhFA5o5hi5QjDFgOsVhtPDWOeJnF+UQ+3qn5
         bjuSZYL+PQ3BuI3b65Lz6RijP6n6wFzRfe7RcZSVM4M78Mh+Lev/cnd91IEmB+xazFWY
         QFLWaefEEiIlmpHQIsWt5BvEH8hY5v/kb3n+e0dxz2J/5LHk2isr9of7b3NyXCAx77eI
         CTcFWdAv7GFiMgq6z8joYcQbLSu0x0svPsyJ3DSFEJqiYzo/YnpMYBidl6cWaSzydByG
         d5xGw+BINq0PDd2uZ5SFeye1/q4Yh4gOGYd5C30ZhM7nPCN1yhc+YGmeyGadYt3NMw2V
         upKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741230826; x=1741835626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5RD/anlchtvUN+J2asseqeoYe9S0VGBCfqERf+0yHQ=;
        b=kkonUsx/I5Uel5hoxwoDGWm7lSUZrfj4+h3cVimiUKhronRp8FFqkAXfPzk89HXEM6
         LejKhnk3TQrCP5R5Z2SKsSAOa4idNA2p0c8pH8VGdIsPg4GKF2+QKjIUYhv/8SBFNU0d
         UzRPMMXAZ9Dkp18Vm75qKA9YGlXjosLvQ5mTp6ibVZoxGjQAcZOvSLAZ1GqzZUM3dzt+
         cIfiQjV5FWOMloXhsQsQpFdwglpEb9CCldNARwTVsDniOArL37URovogtwTqZrem7KQ4
         dEkstNVbTB1lIYGJkHUjd/V92FTd66hvWQcMKIllRp+Pn2SE4ilUOrA1ZdetHovXKfVY
         qBnA==
X-Forwarded-Encrypted: i=1; AJvYcCUbMwygUvAQSRcN8KxRf+ADcI2ELDPwEQnPrcW6s53JD4JYW+yAZKV8uQavzHrSDb7wPB2EYYm9X9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkNYj8GHD+EBegFTR76dHSuCpF0cKEg4SQGSJQr834gvC+88a
	kXYPV3l3beHO8Pw3EKi2nHyj5cK3uDKwdbaaxVE9MctKyJF7aBNeg7q/OHtTlFo9VTxuGZkhERb
	Y
X-Gm-Gg: ASbGncvbMgiGojW1aiK/xtmQsWqZDKMxK/qBbMpff1SV5kcD3T/eXjMvtcMliQyixJL
	v2wtnC1xBkMCXMz8JCXx/Ph2BS2p3sbdmbm2Ow9EKwnvrppoLHUSTJEh0Qb+XGM6NDzqjHcb9t6
	a1euz3jPryOIH9jNJKToSsCkhk81+fSviNaWno5Nv+6AjGdRvm6YFgMyKtvZVdo4jRtPWiSUlo+
	Q60btyfbNQCQDHG2nzGcKtOyKSJwnDpJHYQqgusih2pHiwHxEbdUSj0SazPLr383Y97umkFGjwK
	r+BAtD7eVUsetaI7qbCBreu1o/XK9591F8RzpyD/
X-Google-Smtp-Source: AGHT+IFAnj1sMagzrkHZedECAW3Sn3VCCOpRuX3Fuszd2qUqpa+SE+imKpqY6qvecbaMRMlKdEZ8Rg==
X-Received: by 2002:a05:6a21:7881:b0:1ee:ef0b:7bf7 with SMTP id adf61e73a8af0-1f3494d8caamr9973803637.19.1741230825737;
        Wed, 05 Mar 2025 19:13:45 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9b3c:3246:a388:fe44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698538818sm202152b3a.178.2025.03.05.19.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 19:13:45 -0800 (PST)
Date: Wed, 5 Mar 2025 19:13:43 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: corbet@lwn.net, acme@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] docs: Correct installation instruction
Message-ID: <Z8kS5yd4znhULlSY@ghost>
References: <20250306030708.8133-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306030708.8133-1-richard120310@gmail.com>

On Thu, Mar 06, 2025 at 11:07:08AM +0800, I Hsin Cheng wrote:
> Ammend missing "install" operation keyword after "apt-get", and fix
> "build-essentials" to "build-essential".
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  Documentation/admin-guide/workload-tracing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
> index 6be38c1b9c5b..d6313890ee41 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -82,7 +82,7 @@ Install tools to build Linux kernel and tools in kernel repository.
>  scripts/ver_linux is a good way to check if your system already has
>  the necessary tools::
>  
> -  sudo apt-get build-essentials flex bison yacc
> +  sudo apt-get install build-essential flex bison yacc
>    sudo apt install libelf-dev systemtap-sdt-dev libslang2-dev libperl-dev libdw-dev
>  
>  cscope is a good tool to browse kernel sources. Let's install it now::
> -- 
> 2.43.0
> 
