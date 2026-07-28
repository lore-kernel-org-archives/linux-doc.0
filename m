Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133403B71C0
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 05:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218358; cv=none; b=CqZIn5Zis/zn+IMJvTnwiVDbqc3OdcYf5BeHOvFEcCtvZ1zgoDi0lkTPup7K7nRRdXXkjZ1CbP3jTYfHPb5AvtX0UEULq8J4PdWhFj7Rrm80QC1NEDEZuXh7dOgBv51fsNCVVDhaPkWR+OzgzXzCo+xeVGMnUjZX1DXGqzYZXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218358; c=relaxed/simple;
	bh=/uEnhCDL7SCCuyNWCQ36kTFHnO/TcigqDj7SZJp3+xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDIMDOWgYDvxjuWjpyxq3Ii0tIlRXzOfTgfiZzMx/1M2zj+Jokb/Rp//FaPqJ1nszCiANtWINnNUJXktFCYGvXwDZNHingSVgtPxpip01OrDtfccxuiqGDqstI5i7zhJcfguRHDjjKp9/t62o6AX0nyTEQibYnUsW2aBZ0Kc0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYQjmpfZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYQjmpfZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so3374803a12.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 22:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785218352; x=1785823152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5MvRezEXEt2tpdeT5IBYM4ttRFhGTd9NFJNVr3eXdD4=;
        b=JYQjmpfZLqKvXSTDIh4ct0NdFuScJd6PvS7lENd9A1FBsPF2VbtxfC+D2FY/HZN4el
         N8Ikvw8VH2mdcF1KBRomEnyDGIsjX0Wv/kXSiPx9G/v408sL8/4j3PpZaujv19TT81zC
         LAlIRKN2q9x7nQLs5QcWRuE068rerHUHh+ZTyGieA+Vm6VTwiMbuAwy8y2ILIw/84QjS
         YnLMxUm7khFLuFaeKJT/bG/SsONV80+E9osLzheCQ9S0bTximLPzL1MbuRNQOzlV1QLk
         AIN3LC3pI5Db6k4t1/VufhzKAI1MLqNV62iqOwHuwMKTGRNYo7sZLlYn8boD8RsAgHVj
         JJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785218352; x=1785823152;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MvRezEXEt2tpdeT5IBYM4ttRFhGTd9NFJNVr3eXdD4=;
        b=bcvJw+uVcIlT5NSwJNZsO4rn4Hlg/QDJq0+xLQlyIB9TZFf/cn3EsLjbHACFnMtL3Z
         TUtWUoQxWLxNNecLYxqC7i2nAtR3X2wppnxfkpF4zi+3d2CkCZAUhXbekPxWG+lPstaj
         6JhmVCGNpl2Qimfxh4w9IU2+Q4Doqp0jVdQeBt/TvUVGI4nOTuM7y2eE5d4E+YwE+aih
         GbAs+zKrsDTADfcAcV9/wYLbejOjvkSQ2okHZE0wB1w/jiE4GZt8qQITeFjXVZDsVrjx
         Qan5qT4R1qEHQb4nzUamyLvbTZgVV9nIPkl3WgwprolFatqKVxY56ejwRnP8UequCoN9
         vuow==
X-Forwarded-Encrypted: i=1; AHgh+Rq5JHDN6r5F5IItPCSTEEN6He1ZL9KwFHX/sCkLz9oinGmDZpvOACM6o+gJ9ISvUwtoKB8Dh8S1lOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHjF3+PgEZ6Mr2PWMVH+uCaQFsrmbsIpWU/lMZ1/8Suv89x6t
	FXCPnC2qDupGogfCCc/E4ywU8FisKCOVGWP3n8VPvcswjxHNrpT18cg=
X-Gm-Gg: AR+sD130jSCq4jGWPTf3hEw9w0Khk7/sjIBYKmzY4W2I+fM8xwQS/CgFbV/5p9vQbqL
	12fhB59auxhWsByfn55R2+Ca1fAjaZf24zCxXGX3IdCDXoq0Dlpn660I2OhGa5aZClujqpS8UAe
	PIPdh2OfTETmM1LGpWKGfCHbXmTeaDzh2TWnBfvXmZ5ZAS7RUMYg6hr3dPLHhu6s26KKc5RoUnS
	1QxaGbUMbH7fq2yCKPlvNmPx51/FM9i1buKWeRGa3che0n7ChLQnM1HrNFWRfpgXks7+Xtl8Rqa
	U3JSJqqoLZzI7W2E9chqmlDjhowxkNAzJXvK2BerO+XgG+hO0zhj62w69qRE1p3aXGs0jP0Chr3
	PoQAhQkzWKodoldE+CjOrJgaDkeuBGEqCsy5lCF5rkGiw5xF0MUoafXZ2SGGo1Rq2hNglxZDCvh
	DKLsJ9
X-Received: by 2002:a05:6a20:2583:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3c8aaf7ce69mr1407941637.12.1785218352478;
        Mon, 27 Jul 2026 22:59:12 -0700 (PDT)
Received: from localhost ([2405:201:8018:1843:d15a:2306:abbd:ee25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm56009356c88.7.2026.07.27.22.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 22:59:11 -0700 (PDT)
Date: Tue, 28 Jul 2026 11:29:08 +0530
From: Ayananta Paul <ayanantapaul@gmail.com>
To: donald.hunter@gmail.com, kuba@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] Documentation: netlink: fix spelling in
 tcp_metrics.yaml
Message-ID: <amhElJLQoUJE3lwA@ubuntu-btw>
References: <20260728052507.9954-1-ayanantapaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728052507.9954-1-ayanantapaul@gmail.com>

On Tue, Jul 28, 2026 at 10:55:07AM +0530, Ayananta Paul wrote:
> Correct the spelling of "reordering" which was incorrectly
> written as "reodering" on lines 113 and 115.
> 
> Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`
> 
> Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>
> ---
>  Documentation/netlink/specs/tcp_metrics.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/netlink/specs/tcp_metrics.yaml b/Documentation/netlink/specs/tcp_metrics.yaml
> index 13144aeed31a..dddf92bedc4d 100644
> --- a/Documentation/netlink/specs/tcp_metrics.yaml
> +++ b/Documentation/netlink/specs/tcp_metrics.yaml
> @@ -110,9 +110,9 @@ attribute-sets:
>          type: u32
>          doc: Congestion Window.
>        -
> -        name: reodering
> +        name: reordering
>          type: u32
> -        doc: Reodering metric.
> +        doc: Reordering metric.
>        -
>          name: rtt-us
>          type: u32
> -- 
> 2.53.0
> 

Apologies -- this was sent with an incorrect \"1/3\" label due 
to a local git-format-patch mistake on my end (unrelated commits 
sitting on the same branch). This is a standalone fix, not part 
of any series. Please disregard the \"1/3\" in the subject.

Ayananta 
