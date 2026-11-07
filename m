Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060142;
	b=BET2Qok/EkTJwxlsn0zLTthQOsqf3wQtDDiqh8WaGpGqY+zHG6dSxgKFMIuKy8DEuiW8
	 tDvW2F4Ol4kcgPYByw0wujezOs5qpGjDzGsv7ahPd+seWcbCKn8ejDMEXaKUI1MJ8E/zw
	 eVYu1YTKybHuwVGkZ528sUPsop8c17OkyDKgDnpu+3jZPbvXaEuw3WsKP3RNeSMvdUVww
	 OIea2weEBtn0q+N8pwHri6oHbVEr2Q82o3mVHs1ve9hZvXG0k7q6K2sV7R569QPgYAGD3
	 dpYFnZD00ZKYx5zbwh4yc2X4Mnyhd4UBxwYXz6aQumlO1Xom2RLgEkW4P0sAnXWdr7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=jeBVTeWsp7XQ0SurPamFA2f1NhhOVbJgVg3z2VQmbcY=;
	b=dDxZrNUkju4r5agThk4b0GBdNK6jd1Q/DBHoPKU1qguN+Yw0xBG9nb6i3AuMFwAuEPVi
	 rYsK+2AaKYwmQDGigaG4/GDFtTcEkCcQ4nKLmHMT6MYzcqxuVyN1ndlPOPXBAhSws9RBV
	 vm4Jgjrd6jBk142pmaRQimdAitJ4ztBkpG9fOS0D5NjRXTrus8GwgpnzlB5jagsSZ6sy8
	 Pzt1ElN25yLaQh25KJBru621F4ohbrR2J6OeBtyQcSAmTrzIsMIPsVUwWe09VCPeGWENI
	 epeOio1AmydtzeKIKgBaWKX1rGR2COOuuVIYVa8ALxpTImCPwlDeAZLpWwMtdn+iX0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jzk4l6NG;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F8606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466F8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jzk4l6NG
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so9272435e9.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060140; x=1794664940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeBVTeWsp7XQ0SurPamFA2f1NhhOVbJgVg3z2VQmbcY=;
        b=Jzk4l6NGiX+HqnSZ15BN+hLDZCao5gt3EsidYlulPs2AUjGEDiGyZWmwm8GmKHSpz7
         iojUe+nL1sffGrls1EUSz35B+L2zLMAWzn3KRUoxu3AB3ZRHqz38t+xAu5DP7CAmJiWe
         EUttTOAPYVEQ4Ocb2noeI2H4/PpcrlISqFg5v2u8vqoWbU+QuZHnJ1QhMU1ZI1DqjF6p
         oWHIXNW9fcG9yLHwYrFWx9+BM55KroP/iJ6Gkol1afqzYAE/n97WMEdQgmfsdIbRS4Ow
         UfN7mEd7pXEXIDUHJUhKpe4u2Jl3vfSxM3ISoBAlP1KVx1NoOmcMePRrTxtmfgi/KlbG
         UCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060140; x=1794664940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jeBVTeWsp7XQ0SurPamFA2f1NhhOVbJgVg3z2VQmbcY=;
        b=Ia054+uEs9A0u4/Q2/muK05ye1diwNTrzbu6p0NCbCs1eW4KW9mT8gs1t8+ZohgMAv
         s32xndoPWkC+HuSYwFEyBfkVc+ZqNO5EC4dD2DjSF77vU+XvGVNmCd5FEmpwdty+eKap
         z59fn6W8vtRxaUm8l7lnfPNEk27I5vzfk47vvUtW91QAw2SPG2KNovFv9PN6mirwYMRB
         ydPtnFXfTcsN/o5BjIayFwPfocpWsdBhFO8/NMgGTY3vQBUCgkeUfqa2nwRqbTGN1iLA
         T9BmAQ9Nlj0Y3vIVDunOBDdiG3U4DH+Dm1+qP2QwzkzdpIaSan+J+auJDth0WdwM3X+Y
         2OoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDxDhkDQ94+qKQ4322eNwMnS1myXxCmB2BTM8qKWr9u2KxEfzAUlWk9rRMvflcGZ48sFoC4yg7ADE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W1oyuC2fZi/wDUFjKZgStf1RvgL2NGyu46+4cX3/YbiI8rq7R
	kVsjx3AJjV4JcnPmVsrQbSoSk1NmyNuy0o7H+dic9nV3AgpXJO8FFhnj
