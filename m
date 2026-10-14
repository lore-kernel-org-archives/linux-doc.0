Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2604E4C29
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971129; cv=pass; b=JCCXbAY1a95hqO6LFi2zlRdH3OemI9LS46pUjjxpgY7QogR06su/jGkpEL/9Jqi61epA9FQGfGRkeKRfzPwm09BeeuhZk/79bOGKUMMXM7a/XK076anJWn250/WsV//M4gPCVwR/7SaMEMcWOxIWA9hSKrJ6gMD400L7/PC+jjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971129; c=relaxed/simple;
	bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgA1bJD5pPqTD5L9zY0Fb6Ij9mYshAogOVv5dZg6bVipJmCp1XTBT7IzUegngKFNrQAfFm4jMZQhgxi4+3dgqkMnhUgRITjO13PDN6cc4PyvBMxAQcVyVhIqcuGLFaABpUK5fOwy/WtXhiLEU/OwrZblle37BJhU0y5mHkJdEYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=PK1r923x; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="PK1r923x"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67921b515a7so3673267d50.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 02:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971126; cv=none;
        d=google.com; s=arc-20260327;
        b=W08N6cUnLxDMF7qWkJOJcD7e1FacNorxhTttO38jU/y9/X9rvKWUGba/K06JtqgqyF
         1gD/8T+NUD/GV0NrZT/0FwJZR6ZuEMGFQIynlPmoLgLKbBtHVbliBx8QP6lepq/x7baa
         bduzUuPbZztbp1CnC//ydvTVgRGCazJ2A1axaY38G1UAVj5iDxNPLUb/W+VKuTaKUteT
         zhN0MQN+T1n1y2Ag2/BRWA9EW/FeKDKCtK92KWAgi+n94WOlhZdmEZZX3kuVD791lb8H
         uQWJ6HDbsnn8DTVhnyW8/sxjSKRLlKFEiJmpJS28MIyKXHKhZgRcrg67uv8PIMMsnO0K
         IwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        fh=57XSkHK92NMdeth0TbbiriVsvVBRsq8i8mYfMFht/xc=;
        b=Nx9+w6xFVbTaBrwV3w6sP2zjkiaJiDHbFqaElEZ80C95bXiLzfhUbvKu7EECGmZATa
         PJ7kJmM5p9Qx0TFOZz167TkPJL3XY6mbQcGNz8d4dMEZbu7cqASo55Zy86cL4hHX8Mbp
         iPnpacWws3VSNvkhGjy7HtWTsE/CALKzQFs5nQ0iV5L6H7/qF1QensLtsR2Hzc5YdxJO
         DsTCNxN3m4Ai2h27ZdBKnvdV4scgpKNY6p0rVB1X5Pj4GK6lU1wAQ0m9kB3ReYG3enwU
         X+zo4bupHmC4D4XFG3P9M4obpJGhKB5LJa9sxbh6YjBevDBjxLdzDrOlUE+fMAP2CLJG
         MWoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791971126; x=1792575926; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=PK1r923xhU7qDZUbZmXe0yFUiSBca3J8XHIHs9qS+//TYB4Fft+Qo2Ljqk3oG6sPvs
         ExQCXNC1AHfaOK+vCwWLnwkjAKTf2UBbROgtrQXr86a/xPPl6cnW8uxv3/TF1HaeunIL
         WDiDbbme6gyhDZGG95JeVXsSEylcaz4DknthCfgSWs5Ausu5ByUHgSsm7wIUQRywIF7U
         6L6dKDQwf2C+Dc83KQaib+KmDPGD3y03epzqW/Cg6zX34bmKNG+1EutwDxzYAA5TyPdM
         vvgnoK8SarlTBCqLg0ZTdzmtuFchV5igeEa4cykI2Ygktz2Ux2qUDOT2+uGnWf2ewKNE
         z44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971126; x=1792575926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gusoHEwTYtpIMo9jbvB0sb5YbKOtm4Z6P3NaNg27eS0=;
        b=jrRaMp8V7xrwUb0Eo7gGp/Oaoj+ASpxXfjIypRmcVdboVb+sWb5bXS7hKkmLnyUMuC
         xztchKih/GZKlzBmMaYsyzh9lxO3ieZzlw3jQugx261qusPPF+wbLNcXKcI9d4ZznsvI
         Vq9y8VkEB85mrNur6u25wJVOZfeWsbf9OwDbyJa7eSryz+Gh9hJkam6AHHpyOPqvHv+b
         7S/N8psEjlLq+BcK0ym7A9JcOMYYUstdt3fWlxRDkJP0YCfgeA5vHHOszGFGSjChYpTb
         VMx7OZffraHM2EwjKrttN/WUVEqOwub6Oq5UJ44IJXSkE1m+oupIwE7BHBPRbUSqxyKI
         CuTw==
