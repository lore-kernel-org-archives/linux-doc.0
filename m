Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4576C307AE4
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765309956; cv=none; b=Ui91AjSuPtiT1VcxnSAEca+x/YZN1Fse+ofw9G4hdP+opije333lbwPhezMET3XnQnxs5UWzk1bPcu9JCsy/2mrQ5mt6NLf7mkGdcI/EoN60tW6gmUwqBGVByHDBLmMkKfgSXOHt/17/LRxWrITpsg9vQoykJrIZrxsZb8L56mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765309956; c=relaxed/simple;
	bh=XHL/L/FSKYOnQq3SetiqQKZ3ve52BsUb+UjL14KbL8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3mqlUjLooXQ9FONMJIhZhdUFHVcOnAbPg5GQmDS3/SW5ResAHh2j31Zbjt7Ty2qSG0FXBCVtOHDV6IKr0oQ6MBf5MdvRd496WTipxFbxg2qzZLXNWq377oiok3NUewX8Z+k+R/9Tt4NwN41ZZJg86opZlo3wnRkcnr5zzruBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYS/YKwB; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYS/YKwB"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6433f99eb15so5424131d50.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 11:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765309953; x=1765914753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+S3XRmIfY6Nu+N2ZLCSjBdZjpwngwmUECGmLCvjDHC4=;
        b=JYS/YKwBT9uINGJs0YtoEei+BcWgPlR28O3aqTc7ELWu4ak8jt96qj9N1A6rFEx97y
         UoKYSu15kAi67xNZxzfPs0wRq0bWRh92qZx9kk+Jgy9tw31yGR3fmzJqAjwg4A4MOX7P
         9bL7jbxmonzsi+LHrD7vqtHI1W98N7C8byFw44IVvhL3FBZdJoGQW/pzSoMHW+eGOB9f
         X+g9AEgJDlsgG1Nz1WhPlCaPKHJTvHM68ooA71V4Gw6wC/FqskNUvUrASYlSq6ek7QQQ
         zROMwFssQ7rk32CJwEQmETzhC6q1KpDga/wfeAkXudp4GV0SMqOZ2uQZvhD9Fb7CDd7N
         sydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765309953; x=1765914753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S3XRmIfY6Nu+N2ZLCSjBdZjpwngwmUECGmLCvjDHC4=;
        b=NLM3DgU0sFCUbvU7rWnFd3yGpS7He8T9GIWuhB9JBNNnOsCW0jcAFClpKNpiK1nzUD
         VbzHRKonzM2t27mw/NTUZF3x88pqmyPWLBWbm04NA7lk+0wwQq81ur7XkW9i3nt9KfPb
         ZC+5TvN1hD6d5e33B5cjWKKhWqwAlLP9urBVaCJq/RtUDjDKmnNELfOykRTGsWeyEnRw
         ncqqwCpADG4363ge4vdllMYE112Lj03i70HDeTZqqjDufPbXZ7WYNfYTXen1mpXjoTT7
         XlWxjX+Zc2FQ5tTkkvPBzfsgQs8JRO172QdMFAZWoslMQhn8o/36cNGjjafEF8ar0C4D
         4lfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW/dA6SvbuDzIGYHBRKMnXPTloMTslkzZ8H+EpO5sVrDTfPoBGY2+68GGDJk9vkj5ZIAcnWAsRXRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9mNbLdF+zTmKctZ9dM8J365UEsvd7iLs4yNo7+W98zL3ENhNg
	zy7eP1KlzaF/rQvNxd+6bGTxrAslesWxXTI2lSZR+dvLBzY+AmTVbaNm
X-Gm-Gg: AY/fxX4HLbl9kML5jOauWecLFrDfurtyi0xtzNFlj8ZgfpSjpvj0Ecpc5KTC8cJAJdL
	ZAun2qhY86A0k/TN/6baJgvpPYzimOOxCNDegOiiLDggmPrQuLmlNukraXhtTsD/9+smDnIVuSf
	dDoKzCVxVBvrX9iLWLEu7JYj18BRuWJ/UuIfgV27Yfkpam12AJTDgr4AX08g/BCGbvz2LzNaela
	fnf+I9qNM7Y8rnwOPDUljqOCfVvN3JPset64Eej2A3DyewW3UAMBSFXVQZszj4CyrkeLcFcf8Pk
	/hHjQpUWrTZjams8nCiUQS6PZS5FZAFrmL450A3bo6yhN4PlXmazRJVUUGcfgd8pY0ClpM/fkDB
	3IJZtjFWSXX8tUUqJHfkf2yFtTz/bUOhQANC+B5X2iUnodpVFqr+qBz7tOaxfD5GOMuz9G75F5J
	J7w8g1S77Sn4qFuQgVr2i0RGWoztfsuez1u1jHD0sCEZvcL0Y=
X-Google-Smtp-Source: AGHT+IGVa6r0iFDuAtcL6wIkP8nbDpeCfCQK9vF2pnYiCLEjTySXlHVWrlq2gK/PVPin4gJW60wg5g==
X-Received: by 2002:a05:690e:2543:b0:640:d255:2d6f with SMTP id 956f58d0204a3-6446e93f952mr78609d50.34.1765309953244;
        Tue, 09 Dec 2025 11:52:33 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:54::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ae638sm63277367b3.4.2025.12.09.11.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 11:52:32 -0800 (PST)
Date: Tue, 9 Dec 2025 11:52:31 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v7 0/5] net: devmem: improve cpu cost of RX
 token management
Message-ID: <aTh9/waV23uRZc9E@devvm11784.nha0.facebook.com>
References: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>

On Wed, Nov 19, 2025 at 07:37:07PM -0800, Bobby Eshleman wrote:
> This series improves the CPU cost of RX token management by adding an
> attribute to NETDEV_CMD_BIND_RX that configures sockets using the
> binding to avoid the xarray allocator and instead use a per-binding niov
> array and a uref field in niov.
> 
> Improvement is ~13% cpu util per RX user thread.
>     
> Using kperf, the following results were observed:
> 
> Before:
> 	Average RX worker idle %: 13.13, flows 4, test runs 11
> After:
> 	Average RX worker idle %: 26.32, flows 4, test runs 11
> 
> Two other approaches were tested, but with no improvement. Namely, 1)
> using a hashmap for tokens and 2) keeping an xarray of atomic counters
> but using RCU so that the hotpath could be mostly lockless. Neither of
> these approaches proved better than the simple array in terms of CPU.
> 
> The attribute NETDEV_A_DMABUF_AUTORELEASE is added to toggle the
> optimization. It is an optional attribute and defaults to 0 (i.e.,
> optimization on).
> 

[...]
> 
> Changes in v7:
> - use netlink instead of sockopt (Stan)
> - restrict system to only one mode, dmabuf bindings can not co-exist
>   with different modes (Stan)
> - use static branching to enforce single system-wide mode (Stan)
> - Link to v6: https://lore.kernel.org/r/20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com
> 

Mina, I was wondering if you had any feedback on this approach?

Best,
Bobby
