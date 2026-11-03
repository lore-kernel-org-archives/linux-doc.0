Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683774;
	b=oyYN/ggC7ObYyXpupn8a3O6jOB0aGOMzVRmCSIDlMcwf0nzSxVhafINszRxZ7mdt0/0S
	 qZ7GIFX8QFTbzj6UeyOCidtAAoedzKe8pTNGkyui6uY/xEqDxdBQp/y0+Q9qySRz+KCDP
	 uYkbbuCqX+PANxpFkSQ+tiJ9P2YxKeiY3awQs4xGp6GPnm5mKVffcU9BAaRcfig8fHp3x
	 3BVz4lm9vsADeH0cG+oJbjF7R2ge1fw8WviYfwZizEfFMF9I2jZk4jf5Y9+0fB3rCzRxN
	 FNXl8n3mMcby01/MZrlxtt6jhjDSiF5upfEcCwYo5SKYQfhT9HjJXn6cjbKkw9XtByw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ke9vhkENAXPfCm1yxHfr+SbOqiszin1sS4qIXy02ijk=;
	b=V9V+zi2V5pX/RQq9H8kARB0fD55S2idBXZuLhjTpKporvHNVKucbxc0ErcYObqizgqUS
	 5ElU8IHvUW0GBjFvM6xZcrcb5fiJXAgzKs8O76MB/njtqaxsy3jfH74IC8Lg4gH01N9su
	 r2AnVj+VcZMrakk0Se7fnCIVivNtIaIwfpRDUp6CtumjoE3vLeL+jQsU8ypYJR+0zNrTi
	 HZMcysRLtc1kC5cFlXn0tpELz7Nyv6dDk0hSi1Afo9NZqcI6KFrlTnJ9nplge1/lO4Nhp
	 PK+Wd2+ODEXDJU8nCk+2qLgZYCLIAJDzlNXzZdyoBKCWAka0LCNi/6s08oTslIUcg6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UmzAFCtx;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D444606A336
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 05:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D444606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UmzAFCtx
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e60770381cso34918565ad.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 21:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793683773; x=1794288573; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke9vhkENAXPfCm1yxHfr+SbOqiszin1sS4qIXy02ijk=;
        b=UmzAFCtxp1ZYyFABxl1CisByc7Hr2e969siZsRVUO5jvr9m5lyMi3dsG2NZaa6DbkS
         Q8filMC2M4hVX6GaGHy3WskJo5Ss81YXxBmHv8Gi3cYWgKeSPF/RHDi5+dirS5fixcse
         lmlGFAnXepRzUL004qTIZUB77qN5VCnadqWy0pYWfUhEFZZs52UGP/bbyIqea7T6Z9vn
         DhELoXdUTRArq8p4XtGXSWvwgHHdcbHZOXSSL+egm063O5C4EG5katn0QWTJQvViSFD3
         fikNYAgztw0YQOL9Nb7azqmVcP8aky6HDdQz0uv/e0/YqjmnYm/mNXTh+9aJgyQVZzM1
         YQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683773; x=1794288573;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ke9vhkENAXPfCm1yxHfr+SbOqiszin1sS4qIXy02ijk=;
        b=inm5hPPvxvdxozlYOG2/YwFyaKut4anXXNaQLySTJxrNgfgUWcuoTzVLvWdFtwlulJ
         B11aQ2uCRc31/uMEeEFZZ2ZUsqFgZjf5oMavVOrEzHt4wSXJ6LpcueuIjhwWPJRqIB1N
         Z/GW+gZqUjU9tSuHXjzGfII3t0lU5zv4Iip9F7KATFpt7tvu0fF/PwbNvKep69tcoKuQ
         7UqjgLWhdVHaekVUi4d/IhelIxD8DCoP9Ml5dOSzzQ4eCMOEj6mPR4MeSSTm8IaJf30T
         Oia72K8u8dgKr+kI3E3Mbze/kOl9EgM7lurdufdDzk3PounGbfsA19I0xm4YdU5pgGnB
         63nQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUOA1DUntG8dlPHszjcRYBl4QrMsWV5FtG1VmkOhETSBIsiTggAihiejKzs9evtjJbNGCbwGsN6zA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CFYpFWaxeEVkseeyNK+S5YFkIttj+YFrtw3B2C4G0Z1sT169i
	zmgaAEokZGwMG3HX8ryM9VHeWjJthYPinZYZM7jDsiv5q2FLmJIXEtD4Ue0QwoC2KUXcixzOcTm
	siNANTA==
X-Received: from plbbb6.prod.google.com ([2002:a17:902:bc86:b0:2e8:18c6:a093])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f712:b0:2e9:5829:9b40
 with SMTP id d9443c01a7336-2eb3649be7emr111118405ad.9.1793683772335; Mon, 02
 Nov 2026 21:29:32 -0800 (PST)
Date: Tue, 3 Nov 2026 05:29:31 +0000
In-Reply-To: <20261101061331.286404-5-jiayuan.chen@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261101061331.286404-1-jiayuan.chen@linux.dev> <20261101061331.286404-5-jiayuan.chen@linux.dev>
Message-ID: <aulxMqNrVTWFRuv3@google.com>
Subject: Re: [PATCH net v3 4/5] ipv4: restrict igmp_qrv to 255
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Joel Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Maoyi Xie <maoyi.xie@ntu.edu.sg>, 
	Jiri Wiesner <jwiesner@suse.de>, Oleg Nesterov <oleg@redhat.com>, Gerd Rausch <gerd.rausch@oracle.com>, 
	Neal Cardwell <ncardwell@google.com>, Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Yung Chih Su <yuuchihsu@gmail.com>, Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, 01 Nov 2026 14:12:02 +0800, Jiayuan Chen wrote:
> net.ipv4.igmp_qrv only has a lower bound, but ip_mc_reset() stores it
> into the u8 in_device::mr_qrv, and the IGMPv3 retransmit counters filled
> from it (crcount, sf_crcount) are u8 as well. Anything above 255
> silently wraps. With 256, mr_qrv becomes 0, every
> "in_dev->mr_qrv ?: sysctl_igmp_qrv" falls back to 256, which truncates
> to 0 again in crcount, and igmpv3_send_cr() never puts the state change
> records for the group into a report. The older version querier present
> timeout (mr_qrv * mr_qi + mr_qri) also collapses to just mr_qri.
> 
> Make the sysctl a u8 like mr_qrv and switch to proc_dou8vec_minmax(),
> which rejects anything above 255, and document it.
> 
> Fixes: a9fe8e29945d ("ipv4: implement igmp_qrv sysctl to tune igmp robustness variable")
> Cc: stable@vger.kernel.org
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