X-Forwarded-Encrypted: i=1; AKwUvBw7uxzxMF8s+g0985L6jRXEHl6j0JArX7TDyReoTxDTyDQkRDOcZNyhTbp1ZPPKphrG1qq82KehTPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1swI9cwMRK5bZTn7Yk2lSd5o3muUeLwMUhpgc+JTOPWqxfHNW
	nlZL8vHox0tuIpsZcNLbkAUfnFC1JB7yuYwMfrYQxCxsc4qAvwIiGwpxi4OzWHfXqaWmH8Y3iPY
	g8oSoQ+JMY1TaWWZMkehrVEWyqnhT1QOSMQ47oAaL
X-Gm-Gg: AYBFou1lIihpbfJllsoWAi3d8n27RN2GdJsBxiu2ZN7IyGRFhEpL9eN4C5SzlRY2Jyh
	a7+plKNITtr9i5k3JDcrY9AYrrfK7oHnmkTvcepFeH2Hnbcv+YVd4GbFBClUrQ1tSSr/JxK2jlZ
	ufaFPmXj48ZZb0ngfZVB8wnA0gFeDe701+xad7ixHweta8FxkkR2k+XuFGWaN+UA60AA7ymW9J+
	xFnCtmOOU1cgp5COz45tEpad0ujRN6IJMvE0aWwYDcWFvv5lCk+rLLEme2danKwk9LzRNlCFnWE
	xMv6S+dnUTAyKzVmj+CVAdmMAf798wUQajO7NyruuHKYu+6h6Cg67mVLe+5ItXxP++bMrNsjEB+
	siTJfgK+CEihNRouOe/eDKFBAwcuATS4VW7Ux38wLEZ4V3My2W06QOIKTBeU3OV/RajzMNzPV6D
	u7Cs5bFBg5SUimCaOP+/sNyeYoa7k4TxYBzGQFHM4JUJvTApj+2SEq/qnFGyhEEpa/9hAO/Kc7q
	msIfD+aa5z1aj+eFDxx37KgIwwjjpkYaw04jpTtxaWJWdFkXptq8QE1y8N0/IKXmCo1Q9RWfb3n
	DZ544vvgtVjDxw==
X-Received: by 2002:a05:690c:c4e5:b0:8b0:9e22:2651 with SMTP id
 00721157ae682-8b09e22273cmr36219317b3.7.1791971126209; Wed, 14 Oct 2026
 02:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004171636.3545085-1-julius@bairaktaris.de>
 <20261004171636.3545085-2-julius@bairaktaris.de> <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
In-Reply-To: <b4aa46a5-dd8a-4520-8574-d008a3877f28@nvidia.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Wed, 14 Oct 2026 09:44:49 +0000
X-Gm-Features: AclHuK_at13xJpgBNhwlZvLzlUVxJXDvkN0LGkLWSuS73Rn7U8oFN9DIXlg-t_w
Message-ID: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on
 flowtable offload
To: Jianbo Liu <jianbol@nvidia.com>
Cc: pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, lorenzo@kernel.org, nbd@nbd.name, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	rdunlap@infradead.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, saeedm@nvidia.com, leon@kernel.org, 
	tariqt@nvidia.com, mbloch@nvidia.com, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2026 at 03:17:00AM +0200, Jianbo Liu wrote:
> The handler is only in tc_acts_fdb[] and only accepts flowtable flows,
> so NIC mode and tc flower rules are rejected as before. Looks good.
>
> The comment says what the code does, but the consequence is worth a line
> in the commit message. Because the action is ignored, the priority only
> reaches packets still on the software fast path, where
> nf_flow_offload_forward() sets skb->priority. Once the flow is offloaded
> to the FDB, mlx5 forwards it without touching skb->priority, so the
> offloaded packets do not carry it. Refusing the flow to honor the
> priority would keep it in software, so ignoring the action and keeping
> the offload is the better tradeoff, it is just not obvious from the code.
>
> I checked this on ConnectX-7: with the series the priority-carrying
> flows stay offloaded to the FDB like plain flows, and without patch 1/3
> they fallback to software.
>
> Nit: "prio" already means flow table priority in mlx5; skbedit_prio
> would be clearer. Not a blocker.
>
> Reviewed-by: Jianbo Liu <jianbol@nvidia.com>

Hi Jianbo,

Thanks a lot for the review and for testing this on ConnectX-7!

I will send v4 with your suggestions this weekend.

Best,
Julius
