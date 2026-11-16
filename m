Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855366;
	b=yuZ35gXtl0l5D5TO1p4vqnGc7l5oNv7HQnW4AirwDtOl6t1dubruhJ3YOgYTp9ndZ4bz
	 NYRO0/DcrPzMjDbTFOsYgsKNH3rdvDBStdpxx8p/0TqeG1bbbu3KhXKFOKtbJU9NbN0Au
	 NBc8ScnZpikEk/hGLx2rhzsYivyDWhR+6XT1l+LjA5kddSTPsVot8u27F9U5PFUUEojcP
	 s+BRonGh0pCXwcJk1vbypyMxvDnlnEB2UBh6RlLtEJHGmZ0Oiz4bKxv4711nVlcKJqmQc
	 6oA7ZLIASpm4Q5vnFoUNnrQh8nUNInzrChzHt4mkn3grs3f3c6vq9ERyDaoqw7LXCHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
	b=Rm6Mzpqp8tIzKJQLdrW7hysRZzDQadGb+hYi9WG2aaUVpVnxkUK4DSAJQUpX9yJFrXur
	 GVfuEis6pMa9/OCJ6365qTbkftdhXyQVcwTHzzy6np8kf0Wuu0Vgv/QR8ZBdn1bVvZ0JN
	 xgwrByOuk7simaHaQynA8F4zDS0HMe2QHayglPxmpPJfnmu9uhs28MSnbUqmOnhTwDwi8
	 OGQEEzUJVHEy+uVoF/pvk8WDrHLGSpC7KWHpD+VukgwqTbGE1hEGpm0aKotx/dUIYJbu8
	 boLoFlhQzH0aDsvD1fSv4n4rk72u14N6yvzVsvNKjYiyJxO8xO5r4GhgdUJ8VIhVdhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=f4j2uwvJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962FE606A88F
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962FE606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=f4j2uwvJ
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eabf243d05so1290214e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855364; cv=none;
        d=google.com; s=arc-20260327;
        b=E4T6f45O+ZzDwBngZwdlhv7kjRuWeTmuOAo3/sCe1zngLge2SztJ+02vjiaQ5kNwA0
         YMZkfzU6I4RhRXOI8CEwfCvgZpXp4bFTXZIy0ZZf0yeB2ICtGP6BVJsNqfLi50HDfsgi
         KdKeUQprMipcyWL26d2QhEd7ObUL2LkIojZmnVLDL1aog46K9VsY9G7kjbnB9EojdiAh
         T5EgEo7plU3jGqIcFtBvCwHRiqmz4aqJQUK4f5XwoxKdAvb6yvpuhfj2DVmbyyVUUZTX
         qG2IEqnC857TXBam3c2s4h7ww0qRNjIxnsK4EbU3Dl2b41gePR03iQao6ZdJ4KylWfMk
         Pl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        fh=6ypU/Aq+0pjuJILgQNaGOkunDh+RFgct1jCiyMXF088=;
        b=lsnSnS33F/LC796e1GZJGykptgKpoQLKLRmCrTmqN46bDpkNeMyczd6v15wvljUxL6
         OjfWFCJPXqzFqPACuYEwtThKk/92iHNK92IsUnvu9vm9HeuQWxrItLR6CLcIQlEhu+Mk
         d+l5T65dDGC9zw9yq0V5JB8JVhKa4VVAmqLEQA9uPlClggxw6/y0JbcWh0hvuQn6L8Bp
         mJ8vkOQHUn5tfPSUBEzMpIg07Gqd6IQTpuEXNAgk3NYBS6pg2OYdqLbDTNOY546dSW2f
         yTnJ7LsdtwSGvQcY6ZWGUekTKzuHdvHQa+uAc3hCWOjkrB+bbOS7pfYnUqL5v2aB2Wbp
         Phuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794855364; x=1795460164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        b=f4j2uwvJ+lHyrTAK7E5Dtl+M5bvamBrr6tzEfQoknmihhN2xaDOFSeiFQC7EokOwp9
         FkbrM0aMK7Smc4PSIjTgdcY8BHaxQ9mPWaS1UpPgIoSfLWYHXfhpCxX4eTSZNcmr5OTX
         o7cNGzWKceJXCB1lcrkgJs0NokQ3DC4lK2Txcbw7nVY0k8FUEDlWkVtXA0GpvFd+0xMg
         iHLiy63ly8w3NByFVDUXRalIbK4skjf70Mrr3u6qupmTZx6mxSuWIuwiyWzMyhnhQ4hh
         eaBj7LQV6a0E/pELWEaHa/PlhMPXLKUjdX34CtmYWWpn8c3dl15vksdun+k2C03nAQA4
         mi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855364; x=1795460164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ3VePYLXSQe6BrY0Rbuq9cNJKXVi3VErXRi88A5vGY=;
        b=n2zC4B6hBbnVuiR0wYoacLERKsB3LlB7mg8a7dPTNHTpjRAsmHP7Kfyv1yvjM0ICYI
         Zuh8qV0t6wLLNzeEInjs51sw7VwTpXFu0ug3HltgWVR0Zn+OvAiD9gMmBHgBGPE/cCBj
         PBivuFgWhwKMYIv0oLibJnlHcQRKxEsipQSZCavgr1B4QSVb1lxywAoKVtTfAv1Min7l
         f3uRYNiwEmDkI2MGC6JTSp0j4/Sw03R41QfeHFJDJpOoAv+MWenr358FVXAx/8lLPrtc
         jJf6+hLV1xkvaAYcNnp5EemVg2FRn6rTf2F3wKPs++EJDrbyTxWyPGMwKnSao0L7OZ4n
         Sp9w==
