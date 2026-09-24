Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B011326C385
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234323; cv=none; b=nIucQhzt6kuLwwULVrvU29Ddyyy1PmelmlwypaSYJ6OuoZokL+MdKX4GRnYs39XtTku1UOcOWm88pH88vzfqAq+WmVXHa9YRTFAN8dboKGBMZo9LZouz4eTQXdMo2JSJgGze9MTorS9HQPfg7KQAK0URAipwiCqms8cnIAyomQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234323; c=relaxed/simple;
	bh=tiND65YWQ7WExP2YCttwYf58Qou97Hr6bJr+s79BFD8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eAU+vxn+b5rpCj2AEpfoVNZmMM8jI5L5D1czbDzd1HxOaqrAZNtJzBxXq145AJQ4+sL6KqXR/dKOt6aJcT4TXnzHAjbYH1FTFaGZs1Tf5w9gbtKEHnoXk+GCAe3v2gR6zVZkTJg7KGMJdG6+6jJdqZmDq1wb/U+InGl39A/CicQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TM4vB4rM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcz8hB9o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TM4vB4rM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcz8hB9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790234313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O/BKFWAq09c/drTlywLMZ5/iT4zh8IsXGlRsLaDd0Bg=;
	b=TM4vB4rM6g9y1mI0z+G7g2dDtOxKpdCteviq+XZ2Gc61KUpwyz45Bw7I5AMs/1MzfzWAgn
	sZWztuRCe7RpGi1RNhA+q4y+Mam049gDRvly6ubDqFhNVkjet99MAq6XTuCLeihBkRjqAg
	10v9SW4BAvNGtlXq/kHixs4iJ6JuLrk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-jX04ddh0P3ONaW8kqDK2kQ-1; Thu, 24 Sep 2026 03:18:30 -0400
X-MC-Unique: jX04ddh0P3ONaW8kqDK2kQ-1
X-Mimecast-MFC-AGG-ID: jX04ddh0P3ONaW8kqDK2kQ_1790234307
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486f3c0d896so867832f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 00:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790234307; x=1790839107; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/BKFWAq09c/drTlywLMZ5/iT4zh8IsXGlRsLaDd0Bg=;
        b=fcz8hB9oX0RwftFfCJk4jHxOOsXfCYSgP0H7GDBsPj72J5R+xJmt9xNuun0vvTdCLa
         wabxJQLq422a28lBpLcYEHok58t4U2XDSPMVpImf3miu+4LEm3LxNOFKQdhP2noB5/L5
         en6BtOWt2eFjSJ4DLJIIxwsNqYOOXEPYx8WryN/z3oEqqYCGJtzD9m6jQq1hLk9e/xms
         rwkJCzHlrfyZodNwszFtuxwPwyaA5HFXxO3KsvlO15daNIv3BPNlbqOh0Qi8MM6k3ylu
         uUOXjSxSVkgpTtqFpQLJeNKYPk78nUHcjTncYiDyZg59auaS+xS2wh7ZDRsMRhfIozwH
         GbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234307; x=1790839107;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O/BKFWAq09c/drTlywLMZ5/iT4zh8IsXGlRsLaDd0Bg=;
        b=2vg8u9mJ4NlC8Dlc3KHZHq1TB/F8//xw+MSTWuTDfWl4DFMwFIMN81KytZcrYCmOzK
         m5biSraa14VKzCuSUcNrpKJGzaTYxJ1/tDxni9rVszQeKlsjo38i4mxAsGaran2lNcNR
         LcwSqT8yoH4v3eQLO0hqSUAT0GSKZTnr92VHyWnN9m7FphP+AQOtg8GknKMeOlwAmOBp
         rLDa0eKnFRDgrUIIhyQNNrvEl1efxG7i688zR5pZJjKMrstukNYDhCLZBDtrHsfq6U0x
         rbVmWeJFAyaobxCfrg/Z7+ZA+S2us5pFhBW4KWQ+Eiy1PWvLHxitajpyegMwckT84wSH
         CDfA==
