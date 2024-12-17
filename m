Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A581F8EE9
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734463678; cv=none; b=XA1S5gsWA1x95zGgNA3EehUDq73Qzjb5M5xfUjbf3GFNiR10frc0BH2uXyIl+ozuzGRkkhBFfbFLS37PxPP9Oqdz6vjU+O+qpZQh68tor0CNt8EAZG45cL1b7o0EJqDU1TDjlH+xxR347PR8UBvuu6zk+zu65UK1Wc0GF8FB0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734463678; c=relaxed/simple;
	bh=GcHsa9SwtAURqsudps8fdJc5GEP0IcsGTswOKdl9sMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xr0EMjphm1cTBwAOiZimU51cgqVSE9SHIDV8II9Cka3k8gNHT8C+xgu++4iRAiog5qD7aOs0+ZcT/bZnZeCBGhj5Qp9aiADV/oINh48rAbIGIL2LcePzsUGKn31fzSiDOHm5FHty+hIi1z7A67rdDCOrylC0KgI0/hCZCoF5QmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gh6eMMS0; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gh6eMMS0"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467abce2ef9so42121cf.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734463675; x=1735068475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMfmuLpatjPgkeRV/3Vx6kZdgTCq1HzVzde45FIVRGA=;
        b=gh6eMMS0iRIyBHJJ47Vl0Sxfz4Kcce91Xa1nndpnoPjUTM1pU1ABJeCvX0ET9OW5Z9
         0jzGROarLQDJP46bihloOvWgvvyAq0YW8As1VAkzgW7XFm/41RYzS/BTUzHVIYisuymm
         VlOMqkvoJIBmSmk/++MtAOMiyYHnwPMbNoeYPBItq865xeaEvoFvHMpYceIbkxc2yJA2
         5gpjWPaBPnBkigLRqIapgzp++zC3GGZLK2ZrQfAa5YiDK+U1K9ASUEnS1IH7rbPXZyBB
         6NkEvnfLapHN4+YUMUI9YjDx3uFQk1ZVne5sa0faOk8a8sGVmZmymBcY4DMapbqbBV65
         1iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734463675; x=1735068475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMfmuLpatjPgkeRV/3Vx6kZdgTCq1HzVzde45FIVRGA=;
        b=wPLTJ7twpawn+U7juVRgfes5dGOicBXoALuizcj/UBjZesl6YxBmFoYRy5fwivTKJ7
         ijIHKe2VybfFF2EIwdYkhf9Ws3DB6I8QkxMPMmvACTot85vHBTXlF6KrJHYfzU6KmiRe
         bslATBcPsnazhMFDZxeesSTCqI0VB3669Cag7VHztp11H/YLHXuP31VFPiCDM0/ueusN
         TlFbCLi75DvvS67I5kwh0jGeKo6WPsyMomxUBSadBIemTdLVqK4+W19yp7o3YxbVLOGs
         6HD9gDDO81XxJBHwF69KE2YxOfBh5C8KnTcZ8UlQLlo/tFUis+l3NCCUsK0QKQrF/Dzy
         t9pg==
X-Forwarded-Encrypted: i=1; AJvYcCWvzKqr681jBjL2o4W8xnxICAocOc51LF/BY2zXPCY8mFkhQnbhpuTeNqyrl2Mdl/F2pSy4RGTWseA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfN62vtlYPomsJr2pSLfiZA5JqA+Qyc6x7uPW0R2LZLpoax65Z
	nyLb5FkfnVPOf4x5NEm0r3ZGXB8E+llg5545dQTmm7bBKNcfj+G6hgG8fELWtsJ4EJhrVgabvPl
	mwZcR83C1c/UV9AoqRL4G70G29VW9A2LjU5rw
X-Gm-Gg: ASbGncubpI7Gq80siKI2ChkwPWE2O2rXaTol469+KRQSNI/e1pr8Q2SKH7GKiXmm3Ta
	R+7NrYOvM/Uw2SsABhAsKBiGv/GdkqRwNgmxJf0RAUJw5vbd1cPcstshEKYyvXk2PKlA8
X-Google-Smtp-Source: AGHT+IF8bC7h94TmuZb823CnkSdBd580iuNZYNRH/Tz9n74u0sXk8cAyPQbFO6c80ZFajgdCusnxzR8p+3c2zO/VZpc=
X-Received: by 2002:ac8:5a45:0:b0:461:67d8:1f50 with SMTP id
 d75a77b69052e-46908e9cf46mr3041cf.4.1734463675125; Tue, 17 Dec 2024 11:27:55
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211212033.1684197-1-almasrymina@google.com>
 <20241211212033.1684197-6-almasrymina@google.com> <b706bede-3ca0-4011-8b42-a47e3d3fa418@amd.com>
In-Reply-To: <b706bede-3ca0-4011-8b42-a47e3d3fa418@amd.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 17 Dec 2024 11:27:42 -0800
Message-ID: <CAHS8izMw4m7Bv5zD2eT2MwFzk0QGFx1gkPu6wig7Uk__tpjW9g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/5] net: Document netmem driver support
To: "Nelson, Shannon" <shannon.nelson@amd.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 2:58=E2=80=AFPM Nelson, Shannon <shannon.nelson@amd=
.com> wrote:
> > +
> > +Driver support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. The driver must support page_pool. The driver must not do its own r=
ecycling
> > +   on top of page_pool.
> > +
> > +2. The driver must support the tcp-data-split ethtool option.
> > +
> > +3. The driver must use the page_pool netmem APIs. The netmem APIs are
> > +   currently 1-to-1 correspond with page APIs. Conversion to netmem sh=
ould be
> > +   achievable by switching the page APIs to netmem APIs and tracking m=
emory via
> > +   netmem_refs in the driver rather than struct page * :
> > +
> > +   - page_pool_alloc -> page_pool_alloc_netmem
> > +   - page_pool_get_dma_addr -> page_pool_get_dma_addr_netmem
> > +   - page_pool_put_page -> page_pool_put_netmem
> > +
> > +   Not all page APIs have netmem equivalents at the moment. If your dr=
iver
> > +   relies on a missing netmem API, feel free to add and propose to net=
dev@ or
> > +   reach out to almasrymina@google.com for help adding the netmem API.
>
> You may want to replace your name with "the maintainers" and let the
> MAINTAINERS file keep track of who currently takes care of netmem
> things, rather than risk this email getting stale and forgotten.
>

If it's OK with you, I'll change this to "the maintainers and/or
almasrymina@google.com".

Reasoning is that currently Jakub really has reviewed all the netmem
stuff very closely, and I'm hesitant to practically point to him to
all future netmem questions or issues, especially since I can help
with all the low hanging fruit. I don't currently show up in the
maintainers file, and unless called for there is no entry for netmem
maintenance. Wording the docs like this gives me the chance to help
with some of the low hanging fruit without going so far as to add
myself to maintainers.

If the email does go stale we can always update it and if there
becomes a dedicated entry in MAINTAINERS for netmem we can always
remove this.

Will address all the other points, thanks!

--=20
Thanks,
Mina
