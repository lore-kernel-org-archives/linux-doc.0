Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683747;
	b=YhvWQxTgYNWdtmqCnSoeqTWi/YFr8ye5D78F7Eioyq/VjgguwqpflNz7vj89F5L/f2Ta
	 fsQx5JSOJBKFyzDGk5mdilbGLnDDo9/CZ5vMpKfnUanjZ9W/fo7G9NCRiY4cv0AwaRNqF
	 bIJI3y+Atr/iNnRaGWVwLTTBvDrjoyLzaLVnAZ+rfEgQ+Nnxouvb52nRsdmo7g12J3axN
	 uCABKtFB208/LqV8cbZzS0kcknFx2rkrOvAfe9G65nbkUeZXtQUI+kcxuZPPXag6qvrZz
	 QTQy5h2ylaqtCUF0QMpdVIDfcCJ3w7m3FNn9sz/k+gbpUC0kLMs9AKfecz0VhFdoaXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kyA6YgN8qGDEZTh7erLhMR/RU8AaJWhDA/nGGj59ABQ=;
	b=Bs6caHFiXi9MfidCvL4qPzyQjpmtrDfqwnNYOhixHN/WpKjvxCpikFzJ4x2n0HuGJo3z
	 VH82/hOrOb1V5plAAFAZ/kGpFn9Ea0bnvfMkFR3A9GyLQiie4IR3oy6IL8FT5xlaO2Nr8
	 vf5W+jfJV4KniFdKqOLTHSFuLhXoi0t8rcnnbECM16vvUre87uLwMUhwt28nTUwonf9jJ
	 CvN+MtULSWbZrBSYRbJOZ7lXhEOFStgNNpT9INrsQx6aHUWVXGPbVpJjzhfK75H/P0KyP
	 iP9OI0sGPMEIk6659YgsjuMe3rgTZ7PiQLkof47NqFSuI2GkGKYGgwZci+qW6qQes6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AV1uMkMF;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E3606A324
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 05:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60E3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AV1uMkMF
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9d52f684fso37931535ad.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 21:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793683746; x=1794288546; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyA6YgN8qGDEZTh7erLhMR/RU8AaJWhDA/nGGj59ABQ=;
        b=AV1uMkMFV8Qiumc6keDPr+j6sMXlonF9LIML0A2w/wRFHDsaQN4MpgQR0Q2qOLVcCA
         qtUaKNdOXSx6ADJiCXYU402DFtzPKLGJCIBeJXIWIPfzAxNJt7YNWZukuDllBR0d2SRn
         Cs5KTulkk3aj1OMwcBeQIWlaNS5qlwzVCurABOd+UHwq4i1mCwaq4h/KB/qm0hwuVWks
         m8Mes/yRkuWrqcPi2wyCD8loycNPtsY/vPD6yqXIORZMRQIjG7oWTaZGvapPzC0BWIIV
         E/Nqm4aAchACgSvjhIgFGzoHMZgoSHBeALckhDrrcAGZvITmAQcpt/oWOPUaBZrpWBsm
         mLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683746; x=1794288546;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyA6YgN8qGDEZTh7erLhMR/RU8AaJWhDA/nGGj59ABQ=;
        b=lS2X4XUWkSnARNEt8N1FDvmMHck+eJlvl6aBm2fTo4sF1YkjygC7Jq4t1uvwuNTq10
         tdmX/d16U9qY9WqIORJnpedkJtYaom5FgKsLKhZq1iNsPCxQIGm9CpPajDER6vY86hc4
         +xJF24/hgSisa6F1m4N2D0YK5xbzozxesvZwpby53k+Oe1cbOnrs3MSWWlC81K9EufZ5
         REdPKBYMFBtVPGMwLfVqxz82TmgM3uRoAQh3ClK+3ULiHMMPgan1dknP1htvrFqa30eK
         Z37RQH0/bdh2o/GKAoGwOUlfJPCGnOIsY8BJZrrIePaG928bcdN13n4IOZTTyCHRiOC7
         Qa1A==
X-Forwarded-Encrypted: i=1; AKwUvBw9KLpkItzVIqS0C20TTNTl1SCFHdGxeIMHE+jHcwFg0sTued/Mb9W8ytYqHNBfVVWjMCP2prGyVhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PceWQyh1GWbImxnU1JDlpjDthbXLaNR8oiWIN/UE258WGLiFb
	0oubrbkHsvtYP1t+l8ALUJdgRjdBWcG5mQPNsBarTygNys/XVZZTCrS18r/n9VZk7EEIg/5NbfZ
	cGOXHqA==
X-Received: from plhq17.prod.google.com ([2002:a17:903:11d1:b0:2e9:64c:38da])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:245:b0:2eb:a1b:e9e5
 with SMTP id d9443c01a7336-2eb364e7bfdmr113562095ad.52.1793683745906; Mon, 02
 Nov 2026 21:29:05 -0800 (PST)
Date: Tue, 3 Nov 2026 05:29:05 +0000
In-Reply-To: <20261101061331.286404-4-jiayuan.chen@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261101061331.286404-1-jiayuan.chen@linux.dev> <20261101061331.286404-4-jiayuan.chen@linux.dev>
Message-ID: <aulxGkfJ-7V8RUZp@google.com>
Subject: Re: [PATCH net v3 3/5] ipv6: restrict mld_qrv to 255
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Thomas Gleixner <tglx@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Maoyi Xie <maoyi.xie@ntu.edu.sg>, 
	Gerd Rausch <gerd.rausch@oracle.com>, Oleg Nesterov <oleg@redhat.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Yung Chih Su <yuuchihsu@gmail.com>, Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, 01 Nov 2026 14:12:01 +0800, Jiayuan Chen wrote:
> net.ipv6.mld_qrv only has a lower bound, but ipv6_mc_reset() stores it
> into the u8 inet6_dev::mc_qrv, so 256 wraps to 0 and the first MLDv2
> Query received on the interface trips the WARN_ON() in mld_update_qrv():
> 
> 	WARN_ON(idev->mc_qrv == 0);
> 
>   WARNING: net/ipv6/mcast.c:1327 at mld_query_work+0x1fd2/0x2cb0, CPU#3: kworker/3:1/2688
>   Workqueue: mld mld_query_work
>   RIP: 0010:mld_query_work+0x1fd2/0x2cb0
>   Call Trace:
>    <TASK>
>    process_one_work+0x93a/0x1b20
>    worker_thread+0x6d0/0x11d0
>    kthread+0x358/0x470
>    ret_from_fork+0x5b3/0x820
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
> 
> Make the sysctl a u8 like mc_qrv and switch to proc_dou8vec_minmax(),
> which rejects anything above 255, and document it.
> 
> Fixes: 2f711939d2ea ("ipv6: add sysctl_mld_qrv to configure query robustness variable")
> Cc: stable@vger.kernel.org
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