X-Forwarded-Encrypted: i=1; AKwUvBwmJVisew++v1L2LX85DsB/71xd1/td8Sy7T/B7jL8lgRmTc5KM67UijWKYOwOZ85TsOahTXI/bDFY=@vger.kernel.org
X-Gm-Message-State: AFuF++kUd0rKQuVFdyBjDs8A/2mbVhZUcXzWqeKDeUkUwsSO3HGkT9C0
	lGgF8DGkLaWijbRVxuaU/yhJOLODv6T8DEjqhNevjb4hU64mGkINzR2gDzNeB1nsAgwkdvRmLkF
	Ny008+scl7sqP5ivtHVOWNZTQdN8sGoxz3nre6D4CjP0Y5WqNQrkkI18h09vrog==
X-Gm-Gg: AYBFou1/JrKd8pQx+JS24KjJFojYEbE2V+v9Xa2ACve2AasciZlBrhvF+gl3bjp67uI
	lBOkMmDde5qnTcsOtHXk1Va2Wz3prFLv1TXhuHr/ixPdHgjGd3lxe3jFE+9Ah2SNfvdyy2Emlc2
	8B/SUsDj3AasUsUTHdxBElNkAB4AppZZ1Vcrntq4yVcHNpUVFDYYR17El+v0WK571DeRRpIS82X
	ApwtjMDRUgkSKe+Suz/1kIlIR5VILkOVbFzyUPCqiKqFGumv3jcPA9pSplS0daosWn2KuSbm+Sc
	9hxN7YHVLXd5jxPK3dU5C4TT/bVspbyM/NdqmMttRMCFUoRkdkkRF2hXT8U6gCvBbZyG6cHKgnJ
	w1TgNv5KFRCf3YdyuNKqE70jAq1GOsdkd06wjBxE=
X-Received: by 2002:a5d:5849:0:b0:488:5535:415e with SMTP id ffacd0b85a97d-48871728c76mr2575373f8f.25.1790234306868;
        Thu, 24 Sep 2026 00:18:26 -0700 (PDT)
X-Received: by 2002:a5d:5849:0:b0:488:5535:415e with SMTP id ffacd0b85a97d-48871728c76mr2575344f8f.25.1790234306488;
        Thu, 24 Sep 2026 00:18:26 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.135.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684862a3sm11499823f8f.7.2026.09.24.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:18:26 -0700 (PDT)
Message-ID: <c8bf231a39b5303bb283b12648a9e23b5c4bd07e.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 rpm@xenomai.org, 	jan.kiszka@siemens.com
Date: Thu, 24 Sep 2026 09:18:24 +0200
In-Reply-To: <20260911123439.463052-4-tobias.schaffner@siemens.com>
References: <20260911123439.463052-1-tobias.schaffner@siemens.com>
	 <20260911123439.463052-4-tobias.schaffner@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 14:34 +0200, Tobias Schaffner wrote:
> With the core facility in place, hook it into the DA/HA layer so that any
> per-CPU automaton monitor also reports how long it lingers in each state.
>=20
> Pack the automaton state and its entry timestamp into one word so the
> transition cmpxchg updates both atomically. This prevents nested events
> from attributing dwell time to the wrong edge and requires a native
> 64-bit cmpxchg.
>=20
> Account a transition as soon as its state change is committed. An HA
> constraint that rejects the transition can therefore reset the monitor
> without leaving an accounting window for nested events.
>=20
> Add a selftest that enables a per-CPU monitor, checks the stats file
> appears and is populated under load, and skips cleanly otherwise.
>=20
> Signed-off-by: Tobias Schaffner <tobias.schaffner@siemens.com>
> ---

Sorry for taking that long, I could just have a quick look at your patches,=
 the
approach looks fine but I'm going to need more time to check them carefully=
,
likely after the LPC conference.

I'm not too fond of how you split into patches. What's the reason for split=
ting
1/3 and 2/3 ? It seems they both add the new functionality, one step at a t=
ime.

...
> +/* Edge statistics pack the state and its entry timestamp into one word.=
 */
> +#ifdef CONFIG_RV_EDGE_STAT
> +#define da_state_t	unsigned long
> +#else
> +#define da_state_t	unsigned int
> +#endif

Also try to define things in order, da_state_t is used in 2/3 but not defin=
ed
until 3/3. This doesn't break builds (the header is unused until 3/3) but i=
s
just harder to review.

I find it more natural to split it into 1 add new functionality, 2 wire it,=
 3
test it. What do you think?

Thanks,
Gabriele

