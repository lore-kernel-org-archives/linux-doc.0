Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9720204596
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697674; cv=none; b=IBmViqSWEnpb6IZiH5HU3LLGhnmHXD+iF+DGmrapSloZVksNWPRVfkn3fuX/f+oCgDPGkEq1jFt3k4/XNeBihucevh6GAmJIupNHaK0U0GNpIcXarYZRuISFtuaSMfbMbgBhq2QaE/Ub7yyBAQ6q/RhBb3aMjnCqnp5MJxoXErI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697674; c=relaxed/simple;
	bh=oSr3LHswhPmJmMFXcCpEhJ0cJycpCyyzRGJFwGchNCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbtoPS+obZQYGcv45p7GQpGxVQEm3i5Ki4XSjaUcFMsPobOilc4kkiZFQPi/ggTFssQoXFmuABYxDOa/OFT9Mn466P46GcoFSWc31VEafNQ/z7ktOAT7NisbrefqM3EkoZKpHzf4fWpXmvsPKzUDIiL8M3WOwrWbcRpWkEs3/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPN68AKn; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPN68AKn"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e537d9e3d75so1374439276.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 04:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734697672; x=1735302472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oSr3LHswhPmJmMFXcCpEhJ0cJycpCyyzRGJFwGchNCI=;
        b=xPN68AKn29Dotj4sSAqvXat27cBL7ZzYPBoaqs03X514+j46jhyZCE0o5aL3U3ErLb
         b24EAUQfkKhTRT0uwu15EPahxRReETRLBYt8wRhvI413Ib2LQfp6U9pfUVFc6pim4HyN
         O6pD3sMtm79LVdG7jT22JDhS6dWNa4nGCSlZYUiAwrO812Nrt9m3uyHBwRUYj4QcwIlz
         d5N2GFAi+lRWSB/Im9r+OPNNf+77trulcnUdV30W6WFnBNpR6r3d8M1DciLov3dfntp8
         r3fiZDNgQlmgEBANrXdSXofUFJs3O5BdaIOARh6Qki5tN5xqZRn5vxncmrZI88jNM8tF
         1qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697672; x=1735302472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSr3LHswhPmJmMFXcCpEhJ0cJycpCyyzRGJFwGchNCI=;
        b=vaB5nfbsphtYGIKTM/RZNgswoAq7qjqQ/fP++EKJ+IoPD6m3jAF8l4M9+xx5dBvfJp
         oi8wGMZi9aEv5pfCNh03Rww+4bX5Nf5/J+dAsFbxdbaef/9q34EX95mJMXmrQ+zsx0KM
         Lq1fO+hHVmPXzdrqnHvPw1OztLct1UnmW+1mE4q0f70C0qC84EM1N0jBmn+tJmUIIJDB
         L+A4D+yuvcV7jFiPDDPsMq3NkM61lhSAoDTXGvwcHxN8i/XdU2iTSPT5uQhf85AUaJJS
         LPhVo8tktIEgXns3tsZxEZQI9n7RgeN00kTxCbG/gEUyF/lxrPqg62TcFEgz8VXuUp6h
         Qw/w==
X-Forwarded-Encrypted: i=1; AJvYcCWdznr9Zec83SlIiJBYxIeAftFzFgYkKe8gJLLVtIxGm6HF1HZUw5odrg997q+bWjNXTSinZsUmAp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpvtXipAk9t9GfqjPg/y9JMR1mwChRE3qC2S/3ewu49UztrK8
	6xNFzB3VAr9kMkM8qPcSOyI+HL2OQZxGOaYXqc4MtABAF8DImIm09NRO0ErpWiJ8UD6RI4/mMs2
	xLnnXtcfmKB5mgsB1r6WSXPiJmTAZkCWlFxwHMw==
X-Gm-Gg: ASbGncuIttx8fQM4NErLsorclP21mrKB3FWIUBtmvnjzJThTycyETKi+JGgqiFFFte8
	t9UL8u39rYzKMvNkYe3oxMcVIZIDYRBDSqrjetA==
X-Google-Smtp-Source: AGHT+IFOyYvAtNLLNQuQ4Vm215PmlP/mvkQLrjkr41LtvrtXHQyDVGy+sl9zSqL3xwxQtAcUOlvK6e8nZ/9kSyjoPlg=
X-Received: by 2002:a05:6902:1108:b0:e44:82ef:3973 with SMTP id
 3f1490d57ef6-e538c207807mr1637718276.4.1734697671887; Fri, 20 Dec 2024
 04:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_76E62F6A47A7C7E818FC7C74A6B02772F308@qq.com> <20241219062438.1c89b98b@kernel.org>
In-Reply-To: <20241219062438.1c89b98b@kernel.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 20 Dec 2024 14:27:16 +0200
Message-ID: <CAC_iWjLy4-cErYjCQ1W4h6fWVn17+A-uA5NiYy2-Wv5T=iQvxw@mail.gmail.com>
Subject: Re: [PATCH net-next v1] net: page_pool: add page_pool_put_page_nosync()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Guowei Dang <guowei.dang@foxmail.com>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	Jesper Dangaard Brouer <hawk@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Yunsheng Lin <linyunsheng@huawei.com>, Furong Xu <0x1207@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jakub

On Thu, 19 Dec 2024 at 16:24, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 19 Dec 2024 11:11:38 +0800 Guowei Dang wrote:
> > Add page_pool_put_page_nosync() to respond to dma_sync_size being 0.
> >
> > The purpose of this is to make the semantics more obvious and may
> > enable removing some checkings in the future.
> >
> > And in the long term, treating the nosync scenario separately provides
> > more flexibility for the user and enable removing of the
> > PP_FLAG_DMA_SYNC_DEV in the future.
> >
> > Since we do have a page_pool_put_full_page(), adding a variant for
> > the nosync seems reasonable.
>
> You should provide an upstream user with the API.
> But IMHO this just complicates the already very large API,
> for little benefit.

+1000, I think the API has grown more than it has to and we now have
way too many abstractions.

I'll try to find some time and see if I can come up with a cleanup
that makes sense

Thanks
/Ilias
> I'm going to leave this in patchwork for a day in case page
> pool maintainers disagree, but I vote "no".
