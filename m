Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2563FE344
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252617; cv=none; b=hP47BidwzylZzjRE5oXtZiXx1P6fi985kz4M+PPKcuX7oYhv9WHOEcXCbkWfXpTAcpnIk7XZ+eSmivSOBSnIhA3h4ZulMQm/iwVNnmlm4LWaE3bkOJ6L6Er2RzovgLEjPZGVYJWcbDucrNscEZ/9od4HB+EWDzxg1LfyU0N2hWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252617; c=relaxed/simple;
	bh=t0Nlu+VexUsTkUu/gem9W65q4/pks24oKx+COgMx/io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFgvpRwHEFdtuW6za7vIHwZ7rmqI1wS9xEjPdC61bPnQOw0/f5T8oe2pHwnS5FGg3deAMp4byHDOAbv4hPpu20iiSJlAUqwNYzw0xWBUg3/o80hpG1mBXLo4I+2IgU21CgTrWUJ3acE2nnqBz6OGxXjfZiwPfHtLAQQcuNu5m+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1DV9bSP; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1DV9bSP"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b4583f0a1aso13875635ad.3
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252613; x=1778857413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v4XSckC+6HeNNAT2ObXLyFDVqOgPjF3vQM49fr0+IcA=;
        b=M1DV9bSPdIpo1HCzS+chpKLRw9yZEaLHH4hWt/8vF7kwxIMdWiQ56TFDetp2fD3dHK
         R0u+n+5f4iBWZtmqUudWXsg0H8PaVHkUHak4NyF4Yl/tD9W5Q83ulCRhidXVrpgwF1zy
         OxnEv1kIXlzfCWOaLDPy/oadOs/Vnb/U/6AFDW6eOaaZEx/e9U2TiiVYVT0MOCDY7TlL
         C5LkiulOrgIE+dbWiLgv+jXSyxNRbrdi7pje/7CMtnoub8nb+Fa/L6vaaBQZ9ozgoVvQ
         9Ia6bUMPwXknOYTSdI9JX8ETBTps+Uue9bS/EYFde3ymahVl65AjQ81p4ufqD8Cn23Aq
         FXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252613; x=1778857413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4XSckC+6HeNNAT2ObXLyFDVqOgPjF3vQM49fr0+IcA=;
        b=czlmjw+8z+toW3of1doxf2oPsJFywK2juCvXMxglouyAUlRvqQyCEdLi1Fl2tW7Bh8
         er/AuQU7F48JIQh9RJuAHLySXBavd+t8i9Qlo0bnK5VziKGxqdedg57xwtWGlpQnoBVT
         7T2tq/NBVvhfKTSdBGp2VWSL7MYo/cAgvrpKiBCRD5BnmjJLahl8cp8BJVzsINuoHhMh
         BYnX99uomFQ5TspDQI6/sfJglL/hVEkmLGeMDL2y9qwT6grpq2L4W4mjDgxwBsDjkZ4d
         uPVwwrD8+BdqwQtGlv/fxlKpvzVrmRIjrBF4tCmv5Qe3hDgu5Mujd9CG3T0hVzt0YdLI
         s0VQ==
X-Forwarded-Encrypted: i=1; AFNElJ809DJiDJyHn2Ec02mo2hfWuPChqmLMwPMF3U/QPZivt1uuX4WZMj0AjLR9atJ9PXR+xqzA8rhqG3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzThgCdh8ftq4lI6lAtpFoJwiYVRbRN/sUH9GeG6RaiTvk9Fl7M
	2hTUuGSH78d2zQAjOIQJKc2EnzagDcH40maao2MNkk0vFyRBzxiCZEvi
X-Gm-Gg: Acq92OH5r8mFy6FAyXW113/3WnZtW/FopR7pGS+plIDm7Ll+Zz564aSqdnV7qr+Biwn
	uy/kagx9+6cKcxdox4VFdhl3BqWDxhPuCBYisaHpq3o+m+uV/hHXDnYBaO1drb8L1Celj2OIiuP
	vGU5Tht1hyv+3PVVTYzYN5GKeRRkoTQnGUGZITUn/XaFs5ueDHrbDVK4E0fRX34aLIlAidJ1fLc
	FRFqm2+MoGVp0H25qr9R9voHVaxJXrxZUcPu2JbgAWT2gpBxTlPgWfZcFybyHqEeY1cg1PO9ej7
	V3BK4fPp4O45CAiU7LqS2PAFDBjk5XAhfAtUj08sIoC0mUd9IA/enz9CEC3Ctr0B1UmKe/qny9O
	RC/ypC3BArzo8GlnL+1pzarsdoNNkGfjihn5v6uqSLxIhNA67z12HwrU11kiJr9zY3Fo4yxXzFb
	aR
X-Received: by 2002:a17:903:4b0d:b0:2b0:bed1:46f7 with SMTP id d9443c01a7336-2ba799d5f4dmr143685845ad.37.1778252613411;
        Fri, 08 May 2026 08:03:33 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ecc4bbsm24477685ad.84.2026.05.08.08.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:03:32 -0700 (PDT)
Date: Fri, 8 May 2026 08:03:32 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, mohsin.bashr@gmail.com, willemb@google.com, 
	jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 7/8] selftests: drv-net: add
 primary_rx_redirect support to NetDrvContEnv
Message-ID: <af37O7TXJm9wPl1h@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-7-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-7-52821445867c@meta.com>

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> When sending from a namespace that has access to a netkit device with a
> leased queue, the nk primary in the host namespace needs to redirect its
> RX to the physical device. This patch adds that redirection bpf program
> and teaches the harness to install it.
> 
> Add primary_rx_redirect=False parameter to NetDrvContEnv.__init__().
> When enabled, _attach_primary_rx_redirect_bpf() attaches a new BPF TC
> program (nk_primary_rx_redirect.bpf.c) to the primary (host-side) netkit
> interface. The program redirects non-ICMPv6 IPv6 packets to the physical
> NIC via bpf_redirect_neigh(), with the physical ifindex configured via
> the .bss map. ICMPv6 is left on the host's netkit primary so IPv6
> neighbor discovery still work locally.
> 
> Extract _find_bss_map_id() from _attach_bpf() into a reusable helper so
> other BPF attachment methods can use it.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