X-Gm-Gg: AYBFou3vjmRYuuTwQY3dnqqU2gIU8zCTzgxDmU63MJPSr+5M8FFXh+0a/mhhNWav9m6
	szCL3Q/m3nc4QdEd29J5Ym/klEP+mfnNCcHwkjmh9fcrqKP5OKfHtk4o7BlOrFA321upwhHXors
	oDwi+dKdj9Rol06aLiNB0KdLpbij5j//q4W5WEcv2NSx+iMs6+6Fj06hWcGzu6l1YmfJMQBxbSN
	J4wYPBCcg3fYKkAN7oPxj1/d8xRuMrzh6rHEJ7HTsmRIYXkbndamR/6LfDBZunXTvxehM1UwZMa
	eTMQTf+wRiKjkPMBpi4sVBo3MDG4rIgSkguCe+k8sn5q6dMbmg5yXPzuVRRx2kibz6GHSX4/LXP
	a1Sc6zbgxv/wj22MXpDEM5VTjPfs3PEDQr1jHkNnc43jP5atG2zI1cwWELRLFR8veFuyDg132zf
	hzGfeF9b+TfI8SjFEH7qGy2TMHuNks9E38sHxQL18LiMd6D7FO5AeqXbQ4ZlNr79wQ+BnVPhi9z
	z/i3O1GEhU1SKraUv9K8p43vUNruAg8CtDAqiIXO+vzmVL9EaQSOkMrUXrbNb8XTVQXi3cZCkOE
	paU6aTzuYSQ3+IvJz6bpnNmc6U7IWu9dYEHi++zkUYBITmD1h4yY
X-Received: by 2002:a05:600c:34ce:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4b6dc400256mr107335175e9.4.1794060139414;
        Sat, 07 Nov 2026 06:02:19 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm122148745e9.11.2026.11.07.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:02:18 -0800 (PST)
Date: Sat, 7 Nov 2026 15:02:13 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Christopher Lusk <clusk@northecho.dev>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: landlock: clarify TTY signal scoping
Message-ID: <20261107.7c3abf9dfa59@gnoack.org>
References: <20260923163321.79770-1-clusk@northecho.dev>
 <20260923163321.79770-2-clusk@northecho.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923163321.79770-2-clusk@northecho.dev>

On Wed, Sep 23, 2026 at 12:33:20PM -0400, Christopher Lusk wrote:
> LANDLOCK_SCOPE_SIGNAL limits signals sent to arbitrary processes outside
> a domain.  A PTY master differs because its holder controls attached
> processes through input and signal injection.
> 
> Clarify this boundary in the userspace guide and narrow the UAPI
> description to arbitrary target processes.
> 
> Built the userspace-api docs; no new warnings.
> 
> Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev
> Suggested-by: Günther Noack <gnoack@google.com>
> Suggested-by: Mickaël Salaün <mic@digikod.net>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Christopher Lusk <clusk@northecho.dev>
> ---
>  Documentation/userspace-api/landlock.rst | 6 ++++++
>  include/uapi/linux/landlock.h            | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 84cb7bf6b3ed..4d9fb1f1588c 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -430,6 +430,12 @@ The operations which can be scoped are:
>      This limits the sending of signals to target processes which run within the
>      same or a nested Landlock domain.
>  
> +    Holding a PTY master FD grants control over the processes running under that
> +    terminal, including the ability to inject input and signals.  A process able
> +    to write to the master should therefore be considered as privileged as those
> +    processes, and this capability is not restricted by
> +    ``LANDLOCK_SCOPE_SIGNAL``.
> +
>  ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
>      This limits the set of abstract :manpage:`unix(7)` sockets to which we can
>      :manpage:`connect(2)` to socket addresses which were created by a process in
> diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> index cceda3b3b961..ad7b1ebd62ed 100644
> --- a/include/uapi/linux/landlock.h
> +++ b/include/uapi/linux/landlock.h
> @@ -500,7 +500,7 @@ struct landlock_net_port_attr {
>   *   connecting to an abstract UNIX socket created by a process outside the
>   *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
>   * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
> - *   to another process outside the domain.
> + *   to an arbitrary process outside the domain.
>   */
>  /* clang-format off */
>  #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
> -- 
> 2.55.0
> 

Apologies for dropping the ball on this, I'm only realizing it now.

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

A related documenation patch was brought up in [1] as well.

–Günther

[1] https://lore.kernel.org/all/tencent_1D938EDA50BCDB080CFADC6A@qq.com/