X-Forwarded-Encrypted: i=1; AL+hErHX5ibvGkoPqYkWcpvj3htCbNMhgmPHnf9m/4MDz6okEo4sye3ZCGK0xzKE+fYUOgieHe4J02Incis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lavaNLDfGx6jSHdQ9h4LeS0G/Y1Ez3VnpfBDHBrKpicP9WxIk
	WJiQs++x7tNyO9JCfZPVrErlOfYC+KpZ1jyNl2i/TBwTjP0XalvyC/rAihJqT6qebSudjqmufxr
	+9u1nQCfoFJlWkodV7SwgBZrKTFxljjJrgOO4afL9ZQ==
X-Gm-Gg: AZFdTZfq3YiX+HwF9tHLFDfEzvl9ZRNiAuW5pxPCCSRJHJjX404yqDWnXhAjLG0kljR
	nHLKB6XbSlbwIR6bPsrFYHE4aMKkJLMGIVIbD+ZIiBxf5murSvX8UVmKdVKK5CeYCstcY72HBJ7
	w9r7PrfWmPZzEwvmF19OS3k+PvJtHR+sKv+TV759/rg/zAkp8PdkioIusZ9sCk6yUaZ8ZzW4H93
	Ojg2K7HnMw3mxve2v1PqT9S8RQtgnGChR7bjLpu3Z+/gGvy6Y5LlQcjkDGYWU+V7LXWbdGNi8mI
	uacAQmyYEP8ol7LpM5v4OK8sw5WDPnqGOr7e8h8dL9FmKLqNB7wjuQeNlj4WM0n0wx6E0js9fvg
	WmG12GzZQB2mqq/Qlli7hNXmapHn/A3tqHQRegQXbAMFf2zT9JYlWU+16k6hZ/Ado76v4nXomPU
	qcjn961b6liGCamZ2YlMbtETsLvasCTAOOEPgVa4QjSXW6IgDjgDPJS0Hu1+vAvmx+0Ij++FlVq
	xi/Cp4z32IH3LrFOzaJvItX5Q==
X-Received: by 2002:a05:6122:4215:b0:5ec:3e18:a912 with SMTP id
 71dfb90a1353d-5ee34a968e1mr3829197e0c.14.1794855364480; Mon, 16 Nov 2026
 10:56:04 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112232444.2865382-1-rjethwani@purestorage.com> <179461232334.2199510.12258955725199996955@kernel.org>
In-Reply-To: <179461232334.2199510.12258955725199996955@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 10:55:53 -0800
X-Gm-Features: AclHuK9aI72Wzc15wwlEEJSue0Lw3dqJipNrakxflrQi_c6kzLHMREGXD0OoOA4
Message-ID: <CAKaoeS2yeZ3WciKNtdp8ee+n+v+xc4+QAcwZU3-fzG6J28-5dw@mail.gmail.com>
Subject: Re: [PATCH net v7] kcm: reject TLS on attached TCP sockets
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, sagi@grimberg.me, hare@suse.de, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The Fixes: tag covers only one of the two defects the commit
>   message says it fixes.
>
> --
>
> kcm: reject TLS on attached TCP sockets
>
> This patch makes kcm_attach() reject TCP sockets that already have a ULP
> installed. It also makes tls_init() reject sockets attached to KCM, using
> a new kcm_attached flag in tcp_sock. The kcm_attach() type check now uses
> sk_is_tcp(), so raw sockets created with IPPROTO_TCP are rejected.
>
> Link: https://lore.kernel.org/netdev/3108e934-ec00-458b-8720-450554b35b55=
@linux.dev/
>
> > KCM calls read_sock() from its receive callback in atomic context. With
> > kTLS RX, this reaches tls_sw_read_sock(), which can sleep. KCM and TLS
> > also replace socket callbacks, so detaching KCM can discard TLS handler=
s.
>
> [ ... ]
>
> > Fixes: 662fbcec32f4 ("net/tls: implement ->read_sock()")
> > Cc: <stable@vger.kernel.org> # see backport requirement above
>
> [Severity: Medium]
>
> Does the Fixes: tag cover both of the problems described above?
>
> 662fbcec32f4 added tls_sw_read_sock() as the read_sock op, which explains
> the sleep in atomic context. The callback replacement problem looks older=
.
> In the parent of 662fbcec32f4, neither kcm_attach() nor tls_init() checke=
d
> for the other, so the two could already be stacked.
>
> If KCM is attached first and TLS_RX is enabled afterwards,
> tls_sw_strparser_arm() saves psock_data_ready and installs tls_data_ready=
:
>
> net/tls/tls_sw.c:tls_sw_strparser_arm() {
>     ...
>         rx_ctx->saved_data_ready =3D sk->sk_data_ready;
>         sk->sk_data_ready =3D tls_data_ready;
>     ...
> }
>
> On SIOCKCMUNATTACH, kcm_unattach() then writes the pre-KCM callback back
> over tls_data_ready:
>
> net/kcm/kcmsock.c:kcm_unattach() {
>     ...
>         WRITE_ONCE(csk->sk_data_ready, psock->save_data_ready);
>     ...
> }
>
> After that, TLS RX is no longer notified.
>
> Before 662fbcec32f4 the TLS_SW proto_ops also inherited read_sock from
> inet_stream_ops. So in either order, strp_read_sock() would call
> tcp_read_sock(). KCM's strparser would then take raw TLS ciphertext from
> the same receive queue that TLS parses.
>
> This seems to go back to c46234ebb4d1 ("tls: RX path for ktls"). Stable
> selection uses the Fixes: commit. Would LTS trees without 662fbcec32f4
> (6.1, and 5.15/5.10 while they are still maintained) skip this patch? On
> those trees an unprivileged user could still stack KCM and kTLS RX.
>
> Could the Fixes: tag point at c46234ebb4d1, or could the Cc: stable note
> say whether pre-6.6 trees are affected? Right now the note only mentions
> the 8cc3aef0cb198 dependency.

Agreed, both problems predate 662fbcec32f4. Before that commit,
kcm_attach() only
checked sk_user_data, tls_init() only checked the socket state, and the TLS=
_SW
proto_ops inherited tcp_read_sock() from inet_stream_ops. v2 changes the ta=
g to
Fixes: c46234ebb4d1 ("tls: RX path for ktls") so pre-6.6 LTS trees
pick it up, and
the commit message now describes the callback clobbering and the shared-que=
ue
reads. The stable note still flags the 8cc3aef0cb198 requirement for
older trees.

pw-bot: cr

> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112232444.2865382-1-rjethwani%40purestorage.com
